
	.SEGMENT "0"


	.FUNCT	RT-TH-SWORD:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	IN?	TH-SWORD,TH-BOAR \FALSE
	FSET	TH-SWORD,FL-SEEN
	FSET	TH-BOAR,FL-SEEN
	ICALL	RT-PRINT-OBJ,TH-SWORD,K-ART-THE,TRUE-VALUE
	PRINTI	" is imbedded in"
	ICALL	RT-PRINT-OBJ,TH-BOAR,K-ART-THE
	PRINTR	"."


	.FUNCT	RT-GN-SWORD:ANY:2:2,TBL,FINDER,?TMP1
	GET	PARSE-RESULT,4
	EQUAL?	STACK,V?ASK-ABOUT \?CCL3
	GET	PARSE-RESULT,5
	EQUAL?	STACK,CH-PRISONER \?CCL6
	RETURN	TH-SWORD
?CCL6:	GET	PARSE-RESULT,5
	EQUAL?	STACK,CH-LOT /?CTR7
	RETURN	TH-EXCALIBUR
?CTR7:	RETURN	TH-LOT-SWORD
?CCL3:	ADD	TBL,8 >?TMP1
	GET	TBL,1
	INTBL?	P-IT-OBJECT,?TMP1,STACK \?CCL10
	RETURN	P-IT-OBJECT
?CCL10:	CALL	RT-META-IN?,TH-EXCALIBUR,HERE
	ZERO?	STACK /?CCL12
	RETURN	TH-EXCALIBUR
?CCL12:	CALL	RT-META-IN?,TH-SWORD,HERE
	ZERO?	STACK /?CCL14
	RETURN	TH-SWORD
?CCL14:	CALL	RT-META-IN?,TH-LOT-SWORD,HERE
	ZERO?	STACK /FALSE
	RETURN	TH-LOT-SWORD

	.ENDSEG

	.SEGMENT "BOG"


	.FUNCT	RT-RM-FORD:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK /?CND4
	PRINTI	"You enter the ford. "
?CND4:	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in the middle of the river."
	EQUAL?	GL-PLAYER-FORM,K-FORM-EEL,K-FORM-TURTLE \?CCL8
	PRINTI	"

Light filters down from the surface above, and strong rapids block passage to the north.
"
	RFALSE	
?CCL8:	PRINTI	" Looking south, you see that the land along the west bank is rich and lush, while the land along the east bank is wasted and barren.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-BEG \?CCL10
	EQUAL?	PRSA,V?WALK \FALSE
	IN?	CH-KRAKEN,RM-FORD \FALSE
	FSET?	CH-KRAKEN,FL-LOCKED \FALSE
	PRINT	K-KRAKEN-HOLD-MSG
	RTRUE	
?CCL10:	EQUAL?	CONTEXT,M-ENTER \?CCL18
	EQUAL?	GL-PLAYER-FORM,K-FORM-EEL \?CCL21
	SET	'GL-PICTURE-NUM,K-PIC-UNDERWATER
	JUMP	?CND19
?CCL21:	SET	'GL-PICTURE-NUM,K-PIC-FORD
?CND19:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL18:	EQUAL?	CONTEXT,M-ENTERED \?CCL25
	FCLEAR	TH-CRYSTAL,FL-LOCKED
	IN?	TH-BAG,CH-PLAYER \FALSE
	GETPT	TH-BAG,P?SIZE
	PUTB	STACK,K-CAPACITY,K-CAP-MAX
	RTRUE	
?CCL25:	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?THROW-OVER,V?THROW /?CCL32
	EQUAL?	PRSA,V?PUT-IN,V?PUT \FALSE
	EQUAL?	HERE,RM-FORD /?CCL32
	EQUAL?	P-PRSA-WORD,W?THROW,W?TOSS,W?HURL /?CCL32
	EQUAL?	P-PRSA-WORD,W?CHUCK,W?FLING,W?PITCH /?CCL32
	EQUAL?	P-PRSA-WORD,W?HEAVE \FALSE
