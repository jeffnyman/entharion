
	.SEGMENT "TOWN"


	.FUNCT	RT-RM-TOWN-SQUARE:ANY:0:1,CONTEXT,OBJ1,OBJ2,N
	EQUAL?	CONTEXT,M-ENTER \?CCL3
	SET	'GL-PICTURE-NUM,K-PIC-TOWN-SQUARE
	EQUAL?	GL-WINDOW-TYPE,K-WIN-PICT \?CND4
	ICALL1	RT-UPDATE-PICT-WINDOW
?CND4:	IN?	TH-ARMOUR,CH-I-KNIGHT \?CCL8
	SET	'OBJ1,TH-ARMOUR
	JUMP	?CND6
?CCL8:	IN?	TH-SHIELD,CH-I-KNIGHT \?CCL10
	SET	'OBJ1,TH-SHIELD
	JUMP	?CND6
?CCL10:	IN?	TH-PUMICE,CH-I-KNIGHT \?CCL12
	SET	'OBJ1,TH-PUMICE
	JUMP	?CND6
?CCL12:	IN?	TH-IVORY-KEY,CH-I-KNIGHT \?CND6
	SET	'OBJ1,TH-IVORY-KEY
?CND6:	ZERO?	OBJ1 /FALSE
	IN?	TH-ARMOUR,CH-IDIOT \?CCL18
	SET	'OBJ2,TH-ARMOUR
	JUMP	?CND16
?CCL18:	IN?	TH-SHIELD,CH-IDIOT \?CCL20
	SET	'OBJ2,TH-SHIELD
	JUMP	?CND16
?CCL20:	IN?	TH-PUMICE,CH-IDIOT \?CCL22
	SET	'OBJ2,TH-PUMICE
	JUMP	?CND16
?CCL22:	IN?	TH-IVORY-KEY,CH-IDIOT \?CND16
	SET	'OBJ2,TH-IVORY-KEY
?CND16:	ZERO?	OBJ2 /?CCL26
	ICALL	RT-IDIOT-GIVE,OBJ2,CH-I-KNIGHT
	ICALL2	RT-IDIOT-TAKE,OBJ1
	JUMP	?CND24
?CCL26:	GET	K-IDIOT-OBJ-TBL,0
	LESS?	STACK,K-IDIOT-OBJ-MAX \?CCL28
	ICALL2	RT-IDIOT-TAKE,OBJ1
	JUMP	?CND24
?CCL28:	REMOVE	OBJ1
?CND24:	FSET	CH-I-KNIGHT,FL-BROKEN
	RFALSE	
?CCL3:	EQUAL?	CONTEXT,M-ENTERED \?CCL30
	CALL	RT-QUEUE,RT-I-IDIOT-MSG,GL-MOVES
	RSTACK	
?CCL30:	EQUAL?	CONTEXT,M-EXIT \?CCL32
	ICALL2	RT-DEQUEUE,RT-I-IDIOT-MSG
	RFALSE	
?CCL32:	EQUAL?	CONTEXT,M-BEG \?CCL34
	CALL2	RT-IS-QUEUED?,RT-I-IDIOT-MSG
	ZERO?	STACK \?CND35
	ICALL	RT-QUEUE,RT-I-IDIOT-MSG,GL-MOVES
?CND35:	SET	'GL-IDIOT-MSG,TRUE-VALUE
	RFALSE	
?CCL34:	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK,M-LOOK \?CCL38
	EQUAL?	CONTEXT,M-LOOK \?CCL41
	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE,STR?25
	ICALL1	RT-STANDING-MSG
	PRINTI	" in"
	JUMP	?CND39
?CCL41:	ICALL	RT-PRINT-OBJ,WINNER,K-ART-THE,TRUE-VALUE
	ICALL1	RT-WALK-MSG
	PRINTI	" into"
?CND39:	FSET	LG-CASTLE,FL-SEEN
	FSET	RM-TAVERN,FL-SEEN
	FSET	RM-VILLAGE-GREEN,FL-SEEN
	FSET	CH-IDIOT,FL-SEEN
	ICALL2	THIS-IS-IT,CH-IDIOT
	PRINTI	" the town square. The churchyard lies to the north, and the castle to the east. To your south you see the entrance to the town's only tavern, and to the west is the village green.

The village idiot is here, idly playing with"
	ICALL1	RT-IDIOT-PLAY-MSG
	EQUAL?	CONTEXT,M-F-LOOK,M-V-LOOK /?CTR43
	EQUAL?	PRSA,V?LOOK \?CCL44
