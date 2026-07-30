
	.SEGMENT "TOWN"


	.FUNCT	RT-RM-MEADOW:ANY:0:1,CONTEXT,ANY?
	EQUAL?	CONTEXT,M-ENTER \?CCL3
	SET	'GL-PICTURE-NUM,K-PIC-MEADOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTERED \?CCL7
	FSET?	CH-I-KNIGHT,FL-LOCKED /FALSE
	EQUAL?	OHERE,RM-PAVILION /FALSE
	ZERO?	GL-PLAYER-FORM \FALSE
	ICALL2	THIS-IS-IT,CH-I-KNIGHT
	FSET?	RM-PAVILION,FL-LOCKED \?CCL16
	CALL	RT-MOVE-ALL-BUT-WORN,CH-PLAYER,CH-I-KNIGHT >ANY?
	PRINTI	"
You hear the thunder of approaching hooves, but see nothing. Moments later you feel ghostly fingers pluck at your clothing, and "
	ZERO?	ANY? /?CCL19
	BOR	GL-UPDATE-WINDOW,K-UPD-INVT >GL-UPDATE-WINDOW
	PRINTI	"everything you were carrying suddenly disappears. You"
	JUMP	?CND17
?CCL19:	PRINTI	"then"
?CND17:	PRINTI	" hear a ghostly "
	ZERO?	ANY? /?CCL22
	PRINTI	"chuckle,"
	JUMP	?CND20
?CCL22:	PRINTI	"voice say, ""Curses,"""
?CND20:	PRINTI	" and then the hoofbeats recede once again to the east.
"
	CALL	RT-META-IN?,TH-MAGIC-RING,CH-I-KNIGHT
	ZERO?	STACK /?CND23
	MOVE	TH-MAGIC-RING,RM-PAVILION
	FCLEAR	TH-MAGIC-RING,FL-INVISIBLE
	FCLEAR	TH-GLITTER,FL-INVISIBLE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-MAP \?CND23
	ICALL1	RT-UPDATE-MAP-WINDOW
?CND23:	IN?	TH-MAGIC-RING,RM-PAVILION \FALSE
	FSET?	RM-PAVILION,FL-LOCKED \FALSE
	ICALL2	THIS-IS-IT,TH-GLITTER
	CRLF	
	PRINT	K-GLITTER-MSG
	CRLF	
	RTRUE	
?CCL16:	PRINTR	"
You hear the thunder of approaching hooves and suddenly a knight on horseback pulls up next ot you. Startled that you can see him, he wheels his horse around, shouts, ""Tally ho!"" and gallops away again, leaving your possessions intact."
?CCL7:	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL33
	PRINTI	"You "
	EQUAL?	CONTEXT,M-F-LOOK \?CCL36
	PRINTI	"come to"
	JUMP	?CND34
?CCL36:	PRINTI	"are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
?CND34:	PRINTI	" a meadow. Paths lead off to the northeast, northwest, and southeast."
	FSET?	RM-PAVILION,FL-LOCKED /?CCL39
	PRINTI	" To the east you see a knight's pavilion."
	JUMP	?CND37
?CCL39:	IN?	TH-MAGIC-RING,RM-PAVILION \?CND37
	EQUAL?	CONTEXT,M-LOOK \?CND37
	PRINTC	32
	PRINT	K-GLITTER-MSG
?CND37:	CRLF	
	RFALSE	
?CCL33:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-MEADOW-UP:ANY:0:1,QUIET
	EQUAL?	GL-PLAYER-FORM,K-FORM-OWL /?CTR2
	RETURN	RM-MERPATH
?CTR2:	CALL2	RT-FLY-UP,QUIET
	RSTACK	


	.FUNCT	RT-ENTER-IPAVILION:ANY:0:1,QUIET
	FSET?	RM-PAVILION,FL-LOCKED /?PRD5
	RETURN	RM-PAVILION
