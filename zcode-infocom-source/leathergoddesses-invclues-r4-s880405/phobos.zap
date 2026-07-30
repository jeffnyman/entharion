

	.FUNCT	CELL-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?BOARD,V?ENTER \?CCL3
	CALL2	ADJ-USED,W?OTHER
	ZERO?	STACK \?CTR5
	CALL2	ADJ-USED,W?SMALL
	ZERO?	STACK /?CCL6
?CTR5:	EQUAL?	HERE,OTHER-CELL \?CCL11
	PRINT	LOOK-AROUND
	RTRUE	
?CCL11:	EQUAL?	HERE,END-OF-HALLWAY \?CCL13
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?CCL13:	PRINT	CANT-FROM-HERE
	RTRUE	
?CCL6:	EQUAL?	HERE,CELL \?CCL15
	PRINT	LOOK-AROUND
	RTRUE	
?CCL15:	EQUAL?	HERE,END-OF-HALLWAY \?CCL17
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL17:	PRINT	CANT-FROM-HERE
	RTRUE	
?CCL3:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?CCL19
	CALL2	ADJ-USED,W?OTHER
	ZERO?	STACK \?CTR21
	CALL2	ADJ-USED,W?SMALL
	ZERO?	STACK /?CCL22
?CTR21:	EQUAL?	HERE,OTHER-CELL \?CCL27
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL27:	PRINT	LOOK-AROUND
	RTRUE	
?CCL22:	EQUAL?	HERE,CELL \?CCL29
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?CCL29:	EQUAL?	HERE,OTHER-CELL \?CCL31
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL31:	PRINT	LOOK-AROUND
	RTRUE	
?CCL19:	EQUAL?	PRSA,V?EXAMINE \?CCL33
	EQUAL?	HERE,END-OF-HALLWAY /?CCL33
	CALL1	V-LOOK
	RSTACK	
?CCL33:	EQUAL?	PRSA,V?CLOSE,V?OPEN,V?LOOK-INSIDE \?CCL37
	EQUAL?	HERE,END-OF-HALLWAY \?CCL40
	CALL2	ADJ-USED,W?OTHER
	ZERO?	STACK \?CTR42
	CALL2	ADJ-USED,W?SMALL
	ZERO?	STACK /?CCL43
?CTR42:	ICALL2	PERFORM-PRSA,NARROW-CELL-DOOR
	RTRUE	
?CCL43:	ICALL2	PERFORM-PRSA,WIDE-CELL-DOOR
	RTRUE	
?CCL40:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL47
	ICALL1	V-LOOK
	RTRUE	
?CCL47:	EQUAL?	HERE,CELL \?CCL49
	ICALL2	PERFORM-PRSA,WIDE-CELL-DOOR
	RTRUE	
?CCL49:	ICALL2	PERFORM-PRSA,NARROW-CELL-DOOR
	RTRUE	
?CCL37:	EQUAL?	PRSA,V?PUT \?CCL51
	EQUAL?	PRSI,CELL-OBJECT \?CCL51
	EQUAL?	HERE,END-OF-HALLWAY \?CCL56
	PRINT	CANT-FROM-HERE
	RTRUE	
?CCL56:	ICALL	PERFORM,V?DROP,PRSO
	RTRUE	
?CCL51:	EQUAL?	HERE,END-OF-HALLWAY /FALSE
	EQUAL?	PRSO,CELL-OBJECT \FALSE
	ICALL	PERFORM-PRSA,GLOBAL-ROOM,PRSI
	RTRUE	


	.FUNCT	CELL-F,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"You are in a large cell with a soft, cushiony floor. A wide door ("
	FSET?	WIDE-CELL-DOOR,OPENBIT \?CCL6
	PRINTI	"now open"
	JUMP	?CND4
?CCL6:	FSET?	WIDE-CELL-DOOR,TOUCHBIT \?CCL8
	PRINTI	"now closed"
	JUMP	?CND4
?CCL8:	PRINTI	"closed, naturally"
?CND4:	PRINTI	") forms the southern wall of the cell"
	ZERO?	HOLE-OPEN /?CND9
	PRINTI	". A "
	ICALL2	DPRINT,HOLE
	PRINTI	" is lying on the ground amidst some rubble"
?CND9:	PRINTC	46
	RTRUE	
?CCL3:	EQUAL?	RARG,M-END \?CCL12
	ZERO?	TRAY-DELIVERED \?CCL12
	SET	'TRAY-DELIVERED,TRUE-VALUE
	MOVE	TRAY,HERE
	PRINTI	"   Someone thrusts a tray into your cell. A "
	ICALL2	DPRINT,CHOCOLATE
	PRINTI	" on the tray"
	PRINT	LOOKS-UNAPPETIZING
	RTRUE	
?CCL12:	EQUAL?	RARG,M-END \FALSE
	IN?	SIDEKICK,HERE \FALSE
	ZERO?	CELL-GRIPE \FALSE
	SET	'CELL-GRIPE,TRUE-VALUE
	PRINTI	"   ""What a great cell!"" says "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	", looking around. ""Why didn't I get a cell like this? Maybe I shouldn't have kicked that guard "
	EQUAL?	NAUGHTY-LEVEL,1 \?CCL22
	PRINTI	"below the waist "
	JUMP	?CND20
?CCL22:	EQUAL?	NAUGHTY-LEVEL,2 \?CND20
	PRINTI	"in the nuts "
?CND20:	PRINTR	"when I first got here..."""


	.FUNCT	HOLE-ENTER-F
	ZERO?	HOLE-OPEN /?CCL3
	PRINT	YOU-CANT
	PRINTI	"reach the hole in the ceiling."
	CRLF	
	RFALSE	
?CCL3:	PRINT	CANT-GO
	RFALSE	


	.FUNCT	BLANKET-F
	FSET?	BLANKET,UNTEEDBIT /FALSE
	EQUAL?	PRSA,V?MEASURE \?CCL5
	PRINTR	"Small."
?CCL5:	EQUAL?	PRSA,V?WEAR /?CTR6
	EQUAL?	PRSA,V?WRAP \?CCL7
	EQUAL?	PRSI,ME \?CCL7
?CTR6:	PRINTR	"It's too small; your jailors must have meant it to be used as a pillow."
?CCL7:	EQUAL?	PRSA,V?BOARD \?CCL13
	CALL1	WASTES
	RSTACK	
?CCL13:	EQUAL?	PRSA,V?TIE \?CCL15
	PRINTR	"The material of the blanket is too thick to knot."
?CCL15:	EQUAL?	PRSA,V?TAKE,V?REMOVE \?CCL17
	IN?	BLANKET,BABY \?CCL17
	ICALL	PERFORM,V?REMOVE,BABY
	RTRUE	
?CCL17:	EQUAL?	PRSA,V?PUT \?CCL21
	EQUAL?	PRSI,BASKET \?CCL21
	IN?	BLANKET,BABY \?CCL26
	ICALL	PERFORM-PRSA,BABY,BASKET
	RTRUE	
?CCL26:	IN?	BABY,BASKET \FALSE
	MOVE	BLANKET,BASKET
	MOVE	BABY,PROTAGONIST
	ICALL	PERFORM-PRSA,BABY,BASKET
	RTRUE	
?CCL21:	EQUAL?	PRSA,V?THROW,V?PUT,V?DROP \?CCL30
	EQUAL?	PRSO,BLANKET \?CCL30
	IN?	BLANKET,BABY \?CCL30
	CALL2	DO-FIRST,STR?400
	RSTACK	
