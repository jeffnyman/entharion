
	.SEGMENT "LAKE"


	.FUNCT	RT-RM-FIELD-OF-HONOR:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-SHALLOWS \?CCL9
	PRINTI	"You climb up out of the water and are now in"
	JUMP	?CND4
?CCL9:	EQUAL?	OHERE,RM-ABOVE-FIELD \?CCL11
	PRINTI	"You float down into"
	JUMP	?CND4
?CCL11:	PRINTI	"You enter"
?CND4:	FSET	RM-ISLAND,FL-SEEN
	PRINTI	" the Field of Honor. To the south is a lake with an island in the middle of it. To the east is a causeway leading to the island. The meadow lies to the northwest.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-BEG \?CCL13
	IN?	CH-LOT,RM-FIELD-OF-HONOR \FALSE
	EQUAL?	PRSA,V?WALK \?CCL19
	FSET?	CH-LOT,FL-LOCKED \?CCL22
	FSET?	CH-LOT,FL-BROKEN \?CCL22
	FSET?	RM-MID-LAKE,FL-WATER /?CCL22
	EQUAL?	P-WALK-DIR,P?SOUTH /FALSE
?CCL22:	PRINTR	"The mob blocks your path. Out of the corner of your eye, you catch occasional glimpses of the invisible knight picking pockets at the edge of the crowd."
?CCL19:	FSET?	CH-LOT,FL-BROKEN /?CCL28
	FSET?	CH-LOT,FL-LOCKED /?CCL28
	EQUAL?	PRSA,V?YELL \?CCL33
	PRINTR	"You cry out, but fail to break Lot's concentration. He re-doubles his efforts and drives you back."
?CCL33:	EQUAL?	PRSA,V?THROW,V?DROP \FALSE
	EQUAL?	PRSO,TH-BRACELET \FALSE
	CALL1	RT-DISTRACT-LOT
	RSTACK	
?CCL28:	FSET?	CH-LOT,FL-LOCKED \FALSE
	FSET?	CH-LOT,FL-BROKEN /FALSE
	EQUAL?	PRSA,V?DROP,V?UNWEAR \?PRD45
	EQUAL?	PRSO,TH-SWORD /?CCL40
?PRD45:	EQUAL?	PRSA,V?RELEASE,V?SPARE \FALSE
	EQUAL?	PRSO,CH-LOT \FALSE
?CCL40:	FSET	CH-LOT,FL-BROKEN
	ICALL2	RT-DEQUEUE,RT-I-LOT-TRICK
	PRINTI	"You remove your sword. King Lot kneels at your feet and thanks you, swearing eternal loyalty."
	CRLF	
	CALL	RT-SCORE-MSG,10,0,0,0
	RSTACK	
?CCL13:	EQUAL?	CONTEXT,M-END \?CCL51
	IN?	CH-LOT,RM-FIELD-OF-HONOR \FALSE
	EQUAL?	PRSA,V?TRANSFORM \?CCL56
	EQUAL?	GL-PLAYER-FORM,GL-OLD-FORM /?CCL56
	FSET?	CH-LOT,FL-LOCKED \?CCL61
	FSET?	CH-LOT,FL-BROKEN \?CCL61
	PRINTI	"
The mob recoils in horror for a moment, and then they close in and kill you.
"
	JUMP	?CND59
?CCL61:	FSET?	CH-LOT,FL-LOCKED \?CCL65
	PRINTI	"
Lot picks up his sword and runs you through.
"
	JUMP	?CND59
?CCL65:	PRINTI	"
Lot never hesitates for a second. He runs you through with his sword.
"
?CND59:	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL56:	FSET?	CH-LOT,FL-BROKEN /FALSE
	EQUAL?	PRSA,V?THROW,V?DROP \?PRD71
	EQUAL?	PRSO,TH-SHIELD,TH-SWORD /?CCL67
?PRD71:	EQUAL?	PRSA,V?UNWEAR \FALSE
	EQUAL?	PRSO,TH-ARMOUR \FALSE
