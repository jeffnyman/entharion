from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory

from enum import Enum

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")
Operand_Count = Enum("Operand Count", "OP0 OP1 OP2 VAR")


mnemonic_map = {
    (1, 2, 3): {
        (224, 0): "call",
    },
    (4, 5, 6, 7, 8): {(224, 0): "call_vs"},
}


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address
        self.opcode_byte: int
        self.form: Form
        self.operand_count: Operand_Count
        self.opcode_number: int
        self.opcode_name: str

    def decode(self) -> None:
        current_byte: int = self.address

        self.opcode_byte = self.memory.read_byte(self.address)

        current_byte += 1

        self._determine_form()
        self._determine_operand_count()
        self._determine_opcode_number()

        if self.memory.version >= 5 and self.opcode_byte == 0xBE:
            self.opcode_number = self.memory.read_byte(current_byte)
            current_byte += 1

        self._determine_opcode_name()

    def details(self) -> None:
        print(
            f"{self.operand_count.name:<3} | "
            f"{self.opcode_number:>2} | "
            f"{self.opcode_byte:<3} | "
            f"{hex(self.opcode_byte)[2:]:2} | "
            f"{bin(self.opcode_byte)[2:]}"
        )

        print(f"Instruction: {self.opcode_name}")

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
        for key in mnemonic_map.keys():
            if self.memory.version in key:
                version_map = mnemonic_map[key]
                break

        if version_map:
            self.opcode_name = version_map.get(
                (self.opcode_byte, self.opcode_number), "UNKNOWN"
            )
