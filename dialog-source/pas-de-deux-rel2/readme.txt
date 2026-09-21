This archive contains the Dialog source code for Release 2 of Pas De Deux.

The code is known to work with version 0h/04 of the Dialog compiler, and
version 0.31 (included in the archive) of the Standard Library.

On the whole, I have tried to write well-structured, clean and readable code.
But my primary goal was to make a good game for IFComp---not necessarily to
create a worked example of how to program in Dialog.

Feel free to browse around, learn, and copy useful snippets. To the extent that
it is possible to separate code from narrative, all the code is free for
everybody to use (as in public domain).

If you would like to release a derivative work involving a substantial part of
the narrative, setting, or cast of characters, please get in touch first.

Linus

--

To build a .zblorb file (for use with any Z-machine interpreter):

	dialogc -c cover/pasdedeux.png -s -H 1400 -A 400 -L 200 pas-de-deux.dg stdlib.dg

To build an .aastory file (for the Aa-machine):

	dialogc -t aa -s -H 1400 -A 400 -L 200 pas-de-deux.dg stdlib.dg

The .aastory file can then be turned into a web directory (or, if you prefer, a
C64 disk image) using the Aa-machine tool kit:

	https://linusakesson.net/dialog/aamachine/index.php

--

Pas De Deux resources:

	https://linusakesson.net/games/pas-de-deux/index.php
	https://ifdb.tads.org/viewgame?id=zqz1rlcjx2slophj

--

The Dialog Standard Library (stdlib.dg) is redistributed under the following
(2-clause BSD) license:

Copyright 2018-2019 Linus Åkesson

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright
	notice, this list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright
	notice, this list of conditions and the following disclaimer in the
	documentation and/or other materials provided with the distribution.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
	IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
	TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
	PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
	HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
	SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
	LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
