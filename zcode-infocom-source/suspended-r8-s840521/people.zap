

	.FUNCT	AUDA-HEARS?
	LOC	PEOPLE
	IN?	AUDA,STACK \FALSE
	ZERO?	AUDA-LISTENS \?THN8
	EQUAL?	WINNER,AUDA \FALSE
?THN8:	GET	DEADBOTS,4
	LESS?	STACK,30 \FALSE
	RTRUE


	.FUNCT	AUDA-SPEAKS
	EQUAL?	WINNER,AUDA /?ELS5
	CRLF	
	GET	INTER-TBL,4
	PRINT	STACK
	PRINTR	" Listening..."
?ELS5:	CRLF	
	RTRUE	


	.FUNCT	ROBOT-THERE?,RBT
	LOC	PEOPLE
	IN?	RBT,STACK \FALSE
	FSET?	RBT,CUTBIT /FALSE
	RTRUE


	.FUNCT	I-PEOPLE1
	SET	'PR-NUMBER,1
	MOVE	PEOPLE,STERILE-AREA
	CALL	SET-GOAL,PEOPLE,TOOL-AREA
	CRLF	
	PRINTI	"FC INTERRUPT: ALERT! ALERT!
Intruders detected in Sterilization Chamber!"
	CRLF	
	RETURN	2


	.FUNCT	PARRIVE1,TEMP
	MOVE	TOOLBAG,PEOPLE
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	CALL	AUDA-SPEAKS
	PRINTI	"I can hear the sound of metal against metal, followed by the sound of a creaking door opening.

""I've got the toolbag. Everything in it seems intact.""
""Well, don't lose it, man. We're lost without it. We'll never pull the switch on him if we lose it.""
""Don't worry. I won't let it out of my sight.""
""I'm getting sleepy. It was a long ride down here. What do you say we catch some sleep?""
""You really think we should? With all the devastation taking place?""
""I don't have much choice. I'm not thinking clearly, and I really need to sleep. More casualties will occur if we don't take care of ourselves.""
""Good point. Let's go."""
	CRLF	
?CND1:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS8
	SET	'TEMP,WINNER
	CALL	CHANGE-WINNER,WALDO,1
	CRLF	
	GET	INTER-TBL,2
	PRINT	STACK
	PRINTI	" The mobile objects have stopped for a moment. I also detect the "
	CALL	NDESC,PEOPLE-CABINET
	PRINTI	" opening then shutting. The "
	CALL	NDESC,PEOPLE
	PRINTI	" have removed a "
	CALL	NDESC,TOOLBAG
	PRINTI	" and are grasping it."
	CRLF	
	CALL	CHANGE-WINNER,TEMP,1
	JUMP	?CND6
?ELS8:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS12
	SET	'TEMP,WINNER
	CALL	CHANGE-WINNER,SENSA,1
	CRLF	
	GET	INTER-TBL,3
	PRINT	STACK
	PRINTI	" I can detect the cycling of a mechanism attached to the "
	CALL	NDESC,PEOPLE-CABINET
	PRINTI	" and the "
	CALL	NDESC,PEOPLE
	PRINTI	" removing a "
	CALL	NDESC,TOOLBAG
	PRINTI	" from it."
	CRLF	
	CALL	CHANGE-WINNER,TEMP,1
	JUMP	?CND6
?ELS12:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /?CND6
	SET	'TEMP,WINNER
	CALL	CHANGE-WINNER,POET,1
	CRLF	
	GET	INTER-TBL,5
	PRINT	STACK
	PRINTI	" As the amazing "
	CALL	NDESC,PEOPLE
	PRINTI	" check in, they casually remove something from a "
	CALL	NDESC,PEOPLE-CABINET
	PRINTI	". It appears to be a "
	CALL	NDESC,TOOLBAG
	PRINTI	"."
	CRLF	
	CALL	CHANGE-WINNER,TEMP,1
