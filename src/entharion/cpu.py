import sys

from entharion.loader import Loader
from entharion.logging import setup_logging
from entharion.instruction import Instruction
from entharion.memory import Memory
from entharion.trace import Trace


class Cpu:
    def run(self) -> None:
        self.zcode: Memory

        trace = Trace()
        setup_logging("log.txt")

        self.zcode = Loader.load(sys.argv[1], trace)

        while True:
            self.loop()

    def loop(self) -> None:
        instruction: Instruction = self.zcode.read_instruction(self.zcode.pc)

        instruction.details()
        instruction.execute()
        self.zcode.trace.generate()
