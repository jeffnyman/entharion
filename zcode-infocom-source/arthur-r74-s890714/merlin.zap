
	.SEGMENT "TOWN"


	.FUNCT	RT-RM-MERPATH:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" on a path that winds up a hill to the northwest, and returns to the meadow to the southeast"
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-MEADOW \?CCL9
	PRINTI	"As you leave the meadow, the path begins to wind up a"
	JUMP	?CND7
?CCL9:	PRINTI	"The path winds down the"
?CND7:	PRINTI	" hill that overlooks the town"
?CND4:	IN?	TH-MIDGES,RM-MERPATH \?CND10
	FSET	TH-MIDGES,FL-SEEN
	PRINTI	". Hundreds of tiny midges are buzzing around your "
	ZERO?	GL-PLAYER-FORM \?CCL14
	PRINTI	"ankles"
	JUMP	?CND10
?CCL14:	PRINTI	"head"
?CND10:	PRINTC	46
	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL16
	SET	'GL-PICTURE-NUM,K-PIC-MERLIN-PATH
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL16:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-MERPATH-UP:ANY:0:1,QUIET
	EQUAL?	GL-PLAYER-FORM,K-FORM-OWL /?CTR2
	RETURN	RM-OUTSIDE-CRYSTAL-CAVE
?CTR2:	CALL2	RT-FLY-UP,QUIET
	RSTACK	


	.FUNCT	RT-RM-OUTSIDE-CRYSTAL-CAVE:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	ICALL2	THIS-IS-IT,TH-SCROLL
	EQUAL?	CONTEXT,M-LOOK \?CCL6
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in the clearing just to the south of Merlin's cave. A path winds down the hill to the southeast."
	JUMP	?CND4
?CCL6:	EQUAL?	OHERE,RM-MERPATH \?CCL9
	PRINTI	"The path ends in the clearing just south of Merlin's cave."
	JUMP	?CND4
?CCL9:	EQUAL?	OHERE,RM-CRYSTAL-CAVE \?CCL11
	PRINTI	"You blink your eyes as you emerge from the darkness of the cave into the "
	CALL2	RT-TIME-OF-DAY?,K-NIGHT
	ZERO?	STACK /?CCL14
	PRINTI	"bright moonlight"
	JUMP	?CND12
?CCL14:	PRINTI	"sunshine"
?CND12:	PRINTC	46
	JUMP	?CND4
?CCL11:	PRINTI	"You land in the clearing just to the south of Merlin's cave."
?CND4:	EQUAL?	CONTEXT,M-F-LOOK \?CCL17
	FSET	CH-MERLIN,FL-SEEN
	ICALL2	THIS-IS-IT,CH-MERLIN
	PRINTR	" An old man is sitting on a rock outside the cave, reading a scroll. A minute passes before you realize that this shabbily-dressed hermit is the same awe-inspiring Merlin who appeared to you in the churchyard."
?CCL17:	CRLF	
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL19
	SET	'GL-PICTURE-NUM,K-PIC-OUTSIDE-CAVE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL19:	EQUAL?	CONTEXT,M-ENTERED \?CCL23
	FSET?	CH-PLAYER,FL-LOCKED /?CCL26
	FSET	CH-PLAYER,FL-LOCKED
	CRLF	
	PRINTI	"Merlin looks up and says, ""Why hello, Arthur. I was just thinking about you."" He strokes his beard meditatively. ""I wish to help you, but if I give you magic spells that instantly fulfill your every desire, you will only prove that any man so favoured can accomplish a quest. Instead, I've been pondering the idea of allowing you to assume shapes other than your human form."""
	CRLF	
	CRLF	
	PRINTI	"""You see, as an animal, you could do things that humans can't. But at least these things would not be done for you by spells. You would still have to demonstrate the qualities which prove your worthiness to rule - and at the same time you would be gaining respect for all forms of life."""
	CRLF	
	CRLF	
	PRINTI	"His dark eyes bore into you for a second and then he seems to reach a decision. ""Yes. That is what we shall do."" He glances down at the scroll. ""The creatures here should be sufficient for our purpose. The owl, the badger, the salamander, the eel, and the turtle."""
	CRLF	
	CRLF	
	PRINTR	"Merlin waves his hand over you and mumbles a few words. ""There. It is done. The word you will need is 'Cyr,' the ancient word of transformation. When you wish to become another creature, say 'Cyr' and the name of that creature. Remember, however, that the people fear sorcery - if someone is present when you change form, he may kill you. Remember also that you cannot move directly from one foreign shape to another. You must become human first."""
