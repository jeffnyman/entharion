#! /usr/bin/python3

import os
import sys

from enum import Enum

OPCODE_FORM = Enum("OpcodeForm", "SHORT LONG VARIABLE EXTENDED")
OPERAND_COUNT = Enum("OperandCount", "OP0 OP1 OP2 VAR")
OPERAND_TYPE = Enum("OperandType", "Small Large Variable")


if os.path.exists("log.txt"):
    with open("log.txt", "w"):
        pass


def log(message):
    with open("log.txt", "a") as logfile:
        print(message, file=logfile)


def get_signed_equivalent(num):
    """
    This function takes an unsigned 16-bit number as an input and returns
    the equivalent signed 16-bit number. 0x7FFF refers to the largest
    positive 16-bit signed integer while 0x10000 is the smallest number
    that is greater than the largest 16-bit unsigned number.
    """

    return -(0x10000 - num) if num > 0x7FFF else num


class Routine:
    """
    According to the specification, a routine begins with one byte indicating
    the number of local variables it has (between 0 and 15 inclusive).
    """

    def __init__(self):
        self.local_variables = []
        self.return_address = 0x0000

    def details(self):
        log("** Routine Call **")

        variable_hex_strings = [hex(num)[2:] for num in self.local_variables]
        log(f"Local variables: {variable_hex_strings}")


class Instruction:
    def __init__(
        self,
        opcode,
        operand_types,
        operands,
        store_variable,
        branch_on_true,
        branch_offset,
        instruction_length,
    ):
        self.opcode = opcode
        self.operand_types = operand_types
        self.operands = operands
        self.store_variable = store_variable
        self.branch_on_true = branch_on_true
        self.branch_offset = branch_offset
        self.length = instruction_length

    def execute(self, memory):
        log("\nEXECUTING: " + str(self.opcode))

        if self.opcode in ["call", "call_vs"]:
            memory.call(
                self.operand_types, self.operands, self.store_variable, self.length
            )
        elif self.opcode == "add":
            memory.add(self)
        elif self.opcode == "je":
            memory.je(self)
        elif self.opcode == "sub":
            memory.sub(self)
        elif self.opcode == "jz":
            memory.jz(self)
        elif self.opcode == "storew":
            memory.storew(self)
        elif self.opcode == "ret":
            memory.ret(self)
        elif self.opcode == "put_prop":
            memory.put_prop(self)
        else:
            raise Exception("Not implemented")

    def details(self):
        log(f"Opcode Name: {self.opcode}")
        log(f"Operand Types: {self.operand_types}")

        operands_in_hex = [hex(num)[2:] for num in self.operands]
        log(f"Operands: {operands_in_hex}")

        log(f"Store Variable: {self.store_variable}")
        log(f"Branch Offset: {self.branch_offset}")