?CCL67:	PRINTI	"
Lot immediately presses home his advantage and kills you.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL51:	EQUAL?	CONTEXT,M-ENTER \?CCL77
	SET	'GL-PICTURE-NUM,K-PIC-FIELD
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL77:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-ENTER-SHALLOWS:ANY:0:1,QUIET
	EQUAL?	GL-PLAYER-FORM,K-FORM-BADGER,K-FORM-OWL,K-FORM-SALAMANDER \?CCL3
	ZERO?	QUIET \FALSE
	PRINT	K-WOULD-DROWN-MSG
	RFALSE	
?CCL3:	FSET?	RM-MID-LAKE,FL-WATER /?CCL7
	RETURN	RM-MID-LAKE
?CCL7:	RETURN	RM-SHALLOWS


	.FUNCT	RT-TRIGGER-ENDGAME:ANY:0:0
	MOVE	CH-LOT,RM-FIELD-OF-HONOR
	MOVE	CH-COURTIERS,RM-FIELD-OF-HONOR
	FSET	CH-COURTIERS,FL-COLLECTIVE
	ICALL2	RT-DEQUEUE,RT-I-SOLDIER-ASK
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-FIGHT,STACK
	PRINTI	"As you approach the throne, Lot's soldiers close around you. Suddenly, however, they see the gauntlet and draw back, allowing you to step forward to deliver your challenge.

Anger flashes in the evil king's eyes. ""Enough!"" he cries. ""This stripling has impugned the honor of the king. He must answer for it on the Field of Honor.""

He stands up and stalks out of the Great Hall. His guards seize you and strip you of everything you were carrying"
	IN?	TH-SWORD,CH-PLAYER \?CCL3
	PRINTI	" except your sword,"
	JUMP	?CND1
?CCL3:	PRINTI	". They thrust a sword into your hand"
?CND1:	ICALL2	RT-MOVE-ALL-BUT-WORN,CH-PLAYER
	ICALL	RT-DO-TAKE,TH-SWORD,TRUE-VALUE
	PRINTI	" and then they force-march you along behind Lot. The entourage sweeps out of the Castle, into the town, and south to the Field of Honor. Townspeople follow the procession, and by the time the guards turn you loose, you face King Lot man to man, surrounded by a cheering mob.
"
	ICALL	RT-SCORE-MSG,10,0,0,5
	SET	'OHERE,HERE
	MOVE	CH-PLAYER,RM-FIELD-OF-HONOR
	SET	'HERE,RM-FIELD-OF-HONOR
	SET	'GL-PICTURE-NUM,K-PIC-LOT-FIGHT
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \?CCL6
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL6:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \?CCL8
	ICALL1	RT-UPDATE-PICT-WINDOW
	RTRUE	
?CCL8:	EQUAL?	GL-WINDOW-TYPE,K-WIN-MAP \TRUE
	ICALL1	RT-UPDATE-MAP-WINDOW
	RTRUE	


	.FUNCT	RT-I-FIGHT:ANY:0:0
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-FIGHT,STACK
	INC	'GL-FIGHT-CNT
	ZERO?	GL-CLK-RUN /?CND1
	CRLF	
?CND1:	LESS?	GL-FIGHT-CNT,4 \?CCL5
	PRINTI	"The two of you trade blows. Lot attacks with intense concentration."
	EQUAL?	GL-FIGHT-CNT,1 \?CND6
	PRINTR	" He appears to be a slightly better swordsman than you."
?CND6:	CRLF	
	RTRUE	
?CCL5:	PRINTI	"Lot finds a fatal weakness in your defense and runs you through with his sword. You fall to the ground, and as your life's blood slowly drains away, the crowd cheers Lot's victory. He stands over your prostrate body and proclaims, ""Let this be a warning to all who would challenge the honor of the High King.""
"
	CALL1	RT-END-OF-GAME
	RSTACK	


	.FUNCT	RT-I-LOT-WIN:ANY:0:0
	FSET?	CH-LOT,FL-LOCKED /FALSE
	PRINTI	"
Lot picks up"
	ICALL	RT-PRINT-OBJ,TH-BRACELET,K-ART-THE
	PRINTI	", thanks you, and then runs you through.