?CCL26:	EQUAL?	OHERE,RM-CRYSTAL-CAVE \FALSE
	FSET?	RM-CELL,FL-TOUCHED /FALSE
	PRINTR	"
Merlin glances up from his scroll and gives you a look of mild reproval. ""Be on your way, Arthur - you have much to do. Even as we speak, a prisoner languishes unjustly in a cell below Lot's castle. If you wish to be England's king, you must help England's people."""
?CCL23:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-RM-CRYSTAL-CAVE:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	EQUAL?	CONTEXT,M-F-LOOK \?CCL6
	PRINTI	"Your heart thumps with anticipation as you edge into the mysterious cave of which you have heard so much. The walls here seem to shimmer with their own light. The ceiling is lost in the darkness overhead. You hear the sound of distant music, as if the earth itself were singing - and then the chord dies away and you are left in silence."
	CRLF	
	CRLF	
	PRINTR	"In the center of the room is a perfectly round crystal ball. On the ground near the wall is a bag."
?CCL6:	EQUAL?	CONTEXT,M-LOOK \?CCL9
	PRINTI	"You are"
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND7
?CCL9:	PRINTI	"You enter"
?CND7:	ICALL	RT-PRINT-OBJ,RM-CRYSTAL-CAVE,K-ART-THE
	PRINTI	". The walls here seem to shimmer with their own light. The only exit is to the south.
"
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTER \?CCL11
	SET	'GL-PICTURE-NUM,K-PIC-CRYSTAL-CAVE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \FALSE
	ICALL1	RT-UPDATE-PICT-WINDOW
	RFALSE	
?CCL11:	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?LOOK-IN,V?EXAMINE \FALSE
	EQUAL?	HERE,RM-CRYSTAL-CAVE /FALSE
	FSET	RM-CRYSTAL-CAVE,FL-SEEN
	PRINTR	"An eerie light seems to emanate from within the cave."


	.FUNCT	RT-CH-MERLIN:ANY:0:1,CONTEXT,FORM
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?THANK,V?GOODBYE,V?HELLO \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL8
	PRINTR	"""Greetings, my young friend."""
?CCL8:	EQUAL?	PRSA,V?GOODBYE \?CCL10
	PRINTR	"""Farewell for now, Arthur. We shall meet again."""
?CCL10:	EQUAL?	PRSA,V?THANK \FALSE
	PRINTI	"""You're welcome, my young friend."""
	CRLF	
	FSET?	CH-PLAYER,FL-AIR /TRUE
	FSET	CH-PLAYER,FL-AIR
	ICALL	RT-SCORE-MSG,10,0,0,0
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL16
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL19
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL19:	EQUAL?	PRSA,V?WHAT,V?WHO /FALSE
	PRINTR	"""You must not ask me to do too much, Arthur. It is you who must take action."""
?CCL16:	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI \FALSE
	EQUAL?	PRSA,V?TELL \?CCL29
	ZERO?	P-CONT \FALSE
?CCL29:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL33
	CALL	NOUN-USED?,PRSI,W?OWL
	ZERO?	STACK /?CCL36
	SET	'FORM,K-FORM-OWL
	JUMP	?CND34
?CCL36:	CALL	NOUN-USED?,PRSI,W?BADGER
	ZERO?	STACK /?CCL38
	SET	'FORM,K-FORM-BADGER
	JUMP	?CND34
?CCL38:	CALL	NOUN-USED?,PRSI,W?SALAMANDER
	ZERO?	STACK /?CCL40
	SET	'FORM,K-FORM-SALAMANDER
	JUMP	?CND34
?CCL40:	CALL	NOUN-USED?,PRSI,W?EEL
	ZERO?	STACK /?CCL42
	SET	'FORM,K-FORM-EEL
	JUMP	?CND34