?CND6:	CALL	SET-GOAL,PEOPLE,SLEEP-CHAMBER
	SET	'PR-NUMBER,2
	RTRUE	


	.FUNCT	PARRIVE2,TEMP
	ZERO?	CHASING-THIEF \FALSE
	SET	'SLEEPERS,0
	CALL	QUEUE,I-STEAL,-1
	PUT	STACK,0,1
	MOVE	TOOLBAG,SLEEP-CHAMBER
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND5
	ZERO?	GIVEN-BAG \?CND5
	CALL	AUDA-SPEAKS
	PRINTI	"""Well, this is some sleep chamber. No frills.""
""Don't complain. At least there's bunks for us.""
""I suppose. I'm going to put the toolbag on the floor while I grab some shuteye.""
""What about the robot?""
""What, that ear thing? Gimme a break!""

AUDA: I hear the sound of metal being placed on the floor."
	CRLF	
?CND5:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS14
	ZERO?	GIVEN-BAG \?ELS14
	CRLF	
	GET	INTER-TBL,2
	PRINT	STACK
	PRINTR	" The mobile objects are moving over to the platforms and are reclining."
?ELS14:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS20
	ZERO?	GIVEN-BAG \?ELS20
	SET	'TEMP,WINNER
	CALL	CHANGE-WINNER,SENSA,1
	CRLF	
	GET	INTER-TBL,3
	PRINT	STACK
	PRINTI	" I detect an extreme drop in electrical and ionic activity in this area as the "
	CALL	NDESC,PEOPLE
	PRINTI	" become immobile."
	CRLF	
	CALL	CHANGE-WINNER,TEMP,1
	RTRUE	
?ELS20:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /TRUE
	ZERO?	GIVEN-BAG \TRUE
	CRLF	
	GET	INTER-TBL,5
	PRINT	STACK
	PRINTR	" Ah, yawn. Ho hum. These people are boring."


	.FUNCT	I-STEAL
	INC	'SLEEPERS
	GRTR?	SLEEPERS,20 \?CND1
	CALL	INT,I-STEAL
	PUT	STACK,0,0
	CALL	QUEUE,I-PEOPLE2,1
	PUT	STACK,0,1
?CND1:	EQUAL?	SLEEPERS,1 \?ELS6
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	GET	SNORES-TBL,0
	PRINT	STACK
	CRLF	
	RTRUE	
?ELS6:	EQUAL?	SLEEPERS,5 \?ELS13
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	GET	SNORES-TBL,1
	PRINT	STACK
	CRLF	
	RTRUE	
?ELS13:	EQUAL?	SLEEPERS,10 \?ELS20
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	GET	SNORES-TBL,2
	PRINT	STACK
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	SLEEPERS,15 \FALSE
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	GET	SNORES-TBL,3
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	ENOUGH-TRADING
	CALL	ROBOT-TELL,STR?145
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	CALL	AUDA-SPEAKS
	PRINTI	"""Enough is enough! We'll never get anywhere with this little thing pestering us.""
""Tell me about it. Let's just get on with this.""
""Fine with me. Grab the bag.""
""Okay."""
	CRLF	
?CND1:	MOVE	TOOLBAG,PEOPLE
	SET	'FED-UP,1
	SET	'CHASING-THIEF,0
	CALL	INT,I-STEAL
	PUT	STACK,0,0
	CALL	I-PEOPLE2
	SET	'PR-NUMBER,3
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	RSTACK	


	.FUNCT	PEOPLE-GIVEN-BAG
	CALL	ROBOT-TELL,STR?145
	SET	'GIVEN-BAG,1
	MOVE	TOOLBAG,PEOPLE
	CALL	INT,I-CHASEAUDA
	PUT	STACK,0,0
	SET	'RTHIEF,0
	SET	'CHASING-THIEF,0
	SET	'TAKE-BACK,0
	SET	'PR-NUMBER,9
	LESS?	SLEEPERS,20 \?ELS5
	SET	'SLEEPERS,0
	CALL	QUEUE,I-STEAL,-1
	PUT	STACK,0,1
	MOVE	TOOLBAG,SLEEP-CHAMBER
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	PRINTR	"""It's a good thing that little thief gave the bag back.""
""I'll say. Let's get some more sleep.""
""Okay.""
""You're not worried about leaving the bag on the floor, now, are you?""
""Nah. I'm not worried."""
?ELS5:	CALL	INT,I-STEAL
	PUT	STACK,0,0
	CALL	I-PEOPLE2
	SET	'PR-NUMBER,3
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	MOVE	TOOLBAG,PEOPLE
	RFALSE	


	.FUNCT	I-PEOPLE2,FLG=0
	SET	'PR-NUMBER,3
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	MOVE	TOOLBAG,PEOPLE
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	ZERO?	FED-UP \?CND1
	CALL	AUDA-SPEAKS
	SET	'FLG,1
	PRINTI	"""I really needed more rest than that, but it'll have to do. Let's get on with what this.""
""Okay. Just give me a second. Where to now?""
""The Central Library. We've got to get a little info before we can pull the switch.""
""Oops. Almost forgot the tool bag!"""
	CRLF	
