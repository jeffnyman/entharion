import sys

from enum import Enum

OPCODE_FORM = Enum("OpcodeForm", "SHORT LONG VARIABLE EXTENDED")
OPERAND_COUNT = Enum("OperandCount", "OP0 OP1 OP2 VAR")
OPERAND_TYPE = Enum("OperandType", "Small Large Variable")


class Routine:
    """
    According to the specification, a routine begins with one byte indicating
    the number of local variables it has (between 0 and 15 inclusive).
    """

    def __init__(self):
        self.local_variables = []
        self.return_address = 0x0000


class Instruction:
    def __init__(self, opcode, operand_types, operands):
        self.opcode = opcode
        self.operand_types = operand_types
        self.operands = operands

    def execute(self, memory):
        print("\nEXECUTING: " + str(self.opcode))

        if (self.opcode == 'call'):
            memory.call(self.operand_types, self.operands)
        else:
            raise Exception("Not implemented")
        
    def details(self):
        print("\n---------------------------------------")
        print("INSTRUCTION")
        print("---------------------------------------")
        print(f"Opcode Name: {self.opcode}")
        print(f"Operand Types: {self.operand_types}")
        print(f"Operands: {self.operands}")


class Memory:
    def __init__(self, data):
        self.data = data
        self.pc = 0
        self.version = self.data[0x00]

        self.read_starting_address()

    def read_instruction(self, offset):
        current_byte = offset

        opcode_byte = self.data[current_byte]

        print("\n---------------------------------------")
        print("Opcode Byte: " + str(opcode_byte) + " (" + hex(opcode_byte) + ")" + " (" + self.binary(opcode_byte) + ")")
        print("---------------------------------------")

        # NOTE: This line is crucial. I'm not quite clear why I have to
        # immediately increment the current byte.
        current_byte += 1

        # According to the specification, a single Z-machine instruction
        # consists of an opcode, which is either 1 or 2 bytes.

        opcode = self.determine_opcode(opcode_byte)

        # According to the specification, each instruction has a form. The
        # possible forms are: long, short, extended or variable. To check
        # for the extended requires knowing the version of the zcode.

        # If the opcode is 190 (x0BE in hex) and the version of the zcode
        # is 5 or later, the form is extended.

        # If the top two bits of the opcode are b11 the form is variable.
        # If the top two bits of the opcode are b19 the form is short.

        if self.version >= 5 and opcode_byte == 0xbe:
            form = OPCODE_FORM.EXTENDED
        elif opcode_byte & 0b11000000 == 0b11000000:
            form = OPCODE_FORM.VARIABLE
        elif opcode_byte & 0b10000000 == 0b10000000:
            form = OPCODE_FORM.SHORT
        else:
            form = OPCODE_FORM.LONG

        print(f"Opcode Form: {form.name}")

        # According to the specification, each instruction has an operand
        # count. The possible counts are: 0OP, 1OP, 2OP or VAR.

        operand_count = self.read_operand_count(form, opcode_byte)

        print(f"Operand Count: {operand_count.name}")

        # According to the specification, each operand has a type.

        operand_types = []

        if form == OPCODE_FORM.VARIABLE:
            operand_types = self.read_operand_type(form, self.data[current_byte])
            current_byte += 1
        else:
            operand_types = self.read_operand_type(form, opcode_byte)

        # For each of the operand types that were found, the operand for
        # each type must be determined.

        operands = []

        for operand_type in operand_types:
            if operand_type == OPERAND_TYPE.Large:
                operands.append(self.read_word(current_byte))
                current_byte += 2

            if operand_type == OPERAND_TYPE.Small:
                operands.append(self.read_byte(current_byte))
                current_byte += 1

            if operand_type == OPERAND_TYPE.Variable:
                operands.append(self.read_byte(current_byte))
                current_byte +- 1

        return Instruction(opcode, operand_types, operands)
    
    def determine_opcode(self, byte):
        if byte == 224:
            return "call"
       
    def read_operand_type(self, form, byte):
        """
        According to the specification, in a short form opcode, bits 4 and 5
        of the opcode give the operand type. A value of 01 means a small while
        a value of 10 means a variable. In a long form opcode, bit 6 of the
        opcode gives the type of the first operand, bit 5 of the second. A
        value of 0 means a small and 1 means a variable.

        In variable or extended forms, a byte of 4 operand types is provided.
        This byte contains four 2-bit fields: bits 6 and 7 are the first field,
        bits 0 and 1 the fourth. A value of 00 means large, 01 means small,
        10 means variable, and 11 means ommitted (as in not present).
        """

        if form == OPCODE_FORM.SHORT:
            if byte & 0b00100000 == 0b00100000:
                return [OPERAND_TYPE.Variable]
            elif byte & 0b00010000 == 0b00010000:
                return [OPERAND_TYPE.Small]
            elif byte & 0b00000000 == 0b00000000:
                return [OPERAND_TYPE.Large]
        elif form == OPCODE_FORM.LONG:
            operand_types = []

            if byte & 0b01000000 == 0b01000000:
                operand_types.append(OPERAND_TYPE.Variable)
            else:
                operand_types.append(OPERAND_TYPE.Small)
            if byte & 0b00100000 == 0b00100000:
                operand_types.append(OPERAND_TYPE.Variable)
            else:
                operand_types.append(OPERAND_TYPE.Small)
            
            return operand_types
        else:
            operand_types = []

            if byte & 0b11000000 == 0b11000000:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte(byte >> 6))
            
            if byte & 0b00110000 == 0b00110000:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte((byte & 0b00110000) >> 4))
            
            if byte & 0b00001100 == 0b00001100:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte((byte & 0b00001100) >> 2))

            if byte & 0b00000011 == 0b00000011:
                return operand_types
            else:
                operand_types.append(self.read_operand_type_from_byte(byte & 0b00000011))
            
            return operand_types

    def read_operand_type_from_byte(self, value):
        if value == 0:
            return OPERAND_TYPE.Large
        elif value == 1:
            return OPERAND_TYPE.Small
        else:
            return OPERAND_TYPE.Variable

    def read_operand_count(self, form, byte):
        """
        According to the specification, in long form the operand count is
        always 2OP. In short form, bits 4 and 5 of the opcode byte give an
        operand type. If this operand type is b11 then the operand count is
        0OP, otherwise it will be 1OP. In variable form, if bit 5 is 0 then
        the operand count is 2OP; if it is 1, then the count is VAR.
        """

        operand_count = None

        if form == OPCODE_FORM.LONG:
            operand_count = OPERAND_COUNT.OP2
        elif form == OPCODE_FORM.SHORT:
            if byte & 0b00110000 == 0b00110000:
                operand_count = OPERAND_COUNT.OP0
            else:
                operand_count = OPERAND_COUNT.OP1
        elif form == OPCODE_FORM.EXTENDED:
            operand_count = OPERAND_COUNT.VAR
        else:
            if byte & 0b00100000 == 0b00100000:
                operand_count = OPERAND_COUNT.VAR
            else:
                operand_count = OPERAND_COUNT.OP2

        return operand_count

    def read_starting_address(self):
        """
        According to the specification, for versions 1 to 5 of zcode, the
        word at 0x06 contains the byte address of the first instruction
        to execute.
        """

        self.pc = self.read_word(0x06)

    def read_byte(self, offset):
        return self.data[offset]
    
    def read_word(self, offset):
        return (self.data[offset] << 8) + self.data[offset + 1]
    
    def binary(self, value):
        binary_str = bin(value)[2:]

        return binary_str.zfill(8)
    
    def call(self, operand_types, operands):
        """
        According to the specification, this opcode calls a given routine with
        0, 1, 2 or 3 arguments as supplied and stores any return value from
        the call. A routine is required to begin at an address in memory which
        can be represented by a packed address.
        """

        routine = Routine()
        routine.return_address = self.pc + 2

        self.pc += 1


class Loader:
    def load(filename):
        f = open(filename, "rb")
        memory = f.read()

        return Memory(memory)


def main():
    zcode = Loader.load(sys.argv[1])

    assert isinstance(zcode.data, bytes), "zcode must be of type bytes"

    while True:
        instruction = zcode.read_instruction(zcode.pc)
        instruction.details()
        instruction.execute(zcode)


if __name__ == "__main__":
    main()
