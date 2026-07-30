
	.SEGMENT "TOWN"


	.FUNCT	RT-RM-TOWN-GATE:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are now"
	ICALL1	RT-STANDING-MSG
	PRINTI	" just outside"
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-VILLAGE-GREEN \?CCL9
	PRINTI	"You leave the town and pause outside"
	JUMP	?CND4
?CCL9:	EQUAL?	OHERE,RM-FORK-IN-ROAD \?CCL11
	PRINTI	"The road takes you southward. Soon you are"
	ICALL2	RT-WALK-MSG,TRUE-VALUE
	PRINTI	" alongside the wall of the town, and you pause outside"
	JUMP	?CND4
?CCL11:	PRINTI	"You"
	ICALL1	RT-WALK-MSG
	PRINTI	" to the northeast until you come to"
?CND4:	FSET	LG-TOWN-GATE,FL-SEEN
	FSET	RM-MEADOW,FL-SEEN
	PRINTI	" the town gate, which lies to the east. A road leads to the north, and to the southwest is a meadow.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL13
	SET	'GL-PICTURE-NUM,K-PIC-TOWN-GATE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL13:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-LG-TOWN-GATE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI /?CCL8
	PUSH	2
	JUMP	?CND6
?CCL8:	PUSH	1
?CND6:	CALL2	EVERYWHERE-VERB?,STACK
	ZERO?	STACK \FALSE
	PRINTR	"The old Roman wall has fallen into disrepair and there is no longer an actual gate here - merely a gap in the wall where it used to be."


	.FUNCT	RT-RM-VILLAGE-GREEN:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	PRINTI	"You "
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" on"
	JUMP	?CND4
?CCL6:	PRINTI	"enter"
?CND4:	FSET	LG-TOWN-GATE,FL-SEEN
	FSET	TH-OAK,FL-SEEN
	PRINTI	" the village green, which is a common area just inside the town's western defenses. The old Roman wall is crumbling into disrepair here, and there is a gaping hole where the west gate used to be. The town square lies to the east, and an ancient oak dominates the center of the green, towering over its roots like an aging druid over a group of prostrated initiates.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-BEG \?CCL8
	EQUAL?	PRSA,V?DIG \FALSE
	EQUAL?	PRSO,FALSE-VALUE,ROOMS,TH-GROUND /?CCL11
	EQUAL?	PRSO,TH-OAK \FALSE
?CCL11:	EQUAL?	GL-PLAYER-FORM,K-FORM-BADGER \FALSE
	FSET?	TH-SWORD,FL-LOCKED \?CCL21
	PRINTR	"There are so many places to dig here, you wouldn't know where to begin."
?CCL21:	IN?	TH-OAK-HOLE,RM-VILLAGE-GREEN \?CCL23
	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE
	PRINTR	" can't dig any deeper."
?CCL23:	MOVE	TH-OAK-HOLE,RM-VILLAGE-GREEN
	ICALL2	THIS-IS-IT,TH-SWORD
	PRINTR	"Dirt starts to fly all around you as your claws dig at a furious pace. Soon you have dug a nice hole between the roots of the tree. You see a sword glinting at the bottom of the hole."
?CCL8:	EQUAL?	CONTEXT,M-ENTER \?CCL25
	SET	'GL-PICTURE-NUM,K-PIC-VILLAGE-GREEN
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL25:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-TH-OAK:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	FSET	TH-OAK,FL-SEEN
	CALL	NOUN-USED?,TH-OAK,W?ROOTS
	ZERO?	STACK /?CCL8
	PRINTR	"The gnarled roots clutch the earth like an old man's fingers."
?CCL8:	PRINTR	"It's a majestic old tree with huge gnarled roots."
?CCL5:	EQUAL?	PRSA,V?CLIMB-ON,V?CLIMB-UP \?CCL10
	PRINTR	"You clamber up the tree for a quick look around. Unfortunately, you find nothing of interest, and quickly return to the ground."
?CCL10:	EQUAL?	PRSA,V?LOOK-UNDER \FALSE
	SET	'CLOCK-WAIT,TRUE-VALUE
	CALL2	RT-AUTHOR-MSG,K-HOW-INTEND-MSG
	RSTACK	


	.FUNCT	RT-TH-OAK-HOLE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?LOOK-IN,V?EXAMINE \?CCL5
	FIRST?	TH-OAK-HOLE /?BOGUS9
?BOGUS9:	EQUAL?	STACK,TH-SWORD \FALSE
	NEXT?	TH-SWORD /FALSE
	ICALL2	THIS-IS-IT,TH-SWORD
	PRINTR	"There is a sword gleaming at the bottom of the hole."
?CCL5:	EQUAL?	PRSA,V?ENTER \FALSE
	ZERO?	GL-PLAYER-FORM \?CCL17
	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE,STR?25
	PRINTI	" too big to fit in"
	ICALL	RT-PRINT-OBJ,TH-OAK-HOLE,K-ART-THE
	PRINTR	"."