?CCL42:	CALL	NOUN-USED?,PRSI,W?TURTLE
	ZERO?	STACK /?CCL44
	SET	'FORM,K-FORM-TURTLE
	JUMP	?CND34
?CCL44:	EQUAL?	PRSI,CH-PLAYER \?CND34
	ZERO?	GL-PLAYER-FORM /?CND34
	SET	'FORM,GL-PLAYER-FORM
?CND34:	EQUAL?	FORM,K-FORM-OWL \?CCL50
	PRINTR	"""From the owl you may learn to think and see. It is a noble bird indeed, and sacred to the Roman goddess Minerva."""
?CCL50:	EQUAL?	FORM,K-FORM-BADGER \?CCL52
	PRINTR	"""The badger is a fierce defender of his territory. He is a fine digger who makes his nest and then fights to the death for it. So must you defend England."""
?CCL52:	EQUAL?	FORM,K-FORM-SALAMANDER \?CCL54
	PRINTR	"""Ah yes. The lizard that they say lives in fire. He doesn't really - but he does excrete a fluid that protects his skin from heat for short periods of time. From him you will learn how to survive the heat of battle."""
?CCL54:	EQUAL?	FORM,K-FORM-EEL \?CCL56
	PRINTR	"""From the eel you will learn how to slip out of tight spots."""
?CCL56:	EQUAL?	FORM,K-FORM-TURTLE \?CCL58
	PRINTR	"""From the turtle you will learn that sometimes it is better to be slow and sturdy than to be swift."""
?CCL58:	EQUAL?	PRSI,CH-DEMON \?CCL60
	FSET?	CH-DEMON,FL-BROKEN \?CCL63
	PRINTR	"""Even though you have defeated him this time, Arthur, his magic remains powerful."""
?CCL63:	PRINTI	"""He is evil incarnate. Many years ago, in a titanic struggle, my gods overcame him and imprisoned him within a mountain. He sits there still, bound by gold manacles, with a key of gold around his neck to taunt him. Should he ever free himself, unspeakable evil will once again descend upon England."""
	CRLF	
	CRLF	
	PRINTR	"""Even though he is manacled, he still has power. When you cross the river, you will find that my magic is no longer of any use to you. That is his land. Go there only if you must."""
?CCL60:	EQUAL?	PRSI,CH-LOT \?CCL65
	PRINTR	"""He is an evil man, ruled by greed. He plots to steal your throne, yet if you can defeat him in battle, he will become loyal to you."""
?CCL65:	EQUAL?	PRSI,CH-PRISONER \?CCL67
	PRINTI	"""He is the village smith who "
	FSET?	CH-PRISONER,FL-AIR \?CCL70
	PRINTI	"was"
	JUMP	?CND68
?CCL70:	PRINTI	"has been"
?CND68:	PRINTR	" wrongly and cruelly imprisoned by Lot."""
?CCL67:	EQUAL?	PRSI,CH-MERLIN \?CCL72
	PRINTR	"""I walk among men, yet I am not a man. I see the future, yet am powerless to control it. I am but a tool to be used by my gods."""
?CCL72:	EQUAL?	PRSI,CH-NIMUE \?CCL74
	PRINTR	"""She is Nimue, the Lady of the Lake. On cold evenings, when story-tellers huddle close around the fire, they tell the legend of her enchantment. Little do they know that the stories are all true."""
?CCL74:	EQUAL?	PRSI,TH-BAG \?CCL76
	PRINTR	"""It is the bag my father's sister gave me when I first left home. Its magic is small, but useful."""
?CCL76:	EQUAL?	PRSI,TH-SILVER-KEY \?CCL78
	PRINTR	"""It is the key to a chamber wherein lies a beautiful lady."""
?CCL78:	EQUAL?	PRSI,RM-CRYSTAL-CAVE \?CCL80
	ZERO?	GL-HINTS-OFF /?CCL83
	PRINTR	"""There may be knowledge there another time, Arthur. Be strong and resist temptation."""