?CTR43:	CALL2	RT-I-IDIOT-MSG,TRUE-VALUE
	ZERO?	STACK \FALSE
	CRLF	
	RFALSE	
?CCL44:	CRLF	
	RFALSE	
?CCL38:	EQUAL?	CONTEXT,M-END \?CCL50
	EQUAL?	PRSA,V?TRANSFORM \FALSE
	EQUAL?	GL-PLAYER-FORM,GL-OLD-FORM /FALSE
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ICALL2	THIS-IS-IT,CH-IDIOT
	CRLF	
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTR	" placidly accepts your transformation and drools on you."
?CCL50:	ZERO?	CONTEXT \FALSE
	RFALSE	


	.FUNCT	RT-CH-IDIOT:ANY:0:1,CONTEXT,OTHER,OBJ,N
	EQUAL?	CONTEXT,M-WINNER,FALSE-VALUE \?CCL3
	EQUAL?	PRSA,V?THANK,V?GOODBYE,V?HELLO \?CCL3
	EQUAL?	PRSA,V?HELLO \?CCL8
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTR	"The idiot says brightly, ""Hello!"" and looks at you expectantly."
?CCL8:	EQUAL?	PRSA,V?GOODBYE \?CCL10
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTR	"A cloud passes over the idiot's face. ""Goodbye,"" he says sadly."
?CCL10:	EQUAL?	PRSA,V?THANK \FALSE
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTI	"The idiot smiles brightly and says, ""OK."""
	CRLF	
	FSET?	CH-PLAYER,FL-AIR /TRUE
	FSET	CH-PLAYER,FL-AIR
	ICALL	RT-SCORE-MSG,10,0,0,0
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,M-WINNER \?CCL16
	EQUAL?	PRSA,V?TELL-ABOUT \?CCL19
	EQUAL?	PRSO,CH-PLAYER /FALSE
?CCL19:	EQUAL?	PRSA,V?WHAT,V?WHO /FALSE
	CALL1	RT-IDIOT-WHISPERS-MSG
	RSTACK	
?CCL16:	EQUAL?	CONTEXT,M-CONT \?CCL25
	EQUAL?	PRSA,V?ASK-FOR \?CCL28
	EQUAL?	PRSO,CH-IDIOT \?CCL28
	ZERO?	NOW-PRSI /?CCL28
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINT	K-IDIOT-TRADE-MSG
	CRLF	
	RTRUE	
?CCL28:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL33
	EQUAL?	PRSO,CH-IDIOT \?CCL33
	ZERO?	NOW-PRSI /?CCL33
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTI	"""I got"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-HIM
	PRINTI	" from my invisible playmate,"" he says, giving"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-HIM
	PRINTI	" a little kick with his foot. "
	PRINT	K-IDIOT-TRADE-MSG
	CRLF	
	RTRUE	
?CCL33:	EQUAL?	PRSA,V?TRADE-FOR \?CCL38
	EQUAL?	PRSO,CH-IDIOT /FALSE
	ZERO?	NOW-PRSI /?CCL43
	CALL	RT-IDIOT-TRADE,PRSO,PRSI
	RSTACK	
?CCL43:	CALL	RT-IDIOT-TRADE,PRSI,PRSO
	RSTACK	
?CCL38:	CALL1	TOUCH-VERB?
	ZERO?	STACK /FALSE
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ICALL2	THIS-IS-IT,CH-IDIOT
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTI	" smacks you on the head and says, ""Nasty"
	ICALL1	RT-FORM-MSG
	PRINTI	". Keep away from my "
	SET	'GL-IDIOT-STUFF,TRUE-VALUE
	ZERO?	NOW-PRSI /?CCL48
	ICALL2	RT-PRINT-DESC,PRSI
	JUMP	?CND46
?CCL48:	ICALL2	RT-PRINT-DESC,PRSO
?CND46:	SET	'GL-IDIOT-STUFF,FALSE-VALUE
	PRINTR	"."""
?CCL25:	ZERO?	CONTEXT \FALSE
	ZERO?	NOW-PRSI /?CCL52
	EQUAL?	PRSA,V?SHOW,V?TRADE-WITH,V?GIVE \FALSE
	CALL2	RT-IDIOT-TRADE,PRSO
	RSTACK	
?CCL52:	EQUAL?	PRSA,V?TELL \?CCL57
	ZERO?	P-CONT \FALSE