?CCL17:	PRINTI	"You crawl into the hole and have a quick look around. "
	CALL2	SEE-ANYTHING-IN?,TH-OAK-HOLE
	ZERO?	STACK /?CCL20
	PRINTI	"You find"
	ICALL2	PRINT-CONTENTS,TH-OAK-HOLE
	PRINTI	" in the hole, and then"
	JUMP	?CND18
?CCL20:	PRINTI	"Finding nothing of interest, you"
?CND18:	PRINTR	" crawl out again."


	.FUNCT	RT-RM-SMITHY:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" outside"
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-CASTLE-GATE \?CCL8
	PRINTI	"You"
	ICALL1	RT-WALK-MSG
	PRINTI	" southward alongside"
	JUMP	?CND4
?CCL8:	EQUAL?	OHERE,RM-HOLE \?CCL10
	PRINTI	"You"
	ICALL1	RT-WALK-MSG
	PRINTI	" upwards, and soon find yourself next to"
	JUMP	?CND4
?CCL10:	PRINTI	"You land near"
?CND4:	FSET	TH-SMITH-HEARTH,FL-SEEN
	PRINTI	" the castle wall. Set into the ground is the stone hearth of the village smithy. There is a bush growing next to the wall, and under it appears to be a hole.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL12
	SET	'GL-PICTURE-NUM,K-PIC-SMITHY
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL12:	EQUAL?	CONTEXT,M-ENTERED \?CCL16
	FSET?	CH-CELL-GUARD,FL-ASLEEP \FALSE
	FSET?	TH-SWORD,FL-LOCKED \FALSE
	MOVE	CH-MERLIN,HERE
	CRLF	
	PRINT	K-MERLIN-PRISONER-MSG
	CRLF	
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL16:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-PS-BUSH:ANY:0:3,CONTEXT,ART,CAP?
	FCLEAR	PSEUDO-OBJECT,FL-PLURAL
	FCLEAR	PSEUDO-OBJECT,FL-VOWEL
	EQUAL?	CONTEXT,M-OBJDESC \?CCL3
	ZERO?	ART /?CND4
	ICALL	PRINT-ARTICLE,PSEUDO-OBJECT,ART,CAP?
?CND4:	EQUAL?	ART,FALSE-VALUE,K-ART-THE,K-ART-A /?CCL8
	EQUAL?	ART,K-ART-ANY \FALSE
?CCL8:	ZERO?	ART /?CND11
	PRINTC	32
?CND11:	PRINTI	"bush"
	RTRUE	
?CCL3:	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE,V?LOOK-UNDER \FALSE
	ICALL2	THIS-IS-IT,PSEUDO-OBJECT
	PRINTR	"It's just a small bush nestled up against the castle wall. Below it, you see a hole."


	.FUNCT	RT-TH-SMITH-HEARTH:ANY:0:1,CONTEXT
	EQUAL?	PRSA,V?EXAMINE \?CCL3
	FSET	TH-SMITH-HEARTH,FL-SEEN
	PRINTR	"It is a simple stone slab set into the ground. It looks as if it hasn't been used for several days."
?CCL3:	EQUAL?	PRSA,V?TAKE,V?MOVE,V?RAISE \FALSE
	PRINTR	"You cannot move the hearth."


	.FUNCT	RT-LG-TOWN:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?ENTER \?CCL5
	EQUAL?	HERE,RM-TOWN-GATE \?CCL8
	CALL2	RT-DO-WALK,P?EAST
	RSTACK	
?CCL8:	EQUAL?	HERE,RM-PARADE-AREA,RM-CASTLE-GATE \FALSE
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXIT \?CCL12
	EQUAL?	HERE,RM-TOWN-GATE \FALSE
	CALL2	RT-DO-WALK,P?WEST
	RSTACK	
?CCL12:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	LG-TOWN,FL-SEEN
	PRINTR	"It is a small town that grew up around the Roman fort."

	.ENDSEG

	.SEGMENT "OWL"


	.FUNCT	RT-RM-ABOVE-TOWN:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	RM-MOOR,FL-SEEN
	FSET	RM-BOG,FL-SEEN
	FSET	RM-MEADOW,FL-SEEN
	FSET	RM-FIELD-OF-HONOR,FL-SEEN
	FSET	LG-CASTLE,FL-SEEN
	PRINTI	"You are hovering over the town. Way off to the north you can see the moor, and east of that you see a large patch of fog. A flick of your wings would take you westward to the meadow, or southwestward to the Field of Honor. In the distance to the northwest lies the edge of the forest. If you flew east, you would be over the castle.
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

	.SEGMENT "TOWN"


	.FUNCT	RT-LG-VILLAGE-HUTS:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"The houses are little more than huts made of wattle and thatch."
?CCL5:	EQUAL?	PRSA,V?LOOK-THRU,V?LOOK-IN,V?ENTER \FALSE
	PRINTR	"Closer investigation reveals that the houses are even less interesting than when seen from a distance."

	.ENDSEG

	.ENDI