"
	CALL1	RT-END-OF-GAME
	RSTACK	


	.FUNCT	RT-DISTRACT-LOT:ANY:0:0
	ICALL2	RT-DEQUEUE,RT-I-FIGHT
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-LOT-WIN,STACK
	FSET	CH-LOT,FL-BROKEN
	MOVE	TH-BRACELET,HERE
	FCLEAR	TH-BRACELET,FL-WORN
	BOR	GL-UPDATE-WINDOW,3 >GL-UPDATE-WINDOW
	PRINTI	"As you handle"
	ICALL	RT-PRINT-OBJ,TH-BRACELET,K-ART-THE
	PRINTI	", you pretend to let it slip through your fingers and drop it on"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTR	". Lot's concentration is broken. His eyes widen at the sight of the gold and he stoops to pick it up."


	.FUNCT	RT-I-LOT-TRICK:ANY:0:0
	CRLF	
	PRINTI	"Your attention is distracted by something at the edge of the crowd. Lot seizes the moment to leap up, knock your sword aside and run you through."
	CRLF	
	CALL1	RT-END-OF-GAME
	RSTACK	


	.FUNCT	RT-I-OUT-OF-TIME:ANY:0:0
	CRLF	
	EQUAL?	HERE,RM-GREAT-HALL \?CCL3
	PRINTI	"Lot rises from his throne and declares, ""It is time."" He strides from the hall, followed by his courtiers."
	PRINT	K-MOMENTS-LATER-MSG
	PRINT	K-REALIZE-MSG
	JUMP	?CND1
?CCL3:	EQUAL?	HERE,RM-PARADE-AREA,RM-CASTLE-GATE,RM-TOWN-SQUARE \?CCL5
	PRINT	K-PARADE-MSG
	PRINTI	"emerges from the castle and makes its way to the churchyard."
	PRINT	K-MOMENTS-LATER-MSG
	PRINT	K-REALIZE-MSG
	JUMP	?CND1
?CCL5:	EQUAL?	HERE,RM-CHURCHYARD \?CCL7
	PRINT	K-PARADE-MSG
	PRINTI	"enters the churchyard, and you become the unwilling witness to his coronation on the church steps. After the cheering crowds leave, you are once again alone."
	JUMP	?CND1
?CCL7:	EQUAL?	HERE,RM-FIELD-OF-HONOR,RM-SHALLOWS,RM-MID-LAKE \?CCL9
	IN?	CH-LOT,TH-LOT-THRONE /?CCL9
	PRINTI	"Suddenly, a great cheer goes up from the crowd. ""The time of coronation has come! King Lot shall be our High King."" They hoist Lot on their shoulders and carry him away to be coronated."
	JUMP	?CND1
?CCL9:	PRINTI	"In the distance, you hear the"
	PRINT	K-REALIZE-MSG
?CND1:	CRLF	
	CALL1	RT-END-OF-GAME
	RSTACK	

	.SEGMENT "TOWN"


	.FUNCT	RT-TH-STONE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?RAISE,V?MOVE,V?TAKE \?CCL7
	ICALL	RT-PRINT-OBJ,TH-STONE,K-ART-THE,TRUE-VALUE
	PRINTR	" is too heavy to move."
?CCL7:	EQUAL?	PRSA,V?LOOK-ON,V?EXAMINE \?CCL9
	FSET	TH-STONE,FL-SEEN
	ICALL2	THIS-IS-IT,TH-STONE
	ICALL2	THIS-IS-IT,TH-SWORD
	PRINTR	"It is a large stone that has a jewelled sword protruding from it."
?CCL9:	EQUAL?	PRSA,V?BREAK \FALSE
	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE
	PRINTI	" can't break"
	ICALL	RT-PRINT-OBJ,TH-STONE,K-ART-THE
	PRINTR	"."

	.SEGMENT "STARTUP"

	.ENDSEG

	.SEGMENT "LAKE"

	.SEGMENT "TOWN"


	.FUNCT	RT-TH-EXCALIBUR:ANY:0:1,CONTEXT,N,?TMP2,?TMP1
	EQUAL?	PRSA,V?READ,V?LOOK-ON,V?EXAMINE \?CCL3
	FSET	TH-EXCALIBUR,FL-SEEN
	ICALL2	THIS-IS-IT,TH-EXCALIBUR
	PRINTI	"The magnificent, jewelled sword has runes on the shaft that read, """
	PRINT	K-WHOSO-PULLETH-MSG
	PRINTR	"."""