?CCL57:	EQUAL?	PRSA,V?EXAMINE \?CCL61
	FSET	CH-IDIOT,FL-SEEN
	PRINTI	"The idiot smiles back at you with a lopsided grin, and continues to play with"
	ICALL1	RT-IDIOT-PLAY-MSG
	CALL2	RT-I-IDIOT-MSG,TRUE-VALUE
	ZERO?	STACK \TRUE
	CRLF	
	RTRUE	
?CCL61:	EQUAL?	PRSA,V?LISTEN \?CCL65
	CALL1	RT-I-IDIOT-MSG
	RSTACK	
?CCL65:	EQUAL?	PRSA,V?ASK-ABOUT \?CCL67
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	EQUAL?	PRSI,TH-ANYTHING \?CCL70
	PRINTI	"""I meant anything in the "
	HLIGHT	K-H-BLD
	PRINTI	"game"
	HLIGHT	K-H-NRM
	PRINTR	", stupid."""
?CCL70:	EQUAL?	PRSI,CH-BLUE-KNIGHT,TH-BLUE-PAVILION \?CCL72
	PRINTI	"""The Blue Knight likes it when you blow the horn. Sometimes I go there in the middle of the night and play "
	HLIGHT	K-H-ITL
	PRINTI	"Bugler's Holiday."
	HLIGHT	K-H-NRM
	PRINTR	""""
?CCL72:	EQUAL?	PRSI,CH-RED-KNIGHT \?CCL74
	PRINTR	"""He didn't want to be red, but all the other colors were taken, so they made him."""
?CCL74:	EQUAL?	PRSI,CH-BLACK-KNIGHT \?CCL76
	PRINTR	"""They usually are. But then they get brighter towards dawn."""
?CCL76:	EQUAL?	PRSI,CH-KRAKEN \?CCL78
	PRINTR	"""He looks more like an octopus to me. Maybe Bates is too stupid to know the difference."""
?CCL78:	EQUAL?	PRSI,CH-RAVEN \?CCL80
	PRINTR	"""If he weren't quite so big, then he'd be a lot smaller."""
?CCL80:	EQUAL?	PRSI,CH-DRAGON \?CCL82
	PRINTR	"""If you tickle his nose and then hold his mouth, he'll explode!"""
?CCL82:	EQUAL?	PRSI,CH-PEASANT \?CCL84
	SET	'GL-QUESTION,1
	PRINTR	"""Why would I know anything about him?"" He looks at you strangely for a minute. ""Hey! Are you just asking me stuff for the fun of it?"""
?CCL84:	EQUAL?	PRSI,CH-BASILISK \?CCL86
	PRINTR	"The idiot looks in his pockets and then says, ""Sorry, I don't have any with me right now."""
?CCL86:	EQUAL?	PRSI,CH-PRISONER \?CCL88
	PRINTR	"""Big guy? Thick muscles? Used to run the smithy? Disappeared a couple days ago? Never heard of him."""
?CCL88:	EQUAL?	PRSI,CH-DEMON \?CCL90
	PRINTR	"""He's cute when he's mad."""
?CCL90:	EQUAL?	PRSI,CH-NIMUE,CH-GIRL \?CCL92
	ICALL2	SETUP-ORPHAN,STR?377
	PRINTR	"""Hubba-hubba! Hotcha-cha! Hot-diggity-dog! Don't spare the horses! Remember the Maine! Exact change only! What were we talking about?"""
?CCL92:	EQUAL?	PRSI,CH-LEPRECHAUN \?CCL94
	PRINTR	"The idiot wiggles his finger in his ear and says, ""Excuse me. I could have sworn you just asked me about a leprechaun."""
?CCL94:	EQUAL?	PRSI,CH-PLAYER \?CCL96
	PRINTR	"""Sorry. I haven't seen you. Maybe you should look somewhere else."""
?CCL96:	EQUAL?	PRSI,CH-RHYMER \?CCL98
	PRINTR	"""He told me a poem once. 'There was an old woman who lived in a shoe. Then a giant came along and put it on, and he squashed her.' It doesn't rhyme, but he said it's because people shouldn't live in shoes - and so far, I haven't."""
?CCL98:	EQUAL?	PRSI,CH-FARMERS \?CCL100
	PRINTR	"""They're in the tavern, plowing themselves under."""
?CCL100:	EQUAL?	PRSI,CH-COURTIERS \?CCL102
	PRINTR	"""If I had known there was going to be a quiz, I wouldn't have studied so hard!"""
