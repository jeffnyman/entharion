
	.SEGMENT "TOWER"


	.FUNCT	RT-RM-ENCHANTED-FOREST:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	PRINTI	"You"
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	" are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND4
?CCL6:	PRINTI	" follow the road into"
?CND4:	FSET	LG-ENCHANTED-TREES,FL-SEEN
	PRINTI	" the gloom of the enchanted forest. It is dark, mysterious and unnaturally quiet. The trees loom up at you as you pass by. "
	ZERO?	GL-PLAYER-FORM \?CND7
	PRINTI	"Their branches seem to reach out and pluck at you, as if they resent human presence. "
?CND7:	PRINTI	"Paths disappear into the forest to the northeast, northwest, and north. The edge of the forest lies to the south.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL10
	SET	'GL-PICTURE-NUM,K-PIC-FOREST-PATH
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL10:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-RM-LEP-PATH:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	LG-CHESTNUT-TREES,FL-SEEN
	PRINTI	"You are deep within the enchanted forest. A path leads north into the woods, and to the northwest is a stand of horse chestnut trees. To the southeast you see the edge of the forest.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL5
	SET	'GL-PICTURE-NUM,K-PIC-FOREST-PATH
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL5:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-LG-ENCHANTED-TREES:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?CLIMB-ON,V?CLIMB-UP \?CCL5
	PRINT	K-CLIMB-TREE-MSG
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	LG-ENCHANTED-TREES,FL-SEEN
	PRINTR	"The trees are dark and sinister. They seem to resent your presence, and you get the feeling they are closing in on you."


	.FUNCT	RT-LG-FOREST:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?ENTER \?CCL5
	EQUAL?	HERE,RM-EDGE-OF-WOODS \?CCL8
	CALL2	RT-DO-WALK,P?NORTH
	RSTACK	
?CCL8:	EQUAL?	HERE,RM-GLADE \?CCL10
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL10:	EQUAL?	HERE,RM-GROVE \?CCL12
	CALL2	RT-DO-WALK,P?SW
	RSTACK	
?CCL12:	EQUAL?	HERE,RM-TOW-CLEARING \?CCL14
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL14:	EQUAL?	HERE,RM-SOUTH-OF-CHASM \FALSE
	CALL2	RT-DO-WALK,P?SOUTH
	RSTACK	
?CCL5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	LG-ENCHANTED-TREES,FL-SEEN
	ICALL2	THIS-IS-IT,LG-ENCHANTED-TREES
	PRINTR	"The trees are dark and sinister. They seem to resent your presence, and you get the feeling they are closing in on you."

	.ENDSEG

	.ENDI
