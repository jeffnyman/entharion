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

## Refined Understanding

A zcode instruction is a sequence of bytes, describing an operation for the Z-Machine to perform.

An instruction consists of two parts: the opcode and the operands. The first one to three bytes contain the opcode and the types of the operands. The following bytes contain the operands themselves. Here's is a schematic of an opcode in the Z-Machine:

```
+---------------+---------------+
|   Opcode      |   Operands    |
+---------------+---------------+
|  n bits       |  0 to m bytes |
+---------------+---------------+
```

In this schematic, the opcode is represented by `n` bits, which specify the operation to be performed. The operands are represented by `m` bytes, which encode the data to be operated on by the instruction. The number and format of the operands is determined by the specific opcode and its format.

The Z-Machine reads each byte of the program in turn, treating each byte as an opcode that specifies an operation to be performed. The Z-Machine uses the opcode to determine the format of the instruction, and then reads the appropriate number of bytes to get the operands. The Z-Machine uses the information encoded in the opcode and operands to perform the appropriate operation on the data.

Each instruction has an operation byte, which is the byte that contains the opcode or, more specifically, the opcode number. This is how a particular opcode is identified. This is generally going to be the first byte. The only exception is for extended instructions, in which case this is the second byte.

I'm going to come back to this operation byte momentarily, but let's consider some other aspects first.

Consistent with the initial understanding, instructions come in different formats, depending on the number of operands they take: short (zero or one), long (two), variable (up to four), double variable (up to eight), and extended (up to four). Double variable instructions are available in versions 4 and up, and extended ones are available in versions 5 and up. It's worth noting that the extended instructions look a lot like variable instructions. This form was apparently created for the version 5 and greater Z-Machines because there were not enough instruction numbers left, given size constraints of the Z-Machine, to accommodate newer features.

Opcodes consist of a kind and a number. Instructions of different formats contain different kinds of opcode, broken down like this:

```
short           | 0OP or 1OP
long            | 2OP
variable        | 2OP or VAR
double variable | VAR
extended        | EXT
```

What we end up with are a operation byte range:

```
00-1F            | 2OP:0-1F | Both operands are byte constants
20-3F            | 2OP:0-1F | Operands are byte constant, variable number
40-5F            | 2OP:0-1F | Operands are variable number, byte constant
60-7F            | 2OP:0-1F | Both operands are variable numbers
80-8F            | 1OP:0-F  | Operand is word constant
90-9F            | 1OP:0-F  | Operand is byte constant
A0-AF            | 1OP:0-F  | Operand is variable number
B0-BF except BE  | 0OP:0-F  | BE indicates extended instruction
C0-DF            | 2OP:0-1F | Variable instruction format
E0-FF            | VAR:0-1F
00-FF after BE   | EXT:0-FF
```

An interesting point, and one the specification does not make clear, is that the opcode number can be computed by subtracting the first number in the operation byte range from the operation byte.

Let's do an example with the `add` opcode from the Z-Machine. The `add` opcode has an operation byte of 84 (0x54). This means that the `add` opcode fits in the range of 40-5F.

Thus to compute the opcode number for `add`, you have to subtract the first number in the operation byte range from the operation byte. We know the operation byte is 84 (0x54). We know the first number in the range is (64) 0x40. So that would mean you perform the following 84 - 64. Subtracting 64 (0x40) from 84 (0x54) gives 20 (0x14), which is the opcode number for the add instruction.

This is what you see in the Z-Machine specification which, for the `add` opcode, indicates that the opcode is 2OP:20 and the hex value is 14.

Note that the Z-Machine only ever sees 0x14. But each opcode has a symbolic name &mdash; a mnemonic &mdash; that describes its effect. So when we say `add`, we're using that mnemonic. But that is not something the Z-Machine would be aware of. "Entharion" does use the mnemonic to make the code bit clearer to read.

## Schematics of Opcodes

Here's is a schematic of a short-form opcode in the Z-Machine, showing how the top two bits, operand type, and opcode number are situated:

```
+---+---+---+---+---+---+---+---+
| 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |  <-- Short-form opcode
+---+---+---+---+---+---+---+---+
| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |  <-- Operand type (bits 4-5)
+---+---+---+---+---+---+---+---+
|         Opcode number         |  <-- Opcode number (bits 0-3)
+-------------------------------+
```

In this schematic, the top two bits of the opcode are 10 (binary), indicating that this is a short-form opcode. The next two bits (11) represent the operand type, indicating that this is a 0OP instruction. The remaining four bits represent the opcode number, which specifies the specific operation to be performed.

