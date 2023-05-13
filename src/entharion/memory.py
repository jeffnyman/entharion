from entharion.instruction import Instruction
from entharion.logging import log


class Memory:
    def __init__(self, data: bytes) -> None:
        self.data: bytes = data

        self.version: int = self.read_byte(0x00)

        self.dynamic: int = 0
        self.static: int = self.read_word(0x0E)
        self.high: int = self.read_word(0x04)

        self.routine_offset: int = self.read_word(0x28)
        self.strings_offset: int = self.read_word(0x2A)

        log(f"Zcode version: {self.version}")
        log(f"Static memory start: {hex(self.static)}")
        log(f"High memory start: {hex(self.high)}")
        log(f"Routine offset: {self.routine_offset}")
        log(f"Strings offset: {self.strings_offset}")

        self.pc: int

        self._memory_checks()
        self._read_starting_address()

        log(f"Starting address: {hex(self.pc)}")

    def read_instruction(self, address: int) -> Instruction:
        log(f"Reading instruction at {hex(address)}")

        instruction = Instruction(self, address)
        instruction.decode()

        return instruction

    def read_byte(self, address: int) -> int:
        return self.data[address]

    def read_word(self, address: int) -> int:
        return (self.data[address] << 8) | self.data[address + 1]

    def read_packed(self, address: int, is_routine: bool) -> int:
        if self.version < 4:
            return 2 * address

        if self.version < 6:
            return 4 * address

        if self.version < 8 and is_routine:
            return 4 * address + (8 * self.routine_offset)

        if self.version < 8:
            return 4 * address + (8 * self.strings_offset)

        return 8 * address

    def _read_starting_address(self) -> None:
        if self.version != 6:
            self.pc = self.read_word(0x06)
        else:
            self.pc = self.read_packed(self.read_word(0x06), True)

    def _memory_checks(self) -> None:
        header_size: int = 64

        # There is a minimum size to a zcode program in that it must be able
        # to accommodate a 64 byte header.

        if len(self.data) < header_size:
            raise RuntimeError("dynamic memory is below required 64 bytes")

        # The specification indicates that dynamic memory must contain at
        # least 64 bytes to accommodate the header.

        if self.static < header_size:
            raise RuntimeError("static memory begins before byte 64")

        # The specification indicates that the total of dynamic plus static
        # memory must not exceed 64K minus 2 bytes.

        dynamic_size: int = self.static - 1 - self.dynamic + 1

        if (dynamic_size + self.static) > 65534:
            raise RuntimeError("memory exceeds addressable memory space")