?PRD5:	FSET?	RM-PAVILION,FL-TOUCHED /?CCL3
	EQUAL?	P-WALK-DIR,P?EAST \?CCL8
	IN?	TH-MAGIC-RING,RM-PAVILION \?CCL11
	RETURN	RM-PAVILION
?CCL11:	ZERO?	QUIET \FALSE
	PRINTI	"You walk around the eastern part of the meadow for a while, but you don't see anything interesting, so you return."
	CRLF	
	RFALSE	
?CCL8:	ZERO?	QUIET \FALSE
	ICALL1	RT-IMPOSSIBLE-MSG
	RFALSE	
?CCL3:	RETURN	RM-PAVILION

	.ENDSEG

	.SEGMENT "0"


	.FUNCT	RT-GN-MEADOW:ANY:2:2,TBL,FINDER
	RETURN	RM-MEADOW

	.ENDSEG

	.SEGMENT "TOWN"


	.FUNCT	RT-TH-GLITTER:ANY:0:1,CONTEXT
	IN?	TH-MAGIC-RING,RM-PAVILION /?CCL3
	CALL1	NP-CANT-SEE
	RSTACK	
?CCL3:	CALL1	TOUCH-VERB?
	ZERO?	STACK /?CCL5
	ICALL	RT-PRINT-OBJ,TH-GLITTER,K-ART-THE,TRUE-VALUE
	PRINTR	" is too far away."
?CCL5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	TH-GLITTER,FL-SEEN
	ICALL	RT-PRINT-OBJ,TH-GLITTER,K-ART-THE,TRUE-VALUE
	PRINTR	" is on the ground to the east."


	.FUNCT	RT-RM-PAVILION:ANY:0:3,CONTEXT,ART,CAP?,OBJ
	EQUAL?	CONTEXT,M-OBJDESC \?CCL3
	ZERO?	ART /?CND4
	ICALL	PRINT-ARTICLE,RM-PAVILION,ART,CAP?
?CND4:	EQUAL?	ART,FALSE-VALUE,K-ART-THE,K-ART-A /?CCL8
	EQUAL?	ART,K-ART-ANY \FALSE
?CCL8:	ZERO?	ART /?CND11
	PRINTC	32
?CND11:	FSET?	RM-PAVILION,FL-LOCKED \?CCL15
	PRINTI	"east meadow"
	RTRUE	
?CCL15:	PRINTI	"pavilion"
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,M-F-LOOK \?CCL17
	FSET?	RM-PAVILION,FL-LOCKED \?CCL20
	PRINTI	"You"
	ICALL1	RT-WALK-MSG
	PRINTI	" a little to the east."
	CRLF	
	RFALSE	
?CCL20:	EQUAL?	PRSA,V?WALK \?CCL23
	PRINTI	"You enter the"
	JUMP	?CND21
?CCL23:	PRINTI	"Suddenly you find yourself in the middle of a"
?CND21:	PRINTI	" knight's pavilion."
	PRINT	K-JUNK-SHOP-MSG
	CRLF	
	EQUAL?	PRSA,V?WALK /FALSE
	FSET?	CH-I-KNIGHT,FL-LOCKED /FALSE
	ICALL1	RT-KNIGHT-RETURN-STUFF
	CALL1	RT-KNIGHT-ASK
	RSTACK	
?CCL17:	EQUAL?	CONTEXT,M-V-LOOK,M-LOOK \?CCL30
	FSET?	RM-PAVILION,FL-LOCKED \?CCL33
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" at the eastern edge of"
	ICALL	RT-PRINT-OBJ,RM-MEADOW,K-ART-THE
	PRINTC	46
	CRLF	
	RFALSE	
?CCL33:	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE,STR?25
	ICALL1	RT-STANDING-MSG
	PRINTI	" in the knight's pavilion."
	PRINT	K-JUNK-SHOP-MSG
	CRLF	
	RFALSE	
?CCL30:	EQUAL?	CONTEXT,M-ENTER \?CCL35
	FSET?	RM-PAVILION,FL-LOCKED \?CCL38
	SET	'GL-PICTURE-NUM,K-PIC-MEADOW
	JUMP	?CND36
