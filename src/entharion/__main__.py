import sys


class Memory:
    def __init__(self, data) -> None:
        self.data = data


class Loader:
    @staticmethod
    def load(filename) -> Memory:
        f = open(filename, "rb")
        data = f.read()

        return Memory(data)


def main() -> int:
    zcode: Memory = Loader.load(sys.argv[1])

    assert isinstance(zcode, Memory), "zcode must be instance of Memory"
    assert isinstance(zcode.data, bytes), "zcode data must be of type bytes"

    return 0


if __name__ == "__main__":
    sys.exit(main())
