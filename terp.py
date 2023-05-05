import sys


class Memory:
    def __init__(self, data):
        self.data = data
        self.pc = 0

        self.read_starting_address()

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


if __name__ == "__main__":
    main()
