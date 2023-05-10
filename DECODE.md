# Decoding the Z-Machine

In order to test out _Entharion_, I'm using a _Zork 1_ version 3 zcode program (revision 88, serial number 840726). I have some `txd` output from that zcode. For those not aware, `txd` is one of the "ztools" and is used debugging and analyzing Z-Machine games.

Representative output from that tool looks like this:

```
Main routine 4f04, 0 locals ()

4f05:  e0 03 2a 39 80 10 ff ff 00    call     5472 #8010 #ffff -> sp

Routine 5472, 3 locals (0000, 0000, 0000)

5479:  e0 2f 2a 43 01 03             call     5486 local0 -> local2
```

The first line, `Main routine 4f04, 0 locals ()`, tells us that we're currently in the "Main" routine, and that the current instruction pointer is at memory address `4f04`. The `0 locals ()` indicates that there are no local variables in the current scope. Essentially, all Z-Machine programs begin in some form of "Main" routine.

The next line, `4f05: e0 03 2a 39 80 10 ff ff 00 call 5472 #8010 #ffff -> sp`, is a disassembled Z-Machine instruction. The `4f05:` is the memory address of the instruction and this is the first one that would be encountered by the interpreter when it decodes the zcode program. The `e0 03 2a 39 80 10 ff ff 00` is the raw bytes of the instruction, and the `call 5472 #8010 #ffff -> sp` is the human-readable disassembly of those raw bytes.

This particular instruction is a `call` instruction, which pushes the current instruction pointer onto the stack and sets the instruction pointer to the specified address (`5472` in this case). The `#8010 #ffff` indicates that the values `0x8010` and `0xffff` are also pushed onto the stack. Finally, the `-> sp` indicates that the stack pointer is updated.

The next section is a disassembled subroutine, with the address of the first instruction (`5479:`), the bytes of the instruction (`e0 2f 2a 43 01 03`), and the disassembled instruction (`call 5486 local0 -> local2`). This `call` instruction pushes the current instruction pointer onto the stack and sets the instruction pointer to the specified address (`5486`). It also sets the local variable `local0` to the top value on the stack, and sets `local1` and `local2` to the next two values on the stack.

Here `local0` will be `8010` and `local1` will be `ffff.` These are what were passed in. In this case, `local2` will be 0000.

At this point, the call stack would look like this:

```
     5486 (8010)
     5472 (8010, ffff)
Main 4f04 ()
```

So let's consider a few of these calls until we get to a non-call opcode:

```
Main routine 4f04, 0 locals ()

4f05:  e0 03 2a 39 80 10 ff ff 00    call     5472 #8010 #ffff -> sp

Routine 5472, 3 locals (0000, 0000, 0000)

5479:  e0 2f 2a 43 01 03             call     5486 local0 -> local2

Routine 5486, 5 locals (0000, 0000, 0000, 0000, 0000)

 5491:  54 94 b4 03                  add      g84 #b4 -> local2
```

Let's break this down (repeating some of the above).

1. The first line indicates that this is the `main` routine of the program, located at address `4f04`, and has 0 local variables.

2. The second line is an instruction at address `4f05` that calls the routine located at address `5472`, passing two values (`#8010` and `#ffff`) as arguments, and expects the return value to be stored on the stack.

3. The third line is a routine located at address `5472` that has three local variables, each initialized to `0000`.

4. The fourth line is an instruction at address `5479` that calls the routine located at address `5486`, passing the value of the first local variable as an argument and expecting the return value to be stored in the third local variable.

5. The fifth line is a routine located at address `5486` that has five local variables, each initialized to `0000`.

6. The sixth line is an instruction at address `5491` that adds the value of `#b4` to the value of global variable `g84` and stores the result in the second local variable.

On that last instruction, in my _zork1.z3_ program, `g84` has a value of 23e9 (9193) and `#b4` is 180. Thus when that instruction is executed, `L02` will be 249d (9373), which is, in fact, the correct result of 9193 + 180.

As part of its operation, _Entharion_ generates two files: `log.txt` and `trace.txt`. The former gives a detailed view of what's happening as the zcode program is being decoded. The latter, however, tries to give a very simple representation that matches what `txd` shows. As an example, the first two calls in the zcode program show up like this:

```
4f05: E0 03 2A 39 80 10 FF FF 00 call 5472 ['8010', 'ffff', '0'] -> sp
5479: E0 2F 2A 43 01 03 call 5486 ['8010', '0', '0', '0', '0'] -> sp
```

It's not as well formatted as `txd` but the goal is to let me more easily trace what _Entharion_ is generating and then comparing that with the `txd` output.
