"Vampire Ltd" by Alex Harby

[Volume > Book > Part > Chapter > Section]

VOLUME - SETTINGS

Book - Extensions

Include Reactable Quips by Michael Martin.
Include Quip-Based Conversation by Michael Martin.

[versions used provided by climbingstars here: https://intfiction.org/t/michael-martins-quip-based-conversations/12797/3]

Include Basic Help Menu by Emily Short.

Include Footnotes by Stephen Granade.

Book - Text output options

Use verbose room descriptions.
Use the serial comma.

Book - Source code formatting

Part - Italics [i][/i]

To say i:
	say "[italic type]".
To say /i:
	say "[roman type]".
	
Part - Bold [b][/b]

To say b:
	say "[bold type]".
To say /b:
	say "[roman type]".
	
Part - Line breaks [l]

To say l:
	say "[line break]".
	
Part - Paragraph breaks [p]
	
To say p:
	say "[paragraph break]".
	
[Annoyingly, this doesn't work properly all the time, and will sometimes dump in an extra line break because of the way Inform 7 automatically puts in line breaks you didn't ask for.]

Part - Run paragraph on [/p]

To say /p:
	say "[run paragraph on]".
	
Part - Line breaks [l]

To say l:
	say "[line break]".

Book - Game settings

Part - Intro text

[Currently defined under SCENES > Prologue > When Play Begins, since I consider the intro part of the first scene]

Part - Story Headline

The story headline is "A Corporate Espionage Adventure (with Vampires In It)".


Part - Other bibliographic data

The story genre is "Comedy".
The story description is "Nero Brashov, vampire and failed businessman, has revenge on his mind. He'll pose as a human, infiltrate his arch-enemy's corporation, and sabotage it from the inside. Just as soon as he's invited in, that is."
The story creation year is 2020.

	
Book - Release settings

Part - Release number

The release number is 4.

Part - Release Materials

Release along with the "Parchment" interpreter, an introductory postcard, cover art ("A vampire in a suit"), a public solution and the private source text.

[
Table of Release Materials Explanations
Feelie	Explanation
the "Parchment" interpreter	Browser-playable version of the game. Corresponds to play.html. Specifying the "Parchment" interpreter to target the version of Parchment in the Templates folder rather than Inform's default choice Quixe. This is also supposed to generate a website in which the interpreter and other feelies are housed - this corresponds to index.html.
an introductory postcard	The standard postcard for playing parser-based IF, written by Andrew Plotkin and Lea Albaugh. Corresponds to postcard.pdf.
cover art	Cover art for the game. Corresponds to Cover.png and Small Cover.png in the release folder.
a public solution	A walkthrough file. "Public" means it will be listed in index.html. Corresponds to solution.txt.
the private source text	This file is the source text. Corresponds to this.
]



Book - Testing

Part - Autoplay commands - Not for release

Test prologue with "z / z / z / z".
Test campus with "x banner / in / 1 / 1 / 2 / n".

Test interview with "w / n / talk to manager / 1".
Test hired with "4 / 4 / 6".

Test raisins with "n / open cupboard / get box / s / s / e / n / get grapes / bite grapes / put grapes in box".
Test permit with "n / type letmein on computer / use computer / 2 / 2 / 3 / 4".
Test janitor with "s / s / e / talk to janitor / 2 / 4".

Test hade with "n / put card into reader / n".
Test fight with "3".
Test endgame with "s / s / w / w / n / n / open cupboard / stake hadrian with umbrella".

Test gotomoonlite with "s / s / e / e / n / n".
Test ending1 with "switch moonlite on".
Test ending2 with "break moonlite".

Test uptocampus with "test prologue / test campus".
Test uptointerview with "test uptocampus / test interview".
Test uptohired with "test uptointerview / test hired".
Test uptoraisins with "test uptohired / test raisins".
Test uptopermit with "test uptoraisins / test permit".
Test uptojanitor with "test uptopermit / test janitor".
Test uptohade with "test uptojanitor / test hade".
Test uptofight with "test uptohade / test fight".
Test uptoendgame with "test uptofight / test endgame".
Test uptomoonlite with "test uptoendgame / test gotomoonlite".

Test walkthru with "test uptomoonlite / test ending1".
Test walkthru2 with "test uptomoonlite / test ending2".

Part - Debugging - Not for release

Chapter - Testing descriptions

[testing descriptions code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 2]

When play begins (this is the run todo checks at the start of play rule):
	say "[bold type]TO DO:[roman type][paragraph break]";
	say "[bold type]Missing thing descriptions:[roman type][line break]";
	repeat with item running through things: 
		if description of the item is "": 
			say "[item] has no description.";
	say "[line break][bold type]Missing room descriptions:[roman type][line break]";
	repeat with item running through rooms:
		if description of the item is "":
			say "[item] has no description.";
	say "[paragraph break][bold type]GAME STARTS HERE:[roman type][paragraph break]".

[
Part - Beta-tester Comments

[commenting code credit: Jim Aikin, Inform 7 Handbook version 2, p. 64]

Commenting is an action out of world applying to one topic.
Understand "* [text]" as commenting.

Carry out commenting:
	say "[italic type](Comment noted - thank you!)[roman type][paragraph break]"
]


VOLUME - RULES

Book - Bypass every turn (rule for failed actions)

[bypass every turn code credit: climbingstars on the IntFiction forums: https://intfiction.org/t/i7-can-i-understand-persuasion-as-a-mistake/5496/2]

Bypass check is a truth state that varies. Bypass check is false.

To say bypass every turn: now bypass check is true.

This is the bypass every turn rule:
	if bypass check is true:
		now bypass check is false;
		rule succeeds.
		
The bypass every turn rule is listed before the every turn stage rule in the turn sequence rules.

Book - Listing Exits in Status Line

[Listing exits in status line credit: Emily Short and Graham Nelson, Inform 7 documentation, example 350]

When play begins (this is the status line construction rule):
	now left hand status line is "[location]";
	now right hand status line is "Exits: [exit list]".
	
To say exit list:
	let place be location;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room, say " [way]".

Rule for printing the name of a direction (called the way) while constructing the status line:
	choose row with a heading of the way in the Table of Abbreviation;
	say "[shortcut entry]".

Table of Abbreviation
heading	shortcut
north	"N"
northeast	"NE"
northwest	"NW"
east	"E"
southeast	"SE"
south	"S"
southwest	"SW"
west	"W"
up	"U"
down	"D"
inside	"IN"
outside	"OUT"



Book - Vampires

A vampire is a kind of person.


Part - Defining Player Character

[This is a stupid and awkward place to define the player character, but since the player is a vampire, I need to say so right here to avoid glitches and weird formatting issues - see Inform 7 documentation, 4.15]

Nero is a vampire.
The player is Nero.


[Part - Fangs

[Some fangs are a kind of thing. Some fangs are a part of every vampire. Understand "teeth" or "fang" or "tooth" as fangs. Printed name of fangs is "fangs".

The description of fangs is usually "Your pearly-whites have become topazzy-yellows with age and poverty, but they haven't let you down yet."]

Some fangs are a part of Nero. Understand "teeth" or "fang" or "tooth" as the fangs. Printed name of the fangs is "fangs".

The description of fangs is usually "Your pearly-whites have become topazzy-yellows with age and poverty, but they haven't let you down yet."]


Part - Vampiric Weaknesses

Chapter - Sunlight

A vampire can be exposed or safe. A vampire is usually safe.

A room can be sunlit or shaded. A room is usually shaded.

Every turn (this is the check sunlight exposure rule):
	if the player is in a shaded room, now the player is safe;
	otherwise:
		if the player is carrying the open umbrella, now the player is safe;
		otherwise:
			now the player is exposed;
	if the player is exposed for the third turn:
		say "You have been exposed to the sun for too long! You combust like a Roman candle![run paragraph on][special immolation reaction]";
		end the story saying "You have been incinerated";
	otherwise if the player is exposed for the second turn:
		say "Your skin is blistering! You need to get out of the sunlight now!";
	otherwise if the player is exposed for the first turn:
		say "The sunlight hits your body like the heat of an oven. You can't survive much direct sunlight[note sunlight-exposure]!";
	if the player is safe for the first turn:
		if the player has the open umbrella:
			say "Under your umbrella's welcome shade[run paragraph on]";
		otherwise:
			say "Escaping the tyranny of the sun[run paragraph on]";
		say ", your skin cools rapidly and resets. Ahhh. That's better.";
		
To say special immolation reaction:
	if Prologue is happening:
		say " The last thing you ever see is the crowd members in front of you turning around and telling you to shush.";
	otherwise if the location of the janitor is the location of the player:
		say " The last thing you ever hear is the janitor saying 'Whoa. You alright, mate?'";
	otherwise if the location of Hadrian is the location of the player:
		say " You hear Hadrian cackling, and try to twist your body so you can blast him with flames. But you don't live long enough to know whether you managed it.";
	otherwise:
		say "[paragraph break]".
		
The check sunlight exposure rule is listed before the Hadrian pathfinding rule in the every turn rules.

[possible bug note: it could be possible for the player to become safe while already carrying the open umbrella, and therefore trigger the open umbrella message instead of a more appropriate one. However, because the act of opening the umbrella always triggers safety, and because the player can never drop the umbrella under any circumstances, this situation should never occur. Still, it may be a source of bugs down the line!]

[See WORLD > Nero > Umbrella for rules about the umbrella]

Chapter - Holy exposure

A vampire can be holy-exposed or holy-safe. A vampire is usually holy-safe.

[There is only one room in the game where this is relevant, as this tracks exposure to the holy symbols, which are fixed in place in the Prayer Room. See WORLD > Offices > PrayerRoom > cupboard > Registering Holy-Exposure for the use of this weakness]

Every turn (this is the report holy exposure rule):
	if the player is holy-exposed:
		say "[one of]You lose focus as[or]Your concentration breaks as[or]Briefly,[at random] [one of]you reflect on all your sins[or]a sense of righteous dread grabs you[or]memories of past transgressions come to you[or]you are gripped by shame and guilt[or]you wonder if there's an afterlife, and what kind of afterlife you can expect[at random].";
	if Hadrian is visible:
		if Hadrian is holy-exposed:
			unless Hadrian is staked:
				say "Hadrian[one of] drops his guard for a second as he[or] seems distracted. He[or]'s eyes wander from you. He[or] half-heartedly swipes at you. He[at random] [one of]mutters 'No...' to nobody you can see[or]glances behind him[or]stares at his hands[or]shakes his head again and again[or]gazes at the holy symbols[at random]."


Part - Vampiric Actions

Chapter - Biting

A thing can be biteable. A person is usually biteable.

A thing can be moist or dry. A biteable thing is usually moist.

Biting is an action applying to one touchable thing.

Understand "bite [something]" or "chomp [something]" or "suck [something]" or "drain [something]" as biting.

Biting-success is a truth state that varies. Biting-success is false.

Check biting:
	if the noun is not biteable, say "That doesn't seem very succulent." instead;
	[if the noun is personlike, say "You'd love to. But they'd probably call it assault, and being wanted for assault would get in the way of your sabotage plans." instead;]
	if the noun is a person, say "You'd love to. But they'd probably call it assault, and being wanted for assault would get in the way of your sabotage plans[note check-biting]." instead;
	if the player can see someone (called the witness) who is not a vampire:
		if the witness is not an operating system:
			if the witness is not the operator:
				say "(first turning discreetly away from [the witness])";
	[otherwise if the player can see a personlike thing (called the witnesses):
		say "(first turning discreetly away from [the witnesses])";]

Carry out biting:
	now biting-success is false;
	if the noun is moist:
		now the noun is dry;
		now biting-success is true.
		
Report biting:
	if biting-success is true:
		say "You bite into [the noun] and drain [them] of [their] moisture!";
	otherwise:
		say "[The noun] [have] already been sucked dry. Your teeth make a noise like a straw in an empty cup.".
		

Section - Redirect eating, drinking and tasting to biting

Instead of eating something (called the foodstuff):
	try biting the foodstuff.

The block drinking rule is not listed in the check drinking rulebook.
Check drinking:
	try biting the noun instead.
	
Check tasting:
	try biting the noun instead.

[This is a later addition, so there may still be traces of when "eat" was treated as a separate verb throughout the source code]
		

Chapter - Staking it with

A thing can be stakelike. A thing is usually not stakelike.

A thing can be staked. A thing is usually not staked.

Staking it with is an action applying to two touchable things.

Understand "stake [something] with [something]" or "attack [something] with [something]" or "impale [something] with [something]" or "stab [something] with [something]" or "pierce [something] with [something]" or "skewer [something] with [something]" as staking it with.

Check staking it with:
	if the noun is not a vampire:
		if the noun is plural-named:
			say "Being staked is really more of a vampire weakness." instead;
		otherwise:
			say "Being staked is really more of a vampire weakness than [a noun] weakness[note check-staking-not-vampire]." instead;
	if the noun is the player, say "Don't do it! You have so much to un-live for." instead;
	if the second noun is the noun, say "Sort of a staking ouroboros? This won't work." instead;
	if the second noun is the player, say "That would be convenient, but your teeth aren't long enough and your body isn't sharp enough[note check-staking-with-nero]. You'll need something to stake [the noun] with." instead;
	if the second noun is a person, say "They wouldn't like that. [The second noun] [italic type]or[roman type] [the noun]." instead;
	if the second noun is not stakelike, say "That [second noun] isn't going to pierce [italic type]anyone's[roman type] heart or stomach." instead;
	if the second noun is not carried, say "You need to be holding [the second noun] before you can use it as a stake!" instead.
	
Carry out staking it with:
	if the noun is Hadrian:
		if Hadrian is holy-exposed:
			now the noun is staked;
			move the wooden signpost to PrayerRoom; [drops the weapon Hade is carrying]
		otherwise:
			if the noun is not staked:
				now the noun is not staked; [looks dumb but ensures you can't unstake a staked Hadrian]
	otherwise:
		now the noun is staked.
	[if the second noun is the umbrella:
		if the umbrella is open:
			try silently closing the umbrella;
			say "[bracket]first closing the umbrella[close bracket]";]
	
[Report staking it with:
	if the noun is Hadrian:
		if the noun is not staked:
			say "You drive [the second noun] towards Hadrian's heart... It glances off! Hade laughs. 'It'll take more than that to stop me!'";
		otherwise:
			if Fight has ended:
				say "You stab [the second noun] into his dust a few more times for good measure.";
			otherwise:
				say "You plunge [the second noun] into Hadrian's heart! Weakened by the surrounding holy symbols, his flesh now offers no resistance. He shrieks, shrivels, crumples, crumbles. He is dust.";
	otherwise:
		say "You plunge [the second noun] into [the noun]!".]
		
Report staking it with:
	if the noun is not Hadrian:
		say "You plunge [the second noun] into [the noun]!".
		
[Hadrian rule defined in his section]

[Rule for supplying a missing second noun while staking:
	if the noun is not a vampire:
		if the noun is plural-named:
			say "Being staked is really more of a vampire weakness.";
		otherwise:
			say "Being staked is really more of a vampire weakness than [a noun] weakness.";
	otherwise if the noun is the player:
		say "Don't do it! You have so much to un-live for.".]

		

Section - Staking it into (alternate verb allowing additional synonyms and phrasings)

Staking it into is an action applying to two touchable things.

Understand "stake [something] into [something]" or "impale [something] into [something]" or "stab [something] into [something]" or "plunge [something] into [something]" as staking it into.

Check staking it into:
	try staking the second noun with the noun instead.
	
	
Section - Singular-staking (verb which prevents "what do you want to stake it with" when the noun is nonsense)

Singular-staking is an action applying to one thing.

Understand "stake [something]" or "impale [something]" or "stab [something]" or "pierce [something]" or "skewer [something]" as singular-staking.

Check singular-staking:
	if the noun is not a vampire:
		if the noun is plural-named:
			say "Being staked is really more of a vampire weakness." instead;
		otherwise:
			say "Being staked is really more of a vampire weakness than [a noun] weakness[note check-staking-not-vampire]." instead;
	otherwise if the noun is the player:
		say "Don't do it! You have so much to un-live for." instead;
	otherwise:
		say "Good idea, but you'll need to say what to stake [the noun] with..." instead.
	

	
[*TODO:
	sanity check: don't ask for a second noun if the first noun is already invalid
]
[*IDEA: should recognise attempts to stake Hadrian during earlier scenes (otherwise the person replaying the game might get annoyed]

[
[redirecting "verb X" to "verb X with Y" credit: Emily Short and Graham Nelson, Inform 7 documentation, example 195]
Staking is an action applying to one touchable thing.
Instead of staking something:
	say "staking action redirecting to staking it with.";
	if a stakelike thing (called the stakething) is held by the player, try staking the noun with the stakething;
	otherwise try staking the noun with the player.
	
above code never gets run - not necessary to fix, but leaving it here in case I can improve it
]


Book - Computers

A computer is a kind of device.
A computer is usually fixed in place.

A computer is usually switched on.

A computer can be protected. A computer is usually not protected.

Understand "pc/mac/laptop" or "mouse/keyboard/monitor/screen" as a computer.


Part - Operating systems (dummy person to control conversation)

An operating system is a kind of person.
An operating system is usually privately-named.
An operating system is usually scenery.
[Creates an invisible person attached to every computer to control conversation]

An operating system is part of every computer.

The description of an operating system is usually "The computer's OS. If you see this message, there's a bug - the player shouldn't be able to directly target the operating system. Please report this to me as a bug!".

Chapter - Placeholder litany

The greeting of an operating system is usually osP_greeting. The litany of an operating system is usually the Table of Placeholder Operating System Options.

Table of Placeholder Operating System Options
prompt	response	enabled
"Test quip 1"	osP_test1	1
"Test quip 2"	osP_test2	1
"Goodbye"	osP_goodbye	1

Table of Quip Texts (continued)
quip	quiptext
osP_greeting	"This is a placeholder operating system for the computer. If you can read this, the actual system for this computer has not worked properly - please let me know about this bug!"
osP_test1	"Test quip 1 selected."
osP_test2	"Test quip 2 selected."
osP_goodbye	"Computer use terminated."

After quipping when the current quip is osP_goodbye:
	enable the osP_goodbye quip;
	terminate the conversation.
	
Part - Computer Actions

Chapter - Computer-using computers

Computer-using is an action applying to one touchable thing.

Understand "operate [something]" or "browse [something]" or "browse on [something]" or "sit at [something]" or "access [something]" or "log in to [something]" or "log in [something]" or "log in on [something]" or "sign in to [something]" or "sign in on [something]" or "sign in [something]" or "start [something]" or "start up [something]" as computer-using.

Instead of entering a computer when the player's command includes "get on", try computer-using the noun.

["Wake" also accepted - defined under custom responses to the wake verb]

Check computer-using:
	If the noun is not a computer, say "You can't operate that as you would a computer." instead;
	otherwise:
		if the noun is switched off:
			try silently switching on the noun;
			if the noun is switched off:
				say "You'll need to switch [the noun] on first." instead;
			otherwise:
				say "(first switching on [the noun])[if the noun is protected][line break][end if]";
		if the noun is protected:
			say "[password puzzle message]." instead.
			
To say password puzzle message:
	activate the password quips;
	say "A password field blocks you! Curse that Hadrian, and screw him, too! He's always one step ahead. Hmm, how can you figure out Hade's password? Hopefully he's not very careful with it - maybe other people in the company can help you guess"
		
[Carry out rules are specific to each computer (e.g. look under old computer for "carry out computer-using the old computer").
This is yet another dreadful hack, but if it works it works.]

[Note from the author who's fixing bugs after beta-testing: why the hell did I split the passworld puzzle code between the default computer code and the fancy computer, now I have no idea where anything is and I don't want to refactor it and introduce more bugs, why did I do this]

Section - Log in on its own

Log-in-trying is an action applying to nothing.

Understand "log in" or "sign in" as log-in-trying.

Check log-in-trying:
	if a computer (called the target) is touchable:
		try computer-using the target;
	otherwise:
		say "There's no computer to log in to here."



Chapter - Typing passwords

Typing it on is an action applying to one topic and one touchable thing.

Understand "type [text] on [something]" and "type in [text] on [something]" and "guess [text] on [something]" and "try [text] on [something]" and "input [text] on [something]" and "enter [text] on [something]" and "password [text] on [something]" and "give [text] to [something]" as typing it on.


Check typing it on:
	if the second noun is not a computer, say "There's no keyboard on [the second noun]" instead;
	otherwise:
		if the second noun is switched off:
			try silently switching on the second noun;
			if the second noun is switched off:
				say "You'll need to switch [the second noun] on first." instead;
			otherwise:
				say "(first switching on [the second noun])[line break]";
		if the second noun is not protected, say "No need, there's no password protection. [italic type][bracket]Try 'use computer' if you're trying to browse the computer's files.[close bracket][roman type][paragraph break]" instead.
		
[Carry out rule only listed under fancy computer, because that's the only object which needs it I think
I did it this way in case I wanted to add another password-protected computer, so I could give each its own carry out rule in its respective section
Hello to every seasoned I7 programmer reading my source code and recoiling in horror
I tried really hard to make this password code extensible to all computers but I was not and am not good at Inform 7 programming]
		
[Report typing it on:
	say "Typing it on action successful."]
	
[say "(first switching on [the second noun])[if the second noun is protected][line break][end if]";]
	
Section - Corrections to typing - singular-typing, objectless-typing

Singular-typing is an action applying to one topic.
Understand "type [text]" and "type in [text]" and "guess [text]" and "try [text]" and "input [text]" and "enter [text]" and "password [text]"  and "give [text]" as singular-typing.

Carry out singular-typing:
	if a computer (called the target) is touchable:
		say "(typing '[the topic understood]' on [the target])";
		try typing the topic understood on the target;
	otherwise:
		say "You don't see anything to type that on."
		
Objectless-typing is an action applying to nothing.
Understand "type" as objectless-typing.

Check objectless-typing:
	say "[bypass every turn][italic type][bracket]Type what? You'll need something to type, and something to type on, e.g. TYPE TEXT ON COMPUTER, or just TYPE TEXT if you're near a computer.[close bracket][roman type][paragraph break]"
	
[
I wanted to let the player type singular passwords for the password puzzle (i.e. "> hunter2" as an alternative to "> type hunter2"), but I couldn't get it to work, and after a lot of debugging I'm pretty sure that the problem is much deeper in the code than I can identify. It would take too long to explain everything I've tried to do, but some game rules seem to be firing on some possible passwords and not others, even when I haven't defined the passwords to check against yet. Also there's the problem with letting the player type any text and only firing the action when the text matches a password and going to a standard parser error otherwise. It's a lot of work to fix one small oversight in a game that's already finished as far as I'm concerned. Here's what remains of the attempt.

Section - Password-guessing

Password-guessing is an action applying to one topic.

[Understand "admin" and "password" as singular-password-guessing.]

Understand "[text]" as password-guessing.

Check password-guessing:
	if the topic understood matches "password":
		try singular-typing the topic understood;
	otherwise:
		say "The password-guessing action did not work."

]


Book - Conversation

[Conversation uses Michael Martin's Reactable Quips and Quip-Based Conversation extensions as initialised under Settings > Extensions]

Part - Synonyms

Understand "t [something]" or "talk [something]" or "speak [something]" or "speak to [something]" or "greet [something]" or "say hello to [something]" or "say hi to [something]" or "ask [something]" or "tell [something]" as talking to.

Part - Redirect other ways of talking

To say QBC talking cue:
	say "[bypass every turn][italic type][bracket]In this game, please type TALK TO _____ to interact with characters.[close bracket][roman type]".

Part - Replace generic responses to failed talk attempts

This is the should only talk to talkables rule:
	if the noun provides the property litany and the noun provides the property greeting, do nothing; 
	otherwise say "Hello, [noun]." instead.

The should only talk to talkables rule substitutes for the can only talk to talkables rule.



Part - Force conversation until stopped

Before doing something other than examining, looking or thinking when QBC is active (this is the QBC force conversation rule):
	 unless the current action is QBC responding with or the current action is QBC recapping, say "[bypass every turn][i][bracket]Sorry, most actions (other than looking at things) are disabled when you're in a tree. Please enter a number to keep talking (there will usually be some kind of goodbye option to exit the conversation or menu). Type REPEAT to see your options again.[close bracket][/i][paragraph break]" instead.

The QBC force conversation rule is listed first in the before rules.


Part - Automatically recap if player uses undo

Immediately undo rule response (E) is "[undoForQBC]".
To say undoForQBC:
	say "[bracket]Previous turn undone.[close bracket]";
	if QBC is active:
		try QBC recapping.

[*IDEA: recapping in the undo function introduces an extra line break here. This is very low priority to fix, but it still kinda bugs me]


Part - Prevent conversation when the player is exposed to sunlight

Check talking to when the player is exposed:
	say "[bypass every turn]You are being destroyed by sunlight! You do not have time to chat!" instead.
	
Part - No conversation error

To say QBC no conversation error:
	say "[italic type][bracket]Sorry, I'm trying to recap the conversation options but I can't seem to find an active conversation to recap![close bracket][roman type]".

[I don't actually know what makes this print, but it's in the extension's documentation]



Book - Custom Responses

Part - Failures

Chapter - Trying an exit which doesn't exist

[viable directions code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 102]
Definition: a direction (called thataway) is viable if the room thataway from the location is a room. 
Can't go that way rule response (A) is "No exit that way. From here, you can go [list of viable directions]."

Chapter - Rejecting a noun which can't be found

Parser error internal rule response (E) is "[We] [can't] see that here (or if [we] [can], it's not important)[note parser-error-not-important]."
[This kind of response is borrowed from Arthur DiBianca's games]

Chapter - Trying wrong ways to talk to things

[parser error internal rule response (V): "You can't talk to [the noun]."]
[parser error internal rule response (W): "To talk to someone, try 'someone, hello' or some such."]

Parser error internal rule response (W) is "[QBC talking cue]".

Chapter - You can only do some things to something animate

[parser error internal rule response (M): "You can only do that to something animate."]

Chapter - Taking what can't be taken

Can't take scenery rule response (A) is "[regarding the noun][They're] too heavy to lug around everywhere."

Parser nothing error internal rule response (B) is "There's nothing you can take here!"
	

Part - Actions

Chapter - Attacking

Block attacking rule response (A) is "No, better not. Not this time, anyway."


Chapter - Burning

Block burning rule response (A) is "You don't have a lighter.".

Check burning Nero:
	say "You can do that if you stand out in the sunlight, but it's not a good impulse to have." instead.
	
[extra check rule for Hadrian in his section]


Chapter - Buying

The block buying rule is not listed in the check buying rulebook.

A thing can be Nero-owned. A thing is usually not Nero-owned.
[umbrella, blood bag, id card]
	
Check buying (this is the better block buying rule):
	if the noun is a person:
		say "Trafficking is frowned upon by the mortals these days." instead;
	otherwise if the noun is Nero-owned:
		say "You already own that!" instead;
	otherwise:
		say "You're a little temporarily embarassed at the moment. If you can take it, just take it." instead.

Check buying Nero:
	say "You don't sell out to anyone, not even yourself." instead.
	
	
Chapter - Climbing

Block climbing rule response (A) is "The only thing you want to climb is the ladder to success!".


Chapter - Cutting

Block cutting rule response (A) is "Not possible. You sold your cermonial sword years ago.".

Check cutting a person:
	say "You don't like to deal with people in that way. Most of the blood just gets wasted." instead.
	
Check cutting Nero:
	say "Violence against the self isn't the answer to this one." instead.
[maybe not a very witty default response, but self-harm isn't exactly a barrel of laughs, and I don't expect any players to try this anyway]
	
[Extra responses for Hadrian defined in his section]


Chapter - Giving

[Nothing under Giving should work, as the Giving action is always redirected to the Showing action.]


Chapter - Jumping

Report jumping rule response (A) is "You demonstrate your impressive one-foot vertical leap[note jump]."

Report jumping in the presence of Hadrian:
	if Prologue has not ended:
		say "Jumping gives you a slightly better view of Hadrian, but you don't want to draw his attention to you for now." instead;
	otherwise if Fight has not ended:
		say "You jump at the precise instant that Hadrian tries to sweep your legs. He curses you." instead.
		

Chapter - Kissing

[kissing yourself rule response (A): "[We] [don't] get much from that."
	block kissing rule response (A): "[The noun] [might not] like that."]
	
Kissing yourself rule response (A) is "Mwah[note kiss-me]!"
Block kissing rule response (A) is "You'd rather use your teeth than your lips."


Chapter - Listening

Report listening rule response (A) is "Your powerful and super-sensitive hearing detects nothing worth listening to[if the player is exposed], apart from an upsetting sound like sizzling bacon[end if]."


Chapter - Pushing and pulling

[
can't pull what's fixed in place rule response (A): "[regarding the noun][They] [are] fixed in place."
can't pull scenery rule response (A): "[We] [are] unable to."
can't pull people rule response (A): "[The noun] [might not like] that."
report pulling rule response (A): "Nothing obvious [happen]."
report pulling rule response (B): "[The actor] [pull] [the noun]."
can't push what's fixed in place rule response (A): "[regarding the noun][They] [are] fixed in place."
can't push scenery rule response (A): "[We] [are] unable to."
can't push people rule response (A): "[The noun] [might not like] that."
report pushing rule response (A): "Nothing obvious [happen]."
report pushing rule response (B): "[The actor] [push] [the noun]."
]

To say can't push multiple people:
	say "Better not. They might gang up on you".
	
Check pushing the player:
	say "You push yourself to do what has to be done and succeed!" instead.
Check pulling the player:
	say "You pull yourself together and focus on the task at hand!" instead.

Can't pull people rule response (A) is "Not your type!"
Can't push people rule response (A) is "Better not. [regarding the noun][They] look stressed enough already."


Chapter - Rubbing

Can't rub another person rule response (A) is "[regarding the noun][Possessive] hygiene isn't your responsibility.".

Report rubbing rule response (A) is "You give [the noun] a little polish.".

[extra responses for rubbing glass door when it's destroyed and Hadrian when he's staked defined in their sections]


Chapter - Score

Announce the score rule response (C) is "Yes, you [italic type][if Endgame is happening]have[roman type] scored[otherwise]will[roman type] score[end if] one against Hadrian today. [italic type][bracket]There's no scoring system in this game.[close bracket][roman type]"


Chapter - Showing

Block showing rule response (A) is "No, it's yours! They didn't earn it like you did.".
Can't show what you haven't got rule response (A) is "You don't actually have [the noun] right now.".

[Section - Showing fangs
	
Before showing the fangs to something:
	if the second noun is not a person:
		say "You bare your fangs at [the noun] as an intimidation tactic, but get no useful reaction." instead;
	otherwise if the second noun is the player:
		say "You discreetly feel your own fangs. Still nice and sharp." instead;
	otherwise if the second noun is Hadrian:
		if Prologue is happening:
			say "That could intimidate Hadrian if you weren't all the way back here. Anyway, he's not supposed to know you're here." instead;
		otherwise if Fight is happening:
			say "You bare your fangs at Hadrian to intimidate him! He bares his own teeth, which look like a display of dinner knives. You stop baring your fangs." instead;
		otherwise if Endgame is happening:
			say "You bare your fangs at Hadrian's ashes. Haha, got him." instead;
	otherwise:
		if Endgame is happening:
			say "Why show them your fangs when they can feel your fangs?" instead;
		otherwise:
			say "No. You'll blow your cover!" instead.]
			

Chapter - Singing

Singing is an action applying to nothing.
Understand "sing" as singing.

Report singing:
	say "Singing? That's for children of the night. You're an [italic type]adult[roman type] of the night."
	

Chapter - Sleeping

Block sleeping rule response (A) is "You'll sleep when you're- well, not yet, anyway.".
	

Chapter - Smelling

Report smelling rule response (A) is "Your finely-trained nose detects nothing interesting[if the player is exposed] apart from your own burning flesh[end if]." 

Report smelling the player:
	if the player is safe:
		say "The metaphorical stench of death hangs around you. So does the literal stench of the lovely cologne you shoplifted the other day." instead;
	otherwise:
		say "Distressing scent of cooked meat." instead;

	
Chapter - Sorry

Block saying sorry rule response (A) is "[sorry response]."

To say sorry response:
	if the player is holy-safe:
		say "You have nothing to apologize for! It is everybody else who should be saying sorry to [italic type]you[roman type]";
	otherwise:
		say "You feel like 'sorry' might not be enough".
		
		
Chapter - Squeezing

Understand the command "hug" as something new.

Understand "hug [something]" and "bearhug [something]" and "crush [something]" and "scrunch [something]" and "pinch [something]" as squeezing.

Innuendo about squeezing people rule response (A) is "[regarding the noun][They] might like that, but you're not a hugger.".

Report squeezing rule response (A) is "No reaction from [the noun].".

Check squeezing Nero:
	say "You give yourself a little pinch, but no, you haven't dreamed for a while." instead.

[Other checks and responses for squeezing associated with blood bag, old computer, raisin box, bunch of grapes and Hadrian - see their respective sections]

Chapter - Swinging

Block swinging rule response (A) is "That's not very swingable.".

[custom responses given for umbrella and id card]


Chapter - Thinking

Block thinking rule response (A) is "[thinking response].[first time] [italic type][bracket]If you typed this looking for a puzzle hint, try 'help' instead and navigate to the hints system in the menu.[close bracket][roman type][only]".

To say thinking response:
	if Nero is holy-exposed:
		say "You're trying to avoid that right now";
	otherwise if Endgame is happening:
		say "All you can think about is the Moonlite";
	otherwise if Fight is happening:
		say "You are currently thinking 'oh no oh no oh no oh jeez oh god oh no oh no oh no'";
	otherwise if Confrontation is happening:
		say "You want to rearrange Hadrian so badly";
	otherwise if employed-flag is true:
		say "You're thinking that this is one of the crummier jobs you've ever had";
	otherwise if Interview is happening:
		say "You think that there surely must be a bigger room for interviewing than this one. Just kick everybody out of the office. It'd be fine";
	otherwise if applied-to-job-flag is true:
		say "You're thinking about the last interview you had to do. A while ago, now. Well, let's hope you still have some of the ol['] Nero charm";
	otherwise:
		say "You have a lot of violent thoughts about Hadrian right now".


Chapter - Throwing it at

Block throwing at rule response (A) is "Probably shouldn't. It might be fun, but you'll look like an idiot if you need [the noun] later and you have to go over and get it back."


Chapter - Turning (response which puns on turning into vampire)

Understand "roll [something]" and "swirl [something]" and "twirl [something]" and "spin [something]" as turning. [accommodates "roll receptionist" and "swirl hadrian" for the 0.00001% of players who find those]

Check turning a person:
	if the player's command includes "turn":
		say "You don't want the competition." instead;
	otherwise:
		say "Making [regarding the noun][them] dizzy might be fun, but you're not feeling so playful today." instead.
		
[extra turn/rotate responses are defined for the unconscious receptionist and Hadrian in their respective sections]

Check turning Nero:
	if the player's command includes "turn":
		say "You were already turned a long time ago." instead;
	otherwise:
		say "Better not. Spinning around too much makes the lack of blood rush to your head." instead.
		
		
Chapter - Tying something to something

Block tying rule response (A) is "You don't see any reason to fiddle around doing that.".

[no witty response or specific check rules this time. I am not going to implement tying relations just for an unnecessary verb with no practical application to any items in the game]


Chapter - Waking

Check waking a person:
	say "But [regarding the noun][they] [aren't] asleep." instead.

Check waking Nero:
	try waking up instead.
	
[extra wake up responses are defined for the receptionist and Hadrian in their respective sections]

Object-waking is an action applying to one touchable thing.
Understand "wake [something]" or "wake [something] up" or "wake up [something]" or "awake [something]" or "awake [something] up" or "awake up [something]" or  "awaken [something]" or "awaken [something] up" or "awaken up [something]" as object-waking.

Check object-waking:
	say "[regarding the noun][They] [seem] unlikely to stir."

Check object-waking a computer:
	try computer-using the noun instead.
	

Chapter - Waking up

Block waking up rule response (A) is "[waking up response].".

To say waking up response:
	if Endgame is happening:
		say "If this is a dream, don't let it end yet. You're so close";
	otherwise:
		say "How you wish that the last few years were just a bad dream, and at any moment now you would wake up in your cosy double-coffin in your cosy crypt. Alas".
		
Chapter - Waving hands

Report waving hands rule response (A) is "You wave. Nobody waves back.".
	
[would like to let Nero wave and get a response from NPCs, but don't want to do the work to check if there's a person in the room who's not a computer, whether Hadrian is dead, etc]


Book - Other useful things

[Part - Personlike (adjective for scenery made of people which aren't defined as persons)

A thing can be personlike. A thing is usually not personlike.

A personlike thing is usually biteable.]


Part - Bonus verbs

Chapter - Cursing - joke verb

Cursing is an action applying to nothing.

Understand "curse" as cursing.

Report cursing:
	say "[one of]Bastard[or]Damn[or]Dang[or]Darn[or]Heck[or]Frick[or]Nuts[or]Prick[at random]!"

Chapter - Fixing - verb to catch a good-but-wrong try at the leak puzzle

[This verb is not required and has no practical effect. It's mostly to catch the player trying to "fix leak".]

Fixing is an action applying to one thing.

Understand "fix [something]" and "repair [something]" and "reassemble [something]" as fixing.

Check fixing (this is the block fixing rule):
	say "[regarding the noun][They] ain't broken." instead.
	
Chapter - Hypnotizing - joke verb

Hypnotizing is an action applying to one thing.

Understand "hypnotize [something]" and "hypnotise [something]" and "charm [something]" and "entrance [something]" and "enthrall [something]" as hypnotizing.
		
Check hypnotizing:
	if the noun is a person:
		say "[regarding the noun][They] [look] at you, puzzled. Hmm, the old powers of suggestion are a little rusty today[note hypnotize]." instead;
	[otherwise if the noun is personlike:
		say "[The noun] [look] at you, puzzled. Hmm, the old powers of suggestion are a little rusty today." instead;]
	otherwise:
		say "You enthrall [the noun] and convince [them] to remain completely inanimate[note hypnotize]!" instead.
		
Chapter - Looking toward - examining directions gives room names as appropriate

[looking toward code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 80]

[Looking toward is an action applying to one visible thing. 
Understand "look [direction]" or "examine [direction]" as looking toward.


Check looking toward:
	if the noun is not a direction:
		try examining the noun instead.

Carry out looking toward:
	let the viewed room be the room noun from the location;
	if the viewed room is nothing:
		say "Nothing interesting in that direction.";
	otherwise:
		say "[The viewed room] is that way." ]
		
[The above has been dummied out for now because I added it about 4 days before IFComp entries are due, and I don't think I can test it properly! It's not necessary for the game, but perhaps I'll bring it back in a post-comp release?]

[update: I will not bring it back]


Chapter - Praying - verb which gets a special response while Nero is holy-exposed

Praying is an action applying to nothing.

Understand "pray" and "worship" and "offer prayer" and "offer worship" as praying.

Check praying (this is the block praying rule):
	if Nero is holy-exposed:
		say "Unthinkingly, you places your hands together. Only your indecision over which symbol to worship prevents you from offering prayer. You snap out of it." instead;
	otherwise:
		say "Never!" instead.


		
Chapter - Pushing it with - verb which redirects to push and also catches a good-but-wrong solution to the Fight sequence

Pushing it with is an action applying to one thing and one touchable thing.

Understand "push [something] with [something]" as pushing it with.

Check pushing it with:
	try pushing the noun instead.

	
Chapter - Swiping - verb which acts as a solution to the card puzzle or as a synonym for take

Swiping is an action applying to one thing.

Understand "swipe [something]" as swiping.

Check swiping:
	if the noun is the ID card and the player is in LabEntrance:
		try inserting the noun into the card reader instead;
	otherwise:
		try taking the noun instead.
		
Chapter - Using - verb which redirects to more appropriate verbs if applicable, or to a help message if not

Singular-using is an action applying to one thing.

Understand "use [something]" as singular-using.

Check singular-using:
	if the noun is a computer:
		try computer-using the noun instead;
	otherwise if the noun is the phone booth:
		try entering the phone booth instead;
	otherwise if the noun is the ID card and the player is in LabEntrance:
		try inserting the noun into the card reader instead;
	otherwise:
		say "[bypass every turn][italic type][bracket]In these kinds of text adventures, you usually need to be more specific than 'use'. How do you want to use [the noun]?[close bracket][roman type][paragraph break]" instead.
		

Part - Miscellaneous little rules

Chapter - Redirect giving to showing, plus reveal synonym

Instead of giving something (called the gift) to something (called the recipient):
	try showing the gift to the recipient.
	
Understand "reveal [something preferably held] to [someone]" as showing it to.
Understand "reveal [someone] [something preferably held]" as showing it to (with nouns reversed).
	
Chapter - Redirect looking behind to looking under

Understand "look behind [something]" or "l behind [something]" as looking under.

Chapter - Redirect searching to examining when the noun is not a searchable thing

Check an actor searching (this is the redirect search unless container or supporter rule):
	if the noun is not a container and the noun is not a supporter:
		if the player is the actor:
			try examining the noun instead;
		otherwise:
			stop the action.
		
The redirect search unless container or supporter rule substitutes for the can't search unless container or supporter rule.

		
Part - Suppress (empty) when talking about containers

Rule for printing room description details: stop.



VOLUME - WORLD

Book - Nero (Player Character) (Edit location of player here!)

[For original creation of Nero / PC, see RULES > Vampires > Defining Player Character]

Nero is in CampusEntrance.

Description of the player is "You are the vampire Nero Brashov[note brashov-name]. Once proud and wealthy, now destitute and dusty, but still as blood-sucking as ever[note x-me].".
Understand "vampire/fang/fangs" as yourself.

[Description of the player's fangs is the default description of fangs]

Instead of biting the player:
	say "You don't like to bite yourself. You've never really gotten anything out of it. (Though some other vampires do, apparently. It's said that old Count Urât had his ribs removed so he could suck his own blood[note bite-me].)"


Part - Umbrella

The player carries an umbrella.

The umbrella can be openable. The umbrella is openable. The umbrella can be open. The umbrella is open.
The umbrella is stakelike.
The umbrella is Nero-owned.

Description of the umbrella is "Your one remaining prized possession, an umbrella made of thick black fabric and an aspen wood shaft, sleek and sharp and aerodynamic. You want to keep out of the sun, but you want to look good doing it[note x-umbrella]. The umbrella is currently [if open]open[otherwise]closed[end if]."

Understand "brolly" or "brollie" or "parasol" or "black" or "fabric" or "aspen" or "wood" or "shaft" as the umbrella.

Check dropping the umbrella:
	say "No. Your arms may get tired from carrying the thing around all day, but you daren't get caught in the sun without it." instead.
	
Check swinging the umbrella:
	say "You give the umbrella a little twirl, like in that film where they sing in the rain which you forget what it was called." instead.
	
Check turning the umbrella:
	try swinging the umbrella instead.
	

Part - Blood bag

The player carries a blood bag.
Printed name of the blood bag is "[if dry]emptied [end if]blood bag".

The blood bag is biteable.
The blood bag is edible.
The blood bag is Nero-owned.

Description of the blood bag is "Times are tough, and it's getting harder to bite people without being reported. You have to make do with whatever you can find when you break into the blood donation clinic after hours. This blood bag [if the blood bag is moist]is full, and looking pretty tasty right now. You can bite it if you want a meal[otherwise]has already been emptied[end if][note blood-bag]."

Report biting the blood bag:
	if biting-success is true:
		say "You puncture the plastic easily with your fangs, and drink deep. There's not a drop left when you're done. No substitute for a warm meal, but you do what you have to when times are hard." instead;
	otherwise:
		say "Just trash now - not a drop left." instead.
		
Report smelling the blood bag:
	say "Ohh, the smell of blood fills up your senses. Lovely." instead.
		
[Check eating the blood bag:
	say "Eat plastic? No[if the blood bag is moist]. If you want a meal, BITE the bag instead[end if]." instead.]
[the above doesn't fire anyway now that EAT redirects to BITE]
	
Check fixing the dry blood bag:
	say "Not really worth fixing the punctures." instead.
	
Instead of opening or closing the blood bag:
	say "No need to fiddle with the plastic. [if the bag is dry]There's nothing left in the bag[otherwise]You can just bite the bag if you want what's in it[end if]."
	
Check inserting something into the blood bag:
	say "Remember when you used an old blood bag as a makeshift wallet, and then you forgot and threw the old bag away with all the credit cards you hadn't maxed out yet? You're not making that mistake again[if the blood bag is moist]. Anyway, it's still full of blood[end if][note blood-bag-insertion]." instead.
	
Report squeezing the blood bag:
	if the blood bag is moist:
		say "You use the bag as a stress ball for a second." instead;
	otherwise:
		say "You work on it, but you already sucked out the last drop of blood." instead.

		
[Chapter - Dropping the empty blood bag removes it from play
		
Carry out dropping the blood bag:
	if the blood bag is dry:
		move the blood bag to Backstage instead.
		
Report dropping the blood bag:
	if the blood bag is dry:
		say "A gust of wind carries the emptied and useless bag away."]


Book - Campus

Part - CampusEntrance

CampusEntrance is a sunlit room. Printed name of CampusEntrance is "Campus Entrance".

Description of CampusEntrance is "[campusEntranceDesc]."

[Description of CampusEntrance is "[if prologue-ended-flag is false]The plaza outside the Lunarcel complex is packed this morning. The crowd hangs on Hadrian's every word as he paces a stage set up near the entrance to the main campus.[otherwise]The entrance to the Lunarcel campus is now quiet apart from a handful of workers dismantling the stage. The main part of the campus is north of here."]
[The flag is a truth state defined under the Prologue scene section. I'm using a flag instead of "if Prologue has not ended" because that kicks in a turn too late, for reasons I don't understand]

To say campusEntranceDesc:
	if prologue-ended-flag is false:
		say "The plaza outside the Lunarcel complex is packed this morning. The crowd hangs on Hadrian's every word as he paces a stage set up near the entrance to the main campus";
	otherwise:
		say "The entrance to the Lunarcel campus is now quiet[if the stageWorkers are in CampusEntrance] apart from a handful of workers dismantling the stage[end if]. The main part of the campus is north of here[note vampire-ltd-history]".


Chapter - Phone Booth (door, leads to InPhoneBooth)

[booth code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 7]

The phone booth is a door.
The phone booth is inside from CampusEntrance and outside from InPhoneBooth.
The phone booth is open.

Initial appearance of the phone booth is "[if the player is in CampusEntrance]An old phone booth huddles against the wall.[otherwise]The Lunarcel campus awaits you outside."

Understand "phone/telephone/payphone/pay phone" and "booth" as the phone booth.

Description of the phone booth is "An old phone booth, but clearly looked after. That is, none of the windows are smashed right now."

Check examining the phone booth in InPhoneBooth:
	try looking instead.

[*IDEA: Implement reasonable synonyms for using phone
"use phone" is already covered by the singular-using action]

Check taking the phone booth:
	try entering the phone booth instead.
[this is intended to catch "pick up phone" as a synonym for using it]

Report smelling the phone booth:
	say "Oof. Faint stench of body fluids. Humans are so disgusting." instead.

Chapter - Crowd (scenery)

The crowd is in CampusEntrance.
The crowd is scenery.
The crowd is a person.
The crowd is plural-named.

Printed name of the crowd is "audience".

Description of the crowd is "Look at these idiots, lapping up everything Hadrian says. Didn't people use to throw tomatoes at guys like him? Or garlic?"

Understand "crowd/audience" or "specator/spectators" or "onlooker/onlookers" or "people" or "idiot/idiots" or "reporter/reporters/journalist/journalists/journo/journos" as the crowd.

Before talking to the crowd:
	say "You try to [one of]spread rumours about[or]slander[purely at random] Hadrian to the people next to you, but they just shush you." instead.
	
Check biting the crowd:
	say "Yeah, that would be nice. But someone would notice you doing it and make a big fuss, and you're trying to listen to Hadrian right now." instead.
	
Check pushing the crowd:
	say "[can't push multiple people]." instead.
Check pulling the crowd:
	say "[can't push multiple people]." instead.

Chapter - Stage (scenery)

The stage is in CampusEntrance.
The stage is scenery.

Description of the stage is "[StageDesc]."
[moonlite-revealed-to-crowd-flag is controlled by the prologue events in the Prologue scene code]

To say StageDesc:
	if prologue-ended-flag is false:
		say "Some plywood scaffolding thing covered in Lunarcel logos. There's a huge canvas tent over it to protect Hadrian from the sun, you guess. As well as Hadrian, there's a screen on the stage, [if moonlite-revealed-to-crowd-flag is false]covered by a sheet[otherwise]showing some Moonlite machine[end if]";
	otherwise:
		say "Just a pile of scaffolding now"

Understand "plywood/wood" and "scaffold/scaffolding" and "canvas/tent" as the stage.

The stage is a supporter.

Check entering the stage:
	if Prologue has not ended:
		say "Rush the stage and attack Hadrian! An excellent idea. But this all seems like Hadrian has something big planned, and maybe it would be better to figure out what it is and not get spotted by him yet." instead;
	otherwise:
		say "Too late to get on the stage - it's just scaffolding now." instead.
		
Instead of climbing the stage:
	try entering the stage.
	
	
Section - Screen (scenery)

The screen is on the stage.
The screen is scenery.

Description of the screen is "[ScreenDesc]."

To say ScreenDesc:
	if moonlite-revealed-to-crowd-flag is false:
		say "Well, you guess it's a screen. It's something big and flat and rectangular covered by a sheet";
	otherwise:
		say "The screen shows a promotional image of something called the Moonlite. It looks like some kind of big dumb thimble-shaped machine".
		
Understand "tv/telly/monitor" and "big/flat/rectangular" as the screen.
Understand "sheet" as the screen when moonlite-revealed-to-crowd-flag is false.
Understand "picture/image/promo/promotion/promotional" and "moonlite/machine/thimble" as the screen when moonlite-revealed-to-crowd-flag is true.
	
Instead of doing something other than examining to the screen:
	say "That would mean getting on the stage, and you don't want Hadrian to see you yet.".
	
	
Chapter - Workers (scenery)

The stageWorkers are in Backstage. [moved to CampusEntrance when Prologue ends, as defined by Prologue code]
The stageWorkers are scenery.
The stageWorkers are a person.

Printed name of the stageWorkers is "workers".
The stageWorkers are plural-named.

Understand "worker/workers" and "labour/labourer/labourers" and "blue/collar/bluecollar/blue-collar" and "person/people/man/men/woman/women" as the stageWorkers.

Description of the stageWorkers is "Just a bunch of blue-collar workers, you suppose[if Fight is happening]. They don't seem to have noticed the whole situation with you and Hadrian[end if]."

Before talking to the stageWorkers:
	if Fight is happening:
		say "You try to get their attention, but they're too busy! Or they're pretending to be. How long can it take to dismantle a stage for a press conference, anyway?" instead;
	otherwise:
		say "They seem too busy to talk. Also, you don't like being outnumbered by labour." instead.
	
Check biting the stageWorkers:
	if Fight is happening:
		say "'Those are [italic type]mine![roman type]' yells Hadrian. None of the workers seem to notice that remark." instead;
	otherwise if Endgame is happening:
		now the stageWorkers are in Backstage;
		say "Oh, what the hell. You lunge! Scaffolding flies as you chase the workers for a meal. They all scatter in different directions, and you don't manage to catch any. Shame. If you weren't so tired from that fight you'd have feasted." instead.
		
Check pushing the stageWorkers:
	say "[can't push multiple people]." instead.
Check pulling the stageWorkers:
	say "[can't push multiple people]." instead.


Chapter - Banner (scenery)

The banner is in Backstage.
When Prologue ends:
	move the banner to CampusEntrance.

The banner is fixed in place.
Understand "sign/poster" and "ad/advert/advertisement/commercial" and "help/wanted/help wanted" and "number/phone number/telephone number" as the banner.
	
Initial appearance of the banner is "[if Interview has not ended]Now that the stage has been cleared away, y[otherwise]Y[end if]ou can see a 'Help Wanted' banner affixed by the entrance."

Description of the banner is "'DO YOU HAVE WHAT IT TAKES to deliver high-quality award-winning customer service online and by telephone to Lunarcel customers and clients[note x-banner]? WE ARE HIRING! Entry-level positions - NO CV REQUIRED! Start as early as TODAY! CALL NOW!'[first time][paragraph break]'No CV required'? 'Start today'? They must be desperate to hire people. There's a phone number on the banner - maybe you could get invited in for an interview...[only]"

Instead of examining the banner when the player is in InPhoneBooth:
	say "You can't quite read it from in here."

Check taking the banner:
	if Hadrian is in CampusEntrance:
		say "'Try it if you like, Nero!' gloats Hadrian. 'I have an extra banner somewhere... AND I'm advertising the job online!!'" instead;
	otherwise:
		say "Remove the banner so that nobody sees it and Hade can't hire anyone? An excellent idea. But... no, that prick's probably got an extra banner somewhere. He might even be advertising the job online. He has all sorts of devious tricks up his sleeve." instead.
		
Job-number-known-flag is a truth state that varies. Job-number-known-flag is false.
Carry out examining the banner:
	now job-number-known-flag is true.


Chapter - Sun (backdrop in all sunlit rooms)

The sun is a backdrop. It is in CampusEntrance.
When play begins (this is the put sun in correct rooms rule):
	move the sun backdrop to all sunlit rooms.
	
Understand "sky" as the sun.

Description of the sun is "There's the garbage sun up there, just one of the many banes of your existence."

Instead of doing something other than examining to the sun:
	say "You can't do anything to the sun, because 1) it's like a million miles away, and 2) you'll die." instead.


Chapter - Going from CampusEntrance - can't leave during Prologue, can't leave map (incl secret death)

Check going south in CampusEntrance:
	if Endgame is happening:
		say "You are so close to doing whatever you want with the Moonlite. You can't leave now[note go-south-from-entr]." instead;
	otherwise if Fight is happening:
		say "Yeah, screw this! All you wanted to do was destroy Hadrian's work and livelihood, and now he's superpowered and trying to kill you?? He can keep his precious Moonlite. You're going home. You hope he doesn't follow you.";
		end the story saying "He follows you and kills you" instead;
	otherwise if Interview has happened:
		say "If you go home now, someone might notice and fire you! Then you'll have to reapply for a job using a new name, and maybe one of those glasses-moustache disguises. Better to stay here and save yourself the hassle[note go-south-from-entr]." instead;
	otherwise:
		say "You don't want to leave yet - you've barely even tried to sabotage Hadrian[note go-south-from-entr]!" instead.
	
Check going east in CampusEntrance:
	try going south instead.
	
Check going southeast in CampusEntrance:
	try going south instead.

Check going west in CampusEntrance:
	try going south instead.
	
Check going southwest in CampusEntrance:
	try going south instead.
	
["Check going nowhere from CampusEntrance" would catch these cases more efficiently, but also introduce a bunch of nonsense cases like "going up from CampusEntrance"]
	


Part - InPhoneBooth

InPhoneBooth is a room. Printed name of InPhoneBooth is "Inside the Phone Booth".

Description of InPhoneBooth is "The inside of the booth is astonishingly well maintained, apart from a few call cards and a faint stink. Maybe Lunarcel looks after it. (Maybe they have to, since it's the first thing visitors see at the entrance.)"

[Scope code borrowed from Emily Short and Graham Nelson, Inform 7 documentation, example 217]
After deciding the scope of the player:
	if the player is in InPhoneBooth, place CampusEntrance in scope.
	
[I'm a bit worried about this code because I don't understand everything that scope does. If all is well, it should allow things in CampusEntrance to be visible (i.e. looking through windows in the phone booth). It would also allow taking things in CampusEntrance from InPhoneBooth, which is not desirable, but in practice it shouldn't be possible because the player is locked into a conversation tree when they enter the booth. (see below section, talking on the phone)]

Chapter - Campus (backdrop)

The campusBD is a backdrop in InPhoneBooth. Printed name of the campusBD is "campus".

Understand "campus/entrance/gate" and "outside" and "window/windows" as the campusBD.

Description of the campusBD is "The entrance to the Lunarcel campus is outside[if Hadrian is in CampusEntrance], as is a very big and angry vampire[end if]."


Chapter - Operator (dummy person to control phone conversation)

An operator is in InPhoneBooth.

[make the operator invisible]
The operator is privately-named. The operator is scenery.

[make the operator able to support conversation]
The operator is a person.

Description of the operator is "Dummy person to control phone conversation. If you're able to see this text in-game, please report it as a bug!"

Section - Talking on the phone

After going to InPhoneBooth:
	try talking to the operator.
	
[*IDEA: This works but suppresses looking at InPhoneBooth - is this good? I think it's fine, but may wish to account for it.]

The greeting of the operator is pho_greeting. The litany of the operator is the Table of Phone Conversation.

Table of Phone Conversation
prompt	response	enabled
"Call the [if employed-flag is false]Lunarcel job application number[otherwise]manager"	pho_man	1
"I'm applying for that job opening."	pho_man_apply	0
"So I'm definitely allowed into the campus, then?"	pho_man_apply_assure	0
"Great! See you soon."	pho_man_apply_goodbye	0
"[prank call]!"	pho_man_prank	0
"Sorry, wrong number."	pho_man_goodbye	0
"Call the emergency services"	pho_911	1
"Never mind"	pho_goodbye	1

Table of Quip Texts (continued)
quip	quiptext
pho_greeting	"You enter the booth and pick up the phone[note phones-and-computers]. Who will you call?[first time][paragraph break][italic type][bracket]When talking to people or using devices, you'll be given numbered options like those below. To choose one, just type the number of the option you want. For example, just type '1' if you want to select the first option.[close bracket][roman type][only]"
pho_man	"You dial [if employed-flag is false]the number on the job advert. It rings for a while, but a glassy-sounding voice[otherwise]your manager's number, and she[end if] eventually picks up. 'Hello, Lunarcel customer services department, how may I help you?'"
pho_man_apply	"'Brilliant. Well, we're hiring quickly at the moment, so we're open all week for applicants. We just need to do an informal interview to get to know you first. Can you drop in today?'[paragraph break]You give the woman on the other end a fake name and details. (Well, better pretend to be human while you're sneaking in. You can feed on the employees later[note pho-man-apply].) 'Great! Thanks, Oren[note oren]. Come into the office whenever you can. We're on the Lunarcel campus, on the west end. We're in the white office block there.'"
pho_man_apply_assure	"'Yes, of course you're allowed in! Why wouldn't you be?'"
pho_man_apply_goodbye	"You say your goodbyes and end the call. So, you've been invited in for interview! You should be able to cross the threshold into the campus now[note thresholds]. Unless Hadrian spots you and bans you again. But how could he possibly find you? You're using a fake name."
pho_man_prank	"You hang up without waiting for a response. [if employed-flag is false]It's good to laugh now and then[otherwise]She probably doesn't deserve that, but it [italic type]is[roman type] funny[end if]. You head back outside."
pho_man_goodbye	"You hang up and leave the booth."
pho_911	"[911 call]"
pho_goodbye	"You hang up and leave the booth."


Before talking to the operator:
	check the job quip availability.
	
To check the job quip availability:
	disable the pho_man quip for the operator;
	if Confrontation has not happened:
		if job-number-known-flag is true:
			enable the pho_man quip for the operator.
[the Confrontation bit here keeps the manager quip disabled after the player meets Hadrian. This is done because a) it seems silly to let Nero prank call the manager while Hadrian is trying to kill him, and b) the manager leaves the game away during the fight scene, so might as well disable it now]

Applied-to-job-flag is a truth state that varies.
Applied-to-job-flag is false.

After quipping when the current quip is pho_man:
	disable the pho_911 quip;
	disable the pho_goodbye quip;
	if applied-to-job-flag is false:
		enable the pho_man_apply quip;
	enable the pho_man_prank quip;
	enable the pho_man_goodbye quip.
	
After quipping when the current quip is pho_man_apply:
	now applied-to-job-flag is true;
	[say "(now applied-to-job-flag is true).";]
	disable the pho_man_prank quip;
	disable the pho_man_goodbye quip;
	enable the pho_man_apply_assure quip;
	enable the pho_man_apply_goodbye quip.
	
After quipping when the current quip is pho_man_apply_goodbye:
	disable the pho_man_apply_assure quip;
	enable the pho_man quip;
	enable the pho_911 quip;
	enable the pho_goodbye quip;
	terminate the conversation;
	try going outside.
	
To say prank call:
	say "[prank call setup]? [prank call punchline]".
To say prank call setup:
	say "[one of]Is your refrigerator running[or]Do you have Prince Albert in a can[purely at random]".
To say prank call punchline:
	say "[one of]Well you'd better go catch him[or]Well you'd better let him out[purely at random]".
	
After quipping when the current quip is pho_man_prank:
	disable the pho_man_apply quip;
	disable the pho_man_goodbye quip;
	enable the pho_man quip;
	enable the pho_911 quip;
	enable the pho_goodbye quip;
	terminate the conversation;
	try going outside.

After quipping when the current quip is pho_man_goodbye:
	disable the pho_man_apply quip;
	disable the pho_man_prank quip;
	enable the pho_man quip;
	enable the pho_911 quip;
	enable the pho_goodbye quip;
	terminate the conversation;
	try going outside.
	
911-called-on-Hade-flag is a truth state that varies. 911-called-on-Hade-flag is false.
911-called-in-endgame-flag is a truth state that varies. 911-called-in-endgame-flag is false.
To say 911 call:
	if Confrontation has not happened: 
		say "Call the police on Hadrian and have him arrested on spurious charges? An excellent idea. And indeed, you tried it a few years ago. And that's how you learned that the emergency services can track call locations to arrest hoaxers. So you'd better not, at least not until you know what's up with Hadrian's dumb machine[note pho-911].[no line break]";
	otherwise if Fight is happening:
		if 911-called-on-Hade-flag is false:
			now 911-called-on-Hade-flag is true;
			say "You call the emergency services. You tell them that the CEO of a major energy company has gained super-strength and is on a homicidal rampage. They're not interested! They say that hoax calls can and will be prosecuted, and they say not to call them again! They hang up! What kind of useless service is this?[no line break]";
		otherwise:
			say "You try again to get help from the emergency services. You hold the receiver up to the wall of the phone booth, which Hadrian is currently trying to kick to pieces, and you patiently explain that this is the result of a special machine which makes vampires stronger and cooler through means of helium energy. Again, they don't believe you! It's as if the police are willing to let rich and powerful people do what they like![no line break]";
	otherwise:
		if 911-called-in-endgame-flag is false:
			now 911-called-in-endgame-flag is true;
			say "You call the emergency services. You let them know that Hadrian Alba has mysteriously died in an office block at Lunarcel[if 911-called-on-Hade-flag is true], and also that they're all useless[end if]. You hang up on them.[no line break]";
		otherwise:
			say "No need to do that again.[no line break]".

After quipping when the current quip is pho_911:
	enable the pho_911 quip.
	
After quipping when the current quip is pho_goodbye:
	enable the pho_goodbye quip;
	terminate the conversation; 
	try going outside.


Part - CampusCentral

CampusCentral is a sunlit room. Printed name of CampusCentral is "Campus Central".
CampusCentral is north of CampusEntrance.

Description of CampusCentral is "This central plaza is wide and spacious, offering striking views of all the major landmarks of the campus, as if designed by a brutalist landscape gardener[if signpost-moved-flag is true]. The black glass building to the immediate north is the corporate headquarters; the campus stretches east to the engineering laboratory, and west to the customer service office. You can also leave the campus through the southern exit[note compass-directions][end if]."


Chapter - Entering CampusCentral

Check going to CampusCentral:
	if applied-to-job-flag is false:
		say "You can't. Vampires have a... a whole [italic type]thing[roman type] about crossing property thresholds without being invited in. And Hadrian has previously made it [italic type]very clear[roman type] that you are not welcome on his property. You will need to be invited onto the campus somehow if you want to enter it." instead.
	
[Applied-to-job-flag is set inside the phone booth conversation, when the player uses the job application hotline.]

Chapter - Plaza (backdrop which redirects to looking at room)

The plaza is a backdrop. The plaza is in CampusCentral. The plaza is in CampusEntrance. The plaza is in CampusEast. The plaza is in CampusWest. Understand "campus" as the plaza.

Description of the plaza is "The airy central plaza of the Lunarcel campus is visible to the [plaza direction]."

To say plaza direction:
	if the player is in CampusEntrance:
		say "north";
	otherwise if the player is in CampusEast:
		say "west";
	otherwise if the player is in CampusWest:
		say "east".

Instead of examining the plaza in CampusCentral:
	try looking.
	
Instead of taking the plaza:
	say "Steal the whole campus? Maybe with some kind of property scam? Not right now, but it's a great idea for another day."


Chapter - Headquarters (backdrop)

Corporate Headquarters is a backdrop. Corporate Headquarters is in CampusCentral. [Corporate Headquarters is in CampusWest. Corporate Headquarters is in CampusEast.]

Understand "landmark/landmarks" and "building/buildings" and "black" and "glass" and "hq" and "dome/domed" and "forest/concrete/stout/office/block" as Corporate Headquarters.

Description of Corporate Headquarters is "Directly north is the corporate headquarters, a monolithic black glass structure designed to make an impression[note hq-bd]. There's a big domed building off to the east. West is a forest of concrete, but you can just see a stout office block peeking around a corner."

[To say HQ visibility:
	if player is not in CampusCentral:
		say ", rising over to the ";
		if player is in CampusWest:
			say "east";
		otherwise:
			say "west".]
			
[I dummied out the HQ being visible elsewhere in campus because it was confusing and unnecessary - the tester who found that you can see the HQ in other locations interpreted it as a bug. I repurposed the HQ description to account for the landmarks noun very late on in development, which is why it's the HQ backdrop and not the landmarks backdrop]

Instead of entering Corporate Headquarters:
	try going north.
	
Instead of going inside in CampusCentral:
	try going north.

Chapter - Wooden signpost

The wooden signpost is in CampusCentral.

Understand "sign/signs" and "post" as the wooden signpost.

Initial appearance of the wooden signpost is "[if the wooden signpost is in CampusCentral]As a wooden signpost indicates, the black glass building to the immediate north is the corporate headquarters; it also tells you that the campus stretches east to the engineering laboratory, and west to the customer service office. You can also leave the campus through the southern exit[note compass-directions][otherwise]The wooden signpost is here, now pointing uselessly to the walls and floor[end if]."

Description of the wooden signpost is "Lots of little signs jutting out of a wooden pole. It looks like one of those destination signposts they have at landmarks which tell you how far away other capital cities are, except this one [if signpost-moved-flag is true]used to point[otherwise]points[end if] to buildings on the campus[if signpost-moved-flag is false]. Is this supposed to be Hadrian's way of making the place feel welcoming and playful to visitors? Because the big black building overshadows it[otherwise]. The end which used to be in the ground is very pointy[end if]."

Section - Interacting with the signpost

Signpost-moved-flag is a truth state that varies. Signpost-moved-flag is false.
[Flag triggered by Hadrian taking the sign, as defined under his chapter]

Check taking the wooden signpost:
	if signpost-moved-flag is false:
		say "It's stuck fast in the ground. All the little pointers are pretty solid, too. Pity. You'd have turned everything the wrong way around to annoy Hadrian's guests." instead;
	otherwise if the wooden signpost is held by Hadrian:
		if Hadrian is holy-safe:
			say "You try to wrest the signpost from Hadrian, but his grip is far too strong. 'Get your own!' he snarls, catapulting you away with a flick of his wrist. It looks too big and heavy for you to have wielded effectively anyway." instead;
		otherwise:
			say "Now looks like your chance, but somehow Hadrian's grip on the signpost stays firm even while he gazes at the holy symbols and gibbers softly. Too big to be a good stake for you to use anyway. Think smaller!" instead;
	otherwise:
		say "You take the sign, but you stagger under its weight and have to drop it again." instead.
		
Check turning the wooden signpost:
	if signpost-moved-flag is false:
		try taking the wooden signpost instead.
	
Check pushing the wooden signpost:
	if signpost-moved-flag is false:
		try taking the wooden signpost instead.
	
Check pulling the wooden signpost:
	if signpost-moved-flag is false:
		try taking the wooden signpost instead.



Part - CampusWest

CampusWest is a sunlit room. Printed name of CampusWest is "Campus West".
CampusWest is west of CampusCentral.

Description of CampusWest is "Somewhat less pretty than the entrance and central plaza were - this part of the campus must usually be seen only by employees. North is a grimy-looking office block, and the rest of the campus is to the east[note look-campuswest]."

[Yeah, this room is empty and completely unnecessary, but it's staying because a) it makes the map nice and symmetrical, b) I like the effect it has of isolating the office from the "nice" parts of the map, and c) it's late enough in development that I don't want to cut anything out for fear of the ripple effect it might cause throughout the project]

Chapter - Office block

The officeBlock is a backdrop in CampusWest. Printed name of officeBlock is "office block".

Description of the officeBlock is "A tired and dirty cuboid of a building tucked away almost out of sight from the central campus."

Understand "building" and "office/block" and "grimy" as the officeBlock.

Instead of entering officeBlock:
	try going north.
	
Instead of going inside in CampusWest:
	try going north.


Part - CampusEast

CampusEast is a sunlit room. Printed name of CampusEast is "Campus East".
CampusEast is east of CampusCentral.

Description of CampusEast is "This part of the campus plaza wants to be open and airy, but it's hemmed in by various concrete structures, the biggest of them being the Engineering Laboratory to the north. Prettier parts of the campus are to the west."

Chapter - LaboratoryBlock (backdrop)

The laboratoryBlock is a backdrop in CampusEast. Printed name of the laboratoryBlock is "Engineering Laboratory".

Description of the laboratoryBlock is "This must be where all of Lunarcel's research and prototyping takes place. It looks like a crude concrete domed structure; sort of like a cathedral if the architect got bored before adding all the detail[note lab-bd]."

Understand "engineering/lab/laboratory/building/concrete/dome" as the laboratoryBlock.

Instead of entering the laboratoryBlock:
	try going north.
	
Instead of going inside in CampusEast:
	try going north.
	
[in/out were implemented as directions for CampusEast and LabEntrance, but tester Dark Star found that in the original release you could just type "in" here and skip the whole janitor puzzle!]

Chapter - Structures (backdrop)

The structures are a backdrop in CampusEast.

Description of the structures is "Big concrete buildings of all shapes and sizes, whose purposes you are completely uninterested in. The Engineering Laboratory to the north is more interesting."

Understand "building/buildings/structure/structures/concrete" as the structures.

Chapter - Leak (barrier)

The leak is in CampusEast.
The leak is fixed in place.

Initial appearance of the leak is "Water cuts across the laboratory doorway here, spouting from a burst pipe in the wall."

Description of the leak is "A stream of water issues from a tear in one of the pipes in the wall. It's only a stream, but it's still running water[note x-pipe]."

Understand "water/stream/river" and "burst/pipe/pipes/fracture/puncture/hole/tear/wall" as the leak.

Check going north in CampusEast:
	if the leak is in CampusEast:
		say "You try very hard, but no, vampires can't cross running water. No going around either, it's right in front of the lab doorway." instead.

Check biting the leak:
	say "You prefer your water with more iron, and hemoglobin." instead.
	
Check switching off the leak:
	say "There's no switch or valve or anything." instead.
	
Check fixing the leak:
	say "You never learned how to fix plumbing. Other people do that kind of thing." instead.
	
Section - Pipe

The pipe is in Backstage.
[Pipe moved in when janitor fixes leak]

The pipe is scenery.

Description of the pipe is "[if Confrontation has not happened]All patched up now[otherwise]The pipe now makes a U, spraying water around the back of the laboratory and out of everyone's way[end if][note x-pipe]."

Understand "leak/water/stream/river" and "burst/pipe/pipes/fracture/puncture/hole/tear/wall" as the pipe.

Check fixing the pipe:
	say "[if Confrontation has not happened]The janitor woman did a good job of fixing it already. Better leave it alone[otherwise]You try to twist it back into position, but it's stuck firmly in its new shape[end if]." instead.
	
Check turning the pipe:
	if Confrontation has happened:
		try fixing the pipe instead.

[There was originally a good reason why the leak and the pipe are two separate objects instead of just one object with a few more if conditions. But I forget what it was. Another of those things where the style is very bad but I worry that if I change it I'll have to play Whack-a-Mole with bugs.]
	
Chapter - Janitor (person)

The janitor is a woman in CampusEast.

Initial appearance of the janitor is "There's a worker here, maybe a janitor or other maintenance person, leaning against the wall and holding a sign that says 'VAMPIRES SUCK'[first time]. There's just no need for that kind of tone[only][note x-janitor]."

[*IDEA: I should change this after the player has talked to the janitor, i.e. shouldn't say "maybe a janitor" anymore but should be certain]

Description of the janitor is "She's leaning against the wall, holding a protest sign. She spots you looking at her, nods at you and waggles the sign a little."

Understand "worker/custodian/caretaker" or "repairer/repairwoman/repair" or "maintenance" or "woman" or "person" as the janitor.

Section - Placard

The placard is carried by the janitor.

Understand "protest/sign" as the placard.

Description of the placard is "An extremely hurtful and inappropriate placard that says 'VAMPIRES SUCK'[note vampires-suck]."

Check removing the placard from the janitor:
	try taking the placard instead.

Check attacking the placard:
	try taking the placard instead.
	
Check taking the placard:
	say "[one of]Incensed, y[or]Y[stopping]ou try to swipe the rude placard away, but the janitor leans away. 'Don't worry, mate,' she says. 'I can keep holding this. You can make your own sign at home if you like!'" instead.

Section - Talking to the Janitor

The greeting of the janitor is jan_greeting. The litany of the janitor is the Table of Janitor Conversation.

Table of Janitor Conversation
prompt	response	enabled
"What's the protest for?"	jan_protest	1
"Isn't anyone else striking with you?"	jan_protest_others	0
"But haven't vampires done so much for us?"	jan_protest_vampires	0
"Could you fix this water leak so I can get to the laboratory?"	jan_leak	1
"What did you want again before fixing the leak?"	jan_leak_reminder	0
"What prayer room?"	jan_leak_prayerroom	0
"Was this empty raisin box yours?"	jan_raisins_box	0
"Do you want these grapes instead of your raisins?"	jan_raisins_grapes_moist	0
"Will you accept loose raisins?"	jan_raisins_grapes_dry	0
"I found your box of raisins."	jan_raisins_solve	0
"Thanks for fixing the leak."	jan_thanks	0
"I'm trying to break into Hadrian Alba's computer. Do you know what his password is?"	jan_password	0
"Goodbye."	jan_goodbye	1

Table of Quip Texts (continued)
quip	quiptext
jan_greeting	"She nods at you as you approach. 'Hiya. Vampires [one of][or]still [stopping]suck.'"
jan_protest	"'It's against vampires. Especially our guy in charge. It's against vampiric systems. It's against the exploitation of labour on long hours and low pay. It's for changes at the highest level for Lunarcel and every other company which lines its own pockets at the expense of workers. It's for radical new ways of being which aren't built on blood and toil[note vampires-as-capitalists].' (You don't like this woman.)"
jan_protest_others	"'See, that's another problem. Any time we stand up for ourselves, some spurious reason to fire them comes up. I've known three guys here who were getting support for unions, and they all got found out, and they all got fired immediately for, like, [']toxic influence['] or something. They're busting unions. So it's just me protesting for now. I won't get anybody else in trouble.'"
jan_protest_vampires	"'Oh, I used to think that too! You're not alone. But someone showed me it's all selfish. Vampires get rich off blood and labour, and whatever they give back doesn't usually help anyone but themselves, right? Look at Hadrian Alba. He gave that money for more blood donation clinics years ago, right? But he provided the land, so all the clinics were built on land he owned, right? So he becomes the landlord and proprietor of, basically, grocery stores for vampires. You can't [italic type]prove[roman type] anything, but it's a conflict of interest, right? You have to be suspicious. All the stuff vampires do [']for us['] is just stuff they'd do anyway but they want to be congratulated for it, so we ignore all the blood-drinking.'[paragraph break](You'd argue for vampires if it wasn't Hadrian she was picking on. Anyway, she's right. You were working for Hade when he planned it. You think about some of your own past businesses, such as your mail-order blood testing kits and your anti-garlic lobby, and you decide to drop the subject.)"
jan_leak	"'Hm? Oh, this?' The janitor glances at the rip in the water pipe next to her, as if she forgot about it. 'Yeah, it's a nasty one. Don't know how it got there. Sorry, mate, I'm leaving it for now. Not much of a strike if I'm working during it. Can't you just cross it?' Before you can think of an excuse, she gasps. 'Oh! Holes in your shoes? Fair enough, mate. Nice umbrella, by the way.'[paragraph break]She thinks a little. 'Tell you what, mate, can you do me a favour? I brought some raisins to snack on, but I think I left them in the prayer room. Can you get them for me? I'll tape up the leak for you when you do[note grapes-puzzle].'"
jan_leak_reminder	"'I left a box of raisins in the prayer room. I'll fix the leak for you if you fetch them for me[note grapes-puzzle]. I'd get them myself, but it's not much of a protest if I'm gone for most of it.'"
jan_leak_prayerroom	"'Oh yeah! Sorry, mate. It's at the far end of the campus' - she points west towards the offices - 'in a side room. You'll find it. We don't talk about it much. It's not official. You know vampires and religion.'"
jan_raisins_box	"[jan_raisins_box text].)"
jan_raisins_grapes_moist	"[jan_raisins_grapes_moist text]."
jan_raisins_grapes_dry	"[jan_raisins_grapes_dry text].'"
jan_raisins_solve	"[jan_raisins_solve text]."
jan_thanks	"'No problem. Thanks for getting me my raisins!' She raises the box like a glass."
jan_password	"'Why would I know that, mate? Don't even get a computer here. Can you guess it, maybe?' She brightens. 'Oh yeah! There was some security problem a while back. All the executives were using really easy-to-guess passwords. Like, I think Alba's password was just [']password[']. It won't be that anymore, they'll have made him change it, but I bet it's something obvious like that.'"
jan_goodbye	"'See ya.'"

Jrk-flag is a truth state that varies. Jrk-flag is false.
[Jrk for Janitor Raisin Knowledge, shortened so I dont keep misspelling it]

To check the janitor raisins quip availability:
	disable the jan_raisins_box quip for the janitor;
	disable the jan_raisins_grapes_moist quip for the janitor;
	disable the jan_raisins_grapes_dry quip for the janitor;
	disable the jan_raisins_solve quip for the janitor;
	if jrk-flag is true:
		if the box is carried by the player:
			if the bunch of grapes is contained in the box:
				enable the jan_raisins_solve quip for the janitor;
			otherwise:
				enable the jan_raisins_box quip for the janitor;
				if the bunch of grapes is carried by the player:
					if the bunch of grapes is moist:
						enable the jan_raisins_grapes_moist quip for the janitor;
					otherwise:
						enable the jan_raisins_grapes_dry quip for the janitor;
		otherwise:
			disable the jan_raisins_solve quip for the janitor;
			if the bunch of grapes is carried by the player:
				if the bunch of grapes is moist:
					enable the jan_raisins_grapes_moist quip for the janitor;
				otherwise:
					enable the jan_raisins_grapes_dry quip for the janitor.
		
[
[DEBUG VERSION]
To check the janitor raisins quip availability:
	say "DEBUGGING RAISIN CONVERSATION CHOICES: Selecting appropriate quips for the janitor.";
	say "First disabling all raisins-related quips, just to be certain.";
	disable the jan_raisins_box quip for the janitor;
	disable the jan_raisins_grapes_moist quip for the janitor;
	disable the jan_raisins_grapes_dry quip for the janitor;
	disable the jan_raisins_solve quip for the janitor;
	say "Now checking conditions.";
	if jrk-flag is true:
		say "JRK-FLAG: true. i.e. the player has learned about the raisin problem.";
		if the box is carried by the player:
			say "Box carried by player.";
			if the bunch of grapes is contained in the box:
				say "Raisins are in box. All checks passed: jan_raisins_solve quip should now be enabled.";
				enable the jan_raisins_solve quip for the janitor;
			otherwise:
				say "Raisins are not in box. jan_raisins_solve stays disabled. Because player has box, jan_raisins_box is enabled.";
				enable the jan_raisins_box quip for the janitor;
				if the bunch of grapes is carried by the player:
					if the bunch of grapes is moist:
						say "Player carries the moist (unbitten) bunch of grapes as well. jan_raisins_grapes_moist is enabled.";
						enable the jan_raisins_grapes_moist quip for the janitor;
					otherwise:
						say "Player carries the dry (bitten) bunch of grapes as well. jan_raisins_grapes_dry is enabled.";
						enable the jan_raisins_grapes_dry quip for the janitor;
				otherwise:
					say "Player does not carry the bunch of grapes. No further action taken.";
		otherwise:
			say "Box is not currently carried by player. jan_raisins_solve stays disabled. jan_raisins_box stays disabled too.";
			disable the jan_raisins_solve quip for the janitor;
			if the bunch of grapes is carried by the player:
				if the bunch of grapes is moist:
					say "Player carries the moist (unbitten) bunch of grapes but not the box. jan_raisins_grapes_moist is enabled.";
					enable the jan_raisins_grapes_moist quip for the janitor;
				otherwise:
					say "Player carries the dry (bitten) bunch of grapes but not the box. jan_raisins_grapes_dry is enabled.";
					enable the jan_raisins_grapes_dry quip for the janitor;
			otherwise:
				say "Bunch of grapes is not carried by player either. No raisin puzzle quips should be available.";
	otherwise:
		say "JRK-FLAG: false. Player has not learned about the raisin problem, so no raisin puzzle quips should be available.".
]
		
Before talking to the janitor:
	check the janitor raisins quip availability.
	
After quipping when the current quip is jan_protest:
	enable the jan_protest_others quip;
	enable the jan_protest_vampires quip.

After quipping when the current quip is jan_leak:
	now jrk-flag is true;
	enable the jan_leak_reminder quip;
	enable the jan_leak_prayerroom quip;
	check the janitor raisins quip availability.
	
After quipping when the current quip is jan_leak_reminder:
	enable the jan_leak_reminder quip.
	
After quipping when the current quip is jan_leak_prayerroom:
	enable the jan_leak_prayerroom quip.
	
To say jan_raisins_box text:
	say "'Empty? Nah, mate, hadn't had them yet. Could you get me my raisins, please?' (You're beginning to wonder if this person on strike [italic type]wants[roman type] to do any work"

After quipping when the current quip is jan_raisins_box:
	enable the jan_raisins_box quip.
	
To say jan_raisins_grapes_moist text:
	say "'Oh!' The janitor considers for a moment. 'Nah. Sorry, mate, I appreciate it, but I kinda just want what's mine, which is raisins, in a box[note obvious-jokes]. Thanks anyway, though.' And she continues leaning, making no effort to fix the leak"
	
After quipping when the current quip is jan_raisins_grapes_moist:
	enable the jan_raisins_grapes_moist quip.
	
To say jan_raisins_grapes_dry text:
	say "'Loose raisins? You can get those?' The janitor shakes her head. 'Sorry. mate, I do appreciate it, but I just want a box of raisins. Don't want to be holding them in my bare hand, spilling them everywhere. Thanks anyway"
	
After quipping when the current quip is jan_raisins_grapes_dry:
	enable the jan_raisins_grapes_dry quip.
	
To say jan_raisins_solve text:
	say "'Brilliant! Thanks, mate!' She takes the box of raisins gratefully. She notices your meaningful look. 'Oh yeah! Sorry, mate, forgot I promised.' She produces a roll of tape from somewhere and patches up the leak in seconds. 'Done! Your shoes are safe.' She gives you a genuine smile, puts the roll away and returns to leaning"
	
[Note funky missing punctuation on the four text substitutions above. The punctuation is supplied manually after each use of the substitution (in the quips table above and in the check showing things to the janitor rule below). This is the only way I can get Inform to apply line breaks correctly. If I use the punctuation like a normal person would, an extra line break appears in conversation for each substituion; if I add "[no line break]" to each, the paragraph breaks disappear when showing things to the janitor. I will never ever understand how Inform 7's line break rules work, and I suspect that the QBC extension uses a slightly different method of applying line breaks just to keep me on my toes. Sorry that the code looks so dumb, but I just want it to work.]

After quipping when the current quip is jan_raisins_solve:
	solve the raisins puzzle;
	terminate the conversation.
	
After quipping when the current quip is jan_password:
	enable the jan_password quip.
	
After quipping when the current quip is jan_goodbye:
	enable the jan_goodbye quip;
	terminate the conversation.
	
Raisins-puzzle-solved-flag is a truth state that varies. Raisins-puzzle-solved-flag is false.
	
To solve the raisins puzzle:
	now the box is in Backstage;
	now the leak is in Backstage;
	now the pipe is in CampusEast;
	now raisins-puzzle-solved-flag is true;
	disable the jan_raisins_solve quip for the janitor;
	disable the jan_leak_reminder quip for the janitor;
	disable the jan_leak_prayerroom quip for the janitor;
	enable the jan_thanks quip for the janitor.
	
Section - Showing things to the janitor (including alternate method to solve the raisins puzzle)

The block showing rule does nothing when the second noun is the janitor.

Check showing something to the janitor when jrk-flag is false:
	say "She doesn't need that as far as you know, and anyway you're not going to give free gifts to anyone promoting such cruel invective towards vampires." instead.
	
Check showing something to the janitor when jrk-flag is true:
	if raisins-puzzle-solved-flag is true:
		say "She's already got a box of raisins out of you, and that's all she'll get!" instead;
	if the noun is the bunch of grapes:
		if the bunch of grapes is moist:
			say "You offer the janitor the bunch of grapes. They're basically just waterlogged raisins, right? [jan_raisins_grapes_moist text]." instead;
		otherwise:
			say "You offer the dried grapes to the janitor. [jan_raisins_grapes_dry text].'" instead;
	otherwise if the noun is the box:
		unless the bunch of grapes is contained in the box:
			say "You show the raisin box to the janitor, and tell her it's already empty. [jan_raisins_box text].)" instead;
	otherwise:
		say "She won't want that - sounds like she's on a raisin hunt for now." instead.
		
Carry out showing something to the janitor when jrk-flag is true:
	say "[jan_raisins_solve text].";
	solve the raisins puzzle.


Book - Offices

Part - Office

Office is a room. Printed name of Office is "Office".
Office is north of CampusWest.[ Office is inside from CampusWest.]

Description of Office is "A modern open-plan office[if the officeWorkers are in Office]: bent backs from wall to wall and no privacy anywhere. Just how you used to like it when you were running these kinds of places[otherwise], currently empty[end if]. North [if PrayerRoom is unvisited]seems to lead to some kind of[otherwise]leads to a[end if] [if cupboard-opened-yet-flag is false]meeting room[otherwise]multifaith prayer room[end if]. You can head back outside to the south."

Instead of going outside in Office:
	try going south.
	
Instead of exiting in Office:
	try going south.
	
Instead of going north in Office when employed-flag is false:
	say "This looks like the right place, but you can't just wander around. Maybe the manager over there knows something about the interview."

Chapter - Message for sneaking in and out of Office

Report going to CampusWest from Office:
	if employed-flag is true:
		if the manager is in Office:
			say "You make a quick and confident exit while the manager's back is turned.";
			
Report going to Office from CampusWest:
	if employed-flag is true:
		if the manager is in Office:
			if Confrontation has not happened:
				say "You sneak back in. It looks like the manager didn't even notice you were gone.";
			otherwise:
				say "You charge into the office at full-tilt!";

Chapter - The Manager

The manager is a woman in Office.

Initial appearance of the manager is "[ManagerIA]."

To say ManagerIA:
	if the player is in Office:
		say "[if employed-flag is false]A woman who you take to be the office[otherwise]The[end if] manager is bustling wildly, juggling several administrative tasks at once[note x-manager]";
	otherwise if the player is in PrayerRoom:
		say "The office manager, your interviewer, is giving you her friendliest piercing gaze".

Description of the manager is "A bundle of stress in a turtleneck sweater."

Understand "woman" and "office" and "supervisor/boss/interviewer" and "turtleneck/sweater" as the manager.

Instead of biting the manager:
	say "That won't leave a good impression. Actually, it'll leave two good impressions in her jugular vein, but you'd still better not."

Section - Every turn the manager does some background task

Every turn when the manager is visible (this is the manager bustling rule):
	if the manager is in Office:
		unless QBC is active:
			if a random chance of 1 in 4 succeeds:
				choose a random row from the Table of Manager Bustling;
				say "[one of]Nearby, t[or]On the other side of the office, t[or]T[purely at random]he manager [event entry][p]";
	otherwise if the manager is in PrayerRoom:
		if a random chance of 2 in 5 succeeds:
			say "The interviewer [one of]gives you an encouraging little smile[or]fiddles with her pen, waiting for a response[or]writes an ominous little note[or]coughs quietly into her fist[at random].".
			
The manager bustling rule does nothing when looking.
The manager bustling rule does nothing when the player is in Office for the first turn.
The manager bustling rule does nothing when Fight is happening.
			
Table of Manager Bustling
event
"[one of]makes[or]answers[purely at random] a phone call and arranges some [one of]meeting[or]interview[or]review[purely at random] for [one of]today[or]tomorrow[or]later this week[purely at random]."
"rearranges some [one of]paperwork[or]files[or]stationery[purely at random] on a desk[if a random chance of 1 in 5 succeeds]. You don't think that's even her desk[end if]."
"[one of]patrols[or]does some supervising[purely at random], peering over some random [one of]woman[or]man[or]person[or]worker[or]intern[purely at random]'s shoulder at their screen."



Section - Talking to the Manager in Office

The greeting of the manager is man_greeting. The litany of the manager is the Table of Manager Conversation.

Table of Manager Conversation
prompt	response	enabled
"I'm here for a job interview."	man_welcome	1
"Never mind, I though you were someone else."	man_goodbye	1
"What are my job duties again?"	man_job	0
"When do we get breaks?"	man_break	0
"Excuse me, there's been some kind of mistake. My ID card won't get me into the laboratory."	man_card	0
"Where can I find someone to update my card security?"	man_card_update	0
"Do you know Mr. Alba's password? Can I have it?"	man_password	0
"Excuse me, there's been some kind of mistake. There's religion in the meeting room."	man_prayerroom	0
"Well, back to work for me."	man_goodbye2	0

Table of Quip Texts (continued)
quip	quiptext
man_greeting	"'Can I help- How can I help you?'"
man_welcome	"'Ah, you must be Oren! I'm ready for you right now. Follow me, please.' She leads you into the meeting room."
man_goodbye	"'Oh. Well, let me know if I can help.' She returns to bustling."
man_greeting2	"'Hi, Oren. [one of]Settling in alright[or]Do you need help[or]How can I help you[at random]?'"
man_job	"(You're asking this just to look like you're interested, of course. You have no intention of doing any actual work.)[paragraph break]'Today, you'll be handling online customer support. We've assigned you a computer there.' She points to the grimy old spare computer nearby. 'You've also got an email account set up for you already - you can check that on the computer too.'"
man_break	"'Not for a while, Oren. You have a few more hours yet before your ten-minute break,' she says[note man-break]. (You are, of course, not going to wait for a few more hours. You're already planning to sneak out of the office as soon as possible.)"
man_card	"'Your card won't let you into any restricted areas. I can't do anything about that. Only security officers and executives can change your card's clearance. Why do you need to go to the lab, anyway? You're supposed to be supporting the customer experience here.'"
man_card_update	"'Security and executives are all in the headquarters building. That's the big black one right in the centre of the campus.'"
man_password	"'We don't share user accounts and we don't share password information, Oren,' she says sternly. 'If it's password security you're worried about, IT just sent an email about that today. Maybe it's in your inbox?' She gestures at your computer. 'And there's a notice up there about passwords to avoid,' she continues, gesturing at [if the list of passwords is not handled]a list of passwords on the wall[otherwise]the empty spot on the wall where the list of passwords used to be[end if]."
man_prayerroom	"'Shh, shh, shh!' She leans in closer and lowers her voice. 'That's the prayer room. Could you keep it a secret for me, Oren? Mr. Alba doesn't know it's there. He's always come down very hard on religion. He says it's a distraction. Just keep it under your hat so he doesn't find out, okay? Thanks.'"
man_goodbye2	"'Alright, Oren.' The manager gives you a quick smile, and then bustles away again."

After quipping when the current quip is man_goodbye:
	enable the man_goodbye quip;
	terminate the conversation.
	
[The following code initiates the Interview scene]
Interview-scene-flag is a truth state that varies. Interview-scene-flag is false.
After quipping when the current quip is man_welcome:
	terminate the conversation;
	now interview-scene-flag is true.
	
[The following code is invoked after the job interview (as controlled by the Interview scene), but is placed here so it's easier to refer to the manager's litany when modifying it]
To prepare the new manager conversation:
	now the litany of the manager is the Table of Manager Conversation;
	now the greeting of the manager is man_greeting2;
	disable the man_welcome quip for the manager;
	disable the man_goodbye quip for the manager;
	enable the man_job quip for the manager;
	enable the man_break quip for the manager;
	enable the man_goodbye2 quip for the manager.
	
After quipping when the current quip is man_job:
	enable the man_job quip.
	
After quipping when the current quip is man_break:
	enable the man_break quip.
	
Man_card-quipped-flag is a truth state that varies. Man_card-quipped-flag is false.
After quipping when the current quip is man_card:
	now man_card-quipped-flag is true;
	enable the man_card_update quip.
	
After quipping when the current quip is man_card_update:
	enable the man_card_update quip.
	
After quipping when the current quip is man_password:
	enable the man_password quip.
	
After quipping when the current quip is man_prayerroom:
	enable the man_prayerroom quip.
	
After quipping when the current quip is man_goodbye2:
	enable the man_goodbye2 quip;
	terminate the conversation.
	


Section - Talking to the Manager in Job Interview 

Table of Interview Conversation
prompt	response	enabled
"Corporate espionage"	int_job_espionage	1
"Revenge"	int_job_revenge	1
"I've lost control of my life"	int_job_control	1
"It has always been my dream to serve the customer"	int_job_intern	1
"Failed to attract sufficient startup investment"	int_prev_investment	0
"Employees unwilling to work for me"	int_prev_employees	0
"Run out of town by pitchforked mob"	int_prev_pitchfork	0
"It did not challenge and inspire me like this job would"	int_prev_thrive	0
"Vulnerability to sunlight"	int_weak_sunlight	0
"Wooden stake through the heart or stomach"	int_weak_stake	0
"Inability to cross thresholds uninvited"	int_weak_threshold	0
"Sensitivity to holy symbols"	int_weak_holy	0
"Running water"	int_weak_running	0
"I guess I'm just a perfectionist"	int_weak_perfect	0

Table of Quip Texts (continued)
quip	quiptext
int_greeting	"The manager is sitting across from you. She gives you her friendliest smile. 'Good to meet you, Mr. Vohsarb. I only have a few questions for you, just to make sure you're an appropriate fit for this department. So, could you tell me why you applied for this job, and why you want to work at Lunarcel?[note interview-scene]'"
int_job_espionage	"(...although you already recognise the kind of work environment this is. You cultivated it yourself when you were in business. Productivity, that's the key. Make sure your workers are turning up and putting in the hours they owe you. Don't let them shirk. Open-plan offices help with that. You know that's what Hade's thinking[note hade-or-hadrian]. You learned it from him, after all.)[choose another response]"
int_job_revenge	"(Revenge! You've had your history with Hadrian Alba. You though he was a friend, until you dared to dream bigger. Now his very existence belittles you. He has insulted you, he has whispered behind your back, and it's not right that a prick like him gets the luck of the devil and the wealth to match. It should be [i]you[/i] doing press conferences about your big new inventions and investments, and [i]he[/i] should be the one sleeping in plywood coffins[note plywood-coffin]. Let's see how haughty he is when you find that Moonlite and ruin it and laugh at him.)[choose another response]"
int_job_control	"(Oh, you used to have control[note oh-pratchett]! You had it all once! Successful businesses, all the blood you could want, a castle with all sorts of turrets! But now... is this just how the poor live? Worried about tomorrow? Why would they want to live like this instead of becoming rich? This is just temporary. You just need to build up a little bit. And destroy Hadrian while you're doing it.)[choose another response]"
int_job_intern	"You say something about helping other people, the kind of thing you used to like to hear from other people. It looks like the manager likes it too. She scribbles a quick note, and says 'Thank you, Oren. Now, why did you leave your last job position?'"
int_prev_investment	"(You've had some genuinely brilliant ideas for startup companies. Mail-order blood testing kits[note blood-testing]. Spice jars with giant kernels of salt and pepper that you can count easily[note arithmomania]. Portrait painting services which eliminate the need for mirrors. All necessary and important, yet hardly any investors will recognise that! And whenever you do get a business up and running, there's always some stupid thing that comes up, like some study that says your product doesn't work or some big employment tribunal, and suddenly all the investors want their money back! Some call you bitter, but how can you [i]not[/i] be when things conspire against you so often?)[choose another response]"
int_prev_employees	"(Humans don't like to work, you've noticed. You do the heavy lifting of forming and directing a company, and all your employees will just flake out after a couple of years. Long hours? [i]Some[/i] of us work all [i]night[/i]. But you still end up burning through staff and stamping out unions like wildfires. At least [i]you'll[/i] get to be the one wasting company time and resources this time. Must be fun.)[choose another response]"
int_prev_pitchfork	"(This was just dumb. You've never known investors to actually club together and come round to the company headquarters with blunt weapons before. Of course [i]you[/i] would be the first guy it happened to. Yeah, they did lose a couple hundred million dollars between them, but that's investment! It's a risk! Sometimes money doesn't come back! Sometimes share prices just plummet, through no fault of your own! Take it up with every other business vampire!)[choose another response]"
int_prev_thrive	"You improvise something about how you've heard Lunarcel is the land of opportunity, and how the office looks like a great work environment and everything, just like you remember your old job applicants telling you.[p]As you start to wonder if they were lying too, the manager makes another little note. 'Thank you. Just one more question, and there are no right or wrong answers here... What would you say is your biggest weakness?'"
int_weak_sunlight	"(Is it some property of ultraviolet light? Or just sensitive skin? You're not sure, and neither is anyone else, but the sun still rises every day and ruins your life. Umbrellas and good sunblock help a bit, at least.)[choose another response]"
int_weak_stake	"(You were killed a couple times, a few hundred years ago. Who wasn't? Europe was lousy with vampire hunters back in the day. The number of times you've been woken up in your coffin by some prick with a wooden stake and a grudge[note hunter-intro]! People have told you that humans can't survive being staked in the heart either, but they don't understand, they don't live in fear of the stake like vampires do.)[choose another response]"
int_weak_threshold	"(You get very uncomfortable when you know you're not welcome[note weakness-thresholds]. Why should you care? You are a vampire! You should be able to go where you like! You can rip a human's throat out, but their doorway is going to stop you?? But... when you're invading someone's property, and you can't find a reason to say you're welcome, you feel [i]guilty[/i]. And you try to snap out of it by telling yourself 'well, you don't feel guilty about stealing people's blood.' And then you start to feel guilty about the blood... Better not to think about it. Better to be welcome, and walk with your head held high, than to be ashamed...)[choose another response]"
int_weak_holy	"(You hate displays of religion. Can't stand to look at any. Superstitious nonsense. Every other vampire says so too.[paragraph break]But... if pressed, maybe, [italic type]maybe[roman type] you'd have to admit that what you're doing vis-a-vis the whole killing and subjugating humans thing is perhaps not [italic type]fully[roman type] condoned in most of the major religions[note weakness-religion], and [italic type]maybe[roman type] you'd concede that your karmic balance or your charitable-act-to-sin ratio or whatever metric of goodness any religion uses is not [italic type]completely[roman type] in your favour, and holy symbols are perhaps a reminder of how [italic type]possibly[roman type] your actions have hurt other people... It's not worth dwelling on. Change the subject and move on.)[choose another response]"
int_weak_running	"(You don't know why you can't cross running water, but you can't. It's like trying to lick your elbow. It's baffling, and it makes you furious. People don't know how good they have it with their precious bridges.)[note weakness-running-water][choose another response]"
int_weak_perfect	"'Yes, everyone says that.' The interviewer has a wry little smile as she checks her notes one more time.[p]'Well, I don't see any cause for concern here. Welcome abroad, Oren!' She shakes your hand. 'Can you start today?'"


To say choose another response:
	say "[p][one of]You choke back the answer, and consider your other options[or]You guess she won't like that answer, and think again[or]Better not admit to that in a job interview. Better think again[at random].[no line break]"
	
[*IDEA: this gets repetitive - needs more variations]
	
After quipping when the current quip is int_job_intern:
	disable the int_job_espionage quip;
	disable the int_job_revenge quip;
	disable the int_job_control quip;
	enable the int_prev_investment quip;
	enable the int_prev_employees quip;
	enable the int_prev_pitchfork quip;
	enable the int_prev_thrive quip.
	
After quipping when the current quip is int_prev_thrive:
	disable the int_prev_investment quip;
	disable the int_prev_employees quip;
	disable the int_prev_pitchfork quip;
	enable the int_weak_sunlight quip;
	enable the int_weak_stake quip;
	enable the int_weak_threshold quip;
	enable the int_weak_holy quip;
	enable the int_weak_running quip;
	enable the int_weak_perfect quip.
	
[The following code ends the interview, ends the Interview scene and begins the Employed scene]
Employed-flag is a truth state that varies. Employed-flag is false.
After quipping when the current quip is int_weak_perfect:
	terminate the conversation;
	now employed-flag is true.
	

	
Chapter - ID Card

The ID card is in Backstage.
[ID Card moves to player's possession after the Interview scene]

The ID card is wearable.
The ID card is Nero-owned.

Description of the ID card is "A plastic keycard on a lanyard[if the player is wearing the ID Card], currently dangling about your neck[end if][note id-card]."

Understand "key/keycard" and "lanyard" as the ID card.

Check swinging the ID card:
	say "You swing the card around on its lanyard. Not a useful thing to do, but it's fun." instead.


Chapter - Old Computer

The old computer is a computer. The old computer is in Backstage.
The old computer is fixed in place.
[Moves to Office after employment]

Understand "desk" as the old computer.

Initial appearance of the old computer is "[one of]There's an unused miserable-looking computer here which is, apparently, yours. Lovely[or]Your work computer is waiting for you here[stopping]."

Description of the old computer is "On a rickety desk near you is a yellowing tower computer running an operating system from 10 years ago[note old-computer]."

Instead of computer-using the old computer during Fight:
	say "You're not going to do [i]any[/i] work for a boss who's trying to kill you."

Report switching on the old computer:
	say "The computer's cooling fan screams like a hurricane in a cave, and the machine fitfully wakes up." instead.
	
Check fixing the old computer:
	say "It's certainly decrepit, but it isn't actually broken." instead.
	
Check taking the old computer:
	say "You don't feel like lugging the computer around when it's already plugged in here. Anyway, it looks like it would crumple like a house of cards if you tried to move it." instead.
	
Check squeezing the old computer:
	say "It would fold up like a concertina if you tried it, and you [if Endgame is happening]can probably sell it to some jerk later[otherwise]probably shouldn't destroy the electronics while you're still undercover[end if]." instead.
	
Section - Operating the old computer

Carry out computer-using the old computer:
	try talking to the old computer's operating system.
	
The greeting of the old computer's operating system is os1_greeting. The litany of the old computer's operating system is the Table of the Old Computer OS.

Table of the Old Computer OS
prompt	response	enabled
"Check your email"	os1_email	1
"Subject: Password Security"	os1_email_security	0
"Subject: MAKE FREE MONEY NOW!!!"	os1_email_scam	0
"Quit looking at email"	os1_email_back	0
"Do the customer service work you were just hired to do"	os1_work	1
"Got any games on this thing?"	os1_games	1
"Stop using the computer"	os1_goodbye	1

Table of Quip Texts (continued)
quip	quiptext
os1_greeting	"The computer makes noises like it's preparing for take-off, but it seems to work fine."
os1_email	"You check your corporate email inbox."
os1_email_security	"Sent just this morning to the whole company, from someone you suppose to be the head of IT:[paragraph break]'Please be advised that, in light of recent security breaches, we will be updating the requirements for account passwords.[paragraph break]'Currently, all passwords must be at least seven characters long. Soon, we will also require all passwords to include at least one numerical character. No user password currently includes a number; you are advised that this leaves your account more vulnerable to hacking attempts.[paragraph break]'You will be asked to change your password in the coming weeks, We apologise for the inconvenience after you all updated your passwords recently already.'[paragraph break]Hmm, maybe they're having security breaches because their IT guy is dropping hints about everyone's password to the whole company."
os1_email_scam	"Oh! Free money? For cryptocurrency mining? What a steal! You will have to circle back to this as soon as you've finished sabotaging Lunarcel from the inside[note os1-email-scam]."
os1_email_back	"Enough email for now."
os1_work	"Hah. No."
os1_games	"Just one or two solitaire games, it looks like. You ignore them. You hate things you can't win."
os1_goodbye	"You step away from the computer."

After quipping when the current quip is os1_email:
	disable the os1_email quip;
	disable the os1_work quip;
	disable the os1_games quip;
	disable the os1_goodbye quip;
	enable the os1_email_security quip;
	enable the os1_email_scam quip;
	enable the os1_email_back quip.
	
Saw-security-email-flag is a truth state that varies. Saw-security-email-flag is false.
After quipping when the current quip is os1_email_security:
	enable the os1_email_security quip;
	now saw-security-email-flag is true.
	
Saw-scam-email-flag is a truth state that varies. Saw-scam-email-flag is false.
After quipping when the current quip is os1_email_scam:
	enable the os1_email_scam quip;
	now saw-scam-email-flag is true.

After quipping when the current quip is os1_email_back:
	disable the os1_email_security quip;
	disable the os1_email_scam quip;
	disable the os1_email_back quip;
	enable the os1_email quip;
	if work-quip-seen-flag is false:
		enable the os1_work quip;
	enable the os1_games quip;
	enable the os1_goodbye quip.
	
Work-quip-seen-flag is a truth state that varies. Work-quip-seen-flag is false.
After quipping when the current quip is os1_work:
	now work-quip-seen-flag is true.
	
After quipping when the current quip is os1_games:
	enable the os1_games quip.
	
After quipping when the current quip is os1_goodbye:
	enable the os1_goodbye quip;
	terminate the conversation.


[Part - InterviewRoom

InterviewRoom is a room. Printed name of InterviewRoom is "Interview Room".
InterviewRoom is west of Office.

Description of InterviewRoom is "This side room is probably meant for meetings and committees, but today it's just two chairs facing each other across a round table."]

Chapter - List of passwords

The list of passwords is in Office.

Initial appearance of the list of passwords is "A list of common passwords has been flimsily stuck up on the wall nearby."

Understand "printout/article" as the list of passwords.

Report taking the list of passwords for the first time:
	say "You peel [the noun] off the wall." instead.

Section - Description of the list of passwords

Description of the list of passwords is "This looks like a printout of some techie website article:

'[b]THIS YEAR'S MOST COMMON PASSWORDS[/b][l]Cybersecurity begins with a strong password, yet many people use simple and easily-guessed passwords. This is a list of the 12 most commonly used passwords of the past year, as revealed by security leaks and database breaches. 

[password listing]

If you use one of these passwords, you may be at risk of other people accessing your personal information![note password-puzzle]'"

[To say password listing:
	repeat through Table of Common Passwords:
		say "[number of the current table row][password entry][line break]".]
		
To say password listing:
	repeat with N running from 1 to the number of rows in Table of Common Passwords:
		choose row N in Table of Common Passwords;
		say "* [password entry][if N is not the number of rows in Table of Common Passwords][line break][end if]".
		
Table of Common Passwords
password
"12345678"
"admin"
"dragon"
"holiness"
"letmein"
"monkey"
"password"
"q1w2e3r4"
"qwerty"
"sunshine"
"shadow"
"trustn01"
		

Chapter - Workers (scenery)

The officeWorkers are in Office.
The officeWorkers are scenery.
The officeWorkers are a person.

Printed name of the officeWorkers is "workers".
The officeWorkers are plural-named.

Understand "worker/workers" and "labour/labourer/labourers" and "white/collar/whitecollar/white-collar" and "person/people/man/men/woman/women" and "bent/back/backs" and "desk jockey/desk jockeys" as the officeWorkers.

Understand "computer/computers" as the officeWorkers when Interview has not happened.

Description of the officeWorkers is "A load of desk jockeys all hunched over computers. They all look the same to you, frankly[if Fight is happening]. They're focusing extra-hard right now, trying to avoid their rampaging CEO's gaze[end if]."

Before talking to the officeWorkers:
	if Fight is happening:
		say "They all mumble non-committally as Hadrian looms over you. Cowards!" instead;
	otherwise if Endgame is happening:
		say "They all seem a little concerned that Hadrian is still lurking in the meeting room. You try to explain to a worker that you murdered Hadrian, but this doesn't seem to set them at ease!" instead;
	otherwise:
		say "You make excessively small talk with some random worker about [one of]the weather[or]the news[or]some sports team[or]some television show[at random], and it bores you to tears." instead.
	
Check biting the officeWorkers:
	if Fight is happening:
		say "'Those are [italic type]mine![roman type]' yells Hadrian. None of the workers dare react to that remark." instead;
	otherwise if Endgame is happening:
		now the officeWorkers are in Backstage;
		say "Oh, what the hell. You lunge! Workers vault over desks and send electronics flying to escape you. You manage to connect with your teeth a few times, but they're just glancing blows, really, just a snack. When the chaos is over, the office is empty." instead.
		
Check pushing the officeWorkers:
	say "[can't push multiple people]." instead.
Check pulling the officeWorkers:
	say "[can't push multiple people]." instead.
	

Part - PrayerRoom

PrayerRoom is a room. Printed name of PrayerRoom is "Interview Room".
PrayerRoom is north of Office.

[Description of PrayerRoom is "[if unvisited]You already don't like this room, even before you realise what it is. [end if]This is a makeshift multifaith space for religious employees, as hinted by the prayer mat laid on the floor. [if the cupboard is open]Awful holy symbols once hidden by a cupboard assail your eyes, and you long to escape through[else]You don't see any outright holy symbols, thank goodness, but you don't like the look of that cupboard on the wall. You keep an eye on[end if] the way out to the south."]


Description of PrayerRoom is "[PrayerRoomDesc].".

To say PrayerRoomDesc:
	if PrayerRoom is unvisited:
		say "Now that you're in there, you see that what you thought was a conference room is really just a converted stationery closet with two chairs, a table and a cupboard. There's barely room for one person here; with both you and the manager in here, it's dangerously crowded";
	otherwise if cupboard-opened-yet-flag is false:
		say "A pokey little room currently set up as an interview room. Two chairs and a table take up most of the room; the rest of it is occupied by a cupboard";
	otherwise:
		say "A mean little room for faiths of all kinds to indulge themselves. All the religious stuff is shoved up inside a cupboard, which is [if the cupboard is closed]closed[otherwise]mercilessly hanging open and exposing its contents[end if]. Currently, it's set up as an interview room with two chairs and a table[if Hadrian is in PrayerRoom][PrayerRoomHadrianDetails][end if][note prayer-room]"
		
To say PrayerRoomHadrianDetails:
	if Hadrian is not staked:
		say " - it's a tight squeeze with both you and an enraged superstrong vampire trying to kill you";
	otherwise:
		say ", coated liberally with specks of Hadrian".

[Chapter - Prayer mat (Scenery)

The prayer mat is in PrayerRoom.
The prayer mat is scenery.

[*TODO: I need to rethink this room. Should cupboard actually be a cupboard (more natural, doesn't embed faith into structure of room)? Should get rid of prayer mat, since it makes one particular failth too obvious in room - but then, how do I let Nero and the player know this is a prayer room?]
]

Chapter - meetingFurniture (Scenery)

The meetingFurniture is in the PrayerRoom. Printed name of the meetingFurniture is "furniture".

The meetingFurniture is scenery.

Understand "table" and "chair/chairs" and "furniture/furnishing/furnishings" as the meetingFurniture.

Description of the meetingFurniture is "A rickety table and two hard plastic chairs. They look like hand-me-downs from a school[if cupboard-opened-yet-flag is false]. The cupboard looks more interesting[end if].".

Instead of pushing the meetingFurniture:
	say "There's not much room to push things around in here. You don't feel like solving the Klotski puzzle of getting all the furniture out of the way. You can still move around it."
	
Instead of attacking the meetingFurniture:
	say "It's surprisingly sturdy for how tacky it feels[if Fight is happening]. You can't break it down, but maybe you have something else you can use as a weapon[end if]."
	
Instead of entering the meetingFurniture:
	say "That furniture was pretty uncomfortable the first time[if Fight is happening]. It'll be more uncomfortable with Hadrian trying to kill you while you're using it[end if]."
[it's impossible to sit on the furniture anyway because it's not a supporter. You're not actually sitting in the Interview scene, but since you can't do anything other than look and talk, this fact isn't explicitly exposed. Unless there's some way to break out of QBC that I don't know?]


Chapter - Cupboard (Scenery, container)

The cupboard is in PrayerRoom.
The cupboard is scenery.

The cupboard is an opaque openable closed container.

Understand "metal" and "closet/cabinet" and "sign" as the cupboard.

Description of the cupboard is "A sizable metal cupboard occupies one corner[note cupboard-curtain]. There's a sign taped to it: 'KEEP CLOSED.'[if cupboard is open][paragraph break]The cupboard hangs open. It is full of holy symbols![end if]"

The examine containers rule does nothing when examining the cupboard.

Check inserting something into the cupboard:
	if the cupboard is open:
		say "You can't bring yourself to go near the religious symbols!" instead.
		
Check searching the cupboard:
	if the cupboard is open:
		say "Yep, it's still full of holy symbols. You're not going to look any further." instead;
	otherwise:
		say "Nothing around the outside of the cupboard. [if cupboard-opened-yet-flag is false]You'll need to open the cupboard to see what's inside[otherwise]You already know what's lurking inside, of course[end if]." instead.


[Section - Draw (new action applying solely to the cupboard as a synonym for open)

Drawing is an action applying to one visible thing.
Understand "draw [something]" as drawing.

Check drawing:
	if the noun is not the cupboard, say "You don't have a pen." instead.
	
Carry out drawing:
	if the noun is closed:
		try opening the noun;
	otherwise:
		try closing the noun.]


Section - Holy symbols (fixed-in-place in cupboard)

The holy symbols are in the cupboard. 
The holy symbols are fixed in place.

The holy symbols are plural-named.

Description of the holy symbols is "Icons and paraphernalia of every religious denomination you can think of are here! Stars, crosses, crescents, prayer mats, wheels, shrines, calligraphies - dreadful[note holy-symbols][first time].[paragraph break]It's not that you believe in any of these, or anything. Of course not! But, argh. It's the guilt that gets you, and every other vampire. It's the reminder that you've... done things that most religions would condemn you for, hurt people, stolen lives. And you're fine with that! As long as you don't think about it. But right now you can't stop thinking about it.[paragraph break]Plus, there's the bad memories of Europe. How all the oh-so-pious vampire hunters would chase you down with their holy symbols, and sometimes club you into unconsciousness with them. And you know for a [italic type]fact[roman type] that some of those hunters were up to no good themselves, oh they were [italic type]definitely[roman type] not getting a good afterlife. But even so...[paragraph break]You can't look any more. You avert your eyes[only]."

Instead of doing anything other than examining to the holy symbols:
	say "Don't [i]touch[/i] them!!"


Section - Synonyms for holy symbols (and cupboard)

Understand "religious/religion" and "symbol" and "icon/icons/iconography" and "paraphernalia/equipment" and "cross/crosses" and "star/stars" and "crescent/crescents/moon/moons" and "prayer mat/mats" and "prayer" and "mat/mats" and "wheel/wheels/dharma/chakra/dharmachakra" and "shrine/shrines" and "calligraphy/calligraphies" as "[symbol synonyms]".

Understand "[symbol synonyms]" as the holy symbols.

[the following allows the player to refer to the cupboard as the symbols when it is closed. this allows "show prayer to hadrian" or similar in the final fight]

Understand "[symbol synonyms]" and "holy" and "symbols" and "holy symbol/symbols" as the cupboard when cupboard-opened-yet-flag is true and the cupboard is closed.
[this flag is defined below with the report rules for opening the cupboard for the first time]

Before showing the cupboard to:
	try opening the cupboard instead.

	
Section - Registering Holy-exposure (and closing cupboard as needed)

Carry out opening the cupboard:
	now the cupboard is open;
	let V be the list of vampires in PrayerRoom;
	repeat with item running through V:
		[say "(debug note: [item] is now holy-exposed).";]
		now item is holy-exposed.
	[if cupboard-opened-yet-flag is false:
		now the box is in PrayerRoom;
		now cupboard-opened-yet-flag is true.]
	
Carry out closing the cupboard:
	now the cupboard is closed;
	let V be the list of vampires in PrayerRoom;
	repeat with item running through V:
		[say "(debug note: [item] is now holy-safe).";]
		now item is holy-safe.
		
Check going south from PrayerRoom:
	if the cupboard is open:
		now the cupboard is closed;
		if Fight has ended:
			say "[cupboardclosing]"; [see below]
		otherwise:
			if Hadrian is in PrayerRoom:
				say "You flee to the south. Hadrian slams the cupboard closed behind you.";
			otherwise:
				say "[cupboardclosing]"; [see below]
	let V be the list of vampires in PrayerRoom;
	repeat with item running through V:
		[say "(debug note: [item] is now holy-safe).";]
		now item is holy-safe.
		
To say cupboardclosing:
	say "First, you stagger to the cupboard and shut it again, so you can come back later without any nasty surprises."
		
[Shouldn't need to check entering PrayerRoom while cupboard is open, because this should ensure that cupboard is always closed upon exiting]
[When Hadrian is in the room and the holy symbols are visible, he is holy-exposed like the player. This allows the staking action to take place.]


Section - Report cupboard opening and closing (including Hadrian's reactions)

Cupboard-opened-yet-flag is a truth state that varies. Cupboard-opened-yet-flag is false.
[Controls whether the player character has opened the cupboard for the first time yet. Set in the report stage of opening the cupboard (in the "cupboard reveal" token). This is used in place of something like "carry out opening the cupboard for the first time" because the "for the first time" condition in Inform 7 fires when you first try the action even if the action is stopped. As beta tester AKheon discovered, when I used the "for the first time" rule in the game's beta version, trying to open the cupboard during the interview would trip the first time condition but prevent all of its effects, meaning that the raisin box would never appear.]

Carry out opening the cupboard:
	if cupboard-opened-yet-flag is false:
		now the printed name of PrayerRoom is "Prayer Room";
		now the box is in PrayerRoom;
		enable the man_prayerroom quip for the manager.

Report opening the cupboard:
	if cupboard-opened-yet-flag is false:
		say "[cupboard reveal]." instead;
	otherwise:
		say "You open the cupboard carefully. The holy symbols burrow into your mind again." instead.
	
Report closing the cupboard:
	say "You close the cupboard with relief. Thank God. Better yet, don't[note cupboard-thank-god]." instead.
	
To say cupboard reveal:
	now cupboard-opened-yet-flag is true;
	say "You open the cupboard, revealing [italic type]WAAAUUGH-[roman type][paragraph break]You slam the cupboard shut. You open the cupboard again, gingerly.[paragraph break]Holy symbols! [italic type]Dozens[roman type] of them! Of every denomination you can think of! This is no innocent meeting room. It's a multifaith prayer room![paragraph break]The symbols are already getting to you. You look away, and notice a little box on the floor. It must have fallen out of the cupboard[note opening-cupboard]".

Report opening the cupboard during Fight:
	say "[one of]You open the cupboard. You're ready for it this time, but it's no less distressing to you.[paragraph break]Hadrian isn't ready for it. He screeches and recoils from the religious symbols as if burned. '[italic type]WHAT THE HELL ARE THOSE DOING IN THERE???[roman type]' he cries[or]'No, not again-' begins Hadrian, but too late, you're already flinging the cupboard open! He cries out again and backs away[stopping]." instead.
	
Report closing the cupboard during Fight:
	say "You close the cupboard. Hadrian sighs with relief and collects himself. [first time]'When I'm done with you, I'll kill everyone in this office for that,' he growls. [only]Then he goes back to swinging at you." instead.

The report holy exposure rule does nothing when opening the cupboard.



Chapter - Raisin box

The box is in Backstage.
[moved to PrayerRoom by opening the cupboard - see carry out opening the cupboard]

The box is an opaque openable open container.

Initial appearance of the box is "A small empty raisin box is lying on the floor, having been dislodged from the cupboard.[note box-initial]"

Description of the box is "About the size of a matchbox[note x-box]. There's some writing on it: 'Seedless RAISINS. Ingredients: 100% dried seedless grapes; additives.'[if the box is not handled] Oh great, now there's a raisin religion??[end if]"

Understand "small" and "raisin/raisins" as the box.

Check squeezing the box:
	say "Crushing the box would be hard to reverse. Perhaps you can use it for some other scheme." instead.
	
Section - Biting the box

[This section responses to "eat raisins" for the raisin box, which gave a misleading message in earlier versions implying that there were raisins in the box]
	
Check biting the box:
	if the box contains the grapes:
		say "You've had your fill of grape products today." instead;
	otherwise:
		say "The box is devoid of raisins!" instead.
		
[These sentences disambiguate "raisins" in an eat/bite/etc command to mean the grapes, not the box. I have to do this in four sentences because I coded the game to redirect eat, drink, and taste to bite, when what I SHOULD have done is "understand eat/drink/etc as something new" and then hook the unmoored verbs up to bite. Oh well]
Does the player mean biting the box: it is unlikely.
Does the player mean eating the box: it is unlikely.
Does the player mean drinking the box: it is unlikely.
Does the player mean tasting the box: it is unlikely.

Section - Putting grapes into box, rejecting other objects

Check inserting something into the box:
	if the noun is not the bunch of grapes:
		if the noun is the ID card:
			say "[The noun] is a little too big to wedge inside the box. No need to put that in there, anyway." instead;
		otherwise if the noun is the list of passwords:
			say "[The noun] won't fold up quite small enough to fit in the box." instead;
		otherwise:
			say "The box isn't big enough to hold [the noun]." instead;
	otherwise:
		if the bunch of grapes is moist:
			say "You try, but the grapes are just too plump and juicy to fit in the little raisin box." instead.

Report inserting the bunch of grapes into the box:
	say "You file the raisins neatly into the raisin box." instead.
	
Section - Printing the name of the box, suppressing details in inventory

Printed name of the box is "[box fullness]raisin box".

To say box fullness:
	unless the box contains the grapes:
		say "empty ".
		
Rule for printing the name of the box while taking inventory:
	if the box contains the grapes, say "box full of raisins";
	otherwise say "empty raisin box";
	omit contents in listing.
	


Book - Headquarters

Part - Lobby

Lobby is a room. Printed name of Lobby is "Lobby".
Lobby is north of CampusCentral.[ Lobby is inside from CampusCentral.]

Description of Lobby is "This is the pleasantly airy and open lobby of the building where all the executives keep their offices. A corridor leads visitors and executives north. The main campus is to the south."

Instead of going outside in Lobby:
	try going south.
	
Instead of exiting in Lobby:
	try going south.

Chapter - Grapes

The bunch of grapes is in Lobby.
Printed name of the bunch of grapes is "[if dry]dessicated [end if]grapes".

Understand "grape" and "fruit" as the bunch of grapes.

[*PLURAL]
The bunch of grapes is plural-named.

Description of the bunch of grapes is "[if moist]Juicy seedless purple grapes[else]Dry, shrivelled, sweet purple grapes[end if]."

Section - The grapes can be bitten and dried

The bunch of grapes is biteable.
The bunch of grapes is edible.

Understand "raisin" and "raisins" and "dried" as the bunch of grapes when the bunch of grapes is dry.

Report biting the bunch of grapes:
	if biting-success is true:
		say "You pierce the flesh of one grape and drink deep. Then you pierce the flesh of another grape and drink deep. Then another, then another... It takes a while, but eventually all the grapes are shrivelled and dry. You pick them off the stem and throw the stem away[note bite-grapes]." instead;
	otherwise:
		say "The grapes have no more juice to give." instead;

[Check eating the bunch of grapes:
	if the bunch of grapes is moist:
		say "You do not drink... [italic type]wine[roman type]. You don't even eat anything close to... [italic type]wine[roman type]." instead;
	otherwise:
		say "You don't care for dried fruit. It sticks in your fangs." instead.]
		
Section - Acknowledging alternatives and giving hints

Before inserting the bunch of grapes into the sun:
	if the bunch of grapes is moist:
		say "Sun-drying the bunch of grapes is a good idea, but you don't have that kind of time. There must be some quick way to get all the moisture out of the grapes." instead;
	otherwise:
		say "The grapes are already pretty dry." instead.		
		
Check squeezing the bunch of grapes:
	if the bunch of grapes is moist:
		say "Squeezing the juice out of the grapes is a good idea, but it would also squash the grapes. There must be a neater way of dessicating the grapes." instead;
	otherwise:
		say "You can squeeze no more out of them." instead.
		
Chapter - Receptionist

The receptionist is a man in Lobby.

The receptionist can be cowed. The receptionist is not cowed.
[If you bring Hadrian into the lobby during the fight scene, the receptionist becomes cowed (i.e. scared of Hadrian killing him for not working). (See the "Hadrian cows the receptionist" section.) The cowed property influences the receptionist's post-game conversation and his description and initial appearance]

The receptionist can be awake or unconscious. The receptionist is awake.
[You are able to bite the receptionist during Endgame (since there is no need for Nero to be subtle anymore and he is free to be an asshole to everone else). This state helps to track that and redirect actions as appropriate.]

Initial appearance of the receptionist is "[ReceptionistIA][note x-receptionist]."

To say ReceptionistIA:
	if the receptionist is unconscious:
		say "The receptionist is lying in a heap on the floor";
	otherwise:
		if the receptionist is not cowed:
			say "There's a receptionist here, hunched over a computer and looking very bored";
		otherwise:
			if Endgame is happening:
				say "There's a receptionist here, sitting up straight and looking very shaken";
			otherwise:
				say "A receptionist is here, trying very hard to pretend his boss isn't on a rampage close by".

Description of the receptionist is "[ReceptionistDesc]."

To say ReceptionistDesc:
	if the receptionist is unconscious:
		say "Gosh, he looks pale. Good thing he's getting some rest";
	otherwise:
		if the receptionist is not cowed:
			say "Receptionists and every other customer service role, you feel, should be bright-eyed and bushy-tailed, always ready with a friendly smile and a proactive attitude. This receptionist clearly doesn't share your opinion. He's not even standing up";
		otherwise:
			if Endgame is happening:
				say "He looks traumatised";
			otherwise:
				say "The receptionist is focusing intently on his work, as if nothing is wrong and he's just happy to be there. He seems to flinch whenever Hadrian moves suddenly".

Understand "man" and "secretary" and "worker" as the receptionist.

Section - Talking to the Receptionist

The greeting of the receptionist is rec_greeting. The litany of the receptionist is the Table of Receptionist Conversation.

Table of Receptionist Conversation
prompt	response	enabled
"Hey, I'm new here."	rec_new	1
"Is this... not a good place to work?"	rec_new_work	0
"Are you thinking of quitting?"	rec_new_work_quit	0
"I'd like to see Mr. Alba. Is he in?"	rec_hade	1
"Where is Mr. Alba right now?"	rec_hade_where	0
"[ask receptionist for lab access]?"	rec_hade_where_access	0
"Can I get an executive to change my card to let me into the laboratory?"	rec_hade_where_access_exec	0
"Are you really allowed to just let anyone go to the boss's office?"	rec_hade_office	0
"I'm trying to guess Mr. Alba's password. Any idea what it is?"	rec_password	0
"[ask receptionist for fruit]?"	rec_fruit	1
"Goodbye."	rec_goodbye	1

To say ask receptionist for lab access:
	if card-denied-flag is true:
		say "I can't get into the laboratory with my ID card. Can I get someone to authorise my card";
	otherwise:
		say "So who can authorise me to get into the laboratory".
		
To say ask receptionist for fruit:
	if the bunch of grapes is handled:
		say "You don't mind me taking that fruit, right";
	otherwise:
		say "Can I have some of that fruit".

Table of Quip Texts (continued)
quip	quiptext
rec_greeting	"He glances up from whatever he's doing. '[one of]Hi, how can I help you[or]Hi again[stopping],' he mutters."
rec_new	"'Sorry to hear that,' he mumbles automatically."
rec_new_work	"'It's... it's fine. The people are good, but the bosses are-' The receptionist glances around, and sees no bosses listening in. He leans a little closer. 'It's miserable. You've been hired for the customer service department, right? Have they told you you're not allowed bathroom breaks yet? They fired the guys trying to unionise, and most people just quit after the first few months, with all the long shifts. They stopped checking references because they're just trying to hire people quicker than they can quit. I'm lucky, I get to sit down and just deal with the important visitors, but I had some friends in customer service, being yelled at twelve hours a day because somebody else screwed up. Just... bad.' He leans back again."
rec_new_work_quit	"The receptionist gives you a wan little smile. 'Can't. I need the job. I can't afford... I'm not... doing well-' He looks down abruptly and rubs his eyes for a few seconds.[paragraph break](You remember touring the factory floor once and seeing a worker in tears, and all the other workers clustered around her. You dealt with her. You don't remember what it was about.[note rec-new-work-quit])[paragraph break]He looks up again. 'I need the money. I'm just lucky to have a job. Even if it's this one. Sorry. Thanks for listening.'"
rec_hade	"'He's not in right now. Just wait for him in his office if you want. It's just down the hall that way.' He waves vaguely northward."
rec_hade_where	"'He's doing something in the lab. Uh, the laboratory, on the east bit of the campus. Where they do the prototypes, and... uh, things. I'd say just go over there and find him, but you need authorisation to get in, and I can't do that for you myself.' He shrugs sympathetically. 'Sorry, dude.'"
rec_hade_where_access	"'The security guys can. Let me check.' The receptionist dials a number on his phone and murmurs a conversation for a minute or two. He hangs up. 'No luck, sorry. They say they're not changing any of the lab's security permissions at this time. I think they've locked things down with the Moonlite, to stop anyone getting in who shouldn't be there.' Damn Hadrian, always a step ahead.[paragraph break]'I think all the executives get to change the cards as well,' the receptionist adds. 'So they can show guests around.'"
rec_hade_where_access_exec	"'You can ask, but they probably won't do it.' The secretary shrugs. 'Maybe one of them left themselves logged in. Just borrow their computer and do it yourself. I know Mr. Alba is out. His office is up that way.' He waves a lethargic arm northwards. This receptionist has a terrible attitude towards security."
rec_hade_office	"'Probably not.' You wait for more, but he seems to be done."
rec_password	"'I don't know his password. Sorry. Let me think.' The secretary pinches the bridge of his nose. 'I know he forgets his password a lot. I can hear him shouting at his computer for keeping him out from all the way out here. But he usually stops pretty quickly. I guess he remembers after he's shouted a bit. Sorry, that's all I can tell you.'"
rec_fruit	"'Yeah, sure, it's there for anyone. Help yourself.'"
rec_goodbye	"'Oh. Bye.'"

After quipping when the current quip is rec_new:
	enable the rec_new_work quip.
	
After quipping when the current quip is rec_new_work:
	enable the rec_new_work_quit quip.

After quipping when the current quip is rec_hade:
	enable the rec_hade_where quip.
	
After quipping when the current quip is rec_hade_where:
	if rec_hade_where_access-quipped-flag is false:
		enable the rec_hade_where_access quip.
	
Rec_hade_where_access-quipped-flag is a truth state that varies. Rec_hade_where_access-quipped-flag is false.
After quipping when the current quip is rec_hade_where_access:
	enable the rec_hade_where_access_exec quip;
	now rec_hade_where_access-quipped-flag is true.
	
After quipping when the current quip is rec_hade_where_access_exec:
	enable the rec_hade_where_access_exec quip.
	
After quipping when the current quip is rec_password:
	enable the rec_password quip.
	
[Flag below exists so that, if player avoids talking to receptionist until endgame (for whatever reason), the endgame conversation makes more contextual sense]
Rec-talked-to-flag is a truth state that varies. Rec-talked-to-flag is false.
After quipping when the current quip is rec_goodbye:
	enable the rec_goodbye quip;
	disable the rec_hade_office quip;
	now rec-talked-to-flag is true;
	terminate the conversation.
	
Section - The receptionist can't be talked to during Fight

Instead of talking to the receptionist during Fight:
	say "'SORRY, I'M VERY BUSY, I DON'T HAVE TIME TO CHAT.' The receptionist glances nervously at Hadrian, who is trying to skewer you on a signpost as you talk."

Section - Talking to the Receptionist during Endgame

To set up the endgame receptionist conversation:
	now the litany of the receptionist is the Table of Endgame Receptionist Conversation;
	if the receptionist is not cowed:
		now the greeting of the receptionist is rec_greeting2;
	otherwise:
		now the greeting of the receptionist is rec_greeting3.

Table of Endgame Receptionist Conversation
prompt	response	enabled
"Hadrian just tried to kill me."	rec_hade2	1
"I just killed Hadrian."	rec_hade3	1
"So the Moonlite is a machine for making vampires superpowered."	rec_moonlite	1
"What do you think I should do about the Moonlite?"	rec_moonlite_choice	0
"See you around."	rec_goodbye2	1

Table of Quip Texts (continued)
quip	quiptext
rec_greeting2	"'[one of]Hi. Is there something going on outside? I heard a lot of noise out there a second ago[or]Hi again[stopping][note rec-post-fight].'"
rec_greeting3	"'[one of]G-good grief, are you okay? Are you hurt? What happened back there[or]H-hi again. Is there anything I can do to help[stopping][note rec-post-fight]?'"
rec_hade2	"'[if the receptionist is not cowed]Oh.' The receptionist reflects for a moment. 'Yeah, he probably would. He's an awful guy. S-sorry that happened to you. Hope you're okay.[otherwise]Yeah, I saw! Are you alright? He didn't hurt you, did he? I'm glad you're okay![end if]'"
rec_hade3	"'[if the receptionist is not cowed]Wh- You killed him? Seriously?' He stares at the wall for a while. You wait for him to compose himself. At length, he says 'Wait, vampires can come back to life, right? Better not go home yet[otherwise]You did? Thank you. No, sorry, I shouldn't say that, but... I don't- I don't know what was happening back there exactly, but I've never seen him like that. I don't think he would've been kind to any of us. Sorry[end if].'"
rec_moonlite	"[if the receptionist is not cowed]'Sorry? Are you serious? That's... actually, that makes some sense, I guess. I don't know. That's... that's no good.' You get the sense that the receptionist lost the energy to be angry a long time ago.[otherwise]'Really? Is that what was happening with Mr Alba just then? That's... scary.'[end if]"
rec_moonlite_choice	"[if the receptionist is not cowed]The receptionist thinks. 'Well, if it [i]can[/i] be used as, er, an energy reactor or whatever it is, then maybe it's good, but... that's not what Mr Alba's going to use it for, right? If it [i]is[/i] a vampire machine or whatever you said. Can you do anything about that? Like, break it or something?'[otherwise]'B-break it,' the receptionist responds quickly. 'Ruin it. If it's going to be used for, for trying to kill us. It shouldn't be around.'[end if]"
rec_goodbye2	"'See you.[if the receptionist is cowed] Take care, okay?[end if]'"

After quipping when the current quip is rec_moonlite:
	enable the rec_moonlite_choice quip.
	
After quipping when the current quip is rec_moonlite_choice:
	enable the rec_moonlite_choice quip.
	
After quipping when the current quip is rec_goodbye2:
	enable the rec_goodbye2 quip;
	terminate the conversation.
	
Section - You can bite the receptionist during Endgame (which knocks him unconscious)

Instead of biting the receptionist during Fight:
	say "Seems like a bad time to stop for a snack!"

Instead of biting the receptionist during Endgame:
	if the receptionist is awake:
		say "Oh, you can't restrain yourself any longer. No need to sneak around anymore. You grab the guy by the throat and drink deep. He hits the floor like a sack of potatoes.";
		now the receptionist is unconscious;
	otherwise:
		say "Just trash now - not a drop left."
		
Instead of talking to the receptionist when the receptionist is unconscious:
	say "He won't be talking to anyone for a while."
	
Check waking the unconscious receptionist:
	say "Wakey wakey! Nope, he's gone." instead.
	
Check turning the unconscious receptionist:
	unless the player's command includes "turn":
		say "You carefully roll the receptionist over to [one of]clear[or]block[cycling] his airways." instead.
	
Chapter - Mid-range computer

The mid-range computer is a computer in Lobby. Printed name of the mid-range computer is "computer".

The mid-range computer is scenery.

Description of the mid-range computer is "Hey, how come this guy gets a computer made this millennium, and you're stuck with one from caveman times? No fair! Not that you care[note x-mid-range-computer].".

Check computer-using the mid-range computer:
	if the receptionist is awake:
		if Fight is happening:
			say "You can't use the computer - the receptionist is glued to it, pretending to work. Also, there is a vampire trying to gore you." instead;
		otherwise:
			say "You try to commandeer the receptionist's computer, but he just stammers and says 'um, um' over and over until you stop. Well, there are other computers you can use if you need to." instead.
	[otherwise:
		say "Oh... he wasn't doing any work. He's just got twelve webpages open to different social media accounts which post dog pictures. You snoop a little more, but there's nothing interesting in his emails or anything." instead.]
		
Carry out computer-using the mid-range computer:
	say "Oh... he wasn't doing any work. He's just got twelve webpages open to different social media accounts which post dog pictures. [one of]You snoop a little more, but there's nothing interesting in his emails or anything[or]There's a cute dog here with dark fur and a white chest, but the caption is 'hecking doggo'. If you were the receptionist's boss, you'd fire him for that alone[note hecking-doggo][stopping]." instead.
		
Check switching off the mid-range computer:
	if the receptionist is awake:
		say "The receptionist quickly covers the button with his hand. '[one of]P-please don't. I'm still using it[or]Stop it, please[stopping].'" instead.
		
Check typing it on when the second noun is the mid-range computer:
	if the receptionist is awake:
		say "You start tapping on the keyboard, but the receptionist mumbles at you, gently bats your hands away and backspaces your typing." instead.
		

Part - InsideHadeOffice

InsideHadeOffice is a room. Printed name of InsideHadeOffice is "Hade's Office".
InsideHadeOffice is north of Lobby.

Description of InsideHadeOffice is "[one of]This is an office?? It[or]Hadrian's office[stopping] looks more like a furniture showroom. It's all expensive tables and chairs and sofas - Hadrian could hold three meetings at once in here. But there are film posters hung up around the room too, like he thinks it makes him look cool."


Chapter - Furniture (scenery)

The furniture is scenery in InsideHadeOffice.

Understand "desk/desks" and "table/tables" and "chair/chairs/sofa/sofas/settee/settees/armchair/armchairs" and "furnishing/furnishings" as the furniture.

Description of the furniture is "Leather and mahogany, everywhere you look. Here's ten chairs arranged around a long table for meetings; over there are deep armchairs and a coffee table for entertainments. It's all very expensive-looking."

Instead of searching the furniture:
	say "You survey the furniture quickly, but there's nothing of interest."
	
Instead of looking under the furniture:
	try searching the furniture.
	
Instead of opening the furniture:
	try searching the furniture.
	
[these instead rules should catch most attempts to search the room, e.g. look under table or open desk]

Instead of entering the furniture:
	say "It all looks pretty cushy, but you shouldn't relax in here. [if Hadrian is in InsideHadeOffice]This is because somebody is trying to kill you[otherwise]Someone might walk in on you[end if]."
	 

Chapter - Film posters (scenery)

The film posters are scenery in InsideHadeOffice.

Understand "film/movie/poster/posters" and "plastic/case/cases" as the film posters.

Description of the film posters is "[if Hadrian is in InsideHadeOffice]'Ah, you're admiring my posters!' says Hadrian, who is trying to throttle you. 'Yeah, I know my films. I'm kind of a sci-fi nerd!' All these films made half a billion dollars or more at the box office[otherwise]Posters for sci-fi films and cartoons, and things nerds like. Does Hadrian actually like these things?? You thought maybe he was pretending to like media to trick people into liking [italic type]him[roman type][end if][note x-film-posters]."

Instead of taking the film posters:
	say "You'd absolutely love to rip all the posters down just to spite Hadrian, but they're all in these plastic cases mounted to the walls, probably to stop people from doing that. Maybe you'll destroy them another day."
	
Instead of attacking the film posters:
	try taking the film posters.



Chapter - Fancy Computer

The fancy computer is a computer in InsideHadeOffice.
The fancy computer is fixed in place.

Initial appearance of the fancy computer is "On one especially luxurious desk sits a fancy computer."

Description of the fancy computer is "An oak or oak-ish desk supports what must be Hadrian's computer. It's one of those really expensive computers they sell to teenagers and nerds. It's black with red accents, and it looks like a spaceship[note x-fancy-computer]."

The fancy computer is protected.

Carry out computer-using the fancy computer:
	try talking to the fancy computer's operating system.
	
Report switching on the fancy computer:
	say "The computer wakes almost before you touch the power button." instead.
	
Instead of computer-using the fancy computer during Fight:
	say "'Get your [i]own[/i] computer!' snarls Hadrian, swatting you away from it."
	
Check taking the fancy computer:
	say "Steal Hadrian's expensive computer and sell it online? An excellent idea, and one you will have to circle back to when you're done with the Moonlite thing." instead.
	
Section - Password protection of the fancy computer (Carry out typing it on)

Carry out typing it on:
	if the second noun is the fancy computer:
		if the topic understood exactly matches the text "letmein":
			now the fancy computer is not protected;
			deactivate the password quips;
			say "The password field disappears! (Hey! That's the same as [italic type]your[roman type] password!) The computer is unlocked and ready for use[note password-solution].";
		otherwise if the topic understood exactly matches the text "xyzzy":
			say "You type '[the topic understood]'. A hollow voice says 'Password invalid.'";
			activate the password quips;
		otherwise:
			say "You type '[the topic understood]'. The computer responds 'Password invalid.' [one of]Hmm, is there anyone who can tell you anything about Hadrian's password?[or]Maybe that receptionist back outside knows something? Maybe he's overheard a few things.[or]Maybe the manager heard Hadrian's password? Maybe she saw him typing it in a staff meeting or something?[or]Doesn't Lunarcel have an IT department? Your businesses were always supposed to have those. Maybe they emailed you something about passwords.[or]There was that article about passwords, from the office. That could give you some pointers.[or]Hell, maybe the custodial staff know Hadrian's password. Hadrian always loves to brag.[or]You're getting tired of reading that.[or]Dumb thing.[or]Computers are so awful. Throw them all away.[or]You repeat back 'pAsSwOrD iNvAlId' in a mocking idiot voice.[or]Aren't these things supposed to lock you out and call the cops if you get the password wrong too many times? You're not complaining, though.[or]You really ought to ask around for any clues to Hadrian's password.[stopping]";
			activate the password quips.

			
[There should, of course, be a general carry out typing it on rule elsewhere, and this should be a rule specific to the fancy computer. But I am not a good Inform 7 programmer, and when I wrote this I just wanted it to work rather than be elegant or extendable, and now I'm too scared of breaking the whole project to try to change it.]
			
Section - If fancy computer is protected when player first tries to use it, enable some password clue quips

Check computer-using the fancy computer for the first time:
	if the fancy computer is protected:
		activate the password quips.
		
Section - Activate / deactivate the password quips
		
To activate the password quips:
	enable the man_password quip for the manager;
	enable the jan_password quip for the janitor;
	enable the rec_password quip for the receptionist.
	
To deactivate the password quips:
	disable the man_password quip for the manager;
	disable the jan_password quip for the janitor;
	disable the rec_password quip for the receptionist.
			
Section - Operating the fancy computer

[Truth states used in operating the conversation table:]

[This one allows player to go anywhere when triggered]
Full-permission-flag is a truth state that varies. Full-permission-flag is false.


The greeting of the fancy computer's operating system is os2_greeting. The litany of the fancy computer's operating system is the Table of the Fancy Computer OS.

Table of the Fancy Computer OS
prompt	response	enabled
"Check Hadrian's emails"	os2_email	1
"Subject: Re: Re: Re: Re: URGENT: Moonlite Efficiency Report"	os2_email_fission	0
"Subject: please change your password, I am BEGGING you"	os2_email_begging	0
"Subject: MAKE FREE MONEY NOW!!!"	os2_email_scam	0
"Subject: Moonlite Update Request"	os2_email_investor	0
"Quit Hadrian's email"	os2_email_back	0
"Edit campus security permissions"	os2_permissions	1
"Browse the permissions list"	os2_permissions_list	0
"Enable full permissions for 'Oren' (you)"	os2_permissions_nero	0
"Disable full permissions for Hadrian (prick)"	os2_permissions_hade	0
"Quit the permissions list"	os2_permissions_back	0
"Got any games on this thing?"	os2_games	1
"Stop using the computer"	os2_goodbye	1

Table of Quip Texts (continued)
quip	quiptext
os2_greeting	"The computer wakes up without a sound. You could snoop through Hade's emails, but you also see an application for controlling Lunarcel's security permissions[note os2-greeting]."
os2_email	"You open Hade's email program. Looks like Hade deletes a lot of his emails as he gets them (you remember he doesn't like to leave evidence), but there's a few messages here that he hasn't gotten around to destroying yet."
os2_email_fission	"[os2-email-fission text]."
os2_email_begging	"[if saw-security-email-flag is false]A message from some technology officer, maybe the head of IT, to Hade. [otherwise]This one is sort of like the company-wide email about password security you got, except it's personalised to Hade. [end if]The sender is very politely explaining something about the importance of numbers and symbols and length in passwords, the value of strong password protection, and the cost of security breaches and ensuing lawsuits. Oh dear, what a shame he didn't pay attention!"
os2_email_scam	"[if saw-scam-email-flag is false]Just some random email telling Hade he could make money quickly from cryptocurrency mining. Man, he gets all the opportunities[otherwise]Hey, wait! This is the same email about cryptocurrency mining that [italic type]you[roman type] got! After you're done with the Moonlite, you'd better get on this quick before somebody else gets your free money[end if]!"
os2_email_investor	"Here's an older email sent by some banker. It seems they put some investment capital into the Moonlite a few years back, and they're trying to get Hadrian to give them an update. Maybe that was what the press conference earlier was for. Looks like Hadrian never replied to them. You don't blame him. You always wished your investors would just give you the money and then never talk to you again[first time]. Just to help Hadrian out, you send a quick reply in his name telling the banker that the project is cancelled and they should demand their money back. Hadrian can thank you later[only]."
os2_email_back	"You close the email inbox."
os2_permissions	"[one of]Oho! You've found a program for giving and taking away privileges to staff members. And it looks like you're already in the database![or]You reload the campus security program.[stopping]"
os2_permissions_list	"You have a quick look through the whole database of people with security privileges. As well as all the staff, it looks like certain visitors also get listed here. [one of]Some names and titles catch your eye. 'Count Urât,' 'Baroness Neplacut'... these are other vampires! Hadrian's been giving single-day passes for his engineering laboratory to vampires here and there over the last couple of years. How come they get invited and not you??[or]Strangely, there are also some vampire visitors in the list.[stopping]"
os2_permissions_nero	"It's the work of a moment to tick the little checkboxes next to your pseudonym. Now you have full security permissions to your name[if LabEntrance is visited] - no ID card-locked laboratory door can stop you now[end if]!"
os2_permissions_hade	"Aw, nuts. The options next to Hadrian's name are greyed out. The system must be smart enough to not let the boss get locked out of his own property. Pity. You were hoping that if you disinvited Hadrian while he was on campus, maybe he'd be catapulted off the premises or something[note os2-permissions-hade]."
os2_permissions_back	"You close the security program."
os2_games	"Yes! Wow, a [i]lot[/i] of games. Modern-looking ones, too. Does Hadrian do any actual work?"
os2_goodbye	"You get up and step away from Hadrian's fancy computer."

After quipping when the current quip is os2_email:
	disable the os2_email quip;
	disable the os2_permissions quip;
	disable the os2_games quip;
	disable the os2_goodbye quip;
	enable the os2_email_fission quip;
	enable the os2_email_begging quip;
	enable the os2_email_scam quip;
	enable the os2_email_investor quip;
	enable the os2_email_back quip.
	
Os2-email-fission-flag is a truth state that varies. Os2-email-fission-flag is false.
After quipping when the current quip is os2_email_fission:
	now os2-email-fission-flag is true;
	enable the os2_email_fission quip.
	
To say os2-email-fission text:
	if Confrontation has happened:
		say "This is a long conversation between Hadrian and an engineer, who's upset that the Moonlite's energy fission is massively inefficient. It reads like the engineer doesn't realise it's a vampire superpower thing - they honestly think the Moonlite is meant as a fission reactor. That's mildly interesting. Maybe you'll round up all the engineers later and find out who knows what. Make sure none of them can cause any problems";
	otherwise:
		say "[if os2-email-fission-flag is false]You skim through a long back-and-forth conversation between Hadrian and one of the Moonlite engineers.[paragraph break]Huh... it looks like the Moonlite has problems[otherwise]You revisit the email chain[end if]. A lot of it is jargon and gibberish, but it sounds like the type of fission the reactor uses is massively inefficient. Looks like the energy you put into splitting the helium atom isn't worth the energy you get out of it. And the engineer says something about a shortage of helium in the world. So the Moonlite is both unsustainable and worthless. Hah. Great job, Hade[note os2-email-fission]".
	
After quipping when the current quip is os2_email_begging:
	enable the os2_email_begging quip.
	
After quipping when the current quip is os2_email_scam:
	enable the os2_email_scam quip.
	
After quipping when the current quip is os2_email_investor:
	enable the os2_email_investor quip.
	
After quipping when the current quip is os2_email_back:
	disable the os2_email_fission quip;
	disable the os2_email_begging quip;
	disable the os2_email_scam quip;
	disable the os2_email_back quip;
	disable the os2_email_investor quip;
	enable the os2_email quip;
	enable the os2_permissions quip;
	enable the os2_games quip;
	enable the os2_goodbye quip.
	
After quipping when the current quip is os2_permissions:
	disable the os2_email quip;
	disable the os2_permissions quip;
	disable the os2_games quip;
	disable the os2_goodbye quip;
	enable the os2_permissions_list quip;
	if full-permission-flag is false:
		enable the os2_permissions_nero quip;
	enable the os2_permissions_hade quip;
	enable the os2_permissions_back quip.
	
After quipping when the current quip is os2_permissions_list:
	enable the os2_permissions_list quip.
	
After quipping when the current quip is os2_permissions_nero:
	now full-permission-flag is true.
	
[After quipping when the current quip is os2_permissions_hade:
	enable the os2_permissions_hade quip.]
	
After quipping when the current quip is os2_permissions_back:
	disable the os2_permissions_list quip;
	disable the os2_permissions_nero quip;
	disable the os2_permissions_hade quip;
	disable the os2_permissions_back quip;
	enable the os2_email quip;
	enable the os2_permissions quip;
	enable the os2_games quip;
	enable the os2_goodbye quip.
	
After quipping when the current quip is os2_games:
	enable the os2_games quip.
	
After quipping when the current quip is os2_goodbye:
	enable the os2_goodbye quip;
	terminate the conversation.

[do you ever suspect that you've gone about coding something in a bad way but it's too late to change course now?]
	

[

The following code was intended to be run using Emily Short's Computers extension for Inform 7. However, adding an email system led to a fatal runtime error whose precise cause I could not figure out for the life of me. Computers is a shade more complex than I require anyway. I ended up implementing computers by myself, so that I knew exactly what code was going into the project and so that I could make their use more consistent with the phone gadget I had already implemented. I have left this code here for the benefit of future historians when they analyse and celebrate my life's work.


Chapter - Fancy computer

[Much of this code is adapted directly from Emily Short's example code for her Computers extension]

The fancy computer is a desktop computer in InsideHadeOffice.

Description of the fancy computer is "One of those very expensive setups they sell to teenagers and gamers. It's black with red accents, and it looks like a spaceship."

The fancy computer is switched on.
The startup noise of the fancy computer is "The computer's screen wakes up almost before you touch the power button."

Section - Screenlock (password protection program)

The fancy computer runs a password lock program called screenlock. Screenlock is privately-named.
The description of screenlock is "The computer is locked, and demands a password before you can access it."
The password of screenlock is "letmein".
The rejection of screenlock is "'Password incorrect.'".
The success of screenlock is "The lock screen vanishes, and the desktop appears! (Hey! Same as [italic type]your[roman type] password.)".


[*IDEA: I want to put a XYZZY easter egg here but I can't figure out how to do it - I don;t know if I'm accessing the text field properly and I don't know if I even can compare the snippet with a provided string, much less how to do it. ]

Section - Hademail (email program)

The fancy computer runs an email program called hade-email. Hade-email is privately-named.

The message table of Hade-email is Table of Hade Messages.

Table of Hade Messages
topic	message	arrival time	read	answered	description
"memo"	"Memo"	9:00 AM	false	false	"Your boss would like to see you in his office right away."
"SPAM"	"SPAM"	--	false	false	"Money for you from Nigeria!"
with 10 blank rows.	

]



Book - Laboratory

Part - LabEntrance

LabEntrance is a room. Printed name of LabEntrance is "Laboratory Entrance".
LabEntrance is north of CampusEast.[ LabEntrance is inside from CampusEast.]

Description of LabEntrance is "This is a little antechamber which serves as a security checkpoint before the laboratory itself. The lab [if door-destruction-flag is false]can vaguely be seen through a frosted glass door to the north[otherwise]is clearly visible to the north now that the door which once guarded it has been obliterated[end if]; the main campus is south."

Instead of going outside in LabEntrance:
	try going south.
	
Instead of exiting in LabEntrance:
	try going south.


Chapter - Glass Door

The glass door is a door.
The glass door is north of LabEntrance and south of Engineering.
The glass door is scenery.

The glass door is closed, openable, locked and not lockable.

Understand "frosted" as the glass door.

Understand "shard/shards" and "pebble/pebbles" and "piece/pieces" and "shard/shards" as the glass door when door-destruction-flag is true.

Description of the glass door is "[GlassDoorDesc]."

To say GlassDoorDesc:
	if door-destruction-flag is false:
		say "White letters on the thick glass spell '[if the player is in LabEntrance]Research Laboratory[otherwise]yrotarobaL hcraeseR[end if]'. Smaller letters underneath that spell '[if the player is in LabEntrance]Authorized Personnel ONLY[otherwise]YLNO lennosreP dezirohtuA[end if]'";
	otherwise:
		say "Thousands of pebbles of glass are strewn [if the player is in LabEntrance]across the floor. Watch where you step[otherwise]through the doorway[end if]".

Instead of searching the glass door:
	say "The frosted glass blurs most of what's beyond, but [if Engineering is unvisited]you think [end if]you can see a large shape (the Moonlite[if Engineering is unvisited]?[end if]) in the centre of a massive room."
	
Check unlocking the glass door with the ID card:
	if door-destruction-flag is true:
		say "[doorObliterated]." instead;
	otherwise:
		if the player is in LabEntrance:
			try inserting the ID card into the card reader instead;
		otherwise:
			say "There's no card reader on this side, but that's okay, the door's always unlocked from this side." instead.
	
Check attacking the glass door:
	say "It's [italic type]very[roman type] thick glass. Probably you'd only crack it before somebody noticed and called a security guard. Better to just open it than to try to smash your way through." instead.
	
Carry out closing the glass door:
	unless the player is in Engineering:
		now the glass door is locked.
	
Report closing the glass door in LabEntrance:
	say "You close the door and hear a soft click as the automatic lock engages." instead.
	
Check taking the glass door when door-destruction-flag is true:
	say "Too sharp to carry![if Hadrian is in LabEntrance] There must be a better weapon to use!" instead.
	
Check opening the glass door when door-destruction-flag is true:
	say "[doorObliterated]." instead.
Check closing the glass door when door-destruction-flag is true:
	say "[doorObliterated]." instead.
Check locking the glass door with something when door-destruction-flag is true:
	say "[doorObliterated]." instead.
Check unlocking the glass door with something when door-destruction-flag is true:
	say "[doorObliterated]." instead.

To say doorObliterated:
	say "What would be the point? There's no door anymore".

Check fixing the glass door when door-destruction-flag is true:
	say "This 10,000-piece jigsaw of a door is beyond your help." instead.
	
Check rubbing the glass door when door-destruction-flag is true:
	say "You give one individual shard of frosted glass a little polish." instead.



[
Chapter - Permit

The permit is in LabEntrance.

Description of the permit is "An ID card with your name on it, granting permission to enter the laboratory."

Understand "ID" or "card" or "permission" or "pass" as the permit.
]

Section - Card Reader

The card reader is in LabEntrance.
The card reader is fixed in place.

Initial appearance of the card reader is "There is a card reader device mounted next to the glass door, which [if door-destruction-flag is false]must[otherwise]used to[end if] control the lock."

Description of the card reader is "A device in the wall next to the glass door, with a slot for a card. A little sign taped to the reader says 'If card is not recognised, please consult a manager to check your card's authorisation.'"

Understand "device" and "slot/hole" and "lock/locker" and "sign" as the card reader.

Check inserting the ID card into the card reader:
	say "[CardReaderPermissionCheck]." instead.
	
Card-denied-flag is a truth state that varies. Card-denied-flag is false.
[set immediately below this; controls appropriate contextual dialogue for the receptionist]
	
To say CardReaderPermissionCheck:
	if full-permission-flag is false:
		say "You insert your ID card into the reader. A red LED blinks sternly, and the door remains locked. Guess you're not authorised personnel[one of][or]. You'll have to take it up with management, or whoever can authorise you[stopping]";
		now card-denied-flag is true;
		if man_card-quipped-flag is false:
			enable the man_card quip for the manager;
		if rec_hade_where_access-quipped-flag is false:
			enable the rec_hade_where_access quip for the receptionist;
		[The above truth flags are defined in the respective conversation litanies, and control the appearance of certain quips after Nero learns about the card reader if the player has not already seen them]
	otherwise:
		if door-destruction-flag is false:
			if the glass door is locked:
				now the glass door is unlocked;
				say "You flick your ID card through the reader. Its LED lights up a cheery green, and you hear a soft click from the glass door";
			otherwise:
				say "You flick your ID card through the reader, but the door is already unlocked";
		otherwise:
			say "You insert your ID card into the reader. The LED lights up a puzzled orange. That must be the error colour for when the door's been destroyed by a vampire". 
		
Check inserting into the card reader:
	say "Too bulky to fit into the card reader; also, not a card." instead.
	


Section - The door is destroyed during Fight

Door-destruction-flag is a truth state that varies. Door-destruction-flag is false.
[The use of this flag, and the actual disabling of the door, is carried out under Hadrian's fight events. (It's carried out there so that the event will appear in the right place, i.e. after describing the room.)]


Part - Engineering Lab

Engineering is a room. Printed name of Engineering is "Engineering Lab".
Description of Engineering is "An open-plan laboratory the size of a warehouse, littered with all sorts of scrap and junk. [if the engineers are in Engineering]Engineers move from project to project, doing engineering jobs (you've never been interested in the technical side of things). [end if]The exit is south."

Chapter - Engineers (scenery)

The engineers are in Engineering.
The engineers are scenery.
The engineers are a person.
The engineers are plural-named.

Understand "engineer/engineers" and "egghead/eggheads" and "worker/workers" and "scientist/scientists" and "person/people/man/men/woman/women" as the engineers.

Description of the engineers is "These must be the eggheads who built the Moonlite. You expected them to all be in lab coats and glasses, but most of them are just in shirts and ties. Very disappointing[note x-engineers]!"

[lightly implemented, but since the player should be locked in conversation with Hade the whole time the engineers are in play, there should be no need for stronger implementation]

Chapter - Scrap and Junk (scenery)

The junk is in Engineering.
The junk is scenery.

Understand "scrap/junk/trash/garbage" and "parts/machines/board/boards/circuitboard/circuitboards/circuit/circuits/pipe/pipes" as the junk.

Description of the junk is "Just parts of machines. Circuitboards and chunky pipes and so on. You've never been that interested in how technology works, so you have no idea what any of this was supposed to do. It's all useless to you."

Instead of taking the junk:
	say "You try to grab a random bit of machinery, but it's surprisingly heavy! You don't have the [if Fight is happening]time to find something you can carry, especially not with Hadrian on your back[otherwise]patience to find something light enough to carry - the Moonlite is right there, anyway[end if]."

Chapter - The Moonlite

The Moonlite is a device in Engineering. "In the centre of the lab sits the Moonlite."
The Moonlite is switched off.

The Moonlite is fixed in place.

Description of the Moonlite is "The reactor looks like a thimble the size of an elephant. Up close, you can see a little power button, and next to that, a sort of... glass bulb? It reminds you of a football-sized version of the little bulbs on laser pointers[note x-moonlite]."

Understand "machine" and "reactor" and "glass/bulb" as the Moonlite.

Instead of doing anything other than examining to the Moonlite when Fight has not ended:
	say "You reach for the Moonlite-[paragraph break]Hadrian bears down on you! You dodge just before his swipe would have taken your arm off. You're not going to be able to touch the Moonlite as long as Hade can do anything about it." 

Section - Power button

The power button is part of the Moonlite.

Description of the power button is "This description should redirect to examining the Moonlite instead. If it doesn't, you've found a bug! Please let me know."

Check examining the power button:
	try examining the Moonlite instead.

Check pushing the power button:
	try switching on the Moonlite instead.

Check switching on the power button:
	try switching on the Moonlite instead.

[I've defined the button as a separate object because the Moonlite description mentions a button (to indicate to the player that it can be turned on), and I need to catch the cases where "push button" is an attempt to switch on the Moonlite yet "push Moonlite" is an attempt to move the Moonlite. (That is, if I had "button" as a synonym for the Moonlite, I could end up with ambiguous cases where "push button" is an attempt to move the Moonlite, or "push Moonlite" switches on the Moonlite unexpectedly.)]

Check pushing the power button with the umbrella during Fight:
	say "Trying to stay out of Hadrian's range, you try to push the power button with the sharp tip of your umbrella... but it's no good - Hadrian bears down on you too quickly, and you're not accurate enough with the umbrella. You can't use the Moonlite whie Hadrian is about!" instead.


Section - Switching on the Moonlite wins the game

[*TODO: Choice of using or breaking Moonlite should be clearer - at the very least, needs to be noted after killing Hade and when re-entering the lab]

[Carry out switching on the Moonlite:
	say "Well, why waste it? Good of Hade to leave it running for you, really.[paragraph break]You switch on the Moonlite. The machine slowly comes to life. You stand in front of the bulb and wonder idly if you can buy chest armour.";
	end the story finally saying "The world is yours".]
	
Carry out switching on the Moonlite:
	say "You were planning to destroy this thing this morning. That's pretty funny now.[paragraph break]Of course, you've got some jobs to do later. You'll have to get the Moonlite out of the lab, or maybe just take control of the lab. You'll have to threaten a lot of people to make that happen. You'll have to figure out how it actually operates, or get someone else to teach you. You'll have the power - the money will come soon, you're sure - but a lot of people will want to take it away from you. Get rid of that janitor and her friends, if she has any. Burn down that office with the prayer room. Maybe buy a breastplate. You'l be busy.[paragraph break]But that all comes later. Right now, you slam the Moonlite's button with an open palm, and watch the machine explode to life. Your hard work is finally paying off.";
	end the story finally saying "The world is yours".




Section - Breaking the Moonlite wins the game

Tried-to-break-moonlite-flag is a truth state that varies. Tried-to-break-moonlite-flag is false.
	
Instead of attacking the Moonlite:
	if Fight has not ended:
		if tried-to-break-moonlite-flag is false:
			say "You grab a couple of exposed wires, but suddenly Hadrian is lunging at you, and you wheel out of the way.[paragraph break]'You think that'll do anything?' he sniggers. 'I've already used it! And I can just repair anything you do to it!'";
			now tried-to-break-moonlite-flag is true;
		otherwise:
			say "You can't do any lasting damage to the Moonlite while Hadrian can stop you, and it probably wouldn't reverse his transformation anyway.";
	otherwise:
		say "You grab a couple of exposed wires and yank them. You open some panels and pull out some mysterious electronics and circuitboards. After a moment's thought, you search the lab for anything that looks like a blueprint and tear it up.[paragraph break]It feels... it feels... [italic type]cathartic.[roman type] Not good, but cathartic. It feels horrible, and it feels right.[paragraph break]Five minutes later, years of research lie in bits and pieces on the laboratory floor, and you're being escorted by security officers. Tomorrow, you'll be hungry and miserable again, and you'll wonder why the hell you threw away the Moonlite's power. But tomorrow, no one else will have that power either.";
		end the story finally saying "The world is a little fairer".
		
[
This code is neater to me but I can't figure out the right syntax for blocking the block attacking rule in this instance:
	
The block attacking rule does nothing when the player attacks the Moonlite.

Check attacking the Moonlite:
	if Fight has not ended:
		if tried-to-break-moonlite-flag is false:
			say "You grab a couple of exposed wires, but suddenly Hadrian is lunging at you, and you wheel out of the way.[paragraph break]'You think that'll do anything?' he sniggers. 'I've already used it! And I can just repair anything you do to it!'" instead;
			now tried-to-break-moonlite-flag is true;
		otherwise:
			say "You can't do any lasting damage to the Moonlite while Hadrian can stop you, and it probably wouldn't reverse his transformation anyway." instead.
			
Carry out attacking the Moonlite:
	say "You grab a couple of exposed wires and yank them. You open some panels and pull out some mysterious electronics and circuitboards. After a moment's thought, you search the lab for anything that looks like a blueprint and tear it up,[paragraph break]It feels... it feels... [italic type]cathartic.[roman type] Not good, but cathartic. It feels horrible, and it feels right.[paragraph break]Five minutes later, years of research lie in bits and pieces on the laboratory floor, and you're being escorted by security officers. Tomorrow, you'll be hungry and miserable again, and you'll wonder why the hell you threw away the Moonlite's power. But tomorrow, no one else will have that power either.";
	end the story finally saying "The world is a little fairer".
]



Chapter - Hadrian

Hadrian is a vampire. Hadrian is in CampusEntrance.
[Hadrian is moved Backstage after the prologue, as arranged by the Prologue scene.
He is only moved to Engineering when the player reaches Engineering, as arranged by the Confrontation scene.
Doing it this way is insurance against Hadrian's pathfinding leading him out of Engineering too early.]

Understand "Hade/Alba" and "vampire/fangs" and "suit" as Hadrian.

Section - Description of Hadrian

Description of Hadrian is "[HadrianDesc]."

To say HadrianDesc:
	if Confrontation has not ended:
		say "Perfectly coiffed and coutured, as always. Amazing how good you can look when you probably pay a dozen people to dress you[note hade-desc][if Prologue has ended]. He's staring at you coolly and smirking, like he thinks he's in control";
	otherwise if Fight has not ended:
		say "This isn't great. Hade is about a foot taller and a foot wider than he usually is, his shirt torn apart by brand-new biceps and triceps, and all the other ceps you don't know the names of. His pale skin now sparkles [if the player is in a shaded room]underneath the flourescent lighting[otherwise]brilliantly in the sunshine, only sizzling a little bit from the direct exposure[end if]. His nails have grown into claws. Those claws and his fangs are very, very long.[paragraph break]His chest can be seen through his ripped shirt. You can see scar tissue around his heart[HadrianStatus][note hade-muscles-up]";
	otherwise:
		say "Someday, maybe later today, someone might reconstitute Hade, bring him back to life. For now, he's just a pile of dust and a tattered suit"
		
To say HadrianStatus:
	if Hadrian holds the wooden signpost:
		say ".[paragraph break]Hadrian is currently wielding a signpost as a giant wooden stake[if Hadrian is holy-exposed] and staring at a cupboard full of holy symbols in open-mouthed horror[end if]".

Understand "dust" and "pile" and "remains" and "ashes" as Hadrian when Fight has ended.
Understand "chest" and "scar/scars" and "heart" as Hadrian when Fight is happening.



[Description of Hadrian's fangs is "Hade's fangs are remarkably white and symmetrical for a 500-year-old[if Hadrian is staked]. They rest atop the pile of dust that once was Hade like glacé cherries on a cake[end if]."
Understand "fangs" or "Hade's fangs" or "teeth/Hade's teeth" as Hadrian's fangs.]

Section - Initial Appearance of Hadrian

Initial appearance of Hadrian is "[HadrianIA]."

To say HadrianIA:
	if Prologue has not ended:
		say "Hadrian paces and gesticulates";
	otherwise if Confrontation has not ended:
		say "Hadrian is here, smirking";
	otherwise if Fight has not ended:
		say "Hadrian is here, and coming after you";
	otherwise:
		say "Hade's remains are scattered here".
		
Hadrian is scenery.
When Interview begins:
	now Hadrian is not scenery.
[this suppresses the initial appearance property of Hadrian during the prologue]



Section - Talking to Hadrian

The greeting of Hadrian is had_greeting. The litany of Hadrian is the Table of Hadrian Conversation.

Table of Hadrian Conversation
prompt	response	enabled
"Surprised to see me again, Hadrian, you prick?"	had_surprise	1
"Looks like you hired me back, boss!"	had_surprise_hired	0
"Stole? So it's my fault your employees wanted to work for me instead?"	had_surprise_fault	0
"I'm here for the machine."	had_moonlite	1
"I know exactly what the machine is."	had_moonlite_guess	0
"You said it was a fission reactor, remember?"	had_moonlite_guess_fission	0
"It doesn't do anything. The fission would be too inefficient."	had_moonlite_guess_scam	0
"It's a machine to make vampires more powerful."	had_moonlite_guess_correct	0
"Well... actually, I don't know."	had_moonlite_guess_no	0
"I don't care what your machine for idiots does."	had_moonlite_dontcare	0
"Of... talking to you?"	had_tired_talking	0
"Of... capitalism?"	had_tired_capitalism	0
"Of... being a vampire?"	had_tired_vampire	0
"How does the Moonlite make us more powerful?"	had_reveal_science	0
"Wait, you just had them prototype a nuclear fission reactor? Just like that?"	had_reveal_science_crunch	0
"Where are you getting the money to develop this thing?"	had_reveal_investors	0
"You told every other vampire about this thing, but you didn't tell me??"	had_reveal_investors_nero	0
"If this is for vampires, why show it off to everyone this morning?"	had_reveal_investors_showoff	0
"Why? Something not right with the Moonlite?"	had_reveal_investors_showoff_right	0
"(skip all the gloating and just attack Hade)"	had_goodbye_fast	1
"Yes. (attack Hade)"	had_goodbye_tired	0
"Sounds like a cool machine. Be a shame if someone took it for themselves."	had_goodbye_reveal1	0
"You need to destroy this machine. It's too dangerous."	had_goodbye_reveal2	0



Table of Quip Texts (continued)
quip	quiptext
had_greeting	"Hadrian is here, talking to some engineers. He glances up as you enter.[paragraph break]Shock and fury flit across his face. But they're gone in a flash, replaced by the same old magnaminous smirk. You might not have noticed if you weren't watching him carefully.[paragraph break]'Nero! To what do I owe this unexpected pleasure?'[note had-greeting]"
had_surprise	"'You could say that, Nero,' he says. His smile is broad, but his teeth are grinding. 'You could say that, after I forbade you from ever darkening my door again. After you stole from me. Tell me, how did you get in? Who invited you?'"
had_surprise_hired	"Hade looks blank for a second. 'Oh, the service jobs. Yeah, well, you're fi-' Something seems to occur to him. 'You know what? Why don't you stick around for a while. Saves me having to find you later.'"
had_surprise_fault	"'It's your fault you poached my staff, yeah!' Hadrian snaps. 'It's your fault you stole my staff and my ideas when you quit! It's your fault you tried to sabotage me on the way out![paragraph break]'And it's your fault you failed anyway, isn't it?' he continues, in a quieter voice. 'It's your fault that you alienated everyone you've ever worked with. That now everyone can see you for the stupid hateful little man you are. It's all your own fault. The only mistake I made was turning you. You have no one to blame but yourself.'[paragraph break]Hadrian is smiling again. You try to hold his gaze."
had_moonlite	"'Oh, you don't even know what it does,' says Hadrian dismissively."
had_moonlite_guess	"'Oh yeah? This'll be funny. What do you think's going on, then?'"
had_moonlite_guess_fission	"'Hah. Idiot. Yeah, I did say that. And it's true. But it's not the full story.'[aren't you tired]?'"
had_moonlite_guess_scam	"'That's what you'd do, right? Promise the world, deliver nothing, take the money and run,' Hade says, a little unfairly. 'Well, I have something more ambitious in mind.'[aren't you tired]?'"
had_moonlite_guess_correct	"Hade pauses (for effect, you bet). Then his smile broadens. 'Exactly! Did you actually figure it out, or did you guess?'[aren't you tired]?'"
had_moonlite_guess_no	"'Hah. First time you've ever admitted you're in over your head.'[aren't you tired]?'"
had_moonlite_dontcare	"'Oh, you will care, Nero. You'll like this. And it's NOT for idiots.'[aren't you tired]?'"
had_tired_talking	"'Feeling's mutual,' Hadrian replies, glaring at you. 'No, idiot. I'm tired of our bodies![vampire speech].'"
had_tired_capitalism	"'Absolutely not,' Hadrian says sternly. 'No. What the hell is wrong with you? What, you think it's bad that I'm rich, just because you keep wasting your life? No, I'm tired of our bodies![vampire speech].'"
had_tired_vampire	"'Exactly! Exactly! You feel it too!' Hade almost sounds genuinely happy.[vampire speech].'"
had_reveal_science	"'Sunlight, Nero, sunlight!' Hade almost sounds giddy. He loves explaining how smart he is. 'What is sunlight, Nero? It's an explosion! It's the energy of octillions of octillions of hydrogen atoms fusing together into helium! A celestial Hindenburg![paragraph break]'And I wondered, if that hurts us... what about the opposite? So I had the eggheads here prototype a new kind of energy reactor, one that takes helium and splits it into hydrogen. Oh, some of the staff carped at me about inefficiency, and how hard it is to safely contain a nuclear explosion, and how it shouldn't have a window -' he pats the glass bulb on the Moonlite '- but we made it. Of course, I just say it's a new kind of fission reactor we're going to sell, otherwise people might get suspicious. But that's not what it is, Nero. It's an anti-sunlight machine. And just wait till you see what it does for us.'"
had_reveal_science_crunch	"'Yes,' says Hade blankly. There's a small silence. 'Well, they had to pull a couple hundred all-nighters to do it,' he adds[note had-reveal-science-crunch]."
had_reveal_investors	"'Investors, of course! I rang up a few rich people and told them about the clean energy revolution. Lots of people want to want to get in on this one. Look like philanthropists while making a quick buck from our hard work.[paragraph break]'And then there's the other investors. The ones who know what's up.' Hade starts counting on his fingers. 'Let's see, I got a couple million from Old Count Urât, and Baroness Neplacut... Scârbos the Loathsome, Comtesse La Marcil, Big Red Peavis[note had-reveal-investors]... oh, lots of vampires were interested in this one. Some of them even visited.' He leans forward conspirationally. 'Between you and me, though, I think I'll keep the Moonlite for myself. Monopolies are so much more profitable, aren't they?'"
had_reveal_investors_nero	"'Why would I tell [italic type]you?[roman type]' sneers Hadrian. 'I don't want you anywhere near this thing. Besides, I know you don't have any money.' There was no need for that."
had_reveal_investors_showoff	"Hade looks annoyed, not at you for a change. 'I didn't want to. But I told some of my investors that this is a sustainable energy thing, and they were getting mad that I haven't shown anything yet. And some of these were saying that the Moonlite wasn't working,' he adds, gesturing to the engineers at work around the lab. 'I just needed to stop people getting suspicious and pulling their investment, that's why I did the press conference. I just need a little more time to get it right.'"
had_reveal_investors_showoff_right	"'It works great, it could just be a little stronger-' Hade catches himself, and gives you a look. 'Sneaky, Nero! Sneaky! Almost got me giving away all my secrets! Well, the Moonlite works [italic type]just fine[roman type]. I'll show you in a second!'"
had_goodbye_fast	"You stride forward and clobber Hadrian over the head.[paragraph break]'Nero,' he says in a crumpled heap on the floor. 'I hope you enjoyed that. You're going to pay for it.' And he springs up and pushes the button on the Moonlite."
had_goodbye_tired	"You greatly enjoy the look of surprise on Hade's face as you clobber him over the head.[paragraph break]'Oh, you're tired, are you?' says Hade, slightly muffled, face down on the floor. 'Well, let's put you to bed then!' And he springs up and pushes the button on the Moonlite."
had_goodbye_reveal1	"'Oh, I'm not worried about that,' says Hadrian. He moves to stand in front of the reactor's glass bulb as he talks. 'For a start, they'd need a crane. And if anyone [italic type]did[roman type] threaten to take the Moonlite off me... I'd have to do something about that.' And, holding your gaze and smiling, he slaps the button on the machine."
had_goodbye_reveal2	"Hade goggles at you like you just pulled a crucifix on him. '[italic type]Destroy it??[roman type] Are you feeling well, Nero? Have you been talking to unions? I earned this! I worked for this! And you want to take it away! Over my dead body!' And he slaps the button on the Moonlite."

[*IDEA: Although I like the "pulled a crucifix" line in had_goodbye_reveal2, it's too Christianity-centric and could do with replacing.]

[Of course, the Moonlite pun doesn't quite work, since moonlight is the reflection of sunlight, not the opposite of sunlight. But when did this game ever let scientific fact get in the way?]

[]

After quipping when the current quip is had_surprise:
	enable the had_surprise_hired quip;
	enable the had_surprise_fault quip.

After quipping when the current quip is had_moonlite:
	enable the had_moonlite_guess quip;
	enable the had_moonlite_dontcare quip.
	
After quipping when the current quip is had_moonlite_guess:
	disable the had_surprise quip;
	disable the had_surprise_hired quip;
	disable the had_surprise_fault quip;
	disable the had_moonlite_dontcare quip;
	enable the had_moonlite_guess_fission quip;
	enable the had_moonlite_guess_scam quip;
	enable the had_moonlite_guess_correct quip;
	enable the had_moonlite_guess_no quip.
	
After quipping when the current quip is had_moonlite_guess_fission:
	set up the tired choices.
	
After quipping when the current quip is had_moonlite_guess_scam:
	set up the tired choices.
	
After quipping when the current quip is had_moonlite_guess_correct:
	set up the tired choices.
	
After quipping when the current quip is had_moonlite_guess_no:
	set up the tired choices.
	
After quipping when the current quip is had_moonlite_dontcare:
	disable the had_surprise quip;
	disable the had_surprise_hired quip;
	disable the had_surprise_fault quip;
	disable the had_moonlite_guess quip;
	set up the tired choices.
	
To say aren't you tired:
	say "[paragraph break]Hadrian starts pacing. He's about to give you a speech if you let him. 'Let me ask you something, Nero. Aren't you tired?' He gestures vaguely. 'Of all this".
[note that the missing ?' is placed after the [aren't you tired] token wherever it appears in the table of quip texts. If it is included here, it causes an extra line break to be inserted in the story by Inform. There is probably a better way but I don't feel like delving into the documentation and intfiction forums to find one]
	
To set up the tired choices:
	disable the had_moonlite_guess_fission quip for Hadrian;
	disable the had_moonlite_guess_scam quip for Hadrian;
	disable the had_moonlite_guess_correct quip for Hadrian;
	disable the had_moonlite_guess_no quip for Hadrian;
	disable the had_goodbye_fast quip for Hadrian;
	enable the had_tired_talking quip for Hadrian;
	enable the had_tired_capitalism quip for Hadrian;
	enable the had_tired_vampire quip for Hadrian;
	enable the had_goodbye_tired quip for Hadrian.
	
After quipping when the current quip is had_tired_talking:
	set up the reveal choices.
	
After quipping when the current quip is had_tired_capitalism:
	set up the reveal choices.
	
After quipping when the current quip is had_tired_vampire:
	set up the reveal choices.
	
To say vampire speech:
	say "[paragraph break]'Look at us! We are [italic type]vampires![roman type] We [italic type]own[roman type] this world! We're smarter than everyone, we're stronger than everyone, we've seen everything, we've, we have [italic type]power[roman type]. True power.[paragraph break]'But we can't [italic type]use[roman type] it! We're trapped by all these, these [italic type]ridiculous[roman type] weaknesses! We can't go anywhere without permission! We can't cross rivers! We can't eat garlic! We can't handle holy symbols! We can't have stakes driven through our hearts! We can't even go outside without some stupid umbrella or veil![paragraph break]'The Moonlite is going to change that. The Moonlite is going to unshackle us.[paragraph break]'Well, again, not you. I'm going to kill you in a few minutes".
[Like with the aren't you tired token, the .' that should end this string is instead placed after the [vampire speech] token when it is used, to help Inform with its automatic line breaks]

To set up the reveal choices:
	disable the had_tired_talking quip for Hadrian;
	disable the had_tired_capitalism quip for Hadrian;
	disable the had_tired_vampire quip for Hadrian;
	disable the had_goodbye_tired quip for Hadrian;
	enable the had_reveal_science quip for Hadrian;
	enable the had_reveal_investors quip for Hadrian;
	enable the had_goodbye_reveal1 quip for Hadrian;
	enable the had_goodbye_reveal2 quip for Hadrian.
	
After quipping when the current quip is had_reveal_science:
	enable the had_reveal_science_crunch quip.
	
After quipping when the current quip is had_reveal_investors:
	enable the had_reveal_investors_nero quip;
	enable the had_reveal_investors_showoff quip.
	
After quipping when the current quip is had_reveal_investors_showoff:
	enable the had_reveal_investors_showoff_right quip.

After quipping when the current quip is had_goodbye_fast:
	trigger the fight scene;
	terminate the conversation.
	
After quipping when the current quip is had_goodbye_tired:
	trigger the fight scene;
	terminate the conversation.
	
After quipping when the current quip is had_goodbye_reveal1:
	trigger the fight scene;
	terminate the conversation.
	
After quipping when the current quip is had_goodbye_reveal2:
	trigger the fight scene;
	terminate the conversation.

Fight-flag is a truth state that varies. Fight-flag is false.
To trigger the fight scene:
	now fight-flag is true.


[below is the unfinished first draft of the Hadrian conversation, which I rewrote from scratch because I needed to plan it better and I wasn't happy with this]

[Table of Hadrian Conversation
prompt	response	enabled
"'Good to see you again, Hade, you prick.'"	had_history	1
"'Surprised to see me, are you?'"	had_hist_know	0
"'What's with your bad Moonlite machine for idiots?'"	had_moonlite	1
"How does the Moonlite work?"	had_star_how	0
"'Must have taken a lot of investors to fund the Moonlite.'"	had_star_invest	0
"Why didn't you ask me, you prick?"	had_star_invest_nero	0
"(attack Hade)"	had_goodbye1	1
"I am going to take the Moonlite for myself."	had_goodbye2	0


Table of Quip Texts (continued)
quip	quiptext
had_greeting	"Hadrian is here. He glances up as you enter, and recognises you.[paragraph break]A lot of expressions try to cross his face at once. Shock, anger, and confusion are among them. But in a flash, they're gone, and Hadrian's wearing the same smirk he greets everyone with.[paragraph break]'How can I help you, Nero?' he begins."
had_history	"'Yeah. You too.' Hade pauses for effect, and wags a finger like he thinks he's Columbo. 'You know, I could've sworn I told you never to set foot in my empire again, after that little stunt. Tell me, who invited you? I'll stick their head next to yours when we're done here.'"
had_hist_know	"'Nero, there is nothing you can do that I cannot predict,' boasts Hade.[paragraph break](Oh, is that what he thinks? You saw the look on his face when you walked in. He's stalling for time while he figures out what to do with you. (Actually, you're stalling too, but he doesn't need to know that.))"
had_moonlite	"Hadrian pauses for a heartbeat. Then he throws up his arms. 'Oh what the hell, I'll let you in on it. I'll bet you know enough to guess anyway. Eventually.'[paragraph break]Another pause. 'Aren't you tired, Nero? Of this life? We own this world. Well, not you, you screwed it up, but the rest of us vampires. We're smarter than everyone, we're stronger than everyone, we've seen everything, we've, we have [italic type]power[roman type]. True power.[paragraph break]'But we can't [italic type]use[roman type] it! We're trapped by these, these [italic type]ridiculous[roman type] shackles! We can't go anywhere without permission! We can't cross rivers! We can't eat garlic! We can't handle holy symbols! We can't have stakes driven through our hearts! We can't even go outside without some stupid umbrella or veil![paragraph break]'The Moonlite is going to change that. The moonlite is going to unshackle us.[paragraph break]'Well, again, not you. I'm going to kill you in a few minutes.'"
had_star_how	"PLACEHOLDER moonlite how quip - the Moonlite works by converting helium to hydrogen (i.e. reverse sunlight)."
had_star_invest	"PLACEHOLDER moonlite investment quip - many rich vampires are investing."
had_star_invest_nero	"PLACEHOLDER why didn't Hade tell Nero quip - because a) Nero is poor and b) Hade doesn't actually intend to share Moonlite."
had_goodbye1	"You leap across the room and clobber Hade in the mouth.[paragraph break]'Wow,' says Hade. 'Okay. Well, if you want to go, then let's go.'"
had_goodbye2	"PLACEHOLDER ends conversation (after learning about Moonlite)."

[*TODO: fill this conversation out:
	replace placeholders
	history > little stunt
	history > manager]

[*TODO: What IS Nero and Hade's history? It's possibly enough to know that they hate each other, but we're missing out on some character establishing here. IDEA: not Nero's first corporate sabotage - headhunted from Hade's previous business?]

After quipping when the current quip is had_history:
	enable the had_hist_know quip.
	
After quipping when the current quip is had_moonlite:
	enable the had_star_how quip;
	enable the had_star_invest quip.
	
After quipping when the current quip is had_star_invest:
	enable the had_star_invest_nero quip.
	
After quipping when the current quip is had_star_invest_nero:
	disable the had_goodbye1 quip;
	enable the had_goodbye2 quip.
	
[The following code ends the Confrontation scene and initiates the Fight scene]
Fight-flag is a truth state that varies. Fight-flag is false.
After quipping when the current quip is had_goodbye1 or the current quip is had_goodbye2:
	terminate the conversation;
	now fight-flag is true.]

Section - Hadrian can't be talked to outside of Confrontation

Before talking to Hadrian during Prologue:
	say "You open your mouth for a few choice swears, but nearby audience members preemptively hush you." instead.

Before talking to Hadrian during Fight:
	say "He's trying to kill you! No more talking!" instead.
	
Before talking to Hadrian during Endgame:
	say "You call Hadrian's remains a few names. Boy! It's so much more fun talking to him when he can't talk back." instead.

Section - Hadrian chases the player during Fight

[pathfinding code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 39]

Every turn during Fight (this is the Hadrian pathfinding rule): 
	if the player is in InPhoneBooth:
		say "[HadrianFightPhoneBoothEvent].";
	otherwise if the location of Hadrian is not the location of the player: 
		let the way be the best route from the location of Hadrian to the location of the player, using doors; 
		try Hadrian going the way; 
	otherwise:
		if Hadrian does not carry the wooden signpost:
			say "[HadrianFightRandomEvent1].";
		otherwise:
			say "[HadrianFightRandomEvent2].".
		
[Fight is a scene defined in the Scenes volume]

To say HadrianFightRandomEvent1:
	say "[one of]Hadrian swipes at you, and you stumble back[or]Hadrian lunges! You narrowly dodge[or]Hadrian cackles and flexes maliciously[at random]".
	
To say HadrianFightRandomEvent2:
	say "[one of]Hadrian drives the point of the signpost at your chest! You dodge just in time[or]Again, Hadrian thrusts the stake of the signpost at you, and you lurch out of the way[or]Hadrian stabs at you again with the pointed signpost[or]This time, Hadrian swings the signpost at your head like a baseball bat, but you manage to duck in time[then at random]".
	
To say HadrianFightPhoneBoothEvent:
	say "[one of]The phone booth is too small for two vampires! Hadrian paces outside impatiently[or]Hadrian wallops the phone booth with the signpost a few times[or]Hadrian shoulder-barges the booth a couple of times[or]Hadrian starts to pick up the phone booth, but thinks better of it[or]Hadrian glowers outside[then at random]".
	
The Hadrian pathfinding rule does nothing when Hadrian is holy-exposed.
[narration of Hade's actions is taken up by the report holy exposure rule]

Report Hadrian going:
	say "Hadrian [one of]pursues[or]follows[or]chases after[or]strides towards[at random] you." instead.
	

Section - Hadrian destroys the glass door

Report Hadrian going to LabEntrance for the first time:
	say "[door destruction event]." instead.
	
To say door destruction event:
	now door-destruction-flag is true;
	now the glass door is open;
	now the glass door is unopenable;
	now the glass door is unlocked;
	now the glass door is not lockable;
	say "As you enter, you slam the glass door shut behind you and hear its lock engage.[paragraph break]Hadrian strides straight through! The glass explodes into confetti against his huge body! 'Can't run away from this one, Nero!' he bellows (a little unfairly - [italic type]he[roman type] was the one who banned [italic type]you[roman type] from meeting him)[note door-destruction]".
	

Section - Hadrian scares the janitor away

Report Hadrian going to CampusEast for the first time:
	say "[janitor leaves event]." instead.
	
To say janitor leaves event:
	now the janitor is in Backstage;
	say "The janitor sees Hadrian in hot pursuit and understands what needs to be done. She lets you past, and then rips the pipe leak open again. A river runs across the campus in front of Hadrian.[paragraph break]He grabs the pipe and bends it like spaghetti, diverting the leak to behind the laboratory. The janitor shrugs at you sympathetically, and then legs it before Hadrian can do the same to her[note janitor-legs-it]".

Section - Hadrian takes the wooden signpost

Report Hadrian going to CampusCentral for the first time:
	say "[signpost event]." instead.
	
To say signpost event:
	now Hadrian carries the wooden signpost;
	now signpost-moved-flag is true;
	say "As Hadrian pursues you, the signpost catches his eye. He winks at you. 'Let's do this like the vampire hunters used to!'[paragraph break]He grabs the signpost and tears it out of the ground effortlessly. The wooden pole of the signpost has a very pointy end. Uh oh".


Section - Hadrian cows the receptionist

Report Hadrian going to Lobby for the first time:
	say "[receptionist cowed]." instead.
	
To say receptionist cowed:
	say "The receptionist sees the souped-up Hadrian charge through the doors, and immediately sits up straight and looks extremely busy and focused";
	now the receptionist is cowed.
	
	
Section - Hadrian threatens the manager

Report Hadrian going to Office for the first time:
	say "[manager flees event]." instead.
	
To say manager flees event:
	say "Hadrian storms in and pulls the manager aside. 'When I'm done with this one, we need to have a little talk about your hiring policies,' he hisses. He lets her go and returns to chasing you. You see the manager very quietly slink out of the door";
	now the manager is in Backstage.


Section - Hadrian can't be directly attacked

The block attacking rule does nothing when the noun is Hadrian.

Check attacking Hadrian:
	if Prologue has not ended:
		say "Yes, good idea! But you don't think you can throw anything far enough from back here. You should have brought a crossbow or something." instead;
	otherwise if Confrontation has not ended:
		say "[italic type][bracket]You should be in a conversation tree right now! If you can see this, a bug has happened, and you should let the author know. There should be options to just attack Hade available in conversation.[bracket][roman type]" instead;
	otherwise if Fight has ended:
		say "You stamp on his dust like a kid jumping into a leaf pile." instead.
		
Carry out attacking Hadrian:
	if Hadrian is holy-safe:
		say "[one of]You charge at Hadrian, and land a blow on his skull. It's like punching a statue. Hade swats you away. 'Idiot!' he gloats. 'My body is powerful, and my mind is absolutely focused!'[or]Your fists bounce off Hadrian again, and he guffaws. You need to think of something smarter! He can't be invulnerable to [italic type]everything[roman type], can he?[stopping]";
	otherwise:
		say "[one of]This looks like your chance! As Hadrian glances at the holy symbols, you catch him by surprise with a big right hook. He collapses to the ground...[paragraph break]And then springs up again! 'You idiot!' he gasps. 'You can't hurt me that easily!' Maybe not, but he's definitely not as tough or focused as he was outside this room. Now's the time to exploit his weaknesses![or]Hadrian sees you coming in for the attack this time, and he just starts to brace himself and protect his chest before your fist connects. You send him reeling, but he collects himself before you can capitalise. Damn it, the holy symbols aren't quite enough. Nearly, but not quite. How can you [italic type]really[roman type] hurt him?[or]You land another blow on Hadrian. Again, he seems to instinctively guard his chest...[stopping]".
	

Section - Hadrian must be staked

[Staking rule is carried out in the Staking It With section, and controls the underlying code. This chapter is the story text that points the player towards the correct solution]

Check staking Hadrian with the umbrella:
	if Fight is happening:
		if the location of the player is sunlit:
			say "Great idea! But it would be better to try it indoors, where the sunlight can't hurt you." instead.

Report staking Hadrian with:
	if Hadrian is not staked:
		if Prologue has not ended:
			say "All the way from back here? You guess you could use the umbrella as a javelin, but you need that umbrella to live.";
		otherwise:
			say "[one of]You line [the second noun] up with the scars on Hadrian's chest, and a look of terror crosses his face as you [italic type]thrust-[roman type][paragraph break]Quick as a whip, his arm catches your [second noun], inches from his heart! You twist free just as his other arm swipes at you. '[italic type]Don't you ever try that again![roman type]' he screams at you. Sounds like you should try that again sometime[or]You line up your [second noun] with his heart again, but Hade is expecting it now. He's too focused for you to get a good staking in[stopping].";
	otherwise:
		if Fight has ended:
			say "You stab [the second noun] into his dust a few more times for good measure.";
		otherwise:
			say "Hadrian is too distracted by the symbols, and notices your advance too late! You plunge [the second noun] into his heart![paragraph break]A banshee wail escapes his lips. His body starts to crumble and crumple, like a balloon losing its air. Holes open up in his skin, and dust pours out. He tries to say something, maybe a curse, but it's too late, his throat has opened up and all you hear is a wheeze. His eyes sink inwards. Something crackles.[paragraph break]It's over in about a minute. All that remains is a pile of dust[note hade-death].";

			
Section - Check biting Hadrian

Check biting Hadrian:
	if Prologue has not ended:
		say "Ew, no. Previously-sucked blood never tastes good." instead;
	otherwise if Fight has not ended:
		say "You might shatter your fangs on Hadrian's hard body! Anyway, blood sucked from a vampire always tastes so [italic type]used[roman type][one of][or]. There must be a better way to hurt him[stopping]." instead;
	otherwise:
		say "You gingerly sink a fang into Hadrian's remains. Tastes like dust." instead.
			
Section - Other fun things to do with Hadrian

Check fixing Hadrian:
	if Hadrian is staked:
		say "Hahahahaha like hell you will." instead.
		
Instead of pulling Hadrian:
	try taking Hadrian.
	
Instead of taking Hadrian:
	if Hadrian is not staked:
		say "No, no, it's not a romantic kind of hate where you date at the end. You just really hate the guy.";
	otherwise:
		say "Take his ashes and scatter them into a river, or perhaps from a cropduster? An excellent idea! But your work's not done yet. Moonlite first, [italic type]then[roman type] desecrate his remains.".

Instead of pushing Hadrian:
	if Prologue has not ended:
		say "Rush the stage and push Hadrian off? An excellent idea! But you're too far back to manage it. Too many bodies in the way.";
	otherwise if Fight has not ended:
		say "You give Hadrian the strongest shove you can muster. It hurts your arms more than it hurts Hadrian - he doesn't even flinch!";
	otherwise:
		say "You spread his dust around a bit like you're cultivating a zen garden. Very soothing."
		
The block kissing rule does nothing when the noun is Hadrian.

Check kissing Hadrian:
	if Fight has not ended:
		say "No, it's not a romance. There's no will-they-or-won't-they. It's 100% they-won't.";
	otherwise:
		say "You kiss Hadrian's remains goodnight, and then spend a minute hocking up all the dust you accidentally inhaled."
		
Before biting the blood bag in the presence of Hadrian:
	if the blood bag is moist:
		if Fight is happening:
			if Hadrian is holy-safe:
				now the blood bag is dry;
				say "'What's that you got there? A snack? I want it!' Hadrian tries to swipe the bag from you! The two of you squabble over it. The bag gets torn! All the beautiful blood sloshes out! Can't you have anything nice with Hadrian about??" instead;
				
Report smelling Hadrian:
	if Endgame is happening:
		say "The heady stink of crumbled flesh mingles with overtones of overpriced cologne." instead;
	otherwise:
		say "[if Prologue is happening]Even from back here, y[otherwise]Y[end if]ou can smell the grody expensive cologne that Hadrian uses to mask the smell of rot. You'd prefer the rot." instead.
		
Check showing to Hadrian:
	if Endgame is happening:
		say "His remains don't seem interested." instead;
	otherwise if Fight is happening:
		say "He ignores [the noun] and continues [if Hadrian is holy-safe]fighting you[otherwise]staring into the distance[end if]!" instead;
	otherwise:
		say "You don't want Hadrian to spot you right now!" instead.

Check showing the blood bag to Hadrian:
	if Fight is happening:
		if the blood bag is moist:
			if Hadrian is holy-safe:
				try biting the blood bag instead.
				
Check inserting Hadrian into the blood bag:
	if Hadrian is staked:
		say "You try to scoop him in, but you just end up scattering him around the room a little more." instead;
	otherwise:
		say "It's a blood bag, not a body bag." instead.

Check showing the umbrella to Hadrian:
	if Fight is happening:
		say "'Umbrellas are for idiots, Nero! [italic type]Real[roman type] vampires use factor 300 sunblock!' taunts Hadrian. His eyes flicker to the umbrella's wooden tip for a split second." instead.
		
Check waking Hadrian:
	if Hadrian is staked:
		say "You shall not wake him up, unless by 'wake Hadrian' you mean 'organise his wake and then not invite anyone so that nobody turns up,' in which case, what a wonderful idea." instead;
	otherwise if Fight is happening:
		say "You try clapping loudly and clicking your fingers in front of his face, but [if Hadrian is holy-exposed]he's riveted by the symbols[otherwise]he won't be roused from his murderous rampage[end if]." instead;
	otherwise:
		say "You yell to wake him from his delusions of grandeur, but the crowd shushes you down." instead.
		
Check turning Hadrian:
	if the player's command includes "turn":
		say "Someone got there before you, like, 800 years ago." instead;
	otherwise:
		if Hadrian is staked:
			say "You swirl his dust around a bit. Maybe if someone resurrects him his legs and arms will have switched places." instead;
		otherwise:
			say "You tried that once before as a prank. Turns out he has a great sense of balance[if Fight is happening]. Probably even better now that he has superpowers[end if]." instead.
			
Check squeezing Hadrian:
	if Hadrian is staked:
		say "You scrunch his dust up. He doesn't reciprocate." instead;
	otherwise if Fight is happening:
		if Hadrian is holy-safe:
			say "If you try that, it will be [i]him[/i] squeezing [i]you[/i]." instead;
		otherwise:
			say "You're in no mood to console him. You've got your own baggage to attend to." instead;
	otherwise:
		say "Lock him in a bearhug and crush his ribs? An excellent idea. Shame you're all the way back here behind a packed crowd." instead.

Check burning Hadrian:
	if Hadrian is staked:
		say "Looks like he already burned!" instead;
	otherwise if Fight is happening:
		say "You don't have your lighter, and he looks pretty fire-resistant at this point anyway." instead;
	otherwise:
		say "Oh, you plan to." instead.
		
Check cutting Hadrian:
	if Hadrian is staked:
		say "You can't reduce him to any more pieces than he's already in." instead;
	otherwise if Fight is happening:
		say "You don't have your sword, and he looks pretty knife-proof at this point anyway." instead;
	otherwise:
		try burning Hadrian instead.
		
Check rubbing Hadrian:
	if Hadrian is staked:
		say "You push the dust around a little, but if you wanted to clean this up you'd really need a dustpan, a brush and a bin." instead.
		
Check buying Hadrian:
	if Hadrian is staked:
		say "They'd have to pay you to take him away." instead;
	otherwise:
		say "You don't buy anything Hade says these days." instead.


Book - Out of World

Part - Backstage

Backstage is a room.

Description of Backstage is "This room is a holding area for things which come and go during the game. I made this before I learned that you can just say 'now the thing is nowhere'. If you are here as a player, either you're doing your own testing or something has gone seriously wrong. Please let me know if it's the latter!"


VOLUME - SCENES

Book - Prologue

Part - When play begins

When play begins (this is the intro text rule):
	say "Look at him up there. Strutting up and down the stage like he owns the place, which he does. The whole crowd gazing at him, worshipping him. Never mind that he's a vampire, never mind that they're all so much blood to him - he's rich, he's famous, but he likes nerdy things and he smiles a lot, so he must be just like them![paragraph break]Bastard. That should be [italic type]you[roman type] up there."
	
[*IDEA: this sucks]

Part - Start of Prologue

Prologue is a scene. Prologue begins when play begins.
	
	
Part - Hadrian's speech during Prologue

[iterating through scene events code credit: Emily Short and Graham Nelson, Inform 7 documentation, example 160]

Every turn during Prologue (this is the iterate through prologue rule):
	repeat through Table of Prologue Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.
		
The iterate through prologue rule is listed last in the every turn rules.
[this prevents the prologue cutscene interrupting the sunlight exposure rules]

After looking for the first time (this is the prologue event zero rule):
	say "[PrologueEvent0]".
[this allows Hade to begin his sppech immediately]
		
Table of Prologue Events
event
"[PrologueEvent1]"
"[PrologueEvent2]"
"[PrologueEvent3]"
"[PrologueEvent4]"

[*TODO: Write this bit]

Moonlite-revealed-to-crowd-flag is a truth state that varies. Moonlite-revealed-to-crowd-flag is false.

To say PrologueEvent0:
	say "Hadrian is in the middle of a speech. He's been going for about ten minutes, but he seems to be building up to something. '...Hydrological energy needs you to live next to a big enough river. Solar and wind power need you to have the right kind of weather. Geothermal power needs you to live on top of a volcano. Sustainable energy simply does not work for everybody.'".
	
To say PrologueEvent1:
	say "'Clearly, the world needs a new solution. A sustainable source of clean energy which is absolutely reliable, no matter who you are or where you are.' While he rambles, you shift your umbrella to your other arm, and daydream about the snack you're carrying.[no line break]".
	
[this last line was added two days before the deadline, after a Jason Dyer post on Renga in Blue noted in passing that novice players of interactive fiction get stuck in places that the authors don't expect. One example he gave was that designers take it for granted that players will take inventory at the start of the game and see what their character is carrying, but novice players may not have picked up this habit yet. And that made me realise that I don't actually tell the player very early that Nero has an umbrella and a bag of blood. So here's a really quick fix for that potential issue.]
	
To say PrologueEvent2:
	say "'My friends,' says Hadrian with a wink, 'I present to you the Moonlite.' And he whisks the cover off the screen next to him, revealing a picture of... something? Some kind of a machine?[no line break]";
	now moonlite-revealed-to-crowd-flag is true.
	
To say PrologueEvent3:
	say "The crowd oohs at the screen. 'The Moonlite!' says Hadrian, gloating. 'A fission reactor which will work anywhere, for anyone! Clean energy, for anyone! And it's completely safe. Forget uranium, forget plutonium - all that's needed is harmless helium.'[no line break]".
	
[To say PrologueEvent4:
	say "'We're still in the development stage, of course. We have a working prototype in our engineering laboratory, but we won't enter production until it's perfect. We'll be announcing more in the coming months. Take care.' And Hadrian turns and leaves abruptly, leaving a pool of reporters shouting questions after him. The crowd disperses, the stage is dismantled, and you're standing in the middle of the bustle, fuming.

	You are Nero Brashov, former nobleman, former businessman, now bereft of everything, just because of a few failed startups and lawsuits. You know Hadrian Alba well enough to know what kind of person he really is. His success is nothing but luck and schmooze. Is that the right word? Schmoozing? Schmoozery? Anyway, he sucks. Why should he have all the wealth and success, purely by chance, while you're reduced to stealing from blood banks and sleeping in your hearse?

	And now he's going to become a hero because of his stupid Moonlite thing? He never cared about sustainable energy when [italic type]you[roman type] knew him. You ought to go in there and destroy the thing. Don't let him whitewash himself. Get sweet revenge.

	And that's exactly what you'll do, as soon as you're invited in[if the player is exposed]. And once you stop yourself burning to death in the sunlight, of course[end if].[no line break]".]
	
To say PrologueEvent4:
	say "'We're still in the development stage, of course. We have a working prototype in our engineering laboratory, but we won't enter production until it's perfect. We'll be announcing more in the coming months. Take care.' And Hadrian turns and leaves abruptly, leaving a pool of reporters shouting questions after him. The crowd disperses, the stage is dismantled, and you're standing in the middle of the bustle, fuming.

	You are Nero Brashov, former nobleman, current vampire, and temporarily-embarassed businessman. You have learned that humans don't like vampires very much... unless you happen to be rich and charismatic. Oh yes, the mortal world will line up to worship Hadrian Alba! You know what kind of person he really is, and you know it's all luck and lies that got him to the top, but that doesn't matter to anyone else, oh no.

	And you? Victim of rotten luck, reduced to stealing from blood banks and sleeping in your hearse, just because of a handful of failed startups and lawsuits and bankruptcies? Why should you accept that, and watch Hadrian be hailed as a hero because of his stupid Moonlite thing? It's not like he ever cared about sustainable energy when [italic type]you[roman type] knew him.

	Well, you've got your own plan. You're going to go in there and find this Moonlite. And you're going to destroy it. Don't let Hadrian be the bigger man. Get sweet revenge.

	And you'll put your grand plan into motion just as soon as you're invited in[if the player is exposed].[paragraph break]And you should also do something about how you're burning to death, while you're at it[end if].[no line break]".

Report listening during Prologue:
	say "Hadrian's voice cuts across all other sounds." instead.
	
Part - Movement is restricted during Prologue
	
Instead of going during Prologue:
	say "No, you have to hear what Hadrian has to say. You can't hate him properly if you're not constantly paying attention to him."
	
Part - Ending Prologue
	
Prologue ends when the number of filled rows in the Table of Prologue Events is 0.

Prologue-ended-flag is a truth state that varies. Prologue-ended-flag is false.
	
When Prologue ends:
	move Hadrian to Backstage;
	move the screen to Backstage;
	move the crowd to Backstage;
	move the stageWorkers to CampusEntrance;
	now prologue-ended-flag is true;
	try looking.

Book - PhoneCall

PhoneCall is a scene. PhoneCall begins when the player is in InPhoneBooth.

PhoneCall ends when the player is not in InPhoneBooth.

[*TODO: Scene should be ended within the phone conversation]



Book - Interview

Part - Start of Interview

Interview is a scene. Interview begins when interview-scene-flag is true.
[interview-scene-flag is defined and triggered in the conversation with the manager]

When Interview begins:
	now the litany of the manager is the Table of Interview Conversation;
	now the greeting of the manager is int_greeting;
	move the player to PrayerRoom;
	move the manager to PrayerRoom;
	try talking to the manager.
	
Part - Restricting actions during Interview

Instead of going during Interview:
	say "Much as you want to leave, you'd better see the interview through. (Is this how your employees felt during their interviews?)".
[*TODO: because this text won't display (overruled by QBC + my code forcing conversation), maybe swap QBC default text with this for interview scene]
	
Part - Ending Interview

Interview ends when employed-flag is true.
[employed-flag is defined and triggered in the job interview]

When Interview ends:
	prepare the new manager conversation;
	move the manager to Office;
	move the old computer to Office;
	say "Five minutes later, you've been shown to your new desk, on which is a very old computer. You'll be handling online customer enquiries for your first shift, you've been told. Around you, other workers are being yelled at over the phone, or doing something clerical with a spreadsheet, or some other boring task.[paragraph break]The interviewer - your new manager - comes back with something on a lanyard. 'Here's your ID card, hot off the presses,' she says, as you slip it around your neck. 'You're supposed to wear your card at all times. You don't really need it unless you're going to high-security areas, but you'd need to be properly authorised anyway, so don't worry about it. Talk to me if you need anything!' And she's gone again.[paragraph break]Of course, now that you're officially allowed on the Lunarcel campus, you have no intention of doing any work. You are going to find Hadrian's precious Moonlite machine and destroy it. As soon as you find it, that is.";
	now the player wears the ID card;
	move the player to Office.

	
Part - Restricting movement across employee-only thresholds until after Interview

EmployeesOnly is a region. CampusEast, Lobby and PrayerRoom are in EmployeesOnly.

Instead of going to EmployeesOnly when Interview has not happened:
	say "You've only been invited to the customer service office for your interview. You don't yet have the freedom to explore more of the place."


Book - Confrontation

Confrontation is a scene. Confrontation begins when the player is in Engineering.

When Confrontation begins:
	move Hadrian to Engineering;
	try talking to Hadrian.

Confrontation ends when fight-flag is true.

When Confrontation ends:
	move the engineers to Backstage;
	say "Something explodes in the machine. Engineers around the lab panic and dive for cover. The glass bulb fills with incandescent light, forming a beam pointed directly at Hadrian.[paragraph break]Squinting, you see Hade's shape... change. You can see his silhouette grow, and hear the sound of ripping fabric.[paragraph break]Soon, the machine powers down. You open your eyes fully.[paragraph break]Hadrian is now the size and shape of a comic book superhero. His newfound absurd muscles have torn through his suit, revealing a scarred chest and perfect pectorals. He shines brilliantly. And his fingers have lengthened to evil talons.[paragraph break]The engineers around the room sense a change in the atmosphere, and leave the room swiftly. Hadrian grins and advances on you[note hade-final-fight]."

Book - Fight

Fight is a scene. Fight begins when Confrontation ends.

[During Fight, Hadrian chases the player. This is currently defined under Hadrian's code blocks]

Fight ends when Hadrian is staked.

Book - Endgame

Endgame is a scene. Endgame begins when Fight ends.

When Endgame begins:
	set up the endgame receptionist conversation;
	now the cupboard is closed;
	now the player is holy-safe;
	say "He could be back soon. He could be resurrected tonight, if someone loves him enough. You need to act now, while the Moonlite is unprotected. You've seen what it does. Power is good, but that much power? You've seen how Hade treats people - how you treat people - even fettered by weaknesses. But unfettered? No, the right thing to do would be-[paragraph break]You blink, and close the cupboard. All shameful thoughts flee your mind. Ah, that feels better. Now let's grab that Moonlite[note endings].".
	
 
Part - Winning the Game

[The game is won when the Moonlite is either switched on or broken. These endings are defined under the Moonlite's code block.]

Chapter - Amusing the player

Rule for amusing a victorious player: say "[amusing matter]".

To say amusing matter:
	say "[line break][bold type]Have you tried...[roman type][paragraph break]* biting yourself?[line break]* biting people? during the fight with Hadrian? after the fight?[line break]* biting the blood bag? during the fight with Hadrian?[line break]* closing your umbrella outside and waiting? during Hadrian's speech? in front of the janitor? during the fight with Hadrian?[line break]* hypnotising someone? something? (try >HYPNOTIZE _____ or similar verbs)[line break]* kissing someone? Hadrian? yourself?[line break]* cursing?[line break]* beating E4M2 of [italic type]The Ultimate Doom[roman type], 'Perfect Hatred', on Ultra-Violence from a pistol start?[line break]* leading Hadrian to the receptionist during the fight?[line break]* calling the emergency services? during the fight with Hadrian?[line break]* fleeing the campus during the fight with Hadrian? (try going south from the Campus Entrance)[line break]* using the receptionist's computer? after biting him?".
	



VOLUME - HELP

Book - Extra help commands

Understand "credit" and "credits" as asking for help.

Book - Main Help Menu

The help request rule is not listed in any rulebook.

Carry out asking for help:
	now the current menu is the Table of the Main Help Menu;
	carry out the displaying activity;
	clear the screen;
	try looking;
	stop the action.
	
Table of the Main Help Menu
title	subtable	description	toggle
"How to play interactive fiction"	Table of Instruction Options	--	--
"How to play [story title]"	--	"[How to play Vampire Ltd]"	--
"About [story title] (including credits)"	--	"[About Vampire Ltd]"	--
"Changelog"	--	"[Changelog]"	--
"Developer commentary"	--	"[Developer commentary help]"	--
"Hints"	Table of Hints	--	--

Book - How to play interactive fiction

[This uses the default instructional text built into Emily Short's Basic Help Menu, probably written by her in the first place]

Book - How to play Vampire Ltd

To say How to play Vampire Ltd:
	say "Thanks you for playing Vampire Ltd!

This is a standard parser-based interactive fiction. Many common verbs in text adventures will be recognised here. However, you should be aware of the following:

1) This game uses LucasArts-style conversation trees. Start conversations by typing TALK TO ALICE, or T ALICE for short. You'll be prompted to choose dialogue from a numbered list by typing the number of the choice you want to make. You'll be unable to move or take other actions until you choose a 'goodbye' prompt, although you can still look at things. (There may be some conversations you won't be able to leave at first!) This means that ASK/TELL ALICE ABOUT X won't work in this game. But SHOW/GIVE X TO ALICE might work. (SHOW and GIVE are treated as the same action in this game.)

2) Extra verbs in this game include BITE (for being a vampire), USE (for computers specifically), and TYPE (for inputting a word or phrase into computers), plus synonyms for these. There may be other non-standard verbs available.

3) Vampire Ltd is not intended to be a cruel game. There is a way for the player to die, but it should be clear when it is about to happen, it should only take one move to avoid, and the player can undo out of a death state. It should never be possible for the game to become unwinnable. If you have found an unwinnable state, this is a bug - please let me know about it!"

Book - About Vampire Ltd (including credits)

To say About Vampire Ltd:
	say "[b]ABOUT:[/b][line break]Vampire Ltd is a game by Alex Harby (alexjharby@gmail.com, @wisprabbit on Twitter, comfortcastle on itch.io and IFDb).[line break]This is version 4, the probably-final version, which adds developer commentary and fixes one or two things.

Vampire Ltd was an entrant in the 26th Annual Interactive Fiction Competition (IFComp 2020), where it finished 13th out of 103 entries.

[b]CREDITS:[/b][line break]Written by Alex Harby.[paragraph break]Made using Inform 7 by Graham Nelson, via the Inform 7 Windows IDE by David Kinder.[line break]Includes the Reactable Quips and Quip-Based Conversation extensions by Michael Martin (using versions updated for Inform 7 build 6M62 by Melvin Rangasamy), the Basic Help Menu extension by Emily Short (including her instructions for new players), and the Footnotes extension by Stephen Granade.[paragraph break]Borrows from example code written by Graham Nelson, Emily Short, Jim Aikin and Melvin Rangasamy (annotated in the source code as appropriate).[paragraph break]Beta-tested by AKheon, Christopher Merriner, Dark Star, Mathbrush, Mike Russo and Peter M. J. Gross. Many thanks to all of them.[paragraph break]Thanks to Mike Sousa, Stian and Patrick Mooney for sending transcripts of the IFComp version over for bugfixing. Thanks to ClubFloyd for their playthrough which revealed a couple of errors. Apologies to the IFComp judges whose transcripts I forgot to download before the competition closed. Any remaining errors in this game are my own fault.[paragraph break]Thanks to Dannii Willis and the IFComp organisers for technical support during IFComp 2020. Thanks to everyone who reviewed the game during the comp. I really needed the positive feedback sometimes.[paragraph break]I am indebted to Taika Waititi and Jermaine Clement's [i]What We Do In The Shadows[/i] and Abigail Corfman's [i]16 Ways to Kill a Vampire at McDonalds[/i], and hope I haven't stolen any of their jokes.".

[
NOTE FOR TESTERS:[line break]Thank you for your help! It's very much appreciated! Typing comments in the command line is encouraged if you're providing a transcript - please preface comments with a * so that I can find them more easily (e.g. '>* this verb doesn't work properly' or '>* this sentence has a typo'). Comments about anything, from programming errors to design concerns to pointing out typos, are welcome!
]

Book - Changelog
	
To say Changelog:
	say "[b]CHANGELOG:[roman type][line break]Version 4 - Post-comp release. Added developer commentary. Fixed bugs with inappropriate responses (Nero no longer turns away from computers when biting things, for example). Added synonyms for computer usage, as well as a few new verbs and synonyms for specific scenarios. Added more custom responses to default Inform 7 verbs. Fixed whatever dumb bug made this changelog appear entirely in bold text. Fixed typos; introduced new typos.[paragraph break]Version 3.1 - Released with an updated Parchment interpreter to bring the game's presentation in line with other IFComp entries and (hopefully) fix an issue with Firefox where the browser version of the game would lose focus during a 'More' prompt. Updated the in-game blurb to match the IFComp blurb. Added this changelog. No changes to the game code or story (intentionally!) introduced.[paragraph break]Version 3 - First public release. Fixed a few remaining bugs from Version 1 testing.[paragraph break]Version 2 - Second testing release. Fixed many bugs and oversights found by beta-testers, including a game-breaking bug related to opening the cupboard, missing synonyms, poor or misleading hinting, and typos. Added an AMUSING menu.[paragraph break]Version 1 - First testing release. Wrote the game."

Book - Developer Commentary Help

To say Developer commentary help:
	say "[bold type]DEVELOPER COMMENTARY:[roman type][line break]This post-IFComp release of [i]Vampire Ltd[/i] includes developer commentary! To activate it, type NOTES ON at any time. (NOTES OFF will switch it off again.)

With developer commentary enabled, you will see numbers in square brackets appear in the text as you play the game. Type NOTE [bracket]number[close bracket] (e.g. NOTE 1) to read some relevant background information about the development of the game. (To verify that commentary is on, try EXAMINE ME or X ME after switching it on. You should see a number appear after Nero's description of himself.)

These comments assume you've beaten the game before, so if you want a spoiler-free experience, please don't switch on the commentary until after your first playthrough!

By the way, this dev commentary is powered by Stephen Granade's Footnotes extension, and inspired by Granade's commentary in his game [i]Child's Play[/i].".



Book - Hints

Table of Hints
title	subtable	description	toggle
"How to use these hints"	--	"[How to use hints]"	--
"Getting onto the campus"	Table of Getting Onto Campus Hints	--	--
"Getting onto more of the campus"	Table of Getting Onto More Campus Hints	--	--
"Getting to the Moonlite"	Table of Getting Into the Lab Hints	--	--
"Endgame"	Table of Endgame Hints	--	--

Part - How to use these hints

To say How to use hints:
	say "These hints work like invisiclues. Find the puzzle you need help with and press H to reveal the list of hints one hint at a time. This lets you get only the help you need without spoiling the whole puzzle immediately. There are no prizes for getting through the game without help, so use these hints as much or as little as you like!"

Part - Getting Onto Campus Hints

Table of Getting Onto Campus Hints
title	subtable	description	toggle
"What should I do right at the start, while Hadrian's talking?"	Table of Start Hints	""	hint toggle rule
"How do I get invited onto the campus?"	Table of Invitation Hints	""	hint toggle rule
"I am on fire! I am dying!"	Table of Sunlight Hints	""	hint toggle rule

Chapter - Table of Start Hints

Table of Start Hints
hint	used
"No need to do anything - let Hadrian talk and listen to what he has to say."	
"Some useful commands you could try are EXAMINE ME and INVENTORY."	
"You can also EXAMINE whatever's appearing on stage with Hadrian."	

Chapter - Table of Invitation Hints

Table of Invitation Hints
hint	used
"Has Hadrian left and taken his stage with him yet? If so, have another look around the room."	
"EXAMINE the BANNER that's been revealed now that the stage has gone."	
"You'll learn a phone number for job applications."	
"There's also a phone booth near you..."	
"ENTER the BOOTH to place a call. You should now have an option to call the campus to apply for a job."	
"Select that option, and you'll be able to enter the campus."	

Chapter - Table of Sunlight Hints

Table of Sunlight Hints
hint	used
"Vampires don't do well with sunlight."	
"Did you close your UMBRELLA? You should OPEN it again."	


Part - Getting Onto More Campus Hints

Table of Getting Onto More Campus Hints
title	subtable	description	toggle
"I'm on campus, but I can't explore much of it! Where do I need to go?"	Table of Exploration Hints	""	hint toggle rule
"What should I say in the interview?"	Table of Interview Hints	""	hint toggle rule
"I've been hired! What now?"	Table of Post-Job Hints	""	hint toggle rule

Chapter - Table of Exploration Hints

Table of Exploration Hints
hint	used
"Your vampiric hatred of being unwelcome has struck again! Rember, you've only been invited for one purpose."	
"You're supposed to be going to a job interview right now."	
"You were told to go to the office block on the west side of the campus."	
"From the campus entrance, head NORTH, then WEST to find the office, then NORTH again to enter it."	
"If you're in the right place, you should see a manager. TALK TO her to start the job interview."	

Chapter - Table of Interview Hints

Table of Interview Hints
hint	used
"Don't worry about this one."	
"Nero will stop himself saying anything self-destructive. Feel free to explore the conversation options."	
"If you want to go through as fast as possible, the last conversation option in each list will move on to the next question."	

Chapter - Table of Post-Job Hints

Table of Post-Job Hints
hint	used
"Remember, your object is to find and sabotage the Moonlite machine. But there are things you can explore now."	
"In the office, you should now have access to a computer. Try USE COMPUTER and see what you can do."	
"The meeting room can be revisited to the north, and can be explored now that you're not in conversation."	
"You also have access to most of the campus now. (Despite what the manager says, you're free to leave the office.)"	
"Try visiting the HQ building in the centre of the campus, and try exploring the east side."	


Part - Getting Into the Lab Hints

Table of Getting Into the Lab Hints
title	subtable	description	toggle
"Where is the Moonlite?"	Table of Moonlite Location Hints	""	hint toggle rule
"The east campus is blocked by running water. How do I get past?"	Table of Running Water Hints	""	hint toggle rule
"I have what the janitor wants, but it's empty. How can I fill it?"	Table of Raisin Hints	""	hint toggle rule
"How can I get into the engineering lab?"	Table of Authorisation Hints	""	hint toggle rule
"I'm trying to access a locked computer - what is the password?"	Table of Password Hints	""	hint toggle rule

Chapter - Table of Moonlite Location Hints

Table of Moonlite Location Hints
hint	used
"Where is it most likely to be?"	
"It's a prototype of a new device under active development on the campus."	
"There's a signpost in the centre of the campus that might tell you about the right building."	
"The Moonlite is probably being developed in the Engineering Laboratory to the east."	

Chapter - Table of Running Water Hints

Table of Running Water Hints
hint	used
"The water is coming from a leaky pipe on the wall."	
"Seems like it would be the nearby janitor's job to fix it."	
"Maybe you can negotiate with her? Even if she's on strike. (Nero doesn't seem to like that she's on strike, anyway.)"	
"TALK TO THE JANITOR - she's okay with quickly fixing the leak for you if you run an errand for her."	
"Once you've got her box of raisins for her, she'll stop the leak."	
"You may not recognise the room where she says she left her box of raisins, but you'll find it if you explore enough."	
"She says the 'prayer room' is in the offices. Try exploring in and around your office."	
"Try exploring the interview room again."	
"OPEN THE CUPBOARD in the interview room - you'll find the box there. (It's empty, but that's a different set of hints...)"	
"Once you've got a full box of raisins, TALK TO THE JANITOR again to give her the raisins."	

Chapter - Table of Raisin Hints

Table of Raisin Hints
hint	used
"This is assuming you found the box already (if not, try the hints about the running water first)."	
"The janitor won't accept the empty box. You'll need to provide your own raisins, or a substitute."	
"What are raisins? (If you don't know, try EXAMINING THE BOX.)"	
"Have you found the grapes yet? If not, try the Lobby NORTH of the centre of the campus."	
"The grapes on their own aren't good enough (they won't fit into the box). How can you turn grapes into raisins?"	
"Remember what Nero is."	
"Did you check your starting inventory? You should be carrying a bag of blood with you."	
"Try EXAMINING the bag of blood to learn why Nero has it and what he can do with it."	
"Did you try to BITE it, as the description hints? Did you notice what happened?"	
"As a vampire, you can BITE things to suck the liquid out of them. Therefore..."	
"... you can BITE THE GRAPES to dry them out and turn them into raisins."	
"Once you've done that, simply PUT THE RAISINS IN THE BOX and TALK TO THE JANITOR to give her the raisins."	

Chapter - Table of Authorisation Hints

Table of Authorisation Hints
hint	used
"This is assuming you've reached the laboratory. If not, try the running water hints first."	
"There's a locked glass door in your way. Did you notice the card reader next to it?"	
"Try to PUT THE CARD IN THE SLOT. (That is, your ID card which you were given after the job interview.)"	
"This won't work yet. But did you EXAMINE THE READER as well?"	
"'Consult a manager to check your card's authorisation'? You know a manager!"	
"TALK TO THE MANAGER - she'll tell you that only security and executives in the HQ building can alter your ID card's permissions."	
"The HQ building is the black one in the centre of the campus. Now would be a good time to explore it."	
"The receptionist there will tell you that security can't be reached at the moment. That just leaves executives..."	
"Has the receptionist pointed you to Hadrian's office yet?"	
"It's just north of the lobby. You'll find a computer there."	
"If you can access the computer, you can change your card's permissions, and then the card reader outside the lab will work!"	
"If you're having trouble accessing the computer, that's a different set of hints. Try the password hints next."	
"Once you're on the computer, you want to open the security permissions menu and toggle the permissions for 'Oren'."	
"If you've done it right, simply head back to the lab, PUT THE CARD IN THE SLOT again, and the door will unlock and let you in!"	 	

Chapter - Table of Password Hints

Table of Password Hints
hint	used
"Firstly, just to be clear, you can guess passwords with TYPE _____ or GUESS _____ when you're near Hadrian's computer."	
"You may need help from somebody else here."	
"After trying to use Hadrian's computer, you'll be able to ask the receptionist, janitor and manager about its password."	
"The janitor will mention that password security was very very weak amongst the executives at Lunarcel."	
"If that's the case, then maybe Hadrian's password is still really weak..."	
"The manager's advice is not so useful, but she'll mention an email on your computer and a list of common passwords in the office."	
"If Hadrian's password is weak, maybe the list of common passwords is a good starting point for guessing it."	
"You can brute-force the password from the list, but you can figure it out too. Did you find the email about password security yet?"	
"There are two big clues in that email: passwords are all at least seven characters, and nobody uses a number in their password."	
"This rules out all but four passwords: 'holiness,' 'letmein,' 'password' and 'sunshine.'"	
"Do you remember what else the janitor and the email said?"	
"They both said that everyone had to change their passwords recently, and the janitor said that Hadrian's password was 'password'."	
"So you can rule out 'password' as well. Three passwords left: 'holiness,' 'letmein,' and 'sunshine.'"	
"Again, you can easily brute-force this, but if you prefer to figure it out, the receptionist's clue will get you the rest of the way."	
"According to him, Hadrian struggles to remember his password until he yells at the computer - then he remembers it..."	
"Think about it another way: which of the three passwords would be most palatable to a vampire?"	
"Hadrian's password is 'letmein.' At Hadrian's computer, TYPE LETMEIN to unlock it. Now you can use it!"	

Part - Table of Endgame Hints

Table of Endgame Hints
title	subtable	description	toggle
"Hadrian is here! What should I say?"	Table of Confrontation Hints	""	hint toggle rule
"Hadrian is chasing me! How can I stop him?"	Table of Fight Hints	""	hint toggle rule
"What should I do with the Moonlite?"	Table of Moonlite Choice Hints	""	hint toggle rule

Chapter - Table of Confrontation Hints

Table of Confrontation Hints
hint	used
"Don't worry about getting this right - the game will progress whatever you say."	
"Ask Hadrian about the Moonlite if you're interested in what he's up to..."	
"...or just attack him if you want to skip past the dialogue."	

Chapter - Table of Fight Hints

Table of Fight Hints
hint	used
"Since Hadrian is doing a good job of guarding the Moonlite, you can rule out using it in any way here."	
"Have you tried fleeing? You can leave the lab and let Hadrian chase you around the campus. What he does might give you ideas."	
"Have you tried to ATTACK HADRIAN? A direct attack won't work, but it might give you more ideas."	
"Try it a couple of times, and Nero will wonder if there are any weaknesses he can exploit. Are there?"	
"Have you tried to EXAMINE HADRIAN in this state? Now that he's superpowered, maybe something is different."	
"There are a lot of scars exposed on his bare chest. Why might that be?"	
"Hadrian might be trying to use the same vampire weakness against you, if he's picked up the signpost."	 
"Have you tried to STAKE HADRIAN?"	
"You will need something to stake him with. Do you have anything that could do the trick?"	
"You've been carrying the right thing since the start of the game."	
"Have you tried to STAKE HADRIAN WITH THE UMBRELLA?"	
"This will almost work, but Hadrian is too alert. You need to distract him."	
"Is there anything on the campus which is especially disconcerting to vampires?"	
"You came across it earlier while you were working on getting to the laboratory."	
"Remember how upset Nero was when exposed to the collection of holy symbols in the prayer room?"	
"Lure Hadrian to the prayer room in the office..."	
"...OPEN THE CUPBOARD to distract Hadrian..."	
"...and then STAKE HADRIAN WITH THE UMBRELLA."	

Chapter - Table of Moonlite Choice Hints

Table of Moonlite Choice Hints
hint	used
"You won't be able to use the Moonlite until Hadrian is taken care of, so work on that first."	
"Once Hadrian is out of the picture, there are two things you can do with the Moonlite. Both lead to different winning endings."	
"For one ending, what does Nero probably want to do, now that he knows what the Moonlite does for vampires?"	
"SWITCH MOONLITE ON."	
"For the other ending, what might be a good thing to do to a machine that gives incredible power to people who'll abuse it?"	
"BREAK MOONLITE."	


VOLUME - FOOTNOTES

Book - Footnotes Extension

[Uses Footnotes by Stephen Granade, initialised along with other extensions at the top of the source code]

Book - Footnotes Setup

Footnotes are given repeatedly.

Understand "comment [number]" or "commentary [number]" as giving a footnote.

Part - New footnote responses

[There are no footnotes less than one rule response (A) is "There is no note with a number less than 1.".]
[dummied out because it doesn't work - I think the problem is the name of the rule, which Inform thinks is me declaring an object or property?]

Standard giving a footnote rule response (B) is "BUG: there is no comment content assigned here! If you can read this in-game, please let me know where the missing note is!".
Standard giving a footnote rule response (C) is "There is no comment available with that number."

Standard report turning on footnotes rule response (A) is "Developer commentary is now on! Type NOTE [bracket]number[close bracket] whenever you see a number in square brackets to read that note.".
Can't turn on footnotes if they're already on rule response (A) is "Developer commentary is already on.".

Standard report turning off footnotes rule response (A) is "Okay, developer commentary is now off.".
Can't turn off footnotes if they're already off rule response (A) is "Developer commentary is already off.".

Standard report giving the footnote state rule response (A) is "Developer commentary is currently [if footnotes are on]on[else]off[end if]."

Book - Table of Footnotes

Table of Footnotes (continued)
Name	Note
arithmomania	"I think this is the only place that the vampire obsession with counting turns up. One rejected idea for the Hadrian fight was to scatter a bag of ball bearings in front of him - he would have used his superpowered counting skills to count the bearings in a mere 2-3 turns, thus buying you time to do something else. But I couldn't work the counting thing into the game elsewhere, and I couldn't think of a reason why Nero wouldn't also be forced to count the bearings."
bite-me	"I made this joke in [i]Vampire Time[/i]. I'll make it again the next time I write something about vampires. 'Urât' translates to something like 'nasty' or 'hateful' in Romanian - the idea of a vampire called Count Nasty tickles me. I also like how Nero seems to misremember the rumour slightly, as if old Count Urât had ALL his ribs removed. The world's easiest vampire to stake."
bite-grapes	"Small gamedev tip: be careful not to make misleading hints. A testing build of [i]Vampire Ltd[/i] had a joke about Nero not drinking... [italic type]wine[roman type]... or even eating anything close to... [italic type]wine[roman type]. I forgot that grapes are close to wine. Sorry, testers."
blood-bag	"The blood bag exists in order to hint at the solution to the grapes puzzle, as well as to give the player something else to bite. I wish I had found more sensible opportunities to use biting in this game. The blood bag is completely optional, and the grapes puzzle feels very contrived to me. I had some idea about using your teeth to puncture things, but it never came about. I think the plan was to bless the water in a water tank, then bite a hole in it to create a stream of running holy water to block Hadrian's path."
blood-bag-insertion	"The real reason you can't put things in the bag, of course, is that I forgot to code it in the earlier releases. This response has been added in this post-comp release, alongside a few other responses related to the bag. I don't want to re-implement the blood bag as a container at this point because it might futz with other game logic such as the raisins puzzle, and also because it sounds too much like hard work."
blood-testing	"There aren't many direct references to real-world capitalist scandals in this game, but the blood testing idea is lifted directly from the story of Theranos, a startup claiming to offer blood testing kits at home which gathered millions of dollars of investment capital before their claims were shown to be false. Whereas Theranos' kits supposedly required only a tiny amount of blood to work, Nero was presumably asking for sacks of blood to be mailed to him directly, which is probably why he wasn't as successful.[paragraph break]An earlier outline of [i]Vampire Ltd[/i] had Nero trying to hawk a machine that automatically extracted eggs from their shells. Here I was trying to invent something as useless as the Juicero Press, a $700 gadget for pressing juice out of Juicero-brand bags of fruit which was less efficient than just squeezing the bags yourself. (Juicero didn't succeed either.) The common thread in Nero's ideas is that they're too stupid even for tech investors; he does not have the subtlety of Hadrian in selling self-serving ideas to other people."
box-initial	"Clearly, somebody ate the janitor's raisins and tossed the box back into the cupboard. I don't know who did it. It's a mystery for the ages, like who killed the chauffeur in [i]The Big Sleep[/i]."
brashov-name	"Vampire names here are taken from Romanian place names, for as much Transylvanian flavour as possible. Brashov and Alba are towns in Romania; Nero and Hadrian are Roman emperor names, which are apparently a popular naming convention in Romania. I regret doing this, actually, because I don't know very much about Romania or Transylvania and it's sort of disrespectful to plunder their culture to name awful characters, but the names stuck. Nero in particular is an appropriate name for an unpleasant character whose business empire has collapsed around them, and I can't imagine Nero being called anything else at this point."
check-biting	"Try biting people at the end of the game after Hadrian is gone."
check-staking-not-vampire	"This message occurs whenever the thing you're trying to stake isn't a vampire, even if it's another person. I suppose I should fix this, but I think I like it. I like the implication that Nero thinks that, say, janitors can't be killed with a stake through the heart."
check-staking-with-nero	"Although I do like the idea of Nero launching himself into things like Roman Reigns to try to stake them."
compass-directions	"The only directions necessary in this game are north, south, east and west (although in and out can be used sometimes). I stuck to the cardinal directions to simplify the game world as much as possible. I wanted the game to flow pretty smoothly, and having a map that's difficult to remember can be an obstacle to that. Complex maps can be great for puzzly games where you want to test the player's understanding of space, but [i]Vampire Ltd[/i] isn't that kind of game."
cupboard-curtain	"The cupboard was originally a curtain, and the holy symbols were arranged on the wall behind it. There's still a dummied-out verb in the source code, 'draw', which would let you draw the curtain open and closed (and give you some funny response about needing a pencil if you tried to draw anything else). But then I did some research, and realised that no multifaith space would do that. I also realised that to formalise the room as a prayer room would imply that Hade knows about it and sanctions it, and THAT doesn't make sense either. The prayer room had to be a lot more secretive, and so hiding the religious equipment in a stationery cupboard instead of affixing it to the wall seemed a better way to go."
cupboard-thank-god	"I know I said in one of these other notes that I tried to take a very inclusive view of religion, so invoking a singular monotheistic God here is a mistake. But this line still makes me laugh, so it stays."
door-destruction	"Apart from the visual gag of Hadrian walking through the glass pane like Jack Baker walking through the wall in [i]Resident Evil 7[/i], destroying this door serves a practical purpose. It removes the edge case where the player drops the ID card in the lab, leaves, and locks themselves out of the lab forever. Actually, the door isn't destroyed - instead, it's set to be permanently open, unlocked and uncloseable, and all the relevant text is changed to tell the player that the door is destroyed. It's still there, you just can't use it as a door anymore."
endings	"There are two game-winning moves: break the Moonlite, or switch on the Moonlite. I wanted to leave it up to the player whether Nero has learned anything from the game; that is, whether being confronted with the power inequalities of corporate capitalism has affected him in any way, or whether he just wants to seize power again as soon as possible. I suspect that the second option is the canon option, but a lot of Nero's uncomfortable flashbacks are aimed at setting up the first option in case the player wants a more morally-justifiable ending.[paragraph break]Since this is the last story-relevant footnote, I'll say my goodbyes here: thanks for playing [i]Vampire Ltd[/i], and thanks for reading my commentary. This is a flawed game, but I'm still proud of it. The next one will be even better."
go-south-from-entr	"One of only two ways to die in [i]Vampire Ltd[/i] is to leave the campus from here when Hadrian is chasing you. Try it! It's fun!"
grapes-puzzle	"The grapes puzzle - this seems to be the puzzle which IFComp reviewers liked the most. The solution is funny and makes good use of the player character's vampirism. But its placement is very contrived. Why is the janitor so hellbent on raisins? Because I wanted to put the grapes puzzle somewhere, and I wanted something to gate the player's progress to the laboratory, and this solves both problems at once. I don't think the grapes puzzle is worked into the storyline well enough, but I'm glad it's here as the best vampire puzzle in the game.[paragraph break]The janitor has a response for if you bring her the box on its own, the unbitten grapes on their own, or the dried grapes on their own. Coding this was hell. The game has to rebuild the conversation options whenever you start a conversation with the janitor to account for whether Nero knows about the missing raisins and what items the player is carrying. It turned out well in the end, but I won't make a conversation tree like this again if I can help it."
had-greeting	"This is a big and unpleasant conversation between two surly people which has a lot of info-dumping in it, which is why you can skip it by using the 'attack Hade' options."
had-reveal-investors	"All the Romanian names here are various possible translations of 'nasty'. That third one could translate to Loathsome the Loathsome. Baroness Neplacut's name was originally 'Neplăcut.' If that shows up with a question mark for you, that's why it was changed. It's supposed to be an A-breve, an a with a little u-shape above it. Maybe Count Urât has the same problem for some people, but you know what, maybe his name is just spelled like that.[paragraph break]I've tried to avoid having a lot of vampire fiction references here, but La Mircil is probably another incarnation of Carmilla. As for Big Red Peavis, I have no idea what their deal is, but they sound like fun. The name comes from a [i]Cul de Sac[/i] comic where Petey gets a red soccer shirt with his name misspelled, and his mom helpfully suggests that 'Big Red Pevey' could be his sporting secret identity."
had-reveal-science-crunch	"Inspired by the many horror stories of crunch in the videogame industry. Since I wrote this line, [i]Cyberpunk 2077[/i] came out after a period of intense crunch, and wasn't very good."
hade-death	"On reflection, maybe I went too hard here."
hade-desc	"Hadrian is supposed to be Nero with social skills. Filtered through Nero's eyes, Hadrian looks like an unbearably smug prick, but I think he probably does have [i]some[/i] charisma. He's named after Hadrian the Roman emperor, mirroring Nero's name. I don't remember if the choice of Hadrian had any meaning - I think I just liked the sound of it. Also I suppose there's the similarity between Hade and Hades. This isn't a subtle game.[paragraph break]Reading through my source code again, it looks like you can refer to Hadrian as 'fangs'. You can do that with yourself (Nero) too. This is left over from an attempt to implement fangs as an interactable body part for every vampire. But body parts are a lot harder to do in Inform 7 than I was prepared for. If you're not careful, your players will be able to detach their own body parts and throw them around. (See the infamous pornographic text adventure [i]The Incredible Erotic Adventures of Stiffy Makane[/i], in which Stiffy can dispose of a body part that he would probably really rather stay attached to him.)"
hade-final-fight	"I'm very happy with the final fight with Hadrian. I like how it changes the game world as Hadrian interacts with it, and I like that the solution is integrated into what's come before. You can kite Hadrian around to side areas to get some more reactions - try taking him to see the receptionist, for example, or try using the phone booth while he's fighting you.[paragraph break]In my early drafts, the fight was a lot more complex. The whole fight would have taken place in the lab, which would have been made of a lot more rooms, and you would have had to hit him with many different weaknesses all at once. (For example, I had some idea of using silver cutlery to electroplate your umbrella with silver to make it even more potent.) I'm glad I simplified it because it makes the game logic much easier for me to manage, and I'm glad that the action moves into the main game map rather than staying in the lab because it makes the game feel a lot more cohesive."
hade-muscles-up	"I think people muscling up for a final fight is really funny. I was especially thinking here of [i]Metal Gear Rising[/i]'s final boss fight. I think I also subconsciously borrowed from the epilogue of [i]Anno Dracula[/i].[paragraph break]The sparkling skin - Stephanie Meyer, a grateful public salutes you. I think one or two people interpreted this as a dig at [i]Twilight[/i], but I wasn't actually feeling mean. I'm 100% convinced that most of the hostility directed at [i]Twilight[/i] was because it was something that teenage girls liked that adult men had to put up with, and adult men didn't like that very much. It amused me to make the one [i]Twilight[/i] shout-out in the game be 'actually, [i]Twilight[/i]'s vampires are valid too'. (Not that there aren't really good reasons to hate [i]Twilight[/i], of course. The bit about the werewolf and the baby is, uh, troubling.)"
hade-or-hadrian	"Occasionally, Nero refers to Hadrian as 'Hade.' Early drafts had Nero call him Hade a lot more often, indicating some residual affection for him. Later, I decided that no, Nero does just hate his guts, and tried to cut it out. But a couple of Hades slipped through the net. On reflection, my first instinct was right - it's a more interesting relationship between Nero and Hade if there are still traces of an earlier friendship."
hecking-doggo	"Congratulations on finding this well-hidden easter egg. This dog is my dog Taz, who passed away in late August 2020 while I was trying to finish this game. He is sorely missed. I still pick up my keys as quetly as possible in case he hears them and thinks he's going for a walk.[paragraph break]I can tolerate hecking-doggo-style Reddit language, but I can't imagine that anyone over the age of 40 has any patience for it."
holy-symbols	"The use of holy symbols plays on the classic vampire hatred of Christian symbols, especially the use of crosses to repel vampires. I considered it necessary to expand the use of religion here beyond Christianity - otherwise, there would be an unfortunate suggestion that Christianity is the one true religion. Thus, the cupboard is full of miscellaneous icons that can allude to a wide range of religions. (My apologies if your faith isn't represented here.)[paragraph break]To make this work, I've tried to paint Nero's reaction (and Hade's, when you bring him in here) as an aversion to the very idea of religion, rather than to any particular deity or symbol. Vampires dislike anything that encourages them to examine their own lives and behaviours. There's still a potential implication that non-religious people do not have any morality, which I've tried to smooth out with Nero's little speech the first time you examine the symbols. I should note that I am not religious myself, and I hope dearly that this is an acceptable use of the vampires-hate-religion trope for all readers.[paragraph break]By the way, if I hadn't been trying to avoid reference humour in [i]Vampire Ltd[/i], I would have put a lightsaber in the cupboard in reference to the Jedi census phenomenon. I like the idea that if enough people put a fake religion on their census, it becomes real and stops vampires being able to watch Star Wars."
hq-bd	"I think I had the Plymouth Arcology from [i]SimCity 2000[/i] in mind here."
hunter-intro	"An early outline of [i]Vampire Ltd[/i] began with Nero in his coffin being woken up by a vampire hunter. The solution would have been to throw the soil of your homeland, with which your coffin is lined, into their eyes. This outline was the first version that made it as far as an Inform 7 project, and it was nice enough to Nero to give him a plush coffin and his own crypt - the joke being that Nero would complain about how down on his luck he was, despite living in a castle."
hypnotize	"If I remember right, the 'hypnotize' verb was suggested by Mike Russo as an easter egg. In a more ambitious game, a hypnotize action could make for some really exciting NPC manipulation puzzles. Here, it's used to make the player character look like a doofus."
id-card	"You'll note that I don't actually describe what's on the ID card. This is because I wasn't sure whether Nero could have his photo taken or not. Some vampire fiction suggests that vampires don't show up in photographs or on any other recording device (an extension of their lack of reflection in mirrors, I suppose). There's also the issue of flash photography - the [i]Discworld[/i] series gives us Otto Chriek, the vampire photojournalist who takes a photograph and is immediately reduced to dust by his own camera's flash. I think maybe this is just a blank placeholder ID card, and Lunarcel would get a permanent card ready for Nero if he can make it a week without quitting."
interview-scene	"The Job Interview With a Vampire seemed to be most IFComp reviewers['] favourite scene. It was always going to be part of Vampire Ltd, even in early designs. I came up with the 'what is your biggest weakness' joke very early on, and worked backwards to accommodate it. I have also been job hunting for a while at the time of writing, and this scene was a way of venting at the whole stupid process of job interviews. It seems to be designed to make people with anxiety disorders self-destruct. How come 'because I need the money' isn't an acceptable answer for why you want any job? Prospective interviewers looking through my portfolio, please don't read this part of the commentary."
janitor-legs-it	"Here's where I start clearing out the map of NPCs. I do this to save myself the bother of writing new end-game conversations for all of them. It also helps the player in reducing the number of things they can interact with to solve the puzzle. At least the janitor tries to help?"
jump	"A turn of phrase borrowed from the [i]My Brother, My Brother and Me[/i] TV show, on which Griffin's CV advertises his EIGHT FOOT VERTICAL LEAP, amongst other qualities."
kiss-me	"I imagine this as Nero kissing his own muscles like a beach bodybuilder in a cartoon."
lab-bd	"Imagine a low-poly version of MIT's Great Dome."
look-campuswest	"You might have noticed that this room is useless. It only adds an extra step between the main hub and the office block, and nothing important happens in it. I could have cut it out of the game, but I like that it makes the game world symmetrical (and thus easier to remember your way around), and I like that it divides the office block from the prettier, more public areas of the campus."
man-break	"The work culture here is very loosely based on Amazon warehouses. This isn't a new observation, but when Amazon's CEO can buy a 25-bathroom mansion yet his lowest-paid employees aren't allowed bathroom breaks, something has gone wrong somewhere."
obvious-jokes	"My favourite joke format is somebody overexplaining the obvious. I really like the subtitle of this game."
oh-pratchett	"A lot of lines in [i]Vampire Ltd[/i] start sentences with 'Oh'. I didn't realise it until after the game was released, but this is cribbed straight from Terry Pratchett. You see it all the time in [i]Going Postal[/i], which must have been an unconscious influence on this game - that book is similarly focused on a conman navigating the world of business, who harbours criminal thoughts but becomes troubled by evidence of how his crimes have ruined other people."
old-computer	"My parents had a computer like this until very recently. The horrible noises Nero's computer makes are described from real life.[paragraph break]The old computer is a useless object, really. It gives me an opportunity to throw in an extra hint to the password puzzle, but mostly it's just here to fill the game out, and because I already made a computer kind of object for Hade's computer and it seemed like a waste to only use the template once."
opening-cupboard	"The cupboard led to the only game-breaking bug that testers and players have found so far (as far as I know). When you open the cupboard for the first time, the raisin box appears in the room. Inform 7 has a function you call by writing 'when [bracket]doing something[close bracket] for the first time', which I used for this. But in one of Inform 7's many charming quirks, it turns out that this is only called the first time the player tries to do that thing, even if they can't actually do that thing. So one tester, AKheon, tried to open the cupboard during the interview, thus losing the raisin box forever. This was fixed easily enough by not using that function, but I think everyone learning Inform 7 gets caught out by at least one gotcha like this."
oren	"This joke is borrowed from Terry Pratchett's take on vampires, who believe that spelling their name backwards is a foolproof disguise. I don't actually know many examples of this happening in more serious vampire fiction. Carmilla/Mircalla is the closest example I can think of, but Count Dracula often names his son Alucard in various films and video games."
os1-email-scam	"There's a pun here about vampires and CRYPT-ocurrency, but I'm struggling to bring it out. I like the idea of Nero trying to run a bitcoin-mining operation from his barely-functional work computer."
os2-email-fission	"Here's the big clue to the Moonlite's true nature, but by the time you find it you're probably only ten minutes away from the reveal at most. It would take a much longer game to spin this mystery out in a worthwhile way. Oh well."
os2-greeting	"Very minor character detail that I like: Nero says 'application' instead of 'app'."
os2-permissions-hade	"Come to think of it, it's a good thing that Hadrian forgets to fire Nero and disinvite him from the campus during the final fight. Should I be trying to fix the plotholes in my work instead of just pointing them out? Probably, but I'm tired of working on this game at this point."
parser-error-not-important	"This error message is taken from Arthur DiBianca's puzzle games (which are great, by the way). This message is good for redirecting attention from objects you forgot to implement, but it's bad if you forgot a synonym for an important object."
password-puzzle	"The password puzzle - you must deduce Hadrian's password, using this list of passwords as a starting point and narrowing it down from clues given to you by NPCs when you ask them. The passwords are mostly drawn from real lists of common passwords - 'holiness' is the one I made up.[paragraph break]I like the puzzle idea a lot, and I love the punchline that the correct password is 'letmein' - what else could a vampire's password be? But there are design issues here. The puzzle is trivial to solve by brute force. 12 passwords is not that many to go through by rote, and some of my testers did it this way. The NPC clues only appear when Nero knows that Hadrian's computer is password-protected, so the clues are missable. This could be solved with many more passwords, but I think this would introduce new problems. It would be hell for people using screen readers to sit through a list of 20+ passwords. Also, I think cutting down a longer list of passwords by process of elimination would really slow down the game. I noticed these issues during testing, and I decided that I'd rather [i]Vampire Ltd[/i] be too easy than tedious.[paragraph break]By the way, the 'letmein' joke is recycled from [i]Vampire Time[/i]."
password-solution	"In case you're curious, here's the no-brute-force solution to the password puzzle: The janitor says the password will be guessable, so start from the list of common passwords. The security email on Nero's work computer says that passwords must currently be 7 letters long, and that no password currrently contains a number. This leaves four possibilities: 'holiness', 'letmein', 'password' and 'sunshine'. Both the janitor and the security email say that everyone had to change their password recently, and the janitor knows that Hade's password used to be 'password' so you can eliminate that one. Of the three left, 'letmein' is clued by thinking about vampire tropes. 'Letmein' fits the asking-for-permission theme that has been seen throughout the game so far, and the other two possibilities, 'holiness' and 'sunshine', are things that vampires are averse to. It is also clued by the receptionist's clue that Hadrian yells in frustration at his computer and THEN remembers his password - perhaps shouting 'let me in' at his computer triggers his memory. ([i]Let Me In[/i] was also the title of a vampire film from 2010, but you don't need to know that.)"
pho-911	"Try calling 911 a couple of times while being chased by Hadrian. I think I put the 911 option in here just to plump out the phone tree a bit, and to give the player a chance to learn how conversation trees work if they enter the phone booth before finding the banner."
pho-man-apply	"You can! Try it after Hadrian's been dealt with!"
phones-and-computers	"I use Michael Martin's quip extensions for Inform 7 to manage conversation trees in this game. I abuse the extension for computers and the phone. However, the extension is designed for conversation with people specifically, and a person is defined in Inform 7 as a separate kind of thing from devices (i.e. machines). So in [i]Vampire Ltd[/i], the phone and all the computers have invisible people attached to them called 'operators' or 'operating systems'. The player can't interact with them, but when you use a computer or the phone, the game starts a conversation with the operators.[paragraph break]This led to a problem in the IFComp release, fixed now, where Nero would turn away from the computers' operating systems before biting something in case it spotted him. I also later discovered that you can actually start a conversation with nobody in Martin's extensions, so there was no need to staple an invisible little guy to every machine. But it seems too late to do anything about it now."
plywood-coffin	"I think coffins are status symbols in [i]Vampire Ltd[/i]'s vampire society. A plywood coffin is the vampire equivalent of when bankrupt people in cartoons have to wear a barrel with suspenders."
prayer-room	"The prayer room - also the interview room, for reasons of efficiency, and disguised as a stationery cupboard of some kind to make it more plausible that Hadrian doesn't know about it. The idea of a showdown in a prayer room or some kind of chapel is probably the only idea that survived from earlier designs of [i]Vampire Ltd[/i]. Originally you would have found some holy water in here. You know, just in case the office needs to baptise somebody at short notice, I suppose."
rec-new-work-quit	"This is an artefact of an earlier extended design for [i]Vampire Ltd[/i], which would have interspersed flashbacks to Nero's more successful career with the main game. I don't think the game was ever going to be long enough to support frequent flashbacks, so I'm okay with losing them. They survive in brief little reflections and asides like this, which go some way towards illustrating why Nero failed."
rec-post-fight	"Most NPCs get cleared out of the world during the fight sequence. For the receptionist, there's a bit of state-tracking based on if you lured Hadrian to the lobby or not, meaning that they have two sets of responses based on how terrified they are. I'm glad I didn't have to do this with every NPC. I have enough trouble writing NPC dialogue as it is. By the way, now that Nero doesn't have to disguise himself, you can bite the receptionist if you like."
sunlight-exposure	"The sunlight exposure mechanic is kind of an artefact of earlier plans. One idea for the final fight with Hadrian was to have him shred the umbrella, so that the player would have to dart from building to building to stave off sunlight exposure. This idea was dropped because it made navigation annoying - if the player hasn't figured out how to beat Hadrian, better to let them have free movement around the campus while they figure it out.  Another much earlier idea was to let the player find sunblock for Nero, freeing up the umbrella for some other purpose. Although these puzzle ideas were dropped, I kept the sunlight mechanic just to increase the vampire-ness of the game."
thresholds	"One of several instances of crossing thresholds to make progress. On reflection, I'm not satisfied with how progress is gated in [i]Vampire Ltd[/i]. It leans on the vampires-need-to-be-invited-in thing too much, and perhaps I should have thought harder about other possible vampire puzzles."
vampire-ltd-history	"Before [i]Vampire Ltd[/i], I had been nursing an idea for years for a point-and-click adventure game about a pathetic vampire. His brother would have had all of the classical strengths of vampires - charisma, bat transformations, etc - yet he would have had all of the weaknesses. Puzzles would have consisted of overcoming these weaknesses. As you can probably guess, [i]Vampire Ltd[/i] is what this idea became. A lot of puzzle ideas got dropped in order to scope the game down into something I could actually write - I'll point these out throughout the commentary.[paragraph break]A couple of these ideas were tested in a tiny game called [i]Vampire Time[/i] that I made a couple of years ago while following a Unity 3D course. That was a five-minute ultra-simple choice-based game about spending the night as a vampire, written in a much goofier tone. The only things it has in common with [i]Vampire Ltd[/i] are a couple of recycled jokes, a puzzle idea and a vampire theme, really. For the curious, [i]Vampire Time[/i] is available here: https://comfortcastle.itch.io/vampire-time."
vampires-as-capitalists	"As reviewers pointed out, the vampires-as-capitalists trope is very old. If you're doing any kind of social commentary in your vampire fiction, it's either that or vampires-as-sexual-predators. In my case, the use of capitalism here was inspired by the contrast between how successful businessmen are revered and how they actually behave. Elon Musk is a prime example. He gets a lot of good press for being the boss of Tesla and SpaceX, but after you've watched him hop onto Twitter and tank his own share prices over and over again, you start to wonder if the man has two brain cells to rub together. This is the primary idea behind Hadrian's character - a famous, popular and charismatic influencer who, upon closer inspection, probably has nothing to do with his own successes. (After all, it wasn't Hadrian who built the Moonlite!) Nero is the same kind of person, except that he doesn't have the people skills to hide his true nature for very long."
vampires-suck	"I had some feedback about this saying that 'Vampires suck' is too trite to be a plausible protest sign. This is true. But I can't not go for the pun."
weakness-religion	"I'll talk more about [i]Vampire Ltd[/i]'s treatment of religion when we get to the holy symbols. With regards to this line, I just want to say: I like the word 'most' here."
weakness-running-water	"This was flagged up by a reviewer as a good joke, in that every other weakness has some form of explanation but Nero just throws his hands up and shrugs when it comes to running water. Apparently, the actual reason that running water repels vampires is because running water is blessed and holy. But this gets into religious territory again, so I just phoned it in and dressed it up as a joke. I suspect that in the [i]Vampire Ltd[/i] universe, the running water aversion is purely psychological. There are a lot of pipes and rivers underground - if it was a physical aversion, vampires wouldn't be able to go anywhere.[paragraph break]I like to think about vampires having to go hundreds of miles out of their way to circle around rivers at their source to avoid crossing them."
weakness-thresholds	"The greatest weakness of vampires: social anxiety."
x-banner	"I've just realised that this is written as if Lunarcel expects every employee to win an award for being good on the phone. They may be prepared to hire any idiot who walks onto campus without references or skills or previous experience, but that doesn't mean they don't have standards."
x-box	"I don't let the player put many things in the box (or the empty blood bag, for that matter) because I was concerned that putting things in other things might screw up some of the game logic, such as making sure you've got the janitor puzzle right. [i]Vampire Ltd[/i] is too strongly railroaded for some people's liking, and I'd like to give the player more freedom in the next thing I make. But for my first Inform 7 project, I just wanted to make life easy for myself."
x-engineers	"The engineers were implemented pretty late on, if I remember right, so I probably wrote this description without thinking about it. The 'very disappointing' is very Trumpian, and it feels out of place. Why is Nero disappointed that the engineers don't look like cartoon eggheads? Does he get upset when he sees professional chefs without the big hats?"
x-fancy-computer	"Hade's computer is inspired by the gaming computer I bought myself when I realised that the COVID lockdown was going to be a lot longer than a month. I bought the least ugly gaming computer I could find, and it still looks like somebody threw a tesseract against a wall."
x-film-posters	"I had Elon Musk in mind here with the sci-fi film posters. I have a suspicion that Musk is mostly popular with nerds online because he also has nerdy interests, and that other billionaires like Jeff Bezos could enjoy the same level of popularity if they tweeted a whole lot about how much they like videogames. (Bezos strikes me as being way smarter than Musk, not least because he doesn't own a Twitter account.)"
x-janitor	"An early design of [i]Vampire Ltd[/i] had Nero infiltrating a worker's union of vampire hunters to sabotage Hadrian. The janitor is what that subplot became. I don't regret losing the subplot because I never figured out exactly how it would tie in and the only puzzle I had for it - create a fake piece of garlic bread and eat it to convince the union that you're not a vampire - was too read-the-designer's-mind-y. But I suppose it's a missed opportunity to explore the world more and figure out what's happening at Lunarcel."
x-manager	"I originally envisioned the manager as a wannabe-Steve-Jobs type (hence her turtleneck sweater), antagonistic to her subordinates and fully bought-in to the logic of capitalism. She quickly became much more neurotic and sympathetic. I think she doesn't actually mind if Nero or anyone else bunks off work, but she has a job to hold on to and some ridiculous customer service targets to achieve and she's just trying to do her best.[paragraph break]The manager has a 25% chance of doing some random background task each turn. This was supposed to hint at the player that they can sneak out without her noticing. I don't think this detail actually works as a hint, but it defines her character better than any of my actual dialogue. I like that she'll occasionally rearrange somebody else's desk."
x-me	"This is a pun on 'as good-looking as ever,' the description of the player character in Graham Nelson's [i]Curses![/i] which appears as the default PC description in every Inform 7 project unless the author remembers to change it. This is probably the best joke in [i]Vampire Ltd[/i]."
x-mid-range-computer	"It's possible to use the receptionist's computer if you really want, although it's not implemented fully like the other computers in the game. Try coming back here after the fight with Hadrian."
x-moonlite	"The Moonlite! It's just a Macguffin, and I never quite figured out in my mind's eye what it looks like. It's just, you know, a machine. A big object.[paragraph break]The idea of a machine that inverts the vampire sunlight weakness was one of the few early [i]Vampire Ltd[/i] ideas that made it all the way through to the final product. The thought process here was: why might sunlight hurt vampires? What is sunlight? It's produced by the fusion of hydrogen into helium in the Sun. The opposite of that would be the fission of helium into hydrogen. If the fusion process hurts vampires, what would the fission process do? It would, of course, make them jacked and superpowered. And so, the Moonlite is born.[paragraph break]I'm interested in this kind of world-building, in the sense of sitting down and figuring out how something works and what the implications would be. I think it helps to build a setting that feels real and functional, even if you start from ridiculous premises. But it can be very boring to dump all this information on a player. That's why most of the world-building in [i]Vampire Ltd[/i] (the explanation of vampire weaknesses during the interview, Hadrian's explanation of the Moonlite) is skippable."
x-pipe	"The leak and the pipe are two separate objects. The leak is present at the start of the game, and the pipe is in a backstage room. The leak is swapped with the pipe when the janitor's grapes puzzle is solved. The leak can be reffered to as 'pipe' and the pipe can be referred to as 'leak'. Why did I do it this way instead of making them the same object which changes description when the leak is fixed? Because I implemented this early while I was still learning Inform, and now I'm too afraid to redo it for fear of introducing new bugs to the game."
x-receptionist	"I wanted the receptionist to be non-binary. Unfortunately, Inform 7 doesn't let you do this (or at least, not very easily). Gender is an either/or property for people in Inform 7 projects, either male or female. For animals, you can apply the property 'neuter', but the either/or property is still hardcoded, so that neuter animals are considered male. This is important because many text adventures like this let you use pronouns as shortcuts for typing commands (i.e. 'examine her' instead of 'examine janitor'), and those pronouns are tied to the gender property. 'Them' is tied to plural objects such as the grapes, I think. I don't know if it's possible to create non-binary people or apply custom pronouns to them, and in hindsight, I should have tried harder to figure it out. Let's just style it out by saying that the receptionist presents as male to their co-workers but leads a rich social life in online LGBTQ+ communities.[paragraph break](I appreciate that saying the receptionist is non-binary in a footnote long after the game was first released is a very JK Rowling-style move to make. I will try harder to write a diverse cast next time. Unfortunately, the game I'm currently planning is set in the Western professional wrestling industry during the 90s, and this industry is not exactly renowned for its progressive attitude towards gender and minorities. Ah well, nevertheless.)"
x-umbrella	"The umbrella - this was going to be sunblock in an earlier version, but an umbrella is a more interesting puzzle-solving tool. Not that you do much with it, in the end. I had plans for a puzzle where you need to hook something with the umbrella while outside, meaning you have to be exposed to sunlight while you do it, but this got scoped away."


[
CURRENTLY UP TO: hade convo




ON VAMPIRES
"I think vampires are inherently funny. They're supposed to be suave, powerful masters of darkness, but they can be defeated by a clove of garlic."


NERO REFLECTION
"Nero seems completely unable to consider how his own actions have led to bad consequences for himself and others. Well, vampires don't reflect, after all."




BATS
"I never decided if Nero and Hadrian could turn into bats or cats or whatever. It's not in the game because, frankly, I didn't want to implement it and come up with sensible responses for doing everything as a bat."




EASTER EGGS
"There is no response to XYZZY, but there is a XYZZY easter egg hidden in the game."



]

VOLUME - NOTES - Not for release

[EVERYTHING BELOW THIS POINT IS BASICALLY A NOTEPAD - there's no functional code here, but it might be interesting to some readers as a record of unfulfilled ideas and draft versions of other text]


Book - Outline

[These were notes to myself while I was trying to get the order of events straight in my head. There's a few puzzle ideas that were cut in here.]

[
Possible names for company:
	Lunarcel

Opening scene:
	Nero outside the campus where Hade is presenting the Moonlite to the press
		Moonlite works on pission of helium into hydrogen
			At some point later in the game, players should be reminded that a) this would be energy-inefficient and b) helium is a finite resource - this helps to establish that something is up, and to foreshadow the reveal
		Can establish biting verb here by having Nero suck a juicebox dry or similar
	Nero wants to sneak in and sabotage because he resents Hade's success
		It should be obvious to the player now or later that Nero is probably to blame for his own failures - should be self-confident and hypocritical (because vampires have no reflection)
	
Getting into campus:
	Vampires must be invited in past thresholds so Nero can;t sneak in
	Gets a job as call centre / tech support guy to be invited in (by phone interview, e.g.)
		Able to do this because of high turnover?
		PUZZLE: learn about products so you can pass an interview?
		
Getting into lab:
	Needs a permit to be invited into lab
	Must hack into Hade's security to give yourself permissions
		PUZZLE: Get into Hade's office?
		PUZZLE: Guess Hade's password (LETMEIN)
			Perhaps by presenting the player with a list of common passwords (LETMEIN, ADMIN, 123456, etc)
			
Confrontation in lab:
	Hade is about to test Moonlite
		Real purpose: if sunlight hurts vampires and is fusion of hydrogen into helium, then fission of helium into hydrogen must produce reverse effect
	Hade activates Moonlite and powers up
	
Final sequence:
	PUZZLE: Hade tells Nero to get out, and Nero must resist rescinsion {sp?} of permission
		Player needs to use Moonlite themselves so they can also resist weaknesses
	PUZZLE: Player needs to exploit several weaknesses at once to overpower Hade
		Possibilities:
			Silver
				Cutlery? Electolytes?
			Garlic, salt, other food
				Hade can be tempted to eat something laced with garlic, e.g.
			Holy water
			Running water
				Running holy water?
			Crucifix or other holy symbol
				Lure Hade into chapel?
			* Stake
				Umbrella used for blocking sunlight has a wooden tip? Nice way to use item that the player will be carrying for the whole game
			Running water
				Bust a water pipe
			Arithmomania
				Break a bag of sunflower seeds or something
		Any possibilities you choose should be established with puzzles earlier in the story
	Hade dissolves or something
	FINAL CHOICE: Will Nero keep the Moonlite or destroy it?
	
]

VOLUME - Other - Not for release



Book - Testing Zone

[This was a little scenario for testing the biting action, which was the first thing I coded. I don't know who Big Jeremiah is.]

[
The Testing Zone is a room. "If you're playing the finished game and you see this, something went wrong!"

In the Testing Zone is a table.

An orange is on the table. The orange is biteable.
The description of the orange is "[if moist]Round and succulent[else]Shrivelled and dessicated[end if]."

Big Jeremiah is a person in the Testing Zone. "Big Jeremiah stands here and flexes."
The description of Big Jeremiah is "Big!"
]

Book - Help Files

[Everything here is draft text for in-game help menus that I'm planning to include. They're not in yet because I wanted to prioritise getting the base game ready.]

Part - For players new to interactive fiction

[
Welcome to Vampire Ltd! This is an old-fashioned text adventure. You will control the player character Nero by typing commands for him in the text parser.

Your commands will usually be a verb and a thing. They'll look like EXAMINE BOOK or TALK TO ALICE or GET BAUBLE. No need to type anything fancy or abstract - the parser expects these very short commands, and it might get confused if you use full sentences. Try to be simple and blunt.

Here are some of the most useful verbs you can type, many of which you'll find in similar games.
	
LOOK - Describes your current location. Useful if you want to know what's in the room right now.
EXAMINE _____ - Takes a closer look at something in the room, or at something your character is holding. This can be shortened to X _____ (X for eXamine). For example, try typing X UMBRELLA to get Nero to talk about the umbrella he's holding!

GET _____ - Picks up an object in the room. Note that some things are too heavy to carry.
DROP _____ - Discards something you're carrying. You can usually GET it again if you want it back.
INVENTORY - Lists everthing that you are carrying. Can be shortened to I for INVENTORY.

USE _____ - Uses the thing. This usually won't work, and will ask you for a more specific verb. But in this game, sometimes USE is a natural thing to try! For example, you can USE COMPUTER if you see one.

TALK TO _____ - Starts a conversation with a person in the room. Can be shortened to T _____. (Many other text adventures use verbs like "ask _____ about _____", but in this game, just TALK TO _____ is fine.)

GO _____ - Move to an area in that direction. Games like this usually use compass directions - GO NORTH, GO EAST, etc. You can shorten this to NORTH, EAST, SOUTH, WEST - or even just N, E, S, W!
IN / OUT - Enter or exit a building or container. You can also try ENTER _____ / EXIT _____.

SAVE - Makes a save file of your game, so that you can resume playing later if you want to stop for now.
RESTORE - Lets you load an old save file and resume playing.
UNDO - Rewinds the previous action, letting you try something different.

There are lots of other verbs - try whatever sounds right! See a door? Maybe you can OPEN it or UNLOCK it. See a machine? Maybe you can SWITCH it ON or OFF. And remember, this game is about vampires - maybe you can BITE something (or someone) as well...

The parser will also recognise many synonyms - for example, you could try PICK UP CRYSTAL or TAKE CRYSTAL instead of GET CRYSTAL.

Provided with the download version of this game is a postcard by Lea Albright and Andrew Plotkin which lists most of the common commands in text adventures, If you're playing online, you can find this postcard at ...

Often, words you try won't be recognised, and good ideas you have won't work. Don't be discouraged! Try rephrasing your idea, or experimenting with other ideas. If you're really stuck, don't be ashamed to use the provided hints or walkthrough!
]

Part - For players new to this game

[
Thanks for checking out my game!

Vampire Ltd is a standard parser-based interactive fiction. Most common verbs in text adventures will work here. However, you should be aware of the following:

1) This game uses LucasArts-style conversation trees. Start conversations by typing TALK TO ALICE (for example). You will then be prompted to choose dialogue from a numbered list by typing your choice's number. You'll be unable to move or take other actions until you choose a "goodbye" prompt, although you can still look at things. (There may be some conversations you won't be able to leave at first!) This system means that ASK/TELL ALICE ABOUT X won't work, and neither will SHOW or GIVE X TO ALICE; if you have an item or topic that another character will find interesting, you'll be able to use it in conversation. Some conversation options can be missed, but all knowledge necessary to complete the game should be repeatable (that is, the crucial hint for a puzzle will never be some throwaway gag in a skippable conversation from an hour earlier in the game).

2) Extra verbs in this game include BITE (for being a vampire), USE (for computers specifically), and TYPE (for inputting a word or phrase into computers), plus synonyms for these. There may be other new verbs available.

3) On the Zarfian cruelty scale, Vampire Ltd is intended to be POLITE. This means that the player can reach a game over state (if the main character dies, for example), but should be able to undo out of it and rescue themselves. It should be clear when the player is in a dangerous situation and needs to tread carefully or rescue themselves, and it should be clear when an action will lead to an immediate game over state. It is not intended that the game should ever be unwinnable from any position. If you have found a way to get into an unwinnable state, this is a bug which needs to be fixed. Please let me know about it!
]

Part - Credits

[
Vampire Ltd is a game by Alex Harby.

This game was written in Inform 7 by Graham Nelson, using the Inform 7 Windows IDE by David Kinder. It includes the Reactable Quips and Quip-Based Conversation extensions by Michael Martin.

The code of this game draws from examples in the Inform 7 documentation by Graham Nelson and Emily Short, and from examples in the Inform 7 Handbook by Jim Aikin.
]

Part - Hints

[
ABOUT THESE HINTS

These help pages provide Invisiclues-style hints to puzzles in Vampire Ltd. Press H on each page to reveal progressively stronger hints to each puzzle, one hint at a time. The last hint for each puzzle will give you the solution outright.

CAMPUS ENTRANCE

What should I do at the start?

How do I get onto the campus?

GETTING A JOB

I'm on the campus - where do I go now?

What should I say in the interview?

I've been hired - what can I do now?

GETTING TO THE LAB

Where is the lab?

How do I get authorisation to enter the lab?

How do I get past the running water?

What is Hade's password?

Where are the janitor's raisins?

CONFRONTING HADE

What should I say to Hade?

How can I stop Hade?

I'm finished with Hade - what do I do now?




]

Part - Walkthrough

[

FULL WALKTHROUGH

This set of hints is literally a full walkthrough - proceed with caution if you want to avoid spoilers! This walkthrough tries to explain the logic behind certain puzzles. If you want to beat the game as efficiently as possible, try the solution.txt file in the download version of this game as an alternative.
At the start, you can't do much while Hadrian speaks. WAIT (Z) repeatedly until the stage is cleared away.
You need to get invited onto the campus before you can explore it. EXAMINE (X) the banner with the job number on it.
Then ENTER BOOTH and contact the manager to arrange an interview.
Walk to the office where the manager is - NORTH, WEST, NORTH (N, W, N).
TALK TO MANAGER and tell her you're there for an interview.
During the interview scene, the last option in each selection will progress the game. (You can choose all the other options to learn a little more about Nero.)
After the interview, you can explore more of the campus. Try to go to the laboratory - SOUTH, EAST, EAST (S, E, E).
Running water stops you. The janitor is on strike - TALK TO JANITOR to learn that she wants her stolen raisins back (the last of a lot of straws). She will mention that she last had them in the "prayer room".
Return to the interview room - WEST, WEST, NORTH, NORTH.
OPEN CUPBOARD to discover a raisin box, as well as a lot of holy symbols stashed away.
TAKE BOX. It's empty, so you'll need to supply raisins.
Head to the main headquarters building - SOUTH, SOUTH, EAST, NORTH.
In the lobby, there is a fruit bowl. TAKE GRAPES.
BITE GRAPES to drain their moisture, and transform them into raisins.
PUT GRAPES IN BOX to create a full raisin box.
Return to the janitor - SOUTH, EAST.
TALK TO JANITOR and give her the raisin box in conversation. She will fix the leak for you, opening the way NORTH.
In the lab entrance, you will find a locked door with a card reader, which doesn't recognise your card as having access to the lab. Return to the office - SOUTH, WEST, WEST, NORTH.
TALK TO MANAGER again to learn that your ID card controls your permissions, and that only executives can edit these permissions. You may already have found Hade's office (north of the lobby) and discovered his password-protected computer - your job is to figure out his password. (While you're talking to here, you might also learn that Hadrian doesn't know about the prayer room!)
USE COMPUTER to use your own computer in the office. Check the email inbox. You will find an email admonishing the company for using common passwords and making common security mistakes.
LOOK AT NOTICEBOARD to find a list of common passwords to avoid. You might have learned from the janitor that Hadrian probably uses one of these common passwords (she'll say this if you talk to her after trying to break into Hade's computer). Make a note, or take the list with you.
Starting with the common passwords and eliminating passwords that don't fit the requirements established by the emails (i.e. eliminating all passwords which contain a number or are less than seven characters long), you can narrow down Hadrian's password to a handful of possibilities.
You'll have "holiness", "letmein", "password" and "sunshine" left over. The janitor's hint about common passwords also told you that "password" was Hade's old password until he had to change it, so you can eliminate that one too.
The three remaining passwords are all vampire-related, so you know you're on the right track. You can either brute-force the password, or realise that "letmein" is a good password for a vampire who's locked out of his computer, while the other two, "holiness" and "sunshine", are much less palatable to a vampire. (The secretary hints at this too - he can tell you that he sometimes overhears Hadrian getting upset that his computer won't let him in, before suddenly remembering his password!)
Go to Hadrian's computer - SOUTH, EAST, NORTH, NORTH.
TYPE LETMEIN to break the password protection.
USE COMPUTER and navigate to the security permissions to give yourself permission to enter the lab. (Optionally, check Hadrian's email for a little more on the Moonlite.)
Go back to the lab entrance - SOUTH, SOUTH, EAST, NORTH.
PUT CARD IN READER to unlock the door, and head NORTH to enter.
Hadrian is here, and will start a conversation immediately. The game will progress whatever happens here - you can attack him to end the conversation immediately, or you can talk to learn what the Moonlite actually is.
After this conversation, Hadrian will be big and mad and trying to fight you. (Don't worry, he won't actually kill you.) You'll want to either use the Moonlite yourself or destroy it, but Hadrian won't let you touch it - you'll need to get rid of him somehow.
Attacking Hade straight on won't work, because he's too strong now. X HADE to notice scars on his chest, which should hopefully give you the idea to stake him, but he's too alert to let you do this. You will need to distract him. The most distracting thing you have seen on the campus is the holy symbols in the prayer room.
Lure Hade to the prayer room - SOUTH, SOUTH, WEST, WEST, NORTH, NORTH. (There will be a few events along the way, but no need to pay attention to them.)
OPEN CUPBOARD to reveal the symbols to Hade, and note that he's lost focus while the symbols are revealed to him.
STAKE HADRIAN WITH UMBRELLA to deliver the killing blow.
To end the game, you need to decide what to do with the Moonlite. SOUTH, SOUTH, EAST, EAST, NORTH, NORTH.
You can either BREAK MOONLITE to make sure nobody else can use it, or SWITCH ON MOONLITE to use it for yourself. Both options are considered valid game-ending moves. Choose whatever you think Nero would do. Congratulations, you've won the game!


]

Part - Changelog

[
Release 1
Testing release.

Release 2
Testing release. Many many issues fixed from first round of testing, including:
	More synonyms for verbs implemented (e.g. more synonyms for typing passwords)
	More synonyms for objects and people implemented
	Better in-game hinting and direction
	Missing scenery objects implemented
	More custom parser responses
	More responses to good-but-wrong solutions (e.g. "put grapes in sun")
	An AMUSING menu
	
Release 3
First official public release. IFComp version. A handful of issues resolved:
	Typos
	A little more in-game logic (e.g. checking a certain email after Nero knows things later in the game)
	A couple more synonyms
	Slight improvements to the writing here and there
	
Release 3.1
Bugfix release - upgraded the web interpreter packaged with the game to try to resolve a browser-based issue

Release 4
Second major public release. Post-comp release. Issues resolved based on transcripts and feedback - thanks to Stian, Mike Sousa, Patrick Mooney, ClubFloyd, and anonymous IFComp judges. Changes include:
	Developer commentary added via Stephen Granade's Footnotes extension
	More custom responses added, especially to verbs included in Inform which aren't used in the game solution (e.g. THINK, WAKE UP)
	New "pray" command, which does nothing useful but seems to be expected when you put a shrine in your game
	Responses to attempts to use blood bag as container added
	Synonyms for using computers added
	Holy symbol synonyms added to cupboard as well, allowing "show prayer to Hadrian" for opening cupboard
	Fix for Nero turning away from computers to bite things
	Fix for the glitch which printed changelog in bold in web interpreter
	Fix for inappropriate response to "eat raisins [referring to the raisin box]"
	Typo corrections
	
]