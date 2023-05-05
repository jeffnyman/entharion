import sys

from enum import Enum

FORM = Enum("FORM", "SHORT LONG VARIABLE EXTENDED")


class Memory:
    def __init__(self, data):
        self.data = data
        self.pc = 0
        self.version = self.data[0x00]

        self.read_starting_address()

    def read_instruction(self, offset):
        current_byte = offset

        opcode_byte = self.data[current_byte]

        print(f"Opcode: {hex(opcode_byte)}")

        # According to the specification, each instruction has a form. The
        # possible forms are: long, short, extended or variable. To check
        # for the extended requires knowing the version of the zcode.

        # If the opcode is 190 (x0BE in hex) and the version of the zcode
        # is 5 or later, the form is extended.

        # If the top two bits of the opcode are b11 the form is variable.
        # If the top two bits of the opcode are b19 the form is short.

        if self.version >= 5 and opcode_byte == 0xbe:
            form = FORM.EXTENDED
        elif opcode_byte & 0b11000000 == 0b11000000:
            form = FORM.VARIABLE
        elif opcode_byte & 0b10000000 == 0b10000000:
            form = FORM.SHORT
        else:
            form = FORM.LONG

        print(f"FORM: {form.name}")

        # According to the specification, each instruction has an operand
        # count. The possible counts are: 0OP, 1OP, 2OP or VAR.

        self.read_operand_count(form, opcode_byte)

    def read_operand_count(self, form, byte):
        """
        According to the specification, in long form the operand count is
        always 2OP. In short form, bits 4 and 5 of the opcode byte give an
        operand type. If this operand type is b11 then the operand count is
        0OP, otherwise it will be 1OP. In variable form, if bit 5 is 0 then
        the operand count is 2OP; if it is 1, then the count is VAR.
        """

        if form == FORM.LONG:
            print("Form: LONG")
            print("OpCount: 2OP")
        elif form == FORM.SHORT:
            print("FORM: SHORT")
            if byte & 0b00110000 == 0b00110000:
                print("OpCount: 0OP")
            else:
                print("OpCount: 1OP")
        elif form == FORM.EXTENDED:
            print("FORM: Extended")
            print("OpCount: VAR")
        else:
            if byte & 0b00100000 == 0b00100000:
                print("OpCount: VAR")
            else:
                print("OpCount: 2OP")

    def read_starting_address(self):
        """
        According to the specification, for versions 1 to 5 of zcode, the
        word at 0x06 contains the byte address of the first instruction
        to execute.
        """

        self.pc = self.read_word(0x06)

    def read_word(self, offset):
        return (self.data[offset] << 8) + self.data[offset + 1]


class Loader:
    def load(filename):
        f = open(filename, "rb")
        memory = f.read()

        return Memory(memory)


def main():
    zcode = Loader.load(sys.argv[1])

    assert isinstance(zcode.data, bytes), "zcode must be of type bytes"

    zcode.read_instruction(zcode.pc)


if __name__ == "__main__":
    main()