?CCL30:	EQUAL?	PRSA,V?LOOK-INSIDE \?CCL35
	IN?	BLANKET,BABY \?CCL35
	ICALL	PERFORM,V?ALARM,BABY
	RTRUE	
?CCL35:	EQUAL?	PRSA,V?PUT-ON \FALSE
	EQUAL?	PRSO,BLANKET \FALSE
	FSET?	PRSI,SURFACEBIT /FALSE
	CALL1	WASTES
	RSTACK	


	.FUNCT	PAINTING-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	PAINTING,UNTEEDBIT /FALSE
	SET	'AWAITING-REPLY,2
	ICALL	QUEUE,I-REPLY,2
	PRINTR	"It's a good likeness of a pussy, but is it art?"


	.FUNCT	TRAY-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET?	TRAY,UNTEEDBIT \FALSE
	PRINTR	"It looks a little like Ray whatsisname from second grade."


	.FUNCT	CHOCOLATE-F
	FSET?	CHOCOLATE,UNTEEDBIT /FALSE
	EQUAL?	PRSA,V?EAT \?CCL5
	CALL2	ULTIMATELY-IN?,CHOCOLATE
	ZERO?	STACK \?CND6
	PRINT	YNH
	PRINTR	" it!"
?CND6:	REMOVE	CHOCOLATE
	ICALL	QUEUE,I-UNRUSH,6
	ZERO?	GONE-APE /?CCL10
	SET	'SUGAR-RUSH,GORILLA-ATE-CHOCOLATE
	JUMP	?CND8
?CCL10:	SET	'SUGAR-RUSH,HUMAN-ATE-CHOCOLATE
?CND8:	PRINTI	"Mmmm! "
	ZERO?	CHOCOLATE-IDENTIFIED /?CCL13
	PRINTC	71
	JUMP	?CND11
?CCL13:	PRINTI	"It's a piece of really g"
?CND11:	PRINTR	"ood chocolate! You feel yourself getting a sugar rush."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \?CCL15
	PRINTI	"The "
	ICALL2	DPRINT,CHOCOLATE
	PRINT	LOOKS-UNAPPETIZING
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?TASTE \?CCL17
	SET	'CHOCOLATE-IDENTIFIED,TRUE-VALUE
	PUTP	CHOCOLATE,P?SDESC,STR?406
	RFALSE	
?CCL17:	EQUAL?	PRSA,V?SMELL \FALSE
	FSET?	CHOCOLATE,SMELLEDBIT /FALSE
	SET	'CHOCOLATE-IDENTIFIED,TRUE-VALUE
	FSET	CHOCOLATE,SMELLEDBIT
	PUTP	CHOCOLATE,P?SDESC,STR?406
	ICALL2	SCRATCH-N-SNIFF,2
	PRINTR	"Luscious, creamy milk chocolate!"


	.FUNCT	I-UNRUSH
	ZERO?	GONE-APE /?PRD5
	EQUAL?	SUGAR-RUSH,GORILLA-ATE-CHOCOLATE /?CTR2
?PRD5:	ZERO?	GONE-APE \?CCL3
	EQUAL?	SUGAR-RUSH,HUMAN-ATE-CHOCOLATE \?CCL3
?CTR2:	SET	'SUGAR-RUSH,FALSE-VALUE
	PRINTR	"   You feel the sugar rush ebb."
?CCL3:	SET	'SUGAR-RUSH,FALSE-VALUE
	RFALSE	


	.FUNCT	OTHER-CELL-F,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	FSET?	OTHER-CELL,TOUCHBIT /?CCL3
	ICALL2	THIS-IS-IT,SIDEKICK
	ICALL	QUEUE,I-BLUEPRINT,19
	ZERO?	VERBOSITY /FALSE
	PRINTI	"As you enter, a "
	ZERO?	MALE \?CND8
	PRINTI	"wo"
?CND8:	PRINTI	"man sitting limply in the shadows stiffens and rises to "
	ICALL1	HIS-HER
	PRINTI	" feet. ""A human! They got you too? I've been here a week. When you opened the door, I figured it was a guard! Was it unlocked? I never thought of trying it. By the way, my name's "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	". From Alaska. I'm not too bright, but I'm strong as an ox, and I'm great with my hands. Maybe we can lick these Leather Goddesses together."""
	CRLF	
	CRLF	
	RTRUE	
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are in a very tiny room with a rock-hard floor. A "
	PRINTD	NARROW-CELL-DOOR
	PRINTI	" to the north is "
	ICALL2	OPEN-CLOSED,NARROW-CELL-DOOR
	PRINTC	46
	RTRUE	


	.FUNCT	NARROW-CELL-DOOR-F
	EQUAL?	PRSA,V?KNOCK \FALSE
	IN?	SIDEKICK,OTHER-CELL \FALSE
	PRINTR	"A muffled voice responds, ""Beat it, you alien fruitcake freako mutant weirdo scum!"""


	.FUNCT	SIDEKICK-F,OARG
	ZERO?	OARG /?CCL3
	EQUAL?	OARG,M-OBJDESC? /TRUE
	PRINTI	"   "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" is here, "
	ICALL1	SIDEKICK-DESC
	PRINTC	46
	RTRUE	
?CCL3:	EQUAL?	SIDEKICK,WINNER \?CCL7
	EQUAL?	PRSA,V?WHAT \?CCL10
	ICALL	PERFORM,V?TELL-ABOUT,ME,PRSO
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?READ \?CCL12
	EQUAL?	PRSO,SCRAP-OF-PAPER \?CCL12
	ICALL	PERFORM,V?TELL-ABOUT,ME,SCRAP-OF-PAPER
	RTRUE	
?CCL12:	EQUAL?	PRSA,V?TELL-ABOUT \?CCL16
	EQUAL?	PRSO,ME \?CCL16
	EQUAL?	PRSI,ODD-MACHINE \?CCL21
	IN?	ODD-MACHINE,SALESMAN /?CCL21
	PRINTR	"""Hmmm, tee remover. For cleaning up golf courses?"""
?CCL21:	EQUAL?	PRSI,SCRAP-OF-PAPER \?CCL25
	PRINTR	"""I dunno what it means; I doodled it one night in my sleep!"""
?CCL25:	EQUAL?	PRSI,MATCHBOOK \?CCL27
	CALL2	QUEUED?,I-BLUEPRINT
	ZERO?	STACK \?CCL27
	CALL1	SCRAPE-UP-THESE-ITEMS
	RSTACK	
?CCL27:	EQUAL?	PRSI,LGOP \?CCL31
	PRINTR	"""No doubt some gang of interplanetary floozies who get their jollies from enslaving defenseless planets. We'll stop 'em!"""
?CCL31:	ICALL1	DPRINT-SIDEKICK
	PRINTI	" shrugs. ""What do I know? I'm from Alaska,"" "
	ICALL1	HE-SHE
	PRINTR	" says, in a burst of insecurity that will no doubt ease in a quarter century or so when Alaska becomes a state."
?CCL16:	EQUAL?	PRSA,V?WALK \?CCL33
	PRINTR	"""After you!"""
?CCL33:	EQUAL?	PRSA,V?FOLLOW \?CCL35
	EQUAL?	PRSO,ME \?CCL35
	PRINTR	"""Lead on!"""
?CCL35:	EQUAL?	PRSA,V?HELLO \?CCL39
	PRINTR	"""Hi!"""
?CCL39:	EQUAL?	PRSA,V?EXIT,V?ENTER,V?DISEMBARK \?CCL41
	EQUAL?	PRSO,WINDOW \?CCL41
	EQUAL?	HERE,BEDROOM \?CCL41
	ZERO?	SIDEKICK-TRIP-FLAG /?CCL47
	PRINTR	"""Not again!"""
