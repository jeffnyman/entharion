import sys

from entharion.loader import Loader
from entharion.instruction import Instruction
from entharion.memory import Memory


def main() -> int:
    zcode: Memory = Loader.load(sys.argv[1])

    assert isinstance(zcode, Memory), "zcode must be instance of Memory"
    assert isinstance(zcode.data, bytes), "zcode data must be of type bytes"

    instruction: Instruction = zcode.read_instruction(zcode.pc)

    assert isinstance(
        instruction, Instruction
    ), "instruction must be instance of Instruction"

    return 0


if __name__ == "__main__":
    sys.exit(main())