?CCL102:	EQUAL?	PRSI,CH-LOT \?CCL104
	PRINTR	"The idiot frowns and says, ""He's not a very nice man."""
?CCL104:	EQUAL?	PRSI,CH-MERLIN \?CCL106
	PRINTR	"The idiot smiles and says, ""He's silly. Sometimes he turns me into a frog."""
?CCL106:	EQUAL?	PRSI,CH-COOK \?CCL108
	PRINTR	"""He's only there to make the game harder. But don't tell him I said so."""
?CCL108:	EQUAL?	PRSI,CH-IDIOT \?CCL110
	PRINTR	"""Hi! My name's Floyd. Ducks go quack and geese go honk. Your name's Arthur, but I'm not supposed to know that because I'm an idiot."""
?CCL110:	EQUAL?	PRSI,CH-I-KNIGHT \?CCL112
	PRINTR	"""Sometimes he brings me presents, and we trade for them."""
?CCL112:	EQUAL?	PRSI,CH-CELL-GUARD,CH-SOLDIERS,TH-SWORD /?CTR113
	EQUAL?	PRSI,TH-RED-LANCE,TH-GREEN-LANCE,TH-ARMOUR /?CTR113
	EQUAL?	PRSI,TH-BLACK-ARMOUR,TH-POLLAXE,TH-SHIELD /?CTR113
	EQUAL?	PRSI,TH-BROKEN-DAGGER \?CCL114
?CTR113:	PRINTR	"""I don't have much use for soldiers or weapons. I do all my fighting with my keen intellect and razor wit. Those are the only sharp things they let me have."""
?CCL114:	EQUAL?	PRSI,TH-BOAR \?CCL120
	PRINTR	"""Well, you're not very interesting, but I wouldn't go that far."""
?CCL120:	EQUAL?	PRSI,TH-BIRD \?CCL122
	SET	'GL-QUESTION,1
	PRINTR	"""How many other 6'7"" white guys can shoot like that?"""
?CCL122:	EQUAL?	PRSI,TH-APPLE \?CCL124
	PRINTR	"""I don't think they should have sued, but what do I know - I'm just an idiot."""
?CCL124:	EQUAL?	PRSI,TH-BELLS \?CCL126
	PRINTR	"""They've got a nice beat, but you can't dance to them."""
?CCL126:	EQUAL?	PRSI,TH-BRACELET \?CCL128
	PRINTR	"The idiot furrows his brow and thinks furiously for a moment. Then he says, ""OK. Go ahead and ask me about the bracelet."""
?CCL128:	EQUAL?	PRSI,TH-BRASS-EGG,TH-RAVEN-EGG \?CCL130
	SET	'GL-QUESTION,1
	PRINTI	"""Are you sure you don't mean the "
	EQUAL?	PRSI,TH-BRASS-EGG \?CCL133
	PRINTI	"raven's"
	JUMP	?CND131
?CCL133:	PRINTI	"brass"
?CND131:	PRINTR	" egg? I get them confused."""
?CCL130:	EQUAL?	PRSI,TH-CRYSTAL-BALL \?CCL135
	PRINTR	"""Sometimes, when Merlin's not around, I use it to go bowling."""
?CCL135:	EQUAL?	PRSI,TH-FLEECE \?CCL137
	PRINTR	"""I used to have them too. But if you take enough baths, they go away."""
?CCL137:	EQUAL?	PRSI,TH-DRAGON-HAIR \?CCL139
	PRINTR	"""Yes! Yes! Exactly!"""
?CCL139:	EQUAL?	PRSI,TH-CONKERS \?CCL141
	SET	'GL-QUESTION,1
	PRINTR	"The idiot slaps himself on the forehead and says, ""Wow! Why didn't I think of that?"""
?CCL141:	EQUAL?	PRSI,TH-HAWTHORN \?CCL143
	PRINTR	"""You can't make me talk if I don't want to."""
?CCL143:	EQUAL?	PRSI,TH-HORN \?CCL145
	PRINTR	"""I hung it on a tree outside a pretty blue pavilion."""
?CCL145:	EQUAL?	PRSI,TH-HORSE,TH-BLUE-HORSE \?CCL147
	PRINTR	"""Well, let's see. It should have four legs - unless one is missing, in which case it would only have three. But if two were missing, then it would have two. Not the two that were missing, you understand, but the other two, the ones that were left. After that, it gets pretty complicated."""