?CCL47:	CALL2	QUEUED?,I-SIDEKICK-OUT-WINDOW
	ZERO?	STACK /?CCL49
	PRINTR	"""Gimme a second to get ready!"""
?CCL49:	PRINTR	"""I'm dumb, but not that dumb!"""
?CCL41:	EQUAL?	PRSA,V?KISS \?CCL51
	EQUAL?	PRSO,FROG \?CCL51
	PRINTR	"""I'd sooner kiss a pig!"""
?CCL51:	EQUAL?	PRSA,V?RAISE \?CCL55
	EQUAL?	PRSO,ME \?CCL55
	LOC	PROTAGONIST
	EQUAL?	STACK,TREE-HOLE,CLOSET \?CCL55
	SET	'WINNER,PROTAGONIST
	ICALL	PERFORM,V?CLIMB-ON,SIDEKICK
	SET	'WINNER,SIDEKICK
	RTRUE	
?CCL55:	EQUAL?	PRSA,V?TAKE \?CCL60
	EQUAL?	PRSO,HEADLIGHT \?CCL60
	FSET?	HEADLIGHT,TRYTAKEBIT \?CCL60
	SET	'WINNER,PROTAGONIST
	ICALL	PERFORM,V?SHOW,HEADLIGHT,SIDEKICK
	SET	'WINNER,SIDEKICK
	RTRUE	
?CCL60:	EQUAL?	PRSA,V?GIVE \?CCL65
	EQUAL?	PRSI,ME \?CCL65
	SET	'WINNER,PROTAGONIST
	ICALL	PERFORM,V?ASK-FOR,SIDEKICK,PRSO
	SET	'WINNER,SIDEKICK
	RTRUE	
?CCL65:	EQUAL?	PRSA,V?SGIVE /FALSE
	EQUAL?	PRSA,V?MAKE \?CCL71
	EQUAL?	PRSO,ANTI-LGOP-MACHINE \?CCL71
	PRINTR	"""Don't crowd me."""
?CCL71:	ICALL1	DPRINT-SIDEKICK
	PRINTI	" is "
	ICALL1	SIDEKICK-DESC
	PRINTI	" and fails to notice that you've spoken."
	CRLF	
	CALL1	STOP
	RSTACK	
?CCL7:	CALL	WRONG-SEX-WORD,SIDEKICK,W?TRENT,W?TIFFANY
	ZERO?	STACK /?CCL75
	CALL1	STOP
	RSTACK	
?CCL75:	CALL	WRONG-SEX-WORD,SIDEKICK,W?TRENT,W?TIFF
	ZERO?	STACK /?CCL77
	CALL1	STOP
	RSTACK	
?CCL77:	EQUAL?	PRSA,V?EXAMINE \?CCL79
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" is about your age"
	ZERO?	NAUGHTY-LEVEL /?CND80
	PRINTI	" and has a body worthy of envy: tall and well-built, with wide shoulders, "
	ZERO?	MALE /?CCL84
	PRINTI	"massive pectorals, and thick"
	JUMP	?CND82
?CCL84:	PRINTI	"a generous bosom, slim waist, and long"
?CND82:	PRINTI	", tawny legs. The only minus seems to be slightly oversized feet, but even oversized feet are a plus if you're into toe-sucking"
?CND80:	PRINTC	46
	FIRST?	SIDEKICK \?CCL87
	PRINTC	32
	RFALSE	
?CCL87:	CRLF	
	RTRUE	
?CCL79:	EQUAL?	PRSA,V?ASK-FOR \?CCL89
	EQUAL?	PRSO,SIDEKICK \?CCL89
	CALL	ULTIMATELY-IN?,PRSI,SIDEKICK
	ZERO?	STACK /?CCL94
	MOVE	PRSI,PROTAGONIST
	PRINTR	"""What's mine is yours!"""
?CCL94:	PRINTI	"""I haven't got"
	ICALL2	APRINT,PRSI
	PRINTR	"!"""
?CCL89:	EQUAL?	PRSA,V?FOLLOW \?CCL96
	EQUAL?	FOLLOW-FLAG,1 \?CCL99
	ICALL	PERFORM,V?CLIMB-DOWN,SHEET
	RTRUE	
?CCL99:	EQUAL?	FOLLOW-FLAG,2 \?CCL101
	PRINT	DONT-WANT-TO
	RTRUE	
?CCL101:	EQUAL?	FOLLOW-FLAG,3 \FALSE
	ICALL	PERFORM,V?ENTER,CANAL-OBJECT
	RTRUE	
?CCL96:	EQUAL?	PRSA,V?UNTIE \?CCL105
	ICALL2	PERFORM-PRSA,SIDEKICKS-BODY
	RTRUE	
?CCL105:	EQUAL?	PRSA,V?TIE \?CCL107
	EQUAL?	PRSI,SECOND-SLAB,FIRST-SLAB \?CCL107
	ICALL2	PERFORM-PRSA,SIDEKICKS-BODY
	RTRUE	
?CCL107:	EQUAL?	PRSA,V?STAND-ON,V?BOARD,V?CLIMB-ON \?CCL111
	IN?	PROTAGONIST,TREE-HOLE /?CTR113
	EQUAL?	HERE,CLOSET \?CCL114
	FIRST?	SHELF \?CCL114
?CTR113:	PRINTI	"Using "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	"'s shoulders, you "
	IN?	PROTAGONIST,TREE-HOLE \?CCL121
	MOVE	PROTAGONIST,HERE
	MOVE	SIDEKICK,HERE
	SET	'OHERE,FALSE-VALUE
	PRINTI	"climb out of the hole and help "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" out"
	JUMP	?CND119
?CCL121:	ICALL	ROB,SHELF,PROTAGONIST
	PRINTI	"get everything from the shelf"
?CND119:	PRINT	PERIOD-CR
	RTRUE	
?CCL114:	CALL1	WASTES
	RSTACK	
?CCL111:	EQUAL?	PRSA,V?PUSH \?CCL123
	EQUAL?	PRSI,TREE-HOLE \?CCL123
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" grabs wildly at you, pulling both of you into the hole"
	FSET?	TRELLIS,MUNGBIT \?CND126
	ZERO?	LEAVES-PLACED /?CND128
	MOVE	LEAVES,TREE-HOLE
?CND128:	REMOVE	TRELLIS
	ICALL1	UNDO-TRAP
	PRINTI	" with a crash of splintering wood"
?CND126:	PRINTI	". "
	IN?	FLYTRAP,TREE-HOLE \?CCL132
	ICALL	PERFORM,V?ENTER,TREE-HOLE
	RTRUE	
?CCL132:	MOVE	PROTAGONIST,TREE-HOLE
	MOVE	SIDEKICK,TREE-HOLE
	SET	'OHERE,FALSE-VALUE
	IN?	TRELLIS,PROTAGONIST \?CND133
	MOVE	TRELLIS,HERE
?CND133:	PRINTI	"""Brilliant move, bozo,"" says "
	ICALL1	DPRINT-SIDEKICK
	PRINT	PERIOD-CR
	RTRUE	
?CCL123:	EQUAL?	PRSA,V?GIVE \?CCL136
	EQUAL?	HERE,PLAZA \?CCL136
	SUB	PLAZA-COUNTER,1
	GET	PARTS-LIST,STACK
	EQUAL?	PRSO,STACK \?CCL141
	FSET?	PRSO,UNTEEDBIT /?CCL141
	REMOVE	PRSO
	SET	'RIGHT-PART,TRUE-VALUE
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" grabs"
	ICALL1	TPRINT-PRSO
	PRINTI	" and quickly incorporates it into "
	ICALL1	HIS-HER
	PRINTI	" contraption."
	CRLF	
	RETURN	8
?CCL141:	ICALL1	DPRINT-SIDEKICK
	PRINTI	" gives"
	ICALL1	TPRINT-PRSO
	PRINTI	" the barest glance. ""No good! It has to be a"
	ICALL1	PRINT-PART
	PRINTI	"!"""
	CRLF	
	RETURN	8