?CCL38:	SET	'GL-PICTURE-NUM,K-PIC-PAVILION
?CND36:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL35:	EQUAL?	CONTEXT,M-ENTERED \?CCL42
	FSET?	RM-PAVILION,FL-LOCKED /FALSE
	ZERO?	GL-PLAYER-FORM \?CCL47
	FSET?	CH-I-KNIGHT,FL-LOCKED /?CND48
	ICALL1	RT-KNIGHT-RETURN-STUFF
?CND48:	CALL1	RT-KNIGHT-ASK
	RSTACK	
?CCL47:	PRINTR	"
The knight doesn't even glance at you."
?CCL42:	EQUAL?	CONTEXT,M-END \?CCL51
	FSET?	RM-PAVILION,FL-LOCKED /FALSE
	EQUAL?	PRSA,V?TRANSFORM \FALSE
	EQUAL?	GL-PLAYER-FORM,GL-OLD-FORM /FALSE
	PRINTI	"
The knight notices your transformation and shrugs indifferently."
	CRLF	
	ZERO?	GL-PLAYER-FORM \FALSE
	FSET?	CH-I-KNIGHT,FL-LOCKED /?CND62
	ICALL1	RT-KNIGHT-RETURN-STUFF
?CND62:	CALL1	RT-KNIGHT-ASK
	RSTACK	
?CCL51:	ZERO?	CONTEXT \FALSE
	FSET?	RM-PAVILION,FL-LOCKED \?CCL67
	ZERO?	NOW-PRSI /?CCL73
	PUSH	2
	JUMP	?CND71
?CCL73:	PUSH	1
?CND71:	CALL2	EVERYWHERE-VERB?,STACK
	ZERO?	STACK \?CCL67
	CALL	NOUN-USED?,RM-PAVILION,W?PAVILION
	ZERO?	STACK /?CCL67
	CALL1	NP-CANT-SEE
	RSTACK	
?CCL67:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,RM-PAVILION /FALSE
	FSET?	RM-PAVILION,FL-LOCKED /?CCL80
	FSET	RM-PAVILION,FL-SEEN
	PRINTR	"It looks old and rundown, sort of like an old pawn shop."
?CCL80:	IN?	TH-MAGIC-RING,RM-PAVILION \FALSE
	FSET	TH-GLITTER,FL-SEEN
	PRINT	K-GLITTER-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-TH-COUNTER:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?LOOK-UNDER,V?LOOK-BEHIND \FALSE
	PRINTR	"You lean over the counter to take a look, but the invisible knight cuffs you on the side of the head and says, ""Employees only."""


	.FUNCT	RT-CH-I-KNIGHT:ANY:0:1,CONTEXT
	EQUAL?	PRSA,V?THANK,V?GOODBYE,V?HELLO \?CCL3
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL8
	PRINTR	"""Hello. Nice to see you again."""
?CCL8:	EQUAL?	PRSA,V?GOODBYE \?CCL10
	PRINTR	"The knight grunts a goodbye without even looking up."
?CCL10:	EQUAL?	PRSA,V?THANK \FALSE
	PRINTI	"""You're welcome."""
	CRLF	
	FSET?	CH-PLAYER,FL-AIR /TRUE
	FSET	CH-PLAYER,FL-AIR
	ICALL	RT-SCORE-MSG,10,0,0,0
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL16
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL19
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL19:	EQUAL?	PRSA,V?WHAT,V?WHO /FALSE
	EQUAL?	PRSA,V?NO,V?YES \?CCL25
	FSET?	TH-BRASS-EGG,FL-LOCKED /?CCL25
	PRINTI	"""You already have"
	ICALL	RT-PRINT-OBJ,TH-BRASS-EGG,K-ART-THE
	PRINTR	"."""
?CCL25:	EQUAL?	PRSA,V?YES \?CCL29
	CALL1	RT-QUIZ
	RSTACK	
