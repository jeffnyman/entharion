This document will contain some notes I'm putting together as I learn how to construct the very basics of decoding instructions for the Z-Machine.

---

In the case of "Entharion," loading up a zcode program instantiates a `Memory` instance. The zcode binary data is stored in a `data` variable that is a bytearray. (It needs to be bytearray rather than just a bytes variable because it will be necessary to write to the data.)

When the `Memory` instance initializes, it reads the starting address. This refers to the byte address of the first instruction that should be executed. This address is then stored in the `pc` variable.

The next step is to read the instruction that's stored in the `pc` variable. At the start of execution, this will be the starting address. However, the `pc` variable will be updated to cycle through instructions. Thus a very critical part of getting an interpreter implementation correct is making sure that you update where `pc` is pointing to.

## Initial Understanding

The first thing you learn is that the Z-Machine's instruction set, each instruction is represented by a single byte opcode, which specifies the operation to be performed. However, many instructions also require additional data to be supplied, such as the address of a variable or some text to be printed. This additional data is usually encoded in one or more subsequent bytes following the opcode. So while each instruction is represented by a single byte opcode, the total size of the instruction can vary depending on the amount of additional data required, meaning the specific opcode and its arguments.

In fact, it's not just a single-byte opcode as it turns out.

The opcode for an instruction can be one or two bytes long, depending on the version of the Z-Machine being used. This idea of the version ends up being critical to a whole lot of aspects of emulating the Z-Machine. In this context, in versions 1 through 3, all opcodes are a single byte long. In versions 4 and later, some opcodes are two bytes long, with the first byte specifying an "opcode extension" and the second byte specifying the actual opcode. What this means is that an instruction can be represented by a single byte opcode in versions 1 to 3 or by a two-byte opcode in versions 4 and later.

The next part of the logic in "Entharion" gets the form of the instruction. The possible format types are SHORT, LONG, VARIABLE and EXTENDED.

This is important because each instruction in the Z-Machine has a specific format, which determines how the instruction's arguments are encoded. Here I'll just focus on versions 1 through 4 since extended instructions are only in versions 5 and above. Figuring out the form is actually really easy:

- If the top two bits of the opcode are 11 (binary), the instruction form is VARIABLE.
- If the two two bits of the opcode are 10 (binary), the instruction form is SHORT.
- If neither of the above two are the case, the instruction form is LONG.

The next part of the logic in "Entharion" is to get the operand count. The idea here is that each instruction will have operands, the count of which can vary. The range is between zero and eight operands. The possible operand counts are represented by the types 0OP, 1OP, 2OP and VAR. These operands specify the data to be operated on by the instruction so it's crtitical to get this part correct.

All of this gets complicated a bit by also needing to consider the operand type. In the logic of "Entharion", getting the two values &mdash; the count and types &mdash; is treated separately, but they are linked.

The type of each operand is determined by the opcode and format of the instruction being executed, More specifically, the operands can have different types, such as numbers, strings, or addresses, and the type of each operand is determined by the instruction's opcode and format. The type of operand is encoded by a two-bit number.

```
00 | Large constant (0 to 65535) | 2 bytes
01 | Small constant (0 to 255)   | 1 byte
10 | Variable                    | 1 byte
11 | Omitted                     | 0 bytes
```

This two-bit value is stored alongside the operand in the instruction. The variable type mentioned above is not an actual numericc value but rather a value that indexes into a variable table that is held in the Z-Machine's memory. "Omitted" is what it sounds like this: the operand is not present in the instruction.

The two-bit values that encode the operand types are not part of the opcode itself, but are instead part of the data that follows the opcode. This was something that threw me off initially. Specifically, the two-bit values are stored alongside each operand in the instruction, immediately following the opcode. The two-bit values that encode the operand types are thus not part of the opcode itself, but are instead part of the data that follows the opcode.

The breakdown here is relatively easy:

- A LONG form instruction is always 2OP.
- A VARIABLE from instruction requries looking at bit 5.
  - If bit 5 is 0, the operand count is 2OP.
  - If bit 5 is 1, the operand count is VAR.
- A SHORT form instruction requires looking at bits 4 and 5
  - If bits 4 and 5 are 11, the operand count is 0OP.
  - If bits 4 and 5 are not 11, the operand count is 1OP.
