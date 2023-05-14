import sys

from entharion.loader import Loader
from entharion.logging import setup_logging
from entharion.instruction import Instruction
from entharion.memory import Memory
from entharion.trace import Trace


def main() -> int:
    trace = Trace()
    setup_logging("log.txt")

    try:
        zcode: Memory = Loader.load(sys.argv[1], trace)

        if not isinstance(zcode, Memory):
            raise TypeError("zcode must be instance of Memory")

        if not isinstance(zcode.data, bytes):
            raise TypeError("zcode data must be of type bytes")

        instruction: Instruction = zcode.read_instruction(zcode.pc)
        instruction.details()
        instruction.execute()

        if not isinstance(instruction, Instruction):
            raise TypeError("instruction must be instance of Instruction")
    except (TypeError, FileNotFoundError) as e:
        print(f"Error: {e}")
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