?CCL147:	EQUAL?	PRSI,TH-MAGIC-RING \?CCL149
	SET	'GL-QUESTION,1
	PRINTR	"""Don't you think we should go steady first?"""
?CCL149:	EQUAL?	PRSI,TH-OAK \?CCL151
	PRINTR	"The idiot claps his hands with glee and cries, ""I knew you were going to ask me that!"""
?CCL151:	EQUAL?	PRSI,TH-PASSWORD \?CCL153
	PRINTR	"""I know what it is, because I can look in the game code when you're not here. But I'm not supposed to tell you."""
?CCL153:	EQUAL?	PRSI,TH-PUMICE \?CCL155
	PRINTR	"""The stones are quarried by a man named Proctor, who sells them to a man named Gamble. But no one thinks anything will come of it."""
?CCL155:	EQUAL?	PRSI,TH-TUSK \?CCL157
	PRINTR	"""I suppose you could put one where your nose is now. But it would be awfully hard to see around."""
?CCL157:	EQUAL?	PRSI,TH-WHISKY,TH-WHISKY-JUG,TH-BEER /?CTR158
	EQUAL?	PRSI,TH-TANKARDS \?CCL159
?CTR158:	PRINTR	"""The more people drink, the more they understand me."""
?CCL159:	EQUAL?	PRSI,TH-JOUST \?CCL163
	PRINTR	"""No thanks!"" the idiot says brightly. ""I always drop my lance a lot."""
?CCL163:	EQUAL?	PRSI,TH-BAG \?CCL165
	PRINTR	"""I used to have one just like it, but a tester put it inside itself and it disappeared."""
?CCL165:	EQUAL?	PRSI,TH-BARREL \?CCL167
	PRINTR	"""I have a cousin named Beryl - but I guess that doesn't count."""
?CCL167:	EQUAL?	PRSI,TH-CAGE \?CCL169
	PRINTR	"""If everyone lived in a cage, then there wouldn't be anyone who didn't."""
?CCL169:	EQUAL?	PRSI,TH-CASTLE-FIRE,TH-COTTAGE-FIRE,TH-TAVERN-FIRE \?CCL171
	SET	'GL-QUESTION,1
	PRINTR	"""When a fire goes out, where does it go? And who pays for the drinks?"""
?CCL171:	EQUAL?	PRSI,TH-CRUTCH \?CCL173
	SET	'GL-QUESTION,1
	PRINTR	"""People use them to lean on when they break their legs. Geez, don't you know anything?"""
?CCL173:	EQUAL?	PRSI,TH-GHOSTS \?CCL175
	PRINTR	"""Ghosts don't exist - except for the ones that do."""
?CCL175:	EQUAL?	PRSI,TH-GLASS \?CCL177
	SET	'GL-QUESTION,1
	PRINTR	"""Say, isn't that the piece of red glass from Sherlock?"""
?CCL177:	EQUAL?	PRSI,TH-MANACLES \?CCL179
	PRINTR	"""Geez, you know about them already? I haven't figured out how to get through the bog yet."""
?CCL179:	EQUAL?	PRSI,TH-SCROLL \?CCL181
	PRINTR	"""Scroll spelled backwards is llorcs, which is the Welsh name for nasty creatures that live in adventure games."""
?CCL181:	EQUAL?	PRSI,TH-SLEAN,TH-GAUNTLET \?CCL183
	PRINTR	"""I know you need it to win the game, but they didn't tell me why."""
?CCL183:	EQUAL?	PRSI,TH-TORQUE,TH-CRYSTAL \?CCL185
	PRINTR	"""If you look in the crystal, you get a hint. But it's not as much fun that way."""
?CCL185:	EQUAL?	PRSI,TH-MINNOW,TH-MIDGES,TH-CHEESE /?CTR186
	EQUAL?	PRSI,TH-SPICE,TH-SPICE-BOTTLE,TH-DEAD-MOUSE /?CTR186
	EQUAL?	PRSI,TH-WEEDS \?CCL187
?CTR186:	PRINTR	"""No thanks! If I eat anything now, I'll just be hungry again later."""
?CCL187:	EQUAL?	PRSI,TH-STONE \?CCL192
	PRINTI	"""It's just a stone's throw from here, if you could throw a stone that far."""
	RTRUE	
?CCL192:	EQUAL?	PRSI,RM-BOG \?CCL194
	PRINTR	"A cloud passes over the idiot's face. ""I dunno. Every time I go in there, I get killed."""