?CCL32:	EQUAL?	HERE,RM-WEST-OF-FORD \?CCL43
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \?CCL43
	CALL1	IDROP
	ZERO?	STACK /TRUE
	ICALL2	THIS-IS-IT,CH-BLACK-KNIGHT
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" snatches"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTR	" out of the air and flings it down onto the ground with a contemptuous laugh."
?CCL43:	EQUAL?	HERE,RM-EAST-OF-FORD,RM-WEST-OF-FORD \?CCL50
	CALL1	IDROP
	ZERO?	STACK /TRUE
	EQUAL?	PRSO,TH-APPLE \?CCL56
	MOVE	PRSO,RM-SHALLOWS
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE,TRUE-VALUE
	PRINTI	" quickly"
	ICALL	RT-PRINT-VERB,PRSO,STR?128
	PRINTR	" down the river and out of sight."
?CCL56:	CALL	RT-THROW-INTO-ROOM-MSG,PRSO,RM-FORD
	RSTACK	
?CCL50:	CALL2	NOT-HERE,PRSI
	RSTACK	


	.FUNCT	RT-RAPIDS-MSG:ANY:0:1,QUIET
	ZERO?	QUIET \FALSE
	PRINTI	"The current is too strong to go upriver.
"
	RFALSE	


	.FUNCT	RT-EXIT-FORD:ANY:0:1,QUIET
	ZERO?	QUIET /?CCL3
	EQUAL?	GL-PLAYER-FORM,K-FORM-EEL /FALSE
	EQUAL?	P-WALK-DIR,P?WEST \?CCL8
	RETURN	RM-WEST-OF-FORD
?CCL8:	EQUAL?	P-WALK-DIR,P?EAST \FALSE
	RETURN	RM-EAST-OF-FORD
?CCL3:	EQUAL?	GL-PLAYER-FORM,K-FORM-EEL \?CCL12
	PRINTI	"Eels can't survive out of water.
"
	RFALSE	
?CCL12:	EQUAL?	P-WALK-DIR,P?OUT \?CCL14
	ICALL1	V-WALK-AROUND
	RFALSE	
?CCL14:	EQUAL?	P-WALK-DIR,P?WEST \?CCL16
	RETURN	RM-WEST-OF-FORD
?CCL16:	EQUAL?	P-WALK-DIR,P?EAST \FALSE
	IN?	TH-BRACELET,CH-PLAYER \?CCL21
	FSET?	TH-BRACELET,FL-WORN \?CCL21
	ZERO?	GL-PLAYER-FORM /?CCL21
	PRINTI	"As you climb out of"
	PRINT	K-SHAPECHANGE-MSG
	PRINTI	" As your neck begins to expand to it's normal size,"
	ICALL	RT-PRINT-OBJ,TH-BRACELET,K-ART-THE
	PRINTI	" begins to throttle you. You stagger back into the water and quickly revert to your"
	ICALL1	RT-FORM-TYPE-MSG
	PRINTI	" form.
"
	RFALSE	
?CCL21:	ZERO?	GL-PLAYER-FORM /?CND25
	SET	'GL-PLAYER-FORM,K-FORM-ARTHUR
	PRINTI	"As you climb out of"
	PRINT	K-SHAPECHANGE-MSG
	CRLF	
	CRLF	
?CND25:	RETURN	RM-EAST-OF-FORD


	.FUNCT	RT-ENTER-RIVER:ANY:0:1,QUIET
	EQUAL?	GL-PLAYER-FORM,K-FORM-EEL,K-FORM-TURTLE \?CCL3
	RETURN	RM-RIVER-1
?CCL3:	ZERO?	QUIET \FALSE
	PRINT	K-WOULD-DROWN-MSG
	RFALSE	


	.FUNCT	RT-RM-WEST-OF-FORD:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" at the edge of a river."
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-FORD \?CCL9
	PRINTI	"You climb up out of the river."
	JUMP	?CND4
?CCL9:	EQUAL?	OHERE,RM-BOG \?CCL11
	PRINTI	"You emerge safely from the bog, and come to a ford in a river."
	JUMP	?CND4
