class Routine:
    def __init__(self):
        self.return_address: int = 0x0000
        self.local_variables: list = []
        self.store_variable: int