?CCL29:	EQUAL?	PRSA,V?NO \?CCL31
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL31:	PRINTR	"He brushes you aside without really hearing what you said. ""Sorry, lad. Too busy at the moment."""
?CCL16:	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?TELL \?CCL37
	ZERO?	P-CONT \FALSE
?CCL37:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL41
	EQUAL?	PRSI,TH-BRASS-EGG \?CCL44
	PRINTI	"""It's a solid brass egg that is so real that a giant raven itself can't tell the difference between it and the real thing."
	FSET?	TH-BRASS-EGG,FL-LOCKED \?CCL47
	PRINTI	" Are you interested?"""
	CRLF	
	CALL2	YES?,TRUE-VALUE
	ZERO?	STACK /?CCL50
	CALL1	RT-QUIZ
	RSTACK	
?CCL50:	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL47:	PRINTR	""""
?CCL44:	EQUAL?	PRSI,CH-I-KNIGHT \?CCL52
	PRINTR	"""Oh, I do all right. Business is better in the summer, though."""
?CCL52:	EQUAL?	PRSI,CH-MERLIN \?CCL54
	PRINTR	"""He and I reached an understanding years ago. If I don't pick his pockets, then he won't turn me into a frog."""
?CCL54:	EQUAL?	PRSI,CH-LOT \?CCL56
	PRINTR	"""Tainted goods. I don't go near him, and neither should you."""
?CCL56:	EQUAL?	PRSI,TH-EXCALIBUR \?CCL58
	PRINTR	"""Bring it in. I may be able to get you a good price for it."""
?CCL58:	EQUAL?	PRSI,RM-PAVILION,GLOBAL-HERE \?CCL60
	PRINTR	"""It's a great location, but being invisible cuts down on the walk-in trade."""
?CCL60:	FSET?	PRSI,FL-ALIVE \?CCL63
	PRINTR	"""Sorry, I deal only in inanimate objects."""
?CCL63:	IN?	PRSI,CH-PLAYER /?CTR64
	IN?	PRSI,TH-COUNTER \?CCL65
?CTR64:	PRINTI	"The knight looks"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-THE
	PRINTR	" over dubiously. ""Hmmmm. Don't think it's worth much on the open market. Sorry."""
?CCL65:	PRINTI	"""I'd have to have a look at"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-HIM
	PRINTR	" to give you a good estimate."""
?CCL41:	EQUAL?	PRSA,V?EXAMINE \?CCL69
	FSET	CH-I-KNIGHT,FL-SEEN
	PRINTI	"He is a pleasant-looking fellow, although somewhat indistinct around the edges."
	CRLF	
	CALL	ADJ-USED?,CH-I-KNIGHT,W?INVISIBLE
	ZERO?	STACK /TRUE
	SET	'GL-QUESTION,1
	ICALL2	RT-AUTHOR-MSG,STR?373
	RTRUE	
?CCL69:	EQUAL?	PRSA,V?ATTACK \?CCL73
	ZERO?	GL-PLAYER-FORM \FALSE
	MOVE	CH-MERLIN,HERE
	PRINTI	"The knight suddenly disappears. Seconds later, you feel yourself being lifted up by the scruff of your neck and the seat of your pants, and then you find yourself sailing through the air and landing on the hard turf outside. A voice calls after you, ""And stay out!"" "
	PRINT	K-MERLIN-WASTED-MSG
	CRLF	
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL73:	EQUAL?	PRSA,V?LOOK-THRU \FALSE
	PRINTI	"You can see right through the knight."
	CRLF	
	CALL2	RT-AUTHOR-MSG,STR?374
	RSTACK	


	.FUNCT	RT-KNIGHT-RETURN-STUFF:ANY:0:0
	FSET	CH-I-KNIGHT,FL-LOCKED
	MOVE	CH-I-KNIGHT,RM-PAVILION
	PRINTI	"