?CCL11:	PRINTI	"You land next to a ford in a river."
?CND4:	PRINTI	" To the west "
	EQUAL?	OHERE,RM-BOG \?CCL14
	PRINTI	"lies the path back into the"
	JUMP	?CND12
?CCL14:	PRINTI	"is a sign that marks the edge of a treacherous peat"
?CND12:	PRINTI	" bog."
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \?CND15
	FSET	CH-BLACK-KNIGHT,FL-SEEN
	FSET	TH-BLACK-ARMOUR,FL-SEEN
	PRINTI	" Passage across the ford to the east is blocked by a fearsome looking knight in black armour."
?CND15:	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-BEG \?CCL18
	SET	'GL-BLACK-FIGHT,FALSE-VALUE
	RETURN	GL-BLACK-FIGHT
?CCL18:	EQUAL?	CONTEXT,M-END \?CCL20
	EQUAL?	PRSA,V?TRANSFORM \FALSE
	EQUAL?	GL-PLAYER-FORM,GL-OLD-FORM,K-FORM-ARTHUR /FALSE
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \FALSE
	ICALL1	RT-RESET-BLACK-FIGHT
	CRLF	
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" looks at you and sneers maliciously, ""How well it suits you, creature of Merlin, to crawl into the skin of a lowly animal. You are so far beneath contempt that I shall not even bother to kill you."""
?CCL20:	EQUAL?	CONTEXT,M-ENTER \?CCL31
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \?CCL34
	SET	'GL-PICTURE-NUM,K-PIC-BLACK-KNIGHT
	JUMP	?CND32
?CCL34:	SET	'GL-PICTURE-NUM,K-PIC-EDGE-OF-BOG
?CND32:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL31:	EQUAL?	CONTEXT,M-ENTERED \?CCL38
	SET	'GL-BOG-START,HERE
	SET	'GL-BOG-POS,K-BOG-NUM
	EQUAL?	OHERE,RM-BOG \?CCL41
	FSET?	RM-BOG,FL-BROKEN \FALSE
	FSET?	RM-BOG,FL-LOCKED \FALSE
	FCLEAR	RM-BOG,FL-BROKEN
	FCLEAR	RM-BOG,FL-LOCKED
	CALL	RT-SCORE-MSG,0,2,3,2
	RSTACK	
?CCL41:	EQUAL?	OHERE,RM-FORD \FALSE
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \FALSE
	ICALL2	THIS-IS-IT,CH-BLACK-KNIGHT
	PRINTR	"
The Black Knight whirls around to face you."
?CCL38:	EQUAL?	CONTEXT,M-EXIT \?CCL53
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \FALSE
	ICALL1	RT-RESET-BLACK-FIGHT
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" calls after you as you leave, ""Coward! Go on - save your precious skin. I expected nothing less from one of Merlin's whelps.""

"
	RFALSE	
?CCL53:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-PASS-BLACK-KNIGHT:ANY:0:1,QUIET
	ZERO?	QUIET /?CCL3
	RETURN	RM-FORD
?CCL3:	EQUAL?	GL-PLAYER-FORM,K-FORM-BADGER,K-FORM-OWL,K-FORM-SALAMANDER \?CCL5
	PRINT	K-WOULD-DROWN-MSG
	RFALSE	
?CCL5:	FSET?	CH-BLACK-KNIGHT,FL-ALIVE /?PRD9
	RETURN	RM-FORD
?PRD9:	ZERO?	GL-PLAYER-FORM /?CCL7
	RETURN	RM-FORD
?CCL7:	CALL2	RT-IS-QUEUED?,RT-I-BLACK-FIGHT
	ZERO?	STACK /?CCL11
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" blocks your path and deals you another mighty blow."
	CRLF	
	RFALSE	
?CCL11:	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" blocks your path, saying ""All who would cross this ford must first fight with me. I am the defender of the land that lies beyond."""
	CRLF	
	RFALSE	


	.FUNCT	RT-CH-BLACK-KNIGHT:ANY:0:3,CONTEXT,ART,CAP?,N
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?THANK,V?GOODBYE,V?HELLO \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL8
	PRINTR	"""I offer no greetings to those who must die. All who would cross this ford must first fight with me. I am the defender of the land that lies beyond."""