?CCL136:	EQUAL?	PRSA,V?GIVE \?CCL147
	INTBL?	PRSO,PARTS-LIST,8 \?CCL147
	FSET?	PRSO,UNTEEDBIT /?CCL147
	ICALL1	EAGERLY-ACCEPTS
	PRINT	PERIOD-CR
	RTRUE	
?CCL147:	EQUAL?	PRSA,V?SHOW \FALSE
	EQUAL?	PRSO,HEADLIGHT \?CCL155
	FSET?	HEADLIGHT,TRYTAKEBIT \?CCL155
	PRINTR	"""Can't reach it from here!"""
?CCL155:	EQUAL?	PRSO,SCRAP-OF-PAPER \?CCL159
	ICALL	PERFORM,V?ASK-ABOUT,SIDEKICK,SCRAP-OF-PAPER
	RTRUE	
?CCL159:	INTBL?	PRSO,PARTS-LIST,8 \FALSE
	FSET?	PRSO,UNTEEDBIT /FALSE
	PRINTI	"""Hey, wow!"" says "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	", clearly impressed by your discovery of"
	CALL2	TRPRINT,PRSO
	RSTACK	


	.FUNCT	SIDEKICK-DESC
	GRTR?	PLAZA-COUNTER,0 \?CCL3
	PRINTI	"busy with"
	CALL2	TPRINT,ANTI-LGOP-MACHINE
	RSTACK	
?CCL3:	EQUAL?	HERE,BOUDOIR \?CCL5
	PRINTI	"lying on another couch"
	RTRUE	
?CCL5:	RANDOM	100
	LESS?	33,STACK /?CCL7
	PRINTI	"alertly surveying your surroundings"
	RTRUE	
?CCL7:	RANDOM	100
	LESS?	50,STACK /?CCL9
	ZERO?	SIDEKICKS-BODY-TIED-TO-SLAB \?CCL9
	PRINTI	"doing some quick limbering exercises"
	RTRUE	
?CCL9:	PRINTI	"counting on "
	ICALL1	HIS-HER
	PRINTI	" fingers and mumbling to "
	ICALL1	HIM-HER
	PRINTI	"self"
	RTRUE	


	.FUNCT	GENERIC-SIDEKICK-F
	GET	P-NAMW,0
	EQUAL?	STACK,W?BODY /FALSE
	GET	P-NAMW,1
	EQUAL?	STACK,W?BODY /FALSE
	RETURN	SIDEKICK


	.FUNCT	MEMORIAM
	PRINTI	", "
	PRINTD	EYES
	PRINTI	" fill with tears. You hang "
	PRINTD	HEAD
	PRINTI	" in sorrow for a moment to honor your brave, loyal companion who gave "
	ICALL1	HIS-HER
	PRINTI	" life that humanity might be safe from the terrible scourge of "
	PRINTD	LGOP
	PRINT	PERIOD-CR
	RTRUE	


	.FUNCT	SCRAP-OF-PAPER-F
	EQUAL?	PRSA,V?READ \FALSE
	PRINTI	"There's a seemingly meaningless matrix of letters on the paper:"
	CRLF	
	GET	0,8
	BOR	STACK,2
	PUT	0,8,STACK
	PRINTI	"   HESOHREBBUR
   ILSSSIPNGEF
   RGIUGHTHDEN
   SNKOOBENOHP
   FALYTMERATP
   SHEADLIGHTO
   SLLABNOTTOC
"
	GET	0,8
	BAND	STACK,-3
	PUT	0,8,STACK
	RTRUE	


	.FUNCT	CRAMPED-SPACE-F,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	ZERO?	HOLE-OPEN \?CCL3
	CALL	QUEUE,I-CRAMPED-SPACE,2
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are in a dark space, too tiny to move around in. The"
	ZERO?	HOLE-OPEN /?CCL10
	PRINTI	" only exit is a hole in the floor."
	RTRUE	
?CCL10:	PRINTI	"re are no visible exits."
	RTRUE	


	.FUNCT	I-CRAMPED-SPACE
	PRINTI	"   Suddenly, part of the floor collapses, and you"
	ICALL1	AND-SIDEKICK
	PRINTI	" tumble through the resulting hole"
	PRINT	ELLIPSIS
	ICALL	GOTO,CELL,TRUE-VALUE
	IN?	SIDEKICK,CRAMPED-SPACE \?CND1
	MOVE	SIDEKICK,HERE
?CND1:	SET	'HOLE-OPEN,TRUE-VALUE
	FCLEAR	CRAMPED-SPACE,TOUCHBIT
	PRINTI	"   Among the new rubble, you notice"
	ICALL2	APRINT,HOLE
	PRINTI	", attached to a piece of (what used to be) the floor of the cramped space."
	CRLF	
	ICALL2	CELL-F,M-END
	RTRUE	


	.FUNCT	CRAMPED-SPACE-HOLE-F
	ZERO?	HOLE-OPEN \?CCL3
	CALL2	CANT-SEE,CRAMPED-SPACE-HOLE
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?ENTER,V?STAND-ON,V?CLIMB-DOWN /?CCL5
	EQUAL?	PRSA,V?BOARD \FALSE
?CCL5:	CALL2	DO-WALK,P?DOWN
	RSTACK	


	.FUNCT	END-OF-HALLWAY-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"A "
	PRINTD	WIDE-CELL-DOOR
	PRINTI	" lies "
	ICALL2	OPEN-CLOSED,WIDE-CELL-DOOR
	PRINTI	" to the north, and"
	ICALL2	APRINT,NARROW-CELL-DOOR
	PRINTI	" lies "
	ICALL2	OPEN-CLOSED,NARROW-CELL-DOOR
	PRINTI	" to the south. The hallway ends at a gleaming "
	PRINTD	EXAM-ROOM-DOOR
	PRINTI	" to the west, and continues east. Something, possibly this very sentence, tells you that it would be dangerous to travel east or west"
	PRINT	SIGN-AND-STAIRS
	RTRUE	


	.FUNCT	EXAMINATION-ROOM-DESC,VIEWING
	PRINTI	"A number of hideous experiments fill th"
	ZERO?	VIEWING /?CCL3
	PRINTC	101
	JUMP	?CND1
?CCL3:	PRINTI	"is"
?CND1:	PRINTI	" room. Their obvious purpose: studies of the human anatomy"
	EQUAL?	NAUGHTY-LEVEL,1 /?CND4
	PRINTI	", especially those parts rarely referred to in the New York Times"
?CND4:	PRINTI	". A pathetic-looking human is the current subject; however, even an author as fond of lascivious detail as this one would hesitate to describe it "
	EQUAL?	NAUGHTY-LEVEL,2 \?CCL8
	PRINTR	"even in LEWD mode, except to mention that it involves a lot of lubricants, some plastic tubing, and a yak."
?CCL8:	PRINTI	"to someone who's merely in "
	ZERO?	NAUGHTY-LEVEL \?CCL11
	PRINTI	"TAME"
	JUMP	?CND9
?CCL11:	PRINTI	"SUGGESTIVE"
?CND9:	PRINTR	" mode."


	.FUNCT	EXAMINATION-ROOM-F
	FSET?	EXAM-ROOM-DOOR,OPENBIT \?CCL3
	PRINTI	"""Examination"" Room
   "
	ZERO?	SEEN-EXAMINATION-ROOM /?CCL6
	PRINTI	"The experiments look even more horrible from here than from the Observation Room window."
	CRLF	
	JUMP	?CND4