The knight sitting behind the counter looks up suddenly and says, ""Oh! Hallo! Got one of those magic rings, have you? Well, I suppose you'll be wanting your things back."" He rummages around behind the counter and then "
	FIRST?	CH-I-KNIGHT \?CCL3
	ICALL	RT-MOVE-ALL,CH-I-KNIGHT,TH-COUNTER
	FSET?	CH-I-KNIGHT,FL-BROKEN \?CND4
	PRINTI	"says, ""Hmmm. I seem to have traded some of them away."" He brightens up, ""but the rest of them are here."" He "
?CND4:	PRINTR	"dumps the contents of a basket onto the counter. ""Here you are."""
?CCL3:	FSET?	CH-I-KNIGHT,FL-BROKEN \?CCL7
	PRINTR	"says, ""Hmmm. I seem to have traded them all away."""
?CCL7:	PRINTR	"says, ""That's funny. I don't seem to have anything for you."""


	.FUNCT	RT-KNIGHT-ASK:ANY:0:0
	CRLF	
	FSET?	TH-BRASS-EGG,FL-LOCKED \?CCL3
	FSET?	TH-BRASS-EGG,FL-BROKEN \?CCL6
	FCLEAR	TH-BRASS-EGG,FL-BROKEN
	PRINTI	"""I wonder if I could interest you in a solid brass giant raven's egg. It's so real that a giant raven itself can't tell the difference between it and the real thing. Are you interested?"""
	JUMP	?CND4
?CCL6:	PRINTI	"The knight looks up and says, ""Back again? Would you like to try for"
	ICALL	RT-PRINT-OBJ,TH-BRASS-EGG,K-ART-THE
	PRINTI	"?"""
?CND4:	CRLF	
	CALL2	YES?,TRUE-VALUE
	ZERO?	STACK /?CCL9
	ICALL1	RT-QUIZ
	RTRUE	
?CCL9:	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL3:	PRINTR	"The knight glances up as you enter and then returns to his work."


	.FUNCT	RT-QUIZ:ANY:0:0,VAL,I,N,PTR,WIN?
	FSET	CH-I-KNIGHT,FL-SEEN
	PRINTI	"
""All right then. I'm a sporting man. If you can tell me the next two letters in the following sequence, the egg is yours: ST ND RD TH."""
	CRLF	
?PRG1:	CALL1	READ-INPUT >VAL
	ADD	P-LEXV,2 >PTR
	GETB	P-LEXV,1 >N
	MUL	N,4
	ADD	PTR,STACK
	CALL	RT-CHECK-CURSES?,PTR,STACK
	ZERO?	STACK /?CCL5
	ICALL1	RT-CURSES
	SET	'WIN?,FALSE-VALUE
	JUMP	?CND3
?CCL5:	EQUAL?	N,1 \?CCL7
	GET	PTR,0
	EQUAL?	STACK,W?TH \?CCL7
	SET	'WIN?,TRUE-VALUE
	JUMP	?CND3
?CCL7:	GET	PTR,0
	EQUAL?	STACK,W?QUOTE \?CCL11
	ADD	PTR,4 >PTR
	GET	PTR,0
	EQUAL?	STACK,W?TH \?CND3
	EQUAL?	N,2 \?CCL16
	SET	'WIN?,TRUE-VALUE
	JUMP	?CND3
?CCL16:	ADD	PTR,4
	GET	STACK,0
	EQUAL?	STACK,W?QUOTE \?CND3
	EQUAL?	N,3 \?CND3
	SET	'WIN?,TRUE-VALUE
	JUMP	?CND3
?CCL11:	GET	PTR,0
	EQUAL?	STACK,W?SAY \?CND3
	ADD	PTR,4 >PTR
	GET	PTR,0
	EQUAL?	STACK,W?TH \?CCL23
	EQUAL?	N,2 \?CCL23
	SET	'WIN?,TRUE-VALUE
	JUMP	?CND3
?CCL23:	GET	PTR,0
	EQUAL?	STACK,W?QUOTE \?CND3
	ADD	PTR,4 >PTR
	GET	PTR,0
	EQUAL?	STACK,W?TH \?CND3
	EQUAL?	N,3 \?CCL31
	SET	'WIN?,TRUE-VALUE
	JUMP	?CND3