?CCL194:	EQUAL?	PRSI,RM-TAVERN \?CCL196
	SET	'GL-QUESTION,1
	PRINTR	"The idiot looks around nervously and says, ""What tavern?"""
?CCL196:	EQUAL?	PRSI,RM-FORD \?CCL198
	PRINTR	"""The T-bird is nice, but management's gone to hell since Iacocca left."""
?CCL198:	EQUAL?	PRSI,RM-CHURCH,RM-CHURCHYARD \?CCL200
	PRINTR	"""That's where the dead people live."""
?CCL200:	EQUAL?	PRSI,RM-TOWN-SQUARE \?CCL202
	PRINTR	"""It's prime real estate. I'm thinking of leasing the air rights to Trump."""
?CCL202:	EQUAL?	PRSI,TH-SKY,RM-MEADOW,TH-GROUND \?CCL204
	PRINTR	"""Grass is green. The sky is blue. Some dragons are purple, and some are not."""
?CCL204:	EQUAL?	PRSI,LG-FOREST,LG-ENCHANTED-TREES,LG-CHASM /?CTR205
	EQUAL?	PRSI,LG-TOWER,RM-RAVEN-TREE,RM-GLADE /?CTR205
	EQUAL?	PRSI,RM-GROVE,TH-ROCK,TH-DIRECTIONS \?CCL206
?CTR205:	PRINT	K-IDIOT-DIRECTION-MSG
	RTRUE	
?CCL206:	EQUAL?	PRSI,LG-CASTLE-GATE,LG-CHURCH-GATE \?CCL211
	PRINTR	"""I don't know much about gates - except for all that secret stuff about Bill Gates, but I'm not supposed to tell."""
?CCL211:	EQUAL?	PRSI,LG-PEAT,TH-PEAT-BRICK \?CCL213
	PRINTR	"""I peat. You peat. He, she or it peats. We peat, you peat, they peat. Pretty good, huh? Ask me another."""
?CCL213:	EQUAL?	PRSI,LG-THATCH \?CCL215
	PRINTR	"""It's sorta like hair, except it's harder to scratch."""
?CCL215:	EQUAL?	PRSI,LG-TOWN \?CCL217
	PRINTR	"""It's an OK burg, I guess. But it's not nearly as exciting as Blicester on Rumpleston."""
?CCL217:	EQUAL?	PRSI,LG-CASTLE \?CCL219
	PRINTR	"""It's a fun place to play. It's got secret passages and everything."""
?CCL219:	EQUAL?	PRSI,TH-EXCALIBUR \?CCL221
	SET	'GL-QUESTION,1
	PRINTR	"""I don't think I know it. Could you hum a few bars?"""
?CCL221:	EQUAL?	PRSI,TH-SHERLOCK \?CCL223
	PRINTR	"""It was lots of fun. I got to drive the growler cab."""
?CCL223:	EQUAL?	PRSI,ZORK \?CCL225
	PRINTR	"""I fell asleep in the kitchen and when I woke up, the game was over."""
?CCL225:	EQUAL?	PRSI,TH-STATIONFALL \?CCL227
	PRINTR	"""It's even more fun than hider-seeker!"""
?CCL227:	EQUAL?	PRSI,TH-BECK \?CCL229
	PRINTR	"""It tickles when he types on me."""
?CCL229:	EQUAL?	PRSI,TH-BATES \?CCL231
	PRINTR	"""If he had any real creativity, he would have made up his own character, instead of stealing me from Meretzky."""
?CCL231:	EQUAL?	PRSI,TH-MERETZKY \?CCL233
	PRINTR	"""He will have invented my namesake someday!"""
?CCL233:	EQUAL?	PRSI,INFOCOM \?CCL235
	PRINTR	"""Somehow, I seem to fit right in."""
?CCL235:	FSET?	PRSI,FL-KEY /?CTR236
	EQUAL?	PRSI,TH-CUPBOARD \?CCL237
?CTR236:	PRINTR	"""I have a simple way of remembering which key fits where. Just say to yourself, 'Every Good Boy Deserves Favour.' Then take the first letters and swap them with the last letters, multiply by nine-fifths and add thirty-two. Whatever is left over at the end is the answer."""
?CCL237:	FSET?	PRSI,FL-DOOR \?CCL241
	PRINTR	"""I know all about doors. If you're standing behind one when you close it, you can get your nose stuck in the crack."""