?CCL83:	PRINTR	"""The crystal cave holds much knowledge, Arthur. But be careful. Sometimes it tells us things that we later wish we had learned for ourselves."""
?CCL80:	EQUAL?	PRSI,TH-CRYSTAL-BALL,TH-TORQUE \?CCL85
	PRINTR	"""The crystal contains the answers to all your questions. But use it sparingly, Arthur. Sometimes it reveals things you wish you had reasoned out for yourself."""
?CCL85:	EQUAL?	PRSI,TH-EXCALIBUR \?CCL87
	PRINTR	"""It is the sword of destiny, meant to be wielded by you alone."""
?CCL87:	EQUAL?	PRSI,TH-MAGIC-RING \?CCL89
	PRINTR	"""It's magic is useful. Remember well the words of the man who gave it to you."""
?CCL89:	EQUAL?	PRSI,TH-FUTURE-OBJECT,CH-PLAYER \?CCL91
	PRINTR	"A look of pain crosses Merlin's face. ""The future holds both triumph and sorrow for you, Arthur. But do not dwell on it. Live each day as it is given to you, and leave the future in the hands of the gods."""
?CCL91:	EQUAL?	PRSI,TH-SCROLL \?CCL93
	PRINTR	"""It is of no use to you, Arthur. Its magic is useful only to those who know how to wield it."""
?CCL93:	EQUAL?	PRSI,CH-BLACK-KNIGHT \?CCL95
	PRINTR	"""One need only look at him to discern what master he serves."""
?CCL95:	EQUAL?	PRSI,CH-BLUE-KNIGHT \?CCL97
	PRINTR	"""A harmless old man who loves to joust."""
?CCL97:	EQUAL?	PRSI,CH-RED-KNIGHT \?CCL99
	PRINTR	"""His life's mission is to rid the land of evil."""
?CCL99:	EQUAL?	PRSI,CH-I-KNIGHT \?CCL101
	PRINTR	"""He's just an ordinary man who is trying to turn a peculiar talent into a dishonest living."""
?CCL101:	EQUAL?	PRSI,CH-CELL-GUARD \?CCL103
	PRINTR	"""Like most of Lot's minions, he's not very bright."""
?CCL103:	EQUAL?	PRSI,CH-COOK \?CCL105
	PRINTR	"""His own meals are far better than anyone suspects."""
?CCL105:	EQUAL?	PRSI,CH-DRAGON \?CCL107
	PRINTR	"""If I drank what he drinks, I would breathe fire too."""
?CCL107:	EQUAL?	PRSI,CH-FARMERS \?CCL109
	PRINTR	"""They don't have much to do in the wintertime except sit in the tavern and gossip."""
?CCL109:	EQUAL?	PRSI,CH-GIRL \?CCL111
	PRINTR	"""I'm a poor one to ask for advice about women, Arthur. All I can say is, be careful."""
?CCL111:	EQUAL?	PRSI,CH-IDIOT \?CCL113
	PRINTR	"""He only imagines half of what he thinks he imagines."""
?CCL113:	EQUAL?	PRSI,CH-PEASANT \?CCL115
	PRINTR	"""He is but a humble man who makes his living from the soil."""
?CCL115:	EQUAL?	PRSI,TH-BIRD \?CCL117
	PRINTR	"""He is an infrequent visitor to our shores, and he tells more than he knows."""
?CCL117:	EQUAL?	PRSI,CH-RHYMER \?CCL119
	PRINTR	"""He seems inordinately fond of poetry, doesn't he?"""
?CCL119:	EQUAL?	PRSI,TH-BOAR \?CCL121
	PRINTR	"""Even though he has only one tusk, he is still very dangerous."""
?CCL121:	EQUAL?	PRSI,CH-RAVEN \?CCL123
	PRINTR	"""The giant bird is a menace to all other life in the forest."""
?CCL123:	EQUAL?	PRSI,LG-TOWER \?CCL125
	PRINTR	"""It is the home of a very interesting little old man."""
?CCL125:	EQUAL?	PRSI,RM-TAVERN \?CCL127
	PRINTR	"""Like all such places, it is frequented by men with little to do and much to say."""
?CCL127:	EQUAL?	PRSI,LG-CASTLE \?CCL129
	PRINTR	"""It is Lot's domain, Arthur. You must go in, but be careful when you do so."""