?CCL31:	EQUAL?	N,4 \?CND3
	ADD	PTR,4 >PTR
	GET	PTR,0
	EQUAL?	STACK,W?QUOTE \?CND3
	SET	'WIN?,TRUE-VALUE
?CND3:	ZERO?	WIN? /?CCL37
	CALL	RT-DO-TAKE,TH-BRASS-EGG,TRUE-VALUE
	ZERO?	STACK /TRUE
	FCLEAR	TH-BRASS-EGG,FL-LOCKED
	PRINTI	"""Yes. That's it. Very good. Here you are."" He hands you the brass egg."
	CRLF	
	ICALL2	RT-SCORE-OBJ,TH-BRASS-EGG
	RTRUE	
?CCL37:	PRINTI	"""Sorry."
	PRINTI	" Do you want to try again?"""
	CRLF	
	CALL2	YES?,TRUE-VALUE
	ZERO?	STACK /?REP2
	PRINTI	"""All right then. What is your next guess?"""
	CRLF	
	JUMP	?PRG1
?REP2:	PRINTR	"""Please do return when you have calculated the answer."""

	.ENDSEG

	.SEGMENT "0"


	.FUNCT	RT-TH-BRASS-EGG:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?SIT \?CCL5
	PRINTI	"You squat down on top of the egg, clucking to yourself occasionally and dutifully trying to fool the egg into thinking that you are a medieval hen. Unfortunately, this has no effect, other than to make you feel ridiculous, so after a while you get up."
	CRLF	
	SET	'GL-QUESTION,1
	CALL2	RT-AUTHOR-MSG,STR?279
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"It's a large, shiny egg made of solid brass."


	.FUNCT	RT-GN-EGG:ANY:2:2,TBL,FINDER,PTR,N,OBJ,I,O
	ADD	TBL,8 >PTR
	GET	TBL,1 >N
	INTBL?	P-IT-OBJECT,PTR,N \?CCL3
	SET	'OBJ,P-IT-OBJECT
	JUMP	?CND1
?CCL3:	GET	PARSE-RESULT,4
	EQUAL?	STACK,V?ASK-ABOUT \?CCL5
	EQUAL?	HERE,RM-PAVILION \?CCL5
	SET	'OBJ,TH-BRASS-EGG
	JUMP	?CND1
?CCL5:	SET	'I,N
?PRG8:	DLESS?	'I,0 /?CND1
	GET	PTR,0 >O
	FSET?	O,FL-SEEN \?CND10
	ZERO?	OBJ /?CCL16
	SET	'OBJ,FALSE-VALUE
?CND1:	ZERO?	OBJ \?CCL18
	RETURN	OBJ
?CCL16:	SET	'OBJ,O
?CND10:	ADD	PTR,2 >PTR
	JUMP	?PRG8
?CCL18:	PRINTC	91
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-THE,TRUE-VALUE
	PRINTC	93
	CRLF	
	RETURN	OBJ

	.ENDSEG

	.SEGMENT "OWL"


	.FUNCT	RT-RM-ABOVE-MEADOW:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	RM-MEADOW,FL-SEEN
	FSET	LG-FOREST,FL-SEEN
	FSET	RM-FIELD-OF-HONOR,FL-SEEN
	FSET	LG-TOWN,FL-SEEN
	FSET	RM-MOOR,FL-SEEN
	PRINTI	"You are hovering over the meadow. In the distance to the north you can see the trees at the edge of the enchanted forest. To the northwest, Merlin's hollow hill breaks the horizon. Below you to the south you see the field of honor, and to the east you see the town. If you followed the breeze northeast, you would be over the moor.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL5
	SET	'GL-PICTURE-NUM,K-PIC-AIR-SCENE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL5:	ZERO?	CONTEXT \FALSE
	RFALSE	

	.ENDSEG

	.ENDI
