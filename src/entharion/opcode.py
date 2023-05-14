from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.instruction import Instruction


class Opcode:
    def call(self: "Instruction") -> None:
        print("Executing call")