?CCL129:	EQUAL?	PRSI,RM-BOG \?CCL131
	PRINTR	"""The ground there is treacherous and shifting, Arthur. Do not venture in unless you are sure of your path."""
?CCL131:	EQUAL?	PRSI,LG-LAKE \?CCL133
	PRINTR	"""The lake is home to both beauty and the beast."""
?CCL133:	EQUAL?	PRSI,TH-SHERLOCK \?CCL135
	PRINTR	"""It's a wonderful game. I highly recommend it."""
?CCL135:	EQUAL?	PRSI,TH-HAWTHORN \?CCL137
	PRINTR	"Merlin's eyes cloud over as if he is looking far into the future. He mumbles strange words that sound like 'anti-piracy' and 'documentation,' and then he snaps out of his trance as if nothing had happened."
?CCL137:	EQUAL?	PRSI,INFOCOM \?CCL139
	PRINTR	"""As magicians, they're OK. But you should see their Friday afternoon parties."""
?CCL139:	EQUAL?	PRSI,ZORK \?CCL141
	PRINTI	"""Didn't like the book, but I "
	HLIGHT	K-H-BLD
	PRINTI	"loved"
	HLIGHT	K-H-NRM
	PRINTR	" Kim Novak in the movie."""
?CCL141:	EQUAL?	PRSI,ENCHANTER \?CCL143
	PRINTI	"""Now "
	HLIGHT	K-H-BLD
	PRINTI	"there's"
	HLIGHT	K-H-NRM
	PRINTR	" a trilogy to frotz your heart."""
?CCL143:	EQUAL?	PRSI,TH-MASTER \?CCL145
	PRINTR	"""I answer only to the gods."""
?CCL145:	EQUAL?	PRSI,TH-SYMBOLS \?CCL147
	PRINTR	"""They do not concern you, Arthur."""
?CCL147:	EQUAL?	PRSI,TH-CHIVALRY \?CCL149
	PRINTR	"""Chivalrous behavior is nothing more than politeness and common sense, Arthur. If you act with kindness, you have nothing to fear."""
?CCL149:	EQUAL?	PRSI,TH-ENGLAND \?CCL151
	PRINTR	"""These are hard times, Arthur. Your country has need of you."""
?CCL151:	EQUAL?	PRSI,TH-UTHER \?CCL153
	PRINTR	"""He was a great man, your father was. I was proud to know him."""
?CCL153:	EQUAL?	PRSI,TH-MOTHER \?CCL155
	PRINTR	"""She is in a convent now. One day, when you are king, I will take you to her."""
?CCL155:	EQUAL?	PRSI,TH-CELTIC-GODS \?CCL157
	PRINTR	"""Their day may be passing, Arthur. But they are not gone yet."""
?CCL157:	EQUAL?	PRSI,TH-GOD \?CCL159
	PRINTR	"""His day is dawning, Arthur. I cannot serve him, but you must make your own choice."""
?CCL159:	EQUAL?	PRSI,TH-BATES \?CCL161
	PRINTR	"""He's a willing student. But he has much yet to learn."""
?CCL161:	PRINTI	"Merlin shrugs his shoulders"
	ZERO?	GL-HINTS-OFF \?CND162
	PRINTR	" and nods toward the cave. ""Perhaps the answer you seek lies within."""
?CND162:	CRLF	
	RTRUE	
?CCL33:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"The aged wizard gazes back at you with friendly eyes that seem to see the future, as well as the past."


	.FUNCT	RT-TH-SCROLL:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \?CCL5
	PRINTR	"The scroll is covered with strange symbols."
?CCL5:	EQUAL?	PRSA,V?READ /?CCL7
	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
?CCL7:	PRINT	K-NO-READ-SCROLL-MSG
	RTRUE	


	.FUNCT	RT-TH-SYMBOLS:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?READ \?CCL5
	EQUAL?	HERE,RM-OUTSIDE-CRYSTAL-CAVE \?CCL5
	PRINT	K-NO-READ-SCROLL-MSG
	RTRUE	
