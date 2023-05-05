import sys

from enum import Enum

FORM = Enum("FORM", "SHORT LONG VARIABLE EXTENDED")
OP_COUNT = Enum("OperandCount", "OP0 OP1 OP2 VAR")

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

        print(f"OpForm: {form.name}")

        # According to the specification, each instruction has an operand
        # count. The possible counts are: 0OP, 1OP, 2OP or VAR.

        opcount = self.read_operand_count(form, opcode_byte)

        print(f"OpCount: {opcount.name}")

        # According to the specification, each operand has a type.

        self.read_operand_type(form, opcode_byte)
       
    def read_operand_type(self, form, byte):
        """
        According to the specification, in a short form opcode, bits 4 and 5
        of the opcode give the operand type. A value of 01 means a small while
        a value of 10 means a variable. In a long form opcode, bit 6 of the
        opcode gives the type of the first operand, bit 5 of the second. A
        value of 0 means a small and 1 means a variable.
        """

        if form == FORM.SHORT:
            print("Type will be either Variable, Large, or Small")
            if byte & 0b00100000 == 0b00100000:
                print("OpType: Variable")
            elif byte & 0b00010000 == 0b00010000:
                print("OpType: Small")
            elif byte & 0b00000000 == 0b00000000:
                print("OpType: Large")
        elif form == FORM.LONG:
            print("Type will be either Variable or Small")
            if byte & 0b01000000 == 0b01000000:
                print("OpType: Variable")
            else:
                print("OpType: Small")
            if byte & 0b00100000 == 0b00100000:
                print("OpType: Variable")
            else:
                print("OpType: Small")
        else:
            print("Not sure what type will be.")

    def read_operand_count(self, form, byte):
        """
        According to the specification, in long form the operand count is
        always 2OP. In short form, bits 4 and 5 of the opcode byte give an
        operand type. If this operand type is b11 then the operand count is
        0OP, otherwise it will be 1OP. In variable form, if bit 5 is 0 then
        the operand count is 2OP; if it is 1, then the count is VAR.
        """

        if form == FORM.LONG:
            opcount = OP_COUNT.OP2
        elif form == FORM.SHORT:
            if byte & 0b00110000 == 0b00110000:
                opcount = OP_COUNT.OP0
            else:
                opcount = OP_COUNT.OP1
        elif form == FORM.EXTENDED:
            opcount = OP_COUNT.VAR
        else:
            if byte & 0b00100000 == 0b00100000:
                opcount = OP_COUNT.VAR
            else:
                opcount = OP_COUNT.OP2

        return opcount

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