?CND1:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS10
	SET	'FLG,1
	CRLF	
	GET	INTER-TBL,2
	PRINT	STACK
	PRINTI	" The mobile objects are resuming their normal positions and are becoming active."
	CRLF	
	RETURN	FLG
?ELS10:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS14
	SET	'FLG,1
	CRLF	
	GET	INTER-TBL,3
	PRINT	STACK
	PRINTI	" The air is becoming charged with ionic activity as the creatures stir from quiescence."
	CRLF	
	RETURN	FLG
?ELS14:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /?CND8
	SET	'FLG,1
	CRLF	
	GET	INTER-TBL,5
	PRINT	STACK
	PRINTI	" Like loaves of bread sitting on a warm oven, the Creators rise."
	CRLF	
	RETURN	FLG
?CND8:	RETURN	FLG


	.FUNCT	PARRIVE3
	CALL	QUEUE,I-PEOPLE4,3
	PUT	STACK,0,1
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	CALL	AUDA-SPEAKS
	PRINTI	"I can hear them talking, but I can't make out what's being said."
	CRLF	
?CND1:	ZERO?	PLUGGED-IN /FALSE
	CRLF	
	GET	INTER-TBL,6
	PRINT	STACK
	PRINTR	" Humans querying the CLC regarding proper replacement procedure for you. CLC is responding with the human access code for reviving one of your clones."


	.FUNCT	I-PEOPLE4
	SET	'PR-NUMBER,4
	CALL	SET-GOAL,PEOPLE,HALL-END
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	PRINTR	"""That information should do the trick. Let's get the replacement.""
""Yeah. Sounds good to me. I guess that person really went over the deep end, poor thing. Sitting in that capsule can't be a lot of fun.""
""Well, that's the way it goes."""


	.FUNCT	PARRIVE4,FLG=0
	IN?	CAR,HALL-END \?ELS5
	ZERO?	CAR-FULL \?ELS5
	CALL	QUEUE,I-KILL,15
	PUT	STACK,0,1
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND8
	SET	'FLG,1
	CALL	AUDA-SPEAKS
	PRINTI	"""Let's get into the car and get this thing over with. The clones are near the end of this tube.""
""Sounds good to me. This place gives me the creeps.""

AUDA: I hear the sounds of the people entering the car, then the whoosh as the car takes off to the east."
	CRLF	
?CND8:	MOVE	PEOPLE,CRYOUNITS
	MOVE	CAR,CAR-AREA
	RETURN	FLG
?ELS5:	CALL	QUEUE,I-CAR-WAIT,-1
	PUT	STACK,0,1
	ZERO?	WAITING-QUIP \FALSE
	SET	'WAITING-QUIP,1
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	PRINTR	"""We'll have to wait for the car. We can't negotiate this tube on foot.""
""Fine. I've got nothing but time."""


	.FUNCT	I-CAR-WAIT
	IN?	CAR,HALL-END \?ELS5
	ZERO?	CAR-FULL \?ELS5
	CALL	INT,I-CAR-WAIT
	PUT	STACK,0,0
	CALL	PARRIVE4
	RSTACK	
?ELS5:	INC	'CAR-GONE
	EQUAL?	CAR-GONE,10 \?ELS14
	CALL	AUDA-HEARS?
	ZERO?	STACK /?ELS14
	CALL	AUDA-SPEAKS
	PRINTR	"""Man, I just hate the way this car was designed.""
""Yeah, well, join the club. We'll just have to wait. We can't go back to the surface until we've pulled the switch, anyway."""
?ELS14:	EQUAL?	CAR-GONE,30 \?ELS20
	CALL	AUDA-HEARS?
	ZERO?	STACK /?ELS20
	CALL	AUDA-SPEAKS
	PRINTR	"""I'm getting real angry. How long are you gonna wait?"""