?CCL8:	EQUAL?	PRSA,V?GOODBYE \?CCL10
	PRINTR	"""You do well to run. At least you escape with your life, if not your honor."""
?CCL10:	EQUAL?	PRSA,V?THANK \FALSE
	PRINTI	"""Keep your thanks to yourself. I have no use for your chivalrous claptrap!"""
	CRLF	
	FSET?	CH-PLAYER,FL-AIR /TRUE
	FSET	CH-PLAYER,FL-AIR
	ICALL	RT-SCORE-MSG,10,0,0,0
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL16
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL19
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL19:	EQUAL?	PRSA,V?WHAT,V?WHO /FALSE
	PRINTR	"""I will not waste my time in idle chatter. Prepare to defend thyself."""
?CCL16:	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?TELL \?CCL29
	ZERO?	P-CONT \FALSE
?CCL29:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL33
	EQUAL?	PRSI,CH-BLACK-KNIGHT \?CCL36
	PRINTR	"""I am the guardian of the land that lies beyond."""
?CCL36:	EQUAL?	PRSI,CH-DEMON,TH-MASTER \?CCL38
	PRINTR	"""He is my master. I do his bidding."""
?CCL38:	EQUAL?	PRSI,TH-BLACK-MEDALLION \?CCL40
	PRINTR	"""It was given to me by my master."""
?CCL40:	EQUAL?	PRSI,CH-MERLIN \?CCL42
	PRINTR	"""An overrated parlour magician. He couldn't make a black cat disappear in a dark room at midnight."""
?CCL42:	EQUAL?	PRSI,CH-LOT \?CCL44
	PRINTR	"""Not a bad fellow, once you get to know him."""
?CCL44:	EQUAL?	PRSI,TH-EXCALIBUR \?CCL46
	PRINTR	"""Bring it, if you can. I'm not afraid of it."""
?CCL46:	PRINTR	"""I will not waste my time in idle chatter. Prepare to defend thyself."""
?CCL33:	EQUAL?	PRSA,V?CUT,V?ATTACK \?CCL48
	CALL2	RT-ATTACK-KNIGHT,CH-BLACK-KNIGHT
	RSTACK	
?CCL48:	EQUAL?	PRSA,V?EXAMINE \?CCL50
	PRINTI	"The knight towers above you"
	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT \?CND51
	PRINTI	", brandishing a huge sword"
?CND51:	PRINTR	". He is encased from head to foot in jet-black armour, and from his neck hangs a sinister medallion that glows a dull red."
?CCL50:	EQUAL?	PRSA,V?CHALLENGE \FALSE
	ICALL2	THIS-IS-IT,CH-BLACK-KNIGHT
	PRINTR	"The Black Knight snorts in derision and says, ""Words - mere words. If you want to fight, boy, then let's fight."""


	.FUNCT	RT-ATTACK-KNIGHT:ANY:0:1,TARGET,I,M,N,PTR,?TMP1
	ASSIGNED?	'TARGET /?CND1
	SET	'TARGET,CH-BLACK-KNIGHT
?CND1:	ICALL2	RT-DEQUEUE,RT-I-RESET-BLOOD
	ZERO?	GL-PLAYER-FORM /?CCL5
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" sidesteps your attack and looks at you in surprise."
?CCL5:	EQUAL?	PRSI,TH-SWORD /?CCL7
	LESS?	GL-SC-EXP,66 \?CCL10
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" ignores your feeble attack and jeers, ""Until you have a decent weapon, boy, I won't even bother to kill you."""
?CCL10:	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT /?CCL12
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
	MOVE	TH-BLACK-SWORD,CH-BLACK-KNIGHT
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" dodges your feeble attack and retrieves his weapon."
?CCL12:	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" nimbly avoids your feeble maneuver while launching an attack of his own. He feints a blow to your head, and then suddenly whirls and deals you a fatal blow across your midsection.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL7:	LESS?	GL-SC-EXP,25 \?CCL14
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" easily fends off your clumsy attack and scoffs, ""Begone, lad. I won't even fight a boy of such inexperience."""
?CCL14:	LESS?	GL-SC-EXP,53 \?CCL16
	MOVE	TH-SWORD,HERE
	PRINTI	"You advance towards"
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE
	PRINTI	", swinging your sword wildly. He casually blocks your attack, and then whirls his blade in a tight circle. Your sword flies out of your hand and lands on"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTI	" nearby. As you bend to pick it up,"
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE
	PRINTI	" slaps you on your backside with the flat of his sword and sends you sprawling on"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTR	".