class Memory:
    def __init__(self, data):
        self.data = bytearray(data)
        self.pc = 0
        self.version = self.data[0x00]
        self.global_table_start = self.read_word(0x0C)
        self.routine_offset = self.read_word(0x28)
        self.strings_offset = self.read_word(0x2A)
        self.object_table_start = self.read_word(0x0A)
        self.routine_callstack = []
        self.stack = []

        self.read_starting_address()

        log(f"Zcode version: {self.version}")
        log(f"Starting address: {hex(self.pc)}")

    def read_instruction(self, offset):
        current_byte = offset

        store_variable = None
        operand_count = None

        opcode_byte = self.data[current_byte]

        current_byte += 1

        # According to the specification, each instruction has a form. The
        # possible forms are: long, short, extended or variable. To check
        # for the extended requires knowing the version of the zcode.

        # If the opcode is 190 (x0BE in hex) and the version of the zcode
        # is 5 or later, the form is extended.

        # If the top two bits of the opcode are b11 the form is variable.
        # If the top two bits of the opcode are b10 the form is short.

        if self.version >= 5 and opcode_byte == 0xBE:
            form = OPCODE_FORM.EXTENDED
        elif opcode_byte & 0b11000000 == 0b11000000:
            form = OPCODE_FORM.VARIABLE
        elif opcode_byte & 0b10000000 == 0b10000000:
            form = OPCODE_FORM.SHORT
        else:
            form = OPCODE_FORM.LONG

        # According to the specification, each instruction has an operand
        # count. The possible counts are: 0OP, 1OP, 2OP or VAR.

        operand_count = self.read_operand_count(form, opcode_byte)

        # According to the specification, a single Z-machine instruction
        # consists of an opcode, which is either 1 or 2 bytes.

        opcode = self.determine_opcode(opcode_byte, operand_count)

        # According to the specification, each operand has a type.

        operand_types = []

        if form == OPCODE_FORM.VARIABLE:
            operand_types = self.read_operand_type(form, self.data[current_byte])
            current_byte += 1
        else:
            operand_types = self.read_operand_type(form, opcode_byte)

        # For each of the operand types that were found, the operand for
        # each type must be determined.

        operands = []

        for operand_type in operand_types:
            if operand_type == OPERAND_TYPE.Large:
                operands.append(self.read_word(current_byte))
                current_byte += 2

            if operand_type == OPERAND_TYPE.Small:
                operands.append(self.read_byte(current_byte))
                current_byte += 1

            if operand_type == OPERAND_TYPE.Variable:
                operands.append(self.read_byte(current_byte))
                current_byte += 1

        # According to the specification, store instructions will return some
        # value so these instructions must be followed by a single byte that
        # gives the variable number of where to put the returned result.

        if self.is_store_instruction(opcode):
            store_variable = self.read_byte(current_byte)
            current_byte += 1

        # According to the specification, any instructions that test for a
        # condition are "branch" instructions. The branch information is
        # stored in one or two bytes, indicating what to do with the result
        # of the test. If bit 7 of the first byte is 0, a branch occurs when
        # the condition was false. If bit 7 is 1, then a branch takes place
        # when the condition was true. If bit 6 is set, then the branch
        # occupies one byte only. If bit 6 is clear, then the branch will
        # occupy two bytes.

        branch_on_true = None
        branch_offset = None

        if self.is_branch_instruction(opcode):
            branch_byte = self.read_byte(current_byte)
            branch_on_true = (branch_byte & 0b10000000) == 0b10000000
            current_byte += 1

            if branch_byte & 0b01000000 == 0b01000000:
                branch_offset = branch_byte & 0b00111111
            else:
                next_branch_byte = self.read_byte(current_byte)
                branch_offset = ((branch_byte & 0b00011111) << 5) + next_branch_byte
                current_byte += 1

        instruction_length = current_byte - offset

        instruction_bytes = self.data[offset : offset + instruction_length]
        instruction_bytes_hex = " ".join([f"{byte:02X}" for byte in instruction_bytes])

        log("\n-------------------------------")
        log(f"Instruction: {hex(self.pc)}: {instruction_bytes_hex}")
        log(f"Instruction Length: {instruction_length}")
        log(f"Opcode Byte: {opcode_byte} ({hex(opcode_byte)}) ({opcode_byte:08b})")
        log(f"Opcode Form: {form.name}")
        log(f"Operand Count: {operand_count.name}")

        return Instruction(
            opcode,
            operand_types,
            operands,
            store_variable,
            branch_on_true,
            branch_offset,
            instruction_length,
        )

    def determine_opcode(self, byte, operand_count):
        log(f"Last five bits: {hex(byte & 0b00011111)}")
        log(f"Last four bits: {hex(byte & 0b00001111)}")

        if operand_count == OPERAND_COUNT.VAR and byte == 227:
            return "put_prop"

        if operand_count == OPERAND_COUNT.VAR and byte == 225:
            return "storew"

        if operand_count == OPERAND_COUNT.VAR and byte == 224:
            if self.version > 3:
                return "call_vs"
            else:
                return "call"

        if operand_count == OPERAND_COUNT.OP2 and byte & 0b00011111 == 21:
            return "sub"

        if operand_count == OPERAND_COUNT.OP2 and byte & 0b00011111 == 20:
            return "add"

        if operand_count == OPERAND_COUNT.OP1 and byte & 0b00001111 == 11:
            return "ret"

        if operand_count == OPERAND_COUNT.OP2 and byte & 0b00011111 == 1:
            return "je"

        if operand_count == OPERAND_COUNT.OP1 and byte & 0b00001111 == 0:
            return "jz"

        # If the logic gets to here, that means an instruction has been
        # encountered during decoding the bytes that hasn't been found
        # up to now. What the following output should do is provide a
        # way to better understand what the likely instruction being
        # encountered is.
        opcode_value = self.determine_opcode_value(byte)

        print(f"\nNeed to support: {operand_count.name}:{byte} {opcode_value}\n")

    def determine_opcode_value(self, byte):
        """
        This function is meant to help determine what opcode is being
        dealt with when no current logic handles the opcode byte that
        has been read in. This logic is predicated on the idea that the
        opcode number can be computed by subtracting the first number in
        the operation byte range from the operation byte.
        """

        opcode_ranges = [
            (0x00, 0x1F),
            (0x20, 0x3F),
            (0x40, 0x5F),
            (0x60, 0x7F),
            (0x80, 0x8F),
            (0x90, 0x9F),
            (0xA0, 0xAF),
            (0xB0, 0xBF),
            (0xC0, 0xDF),
            (0xE0, 0xFF),
            (0x00, 0xFF),
        ]

        byte_hex = hex(byte)[2:].upper()

        for range_start, range_end in opcode_ranges:
            if int(byte_hex, 16) >= range_start and int(byte_hex, 16) <= range_end:
                return int(byte_hex, 16) - range_start

    def read_operand_type(self, form, byte):
        """
        According to the specification, in a short form opcode, bits 4 and 5
        of the opcode give the operand type. A value of 01 means a small while
        a value of 10 means a variable. In a long form opcode, bit 6 of the
        opcode gives the type of the first operand, bit 5 of the second. A
        value of 0 means a small and 1 means a variable.

        In variable or extended forms, a byte of 4 operand types is provided.
        This byte contains four 2-bit fields: bits 6 and 7 are the first field,
        bits 0 and 1 the fourth. A value of 00 means large, 01 means small,
        10 means variable, and 11 means ommitted (as in not present).
        """

        if form == OPCODE_FORM.SHORT:
            if byte & 0b00100000 == 0b00100000:
                return [OPERAND_TYPE.Variable]
            elif byte & 0b00010000 == 0b00010000:
                return [OPERAND_TYPE.Small]
            elif byte & 0b00000000 == 0b00000000:
                return [OPERAND_TYPE.Large]
        elif form == OPCODE_FORM.LONG:
            operand_types = []

            if byte & 0b01000000 == 0b01000000:
                operand_types.append(OPERAND_TYPE.Variable)
            else:
                operand_types.append(OPERAND_TYPE.Small)
            if byte & 0b00100000 == 0b00100000:
                operand_types.append(OPERAND_TYPE.Variable)
            else:
                operand_types.append(OPERAND_TYPE.Small)

            return operand_types
        else:
            operand_types = []

            if byte & 0b11000000 == 0b11000000:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte(byte >> 6))

            if byte & 0b00110000 == 0b00110000:
                return operand_types
            else:
                operand_types.append(
                    self.read_operand_type_from_byte((byte & 0b00110000) >> 4)
                )

            if byte & 0b00001100 == 0b00001100:
                return operand_types
            else:
                operand_types.append(
                    self.read_operand_type_from_byte((byte & 0b00001100) >> 2)
                )

            if byte & 0b00000011 == 0b00000011:
                return operand_types
            else:
                operand_types.append(
                    self.read_operand_type_from_byte(byte & 0b00000011)
                )

            return operand_types

    def read_operand_type_from_byte(self, value):
        if value == 0:
            return OPERAND_TYPE.Large
        elif value == 1:
            return OPERAND_TYPE.Small
        else:
            return OPERAND_TYPE.Variable

    def read_operand_count(self, form, byte):
        """
        According to the specification, in long form the operand count is
        always 2OP. In short form, bits 4 and 5 of the opcode byte give an
        operand type. If this operand type is b11 then the operand count is
        0OP, otherwise it will be 1OP. In variable form, if bit 5 is 0 then
        the operand count is 2OP; if it is 1, then the count is VAR.
        """

        operand_count = None

        if form == OPCODE_FORM.LONG:
            operand_count = OPERAND_COUNT.OP2
        elif form == OPCODE_FORM.SHORT:
            if byte & 0b00110000 == 0b00110000:
                operand_count = OPERAND_COUNT.OP0
            else:
                operand_count = OPERAND_COUNT.OP1
        elif form == OPCODE_FORM.EXTENDED:
            operand_count = OPERAND_COUNT.VAR
        else:
            if byte & 0b00100000 == 0b00100000:
                operand_count = OPERAND_COUNT.VAR
            else:
                operand_count = OPERAND_COUNT.OP2

        return operand_count

    def read_starting_address(self):
        """
        According to the specification, for versions 1 to 5 of zcode, the
        word at 0x06 contains the byte address of the first instruction
        to execute. In version 6 of zcode, there is a main() routine and
        the packed address of that routine is stored in the word at 0x06.
        """

        if self.version != 6:
            self.pc = self.read_word(0x06)
        else:
            self.pc = self.read_packed(self.read_word(0x06), True)

    def read_byte(self, offset):
        return self.data[offset]

    def read_word(self, offset):
        return (self.data[offset] << 8) + self.data[offset + 1]

    def read_packed(self, offset, is_routine):
        if self.version < 4:
            return 2 * offset

        if self.version < 6:
            return 4 * offset

        if self.version < 8 and is_routine:
            return 4 * offset + (8 * self.routine_offset)

        if self.version < 8:
            return 4 * offset + (8 * self.strings_offset)

        return 8 * offset

    def call(self, operand_types, operands, store_variable, instr_length):
        """
        According to the specification, this opcode calls a given routine with
        0, 1, 2 or 3 arguments as supplied and stores any return value from
        the call. A routine is required to begin at an address in memory which
        can be represented by a packed address.
        """

        routine = Routine()
        routine.return_address = self.pc + instr_length
        routine.store_variable = store_variable

        # The first operand is the address to call.

        routine_address = self.read_packed(operands[0], True)
        log(f"Routine address: {hex(routine_address)}")

        # Determine the number of local variables in the routine.

        variable_count = self.read_byte(routine_address)
        log(f"Local variable count: {str(variable_count)}")

        # According to the specification, in zcode versions 1 to 4, a number
        # of two-byte words are provided that give initial values for the
        # local variables. In zcode versions 5 and later, the initial values
        # are all set to zero.

        for variable in range(variable_count):
            if self.version < 5:
                variable_value = self.read_word(routine_address + 1 + (2 * variable))
                routine.local_variables.append(variable_value)
            else:
                routine.local_variables.append(0)

        # The local variable values have to be set based on the values of
        # the operands.

        log(f"Operand Values: {list(zip(operand_types, operands))}")
        operand_list = list(zip(operand_types, operands))

        operand_values = []

        # The operands can be word constants (00), byte constants (01), or
        # a variable number (10), which would be a byte. It's necessary to
        # set the value of the local variable appropriately based on the
        # operand type.

        for operand_pair in operand_list:
            if operand_pair[0] == OPERAND_TYPE.Variable:
                operand_values.append(self.read_variable(operand_pair[1]))
            else:
                operand_values.append(operand_pair[1])

        operand_values.pop(0)

        for index, operand in enumerate(operand_values):
            routine.local_variables[index] = operand

        variable_hex_strings = [hex(num)[2:] for num in routine.local_variables]
        log(f"Called with values: {variable_hex_strings}")

        # It's necesary to set the pc to the instruction after the header.
        # Since versions 5 and up don't include the two byte portion that
        # provides variable values, that has to be accounted for here.

        updated_pc = routine_address + 1

        if self.version < 5:
            updated_pc += 2 * variable_count

        log(f"Next instruction: {hex(updated_pc)}")

        self.pc = updated_pc

        # The newly created routine has to be added to a routine callstack.
        # This is so that the interpreter can trace execution by keeping
        # track of calls.

        self.routine_callstack.append(routine)
        log(f"Routine callstack: {self.routine_callstack}")

        routine.details()

    def add(self, instruction):
        """
        According ot the specification, this instruction simply does a signed
        16-bit addition.
        """

        operand_values = self.determine_operand_value(instruction)
        operand_values = [get_signed_equivalent(x) for x in operand_values]

        log(f"Operand Values: {operand_values}")

        result = operand_values[0] + operand_values[1]
        log(f"Add Result: {result}")

        self.set_variable(instruction.store_variable, result)

        self.pc += instruction.length

    def sub(self, instruction):
        """
        According ot the specification, this instruction simply does a signed
        16-bit subtraction.
        """

        operand_values = self.determine_operand_value(instruction)
        operand_values = [get_signed_equivalent(x) for x in operand_values]

        log(f"Operand Values: {operand_values}")

        result = operand_values[0] - operand_values[1]
        log(f"Add Result: {result}")

        self.set_variable(instruction.store_variable, result)

        self.pc += instruction.length

    def je(self, instruction):
        """
        According to the specifiction, this instruction causes a jump if the
        first operand, a, is equal to any of the subsequent operands. An
        example is that `je a b` will ump if it's true that a = b.
        """

        operand_values = self.determine_operand_value(instruction)

        self.pc += instruction.length

        if operand_values[0] == operand_values[1] and instruction.branch_on_true:
            self.pc += instruction.branch_offset - 2
            log(f"je:branch_on_true:jumped to {hex(self.pc)}")
        elif operand_values[0] == operand_values[1] and not instruction.branch_on_true:
            self.pc += instruction.branch_offset - 2
            log(f"je:branch_on_false:jumped to {hex(self.pc)}")

    def jz(self, instruction):
        """
        According to the specification, this is a simple jump that only
        jusmps if the first operand, a, is equal to 0.
        """

        operand_values = self.determine_operand_value(instruction)

        self.pc += instruction.length

        if operand_values[0] == 0 and instruction.branch_on_true:
            self.pc += instruction.branch_offset - 2
            log(f"jz:branch_on_true:jumped to {hex(self.pc)}")
        elif operand_values[0] != 0 and not instruction.branch_on_true:
            self.pc += instruction.branch_offset - 2
            log(f"jz:branch_on_false:jumped to {hex(self.pc)}")

    def storew(self, instruction):
        """
        According to the specification, this instruciton stores a given value
        in the word at address `array + 2 * word-index`. The specification
        notes that this address must lie in dynamic memory.
        """

        operand_values = self.determine_operand_value(instruction)

        base_address = operand_values[0]
        index = operand_values[1]
        value = operand_values[2]

        log(f"Base Address: {hex(base_address)}")
        log(f"Index: {hex(index)}")
        log(f"Value to Store: {hex(value)}")

        # Extract the top byte and bottom byte from the 2-byte value.
        top_byte = (value & 0xFF00) >> 8
        bottom_byte = value & 0x00FF

        self.data[base_address + (2 * index)] = top_byte
        self.data[base_address + (2 * index) + 1] = bottom_byte

        self.pc += instruction.length

    def ret(self, instruction):
        """
        According to the specification, this instruction returns from the
        current routine with a specific value.
        """

        operand_values = self.determine_operand_value(instruction)

        # It's necessary to pop the current routine so that setting the
        # variable will target the right set of locals.

        current_routine = self.routine_callstack.pop()

        self.set_variable(current_routine.store_variable, operand_values[0])

        self.pc = current_routine.return_address

    def put_prop(self, instruction):
        """
        According to the specification, this instruction will write a given
        value to a given object.
        """

        operand_values = self.determine_operand_value(instruction)

        log(f"Object Number: {operand_values[0]}")
        log(f"Property Number: {operand_values[1]}")
        log(f"Property Value: {operand_values[2]}")

        self.set_property(operand_values[0], operand_values[1], operand_values[2])

        self.pc += instruction.length

    def determine_operand_value(self, instruction):
        operand_list = zip(instruction.operand_types, instruction.operands)

        operand_values = []

        for operand_pair in operand_list:
            if operand_pair[0] == OPERAND_TYPE.Variable:
                operand_values.append(self.read_variable(operand_pair[1]))
            else:
                operand_values.append(operand_pair[1])

        log(f"Operand Values: {operand_values}")

        return operand_values

    def read_variable(self, number):
        """
        According to the specification, local variables are numbered from 1 to
        15 (hexadecimal values 0x01 to 0x0f) and global variables are numbered
        from 16 to 255 (hexadecimal values 0x10 to 0xff).
        """

        if number == 0x00:
            return self.pop_stack()
        if number > 0x00 and number < 0x10:
            return self.read_local_variable(number - 0x01)
        else:
            return self.read_global_variable_value(number - 0x10)

    def read_local_variable(self, number):
        top_routine = self.routine_callstack[-1]

        return top_routine.local_variables[number]

    def read_global_variable_value(self, number):
        return self.data[self.read_global_variable_addr(number)]

    def read_global_variable_addr(self, number):
        return self.global_table_start + (number * 2)

    def set_variable(self, number, value):
        if number == 0x00:
            return self.push_stack(value)
        if number > 0x00 and number < 0x10:
            return self.set_local_variable(number - 0x01, value)
        else:
            self.set_global_variable(number - 0x10, value)

    def set_local_variable(self, number, value):
        top_routine = self.routine_callstack[-1]
        top_routine.local_variables[number] = value

    def set_global_variable(self, number, value):
        # It's necessary to split the value into two parts: the top four
        # bytes and the bottom four bytes. This logic extracts the top
        # byte by masking the upper 16 bits of the value (since 0xff00 in
        # binary is 16 bits) and then shifting the result 8 bits to the
        # right to obtain the top byte. It also extracts the bottom byte
        # by masking the lower 8 bits of the value.

        top_byte = (value & 0xFF00) >> 8
        bottom_byte = value & 0x00FF

        top_address = self.global_table_start + (number * 2)

        self.data[top_address] = top_byte
        self.data[top_address + 1] = bottom_byte

        log(f"Top Byte: {top_byte}")
        log(f"Bottom Byte: {bottom_byte}")

    def get_object_size(self):
        # According to the specification, in versions 1 to 3, there are at
        # most 255 objects, each having a 9-byte entry. In versions 4 and
        # later, there are at moest 65534 objects, each having a 14-byte
        # entry.

        if self.version > 3:
            return 14

        return 9

    def get_object_address(self, object_number):
        # According to the specification, in versions 1 to 3, the property
        # defaults table contains 31 words. In versions 4 and up, the
        # property defaults table contains 63 words. The property defaults
        # table is the first part of the object table so it's necessary to
        # account for that.

        property_defaults_number = 31

        if self.version > 3:
            property_defaults_number = 63

        object_tree_starting_address = self.object_table_start + (
            property_defaults_number * 2
        )

        object_address = object_tree_starting_address + (
            object_number * self.get_object_size()
        )

        return object_address

    def get_property_table_address(self, object_number):
        # According to the specification, a property list has an initial
        # part, which is the property header address. This will have an
        # object property offset. The object property offset is 7 (for
        # versions 1 to 3) and 9 in versions 4 and up.

        object_address = self.get_object_address(object_number)
        log(f"Object Address: {object_address}")

        property_table_offset = 7

        if self.version > 3:
            property_table_offset = 9

        property_table_address = self.read_word(object_address + property_table_offset)

        return property_table_address

    def get_property_list_address(self, object_number):
        property_table_address = self.get_property_table_address(object_number)
        short_name_length = self.read_byte(property_table_address)
        property_list_start = property_table_address + (short_name_length * 2) + 1
        log(f"Property list address for object: {object_number}")

        return property_list_start

    def get_property_address(self, object_number, property_number):
        # NOTE: This will need to be broken out for versions 1 to 3
        # and then versions 4 and up.

        property_list_address = self.get_property_list_address(object_number)

        # According to the specification, in versions 1 to 3, a property entry
        # contains one size byte. In versions 4 and up, a property entry
        # contains one or two size bytes. So this logic might have to be
        # conditionalized by the version.

        size_byte_address = property_list_address
        size_byte = self.read_byte(size_byte_address)

        log(f"Prop address: size_byte: {size_byte}")

        # According to the specification, in versions 1 to 3, the size byte
        # holds the number of data bytes in the top 3 bits and the property
        # number in the bottom 5 bits. The same applies to versions 4 and
        # up but there are two bytes in this case. However, it's the first
        # byte that acts as the size byte in all versions.

        while size_byte != 0:
            current_property_number = 0b00011111 & size_byte

            if property_number == current_property_number - 1:
                log(f"Prop address: found prop at: {size_byte_address}")
                return size_byte_address

            # It the property hasn't been found, the logic has to get the
            # next property. Note that shifting the result to the right by
            # 5 is effectively dividing by 32.

            property_bytes = ((size_byte - (current_property_number - 1)) >> 5) + 1
            size_byte_address += property_bytes
            size_byte = self.read_byte(size_byte_address)

        return 0

    def set_property(self, object_number, property_number, property_value):
        property_address = self.get_property_address(object_number, property_number)

    def is_store_instruction(self, opcode):
        if opcode in ["add", "call", "sub"]:
            return True

        return False

    def is_branch_instruction(self, opcode):
        if opcode in ["je", "jz"]:
            return True

        return False

    def push_stack(self, value):
        self.stack.append(value)

    def pop_stack(self):
        return self.stack.pop()

    def details(self):
        log("-------------------")
        log("STACK")
        log(self.stack)

        if len(self.routine_callstack) > 0:
            log("CURRENT ROUTINE STATE:")
            log(self.routine_callstack[-1].details())

        log("-------------------")


class Loader:
    def load(filename):
        f = open(filename, "rb")
        memory = f.read()

        return Memory(memory)


def main():
    zcode = Loader.load(sys.argv[1])

    assert isinstance(zcode.data, bytearray), "zcode must be of type bytearray"

    while True:
        zcode.details()
        instruction = zcode.read_instruction(zcode.pc)
        instruction.details()
        instruction.execute(zcode)


if __name__ == "__main__":
    main()
