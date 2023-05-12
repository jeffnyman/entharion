from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.memory import Memory

from enum import Enum

Form = Enum("Form", "SHORT LONG VARIABLE EXTENDED")
Operand_Count = Enum("Operand Count", "OP0 OP1 OP2 VAR")


mnemonic_map = {
    "call": [((1, 2, 3), (224, 0))],
    "call_vs": [((4, 5, 6, 7, 8), (224, 0))],
    "storew": [((1, 2, 3, 4, 5, 6, 7, 8), (225, 1))],
    "storeb": [((1, 2, 3, 4, 5, 6, 7, 8), (226, 2))],
    "put_prop": [((1, 2, 3, 4, 5, 6, 7, 8), (227, 3))],
    "sread": [((1, 2, 3, 4), (228, 4))],
    "aread": [((5, 6, 7, 8), (228, 4))],
    "print_char": [((1, 2, 3, 4, 5, 6, 7, 8), (229, 5))],
    "print_num": [((1, 2, 3, 4, 5, 6, 7, 8), (230, 6))],
    "random": [((1, 2, 3, 4, 5, 6, 7, 8), (231, 7))],
    "push": [((1, 2, 3, 4, 5, 6, 7, 8), (232, 8))],
    "pull": [((1, 2, 3, 4, 5, 6, 7, 8), (233, 9))],
    "split_window": [((3, 4, 5, 6, 7, 8), (234, 10))],
    "set_window": [((3, 4, 5, 6, 7, 8), (235, 11))],
    "call_vs2": [((4, 5, 6, 7, 8), (236, 12))],
    "erase_window": [((4, 5, 6, 7, 8), (237, 13))],
    "erase_line": [((4, 5, 6, 7, 8), (238, 14))],
    "set_cursor": [((4, 5, 6, 7, 8), (239, 15))],
    "get_cursor": [((4, 5, 6, 7, 8), (240, 16))],
    "set_text_style": [((4, 5, 6, 7, 8), (241, 17))],
    "buffer_mode": [((4, 5, 6, 7, 8), (242, 18))],
    "output_stream": [((3, 4, 5, 6, 7, 8), (243, 19))],
    "input_stream": [((3, 4, 5, 6, 7, 8), (244, 20))],
    "sound_effect": [((3, 4, 5, 6, 7, 8), (245, 21))],
    "read_char": [((4, 5, 6, 7, 8), (246, 22))],
    "scan_table": [((4, 5, 6, 7, 8), (247, 23))],
    "not": [((5, 6, 7, 8), (248, 24))],
    "call_vn": [((5, 6, 7, 8), (249, 25))],
    "call_vn2": [((5, 6, 7, 8), (250, 26))],
    "tokenize": [((5, 6, 7, 8), (251, 27))],
    "encode_text": [((5, 6, 7, 8), (252, 28))],
    "copy_table": [((5, 6, 7, 8), (253, 29))],
    "print_table": [((5, 6, 7, 8), (254, 30))],
    "check_arg_count": [((5, 6, 7, 8), (255, 31))],
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
        for opcode_name, opcode_data in mnemonic_map.items():
            for version_tuple, opcode_tuple in opcode_data:
                if (
                    self.memory.version in version_tuple
                    and (self.opcode_byte, self.opcode_number) == opcode_tuple
                ):
                    self.opcode_name = opcode_name
                    return

        self.opcode_name = "UNKNOWN"
