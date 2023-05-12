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

    def read_byte(self, address) -> int:
        return self.data[address]

    def read_word(self, address) -> int:
        return (self.data[address] << 8) | self.data[address + 1]
