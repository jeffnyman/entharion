"Ghosterington Night" by Wade Clarke

[Chapter Hierarchy Reminder: It goes "volume", "book", "part", "chapter", "section"]

The release number is 3.

[Release 1 was the original Ectocomp version.

Release 2 was a Glulx update with title page, title music and gameplay refinements, and was compiled in Inform 6G60.

Release 3 is 99.9% the same game as release 2 (basically some typos and tiny source innefficiencies have been fixed) but its source code has been tweaked for compatibility with Inform 6L38, and I compiled it with 6L38.]

Use no deprecated features. [IE don't allow Inform commands/methods in the source which are due to be removed from the language in future releases. This keeps one programming safely, and also sometimes exposes iffy code in older extensions.]

Use no scoring. [I use my own score routines in this game. Admittedly, scoring is OFF by default in 6L38, but leaving this line in the source doesn't hurt.]

Release along with the source text.



[
TECH INFO ON COMPILING GHOSTERINGTON NIGHT
	
Release 3 of Ghosterington Night is the result of me updating the game's sourcecode for compatiblity with Inform 7 release 6L38 and recompiling it with 6L38. I did this in 2015.

(To see comments on bits of the source I specifically had to edit to make them 6L38 compatible, search for the square-bracekted tag [6L38] througout the source.)

Thanks to 6L38's game-specific extensions support, I've been able to include everything needed to compile the game in the download bundle. All required non-core extensions are in place and they won't interfere with any extensions already on your computer.

TO COMPILE THE GAME: Just save your copy of this source as 'ghosterington_night' and place it in the same location as the folder 'ghosterington_night.materials'. Make sure that you've ticked 'Glulx' as the Story File Format in the Settings tab, as well as the option to 'Bind up into a Blorb file on release'. Then click 'Go!' or 'Release'.

TO COMPILE THE GAME WITHOUT ITS TITLE GRAPHIC OR MUSIC FUNCTIONALITY: Just comment out the chapter of this source called "Book - Glulx title page and music code" in its entirety before compiling.

]



cheatmode is a truth state variable. cheatmode is false. [If I set this variable to true, cheat mode is on.]



Volume - Bibliography

The story genre is "Horror".

The story description is "Danger-filled Ghosterington Manor appears atop the same cliff each year on Samhain night. Hidden inside are the last four works of the dead bad poet Vigilance Ghosterington. Those four poems are worth a fortune, and you, famous adventurer Jubilee Grief, are determined to find them."

The story creation year is 2012.

Report requesting the story file version:
	say "Dice-Lock Version 1/080522 by S John Ross[line break]Useful Functions version 1 by ShadowChaser[line break]Extended Banner Version 5 by Stephen Granade[paragraph break]". [This line mentions extensions that I incorporated into the source and thus wouldn't get listed automatically by the VERSION command]



Volume - Test Phrases - Not For Release

wanting to cheat is an action out of world.
Understand "cheat" as wanting to cheat.

[presently, typing 'cheat' just sets a flag and reports the password animal's type and colour for the current game]

Carry out wanting to cheat:
	now cheatmode is true;
	say "[colpick] [anipick][line break]".

test me with "n/w/w/n/n/pull rug/x desk/s/shoot him/x shell/n/e/shoot him/x bed/e/shoot him/x vanity/s/shoot him/x plant/w/w/s/x a/x b/x mouth". [This test command tries to solve most of the game for you. Once you're on the clifftop, type 'test me'. Then, with a bit of luck (since the randomised enemies might manage to kill you en route) you'll run around a lot, not die, and end up standing beside the painting with 3 out of 4 poems and both clues in your inventory, ready to answer the painting's question.]



Volume - Core Extensions

Include Version 11 of Exit Lister by Eric Eve. [6L38] [This is the vanilla public library version 11 of this extension. Release 2 used version 9.]

Include Version 4 of Variable Time Control by Eric Eve. [6L38] [This is the vanilla public library version 4 of this extension. Release 2 used version 3.]

Include Version 7/140501 of Numbered Disambiguation Choices by Aaron Reed. [6L38] [This is the vanilla public library version 7/140501 of this extension. Release 2 used version 4.]

[6L38] [Release 2 used Ron Newcomb's 'Default Messages' extension. That extension's functionality is now built-in in 6L38, so I've recreated the tweaks I previously effected with that extension in the Book 'Changes to default Responses'.]



[I place any modifications of, and data for, extensions at the end of the source to reduce the amount of unexciting stuff I have to scroll through regularly.]



Volume - Out of world material

asking for help is an action out of world.
Understand "help", "hint", "hints" as asking for help.

Report asking for help:
	say "[bold type]HOW TO PLAY[roman type][paragraph break]MOVEMENT[paragraph break]Use the commands NORTH, SOUTH, EAST and WEST (you can just type N, S, W or E) to move around.[paragraph break]";
	say "COMMON ACTIONS[paragraph break]To examine an object or detail that you can see, type EXAMINE (THING), or X (THING) for short.[line break]To see the description of your current location again, type L, which is short for LOOK[line break]To shoot at a bad guy or something else, type SHOOT (TARGET)[line break]To check what you're carrying, type I, which is short for INVENTORY [line break]To pick up an object you can see, type GET (THING)[line break]To open something, type OPEN (THING)[line break]The current game time appears in the status bar. If you can't see the status bar for any reason, type TIME.[line break]To wait a turn, type WAIT, or Z for short.[line break]You can try other verbs/commands as well, but this is a simple game and you can clear it using mostly just the commands listed here.[paragraph break]";
	say "OUT OF WORLD ACTIONS[paragraph break]To go back a move, type UNDO[line break]To see how you're doing, type SCORE[line break]To save or restore a game, type SAVE or RESTORE[line break]For background information on the game, type ABOUT[line break]To see this help page again, type HELP[line break]".

asking for credits is an action out of world.
Understand "about", "author", "credit", "credits" as asking for credits.

Report asking for credits:
	say "Ghosterington Night was originally written for Ectocomp 2012 where it came first out of six games. The post competition version you are now playing, Release 2, retains the original game's design but has been significantly revised. It's better programmed and implemented, smoother and more reasonable (especially in terms of letting you look at the bad guys or do things like check your inventory without being killed) – in short, it's more playable all around. I also added a title graphic and theme music.[paragraph break]";
	say "Andrew Schultz came up with a lot of the ideas for improvements and playtested this version. Michael Chu gave it a spin, too. Thanks also go to Jason Guest, who ran Ectocomp 2012, and to the folks who played or reviewed the original version of the game: Hulk Handsome, Jon Blask, Sam Kabo Ashwell, Emily Short, Sean M. Shore and Martin Barth.[paragraph break]";
	say "For information on how to play, type HELP.[paragraph break]";
	say "I've made the Inform 7 source code for this game available at Ghosterington Night's IFDB page ( http://ifdb.tads.org/viewgame?id=6kko9va64c4o5jan ) for anyone who might be interested in its methods.[paragraph break]";
	say "Ghosterington Manor, the game (excluding the title graphic and title song) and its source code, are licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. (CC BY-NC-SA 3.0) (http://creativecommons.org/licenses/by-nc-sa/3.0/)[paragraph break]";
	say "The game's title artwork is (C) Wade Clarke 2012. The game's theme music is (P) and (C) Wade Clarke 2012.[paragraph break]";
	say "You can contact the author Wade Clarke at bloomer@iprimus.com.au[paragraph break]".



Volume - the uberstart rules

[The uberstart rules are just my way of organising what happens 'when play begins.']

The uberstart rules are a rulebook.

game_started is a truth state variable. game_started is false. [false means play hasn't begun yet, true means it has.]
colpick is a text variable. [the password animal's colour is stored here]
anipick is a text variable. [the password  animal's type is stored here]

The time of day is 10:27 PM. [set start time of game]

Rule for constructing the status line when game_started is false: do nothing. [keep status line blank until game is past the introductory stuff. If I don't do this, the status line will be displaying exits from the first room while the credits are still rolling]

When play begins:
	follow the uberstart rules.

An uberstart rule (this is the set the story viewpoint and tense rule):
	now the story viewpoint is second person singular; [6L38]
	now the story tense is present tense. [6L38]
	
An uberstart rule (this is the add the time to the status line rule):
	now right hand status line is "[time of day]".

An uberstart rule (this is the randomly pick a colour and animal for this game rule):
	choose a random row from table of firstword; [Choose password animal colour -]
	now colpick is hue entry; [and store it]
	choose a random row from table of critters; [Choose password animal type -]
	now anipick is beast entry. [and store it.]

An uberstart rule (this is the set the odds of terror statue appearing each turn rule):
	now statueodds is 5. [set odds of terror statue appearing each turn to 1 in 5]
	
An uberstart rule (this is the print part 1 of the introduction rule):
	clear the screen;
	say "Each year on Samhain night, Ghosterington Manor, the lair of legendary (and dead) bad poet, futurist and occultist Vigilance Ghosterington, materialises atop the same lonely cliff. It stays there for three hours, tempting adventurers to brave its dangers before disappearing at midnight for another year. It is said that Ghosterington's last four poems – the worst he ever wrote, now worth millions of dollars – are still inside the manor. But nobody has lived to bring them out.";
	say line break;
	say "This year is your year, for you are the famous adventurer and treasure finder Jubilee Grief, and you're determined to survive the dangers of Ghosterington Manor, find the poems, sell them and retire as a (more) famous millionaire.";
	waitforspace; [tell player to press space and pause til they do - this function comes from Shadowchaser's Useful Functions extension, included down near the end of the source.]
	say paragraph break;
	say ".  .  .[paragraph break]".

An uberstart rule (this is the print part 2 of the introduction rule):
	say "[bold type]Cliff face[roman type][paragraph break]A screaming wind lashes the cliff face as you ascend it with your anti-spelunking equipment. Suddenly a higher pitched squeaking pierces through to your ears. After your recent trip to the Amazon you'd know that sound anywhere: Killer vampire bats![paragraph break]";
	say "Without hesitation you whip out your six shooter and kick away from the cliff face, scanning for potential attackers. Three rapidly approaching dark shapes swing into view and you open fire – BLAOW BLAOW BLAOW![paragraph break]";
	say "The three clipped bats flap and flail as they tumble to their deaths hundreds of feet below. You use your climbing pack to brace yourself as you swing back into the cliff, but the violent collision tears open a side pocket and your box of ammunition tumbles into space. Drat! Now you've only got the three bullets in your gun left to use in the house. Better make them count.[line break]";
	waitforspace;
	say paragraph break.



Book - Glulx title page and music code

[*** Comment out or delete this 'Glulx title page and music code' chapter of the source to remove the music and title graphic functionality.

This chapter checks the capabilities of the player's interpreter, displays the title page and/or plays the title song and/or displays messages about the interpreter's lack of graphics or audio support as appropriate. Then it asks the player to hit space if any multimedia was mobilised and fades out the music if it's still playing.]

Release along with cover art.

figure of titlepage is the file "cover800.png".
sound of titlemusic is the file "ghosterington_night.ogg".

Include Version 3 of Multiple Sounds by Massimo Stella.
Include Version 1/100607 of Real-Time Delays by Erik Temple.

faderflag is a truth state variable. faderflag is false. [Used to keep track of whether player pressed key at title page while music was still playing. If it was, I fade it out before continuing]
eyecandy is a truth state variable. eyecandy is false.
earcandy is a truth state variable. earcandy is false.

An uberstart rule (this is the dish out the introductory multimedia if the player's interpreter supports it rule):
	if glulx graphics is supported:
		now eyecandy is true; [note that player's interpreter has graphical capabilities]
	if glulx sound is supported:
		now earcandy is true; [note that player's interpreter has audio capabilities]
	if eyecandy is true:
		display the figure of titlepage;
	otherwise:
		say "(* The title image would appear here if you were playing this game in an interpreter with graphics support.)[paragraph break]";
	if earcandy is true:
		set the foreground volume to 5; [max volume]
		play sound of titlemusic in foreground;
		if glulx timekeeping is supported:
			now faderflag is true; [indicates that the theme song is currently playing]
			start a 20000 millisecond timer; [the theme song length is 20 seconds - IE after 20 seconds, faderflag will revert to 0, indicating that the song has played all the way through, which in turn means no fade out of the audio will be required]
	otherwise:
		if eyecandy is true:
			say line break;
		say "(* You would be hearing the theme music now if you were playing this game in an interpreter with sound support.)[paragraph break]";
	if eyecandy is false and earcandy is true: [if player has audio but no graphics -]
		say the banner info; [I display the game banner while the music is playing to stand in for the title graphic]
		say line break;
	if eyecandy is true and earcandy is true:
		say line break;
	if eyecandy is true or earcandy is true:
		say "<<  Press SPACE to begin  >>[run paragraph on]";
		get_the_space_key;
		if earcandy is true:
			if glulx timekeeping is supported and faderflag is true: [if player pressed SPACE and the music is still playing -]
				stop the timer;
				fade out the foreground sound; [fade out the music]
				now faderflag is false; [indicate music no longer playing]
			stop the foreground sound; [officially stop the music playing after the fade out is complete]
		say paragraph break.

A glulx timed activity rule (this is the NEW redirect from timer rule): [this overwrites what's in the Variable Time extension]
	now the waiting flag is false;
	stop the timer;
	now faderflag is false. [my addition - indicates that the theme music is no longer playing]

The NEW redirect from timer rule is listed instead of the redirect from timer rule in the glulx timed activity rules.

To fade out the foreground sound: [This routine is a manually programmed audio fade I worked out with a decent curve and refresh rate to minimise clicking of the audio. While the fade is occurring, the player can take no action.]
	say run paragraph on; [necessary to prevent linebumping in Gargoyle interpreter if music plays all the way to its conclusion]
	let CV be 66535;
	repeat with N running from 1 to 500:
		if CV is less than 1500, break;
		if CV is greater than 1500, now CV is CV minus 1000;
		if CV is greater than 5121, now CV is CV minus 2000;
		if CV is greater than 10241, now CV is CV minus 5000;
		if CV is greater than 20481, now CV is CV minus 7000;
		if CV is greater than 40961, now CV is CV minus 15000;
		set the raw foreground volume to CV;
		wait 110 milliseconds before continuing, strictly.

[NOTE: As of glk 0.7.3, the glk spec promised new audio functions, including built-in smooth fade capabilities. However, at the time I typed this, these new audio functions were barely supported by Inform at any level (I7 environment, I6 interfaces or player end interpreters) therefore I do not even try to use them. I will continue to use my 'manual' audio fades until such time as the built-in glk fades are more ubiquitously supported.]

[*** The section you would comment out ends with this very line you are reading.]



Book - The last uberstart rule

An uberstart rule (this is the start the game rule):
	now game_started is true. [this will allow the status line info to appear from now on]



Volume - Definitions

Book - clockinducing and notclockinducing

[the first time the player enters a clockinducing room, the clockwork girl is activated and able to enter the game]

A room can be clockinducing or notclockinducing. A room is usually clockinducing.

clifftop, Vestibule, Creaky hall, goldroom, Eastern Way are notclockinducing.



Book - proclock and anticlock

[the clockwork girl can enter proclock rooms but not anticlock ones]

A room can be proclock or anticlock. A room is usually proclock.

Bedroom is anticlock.
Contrition Corner is anticlock.
secret is anticlock.
goldroom is anticlock.
eastern way is anticlock. ['eastern way' becomes proclock once the player has picked up one of the two notes]
clifftop is anticlock.



Book - proterror and antiterror

[terror statue can only materialise in proterror rooms]

A room can be proterror or antiterror. A room is usually proterror.

secret is antiterror.
goldroom is antiterror.
clifftop is antiterror.



Volume - Characters

Book - Jubilee

The player is Jubilee.

Jubilee is a woman. Description of Jubilee is "Your hair's tied back in a tight ponytail and you're wearing your flexible black climbing and spying catsuit. Your minimal look has become all the rage with female adventurers.". jubilee is in Clifftop.

Understand "jubilee grief", "grief/adventurer/female/woman", "female adventurer" as jubilee. 

jubilee wears a black catsuit. Understand "suit" as black catsuit.

description of black catsuit is "It makes you totally inconspicuous or attractive as the situation calls for. Amazing!"

Instead of doing anything other than examining to black catsuit:
	say "[no-time]Messing with your catsuit could get you killed!"

jubilee's face is a part of jubilee. Description of jubilee's face is "You are as vain as most high profile adventurers, but you can't see yourself right now. You imagine you've been looking pretty cat-dragged-in since you anti-spelunked up that cliff."

Printed name of jubilee's face is "your face".

Understand "jubilee/jubilees/my face" as jubilee's face.

Does the player mean doing anything to jubilee's face: it is unlikely. [try to rank enemy faces over jubilee's if player just types 'face']

ponytail is an improper-named part of jubilee. The indefinite article is "your".

Understand "hair" as ponytail.

Instead of examining ponytail:
	try examining jubilee.



Book - clockwork girl

clockstat is a number variable. [Value ranges from0-4: tracks the clockwork girl's master state.
0 = initial state where she's totally out of play
1 = she's primed to appear, and will do so at the first legal opportunity
2 = she's in the game now and following the player about and being a nuisance generally
4 = she's lying crippled on the floor because you pulled the rug out from under her.]

clockfear is a number variable. [when 1, clockwork girl will enter the player's room. Set to 0 to prevent her re-entering before player has gone elsewhere]

clockhistory is a room that varies. [stores the last room clockwork girl was seen in.]

mulligan is a truth state variable. mulligan is false. [You can back into the clockwork girl only once without being killed. This is your 'mulligan'.]

the clockwork girl is a woman. "[if clockstat is 4]The [clockwork girl] is thrashing about uselessly on the floor.[otherwise]The [clockwork girl] is ticking away here and brandishing her axe.". Description of clockwork girl is "She's hideous, built out of metal and chunks of female flesh and tied together with veins and gristle."

Understand "clock" as clockwork girl. 

metal is a part of clockwork girl. Description of metal is "It's tough-looking stuff."

veins is a plural-named part of clockwork girl. Description of veins is "Veins should be inside a person, not used as string to tie them together. It's hard to know where to start with all the things that are wrong with this situation."
Understand "vein" as veins.

gristle is a part of clockwork girl. Description of gristle is "Stinky, smelly blobs of something. You can't even tell what they really are or were."
Understand "blob/blobs" as gristle.

female flesh is a part of clockwork girl. Description of female flesh is "Is this girl made out of the flesh of more than one human? It's probably best not to think about that."
Understand "chunk/chunks" as female flesh.

the clockwork girl's face is a part of clockwork girl. Description of clockwork girl's face is "Horrible. You'd feel sorry for her if she wasn't giving off such a powerful wanting-to-axe-you vibe."
Understand "girls/girl's face", "clockwork girls face", "clockwork/clockworks/clockwork's face", "metal face", "grimace" as clockwork girl's face.

an axe is part of clockwork girl. Description of axe is "It's big. It's nasty. You wouldn't like that to come between your shoulders and your head."

Instead of taking axe:
	say "You try to snatch the axe from the [clockwork girl]'s hands but it doesn't budge. She takes a retaliatory swipe at you. You realise that your head is now rolling across the floor as a result.";
	headkill.


To headkill:
	end the story saying "You died because you need a head to live and you have no head.";
	follow the shutdown rules. [If we don't follow the shutdown rules right now, the game will (annoyingly!) wait 'til next turn to end the story.]


Part - clockwork girl special programming

To decide if clockwork girl is dangerous:
	if clockwork girl is in location and clockstat is 2: [IE - if she is present in player's room AND not lying on the floor as a result of you pulling the rug out from under her]
		decide yes;
	decide no.


Rule for writing a paragraph about clockwork girl:
	if clockwork girl is dangerous and location is clockhistory:
		now clockwork girl is mentioned. [suppress normal line about clockwork girl's presence in the circumstance where an every turn rule is about to describe a special attack by her which the player will duck out of the way of. The attack occurred because the player backed into the last room the clockwork girl was seen in. See code below...]


Every turn:
	if clockwork girl is dangerous:
		if location is clockhistory: [If player returned to where clockwork girl was last seen...]
			if mulligan is true:
				say "The [clockwork girl] is still here in the room where you last saw her, her feet planted and her axe braced in readiness. With one great, sudden buzzing step whose strength and reach you fail to anticipate, she lops off your head.";
				headkill; [activate the 'decapitate the player' routine]
			otherwise:
				now mulligan is true;
				now clockhistory is clifftop; [effectively clears clockhistory]
				say "The [clockwork girl] has been idling here in the room where you last saw her. Suddenly she lurches forward, her axe soaring towards your neck --- you manage to duck back just in time, the blade passing under your chin. The [clockwork girl] starts to gather herself.[paragraph break]That was too close. You'll have to make sure she doesn't get the drop on you in future.";
				now clockfear is 0;
		otherwise:	
			say "Emitting an angry buzzing sound, the [clockwork girl] spins towards you and deftly removes your head with her axe.";
			headkill;
	if clockstat is 1 and location is proclock:
		say "You hear an alarming grinding and ticking sound as a silvery figure plods into the room. It's a [clockwork girl]. Her bloody metal face is stretched into a permanently agonised grimace. She's wielding an axe and looking at you.";
		introduce miss clock;
		now clockstat is 2;
	if clockfear is 1 and location is proclock and clockwork girl is not in location:
		introduce miss clock;
		say "The [clockwork girl] plods into the room. ";
		if location is plushroom:
			say "The rug muffles her footsteps.";
		otherwise:
			say line break.

To introduce miss clock:
	now clockwork girl is in location;
	set pronouns from clockwork girl; [since she didn't travel by the regular 'going' action, but by a cheapie code teleport, the game won't have set the pronoun 'her' to refer to her. So I do it manually.]
	now clockfear is 0.


Instead of pulling rug:
	if clockwork girl is dangerous:
		say "You yank the rug and the [clockwork girl] topples over. She thrashes about madly, whirring and clicking like an overturned beetle, but she's not flexible enough to get back on her feet.";
		now description of clockwork girl is "She's flopping about on the floor and making a tremendous amount of noise, but it doesn't look like she'll be able to get up again. You still need to keep away from her axe, though.";
		now clockstat is 4; [4 indicates she's stranded on the rug]
		rule succeeds;
	instead try taking rug. [programming for taking the rug already covers situations where (a) clockwork girl has been knocked over or is (b) not present]

Understand the command "yank" as "pull". [Add this synonym for 'pull']


Instead of pushing rug:
	if clockwork girl is dangerous:
		instead say "[no-time]A pull is likely to work better.";
	if clockwork girl is in location:
		instead say "[no-time]No, bunching the rug up against the clockwork girl wouldn't do anything to stop her waving that axe around.";
	otherwise: [she must not be present]
		say "There's nothing under the rug, but you note that it is loose on the floor.";
		rule succeeds.



Book - Terror Statue

statueprime is a number variable. [records consecutive turns spent in presence of Terror Statue]
statueodds is a number variable. [records chance of terror statue appearing each turn. It's set to 5 in the uberstart rules - IE 1 in 5 chance each turn.]
statuesafe is a number variable. [set this to 1 when player shoots terror statue to prevent him reappearing in same room]


Terror Statue is a man. "[Terror Statue] is here." Description of Terror Statue is "A tall white marble statue of a robed man. You want to lift your eyes to his face but you're too afraid to look.".

Understand "man/robed/marble/white", "robed/marble/white man/statue", "white marble man/statue" as terror statue.

terror statue wears robes. Description of robes is "They're snow white."
Understand "robe" as robes.

Terror Statue's face is a proper-named part of terror statue. Description of Terror Statue's face is "The fear you feel while in [Terror Statue]'s presence makes you too afraid to look!".
Understand "terror/terrors/terror's face", "statue/statues/statue's face", "terror statue face", "terror statues face", "terror statue's face" as terror statue's face.


Part - Terror Statue special programming

Every turn:
	lock the dice; [this is a basic (REAL basic) anti cheating measure powered by S John Ross's Dice-lock extension - if the player UNDOes a move after terror statue appears in hopes he won't appear if they replay that turn, he'll still appear. Of course that means the player could step into a room they didn't intend to visit and make him appear there, thus freeing up the room which was their original goal. Them's the breaks.]
	if terror statue is in location:
		increment statueprime;
		if statueprime is 2:
			terrorkill;
	if levpos is 1 and terror statue is not in location and statuesafe is 0 and location is proterror:
		if a random chance of 1 in statueodds succeeds:
			do statue arrival.


To set/now/change the/-- pronoun/-- it/its to/is/are/mean/means/refer/refers to/-- (character - an object): (- (SetPronoun('it',{character})); -). [with this bit of code, you can manually tell the game what the pronoun 'it' refers to, when relevant.]

To do statue arrival:
	now terror statue is in location;
	now statueprime is 1; [primes you to die by terror statue if you're still in the same room next turn]
	say "[one of]A white statue materialises in the room. Perspiration immediately breaks out on your forehead. You instinctively realise that this is the thing called [Terror Statue][or][terrorappears][stopping].";
	set pronouns from terror statue;
	now it means terror statue. [statue is a male, so if I want pronoun 'it' to refer to him just after he appears by cheapie teleport, I need to set it manually]

To say terrorappears:
	say "[Terror Statue] materialises in the room ";
	if location is plushroom and clockstat is 4:
		say "(not on the rug) ";
	say "and your heart skips a beat".

To terrorkill:
	say "A cold wall of pure fear is radiating from the statue. Your limbs tremble, your blood runs icy, then every part of you just stops at once.";
	end the story saying "You died at the inert hands of [Terror Statue].";
	follow the shutdown rules.



Book - Player post-movement routine

After going:
	if clockwork girl is in room gone from: [If player just left location of clockwork girl -]
		now clockhistory is the room gone from; [- note where they left her.]
	if clockstat is 0 and location is clockinducing: [If player is in a clockinducing room and clockwork girl hasn't been activated yet -]
		now clockstat is 1; [- prime the clockwork girl to appear at next opportunity.]
	now statuesafe is 0; [Clear player's temporary protection from terror statue if it was set in present location]
	now statueprime is 0; [Clear the record of time spent in presence of statue]
	if clockstat is 2: [If clockwork girl is operational -]
		now clockfear is 1; [- prime her to reappear in the next room  in which she's allowed to do so.]
	if location is goldroom:
		now goldprime is 1; [If we moved to goldroom, prime room's trap to click again]
	otherwise:
		now goldprime is 0;
	continue the action. [By default, AFTER rules stop the flow of the action after they fire, unless you specify otherwise. Hence this line is vital to keep the game moving properly. It's safer to use 'carry out going' rules in general to avoid having to remember this, but psychologically I prefer my post-going stuff to be in an AFTER rules book, so I do things the way I've done them here.]



Volume - Locations

Book - backdrops

[here's a reminding list of all rooms by their internal names: clifftop, Vestibule, Creaky hall, Contrition Corner, secret, Western Way, goldroom, Eastern Way, pinkroom, Bedroom, plushroom]

the floor is a backdrop. the floor is in Vestibule, Creaky hall, Contrition Corner, secret, Western Way, goldroom, Eastern Way, pinkroom, Bedroom, plushroom.

a wall is a backdrop. wall is in Vestibule, Creaky hall, Contrition Corner, secret, Western Way, goldroom, Eastern Way, pinkroom, Bedroom, plushroom.

the walls are a plural-named backdrop. walls are in Vestibule, Creaky hall, Contrition Corner, secret, Western Way, goldroom, Eastern Way, pinkroom, Bedroom, plushroom.

the ceiling is a backdrop. ceiling is in Vestibule, Creaky hall, Contrition Corner, secret, Western Way, goldroom, Eastern Way, pinkroom, Bedroom, plushroom.

the regular hall is a privately-named backdrop. regular hall is in vestibule, creaky hall. Printed name of regular hall is "hall". Understand "hall/hallway" as regular hall.
Instead of examining regular hall: try looking.

a doorway is a backdrop. doorway is everywhere. Understand "doorways" as doorway.

the ghosterington manor is a backdrop. ghosterington manor is everywhere. printed name of ghosterington manor is "manor".
Instead of examining ghosterington manor: try looking.



the manor's famous front door is a backdrop. manor's famous front door is in clifftop and vestibule. The printed name of manor's famous front door is "door".
Understand "manor/manors door", "manor/manors famous/front door", "manors famous front door" as manor's famous front door.

Instead of opening manor's famous front door:
	say "[no-time]The manor's famous front door is always open."

Instead of closing manor's famous front door:
	say "[no-time]Nobody can close the manor's famous front door. It is always open."



Book - clifftop

Clifftop is a room. "[first time]Windswept and thoroughly bedraggled, you finally manage to haul yourself over the top of the cliff. Untangling yourself from your climbing pack, you contemplate that which stands before you. [only]Ghosterington Manor is huge, black, wooden and windowless. Its famously inviting front door stands to your north. The cliff plummets away from you in all other directions, making you dizzy.[paragraph break](WHEN YOU'RE READY TO LEAVE THE MANOR, COME BACK HERE TO THE CLIFFTOP.[first time])[paragraph break](Want or need help? Type HELP[only])". Printed name of clifftop is "Clifftop".

cliff is a scenery in clifftop. Description of cliff is "It's a loooooong way down."

sky is a scenery in clifftop. Description of sky is "It's beautiful with stars, but your business lies ahead of you in the manor."

Ghosterington Manor is a scenery in clifftop. Instead of examining Ghosterington Manor, try looking.
Understand "black", "black manor" as Ghosterington Manor.

pack is an improper-named thing. pack is in clifftop. printed name of pack is "climbing pack". Indefinite article of pack is "your". Description of pack is "The pack is a big pile of ropes and pulleys you used to get up here. You'll leave it here by the cliff until it's time to leave.". [ideally I would call the object itself 'climbing pack' but I was having some weird compilation error that seemed to be solved by just changing its name to 'pack'. Rather than argue, I chose to call the object 'pack'.]
Understand "climbing", "climbing pack" as pack.

ropes is a plural-named thing. ropes are part of pack. Understand "rope" as ropes.

pulleys is a plural-named thing. pulleys is part of pack. Understand "pulley" as pulleys

Instead of doing anything to ropes: try examining pack.
Instead of doing anything to pulleys: try examining pack

Instead of doing anything other than examining to pack: try examining pack.

Instead of going west in clifftop:
	say fally mcfall.
Instead of going east in clifftop:
	say fally mcfall.
Instead of going south in clifftop:
	say fally mcfall.

To say fally mcfall:
	say "[no-time]It's a drop of several hundred feet off the cliff in that direction. You'd best enter the manor instead."

Instead of going down in clifftop:
	say "[no-time]You'll put off thinking about descending this wretched cliff until you've made it out of the manor alive."



Book - Vestibule

North of clifftop is Vestibule. Description of vestibule is "The vestibule of Ghosterington Manor is a well-appointed hall of black marble. Doorways lead west and north, and you can leave the manor to the south.".

black marble is scenery in vestibule. Description of black marble is "It's beautiful. Apparently this is what bad poetry can buy."

Instead of going south from vestibule:
	if poemfinds is less than 4:
		let answer be the yesno_answer_with_question "Once you leave the manor it will be too dangerous to return. Do you still want to leave? [bold type](Y/N)[roman type][line break]";
		if answer is "NO":
			instead say "[no-time]Okay. You'll keep exploring.";
	do the finale.



book - Creaky Hall

Creaky hall is west of vestibule. Description of creaky hall is "You're in a creaky, high-ceilinged hall of blackest wood. There are rooms west and east from here."

blackest wood is scenery in creaky hall. Description of blackest wood is "There's none blacker.". Understand "black", "black wood" as blackest wood.



book - Contrition Corner

Contrition Corner is west of creaky hall. Description of Contrition Corner is "You're in the fabled Contrition Corner, where Vigilance Ghosterington was said to have flagellated himself after writing each of his awful poems. The stories must have been true because the walls really are red with his blood! Doorways leave this creepy room to the north and east."

Understand "blood" as wall when location is Contrition Corner.

Instead of taking wall when location is Contrition Corner:
	say "It's not going anywhere."

Instead of examining wall when location is Contrition Corner:
	say bloody wall desc.

Instead of examining walls when location is Contrition Corner:
	say bloody wall desc.

To say bloody wall desc:
	say "[no-time]The walls are dark with the ancient dried out blood of a self-hating bad poet. It's sad. Sad and gross."

the corn is privately-named scenery. The corn is in contrition corner. Description of corn is "It is entirely satisfactory, possessing all the properties that make a corner what it is." Understand "contrition/corner", "contrition corner" as corn. [I called the corner object 'corn' rather than 'corner' to avoid a namespace clash with the room itself, whose name is Contrition Corner]


a painting is in Contrition Corner. "On the west wall is a painting of Vigilance Ghosterington himself." Description of painting is "Ghosterington's generally weak and tardy face, pale beneath his widow's peak, is compensated for by a rather cruel but good-looking mouth.".
Understand "vigilance/ghosterington", "vigilance ghosterington" as painting.

Instead of taking painting:
	say "You're not here for the painting, but you give it a tug out of curiosity. Nope, it's stuck fast to the wall and weighs a ton as well."  


the painting's face is a part of painting. Description of painting's face is "The way it's been painted, your attention is drawn to the mouth." Understand "painting/paintings/his face", "vigilance/vigilances/vigilance's face", "ghosterington/ghosteringtons/ghosterington's face", "vigilance ghosterington face", "vigilance ghosteringtons face", "vigilance ghosterington's face" as painting's face.

the widow's peak is a part of painting. Description of widow's peak is "Just like Bela Lugosi in Dracula. Your attention is drawn to Vigilance's mouth.". Understand "widows", "widows peak" as widow's peak.

the eyes are a part of the painting. Description of eyes is "Ghosterington's eyes seem to follow you around. You expected no less. Even more interesting-looking is the mouth." Understand "eye", "his eye/eyes" as eyes.

the mouth is part of the painting. Understand "his/vigilance/vigilances/vigilance's mouth" as mouth.

To decide whether (target - a thing) is painty:
	if target is the painting or target is part of the painting:
		decide yes;
	otherwise:
		decide no.

Check examining when noun is painty:
	if terror statue is in location:
		say "You begin to contemplate [the noun] -[paragraph break]"; [cue your death if you try to x any element of painting with statue present]
		instead terrorkill;
	if noun is mouth:
		say "As you step closer to examine the mouth, a tiny voice from behind the painting whispers:[paragraph break]'Brown cow's what I used to use[line break] I need another living muse[line break] tell me now what should it be[line break] as well you might, ho ho, hee hee!'";
		now the command prompt is "What will you say in response to this abysmal poem? >";
		rule succeeds.

After reading a command when the command prompt is "What will you say in response to this abysmal poem? >":
	now the command prompt is ">";
	say line break;
	let response be text; [6L38] [In 6G60 this had to be specified as 'indexed text'.]
	now response is the player's command;
	if response exactly matches the text "[colpick] [anipick]":
		say "The painting slides aside and out of sight, revealing a passage to the west.";
		now painting is off-stage;
		now secret is apparent;
		now Description of Contrition Corner is "You're in the fabled Contrition Corner, where Vigilance Ghosterington was said to have flagellated himself after writing each of his awful poems. The stories must have been true because the walls really are red with his blood! Doorways leave this creepy room to the west, north and east.";
	otherwise:
		say "The voice whispers:[paragraph break]'[one of]You got it wrong[line break] kaboo, kabong!'[or]With suchly flunk[line break] You truly stunk.'[or]Your answer, poorly,[line break] makes me sorely.'[or]You spake more proof[line break] that you're a goof.'[in random order]";
	reject the player's command.

Instead of going west in contrition corner when secret is not apparent:
	say "[no-time]You can't go that way."



Book - Ooooh, a Secret Room! (secret)

secret is west of Contrition Corner. secret is not apparent. Description of secret is "[first time]Few things are more exciting in an adventurer's life than the discovery of a secret room. These things include: jetpacking around Mount Everest, playing Twister on the moon and sharing a pot of tea with Lara Croft. You have done all these things, but you're still pretty pleased to have discovered this tiny secret location in Ghosterington Manor. [only]There's a lever on the wall and an exit to the east.". Printed name of secret is "Ooooh, a Secret Room!".


Part - lever programming

a lever is a scenery in secret. Description of lever is "It's labelled [']TERROR['], and is currently in the [lever possie] position."

levpos is a number variable. [store the position of the lever. 0=off, 1 =on, as per the lore of flags]
levpos is 1.

To say lever possie:
	if levpos is 1, say "on";
	otherwise say "off".

Understand "move" as pulling.

toggling is an action applying to one thing.
Understand "toggle [something]" as toggling.
Report toggling:
	say "That won't help."

Instead of pulling lever:
	try toggling lever.

Instead of pushing lever:
	try toggling lever.

throwing is an action applying to one thing.
Understand the command "throw" as something new.
Understand "throw [something]" as throwing.

Carry out throwing:
	say "[no-time]That won't help."

Instead of throwing lever:
	try toggling lever.

Instead of toggling lever:
	if levpos is 0:
		say "You move the lever to the ON position.";
		now levpos is 1;
	otherwise:
		say "You move the lever to the OFF position.";
		now levpos is 0;
		now Terror Statue is off-stage.



Book - Western Way

Western Way is north of contrition corner. Description of Western Way is "The western way continues in all directions – except west."



Book - Golden Room (goldroom)

goldroom is east of western way and north of creaky hall. Description of goldroom is "This is a room made of solid, shining gold. Exits lead in all directions." Printed name of goldroom is "Golden Room".

gold is scenery in goldroom. Description of gold is "It's obviously lovely, but these clicking sounds are making you nervous."


Part - Golden Room trap programming

goldprime is a number variable. [if 1, we've just moved to golden room and the clicks should be incremented]
goldclicks is a number variable. [store the number of times the room has clicked]

Every turn when location is goldroom:
	if goldprime is 1:
		now goldprime is 0;
		increment goldclicks;
		if goldclicks is 1:
			say "You hear a click from the floor as you enter the room.";
		otherwise:
			say "You hear [goldclicks in words] clicks from the floor as you enter the room.";
		if goldclicks is 3:
			say "[line break]In an instant, the golden ceiling descends to the floor, crushing you flat.";
			end the story saying "The glory that was you has become nought more than a puddle.";
			follow the shutdown rules.



Book - Eastern Way

Eastern Way is north of vestibule and east of goldroom. Description of Eastern Way is "The eastern way continues in all directions – except east."



Book - Pink Room (pinkroom)

pinkroom is north of eastern way. Description of pinkroom is "This room is upholstered in pink velvet. The nauseating colour and texture makes you shudder. Exits lead west and south." Printed name of pinkroom is "Pink Room".

pink velvet is scenery in pinkroom. Description of pink velvet is "The pink velvet offends your eyeballs.".



Book - bedroom

Bedroom is west of pinkroom and north of goldroom. Description of bedroom is "There's a big, dusty bed here. You wonder if Ghosterington ever really slept in this manor. The place has shown no signs of being anything than unliveable. Exits go west, south and east."



Book - plush room (plushroom)

plushroom is north of western way and west of bedroom. Description of plushroom is "This is a plush room brightly lit by panels far above you in the walls and with a lush rug underfoot. Exits go south and east." Printed name of plushroom is "Plush Room".

the rug is a scenery in plushroom. Description of rug is "[rugdesc]."
Understand "floral", "floral rug" as rug.

To say rugdesc:
	if clockstat is 4 or clockwork girl is not in location:
		say "The floral rug is luxurious. It's also loose on the floor, though there's nothing underneath it.";
	otherwise:
		say "The rug looks a bit loose. The [clockwork girl] is standing on it, watching you"

Understand the command "lift" as "get". [make 'lift' a synonym for 'get', to catch attempts to 'lift rug']

Instead of taking rug:
	if clockstat is 4:
		instead say "[no-time]The rug isn't going anywhere with the [clockwork girl]'s weight on it. You don't need it, anyway.";
	if clockwork girl is not in location:
		instead say "You don't need to take the rug with you, and while there's nothing underneath it, you note that it is loose on the floor.";
	instead try pulling rug.

panels are scenery in plushroom. Description of panels is "They're lovely, but well out of reach."
Understand "panel" as panels.



Volume - Props

Book - six shooter

shots is a number variable. [stores number of shots player has left]
shots is 3.

jubilee carries a pistol. Description of pistol is "This trusty weapon has extricated you from more sticky situations than you can recall. [bullet count].". printed name of pistol is "six shooter".
Understand "gun/revolver/weapon", "six", "shooter", "six shooter" as pistol.

Instead of dropping pistol:
	take no time;
	if shots is not 0:
		say "Parting with your six shooter is a daft idea.";
	otherwise:
		say "This pistol has been with you through thick and thin. You'd never ditch it unless it was absolutely necessary."


bullets is a plural-named part of pistol. Description of bullets is "There's no need to open your pistol now."
Understand "bullet" as bullets.

Instead of dropping bullets: say "[no-time]You won't be doing that... The pressure of this night must really be getting to you."

to say bullet count: 
	if shots is:
		-- 3: say "It's loaded with three bullets";
		-- 2: say "You've got two more bullets";
		-- 1: say "You've got one shot left";
		-- 0: say "But you're out of ammo".



Part - shooting

shooting is an action applying to one thing.

Understand the commands "kill", "murder" as something new.

Understand "shoot [something]", "shoot at [something]", "kill [something]", "murder [something]" as shooting.

Check shooting:
	if shots is 0:
		instead say "[no-time]You're out of ammo. You can't shoot anything!";
	if noun is player or noun is enclosed by player:
		instead say "[no-time]Get a grip! You're Jubilee Grief, famous adventurer!";
	if noun is sky or noun is cliff or noun is pack or noun is enclosed by pack:
		instead say "[no-time]What a stupid idea. You must still be dizzy from the climb.";
	if noun is painting or noun is enclosed by painting:
		instead say "[no-time]Destroying cultural artifacts with firearms is not your style.";
	if noun is veins:
		instead say "[no-time]Those are too small to aim at. It's not worth risking such a shot when you've so little ammo.";
	if noun is enclosed by clockwork girl and noun is not axe:
		now noun is clockwork girl;
	if noun is a hidey or noun is enclosed by a hidey or noun is a backdrop or noun is a scenery or noun is lever:
		instead say "[no-time]You shouldn't waste precious ammo on furniture and the like.";
	decrement shots;
	if shots is:
		-- 0: now bullets is off-stage;
		-- 1: now bullets is singular-named;
	if noun is the axe:
		say "You carefully aim at the [if clockstat is 4]downed [end if][clockwork girl]'s axe and squeeze the trigger -[paragraph break]DING! -[paragraph break]The shot just glances off.";
	if noun is clockwork girl:
		if clockstat is 4:
			say "SPTANG! - You fire into the downed [clockwork girl] but it seems to have no effect. She continues to flop around.";
		otherwise:
			say "SPTANG! – You put one right between the [clockwork girl]'s eyes. She growls and wobbles, but you can see you just dented her metal skull. In a state of apparent confusion, she staggers out of the room.";
			now clockwork girl is off-stage;
	if noun is Terror Statue or noun is enclosed by Terror Statue:
		say "The statue vanishes in the blink of an eye just before your bullet would have hit it.";
		now terror statue is off-stage;
		now statueprime is 0; [clear terror statue presence counter]
		now statuesafe is 1; [prevent terror statue reappearing in present room]
	say line break;
	if shots is 2:
		say "You've got two more bullets.";
	if shots is 1:
		say "You've got one shot left.";		
	if shots is 0:
		say "[italic type]That was your last bullet[roman type].";
	rule succeeds.



Book - Fob off non-shooting attacks

Understand the commands "slap", "kick", "tackle", "trip" as "attack". [4 extra synonyms for attack]

Instead of attacking clockwork girl:	
	say "[no-time]Going near the axe-wielding [clockwork girl] would be super dangerous. The only way to attack her is to shoot at her[shoot comment].".

Instead of attacking Terror Statue:
	say "[no-time]Your fear prevents you from approaching [Terror Statue]. The only way to attack him is by shooting at him[shoot comment]."

To say shoot comment:
	if shots is 0, say ". And you're out of bullets".



Book - Hidies

Part - Hidey mechanics

[A hidey is going to be a piece of scenery which will give the player either a poem or one of the two pieces of paper when it's first searched.]

A hidey is a kind of thing. a hidey is usually fixed in place. a hidey has a number called checked.

poemfinds is a number variable. [number of poems found]
paperfinds is a number variable. [number of pieces of paper found]


[The following grammar makes 'search' the same as 'examine' in this game:]

Understand "look inside/in/into/through [something]" as examining.
Understand "examine inside/in/into/through [something]" as examining.

Understand the command "search" as something new.
Understand the command "search" as "examine".


Instead of examining a hidey (called target):
	if checked of target is 1:
		instead say "[no-time]You already searched [the target]. There's nothing else there.";
	if clockwork girl is dangerous or terror statue is in location:
		instead say "You make a move towards [the target] -[paragraph break]"; [cue your death if you try to search a hidey with a baddie present]
	now checked of target is 1;
	if target is bed:
		say "You rummage through the bed and find a sheet of paper hidden amongst the sheets. You take it.";
		instead getpaper;
	if target is long dead plant:
		say "One of the papery leaves is in fact not a leaf but a piece of paper. You take it.";
		instead getpaper;
	if target is small vanity:
		say "In a drawer of the vanity you find a crumpled sheet of paper. ";
		instead getpoem;
	if target is writing desk:
		say "Can it be? There's actually a dusty sheet of paper still here on the desk. ";
		instead getpoem;
	if target is armoudillo shell:
		say "You turn the shell over and a piece of paper tumbles out. ";
		instead getpoem;
	if target is chest:
		say "You open the chest and find something inside. ";
		instead getpoem.

To getpaper:
	increment paperfinds;
	if paperfinds is:
		-- 1:
			now the player has papone;
			now eastern way is proclock;
			if clockstat is 0: [If clockwork girl not active yet in the game when player finds first piece of paper -]
				now clockstat is 1; [she is now.]
		-- 2:
			now the player has paptwo.

To getpoem:
	increment poemfinds;
	say "It's one of Vigilance Ghosterington's poems! ";
	if poemfinds is:
		-- 1:
			now player has scissors poem;
			say "It's his famous scissors poem. ";
		-- 2:
			now player has Thomas Hardy poem;
			say "It's his famous Thomas Hardy poem. ";
		-- 3:
			now player has Molecular Biology poem;
			say "It's his famous Molecular Biology poem. ";
			now statueodds is 3; [terror statue will appear 1 in every 3 moves once you have 3 poems]
		-- 4:
			now player has lobster poem;
			say "It's his famous lobster poem. You've hit the jackpot! ";
	say "You carefully take the poem."
	



Part - bed

the bed is an undescribed hidey. bed is in bedroom. Understand "dusty/sheet/sheets/bedsheet/bedsheets", "dusty bed", "bed sheet/sheets", "bed-sheet", "bed-sheets" as bed. [paper clue here]



Part - small vanity

a small vanity is a hidey. "There's a small vanity here.". the small vanity is in pinkroom. [poem here]

Instead of opening vanity: try examining vanity.


a mirror is a fixed in place part of small vanity.

Instead of examining mirror: try examining jubilee.



Part - writing desk

a writing desk is a hidey. "A writing desk is here. This must be where Ghosterington birthed his dread works.". writing desk is in plushroom. [poem here]

Instead of opening writing desk:
	try examining writing desk.



Part - long dead plant

a long dead plant is a hidey. "A long dead plant sits in a pot here, black and thoroughly dry." Understand "black/potplant/pot-plant", "dead/black potplant/pot-plant", "dead/black pot plant", "long/black dead potplant/pot-plant", "long/black dead pot plant" as long dead plant. long dead plant is in eastern way. [paper clue here]

a pot is part of a long dead plant.

Instead of examining pot, try examining long dead plant.

Instead of taking long dead plant:
	if checked of long dead plant is 0:
		say unwieldy sob story;
	otherwise:
		say sob story sequel.

To say unwieldy sob story:
	say "[no-time]You can tell at a glance that it's unwieldy and would reduce your ability to adventure. It might be worth examining more closely, though."

To say sob story sequel:
	say "[no-time]You don't need it. It's unwieldy and you've established that it would reduce your ability to adventure."


Part - armoudillo shell

an armoudillo shell is a hidey. "An armoudillo shell lies discarded on the floor here.". armoudillo shell is in western way. [poem here]

Instead of taking armoudillo shell:
	if checked of armoudillo shell is 0:
		say unwieldy sob story;
	otherwise:
		say sob story sequel.


Part - chest

a chest is a hidey. "Trying and failing to be inconspicuous in the corner is a chest.". chest is in secret. [poem here]

Instead of opening chest:
	try examining chest.

Instead of taking chest:
	say "[no-time]It's too heavy."



Part - the papers /scraps

a scrap is a kind of thing.

papone is a privately-named scrap. Description of papone is "There's one word on it: [anipick].". Understand "piece/paper", "piece of paper a", "piece/paper a", "a" as papone. Printed name of papone is "paper A".

paptwo is a privately-named scrap. Description of paptwo is "There's one word on it: [colpick].". Understand "piece/paper", "piece of paper b", "piece/paper b", "b" as paptwo. Printed name of paptwo is "paper B".

Instead of dropping a scrap:
	say "[no-time]No need to drop it."

Does the player mean doing anything to paptwo: it is likely.



Part - the poems / verses

a verse is a kind of thing. a verse has a number called worth.

Instead of dropping a verse:
	say "[no-time]Dropping this valuable terrible poem would be super daft!"


reading is an action applying to one thing.
Understand the command "read" as something new. [this line eliminates the "read" grammar established in the Standard Rules so I can make 'read [something]' lead to my new action, 'reading']
Understand "read [something]" as reading.

Check reading:
	if noun is not a verse and noun is not a scrap:
		instead say "[no-time]You can't read that."

Carry out reading:
	try examining the noun.
	

There is a verse called the scissors poem. Description of scissors poem is "[line break][italic type]Don't Run With Scissors[roman type][paragraph break]When I see a girl[line break]with heartbreaking eyes[line break]I run up to her post-haste and cry,[paragraph break]'Don't run with scissors,'[paragraph break]I'd hate it if you put out your eye[line break]The guck on me would make me scream[line break]It'd really suck when you couldn't see[line break]how freaked I was by your eyejuice on me".

worth of scissors poem is 1.

There is a verse called the Thomas Hardy poem. Description of Thomas Hardy poem is "[line break][italic type]Thomas Hardy 2000[roman type][paragraph break]Yo, write me, Tess of the D'Urbervilles![line break]A-where you been hiding your mad email skills?[line break]I'm up here jumping like a yeoman[line break]but I kinda got the feeling you been on the lam.[paragraph break]You tell me that you lost yo['] net connection[line break]and it ain't up on the heath, DAMN GIRL, I made an inspection![line break]You say you're a tall chick and just wanna have fun[line break]but this silence sucks some major ass and's making me glum".

worth of Thomas Hardy poem is 2.

There is a verse called the Molecular Biology poem. Description of Molecular Biology poem is "[line break][italic type]Molecular Biologist Love[roman type][paragraph break]What would you say if I said, 'You have nice genes, babe.' ?[paragraph break]Let's wear white labcoats and have dinner sometime.[paragraph break]If I was a molecular biologist, I'd add some ligase to your buffer right now. In my lab, you'd find all the restriction enzymes you'd ever need.[paragraph break]In my lab, there would always be a bottle of fine white wine on the ice – stored in a separate refrigerator to the molecular biology specimens, of course."

worth of Molecular Biology poem is 4.

There is a verse called the lobster poem. Description of lobster poem is "[line break][italic type]Walking My Lobster On The Banks Of The Seine[roman type][paragraph break]I tied my lobster to a tree. I came back later, but woe was me![line break]'Oh where oh where can my lobster be?' (I asked no-one in particular.)[line break]Mirelle offered the following: 'Perhaps he has eloped in the romantic tradition.'[line break]I considered what Mirelle had told me.[line break]We disagreed, and a short while later our relationship began to go downhill.[paragraph break]My lobster ne'er was returned to me! Now I walk the Seine alone."

worth of lobster poem is 9.



Volume - Action stuff

Book - Prevent GET/TAKE ALL and other tweaks

Understand the command "take" as something new.

Understand "take" as taking.
Understand "take [something]" as taking. [changing 'things' to 'something' here eliminates 'get all' by sending it to 'can't verb multiple objects' error]
Understand "take off [something]" as taking off.
Understand "take [something] off" as taking off.
Understand "take inventory" as taking inventory.

Understand the command "get" as something new.

Understand "get in/on" as entering.
Understand "get out/off/down/up" as exiting.
Understand "get [something]" as taking.
Understand "get in/into/on/onto [something]" as entering.
Understand "get off/down [something]" as getting off.
Understand "get [something] from [something]" as removing it from.


Instead of taking clockwork girl:
	say let's get sane.

Instead of taking Terror Statue:
	say let's get sane.

To say let's get sane:
	say "[no-time]That's beyond your power."

Before eating an inedible thing:
	say "[no-time]Let's get sane.";
	rule fails.



Book - SCORE

Check requesting the score:
	if poemfinds is:
		-- 0: say "You haven't found any of the four poems yet.";
		-- 4: say "You have all four poems. It's time to get out of here!";
		-- otherwise: say "You've found [poemfinds in words] of the four poems so far.";
	rule succeeds.



Book - SLEEP

Instead of sleeping:
	take no time;
	say "[lazybum]."

To say lazybum:
	say "Sleeping on the job is both unprofessional and potentially deadly"

Understand "sleep [text]" as a mistake ("[lazybum].").



Book - Time adjustments and the time limit

Carry out looking:
	if the room-describing action is the looking action and turn count is not 1, take no time. [what this line does: If player types LOOK, no time passes. but LOOKs automatically run by the game on entering a new room still allow time to pass, as they should. One special case: The LOOK carried out on the first turn of a game doesn't happen via the normal mechanisms and is therefore an exception which needs to be accounted for.]

Check examining:
	if noun is a verse or noun is a scrap:
		if clockwork girl is dangerous or terror statue is in location:
			instead say "You start to read [the noun] -[paragraph break]"; [player will die right after this message is printed, by one bad guy or the other]
	otherwise: [... reading redirects to examining, and it takes a minute, but all other EXAMINEs take no time]
		take no time. [This makes the default examining action a free move that doesn't trigger any enemy behaviour. The Ectocomp version of the game had no such niceties.]

Carry out taking inventory:
	take no time.


To redraw status line: (- DrawStatusLine(); -).

At 11:59 PM: [this action doesn't go off until the end of the 11:59 PM turn, which is really the start of the 12 AM turn. To make the status bar actually display 12 AM at this moment, I need to force it and redraw it:]
	now the time of day is 12:00 AM;
	redraw status line;
	say "[bold type]--- UH OH, IT'S MIDNIGHT ---[roman type][paragraph break]";
	if location is not clifftop:
		say "Ghosterington Manor vanishes and you vanish along with it.";
		end the story saying "You disappeared from the face of the earth.";
		follow the shutdown rules;
	otherwise: [if smartarse player never entered the manor in the first place -]
		say "Ghosterington Manor vanishes – and you never even ventured inside!";
		end the story saying "You failed spectacularly.";
		follow the shutdown rules.


wanting the time is an action out of world.

Understand "time" as wanting the time.

Report wanting the time:
	say "It's currently [time of day]."



Volume - The Finale

To do the finale:
	if poemfinds is 0:
		end the story saying "You made it out alive, but you didn't retrieve any of the poems. Ghosterington Manor has triumphed for another year.";	
	otherwise:
		say "Thus ends [bold type]Ghosterington Night[roman type][paragraph break]";
		if poemfinds is 1:
			end the story saying "Good work! You retrieved one of the poems from the manor, the scissors poem. Its value is one million dollars. When the sun comes up, Ghosterington Manor is gone, and it's not a bad day to be you, Jubilee Grief, millionaire adventurer.";
		otherwise:
			say "You retrieved the following poems from the manor:[paragraph break]";
			say fixed letter spacing;
			say "    POEM                        MONETARY VALUE[line break]";
			let X be a number;
			let T be text; [6L38] [In 6G60 this had to be specified as 'indexed text'.]
			repeat with Y running through verses:
				if player holds Y:
					now T is "[The Y]";
					let N be number of characters in T;
					let D be 30 minus N;
					say "[T]";
					repeat with Z running from 1 to D:
						say " ";
					say "[worth of Y] million dollars[line break]";
					now X is X plus worth of Y;
			say "[line break]Total monetary value: [X] MILLION DOLLARS[paragraph break]Total cultural value: HIGHLY QUESTIONABLE";
			if poemfinds is 4:
				end the story saying "Congratulations! You retrieved all four poems from the manor and lived to tell the tale! When the sun comes up, Ghosterington Manor is gone, but it's truly a great day to be you, Jubilee Grief, millionaire adventurer.";
			otherwise:
				end the story saying "Great work! You retrieved [poemfinds in words] of the poems from the manor and survived!  When the sun comes up, Ghosterington Manor is gone, but it's a good day to be you, Jubilee Grief, millionaire adventurer.";
	follow the shutdown rules.



Volume - password data

Table of firstword
hue
"magenta"
"blue"
"brown"
"green"
"orange"
"pink"
"purple"
"red"

Table of critters
beast
"alligator"
"bear"
"bird"
"camel"
"cat"
"chicken"
"chimpanzee"
"crocodile"
"deer"
"dog"
"dolphin"
"duck"
"eagle"
"elephant"



Volume - loser mode (an easter egg of sorts)

losermode is a number variable. [If player types XYZZY, the unfairly titled 'loser mode' is activated and the game's text output is deliberately messed up. This is how I jokily express my disaproval of people continuing to implement XYZZY in games.]

Wanting to lose is an action applying to nothing.

Understand "xyzzy" as wanting to lose.

Carry out wanting to lose:
	repeat with R running through rooms:
		now printed name of R is "xyzzy";
		now description of R is "xyzzy";
	repeat with R running through things:
		now printed name of R is "xyzzy";
		now description of R is "xyzzy";
		now initial appearance of R is "xyzzy";	
	now losermode is 1.

Report wanting to lose:
	say "'Don't say that,' booms an eldritch voice."
	
xyzzy is a privately-named backdrop. xyzzy is everywhere.
Understand "xyzzy" as xyzzy when losermode is 1.

Instead of doing anything to xyzzy: say "You feel confused."



Volume - Extension data and modifications

Book - Variable Time Control modification

[my below addition prevents 'every turn' rules going off if [no-time] was set during the turn. Without my addition, every turn rules go off irrespective of [no time] tags]

This is the NEW every turn stage rule:
	unless time-reset is true, follow the every turn rules.

The NEW every turn stage rule is listed instead of the every turn stage rule in the turn sequence rulebook.



Book - Changes to default Responses

The can't go that way rule response (A) is "[no-time][We] [can't go] that way."

The parser error internal rule response (A) is "Sorry? I didn't understand that."

Understand "sing" as a mistake ("One of your basic rules is 'Make no unnecessary noise when in a dangerous situation."). [6L38] [Singing was removed as a default action after Inform 6G60, but I had a special blocking response in place for it. Note that I don't add a 'no-time' instruction to this line because actions defined as 'mistakes' already take no time as far as Variable Time Control is concerned.]

The innuendo about squeezing people rule response (A) is "[no-time]No."

The block kissing rule response (A) is "[no-time]No."



Book - ShadowChaser's Useful Functions Extension Excerpts

Part - Keypresses and Space

To decide what number is the key_pressed: 
	let keypress be 0;
	while keypress is 0:
		let keypress be the chosen letter;
	decide on the keypress.

To decide what number is the key_pressed_with_question (question - some text):
	say "[question][line break]";
	decide on the key_pressed.

To get_the_space_key:
	let keypress be 0;
	while the infinite_loop is true:
		let keypress be the chosen letter;
		if keypress is 32, make no decision.

To WaitForSpace:
	say "[line break]<<  Press SPACE to continue  >>[run paragraph on]";
	get_the_space_key.


Part - Yes / No

To decide what text is the yesno_answer:
	let the answer be "MAYBE";
	let the exitvalue be 0;
	while the exitvalue is 0:
		let keypress be the key_pressed;
		if keypress is 89 or keypress is 121:
			let the answer be "YES";
			let the exitvalue be 1;
		otherwise if keypress is 78 or keypress is 110:
			let the answer be "NO";
			let the exitvalue be 1;
	decide on the answer.

To decide what text is the yesno_answer_with_question (question - some text):
	say "[question][line break]";
	decide on the yesno_answer.

The infinite_loop is a truth state variable. The infinite_loop is true.


Book - Dicelock Extension by S John Ross (modified)

[I include this extension's code in Ghosterington's source rather than as an extension because the extension (version 1/080522) used a deprecated (soon to be extinct - and in fact, now actually extinct in Inform 6L38) Inform programming expression, and I forbid these in my games. The line which does the forbidding is up at the start of this source. Anyway, I removed the trouble expression from the extension's code and copied the altered code here into Ghosterington's source.]

DiceLock is a number variable.

When play begins: now DiceLock is a random number between 1000 and 9999.
   [Insures that random seeding will still vary from play-through to play-through]
   [With a seed less than 1000, Inform doesn't behave properly]

To lock the dice:
	Seed the random-number generator with DiceLock;
	Sprout the seed;
	If DiceLock is greater than 30000:
		now DiceLock is DiceLock divided by 29. [Recycles the DiceLock before it gets too high]

Before behaving randomly: lock the dice.

Verifying the story file is behaving randomly. [Replace or remove as needed]

To say RandomLock: lock the dice.

To sprout the seed:
	Increase DiceLock by a random number between 0 and 9;
	Increase DiceLock by a random number between 0 and 9;
	Increase DiceLock by a random number between 1 and 9. [all zeroes would be Bad]



Book - Extended Banner Version 5 by Stephen Granade (modified)

Section 1G (for Glulx only)

Include (-

[ SerialNumber i;
	for (i=0 : i<6 : i++) print (char) ROM_GAMESERIAL->i;
];

-)

Section 1Z (for Z-machine only)

Include (-

[ SerialNumber i;
	for (i=0 : i<6 : i++) print (char) HDR_GAMESERIAL->i;
];

-)

Section 2

Include (-

[ I7BuildVersion;
	print (string) NI_BUILD_COUNT, " ";
	print "(I6/v"; inversion;
	print " lib ", (string) LibRelease, ") ";
#ifdef STRICT_MODE;
	print "S";
#endif;
#ifdef INFIX;
	print "X";
#ifnot;
#ifdef DEBUG;
	print "D";
#endif;
];

-)

To decide if (s - text) is not blank: if s is "", decide no; decide yes.

[6L38] [The 'extended story headline' functionality from this extension broke at some point after Inform 6G60, so I just dispense with that code and manually print the words 'An Interactive Fiction' at the appropriate moment.]

To say story serial number: (- SerialNumber(); -).
To say I7 version number: (- I7BuildVersion(); -).

The story copyright string and story rights statement are text variables.

printed_banner is a number variable. [set this to 1 when the game banner is first printed to prevent any accidental reprints]

Last for printing the banner text rule (this is the extended banner rule):
	if printed_banner is 0:
		say the banner info.

To say the banner info:
	say "[bold type][story title][roman type][line break]An Interactive Fiction[if story author is not blank] by [story author][end if][line break]";
	say "Copyright [unicode 169] [story copyright string] by [story author][line break][story rights statement][run paragraph on][line break]";
	say "Release [if release number is not 0][release number][otherwise]1[end if] / Serial number [story serial number] / Inform 7 build [I7 version number][line break]";
	now printed_banner is 1.

Section - Data for Extended Banner

The story copyright string is "2012, 2015".

The story rights statement is "Released under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License[line break]CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)".