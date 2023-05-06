import sys

from enum import Enum

OPCODE_FORM = Enum("OpcodeForm", "SHORT LONG VARIABLE EXTENDED")
OPERAND_COUNT = Enum("OperandCount", "OP0 OP1 OP2 VAR")
OPERAND_TYPE = Enum("OperandType", "Small Large Variable")


class Routine:
    """
    According to the specification, a routine begins with one byte indicating
    the number of local variables it has (between 0 and 15 inclusive).
    """

    def __init__(self):
        self.local_variables = []
        self.return_address = 0x0000

    def details(self):
        print("** Routine Call **")
        print(f"Local variables: {self.local_variables}")


class Instruction:
    def __init__(self, opcode, operand_types, operands, store_variable):
        self.opcode = opcode
        self.operand_types = operand_types
        self.operands = operands
        self.store_variable = store_variable

    def execute(self, memory):
        print("\nEXECUTING: " + str(self.opcode))

        if self.opcode in ["call", "call_vs"]:
            memory.call(self.operand_types, self.operands, self.store_variable)
        else:
            raise Exception("Not implemented")
        
    def details(self):
        print("\n---------------------------------------")
        print("INSTRUCTION")
        print("---------------------------------------")
        print(f"Opcode Name: {self.opcode}")
        print(f"Operand Types: {self.operand_types}")

        operands_formatted = [f"{op} (0x{op:x})" for op in self.operands]
        print(f"Operands: {operands_formatted}")
        print(f"Store Variable: {self.store_variable}")


class Memory:
    def __init__(self, data):
        self.data = data
        self.pc = 0
        self.version = self.data[0x00]
        self.routine_offset = self.read_word(0x28)
        self.strings_offset = self.read_word(0x2a)
        self.routine_callstack = []

        self.read_starting_address()

        print(f"Zcode version: {self.version}")
        print(f"Starting address: {self.pc} ({hex(self.pc)})")

    def read_instruction(self, offset):
        current_byte = offset

        store_variable = None
        operand_count = None

        opcode_byte = self.data[current_byte]

        print("\n---------------------------------------")
        print(f"Opcode Byte: {str(opcode_byte)} ({hex(opcode_byte)}) ({self.binary(opcode_byte)})")
        print("---------------------------------------")

        # NOTE: This line is crucial. I'm not quite clear why I have to
        # immediately increment the current byte.
        current_byte += 1

        # According to the specification, a single Z-machine instruction
        # consists of an opcode, which is either 1 or 2 bytes.

        opcode = self.determine_opcode(opcode_byte, operand_count)

        # According to the specification, each instruction has a form. The
        # possible forms are: long, short, extended or variable. To check
        # for the extended requires knowing the version of the zcode.

        # If the opcode is 190 (x0BE in hex) and the version of the zcode
        # is 5 or later, the form is extended.

        # If the top two bits of the opcode are b11 the form is variable.
        # If the top two bits of the opcode are b19 the form is short.

        if self.version >= 5 and opcode_byte == 0xbe:
            form = OPCODE_FORM.EXTENDED
        elif opcode_byte & 0b11000000 == 0b11000000:
            form = OPCODE_FORM.VARIABLE
        elif opcode_byte & 0b10000000 == 0b10000000:
            form = OPCODE_FORM.SHORT
        else:
            form = OPCODE_FORM.LONG

        print(f"Opcode Form: {form.name}")

        # According to the specification, each instruction has an operand
        # count. The possible counts are: 0OP, 1OP, 2OP or VAR.

        operand_count = self.read_operand_count(form, opcode_byte)

        print(f"Operand Count: {operand_count.name}")

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
                current_byte +- 1

        # According to the specification, store instructions will return some
        # value so these instructions must be followed by a single byte that
        # gives the variable number of where to put the returned result.

        if self.is_store_instruction(opcode):
            store_variable = self.read_byte(current_byte)
            current_byte += 1

        return Instruction(opcode, operand_types, operands, store_variable)
    
    def determine_opcode(self, byte, operand_count):
        if operand_count == OPERAND_COUNT.VAR and byte == 224:
            if self.version > 3:
                return "call_vs"
            else:
                return "call"
       
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
                operand_types.append(self.read_operand_type_from_byte((byte & 0b00110000) >> 4))
            
            if byte & 0b00001100 == 0b00001100:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte((byte & 0b00001100) >> 2))

            if byte & 0b00000011 == 0b00000011:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte(byte & 0b00000011))
            
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
    
    def binary(self, value):
        binary_str = bin(value)[2:]

        return binary_str.zfill(8)
    
    def call(self, operand_types, operands, store_variable):
        """
        According to the specification, this opcode calls a given routine with
        0, 1, 2 or 3 arguments as supplied and stores any return value from
        the call. A routine is required to begin at an address in memory which
        can be represented by a packed address.
        """

        routine = Routine()
        routine.return_address = self.pc + 2

        # The first operand is the address to call.

        routine_address = self.read_packed(operands[0], True)
        print(f"Routine address: {hex(routine_address)}")

        # Determine the number of local variables in the routine.

        variable_count = self.read_byte(routine_address)
        print(f"Local variable count: {str(variable_count)}")

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

        print(f"Operand Values: {list(zip(operand_types, operands))}")
        operand_list = list(zip(operand_types, operands))
        operand_list.pop(0)

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

        for index, operand in enumerate(operand_values):
            routine.local_variables[index] = operand

        print(f"Called with values: {routine.local_variables}")

        # It's necesary to set the pc to the instruction after the header.
        # Since versions 5 and up don't include the two byte portion that
        # provides variable values, that has to be accounted for here.

        updated_pc = routine_address + 1

        if self.version < 5:
            updated_pc += 2 * variable_count

        print(f"Next instruction: {hex(updated_pc)}")

        self.pc = updated_pc

        # The newly created routine has to be added to a routine callstack.
        # This is so that the interpreter can trace execution by keeping
        # track of calls.

        self.routine_callstack.append(routine)
        print(f"Routine callstack: {self.routine_callstack}")

        routine.details()

    def read_variable(self, number):
        """
        According to the specification, local variables are numbered from 1 to
        15 (hexadecimal values 0x01 to 0x0f) and global variables are numbered
        from 16 to 255 (hexadecimal values 0x10 to 0xff).
        """

        if number == 0x00:
            print("Pop the stack")

        if number > 0x00 and number < 0x10:
            return self.read_local_variable(number - 0x01)
        else:
            print("Global variable")

    def read_local_variable(self, number):
        top_routine = self.routine_callstack[-1]

        return top_routine.local_variables[number]
    
    def is_store_instruction(self, opcode):
        """
        
        """

        if opcode == "call":
            return True
        
        return False


class Loader:
    def load(filename):
        f = open(filename, "rb")
        memory = f.read()

        return Memory(memory)


def main():
    zcode = Loader.load(sys.argv[1])

    assert isinstance(zcode.data, bytes), "zcode must be of type bytes"

    while True:
        instruction = zcode.read_instruction(zcode.pc)
        instruction.details()
        instruction.execute(zcode)


if __name__ == "__main__":
    main()