?CCL6:	ICALL1	EXAMINATION-ROOM-DESC
?CND4:	PRINTI	"   Before you've really gotten as sick as you know you could get, one of the"
	CALL1	LECKBANDI
	RSTACK	
?CCL3:	ICALL2	THIS-IS-IT,EXAM-ROOM-DOOR
	ICALL	DO-FIRST,STR?67,EXAM-ROOM-DOOR
	RFALSE	


	.FUNCT	OTHER-END-OF-HALLWAY-F
	PRINTI	"Other End of Hallway
   Before you can even begin to wonder what happened to the middle of the hallway, a guard patrol erupts from the shadows. A"
	CALL1	LECKBANDI
	RSTACK	


	.FUNCT	LECKBANDI
	CALL2	JIGS-UP,STR?408
	RSTACK	


	.FUNCT	OBSERVATION-ROOM-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Calvin Coolidge once described windows as ""rectangles of glass."" If so, he may have been thinking about the window which fills the western wall of this room. A tiny closet lies to the north"
	PRINT	SIGN-AND-STAIRS
	RTRUE	


	.FUNCT	CLOSET-F,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This room is barely large enough to turn around in. Just to prove it, you turn around. As you do, you spot"
	ICALL2	APRINT,HOLE
	PRINTI	", about two feet across, seemingly painted on the floor in the corner. A shelf protrudes from one wall, very close to the ceiling. The closet is open to the south."
	FSET?	NOSE,MUNGBIT /TRUE
	PRINTI	" A strong odor "
	FSET?	HERE,SMELLEDBIT \?CND6
	PRINTI	"of "
	PRINTD	MOTHBALLS
	PRINTC	32
?CND6:	PRINTI	"pervades the closet."
	RTRUE	
?CCL3:	EQUAL?	RARG,M-SMELL \FALSE
	PRINTI	"Apparently this section of Phobos has a significant moth problem."
	RTRUE	


	.FUNCT	CLOSET-EXIT-F
	PRINTI	"Ah! Coming out of the closet, I see"
	PRINT	ELLIPSIS
	RETURN	OBSERVATION-ROOM


	.FUNCT	CLOSET-OBJECT-F
	EQUAL?	PRSA,V?BOARD,V?WALK-TO,V?ENTER \?CCL3
	EQUAL?	HERE,CLOSET \?CCL6
	PRINT	LOOK-AROUND
	RTRUE	
?CCL6:	EQUAL?	HERE,OBSERVATION-ROOM \FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?CCL10
	EQUAL?	HERE,CLOSET \?CCL13
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?CCL13:	PRINT	LOOK-AROUND
	RTRUE	
?CCL10:	EQUAL?	PRSA,V?CLOSE,V?OPEN \?CCL15
	PRINTR	"No door."
?CCL15:	EQUAL?	PRSA,V?SMELL \?CCL17
	EQUAL?	HERE,CLOSET \?CCL17
	ICALL2	PERFORM-PRSA,ODOR
	RTRUE	
?CCL17:	EQUAL?	PRSA,V?SEARCH \?CCL21
	PRINT	NOTHING-NEW
	RTRUE	
?CCL21:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	EQUAL?	HERE,CLOSET \?CCL26
	CALL1	V-LOOK
	RSTACK	
?CCL26:	PRINT	ONLY-BLACKNESS
	RTRUE	


	.FUNCT	SHELF-F
	EQUAL?	PRSA,V?PUT,V?PUT-ON \FALSE
	EQUAL?	PRSI,SHELF \FALSE
	IN?	PROTAGONIST,STOOL /FALSE
	CALL2	CANT-REACH,SHELF
	RSTACK	


	.FUNCT	BASKET-F
	FSET?	BASKET,UNTEEDBIT /FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"The basket is oval-shaped. A handle spans the narrow part."
?CCL5:	EQUAL?	PRSA,V?MEASURE \?CCL7
	PRINTR	"The basket is about fifteen by thirty inches."
?CCL7:	EQUAL?	PRSA,V?CLOSE \?CCL9
	CALL1	NO-LID
	RSTACK	
?CCL9:	EQUAL?	PRSA,V?PUT-NEAR,V?PUT \?CCL11
	EQUAL?	PRSI,ORPHANAGE-DOOR \?CCL11
	ICALL	PERFORM,V?PUT-ON,BASKET,FRONT-STOOP
	RTRUE	
?CCL11:	CALL2	TAKE-BABY-FROM-STOOP,BASKET
	ZERO?	STACK \TRUE
	RFALSE	


	.FUNCT	TAKE-BABY-FROM-STOOP,OBJ
	EQUAL?	PRSA,V?TAKE \FALSE
	EQUAL?	PRSO,OBJ \FALSE
	CALL2	QUEUED?,I-ORPHANAGE
	ZERO?	STACK /FALSE
	CALL2	CCOUNT,PROTAGONIST
	LESS?	STACK,11 \FALSE
	ICALL2	DEQUEUE,I-ORPHANAGE
	RFALSE	


	.FUNCT	MOTHBALLS-F
	EQUAL?	HERE,CLOSET \FALSE
	PRINT	YOU-CANT-SEE-ANY
	PRINTD	MOTHBALLS
	PRINTR	" here. It must be some imitation mothball air mist."


	.FUNCT	ROOF-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Your view extends to the horizon, which on tiny Phobos usually means a few hundred feet. Thrusting up into sight beyond the horizon are"
	PRINT	PLEASURE-PALACE-DESC
	PRINTD	LGOP
	PRINTI	". On a wide plain between here and the palace, powerful warships are poised for the imminent invasion of Earth.
   Mars dominates the view, a dull red orb spanning a quarter of the sky. Bright blue canals lace the surface, and white caps of ice are visible at both poles.
   A stairway leads down into the building. Near the edge, seemingly painted onto the roof, is"
	ICALL2	APRINT,HOLE
	PRINTI	". You might be able to jump to the ground, but frankly we advise against it."
	RTRUE	


	.FUNCT	ROOF-OBJECT-F
	EQUAL?	PRSA,V?DISEMBARK,V?LEAP-OFF /?CTR2
	EQUAL?	PRSA,V?TAKE-OFF \?CCL3
	EQUAL?	P-PRSA-WORD,W?GET \?CCL3
?CTR2:	SET	'PRSO,FALSE-VALUE
	CALL1	V-LEAP
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL9
	CALL1	V-LOOK
	RSTACK	
?CCL9:	EQUAL?	PRSA,V?SEARCH \FALSE
	PRINT	NOTHING-NEW
	RTRUE	


	.FUNCT	I-BLUEPRINT
	CALL2	VISIBLE?,SIDEKICK
	ZERO?	STACK /?CCL3
	CALL2	LIT?,HERE
	ZERO?	STACK /?CCL3
	LOC	SIDEKICK
	EQUAL?	STACK,SECOND-SLAB,STALLION /?CCL3
	CALL2	QUEUED?,I-SIDEKICK-OUT-WINDOW
	ZERO?	STACK \?CCL3
	MOVE	MATCHBOOK,PROTAGONIST
	PRINTI	"   "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" trots over to you. ""I've got a plan to bring these Leather Goddess jokers to their knees,"" "
	ICALL1	HE-SHE
	PRINTI	" says, flipping you a "
	PRINTD	MATCHBOOK
	PRINTI	". "
	ICALL1	COVER-FILLED-WITH-NOTES
	CALL1	SCRAPE-UP-THESE-ITEMS
	RSTACK	
