import sys

from entharion.loader import Loader
from entharion.logging import setup_logging
from entharion.instruction import Instruction
from entharion.memory import Memory
from entharion.trace import Trace


class Cpu:
    def run(self) -> None:
        trace = Trace()
        setup_logging("log.txt")

        zcode: Memory = Loader.load(sys.argv[1], trace)

        instruction: Instruction = zcode.read_instruction(zcode.pc)

        instruction.details()
        instruction.execute()
        zcode.trace.generate()
