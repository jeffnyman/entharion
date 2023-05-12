class Memory:
    def __init__(self, data) -> None:
        self.data = data

    def read_byte(self, address) -> int:
        return self.data[address]

    def read_word(self, address) -> int:
        return (self.data[address] << 8) | self.data[address + 1]