?CCL3:	ICALL	QUEUE,I-BLUEPRINT,3
	RFALSE	


	.FUNCT	SCRAPE-UP-THESE-ITEMS
	PRINTI	"""If we can scrape up these items, I can whip up something that'll knock 'em cold! A "
	PRINTD	ANTI-LGOP-MACHINE
	PRINTR	"!!!"""


	.FUNCT	MATCHBOOK-F
	FSET?	MATCHBOOK,UNTEEDBIT /FALSE
	EQUAL?	PRSA,V?KILL \?CCL5
	EQUAL?	P-PRSA-WORD,W?STRIKE \?CCL5
	ICALL	PERFORM,V?ON,MATCHBOOK
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?LOOK-INSIDE,V?COUNT,V?OPEN /?CTR8
	EQUAL?	PRSA,V?ON \?CCL9
?CTR8:	PRINTI	"You briefly open the "
	PRINTD	MATCHBOOK
	PRINTR	" and see that there are no matches left."
?CCL9:	EQUAL?	PRSA,V?CLOSE \?CCL13
	PRINT	ALREADY-IS
	RTRUE	
?CCL13:	EQUAL?	PRSA,V?READ \?CCL15
	PRINTI	"Most of the scrawlings are a ""blueprint"" for a vastly complicated device. Below that is a parts list:
   1."
	ICALL2	APRINT,BLENDER
	PRINTI	"
   2. six feet of "
	PRINTD	RUBBER-HOSE
	PRINTI	"
   3. a "
	PRINTD	COTTON-BALLS
	PRINTI	"
   4. an "
	PRINTD	EIGHTY-TWO-DEGREE-ANGLE
	PRINTI	"
   5. a "
	PRINTD	HEADLIGHT
	PRINTI	" from any 1933 Ford
   6. a white mouse
   7. any size "
	ICALL2	DPRINT,PHOTO
	PRINTI	"
   8. a copy of"
	ICALL2	TPRINT,PHONE-BOOK
	CRLF	
	RTRUE	
?CCL15:	EQUAL?	PRSA,V?EXAMINE \FALSE
	ICALL1	COVER-FILLED-WITH-NOTES
	ICALL	PERFORM,V?OPEN,MATCHBOOK
	RTRUE	


	.FUNCT	COVER-FILLED-WITH-NOTES
	PRINTI	"The cover of the "
	PRINTD	MATCHBOOK
	PRINTI	" is filled with scrawled notations. "
	RTRUE	


	.FUNCT	BOUDOIR-F,RARG
	EQUAL?	RARG,M-ENTER \?CCL3
	MOVE	PROTAGONIST,DIVAN
	SET	'OHERE,FALSE-VALUE
	CALL	QUEUE,I-BOUDOIR,6
	RSTACK	
?CCL3:	EQUAL?	RARG,M-LOOK \?CCL5
	PRINTI	"There is only enough light here to make out vague shapes. "
	IN?	PROTAGONIST,DIVAN \?CND6
	PRINTI	"You seem to be lying on a plush divan. "
?CND6:	ICALL1	NOT-ALONE-ON-DIVAN
	FSET?	NOSE,MUNGBIT /TRUE
	PRINTI	" A pleasing odor "
	FSET?	HERE,SMELLEDBIT \?CND10
	PRINTI	"of leather "
?CND10:	PRINTI	"comes from close by."
	RTRUE	
?CCL5:	EQUAL?	RARG,M-SMELL \FALSE
	PRINTI	"Someone nearby is wearing leather. Lots of leather."
	RTRUE	


	.FUNCT	NOT-ALONE-ON-DIVAN
	PRINTI	"You hear heavy breathing from nearby"
	IN?	PROTAGONIST,DIVAN \?CND1
	PRINTI	", and realize that you are not alone on the couch"
?CND1:	PRINTC	46
	RTRUE	


	.FUNCT	I-BOUDOIR,NOT-CALLED-BY-FUCK
	ASSIGNED?	'NOT-CALLED-BY-FUCK /?CND1
	SET	'NOT-CALLED-BY-FUCK,TRUE-VALUE
?CND1:	PRINTI	"   You hear a click, and "
	IN?	PROTAGONIST,HERE /?CND3
	PRINTI	"leap to your feet as "
?CND3:	PRINTI	"the room is flooded with light!

"
	PRINTD	HERE
	PRINTI	"
   Oh, no! You have violated the sanctity of a boudoir! And not just any old boudoir, but an"
	PRINT	PRIVATE-BOUDOIR
	PRINTI	"! And not just any old"
	PRINT	PRIVATE-BOUDOIR
	PRINTI	", but an"
	PRINT	PRIVATE-BOUDOIR
	PRINTI	" belonging to "
	PRINTD	LGOP
	PRINTI	"!
   ""The escaped prisoner"
	CALL2	VISIBLE?,SIDEKICK
	ZERO?	STACK /?CND5
	PRINTC	115
?CND5:	PRINTI	"!"" cries one of "
	PRINTD	LGOP
	PRINTI	". ""Sound the alarm!""
   ""Inform the guards!"" yells another.
   ""Call out the army!""
   ""Alert the space fleet!""
   ""Summon my masseur,"" says the single unfrantic Goddess, calmly pulling a lever. As the floor opens up, you"
	ICALL1	AND-SIDEKICK
	PRINTI	" plunge down a long chute"
	PRINT	ELLIPSIS
	ICALL	INCREMENT-SCORE,9,13
	ICALL	GOTO,PLAZA,TRUE-VALUE
	CALL	ULTIMATELY-IN?,SIDEKICK,BOUDOIR
	ZERO?	STACK /?CND7
	MOVE	SIDEKICK,PLAZA
?CND7:	ZERO?	NOT-CALLED-BY-FUCK /TRUE
	EQUAL?	PRSA,V?WAIT /TRUE
	ICALL2	PLAZA-F,M-END
	RTRUE	


	.FUNCT	LGOP-F
	EQUAL?	LGOP,WINNER \?CCL3
	EQUAL?	PRSA,V?KISS \?CCL6
	EQUAL?	PRSO,ME \?CCL6
	SET	'WINNER,PROTAGONIST
	ICALL2	PERFORM-PRSA,LGOP
	SET	'WINNER,LGOP
	RTRUE	
?CCL6:	EQUAL?	PRSA,V?TAKE,V?FUCK \?CCL10
	EQUAL?	PRSO,ME \?CCL10
	SET	'WINNER,PROTAGONIST
	ICALL	PERFORM,V?FUCK,LGOP
	SET	'WINNER,LGOP
	RTRUE	
?CCL10:	ZERO?	NAUGHTY-LEVEL \?CCL14
	PRINT	LEAVE-ME-ALONE
	RTRUE	
?CCL14:	PRINTI	"""Shut up and kiss me, honey."""
	CRLF	
	CALL1	STOP
	RSTACK	
?CCL3:	EQUAL?	PRSA,V?EXAMINE \?CCL16
	PRINTI	"The lighting is too dim to see more than vague shapes."
	ZERO?	NAUGHTY-LEVEL /?CND17
	PRINTR	" But very shapely shapes!"
?CND17:	CRLF	
	RTRUE	
?CCL16:	EQUAL?	PRSA,V?KISS,V?FUCK,V?TOUCH \?CCL20
	ZERO?	NAUGHTY-LEVEL \?CCL20
	PRINTI	"You're pushed away. "
	PRINT	LEAVE-ME-ALONE
	RTRUE	