?CCL5:	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	PRINTR	"The symbols have no meaning to you."

	.ENDSEG

	.SEGMENT "0"


	.FUNCT	RT-TH-BAG:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI /?CCL5
	EQUAL?	PRSA,V?PUT-IN \FALSE
	EQUAL?	PRSO,TH-GOLD-KEY,TH-APPLE \?CCL11
	PRINTI	"You try to put"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTR	" in the bag, but they seem to repel each other, and you fail."
?CCL11:	EQUAL?	PRSO,TH-SWORD,TH-CRUTCH,TH-SHIELD /?CTR12
	EQUAL?	PRSO,TH-SLEAN /?CTR12
	GRTR?	P-MULT,1 \?CCL13
	EQUAL?	PRSO,TH-RED-LANCE,TH-GREEN-LANCE \?CCL13
?CTR12:	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE,TRUE-VALUE,STR?25
	PRINTI	" too large to fit in"
	ICALL	RT-PRINT-OBJ,TH-BAG,K-ART-THE
	PRINTR	"."
?CCL13:	EQUAL?	PRSO,TH-RED-LANCE,TH-GREEN-LANCE \FALSE
	PRINTI	"You look at"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTI	". You look at"
	ICALL	RT-PRINT-OBJ,TH-BAG,K-ART-THE
	PRINTI	". You look at"
	ICALL	RT-PRINT-OBJ,PRSO,K-ART-THE
	PRINTR	". Slowly it dawns on you that it is just not going to work."
?CCL5:	EQUAL?	PRSA,V?READ,V?LOOK-ON,V?EXAMINE \?CCL22
	FSET	TH-BAG,FL-SEEN
	PRINTR	"It is a small black bag, monogrammed with the initial M."
?CCL22:	EQUAL?	PRSA,V?FILL \FALSE
	CALL1	RT-WASTE-OF-TIME-MSG
	RSTACK	

	.ENDSEG

	.SEGMENT "TOWN"


	.FUNCT	RT-TH-CRYSTAL-BALL:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?LOOK-IN /?CTR4
	EQUAL?	PRSA,V?READ,V?LOOK-ON,V?EXAMINE \?CCL5
?CTR4:	FSET	TH-CRYSTAL-BALL,FL-SEEN
	CALL1	V-HINT
	RSTACK	
?CCL5:	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	PRINTI	"As you reach for the ball"
	PRINT	K-NO-TOUCH-CRYSTAL-MSG
	RTRUE	


	.FUNCT	RT-TH-PEDESTAL:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	PRINTI	"As you reach for the pedestal"
	PRINT	K-NO-TOUCH-CRYSTAL-MSG
	RTRUE	

	.ENDSEG

	.SEGMENT "0"


	.FUNCT	RT-TH-TORQUE:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	FSET	TH-TORQUE,FL-SEEN
	ICALL2	THIS-IS-IT,TH-TORQUE
	ICALL	RT-PRINT-OBJ,TH-TORQUE,K-ART-THE,TRUE-VALUE
	PRINTI	" is an open neckband made of twisted metal"
	FSET?	TH-TORQUE,FL-WORN /?CND6
	PRINTI	", and it looks like it's about your size"
?CND6:	PRINTI	". It ends in two knobs, and imbedded in one of the knobs is a sliver of "
	FSET?	TH-CRYSTAL,FL-LOCKED \?CCL10
	PRINTI	"darkened crystal"
	JUMP	?CND8
?CCL10:	PRINTI	"crystal that gives off a faint glow"
?CND8:	PRINTR	"."


	.FUNCT	RT-TH-CRYSTAL:ANY:0:1,CONTEXT,W
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?READ /?CTR4
	EQUAL?	PRSA,V?LOOK-ON,V?LOOK-IN,V?EXAMINE \?CCL5
?CTR4:	FSET	TH-CRYSTAL,FL-SEEN
	EQUAL?	HERE,RM-CRYSTAL-CAVE \?CCL10
	CALL1	V-HINT
	RSTACK	
?CCL10:	FSET?	TH-CRYSTAL,FL-LOCKED /?CTR11
	GETB	K-DEMON-DOMAIN-TBL,0
	INTBL?	HERE,K-DEMON-DOMAIN-TBL+1,STACK,1 \?CCL12
