import sys

from entharion.loader import Loader
from entharion.memory import Memory


def main() -> int:
    zcode: Memory = Loader.load(sys.argv[1])

    assert isinstance(zcode, Memory), "zcode must be instance of Memory"
    assert isinstance(zcode.data, bytes), "zcode data must be of type bytes"

    return 0


if __name__ == "__main__":
    sys.exit(main())