?ELS20:	EQUAL?	CAR-GONE,45 \?ELS26
	CALL	AUDA-HEARS?
	ZERO?	STACK /?ELS26
	CALL	AUDA-SPEAKS
	PRINTR	"""When that robot gets out of that car, I'm going to dismantle the little bugger.""
""You'll have to stand in line. My boredom factor is real low."""
?ELS26:	EQUAL?	CAR-GONE,75 \FALSE
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND33
	CALL	AUDA-SPEAKS
	PRINTI	"""I'm tired of waiting around, man. Let's go pull his plug and get this thing over with.""
""But what about his clone?""
""Forget it. We'll put everything on manual override and take care of this later. Too many people are at stake here. Okay?""
""Okay. Lead on."""
	CRLF	
?CND33:	SET	'PR-NUMBER,7
	CALL	SET-GOAL,PEOPLE,CPU-ROOM
	CALL	INT,I-CAR-WAIT
	PUT	STACK,0,0
	RTRUE	


	.FUNCT	I-KILL,TEMP
	MOVE	PEOPLE,HALL-END
	MOVE	CAR,HALL-END
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	CALL	AUDA-SPEAKS
	CALL	ROBOT-TELL,STR?1380
?CND1:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS6
	SET	'TEMP,WINNER
	CALL	CHANGE-WINNER,WALDO,1
	CALL	ROBOT-TELL,STR?1381,0
	CALL	NDESC,PEOPLE
	PRINTI	" are holding another thing like themselves between them."
	CRLF	
	CALL	CHANGE-WINNER,TEMP,1
	JUMP	?CND4
?ELS6:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS10
	PRINTI	"SENSA: Sensory inputs detect a third life form."
	CRLF	
	JUMP	?CND4
?ELS10:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /?CND4
	PRINTI	"POET: Here come da clone, here come da clone."
	CRLF	
?CND4:	SET	'PR-NUMBER,5
	CALL	SET-GOAL,PEOPLE,CPU-ROOM
	RSTACK	


	.FUNCT	PARRIVE5
	CRLF	
	PRINTI	"As the door swings open you are blinded by intense light and incredible pain. Just before everything overloads and you fade from existence, you can make out the shapes of three humans, one of them holding onto the door of the cylinder, another of them looking exactly like you, and then everything goes dark."
	CRLF	
	QUIT	
	RTRUE	


	.FUNCT	I-CHASEAUDA,TEMP,TWINNER
	INC	'TAKE-BACK
	EQUAL?	TAKE-BACK,1 \?ELS5
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND6
	CALL	AUDA-SPEAKS
	PRINTI	"""Give me that, you little devil!""
""That robot's a thief! Let's get it!"""
	CRLF	
?CND6:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS13
	CRLF	
	PRINTI	"WALDO: The mobile devices are waving their extensions madly. I think I'm in trouble."
	CRLF	
	RFALSE	
?ELS13:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS17
	CRLF	
	PRINTI	"SENSA: The air in this area has become highly electrified, charged by the creatures."
	CRLF	
	RFALSE	
?ELS17:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /FALSE
	CRLF	
	PRINTI	"POET: I believe the Creators have caught an extension in the cookie jar. Better take it on the lam, and pronto."
	CRLF	
	RFALSE	
?ELS5:	EQUAL?	TAKE-BACK,2 /FALSE
	EQUAL?	TAKE-BACK,3 \?ELS27
	CALL	GOAL?,RTHIEF >TEMP
	ZERO?	TEMP /?ELS30
	CALL	SET-GOAL,PEOPLE,TEMP
	JUMP	?CND28
?ELS30:	LOC	RTHIEF
	CALL	SET-GOAL,PEOPLE,STACK
?CND28:	SET	'PR-NUMBER,9
	SET	'CHASING-THIEF,1
	RFALSE	
?ELS27:	IN?	TOOLBAG,RTHIEF /?ELS34
	LOC	TOOLBAG
	IN?	PEOPLE,STACK \?ELS39
	MOVE	TOOLBAG,PEOPLE
	SET	'PR-NUMBER,3
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	CALL	INT,I-CHASEAUDA
	PUT	STACK,0,0
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND40
	CALL	AUDA-SPEAKS
	PRINTI	"""Here's the toolbag. Looks like the little 'bot dropped it.""
""Just as well. Let's get on with this."""
	CRLF	
