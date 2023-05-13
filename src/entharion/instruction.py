from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory

from enum import Enum

from entharion.opcode import opcodes

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")
Operand_Count = Enum("Operand Count", "OP0 OP1 OP2 VAR")
Operand_Type = Enum("Operand Type", "Small, Large, Variable")


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address
        self.opcode_byte: int
        self.form: Form
        self.operand_count: Operand_Count
        self.opcode_number: int
        self.opcode_name: str
        self.operand_types: list = []

    def decode(self) -> None:
        current_byte: int = self.address

        self.opcode_byte = self.memory.read_byte(self.address)

        self._determine_form()
        self._determine_operand_count()
        self._determine_opcode_number()

        current_byte += 1

        if self.memory.version >= 5 and self.opcode_byte == 0xBE:
            self.opcode_number = self.memory.read_byte(current_byte)
            current_byte += 1

        self._determine_opcode_name()

        if self.form in (Form.VARIABLE, Form.EXTENDED):
            self._determine_operand_types(self.memory.read_byte(current_byte))
        else:
            self._determine_operand_types()

    def details(self) -> None:
        print(
            f"{self.operand_count.name:<3} | "
            f"{self.opcode_number:>2} | "
            f"{self.opcode_byte:<3} | "
            f"{hex(self.opcode_byte)[2:]:2} | "
            f"{bin(self.opcode_byte)[2:]}"
        )

        print(f"Instruction: {self.opcode_name}")

        operand_types = [operand_type.name for operand_type in self.operand_types]
        print(f"Operand type: {operand_types}")

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

    def _determine_operand_types(self, current_byte: int = None) -> None:
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
