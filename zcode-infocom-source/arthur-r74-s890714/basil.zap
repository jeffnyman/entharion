
	.SEGMENT "DEMON"


	.FUNCT	RT-RM-BAS-LAIR:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND4
?CCL6:	PRINTI	"The tunnel widens out into"
?CND4:	PRINTI	" a chamber full of grotesque statues. Upon closer examination, you realize with horror that they are knights who have been turned into stone. The tunnel takes a turn to the "
	EQUAL?	OHERE,RM-HOT-ROOM \?CCL9
	PRINTI	"sou"
	JUMP	?CND7
?CCL9:	PRINTI	"nor"
?CND7:	PRINTI	"theast"
	IN?	CH-BASILISK,RM-BAS-LAIR \?CND10
	FSET	CH-BASILISK,FL-SEEN
	ICALL2	THIS-IS-IT,CH-BASILISK
	FSET?	CH-BASILISK,FL-ALIVE \?CCL14
	PRINTI	", but the passage into the mountain is blocked by a sleeping basilisk"
	JUMP	?CND10
?CCL14:	PRINTI	", and in the middle of the room is a basilisk made of solid stone"
?CND10:	PRINTC	46
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL16
	SET	'GL-PICTURE-NUM,K-PIC-BASILISK-LAIR
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL16:	EQUAL?	CONTEXT,M-ENTERED \?CCL20
	IN?	CH-BASILISK,RM-BAS-LAIR \FALSE
	FSET?	CH-BASILISK,FL-ALIVE \FALSE
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BASILISK-1,STACK
	ICALL2	THIS-IS-IT,CH-BASILISK
	PRINTR	"
The noise of your entry awakens the basilisk, who begins to cast around bleary-eyed for the source of the sound."
?CCL20:	EQUAL?	CONTEXT,M-BEG \?CCL27
	EQUAL?	PRSA,V?TELL \?CCL30
	ZERO?	P-CONT \FALSE
?CCL30:	CALL1	SPEAKING-VERB?
	ZERO?	STACK /FALSE
	FSET?	CH-BASILISK,FL-ALIVE \FALSE
	ICALL2	THIS-IS-IT,CH-BASILISK
	PRINTR	"Making noise only seems to help the basilisk find you faster."
?CCL27:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-EXIT-BAS-LAIR:ANY:0:1,QUIET
	FSET?	CH-BASILISK,FL-ALIVE /?PRD5
	RETURN	RM-HOT-ROOM
?PRD5:	ZERO?	QUIET \?CCL3
	PRINTI	"As you try to step over"
	ICALL	RT-PRINT-OBJ,CH-BASILISK,K-ART-THE
	PRINTI	", it looks up at you and you are turned to stone in mid-step. You topple to the floor and shatter, although by the time you hit the ground you are too dead to care.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL3:	RETURN	RM-HOT-ROOM


	.FUNCT	RT-PS-STATUES:ANY:0:3,CONTEXT,ART,CAP?
	FSET	PSEUDO-OBJECT,FL-PLURAL
	FCLEAR	PSEUDO-OBJECT,FL-VOWEL
	EQUAL?	CONTEXT,M-OBJDESC \?CCL3
	ZERO?	ART /?CND4
	ICALL	PRINT-ARTICLE,PSEUDO-OBJECT,ART,CAP?
?CND4:	EQUAL?	ART,FALSE-VALUE,K-ART-THE,K-ART-A /?CCL8
	EQUAL?	ART,K-ART-ANY \FALSE
?CCL8:	ZERO?	ART /?CND11
	PRINTC	32
?CND11:	PRINTI	"statues"
	RTRUE	
?CCL3:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-CH-BASILISK:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-WINNER \?CCL3
	FSET?	CH-BASILISK,FL-ALIVE \FALSE
	ICALL2	THIS-IS-IT,CH-BASILISK
	PRINTR	"Making noise only seems to help the basilisk find you faster."
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?TELL \?CCL10
	ZERO?	P-CONT \FALSE
?CCL10:	CALL1	TOUCH-VERB?
	ZERO?	STACK /?CCL14
	FSET?	CH-BASILISK,FL-ALIVE \?CCL14
	PRINTI	"As you approach"
	ICALL	RT-PRINT-OBJ,CH-BASILISK,K-ART-THE
	PRINTI	", it looks up at you and you are turned to stone in mid-step. You topple to the floor and shatter, although by the time you hit the ground you are too dead to care.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL14:	EQUAL?	PRSA,V?TAKE \?CCL18
	ICALL	RT-PRINT-OBJ,CH-BASILISK,K-ART-THE,TRUE-VALUE
	PRINTR	" is firmly rooted to the floor of the cave."
?CCL18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	CH-BASILISK,FL-SEEN
	ICALL	RT-PRINT-OBJ,CH-BASILISK,K-ART-THE,TRUE-VALUE
	PRINTI	" looks like either a large lizard or a small dragon."
	FSET?	CH-BASILISK,FL-ALIVE /?CND21
	PRINTR	" It has turned to solid stone."
?CND21:	CRLF	
	RTRUE	


	.FUNCT	RT-I-BASILISK-1:ANY:0:0
	EQUAL?	HERE,RM-BAS-LAIR \FALSE
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BASILISK-2,STACK
	PRINTR	"
The basilisk turns towards you. Its glance is about to fall upon you."


	.FUNCT	RT-I-BASILISK-2:ANY:0:0
	EQUAL?	HERE,RM-BAS-LAIR \FALSE
	PRINTI	"
The basilisk's eye falls upon you and suddenly your feet feel very cold. Glancing down, you see with horror that they have turned to stone. The deadening sensation quickly works its way up your legs. A terrified cry forms in your throat, but it never makes it out of your mouth. In an instant, the petrification is complete.
"
	CALL1	RT-END-OF-GAME
	RSTACK	


	.FUNCT	RT-KILL-BASILISK:ANY:0:0
	FCLEAR	CH-BASILISK,FL-ALIVE
	ICALL2	RT-DEQUEUE,RT-I-BASILISK-1
	ICALL2	RT-DEQUEUE,RT-I-BASILISK-2
	ICALL2	THIS-IS-IT,CH-BASILISK
	PRINTI	"The glint of the highly-polished shield attracts the basilisk's attention. Slowly it turns its head towards you, and then suddenly it catches a glimpse of its own reflection. The life immediately drains out of the creature, and you realize with fascination that it has turned itself into stone.
"
	ICALL	RT-SCORE-MSG,0,2,5,2
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \TRUE
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	

	.ENDSEG

	.ENDI