?CND40:	SET	'CHASING-THIEF,0
	RTRUE	
?ELS39:	IN?	TOOLBAG,IRIS \?ELS46
	SET	'RTHIEF,IRIS
	RFALSE	
?ELS46:	IN?	TOOLBAG,WALDO \?ELS48
	SET	'RTHIEF,WALDO
	RFALSE	
?ELS48:	IN?	TOOLBAG,SENSA \?ELS50
	SET	'RTHIEF,SENSA
	RFALSE	
?ELS50:	IN?	TOOLBAG,AUDA \?ELS52
	SET	'RTHIEF,AUDA
	RFALSE	
?ELS52:	IN?	TOOLBAG,POET \?ELS54
	SET	'RTHIEF,POET
	RFALSE	
?ELS54:	IN?	TOOLBAG,WHIZ \?ELS56
	SET	'RTHIEF,WHIZ
	RFALSE	
?ELS56:	LOC	TOOLBAG
	IN?	STACK,ROOMS \?ELS61
	LOC	TOOLBAG
	CALL	SET-GOAL,PEOPLE,STACK
	SET	'PR-NUMBER,9
	RFALSE	
?ELS61:	SET	'PR-NUMBER,9
	CALL	META-LOC,TOOLBAG
	CALL	SET-GOAL,PEOPLE,STACK
	RFALSE	
?ELS34:	IN?	PEOPLE,CORRIDOR-4 \?ELS65
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND66
	CALL	AUDA-SPEAKS
	PRINTI	"""Oh, wow, look at that! The mist is coming up through the grating!""
""Yeah. What's below this room? The Maintenance Area?""
""Yes. The cooling system for the Filtering Computers has a regulatory valve there.... Maybe that's what's wrong here.""
""What are you talking about?""
""This acid mist -- it could be what's causing all the trouble. Let's get back down there and turn the wheel, get the cooling system rerouted.""
""It's worth a try. If you're right, we won't have to pull this person's plug.""
""Well, let's go. We're wasting time."""
	CRLF	
?CND66:	CALL	INT,I-CHASEAUDA
	PUT	STACK,0,0
	CRLF	
	IN?	RTHIEF,CORRIDOR-4 \?ELS73
	MOVE	TOOLBAG,PEOPLE
	GETP	RTHIEF,P?ROBOT
	GET	INTER-TBL,STACK
	PRINT	STACK
	PRINTI	" They've taken something from my extensions!"
	CRLF	
	JUMP	?CND71
?ELS73:	GETP	RTHIEF,P?ROBOT
	GET	INTER-TBL,STACK
	PRINT	STACK
	PRINTI	" The bag is melting!"
	CRLF	
	REMOVE	TOOLBAG
?CND71:	CALL	SET-GOAL,PEOPLE,FCMAINT
	SET	'PR-NUMBER,8
	SET	'CHASING-THIEF,0
	RTRUE	
?ELS65:	LOC	RTHIEF
	IN?	PEOPLE,STACK \?ELS81
	SET	'CHASING-THIEF,0
	IN?	PEOPLE,FCMAINT \?ELS86
	SET	'ACID-FIXED,1
	CALL	SET-GOAL,PEOPLE,REC-AREA
	SET	'PR-NUMBER,6
	CALL	INT,I-CHASEAUDA
	PUT	STACK,0,0
	MOVE	TOOLBAG,PEOPLE
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND87
	CALL	AUDA-SPEAKS
	PRINTI	"""Hey -- Look at that! The pipes going up to the Filtering Computers have burst.""
""Yeah. Maybe the person in the cylinder isn't at fault....""
""Hmm. You could be right. Let's fix this and then see if things return to normal.""

AUDA: I can hear the sound of metal, like a wheel turning, and the hissing stop.

""That should take care of that leak. Let's go up to the Rec Area and wait for awhile.""
""Fine. Meanwhile, I'll get our toolbag back.""

AUDA: I hear footsteps as the talking mechanisms walk away."
	CRLF	
?CND87:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS96
	CRLF	
	PRINTR	"WALDO: I can detect the large, circular object high overhead turning."
?ELS96:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS100
	CRLF	
	PRINTR	"SENSA: I detect the flow within the pipes overhead stopping and the acid leak stopping, too."
?ELS100:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /FALSE
	CRLF	
	PRINTR	"POET: Here they come to save the day..."
?ELS86:	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND109
	CALL	AUDA-SPEAKS
	PRINTI	"""We've got him now. He's cornered. Let's grab that tool bag and get on with this fiasco."""
	CRLF	