Short-form opcodes have the operand type encoded in bits 4 and 5 of the opcode byte, and the opcode number encoded in bits 0-3. The operand type can be 11 (binary) for 0OP instructions, or any other value for 1OP instructions. The opcode number specifies the specific operation to be performed, and can range from 0 to 15 (decimal).

Here's another way to frame it, showing a byte and how that byte is broken down.

```
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+
| 1 | 0 |  Type | Opcode Number |
+---+---+---+---+---+---+---+---+
```

This represents what the Z-Machine specification says.

> In short form, bits 4 and 5 of the opcode byte give an operand type. If this is 11 then the operand count is 0OP; otherwise, 1OP. In either case the opcode number is given in the bottom 4 bits.

Here's a schematic of a long-form opcode in the Z-Machine, showing how the top two bits, operand type, and opcode number are situated:

```
+---+---+---+---+---+---+---+---+
| 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |  <-- Long-form opcode
+---+---+---+---+---+---+---+---+
|         Opcode number         |  <-- Opcode number (bits 0-5)
+-------------------------------+
|          Operand 1            |  <-- First operand (0 to 2 bytes)
+-------------------------------+
|          Operand 2            |  <-- Second operand (0 to 2 bytes)
+-------------------------------+
|             ...               |  <-- Additional operands (0 to 2 bytes each)
+-------------------------------+
```

In this schematic, the top two bits of the opcode are 11 (binary), indicating that this is a long-form opcode. The remaining six bits represent the opcode number, which specifies the specific operation to be performed.

Long-form opcodes have one or more operands, which are encoded in one or more bytes following the opcode byte. The number and format of these operands is determined by the specific opcode being executed. In this schematic, I'm just showing one or more operands following the opcode byte, with each operand encoded in 0 to 2 bytes.

The opcode number specifies the specific operation to be performed, and can range from 0 to 63 (decimal). Since long-form opcodes have more bits available for the opcode number than short-form opcodes, there are more possible operations that can be performed using a long-form opcode.

Here's another way to frame it, showing a byte and how that byte is broken down.

```
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+
| 0 | F | S |   Opcode Number   |
+---+---+---+---+---+---+---+---+
```

Here "F" refers to "first type" and "S" refers to "second type." This represents what the Z-Machine specification says.

> In long form the operand count is always 2OP. The opcode number is given in the bottom 5 bits.

It's worth noting that since the long form is defined as "not a leading 11 or 10," this would imply that bit 7 must be zero. This further implies that bit 6 isn't needed to define the form. Since the opcode number occupies the low 5 bits, that would also seem to leave bit 5 itself unspecified here. The specification, however, does provide some details.

> In long form, bit 6 of the opcode gives the type of the first operand, bit 5 of the second. A value of 0 means a small constant and 1 means a variable.

Here's a schematic of a variable-form opcode in the Z-Machine, showing how the top two bits, operand types, and opcode number are situated:

```
+---+---+---+---+---+---+---+---+
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |  <-- Variable-form opcode
+---+---+---+---+---+---+---+---+
|        Opcode number          |  <-- Opcode number (bits 0-5)
+-------------------------------+
|        Operand count          |  <-- Operand count (bits 6-7)
+-------------------------------+
|          Operand 1            |  <-- First operand (0 to 2 bytes)
+-------------------------------+
|          Operand 2            |  <-- Second operand (0 to 2 bytes)
+-------------------------------+
|             ...               |  <-- Additional operands (0 to 2 bytes each)
+-------------------------------+
```

In this schematic, the top two bits of the opcode are 11 (binary), indicating that this is a variable-form opcode. The next six bits represent the opcode number, which specifies the specific operation to be performed.

Variable-form opcodes have a variable number of operands, which are encoded in one or more bytes following the opcode byte. The number and format of these operands is determined by the specific opcode being executed. In this schematic, I'm showing one or more operands following the operand count byte, with each operand encoded in 0 to 2 bytes.

The operand count is encoded in bits 6 and 7 of the opcode byte, and specifies the number of operands that follow the opcode byte. The operand count can range from 0 to 3, with a value of 0 indicating that there are no operands following the opcode byte.

The opcode number specifies the specific operation to be performed, and can range from 0 to 63 (decimal). Similar to a long-form opcode, since variable-form opcodes have more bits available for the opcode number than short-form opcodes, there are more possible operations that can be performed using a variable-form opcode.

Here's another way to frame it, showing a byte and how that byte is broken down.

```
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+
| 1 | 1 | C |   Opcode Number   |
+---+---+---+---+---+---+---+---+
```

Here the "C" refers to "operand count." This represents what the Z-Machine specification says.

> In variable form, if bit 5 is 0 then the count is 2OP; if it is 1, then the count is VAR. The opcode number is given in the bottom 5 bits.