?CCL20:	EQUAL?	PRSA,V?EAT \?CCL24
	ZERO?	NAUGHTY-LEVEL \?CCL27
	CALL1	V-FUCK
	RSTACK	
?CCL27:	EQUAL?	NAUGHTY-LEVEL,1 \?CCL29
	PRINT	MISSIONARY-ONLY
	RTRUE	
?CCL29:	PRINTR	"As you dive between her thighs, she arches toward you, shivering with hedonistic pleasure."
?CCL24:	EQUAL?	PRSA,V?TOUCH \?CCL31
	PRINTI	"Your arms discover a soft and eager body. You hear a purr of pleasure"
	EQUAL?	NAUGHTY-LEVEL,2 \?CND32
	ICALL	BODIES-PRESS-TOGETHER,STR?415,STR?416
?CND32:	PRINT	PERIOD-CR
	RTRUE	
?CCL31:	EQUAL?	PRSA,V?KISS \?CCL35
	PRINTI	"Your lips meet those of your couchmate -- full, moist lips; the lips of someone who knows how to kiss"
	EQUAL?	NAUGHTY-LEVEL,2 \?CND36
	PRINTI	". A tongue slides teasingly into "
	PRINTD	MOUTH
	ICALL	BODIES-PRESS-TOGETHER,STR?417,STR?418
?CND36:	CALL2	VISIBLE?,SIDEKICK
	ZERO?	STACK /?CND38
	PRINT	PERIOD-CR
	PRINTI	"   You hear a ""thunk"" as "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	", humping enthusiastically, falls off "
	ICALL1	HIS-HER
	PRINTI	" couch"
?CND38:	PRINT	PERIOD-CR
	RTRUE	
?CCL35:	EQUAL?	PRSA,V?SMELL \?CCL41
	ICALL2	PERFORM-PRSA,ODOR
	RTRUE	
?CCL41:	EQUAL?	PRSA,V?FUCK \FALSE
	PRINTI	"Your couchmate seems only too happy to oblige. You flush with passion"
	EQUAL?	NAUGHTY-LEVEL,2 \?CND44
	ICALL	BODIES-PRESS-TOGETHER,STR?419,STR?416
?CND44:	PRINTI	". Suddenly..."
	CRLF	
	ICALL2	DEQUEUE,I-BOUDOIR
	CALL2	I-BOUDOIR,FALSE-VALUE
	RSTACK	


	.FUNCT	BODIES-PRESS-TOGETHER,VERB-STRING,NOUN-STRING
	MOVE	PROTAGONIST,DIVAN
	SET	'OHERE,FALSE-VALUE
	PRINTI	" as your two bodies draw closer together on the divan"
	ZERO?	MALE \FALSE
	ZERO?	DISCOVERED \FALSE
	SET	'DISCOVERED,TRUE-VALUE
	PRINTI	". You discover, much to your surprise, that you are "
	PRINT	VERB-STRING
	PRINTI	" a woman. Even more surprising, your misgivings are swept away by the heady pleasure of the soft, full "
	PRINT	NOUN-STRING
	PRINTI	" pressing against your own"
	RTRUE	


	.FUNCT	PLAZA-F,RARG
	EQUAL?	RARG,M-LOOK \?CCL3
	PRINTI	"This is a wide plaza between"
	PRINT	PLEASURE-PALACE-DESC
	PRINTD	LGOP
	PRINTI	". It is a lovely, bucolic area of gushing fountains, curving flower beds, and lawns of thick, green grass. Birds fly amongst the trees, singing peacefully, as baby squirrels hop across the lawn, lazily collecting nuts."
	RTRUE	
?CCL3:	EQUAL?	RARG,M-SMELL \?CCL5
	PRINTI	"Through the smoke of battle, you see a banana peel squirt from"
	ICALL2	TPRINT,ANTI-LGOP-MACHINE
	PRINTC	46
	RTRUE	
?CCL5:	EQUAL?	RARG,M-END \FALSE
	INC	'PLAZA-COUNTER
	PRINTI	"   "
	EQUAL?	PLAZA-COUNTER,1 \?CCL10
	PRINTI	"A half-megaton grenade explodes nearby as the palace guards attempt to repel "
	IN?	SIDEKICK,HERE \?CCL13
	PRINTI	"some"
	JUMP	?CND11
?CCL13:	PRINTI	"an"
?CND11:	PRINTI	" unwanted intruder"
	IN?	SIDEKICK,HERE \?CND14
	PRINTC	115
?CND14:	PRINTI	" (namely: you"
	ICALL1	AND-SIDEKICK
	PRINTI	")."
	CRLF	
	JUMP	?CND8
?CCL10:	EQUAL?	PLAZA-COUNTER,2 \?CCL17
	PRINTI	"The guards now have reinforcements: a row of imposing radium-powered tanks are rolling towards you."
	CRLF	
	JUMP	?CND8
?CCL17:	EQUAL?	PLAZA-COUNTER,3 \?CCL19
	PRINTI	"Giant berserk robotoid sumo wrestlers, each madly waving about three dozen samurai swords, are now storming across the plaza at you."
	CRLF	
	JUMP	?CND8
?CCL19:	EQUAL?	PLAZA-COUNTER,4 \?CCL21
	PRINTI	"With a swooping roar, the"
	PRINT	ATTACK-FLEET
	PRINTI	" of "
	PRINTD	LGOP
	PRINTI	" joins the attack. Several nearby trees are suddenly vaporized."
	CRLF	
	JUMP	?CND8
?CCL21:	EQUAL?	PLAZA-COUNTER,5 \?CCL23
	PRINTI	"The palace guards are setting up a massive dematerialization ray. Closer by, a sumo-robot discovers a boulder in its path, and a large quantity of gravel is created."
	CRLF	
	JUMP	?CND8
?CCL23:	EQUAL?	PLAZA-COUNTER,6 \?CCL25
	PRINTI	"A Phobosian Chomper is faster than a cheetah, meaner than a Tyrannosaurus Rex, bigger than a sperm whale, and as hungry as the state of Texas. We mention this because fifty of them just entered the plaza and spotted you."
	CRLF	
	JUMP	?CND8
?CCL25:	EQUAL?	PLAZA-COUNTER,7 \?CCL27
	PRINTI	"Several fifty-foot craters appear as the"
	PRINT	ATTACK-FLEET
	PRINTI	" begins lobbing ion bombs. As they veer around for a more precise attack, the tanks close in, and you realize that each one is larger than the Upper Sandusky City Hall."
	CRLF	
	JUMP	?CND8
?CCL27:	EQUAL?	PLAZA-COUNTER,8 \?CCL29
	PRINTI	"A couple of buildings behind you silently vanish, indicating that the palace guards are better at assembling a death ray than at aiming it. However, in sixty centuries of repelling intruders, they've never missed twice. Meanwhile, one of the Chompers has stopped to swallow a herd of goats that was grazing nearby, thus slowing it down for a full tenth of a second."
	CRLF	
	JUMP	?CND8
?CCL29:	EQUAL?	PLAZA-COUNTER,9 \?CCL31
	PRINTI	"The guards have finished aiming the death ray, and have begun the activation sequence. The ground quakes as the berserko robotoids plow through the rubble toward you; the wind from their whirling swords knocks over a few trees. The tanks loom above you, their gun turrets blocking out the sun. Beyond them, the"
	PRINT	ATTACK-FLEET
	PRINTI	" is sweeping in for a final attack."
	CRLF	
	JUMP	?CND8
