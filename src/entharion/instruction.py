from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory

from enum import Enum

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")
Operand_Count = Enum("Operand Count", "OP0 OP1 OP2 VAR")


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address
        self.opcode_byte: int
        self.form: Form
        self.operand_count: Operand_Count
        self.opcode_number: int

    def decode(self) -> None:
        self.opcode_byte = self.memory.read_byte(self.address)
        print(f"Opcode byte: {self.opcode_byte} ({hex(self.opcode_byte)})")

        self._determine_form()
        print(f"Instruction form: {self.form.name}")

        self._determine_operand_count()
        print(f"Opearand count: {self.operand_count.name}")

        self._determine_opcode_number()
        print(f"Opcode number: {self.opcode_number}")

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
