from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory
    from entharion.opcodes import Opcodes

from enum import Enum

from entharion.logging import log
from entharion.opcode import Opcode
from entharion.opcodes import opcodes

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")
Operand_Count = Enum("Operand Count", "OP0 OP1 OP2 VAR")
Operand_Type = Enum("Operand Type", "Small Large Variable")


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address
        self.current_byte: int
        self.opcode_byte: int
        self.form: Form
        self.operand_count: Operand_Count
        self.opcode_number: int
        self.opcode_name: str
        self.operand_types: list = []
        self.operand_values: list = []
        self.store_variable: int = None
        self.length: int

    def execute(self) -> None:
        opcode_match = self._find_matching_opcode()

        if opcode_match is not None:
            print(f"The opcode {opcode_match.name} needs to be executed.")
            method_name = opcode_match.name
            method_to_call = getattr(Opcode, method_name, None)
            if callable(method_to_call):
                print(f"Method found for opcode {method_name}.")
                method_to_call(self)
            else:
                raise RuntimeError(f"No method found for opcode {method_name}.")
        else:
            raise RuntimeError("No opcode was found to execute.")

    def decode(self) -> None:
        log("\n----------------------------------------------")
        log(f"Reading instruction at {hex(self.address)}")
        log("----------------------------------------------\n")

        self.current_byte: int = self.address

        self.opcode_byte = self.memory.read_byte(self.address)

        self._determine_form()
        self._determine_operand_count()
        self._determine_opcode_number()

        self.current_byte += 1

        if self.memory.version >= 5 and self.opcode_byte == 0xBE:
            self.opcode_number = self.memory.read_byte(self.current_byte)
            self.current_byte += 1

        self._determine_opcode_name()

        if self.operand_count != Operand_Count.OP0:
            if self.form in (Form.VARIABLE, Form.EXTENDED):
                self._determine_operand_types()
                self.current_byte += 1

                if self.opcode_name in ("call_vs2", "call_vn2"):
                    self._determine_operand_types()
                    self.current_byte += 1
            else:
                self._determine_operand_types()

            self._read_operand_values()

        if self._is_store_instruction():
            # A store variable refers to a variable that is designated
            # to receive the result of an operation.
            self.store_variable = self.memory.read_byte(self.current_byte)
            self.current_byte += 1

        self.length = self.current_byte - self.address

    def details(self) -> None:
        log(
            f"{self.operand_count.name:<3} | "
            f"{self.opcode_number:>2} | "
            f"{self.opcode_byte:<3} | "
            f"{hex(self.opcode_byte)[2:]:2} | "
            f"{bin(self.opcode_byte)[2:]}"
        )

        instruction_bytes = self.memory.data[self.address : self.address + self.length]
        instruction_bytes_hex = " ".join([f"{byte:02X}" for byte in instruction_bytes])

        log(f"Instruction: {self.opcode_name}")
        log(f"Instruction form: {self.form.name}")
        log(f"Instruction bytes: {instruction_bytes_hex}")

        self.memory.trace.add(
            f"{hex(self.memory.pc)[2:]}: {instruction_bytes_hex} {self.opcode_name}"
        )

        operand_types = [operand_type.name for operand_type in self.operand_types]
        operand_values = [hex(num)[2:].rjust(4, "0") for num in self.operand_values]

        log(f"Operand types: {operand_types}")
        log(f"Operand values: {operand_values}")

        if self.store_variable:
            log("The opcode stores a value.")
            log(f"Store variable: {self.store_variable}")
        else:
            log("The opcode does not store a value.")

        log(f"Instruction Length: {self.length}")

    # NOTE: This method name is potentially confusing given there is a
    # private method named _read_operand_values(). The difference is that
    # this method reads routine operand values. Should this method be
    # called that?
    def read_operands(self) -> list:
        operand_list = list(zip(self.operand_types, self.operand_values))

        operands_formatted = [
            f"({o_type.name}, {hex(operand)[2:]})" for o_type, operand in operand_list
        ]

        log(f"Operand Values: {', '.join(operands_formatted)}")

        operand_values = []

        for operand_pair in operand_list:
            if operand_pair[0] == Operand_Type.Variable:
                operand_values.append(self.get_variable(operand_pair[1]))
            else:
                operand_values.append(operand_pair[1])

        return operand_values

    def get_variable(self, number: int) -> int:
        # A variable number is a byte that indicates a certain variable. The
        # meaning of a variable depends on the number. A number of 00 means
        # the top of the routine stack. In the case of getting a variable,
        # a value is pulled off the top off the top of the stack. A number
        # from 01 (1) to 0F (15) refers to the local variable of the current
        # routine with that number. A number from 0x10 (16) to FF (255) will
        # refer to a global variable with that number minus 16. The reason
        # for substracting 16 is to accommodate the design of the Z-Machine
        # memory map, where the first sixteen global variables are reserved
        # for special purposes. This is not made very clear in the actual
        # specification at all.

        if number == 0x00:
            raise RuntimeError("IMPLEMENT: get_variable, pop the stack")

        if number > 0x00 and number < 0x10:
            top_routine = self.memory.stack.routine_stack[-1]
            # The adjustment accounts for the fact that local variables are
            # typically accessed using zero-based indexing, where the first
            # local variable corresponds to index 0, the second local
            # variable corresponds to index 1, and so on.
            return top_routine.local_variables[number - 0x01]
        else:
            # Since each global variable occupies two bytes, multiplying the
            # variable_number by 2 calculates the offset in bytes from the
            # start of the global variable table for the desired variable.
            # It's also necessary to account for the offset or displacement
            # in the global variable table.
            variable_address = self.memory.global_table_start + ((number - 0x10) * 2)
            return self.memory.data[variable_address]

    def set_variable(self, number: int, value: int) -> None:
        if number == 0x00:
            raise RuntimeError("IMPLEMENT: set_variable, push to stack")

        if number > 0x00 and number < 0x10:
            top_routine = self.memory.stack.routine_stack[-1]
            top_routine.local_variables[number - 0x01] = value
        else:
            raise RuntimeError("IMPLEMENT: set a global variable")

    def _determine_form(self) -> None:
        if self.memory.version >= 5 and self.opcode_byte == 0xBE:
            self.form = Form.EXTENDED
        elif self.opcode_byte & 0b11000000 == 0b11000000:
            self.form = Form.VARIABLE
        elif self.opcode_byte & 0b10000000 == 0b10000000:
            self.form = Form.SHORT
        else:
            self.form = Form.LONG

    def _determine_operand_count(self) -> None:
        if self.form == Form.SHORT:
            if self.opcode_byte & 0b00110000 == 0b00110000:
                self.operand_count = Operand_Count.OP0
            else:
                self.operand_count = Operand_Count.OP1

        if self.form == Form.LONG:
            self.operand_count = Operand_Count.OP2

        if self.form == Form.VARIABLE:
            if self.opcode_byte & 0b00100000 == 0b00100000:
                self.operand_count = Operand_Count.VAR
            else:
                self.operand_count = Operand_Count.OP2

        if self.form == Form.EXTENDED:
            self.operand_count = Operand_Count.VAR

    def _determine_opcode_number(self) -> None:
        if self.form in (Form.LONG, Form.VARIABLE):
            # get bottom five bits
            self.opcode_number = self.opcode_byte & 0b00011111

        if self.form == Form.SHORT:
            # get bottom four bits
            self.opcode_number = self.opcode_byte & 0b00001111

    def _determine_opcode_name(self) -> None:
        for opcode in opcodes:
            if opcode.matches(
                self.memory.version, self.opcode_byte, self.opcode_number
            ):
                self.opcode_name = opcode.name

    def _determine_operand_types(self) -> None:
        current_byte = self.memory.read_byte(self.current_byte)

        if self.form == Form.SHORT:
            if self.opcode_byte & 0b00100000 == 0b00100000:
                self.operand_types = [Operand_Type.Variable]
            elif self.opcode_byte & 0b00010000 == 0b00010000:
                self.operand_types = [Operand_Type.Small]
            elif self.opcode_byte & 0b00000000 == 0b00000000:
                self.opcode_byte = [Operand_Type.Large]

        if self.form == Form.LONG:
            # Check first operand
            if self.opcode_byte & 0b01000000 == 0b01000000:
                self.operand_types.append(Operand_Type.Variable)
            else:
                self.operand_types.append(Operand_Type.Small)

            # Check second operand
            if self.opcode_byte & 0b00100000 == 0b00100000:
                self.operand_types.append(Operand_Type.Variable)
            else:
                self.operand_types.append(Operand_Type.Small)

        if self.form in (Form.VARIABLE, Form.EXTENDED):
            # First field
            if current_byte & 0b11000000 == 0b11000000:
                return
            else:
                self.operand_types.append(self._type_from_bits(current_byte >> 6))

            # Second field
            if current_byte & 0b00110000 == 0b00110000:
                return
            else:
                self.operand_types.append(
                    self._type_from_bits((current_byte & 0b00110000) >> 4)
                )

            # Third field
            if current_byte & 0b00001100 == 0b00001100:
                return
            else:
                self.operand_types.append(
                    self._type_from_bits((current_byte & 0b00001100) >> 2)
                )

            # Fourth field
            if current_byte & 0b00000011 == 0b00000011:
                return
            else:
                self.operand_types.append(
                    self._type_from_bits(current_byte & 0b00000011)
                )

    def _type_from_bits(self, value: int) -> Operand_Type:
        if value == 0:
            return Operand_Type.Large
        elif value == 1:
            return Operand_Type.Small
        else:
            return Operand_Type.Variable

    def _read_operand_values(self) -> None:
        for operand_type in self.operand_types:
            if operand_type == Operand_Type.Large:
                self.operand_values.append(self.memory.read_word(self.current_byte))
                self.current_byte += 2

            if operand_type == Operand_Type.Small:
                self.operand_values.append(self.memory.read_byte(self.current_byte))
                self.current_byte += 1

            if operand_type == Operand_Type.Variable:
                self.operand_values.append(self.memory.read_byte(self.current_byte))
                self.current_byte += 1

    def _is_store_instruction(self) -> bool:
        opcode_match = self._find_matching_opcode()

        if opcode_match is not None and opcode_match.store:
            return True
        else:
            return False

    def _find_matching_opcode(self) -> "Opcodes":
        zversion = self.memory.version
        byte = self.opcode_byte
        number = self.opcode_number

        for opcode in opcodes:
            if opcode.matches(version=zversion, opcode_byte=byte, opcode_number=number):
                return opcode

        return None
