# Entharion

_A Minimal Z-Machine Emulator and Interpreter_

---

The goal of this project is based on trying to understand how to create [Quendor](https://github.com/jeffnyman/quendor), which is my attempt to write a specification compliant Z-Machine emulator and interpreter.

However, in working on that project, it's become clear to me that the [Z-Machine Standards Document](https://ludichistorian.com/quendor/Z-Machine-Standard-1.0/) is probably one of the poorest written specifications I've ever seen. To remedy this, a document was created &mdash; ["The Z-machine, And How To Emulate It"](https://ludichistorian.com/quendor/zmach06e.pdf) &mdash; which somehow manages to be even more poorly written and gets a few things wrong to top it off.

Eric Lippert started a ["How to Write a Z-Machine"](https://ericlippert.com/category/zmachine/) series but he chose OCaml as his language, which pretty much no one uses seriously, and left the series entirely unfinished. There's good stuff there but, on the whole, it's not really useful. There was a [Z-Machine Preservation Project](https://zmpp.sourceforge.net/) that aimed to provide an "implementation that is easy to understand maintain and extend." In the end, the project was ported from Java to Scala &mdash; [zmpp2](https://github.com/weiju/zmpp2) &mdash; which didn't do much for the "easy to understand" part.

In the end, I found nothing out there really useful to help construct a Z-Machine beyond the open source implementations that you can find on GitHub or GitLab. And those implementations are often incomplete, certainly with regard to supporting the Z-Machine specification. So that's where this project comes in: an attempt to create _just enough_ of a Z-Machine emulator and interpreter to make sure I understand how the thing actually works, particularly when it comes to the processing of opcodes portion. This knowledge will then feed back into my Quendor project.

This particular project, like Quendor, will be in Python. Unlike Quendor, however, this project is aiming to be nothing more than a playground to attempt a very streamlined approach to building the emulator and interpreter. This will be the "no-frills" version and, perhaps arguably, should have been my starting point.

The initial attempt at a basic script is contained in `terp.py` while a package within this project, called _grueslayer_, will be a slightly more formal attempt.

Incidentally, the name "Entharion" refers to [Entharion the Wise](https://zork.fandom.com/wiki/Entharion_the_Wise), just to keep up the general theme. The reference to [Grueslayer](https://zork.fandom.com/wiki/Grueslayer) is done in a similar spirit.