?CND109:	CRLF	
	IN?	TOOLBAG,RTHIEF \?CND114
	SET	'TWINNER,WINNER
	CALL	CHANGE-WINNER,RTHIEF,1
	CALL	ROBOT-TELL,STR?1382,0
	CALL	NDESC,TOOLBAG
	PRINTI	" from my extensions."
	CRLF	
	CALL	CHANGE-WINNER,TWINNER,1
?CND114:	MOVE	TOOLBAG,PEOPLE
	SET	'PR-NUMBER,3
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	CALL	INT,I-CHASEAUDA
	PUT	STACK,0,0
	RTRUE	
?ELS81:	LOC	RTHIEF
	CALL	SET-GOAL,PEOPLE,STACK
	SET	'PR-NUMBER,9
	RFALSE	


	.FUNCT	PARRIVE6
	CALL	QUEUE,I-STARCROSS,-1
	PUT	STACK,0,1
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	PRINTR	"""Let's play this game while we wait to see what's happening.""
""What's it called?""
""Starcross. Looks really good.""
""Okay."""


	.FUNCT	I-STARCROSS
	INC	'PLAY-STARCROSS
	LESS?	PLAY-STARCROSS,200 /FALSE
	CALL	INT,I-STARCROSS
	PUT	STACK,0,0
	CALL	SET-GOAL,PEOPLE,INNER-CORE
	SET	'PR-NUMBER,3
	CALL	AUDA-HEARS?
	ZERO?	STACK /FALSE
	CALL	AUDA-SPEAKS
	PRINTR	"""I think we've waited long enough. This person in the cylinder isn't all together upstairs, if you know what I mean.""
""I do, and I agree. We've given him more than enough time. Let's yank the fool out of there immediately, then get the replacement clone.""
""No way. Procedure requires we get the replacement first, and that's what we're going to do. Now let's move."""


	.FUNCT	PARRIVE7
	CRLF	
	PRINTI	"As the door swings open you are blinded by intense light and incredible pain. Just before everything overloads and you fade from existence, you can make out the shape of two figures outside, one of them holding onto the door of the cylinder, and then everything goes dark."
	CRLF	
	QUIT	
	RTRUE	


	.FUNCT	PARRIVE8
	SET	'ACID-FIXED,1
	CALL	SET-GOAL,PEOPLE,REC-AREA
	SET	'PR-NUMBER,6
	CALL	AUDA-HEARS?
	ZERO?	STACK /?CND1
	CALL	AUDA-SPEAKS
	PRINTI	"""Hey -- Look at that! The pipes going up to the Filtering Computers have burst.""
""Yeah. Maybe the person in the cylinder isn't at fault....""
""Hmm. You could be right. Let's fix this and then give him some time.""

AUDA: I can hear the sound of metal, like a wheel turning, and the hissing stop.

""That should take care of that leak. Let's go up to the Rec Area and wait for awhile.""
""Fine.""

AUDA: I hear footsteps as the talking mechanisms walk away."
	CRLF	
?CND1:	CALL	ROBOT-THERE?,WALDO
	ZERO?	STACK /?ELS10
	CRLF	
	PRINTR	"WALDO: I can detect the circular object high overhead turning."
?ELS10:	CALL	ROBOT-THERE?,SENSA
	ZERO?	STACK /?ELS14
	CRLF	
	PRINTR	"SENSA: I detect the flow within the pipes overhead stopping and the acid leak stopping, too."
?ELS14:	CALL	ROBOT-THERE?,POET
	ZERO?	STACK /FALSE
	CRLF	
	PRINTR	"POET: Here they come to save the day..."


	.FUNCT	PARRIVE9
	RFALSE	

	.ENDI