?CTR11:	PRINTR	"The crystal is dark."
?CCL12:	PRINTI	"You gaze intently into the crystal. After a moment, your vision blurs and you become disoriented. It seems you are standing in a darkened cave, gazing into a crystal ball.

"
	SET	'W,GL-HINT-WARNING
	ICALL1	V-HINT
	ZERO?	W \?CND15
	CRLF	
?CND15:	PRINTI	"Your vision clears and you are no longer in the cave.
"
	INC	'GL-CRYSTAL-HINT
	EQUAL?	GL-CRYSTAL-HINT,2 \TRUE
	FSET	TH-CRYSTAL,FL-LOCKED
	ADD	GL-MOVES,5
	ICALL	RT-QUEUE,RT-I-CRYSTAL,STACK
	PRINTR	"
The crystal goes dark. Its limited power has been temporarily exhausted."
?CCL5:	EQUAL?	PRSA,V?TAKE \FALSE
	PRINTI	"You can't remove the "
	ICALL2	NP-PRINT,PRSO-NP
	PRINTI	" from"
	ICALL	RT-PRINT-OBJ,TH-TORQUE,K-ART-THE
	PRINTR	"."


	.FUNCT	RT-I-CRYSTAL:ANY:0:0
	FCLEAR	TH-CRYSTAL,FL-LOCKED
	RFALSE	


	.FUNCT	RT-GN-KEY:ANY:2:2,TBL,FINDER,PTR,N,OBJ,I,O
	ADD	TBL,8 >PTR
	GET	TBL,1 >N
	INTBL?	P-IT-OBJECT,PTR,N \?CCL3
	SET	'OBJ,P-IT-OBJECT
	JUMP	?CND1
?CCL3:	EQUAL?	HERE,RM-TAV-KITCHEN \?CCL5
	SET	'OBJ,TH-CUPBOARD-KEY
	JUMP	?CND1
?CCL5:	EQUAL?	HERE,RM-DEMON-HALL \?CCL7
	SET	'OBJ,TH-GOLD-KEY
	JUMP	?CND1
?CCL7:	EQUAL?	HERE,RM-TOW-CLEARING,RM-CIRC-ROOM \?CCL9
	SET	'OBJ,TH-IVORY-KEY
	JUMP	?CND1
?CCL9:	EQUAL?	HERE,RM-ISLAND,RM-UG-CHAMBER \?CCL11
	SET	'OBJ,TH-SILVER-KEY
	JUMP	?CND1
?CCL11:	EQUAL?	HERE,RM-CELL,RM-HALL \?CCL13
	SET	'OBJ,TH-MASTER-KEY
	JUMP	?CND1
?CCL13:	SET	'I,N
?PRG14:	DLESS?	'I,0 /?CND1
	GET	PTR,0 >O
	FSET?	O,FL-SEEN \?CND16
	ZERO?	OBJ /?CCL22
	SET	'OBJ,FALSE-VALUE
?CND1:	ZERO?	OBJ \?CCL24
	RETURN	OBJ
?CCL22:	SET	'OBJ,O
?CND16:	ADD	PTR,2 >PTR
	JUMP	?PRG14
?CCL24:	PRINTC	91
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-THE,TRUE-VALUE
	PRINTC	93
	CRLF	
	RETURN	OBJ

	.ENDSEG

	.SEGMENT "OWL"


	.FUNCT	RT-RM-ABOVE-MERCAVE:ANY:0:1,CONTEXT
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL3
	FSET	LG-FOREST,FL-SEEN
	FSET	RM-MOOR,FL-SEEN
	FSET	RM-MEADOW,FL-SEEN
	PRINTI	"You are hovering over Merlin's cave. The prevailing northeast breeze would carry you over the enchanted forest, and just to the south of that is the edge of the woods. The meadow lies below you to the southeast.
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


	.FUNCT	RT-LG-HILL:ANY:0:1,CONTEXT
	ZERO?	CONTEXT \FALSE
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"It looks like one of the 'hollow' hills, where wizards are said to dwell."

	.ENDSEG

	.ENDI