?CCL31:	EQUAL?	PLAZA-COUNTER,10 \?CND8
	ICALL2	JIGS-UP,STR?421
?CND8:	CALL2	VISIBLE?,SIDEKICK
	ZERO?	STACK /TRUE
	PRINTI	"   "
	ICALL1	DPRINT-SIDEKICK
	EQUAL?	PLAZA-COUNTER,1 \?CCL37
	MOVE	ANTI-LGOP-MACHINE,HERE
	PRINTI	" shouts, ""Okay, this is it!"
	FIRST?	SIDEKICK \?CCL40
	ICALL	ROB,SIDEKICK,PROTAGONIST
	PRINTI	""" "
	ICALL2	HE-SHE,TRUE-VALUE
	PRINTI	" hands you everything "
	ICALL1	HE-SHE
	PRINTI	"'s carrying. """
	JUMP	?CND38
?CCL40:	PRINTC	32
?CND38:	PRINTI	"Gotta start building that "
	PRINTD	ANTI-LGOP-MACHINE
	PRINTI	"! "
	JUMP	?CND35
?CCL37:	PRINTI	", hammering and twiddling madly at the growing machine, yells, """
	ZERO?	RIGHT-PART /?CCL43
	PRINTI	"Okay, things are going "
	SUB	PLAZA-COUNTER,2
	GET	HYPE-WORD,STACK
	PRINT	STACK
	PRINTI	"! "
	JUMP	?CND41
?CCL43:	SUB	PLAZA-COUNTER,2
	GET	PARTS-LIST,STACK >MISSING-PART
	PRINTI	"Well, I'll try and work around the missing "
	EQUAL?	MISSING-PART,PHOTO \?CCL46
	GETP	PHOTO,P?SDESC
	PRINT	STACK
	JUMP	?CND44
?CCL46:	PRINTD	MISSING-PART
?CND44:	PRINTI	". "
?CND41:	EQUAL?	PLAZA-COUNTER,9 \?CND35
	PRINTI	"There! I think it's all done. Cross your fingers, kiddo!"" "
	ICALL2	HE-SHE,TRUE-VALUE
	PRINTI	" switches on the device. Amidst showers of sparks, a powerful electric arc bridges two electrodes. The machine shudders, and "
	ZERO?	MISSING-PART /?CCL51
	PRINTI	"awe-inspiring rays of raw plasma begin shooting in every direction. You and "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	" dive to the ground. Crashing spaceships collide with careening robotoid monsters; the tanks, inches before pancaking you, become pools of molten metal. A stray plasma ray strikes the only remaining tree in the plaza, and you are fatally wounded as a coconut drops onto "
	PRINTD	HEAD
	PRINTI	". The last sound you hear is "
	ICALL1	DPRINT-SIDEKICK
	PRINTI	"'s voice, saying,"
	ICALL1	EXPLETIVE
	PRINTI	"I was going to use that "
	EQUAL?	MISSING-PART,PHOTO \?CCL54
	GETP	PHOTO,P?SDESC
	PRINT	STACK
	JUMP	?CND52
?CCL54:	PRINTD	MISSING-PART
?CND52:	PRINTI	" to build a coconut deflector."""
	CRLF	
	JUMP	?CND49
?CCL51:	PRINTI	"you "
	FSET?	NOSE,MUNGBIT \?CCL57
	PRINTI	"see"
	JUMP	?CND55
?CCL57:	PRINTI	"smell"
?CND55:	PRINTI	" something yellow shoot from the machine."
	FSET?	NOSE,MUNGBIT \?CCL60
	PRINTI	" It's a banana peel!"
	CRLF	
	JUMP	?CND58
?CCL60:	CRLF	
	ICALL	PERFORM,V?SMELL,ODOR
?CND58:	PRINTI	"   The peel lands a few feet away, as the "
	PRINTD	ANTI-LGOP-MACHINE
	PRINTI	" gives one final shudder and self-destructs in an orgy of flames and shrapnel!
   The attacking forces continue to close, and certain death is only seconds away when one of the Chompers, loping toward you at nearly Mach One, steps on the banana peel, and slips a few inches to one side before righting itself. This is enough, however, to nudge a tank into a crater, tripping one of the samurai robots!
   More and more of the attacking forces plow into the mess in the crater, like some improbably fantastical football tackle. A stray grenade lands right in its midst, and the resulting plume of debris shears the fins off the leading warship. Your heart leaps as the entire"
	PRINT	ATTACK-FLEET
	PRINTI	" of "
	PRINTD	LGOP
	PRINTI	" plummets toward the ground. The mass of flaming metal strikes the ground, and a tremendous explosion knocks you senseless!

   Eventually, daylight intrudes upon your senselessness and illuminates a sleepy-looking gas station. You are lying at the edge of a dusty road, once again wearing your comfortable old overalls. Though dirty, dishevelled, and bleeding from a few superficial cuts, you are nevertheless aglow in the knowledge that Earth is safe from the threat of "
	PRINTD	LGOP
	PRINTI	".
   As "
	PRINTD	HEAD
	PRINTI	" clears, three uniformed "
	ZERO?	MALE /?CCL63
	PRINTI	"girls come bounc"
	JUMP	?CND61
?CCL63:	PRINTI	"guys come pound"
?CND61:	PRINTI	"ing out of the service station toward you. ""Oh, my goodness,"" they "
	ZERO?	MALE /?CCL66
	PRINTI	"coo"
	JUMP	?CND64
?CCL66:	PRINTI	"call out"
?CND64:	PRINTI	", in perfect unison. ""Are you all right?""

   Coming soon from Infocom: GAS PUMP GIRLS MEET THE PULSATING INCONVENIENCE FROM PLANET X."
	CRLF	
	SET	'RANK,9
	SET	'EXT-MAX,INT-MAX
?CND49:	ICALL1	FINISH
?CND35:	PRINTI	"Hand me a"
	ICALL1	PRINT-PART
	PRINTI	"."""
	CRLF	
	SET	'RIGHT-PART,FALSE-VALUE
	CALL2	THIS-IS-IT,SIDEKICK
	RSTACK	


	.FUNCT	PRINT-PART,NEXT-PART
	SUB	PLAZA-COUNTER,1
	GET	PARTS-LIST,STACK >NEXT-PART
	ICALL2	THIS-IS-IT,NEXT-PART
	EQUAL?	NEXT-PART,EIGHTY-TWO-DEGREE-ANGLE \?CCL3
	PRINTI	"n "
	JUMP	?CND1
?CCL3:	PRINTC	32
?CND1:	EQUAL?	NEXT-PART,PHOTO \?CCL6
	GETP	PHOTO,P?SDESC
	PRINT	STACK
	RTRUE	
?CCL6:	PRINTD	NEXT-PART
	RTRUE	


	.FUNCT	GENERIC-MACHINE-F,NUM
	CALL1	CANAL-LOC >NUM
	EQUAL?	HERE,CANAL \?CCL3
	GRTR?	NUM,31 /?CTR2
	LESS?	NUM,13 \?CCL3
?CTR2:	RETURN	ODD-MACHINE
?CCL3:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL9
	CALL2	VISIBLE?,ODD-MACHINE
	ZERO?	STACK /?CCL12
	RETURN	ODD-MACHINE
?CCL12:	RETURN	ANTI-LGOP-MACHINE
?CCL9:	EQUAL?	SIDEKICK,WINNER \FALSE
	CALL2	QUEUED?,I-BLUEPRINT
	ZERO?	STACK \FALSE
	RETURN	ANTI-LGOP-MACHINE

	.ENDI
