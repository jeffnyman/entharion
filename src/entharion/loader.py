from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.trace import Trace

from entharion.memory import Memory


class Loader:
    @staticmethod
    def load(filename: str, trace: "Trace") -> Memory:
        f = open(filename, "rb")
        data = f.read()

        return Memory(data, trace)
