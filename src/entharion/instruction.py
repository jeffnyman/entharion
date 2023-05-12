from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory

from enum import Enum

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address
        self.opcode_byte: int
        self.form: Form

    def decode(self) -> None:
        self.opcode_byte = self.memory.read_byte(self.address)
        print(f"Opcode byte: {self.opcode_byte} ({hex(self.opcode_byte)})")

        self._determine_form()
        print(f"Instruction form: {self.form.name}")

    def _determine_form(self) -> None:
        if self.memory.version >= 5 and self.opcode_byte == 0xBE:
            self.form = Form.EXTENDED
        elif self.opcode_byte & 0b11000000 == 0b11000000:
            self.form = Form.VARIABLE
        elif self.opcode_byte & 0b10000000 == 0b10000000:
            self.form = Form.SHORT
        else:
            self.form = Form.LONG