?CCL3:	EQUAL?	PRSA,V?RAISE,V?MOVE,V?TAKE \?CCL5
	EQUAL?	WINNER,CH-PLAYER /?CCL8
	CALL1	RT-YOU-CANT-MSG
	RSTACK	
?CCL8:	FSET?	CH-LOT,FL-LOCKED \?CTR9
	FSET?	CH-LOT,FL-BROKEN /?CCL10
?CTR9:	IN?	TH-STONE,RM-CHURCHYARD \FALSE
	PRINT	K-MERLIN-ECHOES-MSG
	PRINTR	"""The time is not yet, Arthur..."""
?CCL10:	PRINTI	"You grasp the hilt and pull. At first nothing happens, but then"
	LESS?	GL-SC-CHV,100 /?CTR17
	LESS?	GL-SC-WIS,100 \?CCL18
?CTR17:	MOVE	CH-MERLIN,HERE
	PRINTI	" Merlin appears before you and says, ""He who would rule all England must be both wise and chivalrous, Arthur, yet you have shown yourself lacking in "
	LESS?	GL-SC-CHV,100 \?CCL23
	LESS?	GL-SC-WIS,100 \?CCL23
	PRINTI	"both"
	JUMP	?CND21
?CCL23:	PRINTI	"one"
?CND21:	PRINTI	" of these qualities. Think back over the past few days."
	LESS?	GL-SC-CHV,100 \?CND26
	PRINTI	" Were there times when you were discourteous or unhelpful?"
?CND26:	LESS?	GL-SC-WIS,100 \?CND28
	PRINTI	" Were there times when you did foolish things?"
?CND28:	PRINTI	" Think! I will help you if I can, Arthur.""
"
	CALL	RT-END-OF-GAME,FALSE-VALUE,TRUE-VALUE
	RSTACK	
?CCL18:	MOVE	TH-EXCALIBUR,CH-PLAYER
	PRINTI	"...
"
	INPUT	1,50,RT-STOP-READ
	CLEAR	-1
	SCREEN	7
	CLEAR	7
	ICALL2	RT-CENTER-PIC,K-PIC-ENDGAME
	CURSET	-1
	INPUT	1,150,RT-STOP-READ
	CURSET	-2
	SCREEN	0
	CLEAR	-1
	PRINTI	"The sword slides out easily. You wave it over your head and the crowd cheers, ""Long Live King Arthur. The Once and Future King."""
	CRLF	
	CRLF	
	DIROUT	K-D-TBL-ON,K-DIROUT-TBL
	PRINTI	"THE END"
	DIROUT	K-D-TBL-OFF
	WINGET	0,K-W-YCURPOS >?TMP1
	WINGET	0,K-W-XSIZE >?TMP2
	GET	0,24
	SUB	?TMP2,STACK
	DIV	STACK,2
	ADD	STACK,1
	CURSET	?TMP1,STACK
	HLIGHT	H-BOLD
	GET	K-DIROUT-TBL,0
	PRINTT	K-DIROUT-TBL+2,STACK
	HLIGHT	H-NORMAL
	CRLF	
	CRLF	
	CALL2	RT-END-OF-GAME,TRUE-VALUE
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?BREAK \FALSE
	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE
	PRINTI	" can't break"
	ICALL	RT-PRINT-OBJ,TH-EXCALIBUR,K-ART-THE
	PRINTR	"."


	.FUNCT	RT-TH-EXCALIBUR-JEWELS:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"They look like rare and precious gemstones."

	.ENDSEG

	.SEGMENT "OWL"


	.FUNCT	RT-RM-ABOVE-FIELD:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	RM-FIELD-OF-HONOR,FL-SEEN
	FSET	LG-LAKE,FL-SEEN
	FSET	LG-TOWN,FL-SEEN
	FSET	RM-MEADOW,FL-SEEN
	PRINTI	"You are hovering over the Field of Honor. Below you to the south is the lake. The town lies to the northeast, and the meadow is just north of you.
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