?CCL241:	IN?	PRSI,ROOMS /?CTR242
	EQUAL?	PRSI,LG-LAKE,LG-MOUNTAIN \?CCL243
?CTR242:	PRINTR	"""Oooh. I haven't been THERE in ages."""
?CCL243:	CALL1	RT-IDIOT-WHISPERS-MSG
	RSTACK	
?CCL67:	EQUAL?	PRSA,V?ASK-FOR \?CCL247
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	EQUAL?	PRSI,TH-DIRECTIONS \?CCL250
	PRINT	K-IDIOT-DIRECTION-MSG
	RTRUE	
?CCL250:	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE,STR?176
	PRINTI	" puzzled, and says, ""I'd give"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-HIM
	PRINTI	" to you, but I don't have"
	ICALL	RT-PRINT-OBJ,PRSI,K-ART-HIM
	PRINTR	"."""
?CCL247:	CALL1	SPEAKING-VERB?
	ZERO?	STACK /?CCL252
	IN?	CH-IDIOT,HERE \?CCL252
	CALL1	RT-IDIOT-WHISPERS-MSG
	RSTACK	
?CCL252:	EQUAL?	PRSA,V?ATTACK \?CCL256
	ZERO?	GL-PLAYER-FORM \FALSE
	MOVE	CH-MERLIN,HERE
	PRINTI	"The idiot is powerless to stop your attack, and you slay him mercilessly. "
	PRINT	K-MERLIN-WASTED-MSG
	CRLF	
	CALL1	RT-END-OF-GAME
	RSTACK	
?CCL256:	EQUAL?	PRSA,V?EAT \FALSE
	PRINTI	"You gnaw briefly on the idiot's leg, but quit when he begins to put salt and pepper on your "
	ZERO?	GL-PLAYER-FORM \?CCL264
	PRINTI	"arm"
	JUMP	?CND262
?CCL264:	PRINTI	"tail"
?CND262:	PRINTR	"."


	.FUNCT	RT-IDIOT-PLAY-MSG:ANY:0:0,N,OBJ,I,1ST?
	GET	K-IDIOT-OBJ-TBL,0 >N
	SET	'1ST?,TRUE-VALUE
?PRG1:	IGRTR?	'I,N /?REP2
	ZERO?	1ST? /?CCL8
	SET	'1ST?,FALSE-VALUE
	JUMP	?CND6
?CCL8:	EQUAL?	I,N /?PRD10
	PUSH	1
	JUMP	?PEN9
?PRD10:	PUSH	0
?PEN9:	ICALL2	RT-COMMA-MSG,STACK
?CND6:	GET	K-IDIOT-OBJ-TBL,I >OBJ
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-A
	JUMP	?PRG1
?REP2:	PRINTI	" that lie"
	EQUAL?	N,1 \?CND12
	ZERO?	OBJ /?CND12
	FSET?	OBJ,FL-PLURAL \?CCL13
	FSET?	OBJ,FL-COLLECTIVE \?CND12
?CCL13:	PRINTC	115
?CND12:	PRINTI	" at his feet."
	RTRUE	


	.FUNCT	RT-IDIOT-WHISPERS-MSG:ANY:0:0
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTI	"The idiot looks around to make sure no one is watching the two of you. Beckoning you to come closer, he whispers in your ear,"
	CALL2	RT-PICK-NEXT,K-IDIOT-MSG-TBL
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	RT-I-IDIOT-MSG:ANY:0:1,SP?
	EQUAL?	HERE,RM-TOWN-SQUARE \FALSE
	EQUAL?	PRSA,V?WAIT \?CND1
	ZERO?	GL-IDIOT-WAIT \FALSE
?CND1:	FSET?	CH-PLAYER,FL-ASLEEP \?CCL9
	CALL2	RT-IS-QUEUED?,RT-I-SLEEP
	ADD	STACK,1
	ICALL	RT-QUEUE,RT-I-IDIOT-MSG,STACK
	RFALSE	
?CCL9:	ZERO?	GL-CLK-RUN /?CND7
	ADD	GL-MOVES,1
	ICALL	RT-QUEUE,RT-I-IDIOT-MSG,STACK
?CND7:	EQUAL?	PRSA,V?WAIT \?CCL13
	SET	'GL-IDIOT-WAIT,TRUE-VALUE
	ICALL2	THIS-IS-IT,CH-IDIOT
	PRINTI	"
While you wait,"
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE
	PRINTI	" mumbles quietly to himself."
	CRLF	
	RFALSE	
