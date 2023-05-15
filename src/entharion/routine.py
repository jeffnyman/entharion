from entharion.logging import log


class Routine:
    def __init__(self):
        self.return_address: int = 0x0000
        self.local_variables: list = []
        self.store_variable: int

    def __str__(self) -> str:
        return f"Routine: {hex(id(self))}"

    def details(self) -> None:
        log("\n** Routine Call **")

        variable_values = [hex(num)[2:] for num in self.local_variables]
        log(f"Local variables: {variable_values}")
