from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entharion.instruction import Instruction


class Opcode:
    def call(self: "Instruction") -> None:
        print("Executing call")
        instruction_length = self.length

        local_variables = []

        # Get the return address. This would be the address of the
        # instruction following the call instruction.

        return_address = self.memory.pc + instruction_length
        print(f"Return address: {hex(return_address)[2:]}")

        # The first operand will be the calling address.
        calling_address = self.operand_values[0]
        routine_address = self.memory.read_packed(calling_address, True)
        print(f"Routine address: {hex(routine_address)[2:]}")

        # Get the number of local variables of the called routine.
        local_variable_count = self.memory.read_byte(routine_address)
        print(f"Total local variables: {local_variable_count}")

        # Populate the local variables with values. These values will either
        # be what was passed in or default values.

        # Explanation: the local variables of a routine are stored in a
        # contiguous block of memory, starting at the second byte of the
        # routine and continuing for L bytes, where L is the number of
        # local variables of the called routine, as gathered above. The
        # default initial values for these variables are stored as L words
        # in the first L bytes of the routine. So if no arguments are
        # passed to the routine, the variables will be initialized to these
        # default values. If arguments are passed, the first n variables
        # will be set to the passed values, and any remaining variables will
        # be initialized to their default values. The The routine header,
        # which starts at the address r, contains information about the
        # routine, including the number of local variables L. The initial
        # values for the local variables are stored in the L words that
        # immediately follow the routine header, starting at address r+1.

        for variable in range(local_variable_count):
            if self.memory.version < 5:
                # Since each local variable has a size of 2 bytes, we need
                # to skip 2 bytes for each local variable already processed,
                variable_value = self.memory.read_word(
                    routine_address + 1 + (2 * variable)
                )
                local_variables.append(variable_value)
            else:
                local_variables.append(0)

        # The program counter is being set to one past the routine address,
        # which is the address of the first instruction of the routine,
        # directly after the routine header. Then, if the version is less
        # than 5, we have to add 2 times the count of local variables to the
        # program counter. In versions 1 to 4 of the Z-Machine, the program
        # counter should be set to r + 2 * L + 1, where r is the routine
        # address, L is the number of local variables, and 1 accounts for
        # the routine header. If the version of the Z-Machine is 5 or more,
        # then we don't add anything to program counter. This is because in
        # version 5 and up of the Z-Machine, the program counter should be
        # set to r + 1, where r is the routine address.

        updated_pc = routine_address + 1

        if self.memory.version < 5:
            updated_pc += 2 * local_variable_count

        print(f"Next instruction at: {hex(updated_pc)[2:]}")

        self.memory.pc = updated_pc