He laughs while you pick yourself up, and then he jeers, ""Come back when you have learned enough to hold onto your sword in a fight, boy."""
?CCL16:	LESS?	GL-SC-EXP,66 \?CCL18
	SET	'GL-BLACK-FIGHT,TRUE-VALUE
	CALL2	RT-IS-QUEUED?,RT-I-BLACK-FIGHT
	ZERO?	STACK \?CND19
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
?CND19:	GETB	K-BLOOD-NUM,0
	ZERO?	STACK \?CCL23
	PRINTI	"You muster all your remaining strength and swing the sword, but it is not enough. The knight avoids the blow, and then administers the coup de grace with a quick thrust to your heart.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL23:	RANDOM	100
	LESS?	50,STACK /?CCL25
	RANDOM	4 >N
	EQUAL?	N,1 \?CCL28
	PRINTR	"The knight blocks your attack with his sword and counters with a blow of his own, which misses you by inches!"
?CCL28:	EQUAL?	N,2 \?CCL30
	PRINTR	"You deal the knight a glancing blow. He staggers for a moment, but then recovers."
?CCL30:	EQUAL?	N,3 \?CCL32
	PRINTR	"The two blades meet with a mighty clash."
?CCL32:	PRINTR	"You lunge at the knight, but he steps aside at the last instant."
?CCL25:	GETB	K-BLOOD-NUM,0
	RANDOM	STACK >M
	GETB	K-BLOOD-NUM,M >N
	EQUAL?	N,1 \?CCL35
	PRINTI	"Your swing goes wild, and its momentum pulls you sideways for an instant. The black knight takes advantage of the opening and cuts you on the shoulder."
	CRLF	
	JUMP	?CND33
?CCL35:	EQUAL?	N,2 \?CCL37
	PRINTI	"You swing the sword with all your might, but the knight deflects the force of the blow with his sword. Then he whirls and strikes at your head! The tip of his blade grazes your forehead, and some blood starts to trickle down into your eyes."
	CRLF	
	JUMP	?CND33
?CCL37:	PRINTI	"A valiant effort, but the knight is too quick for you. He draws blood with a low swipe at your leg."
	CRLF	
?CND33:	GETB	K-BLOOD-NUM,0 >I
	GRTR?	I,M \?CND38
	ADD	K-BLOOD-NUM,M >PTR
	ADD	PTR,1 >?TMP1
	SUB	I,M
	COPYT	?TMP1,PTR,STACK
?CND38:	DEC	'I
	PUTB	K-BLOOD-NUM,0,I
	ZERO?	I \TRUE
	PRINTR	"
You are bleeding all over and your strength is fading quickly. You realize that the black knight is still more experienced than you, and that to continue fighting him would mean certain death."
?CCL18:	SET	'GL-BLACK-FIGHT,TRUE-VALUE
	CALL2	RT-IS-QUEUED?,RT-I-BLACK-FIGHT
	ZERO?	STACK \?CND42
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
?CND42:	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT \?CCL46
	GETB	K-FIGHT-NUM,0
	ZERO?	STACK \?CCL49
	ICALL1	RT-RESET-BLACK-FIGHT
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-GET-SWORD,STACK
	MOVE	TH-BLACK-SWORD,HERE
	PRINTR	"Your blade slices through the air and knocks the knight's sword from his grasp! It falls to the ground, and he is momentarily disarmed!"
?CCL49:	GETB	K-FIGHT-NUM,0
	RANDOM	STACK >M
	GETB	K-FIGHT-NUM,M >N
	EQUAL?	N,1 \?CCL52
	PRINTI	"You deal the knight a stunning blow. He tries to parry, but the sheer force of it knocks him back a few steps."
	CRLF	
	JUMP	?CND50
?CCL52:	EQUAL?	N,2 \?CCL54
	PRINTI	"You lunge at the knight's head. He raises his sword to ward off the blow, but suddenly you drop your aim. He tries to twist aside at the last minute, but you still pierce his armour and graze his ribs."
	CRLF	
	JUMP	?CND50
?CCL54:	PRINTI	"You whirl the blade with blinding speed, missing the knight by inches!"
	CRLF	
?CND50:	GETB	K-FIGHT-NUM,0 >I
	GRTR?	I,M \?CND55
	ADD	K-FIGHT-NUM,M >PTR
	ADD	PTR,1 >?TMP1
	SUB	I,M
	COPYT	?TMP1,PTR,STACK
?CND55:	DEC	'I
	PUTB	K-FIGHT-NUM,0,I
	RTRUE	
?CCL46:	EQUAL?	TARGET,TH-BLACK-MEDALLION \?CCL58
	MOVE	TH-BLACK-ARMOUR,HERE
	FCLEAR	TH-BLACK-ARMOUR,FL-WORN
	FCLEAR	TH-BLACK-ARMOUR,FL-NO-DESC
	REMOVE	CH-BLACK-KNIGHT
	REMOVE	TH-BLACK-SWORD
	FCLEAR	CH-BLACK-KNIGHT,FL-ALIVE
	ICALL2	RT-DEQUEUE,RT-I-BLACK-FIGHT
	ICALL2	RT-DEQUEUE,RT-I-GET-SWORD
	PRINTI	"You sever the knight's source of power. "
	ICALL	RT-PRINT-OBJ,TH-BLACK-MEDALLION,K-ART-THE,TRUE-VALUE
	PRINTI	" and the knight's sword both incandesce into a fiery red, and then they suddenly disappear in a thunderclap and a flash of lightning. "
	ICALL	RT-PRINT-OBJ,TH-BLACK-ARMOUR,K-ART-THE,TRUE-VALUE
	PRINTI	" teeters for a moment. Then it crumples to"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTI	", empty."
	CRLF	
	ICALL	RT-SCORE-MSG,0,4,7,4
	SET	'GL-PICTURE-NUM,K-PIC-EDGE-OF-BOG
	BOR	GL-UPDATE-WINDOW,K-UPD-DESC >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \?CCL61
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	
?CCL61:	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \TRUE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RTRUE	
?CCL58:	MOVE	TH-BLACK-SWORD,CH-BLACK-KNIGHT
	PRINTR	"With amazing agility, the knight recovers his sword in time to block your blow."


	.FUNCT	RT-RESET-BLACK-FIGHT:ANY:0:0,I
	LESS?	GL-SC-EXP,53 /TRUE
	LESS?	GL-SC-EXP,66 \?CCL4
	ICALL2	RT-DEQUEUE,RT-I-BLACK-FIGHT
	ADD	GL-MOVES,20
	ICALL	RT-QUEUE,RT-I-RESET-BLOOD,STACK
	RTRUE	
?CCL4:	ICALL2	RT-DEQUEUE,RT-I-BLACK-FIGHT
	ICALL2	RT-DEQUEUE,RT-I-GET-SWORD
	SET	'I,0
	PUTB	K-FIGHT-NUM,0,3
?PRG5:	IGRTR?	'I,3 /TRUE
	PUTB	K-FIGHT-NUM,I,I
	JUMP	?PRG5


	.FUNCT	RT-I-RESET-BLOOD:ANY:0:0,I
	PUTB	K-BLOOD-NUM,0,3
?PRG1:	IGRTR?	'I,3 /FALSE
	PUTB	K-BLOOD-NUM,I,I
	JUMP	?PRG1


	.FUNCT	RT-I-BLACK-FIGHT:ANY:0:0
	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT \FALSE
	ZERO?	GL-BLACK-FIGHT /?CTR5
	FSET?	CH-PLAYER,FL-ASLEEP \?CCL6
?CTR5:	FSET?	CH-PLAYER,FL-ASLEEP \?CCL10
	LESS?	GL-SC-EXP,66 /?CND9
?CCL10:	CRLF	
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTI	" takes advantage of your inactivity to "
?CND9:	LESS?	GL-SC-EXP,66 \?CCL15
	FSET?	CH-PLAYER,FL-ASLEEP /FALSE
	ADD	GL-MOVES,20
	ICALL	RT-QUEUE,RT-I-RESET-BLOOD,STACK
	PRINTR	"catch his breath."
?CCL15:	FSET?	CH-PLAYER,FL-ASLEEP \?CCL20
	PRINTI	"kill you.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL20:	PRINTI	"launch a suprise attack. He feints a blow to your head, and then suddenly whirls and deals you a fatal blow across your midsection.
"
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL6:	SET	'GL-BLACK-FIGHT,FALSE-VALUE
	ADD	GL-MOVES,1
	CALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
	RSTACK	


	.FUNCT	RT-I-GET-SWORD:ANY:0:0
	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT /FALSE
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
	MOVE	TH-BLACK-SWORD,CH-BLACK-KNIGHT
	CRLF	
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" picks up his sword."


	.FUNCT	RT-TH-BLACK-ARMOUR:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL7
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE /FALSE
	PRINTR	"The heap of armour is all that is left of the knight."
?CCL7:	EQUAL?	PRSA,V?RAISE,V?MOVE,V?TAKE \?CCL12
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE /FALSE
	ICALL	RT-PRINT-OBJ,TH-BLACK-ARMOUR,K-ART-THE,TRUE-VALUE
	PRINTR	" is too heavy to move."
?CCL12:	EQUAL?	PRSA,V?CUT,V?ATTACK \?CCL17
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \?CCL20
	CALL2	RT-ATTACK-KNIGHT,TH-BLACK-ARMOUR
	RSTACK	
?CCL20:	CALL1	RT-WASTE-OF-TIME-MSG
	RSTACK	
?CCL17:	EQUAL?	PRSA,V?FILL \?CCL22
	ICALL2	THIS-IS-IT,TH-BLACK-ARMOUR
	PRINTR	"There are too many holes in the armour."
?CCL22:	EQUAL?	PRSA,V?ENTER,V?WEAR \FALSE
	FSET?	CH-BLACK-KNIGHT,FL-ALIVE \?CCL27
	ICALL2	THIS-IS-IT,CH-BLACK-KNIGHT
	ICALL2	THIS-IS-IT,TH-BLACK-ARMOUR
	PRINTR	"The black knight is wearing the armour."
?CCL27:	PRINTR	"The black armour is much too big for you."


	.FUNCT	RT-TH-BLACK-SWORD:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?CUT,V?ATTACK \?CCL5
	CALL2	RT-ATTACK-KNIGHT,TH-BLACK-SWORD
	RSTACK	
?CCL5:	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT \?CCL10
	ICALL	RT-PRINT-OBJ,CH-BLACK-KNIGHT,K-ART-THE,TRUE-VALUE
	PRINTR	" moves his sword out of reach."
?CCL10:	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
	MOVE	TH-BLACK-SWORD,CH-BLACK-KNIGHT
	PRINTR	"The knight is faster than you are. He retrieves the sword and deals you a mighty blow."


	.FUNCT	RT-TH-BLACK-MEDALLION:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	ICALL	RT-PRINT-OBJ,TH-BLACK-MEDALLION,K-ART-THE,TRUE-VALUE
	PRINTR	" glows a dull red."
?CCL5:	EQUAL?	PRSA,V?CUT,V?ATTACK \?CCL7
	CALL2	RT-ATTACK-KNIGHT,TH-BLACK-MEDALLION
	RSTACK	
?CCL7:	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	PRINTI	"As you approach, the knight "
	IN?	TH-BLACK-SWORD,CH-BLACK-KNIGHT \?CCL12
	PRINTR	"raises his sword threateningly. You think better of the idea and retreat."
?CCL12:	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-BLACK-FIGHT,STACK
	MOVE	TH-BLACK-SWORD,CH-BLACK-KNIGHT
	PRINTR	"knocks your hand aside and quickly retrieves his sword."


	.FUNCT	RT-RM-EAST-OF-FORD:ANY:0:1,CONTEXT,SIZE
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" alongside a river."
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-FORD \?CCL9
	PRINTI	"You climb back up onto dry ground."
	JUMP	?CND4
?CCL9:	EQUAL?	OHERE,RM-FOOT-OF-MOUNTAIN \?CCL11
	PRINTI	"You return to the riverside."
	JUMP	?CND4
?CCL11:	PRINTI	"You land alongside a river."
?CND4:	PRINTI	" You see the gnarled and wasted remains of tree here"
	IN?	TH-APPLE,TH-APPLETREE \?CND12
	PRINTI	", and from one of its branches hangs a withered old apple"
?CND12:	FSET	TH-APPLE,FL-SEEN
	FSET	TH-APPLETREE,FL-SEEN
	PRINTI	". To the northeast, the land looks bleak and barren. The road leading in that direction looks like it ends at the foot of a forbidding mountain range. The ford across the river lies to the west.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL15
	SET	'GL-PICTURE-NUM,K-PIC-EAST-OF-FORD
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL15:	EQUAL?	CONTEXT,M-ENTERED \?CCL19
	FSET	TH-CRYSTAL,FL-LOCKED
	IN?	TH-BAG,CH-PLAYER \FALSE
	GETPT	TH-BAG,P?SIZE
	GETB	STACK,K-SIZE >SIZE
	CALL2	RT-TOTAL-SIZE,TH-BAG
	GRTR?	STACK,SIZE \FALSE
	ICALL2	THIS-IS-IT,TH-BAG
	MOVE	TH-BAG,HERE
	ICALL	RT-MOVE-ALL,TH-BAG,HERE
	GETPT	TH-BAG,P?SIZE
	PUTB	STACK,K-CAPACITY,SIZE
	CRLF	
	PRINTI	"Merlin's bag suddenly becomes too heavy for you to carry. It falls to"
	ICALL	RT-PRINT-OBJ,TH-GROUND,K-ART-THE
	PRINTR	" and the contents spill out."
?CCL19:	ZERO?	CONTEXT \FALSE
	RFALSE	

	.ENDSEG

	.SEGMENT "OWL"


	.FUNCT	RT-RM-ABOVE-FORD:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	RM-BOG,FL-SEEN
	FSET	LG-CASTLE,FL-SEEN
	PRINTI	"You are hovering over the western edge of a ford. A large patch of fog lies to the west, and to the south of that lies the castle. Below you to the east, you see a road emerge from the ford and lead northeastward towards a desolate looking mountain range.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL5
	SET	'GL-PICTURE-NUM,K-PIC-AIR-SCENE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL5:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-SPELL-FAILS:ANY:0:1,QUIET
	ZERO?	QUIET \?CND1
	SET	'GL-PLAYER-FORM,K-FORM-ARTHUR
	PRINTI	"As you fly over"
	PRINT	K-SHAPECHANGE-MSG
	PRINTI	" Slowly, you drift to the ground, and when you land you discover you are no longer an owl."
	CALL	RT-MOVE-ALL,TH-CLOTHES-BIN,CH-PLAYER
	ZERO?	STACK /?CND3
	BOR	GL-UPDATE-WINDOW,K-UPD-INVT >GL-UPDATE-WINDOW
	PRINTC	32
	PRINT	K-CLOTHES-REAPPEAR-MSG
?CND3:	CRLF	
	CRLF	
?CND1:	RETURN	RM-EAST-OF-FORD

	.ENDSEG

	.ENDI
