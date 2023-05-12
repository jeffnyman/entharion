class Memory:
    def __init__(self, data) -> None:
        self.data = data

        self.version = self.read_byte(0x00)

        self.dynamic = 0
        self.static = self.read_word(0x0E)
        self.high = self.read_word(0x04)

        self.routine_offset = self.read_word(0x28)
        self.strings_offset = self.read_word(0x2A)

        print(f"Zcode version: {self.version}")
        print(f"Static memory start: {hex(self.static)}")
        print(f"High memory start: {hex(self.high)}")
        print(f"Routine offset: {self.routine_offset}")
        print(f"Strings offset: {self.strings_offset}")

        self._memory_checks()

    def read_byte(self, address) -> int:
        return self.data[address]

    def read_word(self, address) -> int:
        return (self.data[address] << 8) | self.data[address + 1]

    def read_packed(self, address, is_routine) -> int:
        if self.version < 4:
            return 2 * address

        if self.version < 6:
            return 4 * address

        if self.version < 8 and is_routine:
            return 4 * address + (8 * self.routine_offset)

        if self.version < 8:
            return 4 * address + (8 * self.strings_offset)

        return 8 * address

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

        dynamic_size = self.static - 1 - self.dynamic + 1

        if (dynamic_size + self.static) > 65534:
            raise RuntimeError("memory exceeds addressable memory space")
