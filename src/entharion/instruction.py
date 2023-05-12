from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory


class Instruction:
    def __init__(self, memory: "Memory", address: int) -> None:
        self.memory: "Memory" = memory
        self.address: int = address

    def decode(self) -> None:
        opcode_byte = self.memory.read_byte(self.address)
        print(f"Opcode byte: {opcode_byte} ({hex(opcode_byte)})")
