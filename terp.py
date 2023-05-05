import sys


class Memory:
    def __init__(self, data):
        self.data = data


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