?CCL13:	ZERO?	GL-IDIOT-MSG /FALSE
	SET	'GL-IDIOT-WAIT,FALSE-VALUE
	ICALL2	THIS-IS-IT,CH-IDIOT
	ZERO?	GL-CLK-RUN /?CCL18
	CRLF	
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	JUMP	?CND16
?CCL18:	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ZERO?	SP? /?CND19
	PRINTC	32
?CND19:	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-HE,TRUE-VALUE
?CND16:	PRINTI	" mumbles,"
	CALL2	RT-PICK-NEXT,K-IDIOT-MSG-TBL
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	RT-IDIOT-TRADE:ANY:1:2,OBJ,ID
	ZERO?	ID \?CND1
	GET	K-IDIOT-OBJ-TBL,0
	RANDOM	STACK
	GET	K-IDIOT-OBJ-TBL,STACK >ID
?CND1:	EQUAL?	OBJ,ID \?CCL5
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTI	" looks puzzled."
	CRLF	
	CALL2	RT-AUTHOR-MSG,STR?386
	RSTACK	
?CCL5:	IN?	OBJ,CH-IDIOT \?CCL7
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTI	" carefully exchanges"
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-THE
	PRINTI	" with"
	ICALL	RT-PRINT-OBJ,ID,K-ART-THE
	PRINTC	46
	CRLF	
	CALL2	RT-AUTHOR-MSG,STR?387
	RSTACK	
?CCL7:	FSET?	OBJ,FL-TAKEABLE /?CCL9
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTI	" says, ""Hey, you can't trade"
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-THE
	PRINTR	"."""
?CCL9:	CALL2	RT-NOT-HOLDING-MSG?,OBJ
	ZERO?	STACK \TRUE
	ICALL2	RT-IDIOT-GIVE,ID
	ICALL2	RT-IDIOT-TAKE,OBJ
	SET	'GL-IDIOT-MSG,FALSE-VALUE
	PRINTI	"""Oooh look! "
	SET	'GL-IDIOT-STUFF,TRUE-VALUE
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-A,TRUE-VALUE
	SET	'GL-IDIOT-STUFF,FALSE-VALUE
	PRINTI	"!"" "
	ICALL	RT-PRINT-OBJ,CH-IDIOT,K-ART-THE,TRUE-VALUE
	PRINTI	" takes"
	ICALL	RT-PRINT-OBJ,OBJ,K-ART-THE
	PRINTI	" and gives you"
	ICALL	RT-PRINT-OBJ,ID,K-ART-THE
	PRINTC	46
	CRLF	
	BOR	GL-UPDATE-WINDOW,5 >GL-UPDATE-WINDOW
	EQUAL?	GL-WINDOW-TYPE,K-WIN-INVT \?CCL14
	ICALL1	RT-UPDATE-INVT-WINDOW
	RTRUE	
?CCL14:	EQUAL?	GL-WINDOW-TYPE,K-WIN-DESC \TRUE
	ICALL1	RT-UPDATE-DESC-WINDOW
	RTRUE	


	.FUNCT	RT-IDIOT-TAKE:ANY:1:1,OBJ,N
	MOVE	OBJ,CH-IDIOT
	FSET	OBJ,FL-NO-LIST
	GET	K-IDIOT-OBJ-TBL,0
	ADD	STACK,1 >N
	PUT	K-IDIOT-OBJ-TBL,0,N
	PUT	K-IDIOT-OBJ-TBL,N,OBJ
	RTRUE	


	.FUNCT	RT-IDIOT-GIVE:ANY:1:2,OBJ,PERSON,L,N,PTR
	ASSIGNED?	'PERSON /?CND1
	SET	'PERSON,CH-PLAYER
?CND1:	MOVE	OBJ,PERSON
	FCLEAR	OBJ,FL-NO-LIST
	GET	K-IDIOT-OBJ-TBL,0 >N
	INTBL?	OBJ,K-IDIOT-OBJ-TBL+2,N >PTR \FALSE
	SUB	K-IDIOT-OBJ-TBL+10,PTR >L
	GRTR?	L,0 \?CND6
	ADD	PTR,2
	COPYT	STACK,PTR,L
?CND6:	PUT	K-IDIOT-OBJ-TBL,K-IDIOT-OBJ-MAX,0
	SUB	N,1
	PUT	K-IDIOT-OBJ-TBL,0,STACK
	RTRUE	

	.ENDSEG

	.ENDI
