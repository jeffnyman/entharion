
the story title is "Marbles, D, and the Sinister Spotlight".
the story author is "Drew Cook".
the story headline is "A new What-Do-I-Do-Now story".

release number is 2.

Volume 1 - preamble

[extensions!]

include Basic Screen Effects by Emily Short.
include glulx entry points by emily short.
include simple multimedia effects for v10 by mathbrush.
include hacking by mathbrush.
include menus by wade clarke.
include basic help menu by wade clarke.
include story mode by drew cook.

release along with a "bisquixe" interpreter.
release along with cover art.

[a property that indicates whether or not the build is for development/testing or public release]

PROD is a truth state that varies.
PROD is usually true.

Book 00000 - not for release

[A way to get debug information before play begins. Code by Zed Lopez.]

Section Debug Rules (not for release)

A debug-verbosity is a kind of value.
The debug-verbosities are rules off, rules on, rules all.
To debug (dv - a debug-verbosity): (- debug_rules = ({dv} - 1); -)

[uncomment below to use]

[after starting the virtual machine, debug rules all.]

[this next one is just a convenience. testers can begin a comment with one of the below symbols and receive a "(noted)" reply in return.]

first after reading a command (this is the playtester's comment rule):
	if the player's command matches the regular expression "^\p|^<*+='>":
		say "(Noted.)";
		reject the player's command;

PROD is false.

[A check to print the "current scene". Not terribly useful at this late stage in development, but useful if scenes aren't changing as expected.]

understand "sd" as a mistake("[sd]")

to say sd:
	say the current scene;

[a generic command I use for printing text or checking things during development. I last used it to get a list of items in the game. before that, it was primarily for debugging the scoring system.]
			
frobbing is an action applying to one thing.
understand "frob [something]" as frobbing.

first before frobbing something:
	repeat with item running through things:
		say item;
		say line break;

		
section fullguide (not for release)

[a cheat command for printing everything in the help menu, including unlockables]

fullguiding is an action out of world applying to nothing.
understand "secret" as fullguiding.

check fullguiding:
	repeat through the table of content availability:
		now availability entry is true;
	try checking the guide instead;
	
	
Volume 2 - data and texts
	
use the serial comma.
use american dialect.
	
Book 1 - texts
	
Part 1 - substitutions

[I use these in every game. Just abbreviations for commonly used substitutions.]
	
To say em:
	say "[unicode 8212]".
	
To say dot:
	say "[unicode 46]".

to say q:
	say "[unicode 0063]".
	
to say ex:
	say "[unicode 0033]".
	
To say tab:
	say "[fixed letter spacing]   [variable letter spacing]".
	
to say itab:
	say "[fixed letter spacing]   [italic type]"
	
To say t2:
	say "[fixed letter spacing]     [variable letter spacing]".
	
to say bk:
	say "[bracket]"
	
to say cb:
	say "[close bracket]"
	
to say it:
	say "[italic type]"
	
to say bt:
	say "[bold type]"
	
to say rt:
	say "[roman type]"
	
to say lb:
	say "[line break]"
	
to say pb:
	say "[paragraph break]"
	
To say fls:
	say "[fixed letter spacing]".

to say vls:
	say "[variable letter spacing]".
	
to say sc:
	say "[unicode 59]".
	
to say rp:
	say "[run paragraph on]".
	
[note that I sometimes change things depending on screenreader preference.]
	
to say oc:
	if screenreader is true:
		say "*";
	otherwise if screenreader is false:
		say "[bt]";
		
to say OC:
	if screenreader is true:
		say "*";
	otherwise if screenreader is false:
		say "[bt]";
		
to say cc:
	if screenreader is true:
		say "*";
	otherwise if screenreader is false:
		say "[rt]";
		
to say CC:
	if screenreader is true:
		say "*";
	otherwise if screenreader is false:
		say "[rt]";
		
to say tloc:
	say "[the location]" in title case.
	
to say cat prompt:
	if screenreader is true:
		say "Paw me!";
	otherwise:
		say ">^-^<";
	say line break;
	wait for any key.


Book 2 - information

Part 1 - kinds, values, etc

Chapter 1 - kinds

["animal" is a built-in kind of "person".]

a cat is a kind of animal.

Chapter 2 - values and variables

[this is used to track where d is going or else where he is meant to be.]

a person has a room called the destination.

[this is probably familiar, just a simple property to track what the player has looked at.]

a thing can be examined or unexamined.
a thing is usually unexamined.
	
first after examining something unexamined:
	if the noun is in the location:
		now the noun is examined;
		continue the action;
		
[a similar tactic. the "meow tracker" suppresses D's atmospheric texts when he is interested in the aughtlight. its use is largely redundant to that of other "suppression" variables: prevent D from saying things while he is already responding to something else. coordinating D's quips with Marble's actions was an ongoing challenge.]
	
a thing can be discussed or undiscussed.
a thing is usually unexamined.

after meowing at something (this is the meow tracking rule):
	now meow tracker is true;
	if the noun is undiscussed:
		now the noun is discussed;
	now fascination damper is true;
	continue the action.
	
[this property is used to determine whether the requirements for ending scene "discover the aughtlight" have been met.]
	
a thing can be ripe for discussion.
a thing is usually not ripe for discussion.
definition: the metal folding chair is ripe for discussion if the D index is two.

[this is likewise for the "ripe for discussion" property.]

D index is a number that varies.
D index is zero.

[this property is almost exclusively used to talk about the bag, so I could have said things like IF THE BAG IS IN THE AUDITORIUM but I think this reads better.]

a thing can be discovered or undiscovered.
a thing is usually undiscovered.

[I feel like I was trying to make a point with this overly long property name, but I'm not sure what that would have been. This is used one time: when the scene "inspect the box" ends, any item with this property is moved to center stage.]

a thing can be a prop in inspect the box.
a thing is usually not a prop in inspect the box.

[this is used--incorrectly, I'd say--to print a message about taking things other than the bag. could I have done that without a global variable and a custom action? gosh, I hope so!]

a thing can be takeable or untakeable.
a thing is usually untakeable.

[the generic transit flag is set to "true" whenever Marbles is moving between rooms. It prevents ambient messages from printing, since those might contradict the transit messages. It could also be used for any other case where it matters whether Marbles is on the move or not.]

generic transit flag is a truth state that varies.
generic transit flag is false.

[fascination damper will prevent texts about D's interests from printing. It often is used in conjunction with D moving from area to area.]

fascination damper is a truth state that varies.
fascination damper is usually false.

[suppression flag is used to prevent ambient texts in other, unrelated situations (examining a specific object, for instance). Used for specific, not general actions.]

suppression flag is a truth state that varies.
suppression flag is usually false.


chapter 3 (status line)

[this code is by Phil Riley. he gave it to me to hide the status bar in Repeat the Ending]

Include
(-

[ InitStatusWindow sty;
 if (gg_statuswin == 0) {
	statuswin_cursize = statuswin_size;
	if (0) {
		for (sty=0: sty<style_NUMSTYLES: sty++)
			glk_stylehint_set(wintype_TextGrid, sty, stylehint_ReverseColor, 1);
	}
	gg_statuswin =
		glk_window_open(gg_mainwin, winmethod_Above | winmethod_Fixed, statuswin_cursize, wintype_TextGrid, GG_STATUSWIN_ROCK);
}
];
-)

To close the/-- status window:
	(- if (gg_statuswin) glk_window_close(gg_statuswin, 0); gg_statuswin = 0; -)

hiding the status line is an action applying to nothing.
revealing the status line is an action applying to nothing.

To initialize/initialise the/-- status window:
	(- InitStatusWindow(); -)

Carry out hiding the status line:
	close the status window;

Carry out revealing the status line:
	open the status window;
	
To open the/-- status window:
	initialize the status window;

[this code is by Zed Lopez. It's an easy, high-level way to configure the status bar height.]

to set statusbar height to (n - number): (- VM_StatusLineHeight({n}); -).

[the status line stuff is rather adventurous, I think. I spent a good amount of time on it in hopes of making the "open" play area feel friendly and accessible. It uses the so-called "fancy status" feature from E. Short's Basic Screen Effects.

My spin is making the table source conditional, and resizing the bar as needed. here, I use a table to look up the source for the status line information. since the status line is updated every turn, changing the table will update the status line almost immediately.]

to decide which table name is the source of status information:
	choose row with a present action of the current scene in the table of status catalogs;
	decide on source entry;
	
[this rather elaborate maneuver is used to clear the decorative central column from the status line when players have selected the small screen/mobile option. Since it isn't possible to run through a table of table names and dig into those nested tables, I had the table names to a LIST (TT), then repeat through that. It works! Lists are a little initimidating at first, but they are definitely worth the effort.

I came up with this AFTER realizing that I needed it for mobile mode. I'm not sure how I would have designed the tables if I had this knowledge up front.]
	
to clear the central column:
	if mobile is false:
		do nothing;
	otherwise:
		let TT be a list of table names;
		repeat through the table of status catalogs:
			add source entry to TT;
		repeat with t running through TT:
			repeat through t:
				blank out central entry.
			
[this is just a lookup for matching the current scene with a status table]

 
table of status catalogs
present action	source
prologue	table of prologue status
inspect the box	table of inspect the box status
discuss the bag	table of discuss the bag status
discuss the grue	table of discuss the grue status
discover the Aughtlight	table of discover the Aughtlight status
experimental Aughtlight	table of experimental Aughtlight status
rescue the grue	table of rescue the grue status
escape the theater	table of escape the theater status
		
[other than resizing the height, this is bog standard stuff from basic screen effects]

Rule for constructing the status line when the displaying activity is not going on (this is the staus refresh rule):
	fill status bar with the source of status information;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	rule succeeds;
	
[this is to address a line spacing issue; a bit of conflict beween the custom status height and the menu system. Inform has a reputation for being frustratingly fiddly about white space.]
	
after displaying:
	say paragraph break.
	
section 1 (code and status for prologue)
	
table of prologue status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	"[if mobile is false][fls]  - [vls][end if][pdoors]"
--	"[it]& the[rt]"	--
--	""	--	
--	"[it]Sinister Spotlight[rt]"	--

[managing the information in the status tables turned out to be fairly complicated! There is a big update every scene change; minor updates happen during action processing. The general idea is to check each row and fill the first open one. (left or right only; center never changes)]

first after going south from center stage when auditorium is unvisited:
	let L be {1, 2, 3, 4, 5};
	repeat with N running through L:
		choose row N from the table of prologue status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is Auditorium] *";
			break;
	repeat with N running through L:
		choose row N from the table of prologue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Auditorium Seats";
			break;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	continue the action;
	
[as marbles makes her way to the exit, the status bar fills in.]
	
first after going south from auditorium when main entrance is unvisited:
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of prologue status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *";
			break;
	repeat with E running through L:
		choose row E from the table of prologue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Light Switch";
			break;
	repeat with E running through L:
		choose row E from the table of prologue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Miznian Ladder";
			break;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	continue the action;	
			
			


section 2 (code and status for inspect the box)

table of inspect the box status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *"	""	"[if mobile is false][fls]  - [vls][end if]Box"
"[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is auditorium] *"	"[it]& the[rt]"	"[if mobile is false][fls]  - [vls][end if]Auditorium Seats"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	--	
--	"[it]Sinister Spotlight[rt]"	--

ITBFlag is a truth state that varies.
ITBFlag is false.

first after going north from auditorium when inspect the box is happening and ITBFlag is false:
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of inspect the box status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Dinosaur";
			break;
	repeat with E running through L:
		choose row E from the table of inspect the box status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Catalog Car";
			break;
	now ITBFlag is true;
	continue the action;
			


section 3 (code and status of discuss the bag)

table of discuss the bag status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	"[if mobile is false][fls]  - [vls][end if]Auditorium Seats"
"[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is auditorium] *"	"[it]& the[rt]"	"[if mobile is false][fls]  - [vls][end if]Stepladder"
"[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *"	""	"[if mobile is false][fls]  - [vls][end if]Dinosaur"
--	"[it]Sinister Spotlight[rt]"	--

DtBupdate is a truth state that varies.
DtBupdate is false;

[it was sometimes necessary to delete and reorder records on one side but not the other.]

first after smelling the chairs when discuss the bag is happening and the bag is in auditorium and DtBupdate is false:
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of discuss the bag status;
		if there is a right entry and right entry is not "[bt][if mobile is false]Important [end if]Landmarks:[rt]":
			blank out right entry;
	repeat with E running through L:
		choose row E from the table of discuss the bag status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Bag";
			break;
	repeat with E running through L:
		choose row E from the table of discuss the bag status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Auditorium Seats";
			break;
	repeat with E running through L:
		choose row E from the table of discuss the bag status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Dinosaur";
			break;
	repeat with E running through L:
		choose row E from the table of discuss the bag status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Stepladder";
			break;
	now DtBupdate is true;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	continue the action;


section 4 (code and status of discuss the grue)

table of discuss the grue status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	"[if mobile is false][fls]  - [vls][end if]Grue"
"[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is auditorium] *"	"[it]& the[rt]"	"[if mobile is false][fls]  - [vls][end if]Gruemobile"
"[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *"	""	"[if mobile is false][fls]  - [vls][end if]Gruequarium"	
--	"[it]Sinister Spotlight[rt]"	--


section 5 (code and status of discover the Aughtlight)

table of discover the Aughtlight status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	"[if mobile is false][fls]  - [vls][end if]Miznian Ladder"
"[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is auditorium] *"	"[it]& the[rt]"	--
"[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *"	""	--	
--	"[it]Sinister Spotlight[rt]"	--

report meowing at the wooden ladder while discover the Aughtlight is happening:
	choose row 2 from the table of discover the aughtlight status;
	blank out left entry;
	blank out right entry;
	choose row 3 from the table of discover the aughtlight status;
	blank out left entry;	
	choose row 4 from the table of discover the aughtlight status;
	blank out left entry;
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of discover the aughtlight status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if][pbooth][if the location of Marbles is spotlight booth] *";
			break;
	repeat with E running through L:
		choose row E from the table of discover the aughtlight status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if][plight]";
			break;
	repeat with E running through L:
		choose row E from the table of discover the aughtlight status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if][pchair]";
			break;
	repeat with E running through L:
		choose row E from the table of discover the aughtlight status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Ledge";
			break;		

section 6 (code and status of experimental Aughtlight)

table of experimental Aughtlight status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Locations:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[if mobile is false][fls]  - [vls][end if]Center Stage[if the location of Marbles is center stage] *"	""	"[if mobile is false][fls]  - [vls][end if]Gruecilla"
"[if mobile is false][fls]  - [vls][end if]Auditorium[if the location of Marbles is auditorium] *"	"[it]& the[rt]"	--
"[if mobile is false][fls]  - [vls][end if]Main Entrance[if the location of Marbles is main entrance] *"	""	--	
"[if mobile is false][fls]  - [vls][end if][if spotlight booth is visited][pbooth][otherwise]Curious Platform[end if][if the location of Marbles is spotlight booth] *"	"[it]Sinister Spotlight[rt]"	--



section 7 (code and status of rescue the grue)

table of rescue the grue status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Location:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmarks:[rt]"
"[fls] - [vls][tloc]"	""	"[if mobile is false][fls]  - [vls][end if]Gruecilla"
--	"[it]& the[rt]"	"[if mobile is false][fls]  - [vls][end if]Gruemobile"
"[if mobile is false][fls] [bt][otherwise][bt][end if]Objective:[rt]"	""	--
"[if mobile is false][fls]  - [vls][end if]Help Gruecilla Escape"	"[it]Sinister Spotlight[rt]"	--

[the "Rescue the Grue" scene required many status line updates because players sometimes found the geography confusing.]

RtGstatus is a truth state that varies.
RtGstatus is false;

after meowing at the Gruemobile when rescue the grue is happening and RtGstatus is false:
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Right Sandbag";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	now RtGstatus is true;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	continue the action;


first after looking in dinosaur head for the first time:
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is a right entry and right entry is not "[bt][if mobile is false]Important [end if]Landmarks:[rt]":
			blank out the right entry;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Gruecilla";
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Dinosaur Head";
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Dinosaur Tail";
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Vent";
			break;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	continue the action.
	
atail is a truth state that varies.
atail is false.

first after meowing at the tail when atail is false:
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Dinosaur Tail" from the table of rescue the grue status;
	blank out the right entry;
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Gruecilla" from the table of rescue the grue status;
	blank out the right entry;
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Vent" from the table of rescue the grue status;
	blank out the right entry;
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Dinosaur Head" from the table of rescue the grue status;
	blank out the right entry;
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Gruecilla";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Left Sandbag";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Vent";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	now atail is true;
	continue the action.
	
after jumping to the left sandbag when the location is plank:
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Left Sandbag" from the table of rescue the grue status;
	blank out the right entry;
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Vent" from the table of rescue the grue status;
	blank out the right entry;
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Dinosaur Head";
			break;
	repeat with E running through L:
		choose row E from the table of rescue the grue status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Vent";
			break;
	continue the action;
	

section 8 (code and status of escape the theater)

table of escape the theater status
left	central	right
"[if mobile is false][fls] [bt][otherwise][bt][end if]Location:[rt]"	"[it]Marbles, D[rt]"	"[bt][if mobile is false]Important [end if]Landmark:[rt]"
"[if mobile is false][fls]  - [vls][end if][tloc]!!!"	""	"[if mobile is false][fls]  - [vls][end if]Tightrope"
--	"[it]& the[rt]"	--
"[if mobile is false][fls] [bt][otherwise][bt][end if]Objective:[rt]"	""	--
"[if mobile is false][fls]  - [vls][end if]Save D!!!"	"[it]Sinister Spotlight[rt]"	--



after jumping to ctightrope:
	choose row with a right of "[if mobile is false][fls]  - [vls][end if]Tightrope" from the table of escape the theater status;
	blank out the right entry;	
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if][pbag]";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	continue the action;
	
when play ends:
	say final;
	let L be {1, 2, 3, 4, 5};
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is a left entry:
			blank out the left entry;
		if there is a right entry:
			blank out the right entry;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[bt][if mobile is false]Important [end if]Landmarks:[rt]";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;	
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Fish";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Loretta";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]D";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no right entry:
			now right entry is "[if mobile is false][fls]  - [vls][end if]Fweep";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;		
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls] [bt][otherwise][bt][end if]Objectives:[rt]";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;			
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if]Snack";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if]Chat";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;
	repeat with E running through L:
		choose row E from the table of escape the theater status;
		if there is no left entry:
			now left entry is "[if mobile is false][fls]  - [vls][end if]Have Fun";
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			break;								


Part 2 - tables

[a ton of printed text is housed in tables. this is meant to enable varying text based on scene, but sometimes that wasn't enough. this is a VERY responsive text.]

Section - lookup and reference tables

table of references
item	table name
center stage	table of center stage descriptions
auditorium	table of auditorium descriptions
main entrance	table of main entrance descriptions
spotlight booth	table of spotlight booth descriptions
box	table of box descriptions
real clutter	table of real clutter descriptions
grue	table of grue descriptions
Aughtlight	table of Aughtlight descriptions
wooden ladder	table of wooden ladder descriptions
D	table of D descriptions



table of fascinations
item	table name
exit doors	table of exit door fascinations
box	table of box fascinations
grue	table of grue fascinations
flyer	table of flyer fascinations
Aughtlight	table of Aughtlight fascinations

Section - cat behavior



Chapter 1 - complex room descriptions

[each table row is specific to a scene. there are conditions nested within. there are always at least two; one for local viewing and one for remote viewing. sometimes other factors are considered as well.]

section one - center stage

table of center stage descriptions
present action	description
prologue	"[if the player is in center stage][one of]If I were the type to get scared[em]I'm not![em]I might have been a little scared of this place. Something smelled off: familiar, but not in a good way. D was already headed [oc]SOUTH[cc] toward a set of doors at the other end of the building.

Who knows what sort of trouble D might get into? I decided to [oc]FOLLOW HIM[cc] (unless I got busy, of course. We cats are a busy lot).[or]Even in the low light, it was clearly filled with human junk.[stopping][otherwise]The cluttered stage looked even more confusing from a distance. Making sense of it would take a bit more light, if D was going to pitch in.[end if]"
[]
inspect the box	"[if center stage is not the location]The details of the stage were easier to make out with the lights up. A black box hunkered at its center, and it was the color of a small stream on a moonless night.[otherwise][first time]Now that the lights were on, I could see the whole scope of the clutter here. [only]That place was even messier than D's room[ex] A large, conspicuous box hunkered at the stage's center, and all clutter had been cleared away from it."
[]
discuss the bag	"[if center stage is not the location]The stage was filled with junk and clutter, but a mysterious box[em]the Gruequarium[em]sat in a cleared area near the center of the stage.[otherwise]The stage was mostly filled with junk and clutter, but a large space had been cleared out for the [box]. I wondered if we were safe, trapped here in the theater with it.[first time]

D looked at me. 'Marbles, if we can't open the doors, we should at least make sure we're safe here. Why don't you explore the theater while I investigate here?'[only]

The Auditorium was just [oc]SOUTH[cc] of the stage."
[]
discuss the grue	"[if center stage is not the location]Even though the stage was filled with clutter, it was hard to pay attention to anything other than the mysterious Gruequarium.[otherwise]The stage was as flat and hard as ever, and yet it had changed a great deal."
[]
discover the Aughtlight	"[first time]D joined me beside the Gruequarium. 'Gosh, will you look at that?' D asked. You don't suppose it's Gruecilla, do you?' He knelt down and scratched my ears. 'I think it is. That must be her! I wonder how long she's been there?' As if in understanding, Gruecilla pressed her grue palms against the side of the tank.

I meowed. 'Yeah, I think so, too, Marbles.' He touched the glass experimentally. D stared into the whirling blackness filling the box. 'Whew, isn't that something?' he said, craning his neck to see over the edge. 'You know, I'll bet Gruecilla would like some of these treats.'

[only][if the center stage is the location][one of][rp][or]At center staged stood the Gruequarium, a mysterious container filled with whirling darkness. Thanks to the power of the grue-sensitive eyeglasses, I could see Gruecilla lurking within.

[stopping]To the [oc]SOUTH[cc], I could reach the auditorium seats. Past that, the entrance. There was a mysterious platform above the entrance, which D and I had not explored yet.[otherwise]Even from a distance, I could easily make out the shape of a Gruecilla squirming in the Gruequarium."
[]
experimental Aughtlight	"[if the center stage is the location]The stage remained as it had been: the messy home and prison of Gruecilla, the star of The Circus of the Grues. The auditorium remained to the [oc]SOUTH[cc], but I thought my business there might be through.[otherwise]Even as a curious cat, it was hard to see past or around Gruecilla, noted performer and deadly predator."

	
section 2 - auditorium descriptions

table of auditorium descriptions
present action	description
prologue	"[if the location is auditorium]An open area filled with human-sized chairs, halfway between the stage to the [oc]NORTH[cc] and the exit to the theater. That exit[em]D's location[em]was just [oc]SOUTH[cc] of there[otherwise]A wide open area filled with many human chairs, more than I could count[end if]."
[]
inspect the box	"[if the location is the auditorium]The auditorium was a large space filled with human-sized chairs arranged in neat, little rows. A narrow aisle ran down the middle, reaching from the exit doors ([oc]SOUTH[cc]) to the front of the stage ([oc]NORTH[cc]).[first time]

According to D, humans sat in these chairs while watching something called a 'show.'[only][otherwise]It was hard to imagine a human in every chair. I've never seen so many humans in the same place at the same time."
[]
discuss the bag	"[if the location is the auditorium and the bag is undiscovered]The auditorium was a large, open area filled with human chairs. From the aisleway , I could see the stage to the [oc]NORTH[cc] and the main entrance to the [oc]SOUTH[cc].

I gave the air a little sniff. Cats are highly capable when it comes to the art of smell. Everyone knows that.[otherwise if the location is the auditorium and the bag is discovered]The auditorium was filled with human seats.

While I could have reached center stage by going [oc]NORTH[cc] or else go [oc]SOUTH[cc] to the main exit, I wasn't sure I was done with the auditorium yet.[otherwise if the location is not the auditorium and the bag is discovered]The auditorium was just [oc][best route from the location to the auditorium][cc] [the route preposition] here. I hadn't told D about the bag yet, but don't get the wrong idea! I definitely wasn't keeping it a secret.[otherwise]The auditorium held a mysterious secret, I was sure about that.[end if]"
[]
discuss the grue	"[if the location is the auditorium]The auditorium was a place for humans to sit while watching The Circus of the Grues. What an eccentric species! A carpeted aisle ran down the middle of the space.

I could return to the stage by going [oc]NORTH[cc], and the main entrance was to the [oc]SOUTH[cc]."
[]
discover the Aughtlight	"[if the location is the auditorium]This is where the humans of Zork watched The Circus of the Grues. The space was filled with human chairs, and an aisle ran [oc]SOUTH[cc] to [oc]NORTH[cc] through the center of the room.[otherwise]The auditorium was the lowest place in the theater. A narrow carpet ran up the middle of the room, with many human-sized seats on either side.[end if]"
[]
experimental Aughtlight	"[if the location is the auditorium]Here, humans could sit and witness The Circus of the Grues, a show featuring Gruecilla and her fearsome family. The contents of the area remained the same: chairs, aisle, bag. I could ask D to experiment with them ([oc]MEOW AT [bk]something[cb][cc]), or else continue [oc]NORTH[cc] to center stage.[otherwise] The auditorium was a large space for humans to sit and look at silly human nonsense. It was filled with chairs.[end if]"

[it's best to avoid this kind of thing. I wanted the text to use the right preposition in a room description depending on the player's location. it works, but I'm not sure it's better than writing a sentence that works either way. or writing two sentences.]

to say the route preposition:
	if the location is main entrance:
		say "of";
	otherwise if the location is center stage:
		say "from";

Section 3 - main entrance

[note the elaborate "[PME]" substitution that prints during the prologue. it is set apart because of the tutorial "cat news network" text, which has its own format. this could have been jammed directly into the table, but it would have been very difficult to read. even if it seems baroque to put substitutions within a table (it sometimes is), it's important to aim for readable code.]

table of main entrance descriptions
present action	description
prologue	"[PME]"
[]
inspect the box	"[if the main entrance is the location]This open space had only two notable features. The first, a pair of large doors, prevented us from leaving the theater. Is there any more obnoxious human invention than the door? Nearby, an unclimbable ladder reached upward.

The auditorium was just [oc]NORTH[cc] of there[otherwise]The exit doors were the most attention-getting feature of the main entrance area, but the as-yet undiscovered destination of the large wooden ladder there was enough to make any cat curious[end if]." 
[]
discuss the bag	"[if the main entrance is the location]The main entrance was a well-lit location built to showcase the large, metal exit doors in the south wall. Humans are so proud of the obstacles they make, aren't they? The ladder[em]made of Miznian hardwood[em]stood uselessly nearby. The rest of the theater lay to the [oc]NORTH[cc].[otherwise]The exit doors gleamed as if under a lamp."
[]
discuss the grue	"[if the main entrance is the location]The main entrance was as far as I could get from the white shape onstage. The distance was comforting, but I knew that I'd have to head [oc]NORTH[cc] eventually. The chief impediments featured here[em]double doors and ladder[em]had nothing new to offer.[otherwise]Despite recent discoveries, the area near the entrance remained a place filled with human obstacles and impediments."
[]
discover the Aughtlight	"[if the main entrance is the location]The area near the exit doors was brightly lit, as if to mock our lack of progress. We hadn't figured out a way to open them yet, so there wasn't a lot to do...

...unless there was something good at the top of that Miznian hardwood ladder.[otherwise]There wasn't a lot to see from here, though the wooden ladder leading [oc]UP[cc] was plainly visible."
[]
experimental Aughtlight	"[if the main entrance is the location]The area near the exit doors was brightly lit. At the top of a nearby ladder, D waited for me to start meowing at things to the [oc]NORTH[cc].[otherwise]The exit area was just below the platform where D operated the Aughtlight."

to say PME:
	if the location is the main entrance:
		say "There wasn't much there except for a pair of big metal doors and, off to one side, a ladder leading up to a platform of some kind. While D was focused on the door, I was more worried about the darkness. It just isn't safe for human children to be in the dark!

Just to the right of the door was what humans call a 'light switch.'";
		if marbles is in main entrance for the first time:
			say line break;
			say cat prompt;
			say "=== [bt]CAT NEWS NETWORK[rt] ===
[lb]
[lb]
[lb]In our adventures together, D and I often discussed landmarks and situations. If there was something I wanted to tell D about, I could just [oc]MEOW AT [bk]that thing[cb][cc]. For instance, to call D's attention to the doors, I would simply...

[oc]MEOW AT THE DOORS[CC]

A successful adventurer knows how to communicate effectively!


=== [bt]CAT NEWS NETWORK[rt] ===[lb][lb]";
	otherwise if the location is not the main entrance:
		say "There wasn't much to look at, other than a large pair of doors that might have been the only way out of the theater."

Section 4 - spotlight booth

[rather heroic measures were required for the "discover the aughtlight scene" because the room changes so much based on player knowledge.

I am not happy with the description of the booth during "discover the aughtlight." even after breaking it into separate parts, the code remains very difficult to follow. It is "good" in the sense that it works and has no bugs--the primary goal--but "readable" is easier to troubleshoot.

I also had to add [run paragraph on] to ever description because Inform sometimes adds breaks. I think it can be expained when and why, but I don't fully understand.]

table of spotlight booth descriptions
present action	description
prologue	"A platform suspended above the exit doors. It wasn't reachable at the moment, but I had a feeling that D and I would explore it eventually."
[]
inspect the box	"A platform suspended above the exit doors. It wasn't reachable at the moment, but I had a feeling that D and I would explore it eventually."
[]
discuss the bag	"A platform suspended above the exit doors. It wasn't reachable at the moment, but I had a feeling that D and I would explore it eventually."
[]
discuss the grue	"A platform suspended above the exit doors. It wasn't reachable at the moment, but I had a feeling that D and I would explore it eventually."
[]
discover the Aughtlight	"[a spotlight disaster]"
[]
experimental Aughtlight	"Looking up, I could see the dark beam of the Aughtlight reach toward the [aphosis of the aughtlight] [the aughtlight preposition] [location of the aphosis of the aughtlight]."
[]
rescue the grue	"The booth seemed far away, but I could still see D. If he could handle the Aughtlight, I could handle the rest."

section spotlight booth substitution

to say a spotlight disaster:
	if spotlight booth is not the location:
		say "There was something up there! I was sure of it.[run paragraph on]";
	otherwise if the chair is ripe for discussion:
		if the player is not held by the folding metal chair:
			say "The Aughtlight booth contained its namesake doodad, a metal device as tall as an adult human. A nearby metal chair seemed a good place for D to stand while operating the machine.[run paragraph on]";
		otherwise if the player is held by the metal chair:
			say "The Aughtlight booth contained its namesake doodad, a metal device as tall as an adult human. While I was on the chair at the moment, it was probably a good place for D to be.[run paragraph on]";
	otherwise if the player is held by the folding metal chair:
		if D index is zero:
			say "From the chair, I could either [oc]JUMP DOWN[cc] to the floor or else [oc]JUMP TO THE LEDGE[cc] above.[run paragraph on]";
		otherwise if the tag is undiscussed:
			say "[The Aughtlight] stood at the center of the booth, its top tilted toward the floor of the booth. What mysteries did it hide? While it was just a short [oc]JUMP TO THE LEDGE[cc], it was [the aughtlight] that tempted my kitten curiosity. I need only [oc]JUMP DOWN[cc] to reach it.[run paragraph on]";
		otherwise if marbles has not been held by the flat board:
			say "The chair was a midpoint between the floor of the booth and the ledge above. From there, I could [OC]JUMP TO THE LEDGE[CC] and get a good view of the theater. A view from above is, after all, the best sort of view.[run paragraph on]";
	otherwise if the player is held by the flat board:
		if the tag is undiscussed:
			say "What a grand vista! The ledge afforded a clear view of the entire theater which, despite its human folly, was a pleasant sight from above. Still, I had yet to discover the purpose of [the Aughtlight] down below. No naps for me![run paragraph on]";
		otherwise if the tag is discussed:
			say "I was perched atop a wall overlooking the entire theater. I could leave the ledge by either [oc]JUMPing TO THE CHAIR[cc] or else [oc]JUMPing DOWN[cc].[run paragraph on]";
	otherwise if the player is held by the spotlight booth and the tag is discussed:
		say "[The Aughtlight] tilted upward, just as if it were staring at the ceiling. 

Nearby, a metal chair invited any curious cat to [oc]JUMP TO THE CHAIR[cc]. Directly above the chair, the low wall surrounding the booth was topped by a cat-sized ledge.[otherwise if the player is held by the spotlight booth and the player has been held by the flat board]The Aughtlight stood at the center of this elevated booth, glaring over the edge of a low wall. Its secrets were a provocation. What was it for? Nearby, a metal chair sat under a ledge overlooking the entire theater.[run paragraph on]";
	otherwise if d index is zero:
		say "The floor of the booth was flat, hard, and covered by a tatty green fabric that looked utterly unfit for scratching.

Near the stage side of the booth, a large metal thingy sat on top of a metal pole. The folding metal chair behind it was probably for adult humans to sit in while they played with that big metal thingamajig.[run paragraph on]";
	otherwise:
		say "The booth held a chair and a so-called 'Aughtlight.' A low wall surrounded it to prevent humans[em]let's face it, they're a clumsy species[em]from falling into the theater.[run paragraph on]";
	say run paragraph on;


to say the aughtlight preposition:
	if the location of the aphosis of the aughtlight is center stage:
		say "at";
	otherwise:
		say "in".
			


section 5 (D)

[these are no longer in use, though I like them]

table of D descriptions
active scene	description
prologue	"D was a human boy. So far as his species goes, he was quite young. It would be years before left the territory of his parents."
[]
inspect the box	"D was a fine human boy, far better than the usual primate. His hair stuck up in the back, as if he was always startled by something."
[]
discuss the bag	"D and I were an excellent adventuring team. I played the role of a scout: sneaking past danger, slinking under whatever seemed slinkable, and sniffing out clues. And D? Besides being an excellent conversationalist and a dear friend, he was the one with hands."
[]
discuss the grue	"Human children remain with their parents for many years. Cat's, I'm sure you know, are on our own after just a few months."
[]
discover the Aughtlight	"D only had fur on top of his head. In order to avoid the plight of those ridiculous hairless cats, he covered himself in artificial fur called 'clothing.' His white 'shirt' left his upper forelimbs bare, and a pair of 'jeans' covered his lower legs. The jeans, I must confess, are a very pleasant scratching surface, but it was hard to scratch them without scratching D as well."
[]
experimental Aughtlight	"D attended something called a 'school.' It's a place where human children go to learn human stuff. School didn't sound very nice, and D often came home upset. Sometimes, he pretended to be sick, hoping he could stay home. That hardly ever worked, though.

It his loneliness was what made him good at both adventuring and friendship, because he was always looking outward, always looking to the strange and the magical."
[]
rescue the grue	"D and I generally agree on things. For instance, we never really needed to discuss freeing Gruecilla, because we felt the same way from the beginning. That's just how it is with us. We both liked discovering things, for instance, and we both enjoyed snacks."
[]
escape the theater	"I couldn't see D, because he was hiding in the Aughtlight booth! He trusted that I would help him, and I trusted him to stay out of sight."


Chapter 2 - complex item descriptions

[many items were described just as rooms were, with multiple tables broken up by scene.]

Section 1 - the box

table of box descriptions
present action	description
prologue	"An unnerving box filled with darkness sat at the center of the stage."
[]
inspect the box	"[if the box is in the location][The box] wasn't black. It was... it was like it was [it]filled with black[rt] somehow. I was curious, as any self-respecting cat might be, but I was also suspicious of it. It had a sort of damp scent to it, an animal smell.[otherwise]Even from far away, I could tell that there was something wrong about it."
[]
discuss the bag	"[if the box is in the location]Some sort of magical blackness whirled inside the so-called 'Gruequarium.' Was a grue lurking there? I could feel my fur standing on end, just thinking about it. It smelled a little like wet dog in a wet cave.[otherwise]It was enough to creep out even the most courageous cat. I didn't like D being alone with it."
[]
discuss the grue	"[if the box is in the location]I had a feeling--based only on a hunch--that [the box] was made from powerful magic. Human adults wield powerful magic, but they use it to do stupid things like trapping grues in boxes. Having taken a ride or two in a cat carrier, I felt bad for the creature inside the box, grue or otherwise.[otherwise]Even from a distance, the white grue-sized shape within the box was clearly visible."
[]
discover the Aughtlight	"[if the box is in the location]When I first saw [the box], it seemed very large. It was much larger than a cat! But now it bothered me as a thing far too small for Gruecilla's imprisonment.[otherwise]Even from a distance, Gruecilla's white shape was clearly visible."
[]
experimental Aughtlight	"[if the box is in the location]Magical darkness swirled within the Frobozzco Magic Gruequarium. I felt bad for [the grue], being trapped in such a little space. I bet D felt bad, too.[otherwise]Poor Gruecilla, stuck in that box."


Section 2 - the wooden ladder

table of wooden ladder descriptions
present action	description
prologue	"[if the wooden ladder is in the location]The ladder was made of what the citizens of Zork called 'Miznian hardwood.' Because the slats were directly above one another, no cat could climb it.[otherwise]I could make out what appeared to be a ladder leading up to a darkened platform of some kind."
[]
inspect the box	"[if the wooden ladder is in the location]The ladder was made of what the citizens of Zork called 'Miznian hardwood.' Because the slats were directly above one another, no cat could climb it.[otherwise]I could make out what appeared to be a ladder leading up to a darkened platform of some kind."
[]
discuss the bag	"[if the wooden ladder is in the location]The ladder was made of what the citizens of Zork called 'Miznian hardwood.' Because the slats were directly above one another, no cat could climb it.[otherwise]I could make out what appeared to be a ladder leading up to a darkened platform of some kind."
[]
discuss the grue	"[if the wooden ladder is in the location]The ladder was made of what the citizens of Zork called 'Miznian hardwood.' Because the slats were directly above one another, no cat could climb it.[otherwise]I could make out what appeared to be a ladder leading up to a darkened platform of some kind."
[]
discover the Aughtlight	"[if the location is main entrance]The ladder was made from something called 'Miznian hardwood,' which was the kind of thing adult humans got excited about. The wide slats were directly above one another, which meant that I couldn't climb it. I think D could help me get to the top if I asked him to[otherwise if the location is the spotlight booth]The ladder would have been an easy climb for primates like you and D, but it wouldn't help a cat[em]not even the most extraordinary cat[em]get down from the platform[otherwise]The ladder led up to a mysterious platform. I wondered what could be up there[end if]."
[]
experimental Aughtlight	"[if the wooden ladder is in the location]The ladder reached up to the Aughtlight booth where D was, but I had business down in the theater.[otherwise]The ladder leading up to the Aughtlight booth was clearly visible. It was good to know D had a way down if he needed one."

[Once the endgame mechanics became better developed, I decided to deemphasize the clutter in favor of individual things like the dinosaur.]

Section 3 - the real clutter

table of real clutter descriptions
present action	description
prologue	""
inspect the box	"The clutter onstage reminded me a little of D's room, which was usually a bit of a mess."
[]
discuss the bag	" The clutter onstage reminded me a little of D's room, which was usually a bit of a mess."
[]
discuss the grue	"The clutter onstage reminded me a little of D's room, which was usually a bit of a mess."
[]
discover the Aughtlight	"The clutter onstage reminded me a little of D's room, which was usually a bit of a mess."
[]
experimental Aughtlight	"The clutter onstage reminded me a little of D's room, which was usually a bit of a mess."


section 4 (the Aughtlight)

[the aughtlight table has a "rescue the grue" entry, while other things don't.]

table of Aughtlight descriptions
present action	description
prologue	"Be patient! I'll get to the spotlight part soon."
[]
inspect the box	"Be patient! I'll get to the spotlight part soon."
[]
discuss the bag	"Be patient! I'll get to the spotlight part soon."
[]
discuss the grue	"Be patient! I'll get to the spotlight part soon."
[]
discover the Aughtlight	"[if the location is not the spotlight booth]Mm? Spotlight? I'm sure I don't know what you are talking about.[otherwise if the location is the spotlight booth and the tag is undiscussed]A tall, shiny device made by humans. D called it a 'spotlight,' and it was one of those things that humans mess with, like 'televisions' and 'cars.'

A small tag was attached to the spotlight's base.[otherwise if the location is the spotlight booth and the tag is discussed]A tall, shiny device made by humans. The small tag on its base said that it was a 'Frobozzco Magic Aughtlight.' It was one of those magical things that humans mess with, like 'televisions' and 'cars.'"
[]
experimental Aughtlight	"The Aughtlight cast darkness in the direction of [the aphosis of the aughtlight] [the aughtlight preposition] [the location of the aphosis of the aughtlight]. It seemed like the kind of thing every adult human might want. Why, I wondered, didn't D's parents own one?"
[]
rescue the grue	"The Aughtlight was obviously made by human adults: stinky, loud, and probably a little dangerous.[first time] I wish D didn't have to operate it alone, but we needed to cooperate this way if we wanted to help Gruecilla.[only]"
[]
escape the theater	""

section 5 (the grue)

[as mentioned earlier, there is a generic "grue" scenery" that gets replaced with Gruecilla once marbles meows at ]

table of grue descriptions
present action	description
prologue	""
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	"[if the box is not in the location]The white, writhing shape was neither human nor cat, and yet it reminded me of both.[otherwise]The mysterious white shape bent and flopped in sudden, lurching motions. It must have been Gruecilla, the star of The Circus of the Grues.

I wondered if she could see me."
[]
discover the Aughtlight	"[if the box is not in the location]Off to the [oc]NORTH[cc], the shape of Gruecilla squirmed in the dark of the Gruequarium.[otherwise]Gruecilla sat on the floor of the tank, forelimbs resting on her... were they knees? Grues seemed to have a lot of joints."
[]
experimental Aughtlight	"[if the box is in the location]Gruecilla sat on the floor of the tank, her limbs folded at strange angles.[otherwise]It was easy to tell[em]even from a distance[em]that Gruecilla was clearly a prisoner of [the box]."

	

Chapter 3 - things that interest D

[tables proved to be overkill. these print ambient texts based on D's curiosity relation. I initially thought these might change quite a bit more, but they mostly are restricted to single scenes. still, design-wise, I suppose it was best to have one definition that handled everything.

remember that these can be suppressed in cases where there might be a conflict with the current action.

there are some definitely readability challenges, but most games won't require this level of varability.]

Section 1 - exit doors

table of exit door fascinations
active scene	description
prologue	"[one of]D rattled the handles on the large, double doors. 'Marbles! It's locked!'[lb][or]D continued looking at the door, pushing it experimentally.[lb][or]D just wasn't getting anywhere with the door. He probably needed some help.[lb][or][if d is in the location]D looked at me.[lb][otherwise]D called out from the main entrance, 'Gee whiz, Marbles! Do you think this is the only way out?'[lb][end if][or][if d is in the location]D glanced around the room, as if hoping to find something useful nearby.[lb][otherwise]D continued to struggle with the doors near the entrance.[lb][end if][or][if d is in the location]I thought that maybe D hadn't noticed the light switch yet. Maybe it would have helped if I [oc]MEOWed AT THE LIGHT SWITCH[cc]?[otherwise]D shook the exit doors, but he wasn't able to open them.[end if][lb][or][the final door interest][stopping]"
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	""
[]
discover the Aughtlight	""
[]
experimental Aughtlight	""

to say the final door interest:
	say "D gave the doors another rattle[if d is not in the location]. I needed to join him. If I wasn't sure of the way, I could always just [oc]FOLLOW D[cc] [end if].".

Section 2 - mysterious box

[some of these are pretty outlandish, with multiple factors, long lists, and randomized outputs, but the result seems to be pretty credible.]

table of box fascinations
active scene	description
prologue	""
[]
inspect the box	"[one of][if d is not in the location]Off to the [oc]NORTH[cc], I saw D kneel beside the box, looking at it all the while.[lb][otherwise]D knelt beside the box, looking at it all the while.[lb][end if][or][if d is not in the location]Back at the stage,[otherwise]Nearby,[end if] onstage, D scratched his head, as if something that he saw confused him in some way.[lb][or][if d is not in the location]Off to the [oc]NORTH[cc], [end if]I saw D approach the box as if to peek over its sides, only to back away nervously.[lb][or][if d is not in the location]Off in the distance,[otherwise]Nearby,[end if] D gazed intently at the swirling blackness within the box near the center of the stage.[lb][or]I could see D looking into the box. Did the thing inside the box look back?[lb][or]Nearby, onstage, D continued to investigate the strange black box.[lb][or]D looked at me impatiently, surprised that I hadn't looked at the box yet.[lb][stopping]"
[]
discuss the bag	"[one of][rp][or]'Gosh!' D[if d is not in the location] called out from center stage,[otherwise] exclaimed,[end if] kneeling beside the box.[lb][or][If d is not in the location]Just [oc]NORTH[cc] of here, [end if]D stood on his toes and craned his neck, hoping to see the tank from another angle.[lb][or][if d is not in the location]I could see D onstage, staring into the murk inside the tank.[otherwise]D stared into the murk of the tank, but my guess is that he couldn't see anything there.[end if][lb][or][if d is not in the location]From where I stood, I could see D moving[otherwise]D moved[end if] slowly away from the box, eyeing it suspiciously. 'Don't worry, Marbles,' he called out, 'I'll keep an eye on things here. I won't let anything sneak out of that box.'[lb][or][if D is not in the location]Off to the [oc]SOUTH[cc], [end if]D stood on his toes, perhaps to view the 'Gruequarium' from a different angle.[lb][or]D looked out at the auditorium, as if to judge what an audience could or could not see from their seats.[lb][or]D circled the tank, looking for clues.[lb][or][if d is not in the location]Back at the stage, [end if]D stood several feet away from the box, watching it intently.[lb][or][the second box fascination][stopping]"
[]
discuss the grue	""
[]
discover the Aughtlight	""
[]
experimental Aughtlight	""
[]
rescue the grue	""
[]
escape the theater	""

to say the second box fascination:
		say "D[if d is not in the location] remained onstage, guarding[otherwise] continued to guard[end if] the Gruequarium.";

to say the first box fascination:
	say "D looked at me impatiently, surprised that I hadn't examined the box yet.";
			
Section 3 - the grue
	
table of grue fascinations
active scene	description
prologue	""
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	""
[]
discover the Aughtlight	"[gruecilla's interest]"
[]
experimental Aughtlight	""
	
to say the final grue fascination:
	say "[one of][if d is in the location]D continued to look at Gruecilla and the Gruequarium, and I could tell that he was worried.[otherwise]Even from a distance, it was clear that D was concerned about Gruecilla's situation.[end if][or][if d is not in the location]Back at center stage, [end if]D looked toward the stage and its Gruequarium, as if he could find an answer there.[stopping]".
	
gnumber is a number that varies.
gnumber is 0.
	
to say gruecilla's interest:
	increment gnumber;
	say "[one of]D tossed the packet of grue treats into the tank, taking care not to hit Gruecilla with them.[or][if the box is not in the location]Even from afar, it was easy to see Gruecilla pick[otherwise]Gruecilla picked[end if] up the packet of treats, giving it an experimental sniff.[or][if D is not in the location]Glancing toward the Gruequarium, I could see Gruecilla[em]or her outline[em]devouring the grue treats. Was that a satisfied gurgle that I heard emerging from the tank?[otherwise]Gruecilla devoured the grue treats. She must have been quite hungry! She gurgled happily[em]at least, I think that was happiness[em]before folding herself in half.[end if][or]'Hey Marbles,[if d is not in the location]' D called out, '[end if]do you suppose we should try to set Gruecilla free somehow? I know she's a grue, but still.'[or][if d is not in the location]Off to the [best route from the location to the destination of D], [end if]D sat down on the stage, cross-legged, facing the Gruequarium.[or][the final grue fascination][stopping]"
	

section 4 (the flyer)

table of flyer fascinations
active scene	description
prologue	""
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	"[one of][if d is not in the location]Just [best route from the location to the destination of D] of there, [end if]D closely examined the flyer. 'Wow, a grue circus featuring [bt]Baby Gruecilla, the Marvelous Gruemobile, and Her Fearsome Family![rt]' D whistled[em]whistling was one of his many impressive skills[em]'That must have been some show.'[lb][or][if D is not in the location]I looked in D's direction. He[otherwise]D[end if] remained fascinated by the contents of the flyer. 'How do you suppose they saw the grues? They couldn't have done a bunch of tricks if they were stuck in that tank.'[lb][or][if d is not in the location]Back in the auditorium area, [end if]D held the flyer close to his face, hoping to get a closer look at a picture.[lb][or]D was so interested in the flyer that he had not yet seen the mysterious shape in the Gruequarium.[lb][or][if d is not in the location]D remained in the auditorium, reading. [end if]'It must be hard[em]and dangerous![em]to train a grue.'[lb][or][the final bag assertion][stopping]"
[]
discover the Aughtlight	""
[]
experimental Aughtlight	""
[]
rescue the grue	""
[]
escape the theater	""

to say the final bag assertion:
	say "D was too distracted to notice what was probably a grue onstage! That flyer really must have been something.".

section 5 (the ladder)

table of ladder fascinations
active scene	description
prologue	""
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	""
[]
discover the Aughtlight	""
[]
experimental Aughtlight	""
[]
rescue the grue	""
[]
escape the theater	""

section 6 (the Aughtlight)

table of Aughtlight fascinations
active scene	description
prologue	""
[]
inspect the box	""
[]
discuss the bag	""
[]
discuss the grue	""
[]
discover the Aughtlight	"[a complex Aughtlight interaction]"
[]
experimental Aughtlight	"[a simple Aughtlight interaction]"
[]
rescue the grue	""
[]
escape the theater	""

[the aughtlight booth was without a doubt the most complex scene in the game, and I'm sure it shows! these texts are so dense and cluttered with conditionals that they were very hard to proofread.]

[another rough one. I wanted D's comments to change based on his (and Marbles's knowledge of the area. Even though there weren't many factor, there were a lot of combinations to manage. I think I would try something else if I had a chance to do it again.]

to say a complex Aughtlight interaction:
	if the tag is not discussed and Marbles has not been held by the flat board:
		say "[one of]D set me on the floor. 'Say, Marbles, would you look at that!' he said, running over to the metal contraption. 'It[']s a [']spotlight[']! You can point it at things, and light comes out. It's like a big, powerful flashlight.'[or]D touched the [Aughtlight] experimentally. 'Hey, Marbles, would you look at this thing? Pretty weird, huh?'[or]D gave the metal thingy at the top of the [Aughtlight] an experimental swivel. It appeared to turn quite easily.[or]D scratched his head. He looked like he could use some help figuring out that [aughtlight] thing.[or]D looked at [the aughtlight]. 'I wonder if I should turn it on?' he wondered. 'Then again, maybe we should try to learn more about it first. I wouldn't want it to hurt Gruecilla.' D was a fine, sensitive boy.[or]'Gosh, Marbles,' D looked at me, 'I'm stumped!'[or]D stepped back from [the aughtlight], studying it.[or][a final Aughtlight statement][stopping]";
	otherwise if the tag is discussed and Marbles has not been held by the board:
		say "[one of][rp][or]'Boy, this [Aughtlight] looks pretty neat! I'm not exactly sure what we'd do with it, though.' D scratched his head. 'What do you think, Marbles?'[or]D looked around. 'Where do you suppose we could point this [Aughtlight]? If you don't mind, would you try exploring a little?'[or]D swiveled the head of [the Aughtlight] experimentally. It would be pretty easy to point it someplace with the right perspective.[or]D gave the Aughtlight a cautious look. 'I'd like to try this thing out, but I'm not sure where to point it!'[or]'Hey Marbles,' D said, 'do you suppose there's a way for you to get a view of the whole theater from here?'[or]D looked at the ledge at the top of the wall, so I gave his jeans a little bite and pull. That was no place for a young boy![or][a final ledge statement][stopping]";
	otherwise if the tag is undiscussed and Marbles has been held by the board:
		say "[one of]'Hey, Marbles!' Now that you've been up there, what do you make of this [Aughtlight]? I think it's pretty mysterious.'[or]D gave the [Aughtlight] a very serious look.[or]D continued to study the [Aughtlight]. I was curious about it, too.[or]'Marbles,' D said, kneeling beside [the Aughtlight], 'have you given this a good look? Let me know if you find anything interesting.'[or]D stood in a far corner of the booth in order to inspect [the Aughtlight] from a new angle.[or][a final tag statement][stopping]";
	otherwise if the metal folding chair is ripe for discussion:
		say "[one of]D looked at me. 'Marbles, we've figured out what this [Aughtlight] is, and you've had a look at things from the ledge. What do you think? Is there a way for me to point the Aughtlight into the theater?'[or]'If you come up with something, just let me know, OK?'[or]D gave the head of the Aughtlight a little swivel.[or][a final booth statement][stopping]".
		
		
to say a final Aughtlight statement:
	say "[one of]D stood in one corner of the booth, hoping to get a new perspective on the [Aughtlight].[or]D rubbed his chin thoughtfully.[or]D ran his hand over the shiny metal, as if hoping to discover something new.[or]'Gee Whiz, Marbles! What do you think of this thing![or]D continued to inspect [the Aughtlight].[stopping]".
	
to say a final ledge statement:
	say "[one of]Hoping to get a look over the wall, D stood on the tips of his toes.[or]D glanced at the ledge. 'Hey, Marbles, have you thought about getting on that ledge? It looks cat-sized, don't you think?'[or]D looked at the chair, then the ledge, then me.[or]D put his hands on the ledge, as if to climb up. What was he thinking? That was a job for a cat! 'MRAOW!' I said to him. He looked at me. 'OK, OK Marbles. But if I can't climb up there, then why don't you? It seems like a normal cat thing to do.'[or]D looked up at the ledge.[stopping]"
	

to say a final tag statement:
	say "[one of]D gently swiveled the head of [the Aughtlight].[or]'Why do you suppose they'd have a spotlight for a grue circus?' D said, looking the spotlight over. 'I don't think that would be very healthy for a grue.'[or]D. stared at [the Aughtlight]. Maybe he needed some help figuring things out.[stopping]".

to say a final booth statement:
	say "[one of]D looked around the room, as if trying to find something.[or]D knelt by the Aughtlight and inspected the tag once more.[or]D stood behind the Aughtlight then raised himself up on his tiptoes.[cycling]".
	
[as discussed before, the "meow tracker" is one of the ways D's behavior or quips can be suppressed to prevent contradictions.]
	
to say a simple Aughtlight interaction:
	if meow tracker is false:
		do nothing;
	otherwise:
		say "[one of]D gave the Aughtlight an experimental wobble.[or]D pointed the Aughtlight at the ceiling, then quickly returned it to the [aphosis of the Aughtlight].D hummed, rather unmusically, from the Aughtlight booth.[first time] That isn't a put-down, mind you. Human music is utterly baffling, I'm sure you agree.[only][or]D tapped his fingers on the top of the Aughtlight.[cycling]"
	
meow tracker is a truth state that varies.
meow tracker is false.

before doing something:
	now the meow tracker is false.
	
		
Volume 3 - machinery

Book 1 - relations and scoping

Part 1 - seeing into things

[the goal is to let players interact with items in a large open space, while giving feedback that makes sense. Use with care! There's a lot to account for if we don't restrict things.]
	
a thing can be remote or local.
a thing is usually local.

[I used the local/remote property to control what players could interact with remotely (ie, have Marbles try to walk to automatically if it is in a nother room.]
		
definition: a thing is distant if it is not held by the location and it is not enclosed by the location.

[the first two conditions are really just there to compensate for my bad design of the ladder, which probably should have been a door or a backdrop.]

before examining something distant:
	if the noun is held by the spotlight booth and the location is the spotlight booth:
		continue the action;
	otherwise if the noun is the wooden ladder and the location is the spotlight booth:
		continue the action;
	otherwise:
		say "(from a distance)[command clarification break]";
		
[this is the first mention of "permitted remote activity". permitted remote activites will be attempted from Marble's current location. In the case of other actions, Marbles will attempt to travel to the location of the noun.]

examining is permitted remote activity.

[customizing scope to make all "remote" items visible (not touchable), as well as all rooms in the theater region.]

after deciding the scope of Marbles while Marbles is in the theater:
	repeat with item running through remote things:
		if item is not nowhere:
			place the item in scope;
	repeat with zone running through rooms in the theater:
		place the zone in scope, but not its contents.
		
[if you ever decide to do something with a large open area and expanded scope, prepare for extra effort and planning when it comes to disambiguation and does the player mean activities.]
		
does the player mean doing something to the aughtlight when the aughtlight is not in the location:
	it is unlikely.
	
[our problem child, the spotlight booth]

instead of directing transit to the spotlight booth when discover the aughtlight is happening and spotlight booth is not the location:
	if the location is not the location of the wooden ladder:
		say "I couldn't reach the platform on my own, so I decided to investigate the ladder underneath it instead.";
	try directing transit to the ladder;
		
instead of directing transit to the spotlight booth when experimental aughtlight is happening:
	say "D would be OK on his own. I wanted to have some fun with the Aughtlight instead.";
	
instead of directing transit to the spotlight booth when discover the aughtlight has not happened:
	say "There was no good way for me to get up there on my own. Maybe D and I could try after we figured out what was going on with this theater." instead;
	
[since the room is in scope, the player could try to EAT AUDITORIUM for instance.

special allowances for the booth, as always.]
	
instead of doing something other than permitted remote activity when the noun is a room:
	if smelling the location:
		continue the action;
	otherwise:
		if rescue the grue has not happened:
			if the noun is not the spotlight booth:
				say "I am a little cat, and [the noun] was a large place. I could only [oc]EXAMINE[cc] it or [oc]GO TO[cc] it.";
			otherwise if the noun is the spotlight booth and discover the aughtlight has not happened:
				say "[The noun] was too high to reach, and I didn't want to bother D about it.";
			otherwise if the noun is the spotlight booth and discover the aughtlight is happening:
				say "[if the location is not the spotlight booth and the location is not main entrance]I couldn't reach the platform on my own, so I decided to investigate the ladder underneath it instead.[otherwise if the location is main entrance]Without some assistance with the Miznian ladder, this was as close as I could get to the platform above.[otherwise]Now that I had reached the [spotlight booth], I was more interested in the things there than I was in the booth itself.";
			otherwise if the noun is the spotlight booth and experimental aughtlight was happening:
				say "I needed to stay down here on the floor so that I could help D use [the spotlight].";
		otherwise:
			continue the action.
		
[scoping for endgame areas, keeping D and the aughtlight visible.]

after deciding the scope of Marbles when Marbles is in endgame:
	place the spotlight booth in scope, but not its contents;
	place the Aughtlight in scope;
	place D in scope.

after deciding the scope of Marbles when Marbles is in climax:
	place the spotlight booth in scope, but not its contents;
	place D in scope;
	place the Aughtlight in scope;

[if the noun is remote, the game will attempt to move the player to it. a special case for the spotlight booth, naturally </3]
	
before doing something to something remote when the noun is not enclosed by the location and the noun is not enclosed by the spotlight booth (this is the traverse open spaces rule):
	if the location is spotlight booth:
		say "(first traveling to [the location of the noun])[command clarification break]"; 
		try directing transit to the location of the noun instead;
	unless examining something or following something or directing transit to something:
		say "(first traveling to [the location of the noun])[command clarification break]";
		try directing transit to the location of the noun;
		say "([the current action])[command clarification break]";
		set pronouns from the noun;
		continue the action;
	otherwise:
		continue the action.
		


Part 2 - fascination

[this game began as an experiement with relations. and here we go!

curiosity is what I use to print D's ambient texts.]

curiosity relates one thing (called the fascination) to people.
the verb to interest implies the curiosity relation.
definition: a thing is interesting if it interests D.

Part 3 (DELUMINING)

[delumination is used to track where the aughtlight is pointed. since it gets involved in turn-to-turn action processing, there's a bit more prep work to do.]

magical contraption is a kind of device. [there's only one magical contraption in the game, but just in case]

delumination relates one thing (called the aphosis) to one magical contraption.
the verb to be delumined by implies the delumination relation.
the verb to delumine (she delumines, they delumine, she delumined, it is delumined) means the reversed delumination relation.

definition: a thing is aphotic if the Aughtlight delumines it.

[it wouldn't make sense to list things covered by magical darkness in room descriptions]

rule for writing a paragraph about something aphotic (called the target):
	now the target is mentioned.
	
[I do this instead. Note that even though I say "random aphotic thing in the location", there is only evee one aphotic thing. It's a one-to-one relationship.]
	
first after looking when experimental Aughtlight is happening and something aphotic is in the location:
	let A be a random aphotic thing in the location;
	say "Thanks to the power of the Aughtlight, [the A] [are] completely covered in inky blackness. I couldn't see anything in there, not even with my keen kitty eyesight.";
	continue the action.

Book 2 - actions

Part 1 - new actions

[ambient messages will not print while performing cat behavior. for instance, D cannot talk to Marbles about a non-sequitur while she is talking to him about something else. it would be strange for Marbles to meow and have D ignore it.]

before performing cat behavior:
	now suppression flag is true.

Chapter 1 - looking toward

[I have never seen a tester attempt this, but doesn't it seem necessary in a game where distant rooms can be seen? I bring you: looking toward!]

looking toward is an action applying to one visible thing.

instead of examining a direction (this is the directional examining rule):
	try looking toward the noun.
	
carry out looking toward while the player is in the theater:
	if looking toward up:
		if the location is main entrance:
			try examining the spotlight booth instead;
		otherwise:
			try examining the ceiling instead;
	otherwise if looking toward down:
		if the location is spotlight booth:
			continue the action;
		otherwise:
			try examining the floor instead;
	otherwise if the noun is a room:
		try examining the noun;
	otherwise if the noun is a direction:
		let the scrutinized area be the room noun of the location;
		if the scrutinized area is a room:
			try examining the scrutinized area;
		otherwise:
			say "I stared at the wall for a moment. There was definitely something fishy about it!".
			
instead of looking toward when the player is in endgame:
	if looking toward up:
		try examining the ceiling;
	otherwise if looking toward down:
		try examining the floor;
	otherwise if the location is the plank:
		if the noun is east:
			say "A tightrope stretched east of there, just beyond a dangerous-looking jump.";
		otherwise:
			try failing to see from the plank;
	otherwise:
		if looking toward south:
			say "The auditorium was still to the [oc]SOUTH[cc].";
		otherwise:
			try failing to look in that way;
			
instead of looking toward when the player is in climax:
	if looking toward up:
		try examining the ceiling;
	otherwise if looking toward down:
		try examining the floor;
	otherwise if looking toward west when the location is not the cplank:
		try failing to look back;
	otherwise if looking toward east when the location is the cplank:
		try going east;
	otherwise if looking toward south:
		try examining the grues;
	otherwise if looking toward east when the location is abovew or the location is abovec:
		say "Rope. More shaky, bouncy, wobbly rope.";
	otherwise:
		say "There was nothing, truly and literally nothing in that direction, nothing but a shortcut to the floor far below."
		

failing to look in that way is an action applying to nothing.

carry out failing to look in that way:
	say "The stage was all around me, but I could [oc]EXAMINE [bk]a landmark[cb][cc] if I wanted to."
		
failing to see from the plank is an action applying to nothing.

carry out failing to see from the plank:
	say "Everything was too far, or too high.".
	
failing to look back is an action applying to nothing.

carry out failing to look back:
	say "The rope was too narrow! I could neither turn nor look back.".
		
Chapter 2 - meowing

[the first of many cat behaviors, and the primary means of advancing the story. Not a lot to it! Anything successfully meowed at is "discussed."]

meowing at is an action applying to one visible thing.
understand "meow at/-- [something]" as meowing at.
meowing at is possible from a distance.
carry out meowing at something:
	now the noun is discussed.
	
meowing at is performing cat behavior.
	
instead of meowing at Marbles:
	say "Why would I have needed to call attention to myself? You are paying attention, aren't you? Ha ha, say no more, I know it can hardly be helped."
	
Chapter 3 - scratching

scratching is an action applying to one touchable thing.
understand "scratch at/-- [something]" as scratching.

scratching is performing cat behavior.
does the player mean scratching d:
	it is very unlikely.
	
instead of scratching marbles:
	say "What are you implying? I didn't have any fleas."

Chapter 4 - biting

[the elusive biting action, the hardest to complete successfully]

biting is an action applying to one touchable thing.
understand "bite [something]" as biting.
understand "chomp [something]" as biting.

biting is performing cat behavior.
does the player mean scratching D:
	it is very unlikely.
	
instead of biting marbles:
	say "Sometimes I bit the spot above my tail if it felt a little itchy, but it was OK at the moment.".

Chapter 5 - hissing

hissing at is an action applying to one touchable thing.
understand "hiss at/-- [something]" as hissing at.
hissing at is performing cat behavior.

does the player mean hissing at D:
	it is very unlikely.
	
instead of hissing at Marbles:
	say "What? My dear Loretta, whatever are you thinking?".
	
Chapter 6 - napping

[no naps for marbles, sadly]

napping is an action applying to nothing.
understand "nap" as napping.
understand "sleep" as napping.

instead of napping:
	say "My feline heart yearned for a snack and a nap, but I decided not to leave D unattended."

Chapter 7 - grooming

[lots of grooming responses, plus some joke ones later.]

understand the command "clean" as something new.

grooming is an action applying to one thing.
understand "groom [something]" as grooming.
understand "clean [something]" as grooming.
understand "lick [something]" as grooming.
understand "wash [something]" as grooming.

grooming is performing cat behavior.

does the player mean grooming marbles:
	it is likely.

Instead of grooming Marbles during prologue:
		say "A bit of grooming is always good for dealing with stress, but I decided to wait until we had either light or exit at paw.".
		
carry out grooming Marbles during inspect the box:
	say "I took a moment to get myself together. I do my best thinking when I look my best, after all.".
	
carry out grooming Marbles during discuss the bag:
	say "A short break wouldn't hurt! I licked my paw, then smoothed back the fur covering my face."
	
carry out grooming Marbles during discover the Aughtlight:
	say "I felt we were close to a great discovery, D and I. To calm myself a little, I licked the fur on my back, just above my rear left leg.".
	
carry out grooming Marbles during experimental Aughtlight:
	say "Things were getting a little stressful, so I gave myself a couple of quick licks.".
	
carry out grooming Marbles during rescue the grue:
	say "The stakes felt higher, now that Gruecilla was out of her tank, so I licked my right shoulder. What a relief!"
	
Chapter 8 - marking

understand the command "rub" as something new.

marking is an action applying to one touchable thing.
marking is performing cat behavior.
understand "mark [something]" as marking.
understand the command "rub" as something new.
understand "rub [something]" as marking.

instead of marking marbles:
	say "It is better for a cat to mark than it is for her to be marked.".
	

chapter 9 - jumping

understand the command "jump" as something new.

jumping to is an action applying to one touchable thing.
jumping to is performing cat behavior.
understand "jump at/to/on/onto/-- [something]" as jumping to.
understand "leap at/to/on/onto/-- [something]" as jumping to.

instead of jumping to Marbles:
	say "Done! I have already jumped to myself, faster than a blink. There! I did it again!";
	
understand "jump to it" as a mistake("Jumping to it is my default state! I've jumped to it before, and I'll jump to it again.").


chapter 10 (pawing)

pawing is an action applying to one thing.
pawing is performing cat behavior.
understand "paw at/-- [something]" as pawing.
understand "bat at/-- [something]" as pawing.

instead of pawing marbles:
	say "I would only muss my fabulous coat."
	
chapter 11 (purring)

[marbles can purr anytime she needs a little reassurance.]

purring is an action applying to nothing.
purring is performing cat behavior.
understand "purr" as purring.

carry out purring during prologue:
	say "Since I was a little worried about D getting along in this darkness, I took a moment for a reassuring purr."
	
carry out purring during inspect the box:
	say "We were trapped in the theater! I'd be fine, obviously, but what about D? I calmed myself with a bit of purring."
	
carry out purring during discuss the bag:
	say "I can't believe we were stuck in there with that stinky box! I tried to calm down with a soothing purr."
	
carry out purring during discuss the grue:
	say "Yikes! I didn't want D to see how nervous I was about the grue, so I comforted myself with a little purring."
	
carry out purring during discover the aughtlight:
	say "Despite the danger and strangeness of it all, D and I had made good progress! I celebrated with a satisfied purr."
	
carry out purring during experimental aughtlight:
	say "We were really getting somewhere! I didn't want to gloat, but I thought I deserved a nice, long purr."
	
carry out purring during rescue the grue:
	say "I was feeling pretty tense now that Gruecilla was out of the box! I calmed myself with a little purr."
	
chapter 12 (color mode)

coloring is an action out of world applying to nothing.
understand "color" and "color mode" and "mode" and "light mode" and "light" and "dark mode" and "dark" as coloring.

carry out coloring:
	follow the initial buffer window rule;
	follow the grid window rule;
	follow the initial input rule;
	say "[one of]Light[or]Dark[cycling] mode activated.";

Part 2 - customizations to built-in actions

[these are all in the standard rules already, but I need to do some tweaks.]

Chapter 1 - examining a room
		
carry out examining a room:
	if the noun is the location:
		try looking instead;
	otherwise:
		say "[a variable description]";
		say line break;
		rule succeeds.
		
Chapter 2 - smelling

the report smelling rule is not listed in any rulebook.
smelling is performing cat behavior.

carry out smelling marbles:
	say "Ah, yes, my elegant scent! When friends smell it, their hearts leap with joyous anticipation!"

Chapter 3 - listening

the report listening rule is not listed in any rulebook.
listening is performing cat behavior.

instead of listening to marbles:
	say "Since I'm not purring or meowing at the moment, I'm silent, slinky, and stealthy."

Chapter 3 - going down

after reading a command (this is the d redirect rule):
	if the player's command in lower case is "d":
		try going down instead.

Chapter 5 - entering (climbing)

the block climbing rule is not listed in any rulebook.

understand the command "lie" as something new.

[I wanted to avoid unique commands for climb, enter, lie on, etc.... though I think everybody jumps or leaps]

understand "lie down/-- on/in/-- [something]" as jumping to.

instead of entering a person:
	say "What a strange idea! You lemurs are an odd bunch, that's for sure.".
	
chapter 6 (taking)

failing to acquire is an action applying to one thing.

instead of taking something untakeable:
	try failing to acquire the noun.

carry out failing to acquire something:
	say "Don't make fun of me! You know that [the noun] [are] too big for a cat to carry. Besides, you primates are the ones who like carrying things.".
	
chapter 7 (wearing)

before wearing something:
	say "I was already well-dressed. My black coat is sleek and graced with a white locket." instead.
	
the standard implicit taking rule does nothing when wearing something.

chapter 8 (putting etc)

[I don't know that I'd call this a 'limited parser' game. It's very responsive and accepts many commands. It certainly wasn't limited in terms of my own effort. The same is true with Portrait with Wolf. Every standard rules action is accounted for, as are many more custom commands.]

the standard implicit taking rule does nothing when inserting something into something.
the standard implicit taking rule does nothing when putting something on something.

before inserting something into something:
	say "Putting things into things is people stuff. Cats have better things to do." instead.
	
before putting something on something:
	say "Putting things on things is people stuff. Cats have better things to do." instead.
	
chapter 9 (dropping)

before dropping something:
	say "I had only myself and my coat. Who would part with such treasures?" instead.
	
chapter 9 (giving)

the standard implicit taking rule does nothing when giving something to something.

before giving something to something:
	say "I only have myself and my coat to give. Who would part with such treasures?" instead.
	
the standard implicit taking rule does nothing when showing something to something.

before showing something to something:
	if the second noun is D:
		try meowing at the noun instead;
	otherwise if second noun is an animal and the second noun is not Marbles:
		say "I thought that [the noun] might interest [the grue], but I wasn't sure how to communicate with her in the darkness.";
	otherwise:
		say "I was a busy feline with a lot on her mind. Keeping [the noun] entertained was not my responsibility!".
		
chapter 10 (eating)

the standard implicit taking rule does nothing when eating something.

chapter 11 (pushing pulling turning)

instead of turning something:
	if the noun is the player and the location is climax and the location is not cplank:
		say "I couldn't turn around on that skinny little rope. I could only run forward and [oc]EAST[cc]. Run run run!";
	otherwise if the player is the noun:
		say "I turned gracefully in place.";
	otherwise:
		say "That is far too large for a cat to move around. I wouldn't wish for such brutish capability regardless.".
		
instead of pushing something:
	if the noun is Marbles:
		say "Madam, you have mistaken me for some other animal, of that I am sure.";
	otherwise if the noun is D:
		say "I am shocked by your suggestion. Simply shocked!";
	otherwise if the noun is the grue:
		say "Such behavior would have been uncivilized. No cat would consider it outside of the most dire context.

That is to say nothing of the risks involved in trying to jostle a grue around.";
	otherwise:
		say "That is far too large for a cat to move around. I wouldn't wish for such brutish capabilities regardless.".
		
instead of pushing something to something:
	try pushing the noun.
	
instead of pulling something:
	try pushing the noun.
	
chapter 12 (listening)

understand "listen [something]" as listening to.
	
Book 3 - global rules and mechanical stuff

Part 1 - printing texts with complex conditions

Section 1 - descriptions that vary

[this was one of the earliest tech demo features of the work: using one definition to print room or item descriptions based on multiple factors. "[variable description]" is the printed description of most things in-game.]
	
to say a variable description:
	let the consideration be nothing;
	if the noun is nothing:
		now the consideration is the location;
	otherwise if the noun is a direction:
		now the consideration is the location;
	otherwise:
		now the consideration is the noun;
	choose row with an item of the consideration in the table of references;
	let L be the table name entry;
	choose row with a present action of the current scene in L;
	say the description entry;
	
[in some cases, the default handling of room descriptions was undesirable via "look", so I spoofed look output myself. mostly important during scene changes, which can be fiddly.]

to say a room's information:
	say "[bt][location][rt]";
	say line break;
	choose row with an item of the location in the table of references;
	let L be the table name entry;
	choose row with a present action of the current scene in L;
	say the description entry;
	say line break;
	carry out the printing the locale description activity with the location.
	
Part 2 - action tracking

[this is almost as complex as anything in portrait with wolf. very tricky. a scoring system based on multiple axes with shifting criteria.]

after performing cat behavior:
	let new action be true;
[

FIGURE OUT IF ACTION IS OLD OR ELSE NEEDED TO ADVANCE THE STORY

		]
	unless grooming or purring:[ grooming and purring tracked by scene, so these factors don't apply]
		repeat through the table of feline actions:
			if the current action is the cat behavior entry and the place entry is the location and there is a turn stamp entry:
				now new action is false;
				break;
	otherwise if grooming or purring:[ stripped down requirements]
		repeat through the table of feline actions:
			if the current action is the cat behavior entry and the scene entry is the current scene and there is a turn stamp entry:
				now new action is false; [if marbles has already gotten credit for the action, stop the process]
				break;
[ 


UPDATE THE TRACKING TABLE FOR NEW ACTIONS
			
					]
	if new action is true:
		let the current ranking be the progress of Marbles; [store Marble's rank for future comparison]
		choose blank row from the table of feline actions;
		now the cat behavior entry is the current action;
		unless grooming or purring:
			now the place entry is the location;
		otherwise if grooming or purring:
			now the scene entry is the current scene;
		now the turn stamp entry is the turn count;
[since ranking is calculated on-the-fly based on table contents, we can check our stored rank against it]
		if the current ranking is not the progress of Marbles:
			say "[bt]Remarkable! I have advanced in rank. Admire my progress via the [oc]SCORE[cc] command.[rt]";
		otherwise:
			say "[bt]I have[em]rather impressively[em]fulfilled a feline duty! I could review my progress with the [oc]SCORE[cc] command.[rt]";
	continue the action;
	
[I used to do this differenly, but there were performance issues! This is a less resource-intense method]
		
to decide which grade is the progress of Marbles:
	repeat through the table of temp figures: [this is a kind of scratch pad]
		now count entry is zero;
	let single be zero;
	let double be zero;
	repeat through the table of feline actions: [find every non-999 entry and add to the tally.]
		if there is a turn stamp entry and turn stamp entry is not 999:
			let TA be action name part of the cat behavior entry;
			choose row with a text of "[TA]" in the table of temp figures;
			increment count entry;
	repeat through the table of temp figures: [figure out doubles and singles for scores that require more than one of a few cat behaviors]
		if count entry is one:
			increment single;
		otherwise if count entry is greater than one:
			increment double;
	if (single plus double) is 11 and double is greater than three and cat count is greater than 14:[ important to get everything on one line to avoid missed requirements]
		decide on transcendent;
	otherwise if double is greater than three:[ these are in specific order to avoid sequence breaking, which came up in testing]
		decide on exemplary;
	otherwise if (single plus double) is greater than three:
		decide on outstanding;
	otherwise:
		decide on passing;	

table of temp figures
text	count
"meowing at"	0
"jumping to"	0
"scratching"	0
"biting"	0
"hissing at"	0
"marking"	0
"pawing"	0
"smelling"	0
"listening to"	0
"grooming"	0
"purring"	0

	
reporting is an action out of world applying to nothing.
understand "r" or "report" as reporting.
understand "grade" or "rank" or "status" as reporting.

understand the command "score" as something new.

the announce the score rule is not listed in any rulebook.	

understand "score" as reporting.

[just a little report]

carry out reporting (this is the report card rule):
	say "======[lb]";
	say "[bt]Report Card for Marbles![rt]
[lb] [if meow count is greater than zero]✔[otherwise]✖[end if] Meowing: [meow count]
[lb] [if scratch count is greater than zero]✔[otherwise]✖[end if] Scratching: [scratch count]
[lb] [if bite count is greater than zero]✔[otherwise]✖[end if] Biting: [bite count]
[lb] [if hiss count is greater than zero]✔[otherwise]✖[end if] Hissing: [hiss count]
[lb] [if groom count is greater than zero]✔[otherwise]✖[end if] Grooming: [groom count]
[lb] [if mark count is greater than zero]✔[otherwise]✖[end if] Marking: [mark count]
[lb] [if jump count is greater than zero]✔[otherwise]✖[end if] Jumping: [jump count]
[lb] [if paw count is greater than zero]✔[otherwise]✖[end if] Pawing: [paw count]
[lb] [if purr count is greater than zero]✔[otherwise]✖[end if] Purring: [purr count]
[lb] [if smell count is greater than zero]✔[otherwise]✖[end if] Smelling: [smell count]
[lb] [if listen count is greater than zero]✔[otherwise]✖[end if] Listening: [listen count]
[lb][lb] [if cat count is greater than four]✔[otherwise]✖[end if] Total Points: [cat count]

[bt]Your current grade is:[rt]
[lb]  [Progress of Marbles]!

[progression advice]";
	say "======[rt][lb]".

to say progression advice:
	if progress of Marbles is passing:
		say "[it]To progress to the next grade, earn at least one point in four disciplines.[rt]";
	otherwise if progress of Marbles is outstanding:
		say "[it]To progress to the next grade, earn at least two points in four disciplines.[rt]";
	otherwise if progress of Marbles is exemplary:
		say "[it]To progress to the next grade, earn at least one point in every discipline and acquire 15 total points.[rt]";
	otherwise if the progress of Marbles is transcendent:
		say "[it]Finally, the recognition I deserved! Even though I had reached the final rank, my career as a cat was not over. A cat's joy is more than points; it is life in the moment.";
		
[these built-in actions are required to finish the game. They aren't worth any cat points.

note: since this table updates during AFTER phase, the "place" entries for these exempted actions need to reflect player location at that time. For instance, jumping to ctightrope changes location during the carry out phase.]

Table of Feline Actions
cat behavior	place	scene	turn stamp
Marbles meowing at the light switch	main entrance	(a scene)	999
Marbles smelling the auditorium	auditorium	--	999
Marbles smelling the chairs	auditorium	--	999
Marbles meowing at the bag	auditorium	--	999
Marbles meowing at the box	center stage	--	999
Marbles meowing at the wooden ladder	spotlight booth	--	999
Marbles meowing at the tag	spotlight booth	--	999
Marbles jumping to the folding metal chair	main entrance	--	999
Marbles jumping to the flat board	spotlight booth	--	999
Marbles jumping to the floor	spotlight booth	--	999
Marbles meowing at the chair	spotlight booth	--	999
Marbles meowing at the grue	center stage	--	999
Marbles meowing at the Gruemobile	egladder	--	999
Marbles jumping to the right sandbag	egladder	--	999
Marbles jumping to the right sandbag	dinosaur head	--	999
Marbles meowing at the tail	dinosaur head	--	999
Marbles meowing at the vent	dinosaur head	--	999
Marbles jumping to the left sandbag	dinosaur head	--	999
Marbles jumping to the left sandbag	plank	--	999
Marbles meowing at schead	plank	--	999
Marbles meowing at escape	plank	--	999
Marbles jumping to ctightrope	aboveW	--	999
with 1000 blank rows

table of grading rubrics
discipline	current ranking	time stamp
(a text)	(a grade)	(a number)
with 99 blank rows

[these are the in-game rankings, referred to as "grade"]

a grade is a kind of value.
the grades are PASSING, OUTSTANDING, EXEMPLARY, and TRANSCENDENT.

[the design for getting these numbers isn't great. Multiple reads through the same database, getting totals of various things. The only time it happens is while generating the report card. I guess I'm just proud it works, but in a larger/more complex system I think I would have to find a more efficient way.]
	
to decide which number is the cat count:
	let N be 0;
	repeat through the table of feline actions:
		if there is a turn stamp entry and turn stamp entry is not 999:
			increment N;
	decide on N.

to decide which number is the jump count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "jumping to":
				increment N;
	decide on N.
		
to decide which number is the meow count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "meowing at":
				increment N;
	decide on N.
		
to decide which number is the scratch count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "scratching":
				increment N;
	decide on N.
		
to decide which number is the bite count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "biting":
				increment N;
	decide on N.
	
to decide which number is the hiss count:		
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "hissing at":
				increment N;
	decide on N.
		
to decide which number is the mark count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "marking":
				increment N;
	decide on N.
		
to decide which number is the paw count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "pawing":
				increment N;
	decide on N.
		
to decide which number is the smell count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "smelling":
				increment N;
	decide on N.
		
to decide which number is the listen count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "listening to":
				increment N;
	decide on N.
	
to decide which number is the groom count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "grooming":
				increment N;
	decide on N.
	
to decide which number is the purr count:
	let N be zero;
	repeat through the table of feline actions:
		if turn stamp entry is not 999:
			if "[the action name part of the cat behavior entry]" is "purring":
				increment N;
	decide on N.

Book 4 - phrases

Part 1 - D actions and descriptions

Chapter 1 - D's remote status

[this prints the ambient text based on scene and D's current interest]
	
relevant source is a table name that varies.
	
to say the current fascination:
	let the concern be the fascination of D;
	choose row with an item of concern from the table of fascinations;
	now the relevant source is table name entry;
	choose row with an active scene of current scene from the relevant source;
	say description entry;

Chapter 2 - D's movement and Marbles's Movement

before doing something:
	now generic transit flag is false.
	
[this is a complex rule governing D's behavior. despite the name, it handles his quips as well.]

every turn (this is the D's movement rule):
	if the location of D is not the destination of D: [if he isn't in his destination, figure out how to get him there]
		let the right direction be the best route from the location of D to the destination of D;
		try D going the right direction;
		if the location of D is the destination of D:
			say the arrival text;
			say run paragraph on;
			now fascination damper is false;[if he's where he belongs, he can talk]
		otherwise if the location of D is the location:
			let L be "[the destination of D]" in lower case;
			say "Nearby, D was making his way toward [L].[if the current action is directing transit to][lb]";
		otherwise:
			let L be "[the location of D]" in lower case;
			say "Off in the distance, I could see D passing through [L] on his way to [if the destination of d is not center stage]the [end if][the destination of D].";
			if grue interests D and gnumber is less than five and the current action is not looking:
				say the current fascination;
	otherwise if the location of D is the destination of D and the fascination of D is not nothing and generic transit flag is false:
		if the grue interests d and gnumber is less than five:[this exception is just to make sure we can see Gruecilla eat the treats in "discover the aughtlight"]
			say the current fascination;
		otherwise if the current action is not looking and fascination damper is false:
			if a random chance of 1 in 3 succeeds:
				say the current fascination;
	now generic transit flag is false;
	now fascination damper is false;
	continue the action.
	
to say the arrival text:[special text for when D reaches his destination]
	if the exit doors interest D:
		say "[if D is not in the location]Off to the [oc]SOUTH[cc], I saw D reach[otherwise If D is in the location]D reached[end if] for the doors, then gave them a good shake.[lb]";
	if the box interests D:
		say "[if D is in the location]Having arrived at center stage, D knelt beside [the box] and examined it carefully.[otherwise]Just to the [oc]NORTH[cc] of here, D knelt beside [the box] and examined it carefully.[lb]";
	if the bag interests D:
		say "D joined me in the auditorium area. 'What did you find, Marbles? Some kind of bag?'[lb]";
	
The describe room gone into rule does nothing when the actor is D.[some built-in standard rules text that we don't need to see.]

rule for writing a paragraph about D:[mentioning d in room descriptions was complicated by his movements and speech.]
	if the location of d is not the destination of d:
		now d is mentioned;
	otherwise if experimental aughtlight has ended:
		now D is mentioned;	
	otherwise if something interests D and d is in the location:
		if discover the aughtlight is happening and gnumber is less than five:
			now d is mentioned;
		otherwise:
			say the current fascination;
			now fascination damper is true;
			now generic transit flag is false;
			now D is mentioned.
	
After choosing notable locale objects when d is in the location:
	set the locale priority of D to 10; [this prints D's paragraph last when multiple things are in the room]
	
[a new action]
	
following is an action applying to one visible thing.
understand "follow [something]" as following.

instead of following a direction:
	say "(instead attempting to go [noun])[command clarification break]";
	try going the noun.
	
[this action is mainly intended for following D around]

carry out following D (this is the pursuit rule):
	if D is not in the location and D is not in the spotlight booth:
		repeat with target running through rooms:
			if Marbles is not in the destination of D:
				say "[one of]I decided to chase down D right away.[or]I headed in D's direction.[or]I wanted to see what D was up to.[cycling]";
				let M be the best route from the location of Marbles to the destination of D;
				try going m;
				now generic transit flag is true;[ this prevents ambient text from printing while following D]
	otherwise if the location of D is the spotlight booth and the location of Marbles is not in the spotlight booth:
		unless rescue the grue is happening: [this stops working entirely during the endgame, though the feedback is situtational]
			say "There was no easy way for me to get up there on my own, and, besides, D needed me down here.";
		otherwise if rescue the grue is happening:
			say "D seemed so far away, and I couldn't get to him until Gruecilla was safely somewhere else.";
		otherwise if escape the theater is happening:
			say "Going to D now would just reveal his location to the grues! If I wanted to help him, I needed to focus on doing what I could do from above the stage.";
	otherwise if the location of D is the location of Marbles:[if D and marbles are in the same place]
		say "I rubbed my side against D's leg. I was already as close as I could get to him.".

carry out following when the noun is grue or the noun is Gruecilla:
	say "I could see [the noun] well enough from [the location].".
	
[the directing transit to action (see below) is substituted in if it makes better sense]
	
instead of following something:
	if the noun is not a person:
		say "(instead attempting to go to [the noun])[command clarification break]";
		try directing transit to the noun;
	if the noun is Marbles:
		say "I'm not a dog that chases her own tail.";
	otherwise if the noun is the grue and discuss the grue is happening:
		say "I could go to the Gruequarium, but I wasn't getting in!";
		try directing transit to the box;
	otherwise if the noun is grue and discuss the grue has ended and rescue the grue has not happened:
		if the location is not spotlight booth:
			say "I had a feeling that Gruecilla was pretty nice, so far as grues went, but I preferred to keep my distance. The Gruequarium was as far as I would go.";
		try directing transit to the box;
	otherwise if the noun is grue and rescue the grue is happening:
		say "I would not join Gruecilla in the Aughtlight's beam. It wasn't because I was afraid, either! Don't you dare say that I was afraid!";
	otherwise:
		continue the action.
		
understand the command "go" as something new.
understand the command "walk" as something new.
understand the command "run" as something new.

[since "as something new" wipes out all understood uses of a verb, I have to re-add these staples before doing my own thing.]
		
Understand "go" as going.
Understand "go [direction]" as going.
Understand "go into/in/inside/through [something]" as entering.
Understand the commands "walk" and "run" as "go".
		
directing transit to is an action applying to one visible thing.
directing transit to is permitted remote activity.
understand "go to [something]" as directing transit to.
understand "go [something]" as directing transit to.

before going:
	if the noun is not a direction:
		try directing transit to the noun instead;

instead of entering a room:
	try directing transit to the noun;
	
does the player mean directing transit to something enclosed by the location:
	it is very unlikely.
	
does the player mean directing transit to the spotlight booth:
	it is very unlikely.

redirecting is a truth state that varies.

[this should look a lot like the following action above. marbles will try to find her way to a thing or room. Instead of breaking her trip up into separate inputs, I loop so that every step happens in a single play turn. Ambient text is suppressed while marbles is in motion.]

carry out directing transit to a room when rescue the grue has not happened:
	let starting location be the location;
	let arrival suppression be false;
	if the noun is the location:
		say "I was already there. I'm very efficient!";
	otherwise if the noun is the spotlight booth:
		if discover the aughtlight has not happened:
			say "I thought D and I would make our way up there eventually, but we were still busy down in the theater." instead;
		otherwise if discover the aughtlight is happening:
			say "I hadn't been to the top of the ladder before. I decided to check out the ladder and see if there were any clues.";
			try directing transit to the ladder instead;
		otherwise if experimental aughtlight is happening:
			say "D was in charge of the booth. I needed find targets for D and the Aughtlight." instead;
		now redirecting is true;
		now arrival suppression is true;
		try climbing the wooden ladder instead;
	otherwise if the location is the spotlight booth:
		try going down instead;
	otherwise:
		repeat with target running through rooms:
			if the location of Marbles is not the location of the noun:
				say "[if redirecting is true][rp][otherwise if location is starting location]I began to make my way to [the noun].[otherwise]I continued to make my way to [the noun].";
				let M be the best route from the location of Marbles to the noun;
				try going m;
				now the generic transit flag is true;
				now redirecting is false;
				follow the d's movement rule;
				
[directing transit to doesn't really work once the endgame begins, but some substitutions are needed to prevent unwanted player friction.]
	
instead of directing transit to something when rescue the grue is happening and the location is egladder:
	if the noun is egbeam:
		try meowing at the beam instead;
	otherwise:
		continue the action.

instead of directing transit to D:
	try following D.
	
instead of directing transit to when the noun is grue:
	try following the noun.
	
instead of directing transit to when rescue the grue is happening and the noun is not in the location:
	say "Because I was in an awkward geography above the stage, and because Gruecilla was roaming below, I couldn't really [oc]GO TO[cc] places or things anymore. I'd have to find my way, one step at a time.";
	
instead of directing transit to something when escape the theater is happening:
	say "I couldn't use general commands like that in the middle of a crisis. Instead, I would have to be specific about actions or directions."

instead of directing transit to the right sandbag:
	try jumping to the right sandbag;
	
instead of directing transit to the left sandbag:
	try jumping to the right sandbag.

instead of directing transit to the Gruequarium:
	try directing transit to Gruecilla;

instead of directing transit to the fgrue:
		try examining the fgrue instead;
		
last instead of directing transit to something when the noun is in the location:
	say "I was already near [the noun]! You must think me quite clever and efficient."
		
carry out directing transit to something remote:
	say "([the location of the noun], location of [the noun])[command clarification break]";
	try directing transit to the location of the noun instead.

rule for clarifying the parser's choice of something when the current action is directing transit to and the noun is not a room:
	do nothing.

Book 5 - scenes

[at last, the scene stuff. if I'm honest, I must admit that my commitment to scenes was imperfect. They end with action processing assertions: "now the current scene is 'inspect the box'" for instance. Nevertheless, I don't cheat their place in the turn--between report and every turn.]

[scenes can be given properties. I stopped using this "linear" property several versions ago, but I've left it in as a point of interest.]

a scene can be linear.
a scene is usually not linear.

[scenes are values!]

the current scene is a scene that varies.

prologue is a linear scene.
inspect the box is a linear scene.
discuss the bag is a linear scene.
discuss the grue is a linear scene.
discover the Aughtlight is a linear scene.
experimental Aughtlight is a linear scene.
rescue the grue is a linear scene.
escape the theater is a linear scene.


the current scene is usually prologue.
prologue begins when play begins.
prologue ends when the current scene is inspect the box.

inspect the box begins when the current scene is inspect the box.
inspect the box ends when the current scene is discuss the bag.

discuss the bag begins when the current scene is discuss the bag.
discuss the bag ends when the current scene is discuss the grue.

discuss the grue begins when the current scene is discuss the grue.
discuss the grue ends when the current scene is discover the Aughtlight.

discover the Aughtlight begins when the current scene is discover the Aughtlight.
discover the Aughtlight ends when the current scene is experimental Aughtlight.

experimental Aughtlight begins when the current scene is experimental Aughtlight.
experimental Aughtlight ends when the current scene is rescue the grue.

rescue the grue begins when the current scene is rescue the grue.
rescue the grue ends when the current scene is escape the theater.

escape the theater begins when the current scene is escape the theater.

[a lot of this won't make sense until later; you might want to move on then come back]

Chapter 4 (scene management)
		
[mostly short rules for handling scene transitions]

section 1 (rules for inspect the box)

after examining the box while inspect the box is happening:
	if the box is in the location:
		say "D bent down beside the box. 'Wow, Marbles, will you look at this little plaque on the side? It reads [']Frobozz Magic Gruequarium Company![']' He took a cautious step back. 'You don't suppose there's a grue in there, do you?' He took another step away from what now seemed to be a giant, magical fish tank.";
		now the box is examined;
		say line break;
		say cat prompt;
		now the current scene is discuss the bag;
		let N be the number of filled rows in the source of status information;
		set statusbar height to N;
	continue the action.

when inspect the box begins:
	show toc 3;
	say "[lb][tab][bt]ACT ONE[rt]
[lb][tab][it]A Box Full of Nothing[rt]


";
	now the prologue clutter is nowhere;
	repeat with item running through things:
		if the item is a prop in inspect the box:
			now the item is in center stage;
	now the box interests D;
	now the destination of D is center stage;
	say "=== [bt]CAT NEWS NETWORK[rt] ===";
	say line break;
	say line break;
	try navigating;
	say line break;
	say line break;
	say "=== [bt]CAT NEWS NETWORK[rt] ===";
	SAY line break;
	say line break;
	now the real clutter is fixed in place;
	say cat prompt;
	say a room's information.
	

section 2 (rules for discuss the bag)

when discuss the bag begins:
	show TOC 4;
	say "[lb][tab][bt]ACT TWO[rt]
[lb][tab][it]A Shape in the Dark[rt]

";
	now the plaque is part of the box;
	now the box interests D;
	try looking;
	say line break;
	say "=== [bt]CAT NEWS NETWORK[rt] ===";
	say line break;
	say line break;
	try catting;
	say line break;
	say "=== [bt]CAT NEWS NETWORK[rt] ===";
	say line break;
	say line break;
		
section 3 (rules for discuss the grue)

when discuss the grue begins:
	show toc 5;
	move the hgsg to endgame;
	move the cgsg to theater;
	move the cgsg to endgame;
	move the cgsg to climax;
	move the cgsg to theater;
	now the bag interests D;
	now D carries the flyer;
	now the flyer interests D;
	now the grue is in center stage;
	now the grue is publicly-named;
	now the fgrue is nowhere;
	say "[lb][tab][bt]ACT THREE[rt]
[lb][tab][it]Introductions[rt]

";
	try looking;
[	now one-time mute is true;]
	
instead of doing something to the flyer when discuss the grue has ended:
	say "I'm not sure where D put the flyer. What a sneaky sneak!"
	
instead of doing something other than examining or meowing at to the flyer when the flyer interests d:
	say "D was busy with the flyer already. Besides, why look at a flyer about grues when a real, live grue was onstage?"
	
the description of the flyer is "[if discuss the grue is happening]The flyer, which advertised The Circus of the Grues, looked pretty interesting, but not as interesting as the grue onstage.[otherwise]I'm not sure where D put the flyer. What a sneaky sneak!"

instead of meowing at the flyer when discuss the grue is happening:
	say "[one of]D looked up. 'I know, Marbles? Can you imagine? A grue! Onstage! Here!'[or]D wasn't going to look up from that flyer until I showed him something even more interesting.[stopping]"
		
instead of doing something when discuss the grue is happening and the grue is undiscovered:
	if looking:
		continue the action;
	otherwise:
		say "Just as I was about to start [current action], I froze. There was something moving inside of the Gruequarium! It was like a reverse shadow: a white, human-shaped thing in the darkness! I say it was human-shaped, but its movements were not human. The thing had a strange bendiness to it, and it seemed to wriggle and sidle and scootch back and forth in the tank, as if searching for a way out.

Was this the magic of the grue-sensitive glasses? And, if so, was I looking at...

[it]...a grue?[rt]";
		now the grue is discovered;

	
carry out meowing at the box when the location is center stage:
	if discuss the grue is happening:
		say "D looked up from the flyer. 'Huh? Oh, would you look at that!' he said, looking at the Gruequarium and its contents. 'What do you suppose that is?' And with that, he started jogging toward the stage.";
		say line break;
		say tank;
		say line break;
		now the destination of D is center stage;
		now the grue interests D;
		say cat prompt;
		now the current scene is discover the Aughtlight;
		let N be the number of filled rows in the source of status information;
		set statusbar height to N;
	

instead of meowing at the grue when the location is center stage and discuss the grue is happening:
	try meowing at the box instead.
	
section 4 (rules for discover the Aughtlight)

when discover the Aughtlight begins:
	show toc 6;
	now the grue is proper-named;
	say "[lb][tab][bt]ACT FOUR[rt]
[lb][tab][it]Marbles, D, and the Sinister Spotlight[rt]

[lb][it]I had a feeling that there would not be many opportunities for cat behavior after Act Four. This was the time to earn the rating that I deserved, if I hadn't already.[rt][lb]";
	try looking;

	
section 5 (rules for experimental Aughtlight)

the beam is scenery.
the beam is nowhere.
understand "darkness" as the beam.
understand "dark" as the beam.
understand "blackness" as the beam.
understand "Aughtlight/spotlight/-- beam" as the beam.

does the player mean doing something with the beam when experimental Aughtlight is happening:
	it is likely.

when experimental Aughtlight begins:
	show toc 7;
	now the Aughtlight delumines the chairs;
	move the beam to the auditorium;
	now nothing interests D;
	say "[lb][tab][bt]ACT FIVE[rt]
[lb][tab][it]The Darkness of Magic, and the Magic of Darkness[rt]


";
	say a room's information;
	

[some new mechanics for handling the behavior of the aughtlight. we're changing relations when we meow at new things, but that's mostly built-in stuff that doesn't take a lot of work from us.]
	
instead of meowing at something when experimental Aughtlight is happening and the location is main entrance:
	say "I wondered if something interesting might happen if D pointed the Aughtlight at [the noun]. 'Hey Marbles!' D called out, 'The Aughtlight won't turn that far! Try meowing at something in the auditorium or at center stage.'".
	
instead of meowing at when experimental Aughtlight is happening and the location is not main entrance and the noun is not aphotic:
	if the location is the location of the noun:
		unless the noun is the box or the noun is grue:
			say "[a generic delumining message]";
			now the Aughtlight delumines the noun;
			now the beam is in the location;
			now the Aughtlight delumines the noun;
		otherwise:
			continue the action.
		
instead of meowing at something aphotic when experimental Aughtlight is happening:
	say "'Hey, wait a minute! How can I point the Aughtlight at [the noun] when it's already pointed at that?' I suppose D was right.".
			

carry out meowing at when experimental Aughtlight is happening and the location is center stage:
	if the noun is the box or the noun is grue:
		say "What if we could get Gruecilla out of the box by using the Aughtlight? I puffed up my chest and meowed as loudly as I could. 'Huh?' D yelled from the booth, 'Do you really think that's a good idea?' D, a sensitive boy, was a worrier.

'MRAOW!' I told him. It's not right to put creatures in cages.

'Gosh, you seem pretty sure! OK, I'll do it. You know, If we do things right, we might be able to lead her out of the theater. Jump up on that stepladder, would you? I think we should give her lots of space.'

And with that, I climbed to the top of the ladder.";
		now the Aughtlight delumines gruecilla;
		say line break;
		say cat prompt;
		now the current scene is rescue the grue;	
		let N be the number of filled rows in the source of status information;
		set statusbar height to N;	
		
[that's not to say there aren't tricky bits! It's important to consider what is and what isn't "off-limits" during these phases of play.]

to say a generic delumining message:
	say "[one of]I meowed at [the noun]. 'OK, Marbles! I'll aim at [the noun]!' In seconds, the darkness of the Aughtlight completely concealed [them].[or]'Just a second, Marbles!' D called out. Soon, the darkness of the Aughtlight covered [the noun].[or]I meowed loud enough for D to hear it all the way up in the Aughtlight booth. 'You've got it, Marbles! Here you go.' The beam of darkness crept across the room, and soon [the noun] was swallowed by darkness.[cycling]";

	
instead of examining something aphotic when rescue the grue has not happened:
	let n be "[the noun]" in sentence case;
	say "[one of][n] [are] completely engulfed in magical darkness.[or]Even though I couldn't see [the noun], I knew that [they] [are] hidden within the magical darkness of the Aughtlight.[or]There was only blackness where [the noun] once was.[cycling]";
	

before doing anything other than performing cat behavior or examining or entering the beam when the current action involves the beam:
	say "I did not want to touch or even get close to the aughtlight beam. What good is darkness you can't see in?" instead.
		
instead of examining the beam:
	try examining the aphosis of the Aughtlight.
	
instead of entering the beam:
	say "I'd sooner roll around in my litter box."
	
instead of doing something with the beam when the current action is performing cat behavior:
	if meowing at:
		say "I was feeling a little mischievous, so I tried to trick D into pointing the beam at the beam. He didn't fall for it, though. 'Hey, silly! You know that won't work.";
	if jumping to:
		try entering the beam;
	if hissing at:
		continue the action;
	otherwise:
		say "Unless a dire need arose, I would not be caught within pawing distance of the beam."
	
carry out hissing at the beam:
	say "I didn't care for the beam one bit, even if it might come in handy, and I didn't mind saying so!".
		
instead of meowing at the beam:
	say "I was feeling a little mischievous, so I tried to trick D into pointing the beam at the beam. He didn't fall for it, though. 'Hey, silly! You know that won't work.";
	
before doing something when the noun is aphotic and the player is in the theater:
	unless meowing at or hissing at or examining:
		try entering the beam instead;
	otherwise:
		continue the action.
		
instead of hissing at something aphotic:
	say "The darkness was unnerving, and I didn't mind saying so. Repeatedly.".

section 6 (rules for rescue the grue)

when rescue the grue begins:
	show toc 8;
	say "[lb][tab][bt]ACT SIX[rt]
[lb][tab][it]The Empty Gruequarium[lb][lb]";
	move the player to egladder;
	say "Assuming that grues were no better with locked doors than humans or cats, I'd have to look for some other way out for Gruecilla. If I meowed at something, D could lead her to it with the Aughtlight.";
	now suppression flag is true;
	


book 6 (other general things)


			
chapter 1 - prologue


Volume 4 - the world of the game

Book 1 - player characters

Part 1 - Marbles

Marbles is a female cat.
The player is Marbles.
Marbles is in center stage.

the description of Marbles is "[if escape the theater is not happening]Black fur, white locket.
[lb]Agile, brave.
[lb]Likes: fish, carpet.
[lb]Dislikes: loud noises, adult humans.
[lb]Adventurer and friend.
[lb]It was I, Marbles.[otherwise]A cat in a hurry![end if]";


Part 2 - D

[I did some variations for printed names and understandings for D]

D is a male person.
D is in auditorium.
understand "d" as D.
understand "my/-- small/human/young/fellow/-- boy/adventurer/person/friend" as D.
the exit doors interest D.
the printed name of D is "[one of]my human boy, D[or]D, a small person[or]my young friend, D[or]D, my fellow adventurer[cycling]".
D is remote.

after examining d:
	now suppression flag is true;[preventing d from talking out of turn once again]
	continue the action;

the description of d is "[if the location of D is not the spotlight booth]D was a correctly-sized human whom I mentored and protected. Because he had no fur, his legs were protected by thick, blue cloth. His chest and shoulders were likewise protected by a striped, t-shaped garment. Such were the garish necessities of human existence.

D bore his burdens courageously, be they related to hairlessness or adults. His head was draped in brown fur, and near its top the hair arced away from his head. It was what humans called a 'cowlick', though I suspect that characterization was inaccurate.

He was, in short, a beloved friend and fellow adventurer, and, at that moment, he seemed very interested in [the fascination of D].[otherwise if discover the Aughtlight is happening]D was very curious about [the Aughtlight], that was certain. Perhaps I could help him discover its use and purpose? Satisfying curiosity is every cat's talent, after all.[otherwise if experimental Aughtlight is happening]D. seemed very interested in the Aughtlight. He was as curious and clever as any cat might be, perhaps more.[otherwise if rescue the grue is happening]D was doing an admirable job operating the Aughtlight. I was quite proud of him! I was a little bit worried, though, since we were so far apart."
	
[do not--I mean it!--name something when the  name is reserved by the parser (like D, E, G). don't say I didn't tell you! I went through so much with these, I'm fairly sure these aren't all needed anymore. But now that everything is testing ok, I'm not touching them.]

does the player mean going down when the current action is going:
	it is likely.
	
does the player mean doing something to down when the current action is not going:
	it is very unlikely.
	
does the player mean following D:
	it is very likely.
	
does the player mean directing transit to D:
	it is very likely.
	
does the player mean doing something with down:
	it is very unlikely.
		
does the player mean doing something with something in the location when the noun is not down:
	it is likely.
	
[---------]

carry out meowing at d when prologue is happening:
	say "'Marbles,' D sighed, 'We have to check out this door, OK?'".
	
carry out meowing at d when inspect the box is happening:
	say "Let's have a look at this box, Marbles. It's very suspicious, don't you think?"
	
carry out meowing at d when discuss the bag is happening:
	say "Hm? What's that? This box is really something! If you find something important, just give it a good [oc]MEOW[cc]."
	
carry out meowing at d when discover the Aughtlight is happening:
	say "That's right, Marbles. We are going to figure this out for sure!"
	
carry out meowing at d when experimental Aughtlight is happening or rescue the grue is happening:
	say "No way, Marbles! I'm not pointing this thing at myself!";
	
[---------]

instead of scratching d:
	say "No. Absolutely not. I once scratched D accidentally while climbing onto his lap, and the guilt was very hard to bear."
	
[---------]

instead of biting d:
	say "Once I was so desperate for food that I gave D a gentle little love bite on his ankle, but I quickly regretted it. Never again."
	
[---------]
	
instead of hissing at d:
	say "D was a sensitive boy. I had no intention of bullying him so!"
	
[---------]
	
carry out grooming D:
	say "I've tried to smooth out D's cowlick before, but it was no use. That thing was there to stay.". 
	
[---------]

carry out of marking D:
	say "I have marked D many times and am happy to do it again. He is my human, after all."

[---------]

before jumping to d when d is not in the location:
	say "(instead attempting to follow D)[command clarification break]";
	try following d instead.

instead of jumping to D when D is in the location:
	say "If we were home, I might have jumped in his lap, but we were too busy for that. Maybe I could give that a try after we found a way out of this theater."
	
[---------]

carry out pawing d:
	say "I tried to get D's attention, but he seemed preoccupied with [the fascination of d]. Perhaps we'd have a chance to catch up [one of]if[or]when[stopping] we reached the guild hall[one of][dot][or].[stopping][first time] Wait! I didn't mean to say 'if,' I meant [it]when we reach the guild hall. When![rt][only]".

carry out smelling d:
	say "D had the usual human scent, of course, he couldn't have helped that. But underneath that, the unpleasant smell of fruit. How could anyone eat fruit? He smelled like me, too, of course, I made sure of that. How else would other cats have known he belonged to me?"
	
carry out listening to d:
	say "Upright, D didn't sound like much. He sounded like whatever he was saying when he said things, and he sounded like his footsteps when he walked. However, when I listened from atop his lap or chest, he sounded like heart and breath. It was a very soothing sound for a cat."

Part 4 - the glasses

Chapter 1 - human-sized grue-sensitive glasses

[the glasses have no in-use game, they exist in code only because they must.]

a thing can be trash.

the hgsg are a plural-named thing.
the hgsg are a scenery backdrop.
the hgsg are nowhere.
the hgsg are trash.

the printed name of the hgsg is "human-sized grue-sensitive glasses".
understand "human-sized / human / sized / grue-sensitive / glasses" as the hgsg.

the description of the hgsg is "D and I both were wearing grue-sensitive glasses."


does the player mean doing something with the hgsg:
	it is very unlikely.
	
instead of doing something other than examining with the hgsg:
	say "Those were D's glasses, so I decided to leave them alone. Besides, they were far beyond my reach."
	  
Chapter 2 - cat-sized grue-sensitive glasses

[I initially made the glasses "worn" by marbles, but they kept jumping to the to of DTPM checks. Even with my own rules to tweak the numbers. Ugh! I turned them into a scenery backdrop that was "everywhere"]

the cgsg are a backdrop.
the csgs are scenery.
the csgs are plural-named.
the cgsg are nowhere.
the cgsg are trash.

the printed name of the cgsg is "cat-sized grue-sensitive glasses".
understand "cat-sized/-- cat/-- sized/-- grue-sensitive/-- grue/-- sensitive/-- glasses/eyeglasses" as the cgsg.

	
instead of taking off the cgsg:
	say "Even though the glasses were a little uncomfortable, I decided to keep them on, just in case a grue tried to sneak up on me or D.".
	
the description of the cgsg is "I couldn't see them, because they were on my face.".

instead of doing anything other than taking off, searching, or examining when the current action involves the cgsg:
	say "I decided to leave the glasses alone. If I knocked them off, I would have needed help to put them on again.".
	
instead of searching the cgsg:
	say "I was already looking through the glasses."

Book 2 - when play begins

[delay printing the banner for now]

The display banner rule is not listed in the startup rulebook.

[some values to be used while determining player options]

scr is a number that varies.
screenreader is a truth state that varies.
screenreader is usually false.
mob is a number that varies.
mobile is a truth state that varies.
mobile is usually false.

chosen interface is a number that varies.

[a routine for getting a code when the player presses a key. this allows us to get some input before reaching the command prompt. it's hard to ask questions like this once the game gets going.]

To decide what number is the key-pressed:
	let keypress be 0;
	while keypress is 0:
		let keypress be the chosen letter;
	now keypress is keypress minus 48;[returns a '1' if player pressed 1, '2' if they pressed 2, etc. If you want to collect/interpret alphabet keys as well, you'd comment out this line, but it makes life easier if all you want to do is collect numbers from 1-9]
	[say "[cc] Keypress number is [keypress].[line break]";][Uncomment this line to see what number the game is seeing when the player presses a particular key.]
	decide on the keypress;
	
[we'll use the numbers from the key-pressed to choose which display mode to use]

to ask the screenreader question:
	while 1 is 1:
		let KEYPRESS be the key-pressed;
		if KEYPRESS > 0 and KEYPRESS < 3:
			now scr is KEYPRESS;[store the answer, a 1 or 2, for later, in this variable.]
			make no decision;[ends this keypress loop]
			
[we'll use the numbers from the key-pressed to determine screen size]
			
to ask the mobile question:
	while 1 is 1:
		let KEYPRESS be the key-pressed;
		if KEYPRESS > 0 and KEYPRESS < 3:
			now mob is KEYPRESS;[store the answer, a 1 or 2, for later, in this variable.]
			make no decision;[ends this keypress loop]
			
[we'll use the numbers from the key-pressed to decide whether or not to use story mode]
	
To ask the gameplay question:
	while 1 is 1:
		let KEYPRESS be the key-pressed;
		if KEYPRESS > 0 and KEYPRESS < 3:
			now chosen interface is KEYPRESS;[store the answer, a 1 or 2, for later, in this variable.]
			make no decision;[ends this keypress loop]


[determines whether or not the game is running in bisquixe (web) or locally.]

To decide whether bisquixe is active:
	(-(glk_gestalt(5376, 0) )-)
	
[before doing anything else, let's set up some display options]

first when play begins:
	try hiding the status line;
	follow the font download rule;
	follow the initial buffer window rule;
	follow the play rule;
	follow the grid window rule;
	follow the initial input rule;
	follow the wide images rule;
	follow the more prompt rule;
	say paragraph break;
	say paragraph break;
	say splash;
	say "[it]What is your primary method of interacting with this story?[rt]
[lb][bt]1[dot] Visual[dot][rt] I am reading printed words on a screen[dot]

[bt]2[dot] Auditory[dot][rt] I am using screen reader technology.";

when play begins:
	ask the screenreader question;[once the question is asked, use the number provided to configure the game]
	if scr is one:
		now screenreader is false;
		say "Wherever this sign appears, paw at the keyboard to continue.";
	otherwise:
		now screenreader is true;
		say "OK! 'Noisy' characters will be reduced and images will be described.

Whenever the text 'Paw me!' is read, press any key to continue.";
	say line break;
	say line break;
	say cat prompt;

[still just setting up the game here]
	
[when play begins:
	if screenreader is false:
		say "[lb][it]What kind of screen are you looking at?[rt]
[lb][bt]1[dot] Full-sized[dot][rt] I am using a laptop or desktop computer[dot]

[bt]2[dot] Small[dot][rt] I am using a phone or some other kind of mobile device.";
		say line break;]

[when play begins:
	if screenreader is false:
		ask the mobile question;
		if mob is 2:
			now mobile is true;[if mobile is true, the screen will be reconfigured for smaller displays.]
			clear the central column;
			let N be the number of filled rows in the source of status information;
			set statusbar height to N;
			css-set-fast ".Input; font-size; 16px";
			css-set-fast ".BufferWindow .Input; font-size; 16px";
			css-set-fast "#gameport; left; 0%";
			css-set-fast "#gameport; right; 0%";
			css-set-fast "#gameport; top; 0%";
			css-set-fast "#gameport; bottom; 0%";
			css-set-fast "#gameport; width; 100vw";
			css-set-fast "#gameport; height; 100vh";
			css-set-fast ".BufferWindow; padding; 10px";		
			say "[it]Ah, that's better! This is a pretty cat-friendly size.[rt]";
		otherwise:
			say "[it]OK! That should be plenty of room.[rt]";
			now mobile is false;]

[a last question regarding story mode. for more info, you can consult the source code for that extension]
		
when play begins:		
	say "[lb][it]Marbles, D, and the Sinister Spotlight[rt] features two modes of play. Choose the one that matches the experience you want.

[bt]1[dot] Standard:[rt] A default parser game experience.

[bt]2[dot] Story:[rt] Experience the game as a readable story.
";
	say line break;

when play begins:
	ask the gameplay question;
	say line break;
	say line break;
	if chosen interface is 1:
		say "Welcome to [bt]standard mode[rt]! [it]Marbles, D, and the Sinister Spotlight[rt] will provide a traditional adventure game experience.";
	otherwise if chosen interface is 2:
		say "Welcome to [bt]story mode[rt]! In story mode, you can advance through the story by pressing the enter key. If you wish to pause the story and explore on your own, simply key in your own command. The story will resume whenever you press the enter key without typing a command first.";
	say line break;
	say cat prompt;
	clear the screen;

[ok. here are the referenced rules for using bisquixe for web styling. you can search the intfiction.org forum for more information about it. I have a thread there!

https://intfiction.org/t/web-styling-with-bisquixe-for-new-inform-authors-who-dont-know-css-or-web-stuff
]
	
this is the font download rule:
	import-google-fonts "Open+Sans&family=Roboto+Mono";
	
this is the initial buffer window rule:
	css-set-fast ".BufferLine; white-space; pre-wrap";
	css-set-fast ".BufferWindow; font-family; Open Sans, sans-serif";
	css-set-fast ".BufferWindow; background; [one of]#020213[or]#e8e8f7[cycling]";
	css-set-fast ".BufferWindow; color; [one of]#e8e8f7[or]#020213[cycling]";
	css-set-fast ".BufferWindow; font-size; 16px";
	css-set-fast ".BufferWindow; scrollbar-color; [one of]#e8e8f7 #020213[or]#020213 #e8e8f7[cycling]";
	say run paragraph on;
	
this is the grid window rule:
	css-set-fast ".GridWindow; font-family; Roboto Mono, monospace";
	css-set-fast ".GridWindow; background; [one of]#dedef7[or]#020212[cycling]";
	css-set-fast ".GridWindow; color; [one of]#020212[or]#dedef7[cycling]";
	css-set-fast ".GridWindow; font-size; 16px";
	say run paragraph on;
	
this is the initial input rule:
	css-set-fast ".Input; background; transparent";
	css-set-fast ".Input; font-size; 16px";
	css-set-fast ".BufferWindow .Input; font-weight; bold";
	css-set-fast ".BufferWindow .Input; font-size; 16px";	
	css-set-fast ".Input; font-family; Open Sans, sans-serif";
	css-set-fast ".BufferWindow .Input; font-family; Open Sans, sans-serif";
	css-set-fast ".Input; color; [one of]#e8e8f7[or]#020213[cycling]";
	css-set-fast ".Style_input; color; [one of]#e8e8f7[or]#020213[cycling]";
	
this is the tall images rule:
	css-set-fast ".BufferLine img.ImageInlineCenter; width; auto !important";
	css-set-fast ".BufferLine img.ImageInlineCenter; height; 75vh !important";
	
this is the wide images rule:
	css-set-fast ".BufferLine img.ImageInlineCenter; width; 100% !important";
	css-set-fast ".BufferLine img.ImageInlineCenter; height; auto !important";	
	
this is the play rule:
	css-set-fast ".interpretercredit; display; none";
	css-set-fast ".coverimage; display; none";
	css-set-fast ".play; background; #4E4E72";
	css-set-fast ".links; display; none";

	
this is the more prompt rule:
	css-set-fast ".moreprompt; color; #020213";
	css-set-fast ".moreprompt; font-weight; bold";
	css-set-fast ".moreprompt; opacity; .85";
	css-set-fast ".moreprompt; font; Open Sans, sans-serif";

when play begins (this is the initial destination rule):
	repeat with individual running through persons:
		now the destination of the individual is the location of the individual;
	now the destination of D is main entrance;
	now the story tense is past tense.
	
[ok, now the actual game-game is kicking off]

when play begins:
	say paragraph break;
	say paragraph break;
	say "[bt]Color Advisory:[rt][lb][tab][it]To cycle between color modes, enter the command *COLOR* at any time.

[bt]Reading Advisory:[rt][lb][tab][it]Marbles, D, and the Sinister Spotlight[rt] contains contains long passages of contiguous text.

[bt]Feline Advisory:[rt][lb][tab]The protagonist of this work has no thumbs.";
	say line break;
	say cat prompt;

[ story mode]
	
when play begins:
	if chosen interface is 1:
		now the freedom of the player is autonomous;
		now playmode is 1;
	otherwise if chosen interface is 2:
		now playmode is 2;
		now the freedom of the player is guided;

	
when play begins:
	say "'Gee whiz, Marbles! It feels like days since we left the Royal Museum this morning! We barely got away from Frambozz the Adequate, and then we had to cross the serpent-robins['] grove! Thank goodness we've reached this totally safe-looking, well-lit theater just a block away from the Thriff Guild of Enchanters. If we hurry, we can still get there in time for dinner with Guildmaster Fweep and his lemur familiar, Loretta.'";
	say "[pb]";
	say line break;
	say cat prompt;
	if mobile is false:
		now right alignment depth is 23;
	otherwise:
		now right alignment depth is 16;
	now the story viewpoint is first person singular;
	now the story tense is past tense;
	say paragraph break;
	say the banner text;
	say paragraph break;
	say "D pulled us through a small trapdoor at the top of a ladder and set his backpack (with me in it) on a flat, hard surface. I've been around humans my whole life, so take it from me: people love hard, flat surfaces.

'It's called a [it]stage[rt], Marbles! Remember how I used to see puppet shows at the library? It's like that, only bigger. Y'know, I wonder: did the library stop having puppet shows, or did mom just stop taking me? I guess it's the same either way.'";
	say line break;
	say cat prompt;
	try revealing the status line;[note we are finally printing the status line]
	say trapdoor;
	say line break;
	say "
[LB][tab][bt]Prologue[rt]
[lb][tab][it]A Locked Door in the Dark[rt]

";
	set pronouns from d;



Book 3 - regions and other global stuff


Book 4 - the setting region

Part 1 - General [local rules and backdrops]

the theater is a region.

[sometimes players want to mess with floors, walls, and ceilings. it makes sense, too, so it's good to make a modest effort]

chapter 1 (floors)

the floor is a scenery backdrop.
the floor is everywhere.

the floor is a scenery backdrop.
the floor is everywhere.
understand "carpet" and "fabric" as the floor.

the description of the floor is "[an adaptable floor description]".

to say an adaptable floor description:
	choose row with a room of the location from the table of floor lore;
	say lore entry;
	
[there's a point where we have to decide: 'how far do I want to take this implementation?' most people won't notice that each room has its own floor, for instance. but it's important to me, I want to work this all out.

I use a table for this sort of thing. We could use more traditional approaches, like "[if the location is center stage]some text[otherwise if the location is...] etc, but that gets hard to read!]

table of floor lore
room	lore
center stage	"The floor of the stage was hard, cold, and made of wood. It was a surface amenable to scratching."
auditorium	"The floor under the seats was looked a bit hard, but that aisle? Any self-respecting cat would give its carpet a good clawing over."
main entrance	"The floor of the entry area was covered in highly-scratchable carpet."
spotlight booth	"The spotlight booth was covered with cheap material unfit for scratching or napping."
egladder	"The floor was several feet below me, and I couldn't return to it until we had freed Gruecilla."
dinosaur head	"The floor was several feet below me, and I couldn't return to it until we had freed Gruecilla."
plank	"The floor was dangerously far away."
cplank	"The floor was dangerously far away."
aboveW	"The floor was far away, and I didn't need to look down to know that."
aboveC	"The floor was far away, and I didn't need to look down to know that."
aboveE	"The floor was far away, and I didn't need to look down to know that."

[once again, a question of how far do we want to go? my answer is "pretty far," but make no mistake, going into this level of detail/implementation can massively increase project scope]

carry out scratching the floor in center stage:
	say "I leaned forward, extended my forelegs, then pulled back and away from the floor. I did it! The stage was no match for me and my claws."
	
instead of scratching the floor in auditorium:
	if prologue has ended:
		say "(the aisle in particular, which looked quite appealing)[command clarification break]";
	try scratching the aisle.
	
carry out scratching the floor in main entrance:
	say "The carpet near the main entrance was delightfully scratchable, and scratch it I did.";
	
instead of doing something when the current action involves the floor and rescue the grue is happening:
	if meowing at:
		say "The floor was so large! I would have to meow at something smaller.";
	otherwise if examining:
		continue the action;
	otherwise:
		say "I couldn't get to the floor, even if that were my wish. However, I could meow at things there if I had a smart idea about something Gruecilla might do."
		
instead of smelling the floor:
	try smelling the location.
	
instead of grooming the floor when rescue the grue is not happening:
	say "Cats lead lives of tranquil dignity. Licking human floors was not a suggestion I would entertain.".
	
instead of jumping to the floor in the theater when the location is not the spotlight booth and the location is not the auditorium:
	say "A cat can leap or lie on any surface within reach, and most of us will, but the time and place for that was elsewhen and elsewhere."
	
instead of doing something when the current action involves the floor and the location is in the theater and the location is not the spotlight booth:
	unless examining, jumping to, or scratching:
		say "What can a cat say of floors? We are always near them. We are frequently on them, and yet they are seldom a cat's first choice.";
	otherwise:
		continue the action;
		
chapter 2 (walls)

scwall is a scenery backdrop.
the scwall is everywhere.
understand "wall" as scwall.

does the player mean doing something with the wall when the location is the spotlight booth:
	it is likely.

instead of doing anything with the scwall:
	if the location is spotlight booth:
		now the noun is the wall;
		try the current action;
	otherwise:
		say "There were walls there[em]humans do love their walls[em]and they kept D and I trapped within the theater.[if escape the theater is happening] Vast spaces and deadly drops were a kind of wall, too, don't you think? They could trap you, too."
		
chapter 3 (ceilings)

the ceiling is a scenery backdrop.
the ceiling is everywhere.

the description of the ceiling is "[an adaptable ceiling description]".

to say an adaptable ceiling description:
	choose row with a room of the location from the table of ceiling lore;
	say lore entry;
	
instead of doing anything other than examining when the current action involves the ceiling:
	say "The ceiling was too far away for even a meow to be effective. A cat's limits are few, but have them she must.".

table of ceiling lore
room	lore
center stage	"The ceiling was high above the stage and obscured by darkness."
auditorium	"The ceiling was far away, [if prologue is happening]and nearly invisible in the dim light[otherwise]but quite visible in the well-lit theater. Well, I say that, but it is widely understood that the ranged vision of cats is... less than competitive. This is not something to mention in polite company, mind you[end if]."
main entrance	"The ceiling was lower here than it was anywhere else in the theater.[if prologue is happening] Even in the theater's dim light, it was readily visible[otherwise] And yet[em]and I doubt that D would have disagreed[em]visibility had not rendered it interesting[end if]."
spotlight booth	"While the ceiling appeared to hang far lower here than it did in the rest of the theater, one need not resort to human 'mathematics' to know that this was an illusion sustained by the higher floor of the booth. One had to be vigilant or else be fooled by these so-called 'features.'"
egladder	"The ceiling over the stage was more visible from the ladder, but it was startlingly far away. I disliked looking up at it."
dinosaur head	"I had a feeling that I'd be getting closer to the ceiling soon, like it or not."
plank	"The ceiling was far closer than the floor."
cplank	"Like everything in this low light, the ceiling was hard to make out, but some sunlight was getting through it, somehow. I couldn't tell how."
aboveW	"Light trickled in from an unknown source. Hopefully, it didn't remain unknown for long!"
aboveC	"Light[em]just a bit[em]fell from an unknown source above."
aboveE	"With all sunlight behind me, the ceiling was as vast as darkness."


chapter 4 (body parts)

[hopefully it never comes to this, but there's always a tester that wants to engage with a specific part of the body]

the generic body part is a scenery backdrop.
the generic body part is everywhere.
the generic body part is plural-named.

understand "leg" and "arm" and "legs" and "arms" and "joint" and "joints" and "claws" and "fangs" and "hair" and "fur" as the generic body part.

the printed name of the generic body part is "limbs, legs, and whatnot"

instead of doing anything with the generic body part:
	say "I didn't have time to keep track of the individual parts of humans, creatures, or animals. Instead, let's just talk about the whole thing, OK? D is D and I am Marbles[if discuss the grue has happened]. Grues, naturally, are grues[end if]."

Part 2 (grues)


chapter 1 (early game backdrop grue)

[I made a fake backdrop in case anyone wants to talk about grues before the game mentions them]

the fgrue is a scenery backdrop.
the printed name of fgrue is "grue".
the fgrue is in the theater.

instead of doing anything when the current action involves the fgrue:
	say "[one of]Everybody knows that grues are everywhere. You can't see them, but they are always nearby, just out of sight. I'm sure that was true of the theater, too. There had to be a grue someplace close. Still, I couldn't see one (thank goodness!), so I couldn't really do something to or with one.

Don't get me wrong, I could handle a grue just fine, but I thought I should keep D away from them if I could. Humans aren't built for danger the way we cats are.[or]There were no grues in sight at the moment, fortunately.[stopping]".
understand "grue" as the fgrue.

chapter 2 (the grue pre-endgame)

[this is the first of two grues. if I had it to do over again, I might use Gruecilla throughout the game. She ("grue") appears after the glasses are first worn (end of "discuss the bag" scene) and is replaced by Gruecilla once the endgame ("rescue the grue") begins.]

the grue is a female animal.
the description of the grue is "[a variable description]".
understand "grue" and "Gruecilla" and "white / shape" as the grue.
the grue is remote.
the printed name of the grue is "[if discuss the grue has not ended]white shape[otherwise]Gruecilla".

[I rely on printed names a lot in descriptions, for instance [a grue] to use the printed name. Printed name (as immediately above) varies according to situation.]

rule for writing a paragraph about the grue:
	if discover the aughtlight is happening and gnumber is less than five:[gnumber exists only to guarantee that we see Gruecilla eat the treats during "discover the aughtlight"]
		now the grue is mentioned;
	otherwise:
		say "[one of][A grue] wriggled within the darkness of the Gruequarium.[or]The darkness whirling within [the box] contained [a grue]. I could barely believe it.[or]A white mass of limbs and fangs slavered within [the box].[or][The grue] was trapped within the nearby [box]. For how long, I wondered?[cycling]"
	
section 1 (grue actions)

[I tried to be thorough regarding grue interactions. I'm sure many players have wanted to have a [safe] grue experience]

carry out smelling when the noun is grue:
	say "Even though she lurked within the [box], I could tell that [the grue] had a distinctively gruesome odor: a mix of stale air, darkness, and wet animal. There was a strange stink below it all, too. It was a bit like something a human had held on to for too long.";


instead of scratching when the noun is grue:
	say "If you can get close to a grue yourself, let me know how the scratching goes."
	
instead of biting when the noun is grue:
	say "Putting a bit of grue in one's mouth and then biting down is really too much to ask. Have you ever smelled a grue?".
	
instead of hissing at when the noun is grue:
	say "Even though [the grue] was trapped in the Gruequarium, I did not wish to provoke [if discuss the bag has ended]her[otherwise]it[end if]."
	
instead of grooming when the noun is grue:
	say "What are the grooming standards of a grue, and how does one achieve them? As curious as I was, I was not yet curious enough to lick a grue.".

instead of marking when the noun is grue or the noun is gruecilla:
	say "I wasn't going to climb into [the box] with [the grue] for a bit of grooming. I didn't mind the danger. Of course I didn't! But [the box] was a giant pet carrier, wasn't it? I don't enter those willingly."
	
instead of jumping to the grue:
	say "(Presumably via jumping on the box first)[command clarification break]";
	try jumping to the box.
	
instead of pawing the grue:
	say "Yes, the paw symbolized diplomacy and friendship. But could [the grue] even see such things in the dark?"
	
carry out listening to the grue:
	say "The famed, slavering gurgle of all grues spilled out of the [Gruequarium]. You know, humans are prone to exaggeration, but it really is a distinctively disquieting sound! I wouldn't take a nap here, that's for sure.".
	
[there isn't a lot to see, code-wise, in most implementations of nouns, actions, and rooms. Support for cat behavior was painstaking and labor-intensive, but not technically challenging to program. What follows mostly consists of the usual text printing and state changing. there will be fewer comments as a result, but I'll jump in when I see something noteworthy.]

Part 2 - center stage

Chapter 1 - room description and general

[as a reminder, these 'variable descriptions' are handled above with definitions and tables]

Center Stage is a room in the theater.
understand "center/centre / stage" as center stage.
the printed name of center stage is "[if center stage is the location]Center Stage[otherwise]center stage[end if]".
center stage is a proper-named room.
the description of center stage is "[a variable description]".

Chapter 2 - things

section 1 - the clutter from the prologue

[this clutter is just a placeholder backdrop. it gets replaced once the lights are on.]

the prologue clutter is scenery in center stage.
understand "weirdness/piles/junk" as the prologue clutter.
the printed name of the prologue clutter is "clutter".
the prologue clutter is remote.

the description of the prologue clutter is "This stage was full of human weirdness. Who knows why adults make what they make, or why they make piles out of those things?".

instead of doing anything other than examining when the current action involves the prologue clutter:
	say "Even though I like a good clutter, D was bound to get into trouble here in the dark. I shouldn't leave him alone for long."
	
[a tester wanted to interact with the stage as a separate thing.]
	
the scstage is scenery in center stage.
understand "stage" as scstage.
the printed name of the scstage is "stage".

[this kind of thing is not necessary. people will not be enraged over unhelpful clarification messages. but they won't be helped, either, and it isn't always good to have the parser remind everyone of its existence]

rule for clarifying the parser's choice of scstage:
	do nothing.

before doing something to the scstage:
	now the noun is the floor;
	try the current action.
	
does the player mean doing something with the scstage:
	if the location is not center stage:
		it is very unlikely.

section 2 - the box

the box is scenery.
the box is in center stage.
understand "big/-- long/-- large/-- dark/-- fish/-- tank/box/Gruequarium/box/bweh/aquarium" as the box.
the description of the box is "[a variable description]".
the printed name of the box is "[if inspect the box has ended]Gruequarium[otherwise]box".
the box is an enterable container.
the box is remote.
to say pbox:
	say "[box]" in title case.
	

section 2 a (the darkness inside the Gruequarium)

the bdarkness is scenery in center stage.
understand "swirling/-- darkness inside/within/-- the/-- box/--" as the bdarkness.
the printed name of bdarkness is "swirling darkness within the box".

[this is an example of how things can spiral--a bunch of variations for what is basically a throwaway noun.]

the description of bdarkness is "[if prologue is happening]The darkness churning in [the box] had a strange and dangerous smell.[otherwise if discuss the grue has not happened]A spooky and mysterious darkness sloshed in [the box]. It reminded me of what happens when I play with my water dish.[otherwise if discuss the grue is happening]Unless I was mistaken[em]and when does that ever happen[em]the darkness concealed a grue-shaped creature.[otherwise]The darkness 'protected' Gruecilla, the star of The Circus of the Grues, from the light in the theater."


instead of doing anything other than examining or smelling or listening when the current action involves the bdarkness:
	say "The darkness seemed more like nothing than something, so I could do little to or with it. It wasn't the least bit unnerving, either! Just to be clear.".
	
instead of smelling bdarkness:
	try smelling the box.
	
instead of listening to bdarkness:
	try listening to the box.
	
Section 3 - the clutter

[the updated clutter has a more detailed description and does double duty listing other things in the room while looking.]

the real clutter is nowhere.
the real clutter is a prop in inspect the box.
the printed name of the real clutter is "clutter".
understand "pile/-- of/-- /junk/mess/clutter/messiness/island/" as the real clutter.
the description of the real clutter is "[a variable description]".

instead of doing something when the current action involves the real clutter:
	if directing transit to the real clutter:
		continue the action;
	otherwise if examining the real clutter:
		continue the action;
	otherwise:
		say "The clutter was spread across the stage, so I couldn't do something to all of it all at once. I'm just a cat!".
		
[it became difficult to manage all of the information about the items onstage. I decided to handle everything in one large "paragraph"]
	
rule for writing a paragraph about the real clutter:
	say "[one of]There were some rather curious items onstage: a big fake dinosaur, for instance, and [if a random chance of one in five succeeds]a Sears catalog car[otherwise][the car][end if]. And what of that imminently scratchable stepladder? An active and curious cat would have no trouble staying busy here![or]Curiosities filled the stage: the large dinosaur, the Sears catalog car, and the wooden stepladder all stood nearby.[stopping]"
	
after choosing notable locale objects:
	if the real clutter is in the location:
		set the locale priority of the real clutter to 4; [default is 5 I believe, so this will keep the paragraph at the top of the list. do we have to manage the list order? No! but I think it's better this way.]

Section 4 - the dinosaur

the mid-game dinosaur is nowhere.
the description of the mid-game dinosaur is "[if the dinosaur is in the location]The dinosaur was big compared to me or D, it wasn't big for a dinosaur.[first time] How did I know? D and I discussed dinosaurs all the time![only] It had long, fake teeth and a back like a staircase.[otherwise]From a distance, it was easy to see the whole dinosaur. It looked like something D would love to have had in his room.".

the printed name of the mid-game dinosaur is "dinosaur".
the mid-game dinosaur is a prop in inspect the box.
the mid-game dinosaur is scenery.

Section 5 - the car

the car is nowhere.
the description of the car is "[if the car is in the location][first time]A child-sized [car] was parked among the clutter. I had seen D look at such vehicles in the 'Sears catalog,' a strangely cruel book filled with pictures of happy children playing with precious objects.

[only][The car], a small, child-sized vehicle made of plastic and metal, was parked close to [the box].[otherwise]While [the car] was a strange thing to find in this theater, that was true of almost everything else onstage.".

understand "Gruemobile" as the car.
understand "miniature / sears / catalog / car" as the car.

the printed name of the car is "[if discuss the bag has ended]Gruemobile[otherwise]car".
the car is a prop in inspect the box.
the car is scenery.

[The eyes get mentioned, so they have to be accounted for :( ]

the ceyes are scenery.
the ceyes are plural-named.
the ceyes are a prop in inspect the box.
the printed name of the ceyes is "scary-looking eyes".
understand "large / scary / scary-looking / eyes" as the ceyes.

the description of the ceyes is "A spooky-looking pair of large eyes glared up from the hood of [the car]."

does the player mean doing something with the ceyes when the location is auditorium:
	it is very unlikely.


Section 6 - the stepladder

the stepladder is nowhere.
the description of the stepladder is "A sturdy-looking stepladder stood near the [if inspect the box has not ended]mysterious box[otherwise]Frobozzco Magic Gruequarium[end if].[if the location is center stage] It looked suitable for a great many cat-specific activities.[end if]".
understand "ladder" and "stepladder" as the stepladder.
the stepladder is a prop in inspect the box.
the stepladder is scenery.

instead of doing anything other than examining or directing transit to or climbing or performing cat behavior to the stepladder:
	say "The stepladder looked fit for some cat business, and not much else besides. But really, isn't cat business the best and truest sort of business?".
	
Section 7 - the plaque

the plaque is nowhere.
the description of the plaque is "A small metal plate attached to the large tank. I couldn't read people letters, but I knew that it said 'Frobozz Magic Gruequarium.'".

[when I do redirect from one thing to another, I like to print a command clarification message. This lets the player know that trying to interact with the ridirected thing is probably a waste of time.]

instead of doing anything other than examining to the plaque:
	say "(instead [action name part of the current action] [the box])[command clarification break]";
	now the noun is the box;
	try the current action.

section 8 (the trapdoor)

[yet another 'what is mentioned must be implemented' situation]

the trapdoor is scenery in center stage.
instead of doing something to the trapdoor:
	say "I mentioned the trapdoor because it would have been strange to omit it, but make no mistake! While it led into darkness and danger, we were making our way to laughter and light. Forget the trapdoor, just as I already had."


Chapter 3 - local actions

section 1 - smelling

[as you can see, most actions are cat behaviors that don't advance the story in any way. but that's ok! that's the uniqueness of this game as I see it. commitment to play as a cat.]

carry out smelling center stage:
	say "Center stage smelled of old human socks, wet dog, and, somehow, a kind of stillness."
	
carry out listening to center stage:
	say "All was quiet, save the occasional gurgle from [the box][if the Aughtlight is switched on]. The Aughtlight's crackle was also audible, even from a distance[end if]."
	
Section 2a - general dinosaur stuff


	
Section 2b - performing cat behavior and the dinosaur

[as the list of cat actions got longer, the demands of the system grew significantly. while the player only needs to do 15 things to max out their score, I wanted them to choose those things and enjoy them not matter what their choices were.]

carry out meowing at the dinosaur when experimental Aughtlight has not happened:
	say "[one of][if D is in the location]D looked up, then tilted his head to one side[dot][otherwise]D called out from [the location of d],[end if] 'The dinosaur, huh? I think they are pretty neat, honestly. Keep your eyes on it and let me know if anything happens with it.'[or]I gave the dinosaur a skeptical glance. What was it for, and why was it here? I decided not to talk to D about it again until I had some answers.[stopping]";
	
carry out smelling the mid-game dinosaur:
	say "I gave the dinosaur an experimental sniff. It didn't smell like much of anything besides the faint 'wet dog' smell of [the box].".
	
instead of biting the mid-game dinosaur:
	say "The dinosaur was too hard for me to pierce with my fangs and had, I felt certain, an unappealing taste."
	
instead of pawing the mid-game dinosaur:
	say "I gave the dinosaur an experimental nudge with my right paw. Even though I am quite strong for a cat, I couldn't budge it one inch.".
	
carry out hissing at the mid-game dinosaur:
	say "I'm sure that a dinosaur in the wild would have been upsetting to see, but I may have been overreacting to what seemed a very docile reptile."
	
carry out marking the mid-game dinosaur:
	say "I arched my back, then rubbed my face and side against one of its legs. Any other cats who happened by would know that the dinosaur was my property."
	
carry out scratching the mid-game dinosaur:
	say "Even though the dinosaur was too hard for biting, I managed to mark it with my keen and lethal claws. Anyone who saw these scratches would know that I, Marbles, had passed this way."
	
carry out listening to the mid-game dinosaur:
	say "The dinosaur's long, white teeth spoke silently on its behalf."
	
instead of grooming the mid-game dinosaur:
	say "The dinosaur had no fur and probably tasted like paint and plastic."
	
the mid-game mouth is part of the mid-game dinosaur.
understand "dinosaur's/dinosaur/-- mouth" and "white/-- teeth" and "white/-- fangs" as the mid-game mouth.
the description of the mid-game mouth is "An open mouth with long, white teeth. I admired the length of its fangs, though it would be hard for a cat to do much with them."
	
instead of doing anything other than examining to the mid-game mouth:
	say "(instead [action name part of the current action] the dinosaur)";
	now the noun is the mid-game dinosaur;
	try the current action;
	
the printed name of mid-game mouth is "dinosaur mouth"

Section 3a - general ladder actions


instead of entering the stepladder:
	try jumping to the stepladder.
	
instead of climbing the stepladder:
	try jumping to the stepladder.

Section 3b - performing cat behavior with the ladder

carry out meowing at the stepladder when experimental Aughtlight is not happening:
	if D is in center stage:
		say "[one of]D looked up. 'What's that Marbles? It looks like some kind of stepladder. I wonder what it's for. If you climbed to the top, I guess you'd have a pretty good view of the stage.' He paused, rubbing his chin. 'Then again, I guess we can see it fine from down here.'[or]D took another look at the stepladder. I see it, Marbles. I bet I know what you're thinking: 'It has to be good for something!' I agree with you. I wonder what it's for?[or]D looked at the stepladder yet again, as if hoping that an idea would come to him.[stopping]";
	otherwise:
		say "'D waved approvingly from [the location of D].".
		
carry out scratching the stepladder:
	say "[one of]Ah, how delightful! The stepladder was made of soft wood, and in short order a very appealing lattice of scratches had been carved into its side. I stepped back to admire my craftsmanship. Impeccable, truly impeccable.[or]The ladder remained an enjoyable scratching surface, so I had another go. Very nice, as good as anything back home.[stopping]".
	
instead of biting the stepladder:
	say "Rather than blunt my fangs on the ladder, I decided to roll over, raising my front paws in the air. I am adorable, am I not? An utter delight.".
	
carry out hissing at the stepladder:
	say "I decided to let the stepladder know who's boss. You can't anything get too full of itself, ladder or otherwise."
	
carry out listening to the stepladder:
	say "The ladder was as silent as a skilled cat on the hunt."
	
carry out marking the stepladder:
	say "The ladder was truly excellent and a model for its kind, so it only made sense to give it a good marking. I rubbed the stepladder with my face and side, then rubbed it again just for clarity's sake."
	
carry out jumping to the stepladder:
	say "[one of]The stepladder was, in fact, an opportunity for avid climbers, and the steps were appropriately spaced and angled for agile felines. The top was probably the right size for a bit of napping, too. I hopped up, then lay on the flat, broad top. Not bad! In different circumstances, I would have taken a moment to recharge.

But the adventurer's life is not a restful one.[or]I had already tested the merits of the ladder, and I found it impressive. There was no nap in my near future, unfortunately.[stopping]".

carry out pawing the stepladder:
	say "I leaned back before giving the top of the ladder an experimental paw. My assessment: tall, stable, imminently scratchable."
	
instead of grooming the stepladder:
	say "Such was my affection for the stepladder that I considered grooming it, but the chance of getting a splinter was too great."
	
carry out smelling the stepladder:
	say "The ladder smelled like human shoes."
	
		
Section 4a - general behavior with the car

instead of entering the car when discuss the grue has not happened:
	say "Under normal circumstances, I think the little car would be a nice place for a nap, but the strange smell of it (and everything else onstage) made me suspicious. I wouldn't enter the car without a really good reason for doing so."

instead of entering the car when discuss the grue has happened:
	say "The car belonged to a grue. Even though I am brave[em]among the even bravest[em]it seemed foolish to poke around in there."

instead of climbing car when discuss the grue has not happened:
	try jumping to the car.
	
instead of jumping to the car when discuss the grue has not happened:
	say "I was certain that I could get on top of the car, but there was something off-putting about it. I didn't want to get in or on it without a good reason.".
	
instead of climbing the car when discuss the grue has happened:
	try jumping to the car.
	
instead of jumping to the car when discuss the grue has happened:
	say "I was certain that I could get on top of the car, but it seemed unwise to climb atop a grue's vehicle.".
	
instead of pawing the car:
	say "The car was too large to handle in that way. Hopefully my intimidating presence would be enough to keep it in check."
	
instead of listening to the car:
	say "Did the car make a sound? It was hard to tell, thanks to the constant gurgling emerging from [the box].".
	
Section 4b - performing cat behavior with the car


carry out meowing at the car when discuss the grue is not happening and experimental aughtlight is not happening:
	say "[if D is in center stage]D looked at the car.[otherwise]D looked in the direction of center stage.[end if][one of] 'Wow, would you look at that? I always wanted one of those little cars. I guess I'm a little too old for it now.' D sounded a little disappointed.[or] 'This isn't much of a place for a kid, is it?' D is a kid, of course, but I knew what he meant. The place where we live isn't much of a place for kids, either.[or] It was hard to say exactly what his expression meant. It looked a little like he was having a nice memory. Since he never had a car like that, I guess he was remembering something that never happened.[or]I had probably said all there was to say about the car. At least until I had something new to tell D.[stopping]";

		
carry out meowing at the car when discuss the grue is happening:
	say "D was pretty busy with the flyer. Maybe I should try talking to him about the grue instead."
	
		
instead of scratching the car:
	say "The car was made out of what humans call 'plastic.' While my claws can mark plastic, the feel of it is off. I prefer scratching wood, cardboard, or a bit of carpet.".
	
instead of biting the car:
	say "My mouth was too small to bite the car. That was all to the good, since I don't like the taste of cars, no matter the size. What barbaric creature does?"
	
carry out hissing at the car:
	say "[first time]The car bothered me. It had a creepy smell and was made of plastic. Worst of all, it seemed to make D sad. [only][if d is in center stage][one of]D looked up, startled, 'Gee whiz, Marbles! What's gotten into you?'[or]I decided not to disturb D with a second hiss. He knew how I felt.[stopping][otherwise][one of]I arched my back and gave the car a good hissing.[or]I decided not to hiss at the car again. I had already said what I needed to say.[stopping][end if]".
	
carry out marking the car:
	say "I rubbed my face and back against the car, but did it work? The car had its own powerful smell already.".
	
Carry out smelling the car:
	say "The car smelled like plastic, chemicals, and wet animal. Perhaps some really big, stinky dog had been sleeping inside.".
	
instead of grooming the car:
	say "Mmm... no, I didn't think I would. The smell was too off-putting."
	
	
Section 5 - climbing

instead of climbing the mid-game dinosaur:
	try jumping to the mid-game dinosaur.

instead of jumping to the mid-game dinosaur:
	say "I thought that I could reach the top of the dinosaur easily, but it didn't look very comfortable up there." instead.
	
instead of entering the mid-game dinosaur:
	try climbing the mid-game dinosaur instead.
	

section 6 (going)

[helpful "can't go that way" messages are essential to a polished game IMO]

instead of going nowhere in center stage:
	say "The auditorium was just to the [oc]SOUTH[cc]. There were no other exits.

[bk][it]for general information about getting around, type [oc]NAVIGATION[cc][cb][lb]".
	
section 7 (the box)

section 1 (cat actions)

section 1a (meowing)

carry out meowing at the box when the bag is undiscussed:
	say "'I know, right? That box sure is mysterious!' I was sure we'd get to the bottom of things soon; that's just the way we adventurers did things."
	
carry out meowing at grue when discover the Aughtlight is happening:
	say "'I know, Marbles! This is an incredible discovery! I think we should try to help Gruecilla.'".
	
instead of meowing at the box when discover the Aughtlight is happening:
	try meowing at grue.
	
section 1b (scratching the Gruequarium)

instead of scratching the box:
	say "[if discuss the grue has not happened]Even as a confident scratcher, I was not sure about scratching [the box]. There was something questionable about it and its smell.[otherwise]I was not afraid[em]of course not![em]but it nevertheless seemed unwise to scratch an occupied Gruequarium.".
	
section 1c (hissing at)

instead of hissing at the box:
	say "[if discuss the grue has not happened]Hissing at the box and its mysterious contents felt like a rebuke of fate. Yes, we cats rebuke fate regularly, but not all rebukes are the same.[otherwise]Hissing at the Gruequarium seemed a poor idea, as I wouldn't want its inhabitant to misunderstand me."

carry out jumping to the box:
	say "Even though I was quite curious, I didn't want to risk falling in. That was no ordinary darkness swirling around in that box.[if the bag is discussed] The grue within the Gruequarium seemed discouraging, too.[end if]".
	
section 1d (marking)

instead of marking the box when discuss the grue has not happened:
	say "The pungent smell of the box and its contents would resist even the most distinctive scent of the most distinguished cat."
	
instead of marking the box when discuss the grue has happened:
	say "Just in case Gruecilla was attached to and comforted by her own scent[em]and who isn't[em]I decided to keep my delightful bouquet to myself."
	
instead of climbing the box:
	try jumping to the box.
	
section 1e (jumping to)

instead of jumping to the box:
	try failing to enter the box.
	
section 1f (pawing)
	
carry out pawing the box:
	say "Thumping the glass felt like a bad idea, so I rolled around on the floor instead.".
	
section 1g (smelling)

carry out smelling the box when discuss the grue has not happened:
	say "I was hesitant to get close to the box, but from where I stood it smelled like still air and darkness. Underneath that was something almost familiar: a damp, animal smell.".
	
carry out smelling the box when discuss the grue has happened:
	say "Apparently, grues smelled like a combination of still air, wet dog, and darkness."
	
section 1h (listening)

carry out listening to the box:
	say "A distinctive gurgling emerged from the darkness inside [the box].".
	
section 1i (biting)

instead of biting the box:
	say "There was no way to get my mouth around it. If [the Gruequarium] tasted the way it smelled, then all was for the best. Only dogs bite things like that!".
	
section 1f (grooming)

instead of grooming the box:
	say "Improving the appearance of [the Gruequarium] seemed beyond reach.".

section 2 (mundane box actions)

[I decided to make the box an enterable container and prevent entering, just to keep errors about unenterable things from popping.]

instead of jumping to the grue:
	try entering the box instead.

instead of entering the box:
	try failing to enter the box.
	
[I made this its own action and redirected many other actions to it. I could have also made a definition, TO FAIL TO ENTER THE BOX: etc]

failing to enter the box is an action applying to nothing.

carry out failing to enter the box when prologue is happening:
	say "The was suspicious of the box, and wouldn't go near it until we had turned on the lights."
	
carry out failing to enter the box when inspect the box is happening or discuss the bag is happening:
	say "That box was weird and full of swirly dark gunk. I wasn't getting in there!".
	
carry out failing to enter the box when discuss the grue was happening:
	say "I wouldn't climb in there with a grue, not even a famous one like Gruecilla!".
	
carry out failing to enter the box when discuss the grue has ended:
	say "I didn't want to push my luck with Gruecilla. Besides, I thought it would be better to get her [it]out[rt] of there instead of getting me [it]in[rt] there.".
	
instead of searching the box:
	try examining the bdarkness.
	
nopening is an action applying to one thing.

instead of opening the box:
	try nopening the noun.
	
instead of closing the box:
	try nopening the noun.

carry out nopening the box:
	say "[The box] had no lid, so it [if discuss the bag has ended]technically [end if]remained open all the time[if discuss the bag has ended]. 'Technically', that is, because even without a lid, the dark kept things out and the light kept things in. It was a very clever alternative to traditional human lids which, let's face it, lack imagination[end if]."


instead of doing something to the box when prologue is happening:
	unless examining or meowing at:
		say "I needed to stay close to D. It was too dark for him to be alone!";
	otherwise:
		continue the action.


Part 3 - Auditorium

Chapter 1 - room description and general

Auditorium is south of Center Stage.
[Auditorium is down from Center Stage.]
Auditorium is in the theater.
Auditorium is improper-named.
the indefinite article of auditorium is "the".
the description of Auditorium is "[a variable description]".
the printed name of auditorium is "[if the location is auditorium]Auditorium[otherwise]auditorium[end if]".

Chapter 2 - things

Section 1 - the seats

the chairs are in Auditorium.
the chairs are scenery.
the chairs are remote.
understand "auditorium / seats" as chairs.
understand "auditorium / seat" as chairs.
understand "auditorium / chair" as chairs.
understand "auditorium / chairs" as chairs.
the chairs are a plural-named thing.
the printed name of the chairs is "auditorium seats".
pchairs is a text that varies.
to say pchairs:
	say "[chairs]" in title case.
	
does the player mean doing something to the auditorium when the location is the auditorium:
	it is very unlikely.

[These kind of high-effort, varying descriptions are everywhere. My table scheme didn't really work for a variety of conditions. I could have treed it out with a TO SAY definition. Maybe I should have. It gets hard to manage this kind of output regardless.]

the description of the chairs is "[if prologue is happening]The chairs were a place of mystery. I needed to try and keep up with D for now, but I was sure they would be the subject of a rigorous investigation.[otherwise if the bag is undiscovered]There were an incredible number of seats there, probably twenty at least! I had a hard time imagining so many people in one place all at once. There was something else to them, though. Perhaps a more thorough investigation is in order.[otherwise]Now that I had discovered the secret underneath the chairs, the seats were good for little more than napping. Unfortunately, it would be a while before I could get my next nap."

Section 2 - the bag

[the bag starts out nowhere, but we'll talk about it in the auditorium section since that's where it winds up]

the bag is nowhere.
the bag is a container.
the bag is local.
the bag is takeable.
the description of the bag is "[the bag's information]".

the beyes are scenery.
the beyes are nowhere.
the printed name of the beyes is "scary bag eyes".
understand  "spooky / yellow/ scary / eyes" as the beyes.
understand "scary eyes" as the beyes.
understand "bag eyes" as the beyes.
understand "scary bag eyes" as the beyes.
the description of the beyes is "Yellow eyes scowled up from the surface of the plastic bag. They might have scared some other cats, but I'm braver than that!

They looked the same as the eyes painted on [the car]."

does the player mean doing something with the beyes when the location is auditorium:
	it is very likely.

instead of doing something other than examining with the beyes:
	if taking:
		say "(instead taking the bag)[command clarification break]";
		try taking the bag;
	otherwise:
		now the noun is the bag;
		say "(instead [action name part of the current action] the bag)[command clarification break]";
		continue the action.

[the complexity for the bag kept spiraling, so I eventually set it out as a separate "to say" definition.]

to say the bag's information:
	if the bag is in the location:
		say "[if the bag is undiscussed][first time]I had solved the mystery of the seats, but a new mystery had taken its place: what might be in the bag? This small, flimsy container had been shaped from what humans call 'plastic[dot]'[only][one of]It[or]The bag[stopping] was decorated with a drawing of large, yellow eyes over a dark background. I could tell that there was something inside, but I wasn't sure what it was. It was a tantalizing mystery[ex][otherwise][one of]That small plastic bag featured a depiction of a grue's 'eyes'[em]do grues even have eyes[q][em]on a black background. It was empty[dot][or]The reddish eyes decorating the empty bag[em]a logo advertising a 'grue circus'[em]seemed to stare back at me.[stopping][end if][if we have not bitten the bag]

I didn't care for the way those yellow eyes stared up at me. They were asking for a good [oc]BITE[cc][dot][end if]";
	otherwise:
		say "Even from a distance, the sinister nature of the bag was unmistakable! It was utterly sinister[ex]"

[note that "aphotic" is an adjective for something covered by the aughtlight.]

rule for writing a paragraph about the bag when the bag is not aphotic:
	say "[if the bag is undiscussed]A mysterious bag lay in the aisle, just where I left it. Two rather dangerous-looking yellow eyes glared up from it.[otherwise]A bag, which had something to do with [bt]The Circus of the Grues[rt], lay empty in the aisle.";
	now the bag is mentioned.
	
[given Marbles's unique abilities, it was important to head off a lot of standard actions.]

instead of doing something other than closing, searching, taking, examining, directing transit to, or performing cat behavior when the current action involves the bag and discuss the bag is happening:
	say "Even though I could tell there were some things in the bag, I had a hard time getting a paw in there. It was just thin enough to [oc]BITE[cc], for all that mattered. I thought that maybe D could help out, since he had human fingers and thumbs."
	
[this is just a junk placeholder]
		
the tantalizing mystery is inside the bag.

the description of the tantalizing mystery is "I was both curious and frustrated with regard to the contents of the bag. I couldn't get at them, but they had the same creaturely critter smell as the area under the seats. Learning more would require human hands."

instead of doing something other than examining when the current action involves the tantalizing mystery:
	try examining the noun.
	
the examine containers rule does nothing when the current action is examining the bag.
	
instead of closing the bag when the bag is undiscussed:
	say "I may not have had any luck opening the bag, but it was hardly a thing that wanted closing.".
	
instead of doing something other than performing cat behavior or examining when the current action involves the bag and discuss the bag has ended:
	say "The bag enjoyed some moments basking in our interest before silently reclining in the aisle. It was through with us, and we with it."
	
the standard search containers rule does nothing when the current action is searching the bag.

carry out searching the bag when the bag is undiscussed:
	say "The contents of the bag were a tantalizing mystery."
	
being satisfied with the bag is an action applying to nothing.

[I'm not sure what led me to this. The various bits of discovering, discussing, and whatnot could get creaky; I probably just wanted to separate things out. But... I'm still not sure what led me to this.]

instead of taking the bag:
	try being satisfied with the bag.

carry out being satisfied with the bag:
	say "[if discuss the bag is happening]I thought the bag was fine where it was. What I really needed was help finding out what was inside! The mystery was making me a little crazy.[otherwise]The bag had served its purpose, and quite admirably at that. There was no need to take it anywhere.

Let us praise it for a job well done!".

the flyer is nowhere.

section 3 - the aisle

[the aisle was just one of those things where I mentioned it in a room description and subsequently felt obligated to implement it. It became a beloved scratching object along the way.]

the aisle is in the auditorium.
the aisle is scenery.
aisle is remote.
understand "aisleway/walkway/aisleway" as the aisle.

instead of doing anything other than scratching or meowing at or jumping to or examining or marking or smelling or directing transit to when the current action involves the aisle and prologue has ended:
	say "The aisle was just an open area between chairs. There were only a few things I could do with it. I could [oc]LIE ON THE AISLE[cc], for instance, or [oc]SCRATCH[cc] it.".
	
instead of doing anything when the current action involves the aisle and prologue is happening:
	say "It was a little dark in the theater[em]not for me, mind you, but for D[em]so I decided to try and help him out instead. I could always have a look at the aisle later.".
	
the description of the aisle is "[if discuss the bag has not happened]That was one hundred per cent, without a doubt, a human aisle. It was covered with a rather appealing surface: a low, densely-looped carpet.[otherwise if the bag is undiscovered and discuss the bag is happening]The aisle divided the auditorium in two. So far as what the two sides meant, well, that was a strictly human concern.[otherwise if the bag is discovered and discuss the bag is happening]The most interesting thing about the aisle was the bag lying on it.[end if] Now that the mystery of bag and seat was resolved, the most interesting feature of the aisle was the carpet covering it. As any sophisticated cat would recognize, it [the scratching history] an ideal scratching surface."

instead of jumping to the floor in the auditorium:
	say "(instead lying down in the aisleway)[command clarification break]";
	try jumping to the aisle instead.


to say the scratching history:
	if the aisle is scratched:
		say "was";
	otherwise:
		say "was almost certainly";

Chapter 3 - actions

section 1 - general seat stuff

	
instead of doing something to the chairs while the prologue is happening: 
	say "The chairs could wait. Until we were either outside or else in a bit of light, I needed to keep an eye on D.".
	
instead of doing anything when the current action involves the chairs during inspect the box:
	if the current action is examining, looking under, searching, entering, directing transit to, or performing cat behavior:
		continue the action;
	otherwise:
		say "The chairs might have been good for a bit of cat-specific fun, but they were otherwise made for humans.".
		
the standard looking under rule does nothing when looking under the chairs.

		
section 2 (cat behavior in the auditorium)

section 2a (meowing at)

[a simply shocking amount of cat code follows]

[
====CHAIRS====
		]

carry out meowing at the chairs when discuss the grue has not happened:
	if d is in the location:
		say "[one of]'Those chairs remind me of the auditorium at school. What a dump, Marbles. I'm glad you don't have to go there!' Poor D, he was always going places he didn't want to go. What is a school, anyway? They don't even teach him how to hunt.[or]D probably didn't want to hear about the chairs anymore, since they reminded him of school.[stopping]";
	otherwise:
		say "[if the bag is in the aisle]I took a look at the chairs. They turned out to be pretty interesting! I was good at figuring out that kind of thing. We cats know how to find something under something, you can be sure about that! But maybe it was time to tell D about the [it]bag[rt].[otherwise][one of]D looked over at the chairs, waving. 'Hiya Marbles! How's everything going with those chairs? Let me know if you find anything out.[or]If I found out something important about the chairs, I'd let D know right away.[stopping]";
		
carry out meowing at the chairs when discuss the grue has happened and experimental Aughtlight has not happened:
	if d is in the location:
		say "[one of]D looked up. 'You really did a great job with those chairs, Marbles!' I took a moment to preen my face with a fore-paw. 'We are going to solve this mystery for sure!'[or]I think the conversation regarding the chairs had run its course. I was glad that D had noticed my heroism, naturally, but it would be unseemly to keep mentioning the chairs.[stopping]";
	otherwise:
		say "D looked up at the chairs, then gave me a 'thumbs up' sign. Since humans do not have tails, the thumbs up is a sadly impoverished version of the universally recognized 'tails up' greeting.".
		
carry out meowing at the chairs during prologue:
	say "I considered starting a conversation with D about the chairs, but it was probably too dark for him to see them clearly."

carry out meowing at the chairs during inspect the box:
	say "I wondered what D might think of the seats, so I decided to get his attention. 'Hang on, Marbles! We can take a look together after we investigate this weird box.'".
	
carry out meowing at the chairs during inspect the box:
	say "I wondered what D might think about the chairs. 'What[']s that, Marbles? The chairs? They could definitely fit a lot of people in here!'".
	
carry out meowing at the chairs during discuss the grue:
	say "I wondered what D thought of the chairs, now that the bag had been discovered. [if the chairs are in the location]D looked up. 'Hmm? Yeah, I guess the members of the audience got these bags when they bought a ticket.'[otherwise] 'What's that, Marbles? Give me a second to finish looking at this flyer.'".

carry out meowing at the chairs during discover the Aughtlight:
	say "[one of]Given everything we had seen so far, I wondered if D had any new thoughts about the chairs. D, off to the [oc]NORTH[cc], looked up from [the box]. 'That's right, Marbles! You did a great job snooping around those chairs.'[or]What else could be said? The chairs were one more testament to my excellence.[stopping]".

instead of grooming the chairs:
	say "You can't seriously believe I'd perform such an undignified act. Humans sit there! With their sitting area!".
	
[
====BAG====
		]
	
carry out meowing at the bag while discuss the bag is happening:
	now D is in auditorium;
	now the destination of D is auditorium;
	say "'Hang on, Marbles!' D called out, bounding down the stairs. 'What is it? Did you find something?' He knelt down beside me, and I pawed at the plastic bag. 'Well, I'll be!' D said, picking up the bag. 'Those eyes sure are spooky!'

D reached into the bag and pulled out a folded piece of paper with pictures and letters on it. 'It's a flyer of some kind:

'[bt]Witness the unbelievable, the inconceivable, the thrill of danger and the bedazzlement of spectacle!

'Become one of a select few who have seen a grue and lived to tell the tale! Only at Quendor's first and only... CIRCUS OF THE GRUES[rt][ex]

'...There's also... ew! Marbles, this packet,' he held a plastic packet by one corner, 'is squishy and... warm? The label says [']Grue Treats[']. Ick! I don't even want to guess what a grue treat is.'

He reached into the bag once more. 'Oh, wow. There are also some glasses... hey, there's a cat-sized pair as well! It says here that they are [']grue-sensitive eyeglasses.['] Hm, how do you think they work?' He tried on the human-sized pair, then put the cat-sized glasses on for me.";
	say line break;
	say cat prompt;
	now the current scene is discuss the grue;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	
carry out meowing at the bag when discuss the bag has ended and experimental Aughtlight has not happened:
	say "[if the location of d is the location of the bag][one of]'That was pretty neat, Marbles! I guess that's because of your excellent sense of smell.[or]I already knew that D was impressed; I did not wish to seem needy.[first time] But what is with that word, 'needy?' I only expect the adulation that is rightfully mine[only].[stopping]".
	
instead of grooming the bag:
	say "The bag, with it's dangerous-looking yellow eyes and sinister animal scent, would have to remain ungroomed."
	

[
====AISLE====
	]

instead of meowing at the aisle:
	say "I decided to keep my thoughts about the aisle to myself, instead taking a moment for a bit of grooming.";
	try grooming marbles;
	
instead of grooming the aisle:
	try grooming the floor.

		
section 2b (scratching)

carry out scratching the chairs:
	say "When it came to scratchability, the chairs were... intermediary, middling, merely fine. They were a little too soft for me to exercise my scratching powers fully. On a lazier day, I might have [oc]JUMPed ON THE CHAIRS[cc] for a bit of napping.".
	
carry out scratching the aisle in auditorium:
	say "That was a fine carpet, very fine indeed. A connoisseur's choice. I gave it a good, thorough scratching, then rubbed my face against it. Splendid!"
		
instead of scratching the bag:
	say "There was no satisfaction to be found in scratching the bag. It was the wrong size, shape, and weight for that[if discuss the bag is happening], but perhaps D might be able to do something with it[end if].".
	
section 2c (biting)

instead of biting the chairs:
	say "Listen, I'm not above an experimental bite now and then, but you know very well that humans simply aren't as diligent as cats when it comes to grooming. I would have needed a very good reason to bite something that humans sit on, and I didn't yet have one.".
	
[this is only one of two cases where the biting action succeeds. the other is the stepladder during the endgame. that's kind of a fallback / sympathy implementation]
	
carry out biting the bag:
	say "I admit it; I sometimes enjoy the mouth feel of fangs through thin plastic. Is that so wrong?";


section 2d (hissing)

carry out hissing at the chairs:
	say "[if D is in the location]D looked up at me, surprised. 'Wow, Marbles! What's gotten into you? These look like perfectly normal chairs to me!'[otherwise]I expressed my annoyance with the chairs, but really, I was just hungry and a little tired. The chairs hadn't done anything wrong.[end if]".
	
carry out hissing at the bag:
	say "Those big, yellow eyes were so spooky! What was a bag doing with eyes like that? That bag had better not mess with D and me."


section 2e (marking)

carry out marking the chairs:
	say "I rubbed my face against one of the chairs, even though it was easy to lose a cat's scent among that crowd of seats.".
	
carry out marking the aisle:
	say "I flopped on my side, rubbing my body and face against the aisle. Look out, world! That was Marbles country now.".
	
instead of marking the bag:
	say "Because I found it, the bag was mine. I didn't want to claim it, though, if that makes sense.".

section 2f (jumping to)

instead of entering the chairs:
	try jumping to the chairs.
	
carry out jumping to the chairs:
	say "[first time]The chairs looked soft, so I hopped into one. Very nice! However, [only]I didn't have time to sleep on a chair. I was the responsible, fully-grown cat on this adventure, after all.".
	
instead of entering the aisle:
	try jumping to the noun.
	
carry out jumping to the aisle:
	say "The carpet was nice in terms of its surface, but I didn't like being out in the open! As such, I didn't think of it as a destination."
	
instead of jumping to the bag:
	say "I was not going to pounce on the bag or otherwise stand on it.[if the bag is undiscussed] In fact, the bag was an entirely human affair."

section 2g (pawing)

instead of pawing the chairs:
	say "The chairs weren't very good for pawing because they were just too big for a cat[em]not even a strong cat like me[em]to push around.".
	
instead of pawing the bag:
	say "The bag wasn't very good for batting around. At least, it wasn't good so far as pawing for pawing's sake goes.".

section 2h (smelling)

an object can be sniffed or unsniffed.
an object is usually unsniffed.

[despite this grand gesture, the "sniffed" property is never used in-game!]

after smelling an object:
	if the location is not the auditorium:
		now the noun is sniffed;
	otherwise if the location is the auditorium and the current scene is discuss the bag:
		if the noun is the chairs:
			now the noun is sniffed;
			now the auditorium is sniffed;
		otherwise if the noun is the auditorium:
			now the noun is sniffed;
	continue the action.

carry out smelling the auditorium:
	say "The auditorium was filled with human smells. There were so many different scents: food, clothes, sweat, and more besides. It was enough to make any cat curious[if discuss the bag is happening and the bag is undiscovered], but I didn't immediately sense anything that would be of use... no, wait! There was something among the chairs, something worth a second sniff[otherwise if discuss the bag has not happened], but I didn't want to keep D waiting[otherwise if the bag is discovered], but I thought that I had already sniffed out every secret of the auditorium[end if]."

carry out smelling the chairs when discuss the bag has not happened:
	say "Among the human smells of sweat, cloth, and strange, inedible food, I smelled a hint of something beastly. As curious as it was, I was even more curious about [the fascination of d]. D was obviously quite interested in it."
	
carry out smelling the chairs when discuss the bag is happening and the bag is undiscovered:
	say "I followed the strange, animal smell into the mazy human thicket of the theater's seating. Despite many baffling turns, a cat's nose is never fooled! Soon, I found my prey: a plastic bag with two spooky, yellow (yes, we cats see yellow just fine!) eyes printed on one side. Some human letters were etched below them.

Holding the bag with my teeth, I dragged it out into the aisleway.";
	now the bag is in the auditorium;
	now beyes are in the auditorium;
	now the bag is discovered;
	now bag is remote.

carry out smelling the chairs when the bag is discovered:
	say "The mystery of the chairs had been solved! 'Not bad,' I thought, licking my paw.".
	
carry out smelling the aisle:
	say "Scents of human shoes and bits of dropped popcorn. This place had seen a lot of primates pass by, just walking and snacking!".
	
carry out smelling the bag:
	say "[if discuss the bag has ended]Even though the bag had been emptied, a[otherwise]A[end if] pungent creature smell overwhelmed my little nose."

section 2i (listening)
	
carry out listening to the auditorium:
	if the fascination of d is exit doors:
		say "D was making a lot of racket, as primates often do. Maybe things would quiet down soon.";
	otherwise if the Aughtlight is switched off:
		say "The area was quiet, though a faint gurgling could be heard nearby.";
	otherwise:
		say "The Aughtlight occasionally buzzed and popped. I hoped that D would be safe around it.";
		
carry out listening to the chairs:
	say "The chairs were silent, as if to lure humans into sitting in them.";
	
carry out listening to the bag:
	say "The bag stared up from the floor, its eyes a menace of gloom and danger. I perked my ears, and stared straight into its yellow eyes. It's only response was unblinking silence.".

section 3 - looking under the seats

instead of searching the chairs:
	try looking under the noun.

carry out looking under the chairs during inspect the box:
	say "I was very curious about the seats, and wondered what they might hide. Still, I felt anxious about leaving D alone. Once we had seen a bit more of the theater, I could venture out on my own.".
	
carry out looking under the chairs when the bag is undiscovered during discuss the bag:
	say "I peered under one of the many seats, but there was nothing hidden there. However, my sensitive and insightful nose picked up a curious and unfamiliar scent. A less observant species would not have smelled beyond the surface odors of human clothing and sweat, but D[em]both intelligently and fortunately[em]traveled with a cat.";
	
carry out looking under the chairs when discuss the bag has ended:
	say "On any other day, I would have explored the area under the seats from end to end. I might have even taken a nap down there! But D and I were stuck in this theater, and we needed to figure things out.".


section 11 (going)

instead of going nowhere from auditorium:
	say "I could only go [oc]SOUTH[cc] to the main entrance or [oc]NORTH[cc] to center stage.[if prologue has ended]

[bk][it]for general information about getting around, type [oc]NAVIGATION[cc][cb][lb]".
	

Part 4 - main entrance

Chapter 1 - room description and general

Main Entrance is south of Auditorium.
main entrance is in the theater.
main entrance is improper-named.
the description of the main entrance is "[a variable description]".
the indefinite article of main entrance is "the".
the printed name of main entrance is "[if the location is main entrance]Main Entrance[otherwise]main entrance[end if]".


Chapter 2 - things

Section 1 - exit doors

The exit doors is a door. It is south of the main entrance and north of the Great Beyond.
the exit doors are a plural-named thing.
the exit doors are remote.
the plural of exit doors is adjkhlkafsdj.
understand "exit / door" as the exit doors.
understand "big/-- metal/-- doors / door" as the exit doors.
the exit doors are locked.
the exit doors is scenery.

to say pdoors:
	say "[exit doors]" in title case.

the description of the exit doors is "[if prologue is happening]The exit doors stood waiting in the poorly lit entrance area. Doors are one of only a few things that humans handle better than cats. D struggled with them, probably because human eyes are inadequate in low light.[otherwise]The doors looked like a good way out, but D couldn't open them. It was all up to him, unfortunately. Cats, as you probably know, have trouble with doors. We can't be good at everything!"

failing to open the doors is an action applying to nothing.

instead of opening the exit doors:
	try failing to open the doors.
	
instead of unlocking the exit doors with something:
	try failing to open the doors.
	
[as in a lot of other cases, responses contained narrative moments that could not be repeated, so actions often had different output based on timing, etc.]
	
carry out failing to open the doors:
	say "[if prologue is happening]D was already doing his best to get the doors open. If I wanted to help him, I needed to find another way.[otherwise]The doors were our way out, but I didn't know how to get them open. Let's face it: cats aren't very good with doors!";
	now suppression flag is true;
	
[why did I do this "bumlock" bit? I'm really not sure. it likely involved something in Standard Rules that I didn't want to rework or write around, but it seems unecessary.]
	
bumunlocking is an action applying to one thing.
understand "unlock [something]" as bumunlocking.
understand "lock [something]" as bumunlocking.

instead of unlocking something with something:
	try bumunlocking the noun.
	
instead of locking something with something:
	try bumunlocking the noun.
	
carry out bumunlocking the exit doors:
	say "Those doors were locked and locked well. Whatever hid beyond them was safer than a queen's secret.";
	
carry out bumunlocking something when the noun is not the exit doors:
	say "Are you making fun of me? As in, 'Let's see if the cat can tell what's locked?' Well, you lemurs are hardly perfect, as I hope you know.".
	
instead of meowing at the exit doors when prologue is happening:
	say "'I know, Marbles. What a rotten door!";
	now fascination damper is true.
	
instead of meowing at something when prologue is happening and the noun is held by center stage:
	say "We could talk about [the noun] later. I wanted to stay close to D for a while. Everybody knows how helpless humans are in the dark!".

Section 2 - light switch

[once there's a light switch, people just expect things. it's again a question of how far we want to take things.]

the light switch is scenery in the main entrance.
the light switch is a device.
the light switch is switched off.
understand "lightswitch" as the light switch.

flipping is an action applying to one thing.
understand "flip [something]" as flipping.

carry out flipping:
	if the noun is a device:
		if the noun is switched on:
			try switching off the noun instead;
		otherwise if the noun is switched off:
			try switching on the noun instead;
	otherwise if the noun is a person:
		say "Living things flipped on and off based on where the sun was. Everybody but the grues, anyway. Who could say what they did?";
	otherwise: 
		say "I may be a cat, but even I know that you can't just flip anything." instead.
		
instead of switching on the light switch:
	if the prologue is happening:
		say "That was human stuff. I could ask D to try it by [oc]MEOWing AT THE SWITCH[cc].";
	otherwise:
		say "It was already on, thank goodness. I can't work that thing on my own.";
	
instead of switching off the light switch:
	if the prologue is happening:
		say "Even though I'm no expert when it comes to human stuff, my feline intuition suggested that the switch was already off. D would probably take a look if I [oc]MEOWed AT THE SWITCH[cc].";
	otherwise:
		say "I was unable to do that on my own, which was all for the best. I had no intention of leaving D in the dark!";
		

the description of the light switch is "[if prologue is happening]It looked like the sort of thing humans use to make imitation daylight. If I wanted to talk to about D it, I could [oc]MEOW AT THE LIGHT SWITCH[cc].[otherwise]D used it to make it easier for him to see. I suppose I deserve some credit for bringing it to his attention, but really, it was nothing.".

understand "lights" as the light switch.

the examine devices rule does nothing when the current action involves the switch.

	
Section 3 - wooden ladder

the wooden ladder is scenery in the main entrance.
the description of the wooden ladder is "[a variable description]".
the printed name of the wooden ladder is "Miznian ladder".
understand "miznian / hardwood / wooden / ladder" as the wooden ladder.
the wooden ladder is remote.

Chapter 3 - actions in main entrance

Section 1 - the light switch

Instead of doing anything other than flipping or examining or meowing at or switching on or switching off to the light switch:
	say "The light switch was too high for me to reach, and besides, things like that are for humans, not cats.".

Section 2 - the ladder

[as I've said elsewhere, I've wondered whether this ladder should have been a door, or else a scenery backdrop instead. However, at this point I've sunk a lot of time into making it work as-is. Keeping it, I know, can be considered fallacious.]

instead of climbing the wooden ladder during the prologue:
		say "D was worried about the door, and I was worried about the dark. The ladder would have to wait.".
		
instead of climbing the wooden ladder when prologue has ended and discover the Aughtlight has not happened:
	say "I was a small cat without thumbs, so climbing the Miznian ladder seemed impossible without help. Perhaps D and I would investigate once we had finished exploring the rest of the theater.";
	
instead of climbing the wooden ladder during discover the Aughtlight:
	say "The ladder looked a little awkward for even a capable cat, but D might have been able to help.";

	
instead of climbing the wooden ladder when discover the Aughtlight has ended and escape the theater has not happened:
	say "D was in charge of the booth, while I needed to remain down in the theater, looking for things to [oc]MEOW AT[cc]."
	
instead of doing anything other than performing cat behavior or climbing or examining or directing transit to when the noun is the wooden ladder:
	say "Ladders were essentially human, since humans love to be taller and bigger than they actually are, but a clever cat could subject them to feline arts such as [oc]SCRATCHing[cc], [oc]MEOWing[cc], or [oc]HISSing[cc].".
		

	
Section 3 - the wood
	

[deprecated]
	
	
section 4 (cat behavior)

[another best effort to implement every cat action against every noun]

section 4a (scratching)

carry out scratching the wooden ladder:
	say "I raked my claws across the ladder's surface, but they didn't leave a mark! That Miznian hardwood is as tough as they say it is.".
	
instead of scratching the exit doors:
	say "That wouldn't help, even though the doors deserved a good scratching."
	
instead of grooming the wooden ladder:
	say "I didn't know much about human ladders, but I knew this: they were made for human feet. In shoes. While a shoe might be an enjoyable companion for an afternoon, their undersides were remarkably filthy. I did not groom the ladder, fancy wood or otherwise.".
	
instead of grooming the exit doors:
	say "That door tasked me. It heaped me. I would no more lick its obstinate surface than I would nap in a litter box.".
	
section 4b (smelling)
	
carry out smelling the wooden ladder:
	say "It didn't smell like much, though I did detect a very faint hint of rubber, presumably left by human shoes.".
	
carry out smelling the exit doors when prologue is happening:
	say "D was already busy with the door, and I didn't want to get in his way.".
	
carry out smelling the exit doors when prologue has ended:
	say "Perhaps fresh air[em]or fresher air[em]waited beyond the door.".

carry out smelling the main entrance:
	say "The smells of humans and wood. Beneath it, a kind of television smell."

section 4c (listening)
	
instead of listening to the exit doors during the prologue:
	say "I tried listening at the door, but D was making a bit of a racket. It was impossible to hear anything else.".
	
carry out listening to the exit doors when prologue has ended:
	say "I narrowed my eyes, and crouched for enhanced concentration. Were those the sounds of Thriff beyond the exit? Merchants, dogs, craftspersons at work?"
	
carry out listening to the wooden ladder during the prologue:
	say "D made quite a racket! Until he settled down, listening had little help to offer.".
	
carry out listening to the wooden ladder during inspect the box:
	say "The ladder sounded[em]or failed to sound[em]just as I expected. However, I did hear a sound coming from something else nearby. If I [oc]LISTENed[cc] more generally, I might pick up something."
	
carry out listening to the wooden ladder when inspect the box has ended:
	say "The ladder was impressively stealthy! It hardly made a sound."
	
carry out listening to the main entrance during the prologue:
	say "Even as aware as I was, I heard no sound rising above the racket of rattling doors. D seemed quite determined!".
	
carry out listening to the main entrance when the prologue has ended:
	if experimental Aughtlight has not happened:
		say "The quiet of the theater was frequently violated by gurgles bubbling up from center stage.";
	otherwise:
		say "A dangerous buzzing sound emerged from the Aughtlight above."
		
section 4d (biting)
	
instead of biting the wooden ladder when prologue has ended:
	say "Even if the ladder was not good for climbing, biting it was hardly a dignified response.";
	
instead of biting the wooden ladder when prologue is happening:
	say "I tried to bully the ladder into helping D, but it didn't work! I was too small."
	
instead of biting the exit doors:
	say "There was no way for me to get the doors in my mouth, so I sent a few annoyed chirps their way instead."
	
section 4e (hissing)
	
carry out hissing at the wooden ladder during the prologue:
	say "D turned from the door. 'Gee whiz, Marbles! Why has that ladder gotten you so worked up? Let's just focus on getting out of here, OK?'"
	
carry out hissing at the wooden ladder when prologue has ended:
	say "I knew that hissing at the ladder wasn't going to solve anything, but I was hungry and needed a nap.".
	
carry out hissing at the exit doors during prologue:
	say "What if D thought that I was hissing at him? I wouldn't want that."
	
carry out hissing at the exit doors when prologue has ended:
	say "The doors had been anything but helpful. I saw no harm in letting them know, and I puffed up my tail for added effect.".
	
Section 4f - pawing

carry out pawing the exit doors:
	say "I raised myself up on my back paws so that I could push the door with both of my front paws, but it didn't budge. It didn't even rattle.".
	
instead of pawing the wooden ladder:
	say "I gave the ladder a swat with my right paw, but nothing happened[if discover the Aughtlight is happening] If I wanted to do anything with the ladder, I would need D's help[end if]."

section 4g (meowing)

["remote" means it can be interacted with from a distance, i.e., it's in scope. This happens once the player tries to interact with it for the first time.]

after doing something to the light switch:
	now the light switch is remote;
	
[this is the prologue-ending action.]
	
Carry out meowing at the light switch during the prologue:
	say "I told D about the light switch. 'Good point, Marbles! I guess I was too focused on the door to notice that switch.' He flipped it, and the entire theater lit up immediately. Even at a distance, we could clearly make out the contents of center stage. They included a black box large enough to hold one or more humans with sides that seemed to waver and ripple.

'Wow, Marbles, there's something weird about that box! Since these doors are locked, we might as well have a look at it.'";
	say line break;
	say cat prompt;
	now the current scene is inspect the box;
	let N be the number of filled rows in the source of status information;
	set statusbar height to N;
	
carry out meowing at the light switch when prologue has ended and experimental Aughtlight has not happened:
	say "D glanced up, then turned his attention back to [the fascination of d]. 'That's right, Marbles! You found the light switch. That was pretty smart.'".
	
carry out meowing at the light switch while experimental Aughtlight is happening:
	say "[one of]D called out from the platform above me: 'Marbles, I can't point this Aughtlight at the switch! It can't turn that far.'

I needed to talk to D about something in front of the light, either in the auditorium or on the stage.[or]Instead of revisiting the subject of the light switch, I decided to reach forward with my paws and give myself a good stretch. Ah! A cat must remain limber, after all.[stopping]".

carry out meowing at the exit doors when prologue is happening:
	say "D was already paying a great deal of frustrated attention to the doors, so I hooked my claws into his jeans instead. What could have been more comforting than that?.".
	
carry out meowing at the exit doors when prologue has ended and experimental Aughtlight has not happened:
	say "[if d is not in the location of the noun][one of]'I know, Marbles. Those doggone doors!'[or]D looked at the door, shaking his head. We felt the same way, as we often did.[stopping][otherwise][one of]'I hope there's a key someplace!' D said, 'I don't want to go back in that tunnel, and I know you don't, either.'[or]D gave the doors a rueful tap. 'Mraow!' I said.[stopping]".
	
carry out meowing at the wooden ladder during the prologue:
	say "'MRAOW!' I said to the ladder, rubbing my back against it[one of].

D glanced over at me, saying 'Marbles, let's try to figure out something with this door first, OK? We can check out the ladder later if we run out of ideas.'[or], but D didn't look up. He was focused on getting the door open.[stopping]".

carry out meowing at the wooden ladder when prologue has ended and discuss the grue has not happened:
	say "I wanted to have a conversation about the ladder so I gave it a big, loud meow, but D was too fixated on the large box at center stage."
	
carry out meowing at the wooden ladder during discuss the grue:
	say "I thought D and I might discuss the ladder for a bit, but he was too focused on the leaflet to notice."
	
carry out meowing at the wooden ladder when discover the Aughtlight is happening:
	say "[if the location is the main entrance]Now that D and I had explored the rest of the theater, I thought D and I should discuss the ladder and the platform above it. What could be up there? I decided to give it a good meowing.

D came over straight away. 'What is it, Marbles? Is it this fancy ladder?' D gave my ears a good scratching. 'It probably leads somewhere interesting. Let's try it!' And with that, he carried me gently up the ladder.";
	now the destination of D is the spotlight booth;
	now D is in the spotlight booth;
	move the player to the spotlight booth;
	now the Aughtlight interests d;
	say the current fascination.


section 4h (marking)

instead of marking the exit doors:
	if prologue is happening:
		say "D was busy with the doors, and I didn't want to get in his way. He was the one with hands, after all!";
	otherwise:
		say "No. Absolutely not. I would not associate myself or my scent with such an obstinate and unhelpful pair of doors.".
		
instead of marking the wooden ladder when prologue is happening:
		say "I decided to help D find some light. The ladder could wait." instead.
		
carry out marking the wooden ladder when prologue has ended:
	say "I rubbed my face against the ladder to let the world know that I, Marbles, had once been there.".
		
section 4i (jumping to)

instead of jumping to the exit doors:
	say "I wanted to pounce on the doors, claws extended. They really ought to have opened for D! But there was nowhere to jump, and I doubt that the doors would have learned their lesson."
	
instead of jumping to the wooden ladder:
	try climbing the wooden ladder.
	
	
section 11 (general)

instead of going in main entrance:
	if going up:
		try climbing the wooden ladder;
	if going north:
		continue the action;
	if going south:
		try opening the exit doors;
	otherwise if going nowhere:
		say "Since not even D could open the doors, the only obvious exit was [oc]NORTH[cc].[if discover the aughtlight is happening] The ladder, unclimbable as it was, clearly lead [it]somewhere[rt][otherwise if experimental aughtlight is happening] The ladder led up, of course, but I had things to do down in the theater.[end if][if prologue has ended]

[bk][it]for general information about getting around, type [oc]NAVIGATION[cc][cb][lb][end if]"

Instead of doing anything other than examining or performing cat behavior or switching off when the current action involves the light switch:
	say "The light switch was too high for me to reach, and besides, things like that are for humans, not cats.".

Chapter 4 - rules
	
[deprecated]

Part 5 - spotlight booth

[this became the most miserable aspect of the implementation. my use of scenes to separate descriptions and responses broke down, because everything in the booth happens during a single scene. I probably should have made three separate scenes out of this (that might be running in parallel): check the light, reach the ledge, and an overall booth scene. but live and learn! it's a messy section but everything has hopefully been smoothed out from a gameplay POV]

Book 1 - room description and general

[this location was A LOT of trouble. that's mainly because I have multiple important changes to world state triggering here, and each changes descriptions in the room. the unusually complex printed name of the room is taste of things to come.]

Spotlight Booth is up from The Main Entrance.
spotlight booth is in the theater.
the description of spotlight booth is "[a variable description]".
understand "platform" and "curious platform" as the spotlight booth.
the printed name of spotlight booth is "[if the tag is examined and spotlight booth is the location]Aughtlight Booth[otherwise if the tag is examined and the spotlight booth is not the location]Aughtlight booth[otherwise if spotlight booth is the location]Spotlight Booth[otherwise if spotlight booth is unvisited]the raised platform[otherwise]the spotlight booth".

[these title case location names are for the status bar. Inform only defaults to title case for room names in the status bar and while printing a room's description.]

to say pbooth:
	say "[spotlight booth]" in title case.

instead of directing transit to the spotlight booth when experimental aughtlight is happening:
	say "I was needed on the floor, where I could [oc]MEOW AT[CC] targets for the Aughtlight's beam."
	
Does the player mean doing something with the stepladder when the location is the spotlight booth:
	it is very unlikely.
	
[this should be unecesssary now because the chair is does not have the "remote" property, but I'm not going to touch anything. this location is just too fiddly to tinker with barring a very compelling reason.]
	
Does the player mean doing something with the metal folding chair when the location is not the spotlight booth:
	it is very unlikely.
	

Book 2 - things

part 1 (aughtlight)

[more printed name shenanigans. and those 'understand' phrases!]

the Aughtlight is in the spotlight booth.
the Aughtlight is a magical contraption.
the description of the Aughtlight is "[a variable description]".
the printed name of the Aughtlight is "[if the location is not the spotlight booth and experimental Aughtlight has not happened]weird metal thingy[otherwise if the tag is undiscussed]spotlight[otherwise]Aughtlight".
the Aughtlight is a device.
the Aughtlight is scenery.
the Aughtlight is remote.
understand "Frobozzco/-- magic/-- Aughtlight/spotlight/light" as the Aughtlight.
understand "weird/-- metal/-- thingy/contraption/thingamajig/drum" as the Aughtlight.

to say plight:
	say "[Aughtlight]" in title case.
	
rule for clarifying the parser's choice of aughtlight when the spotlight booth is unvisited:
	do nothing.

does the player mean doing something when the current action involves the Aughtlight and the location is spotlight booth:
	it is likely.
	
instead of doing anything other than examining to the aughtlight when discover the aughtlight has not happened:
	say "Be patient! I'll get to the spotlight part soon.";
	
instead of doing anything other than examining to the aughtlight when discover the aughtlight is happening and the location is not the spotlight booth:
	say "Hm? I guess we should be getting to the spotlight part soon! Where do you suppose it was?"
	
the can't reach inside rooms rule does nothing when discover the aughtlight is happening and the noun is the aughtlight.
	
instead of doing anything other than directing transit to or examining to the aughtlight when experimental aughtlight is happening:
	say "I couldn't do a lot to or with the Aughtlight from down on the floor, and yet I could control it! I only had to [oc]MEOW AT[cc] things, and D would handle the rest."
	
rule for clarifying the parser's choice of Aughtlight:
	do nothing.
	
[by default, Inform will declare, unasked, whether the aughtlight is on or off]

the examine devices rule does nothing when examining the Aughtlight.

part 2 (the tag)

the tag is scenery in the spotlight booth.
the printed name of the tag is "engraved metal tag".
understand "engraved / metal / tag" as the tag.
the description of the tag is "[if the tag is undiscussed]Near the base of the big metal thingy, there was a small metal tag with human writing on it. I wondered what it might say![otherwise]According the D, the big metal thingy was a 'Frobozzco Magic Aughtlight.' Humans are so weird!".

part 3 (the wall)

the wall is scenery in the spotlight booth.
understand "fence" as the wall.
the description of the wall is "The wall was little more than a place for its ledge to be, though it might be good for bit of [oc]SCRATCHing[cc]."

carry out scratching the wall:
	say "I reared back and thoroughly scratched the wall. How relaxing!"
	
carry out marking the wall:
	say "I rubbed my right side against it to make sure everyone knew whose wall it was."
	
instead of doing something other than scratching or marking or grooming to the wall:
	say "The wall's vocation was standing still, and it performed its duties admirably.".
	
instead of doing something to the wall when the location is not the spotlight booth:
	if examining:
		say "The low fence surrounding the booth made it almost impossible to see what was in there. It was the enemy of curiosity! Until I found a way up to [the spotlight booth], it would have to remain a mystery.";
	otherwise:
		say "The wall was little more than a place for its ledge to be.".
		
part 4 (the ledge)

the flat board is an enterable supporter in spotlight booth.
the flat board is scenery.
the printed name of the flat board is "ledge".
understand "ledge" and "rail" and "handrail" and "perch" as the flat board.
the description of the flat board is "[if Marbles has been held by the flat board]The entire theater was visible from atop the low, wooden wall surrounding the [spotlight booth].[otherwise]A flat board at the top of the low, wooden wall surrounding the [spotlight booth]."

part 5 (the folding metal chair)

the folding metal chair is an enterable supporter in spotlight booth.
the folding metal chair is scenery.
the printed name of the folding metal chair is "folding chair".
the description of the folding metal chair is "[explain the folding metal chair][rp]";

[things have begun to get hairy. I had to break this out into a TO SAY definition, and it's still very hard to follow. I'm unhappy with this; some of these conditions are organized in a way that they only make sense in the order in which they are articulated, ie, it's risky to reorder them or, better still, atomize them for better readability. Everything works, but I find it very fragile.

This is a symptom of scope creep! If I had known at the beginning how complex the spotlight booth would be, I wouldn't have written so much of it as conditional blobs.]

to say explain the folding metal chair:
	if the location is spotlight booth:
		say "[if the chair is ripe for discussion]The chair would make a fine place for D to stand while operating the Aughtlight.[otherwise if the tag is undiscussed and Marbles has not been held by the flat board]The chair was a midpoint between the floor and the ledge atop the wall.[otherwise if Marbles has not been held by the flat board]The chair, which in happier times might have been suitable for napping, was at least a good midpoint between the floor and the ledge overlooking the theater.[otherwise if the tag is undiscussed]The chair was a fine place for a young human to stand. After D and I figured out what the spotlight was for, we would discuss the chair and its potential.[otherwise]This is an embarrassing error condition! Please let Drew know.";
	otherwise:
		say "I couldn't see the chair, but I knew it was in the booth because I could see D. He was standing on it!";
		
instead of doing something to the folding metal chair when experimental aughtlight is happening:
	say "I couldn't do anything to the chair. I only knew it was in the booth because I could see D. He was standing on it!"

to say pchair:
	say "[folding metal chair]" in title case.
			
instead of entering the folding metal chair:
	try jumping to the chair.

Book 3 - actions

chapter 1 (cat actions)

section 1 (meowing)

[lots of cat things to do here, but meowing at the tag is one of only two actions that move things forward. Note that D reading the tag changes the printed name of the aughtlight AND the booth. And other descriptions. It's a big deal.]

carry out meowing at the tag:
	say "[one of]D knelt beside me. 'What's this, Marbles? It looks like a label of some sort. Let's see...' he said, touching it with a finger. 'It says [']Frobozzco Magic Aughtlight, manufactured by Frobozz Magic Aughtlight Company.['] Huh, an [']Aughtlight!['] You know, I think [']aught['] is a synonym[em]that's a word that I learned in school[em]for [']nothing['] or [']zero.['] So, is this a spotlight that has no light? Let's turn it on and see!'

D stood up straight, then pulled a metal lever on the side of the Aughtlight. FWOOM! A kind of rushing sound came from the strange device as it powered up, which then flattened into a very... electrical? Is that what humans call it? Hum. It was a humming sound. And then, something very strange happened! A beam of total darkness 'shone' from the Aughtlight!

'Will you look at this? It's kind of a reverse spotlight that shoots darkness! That's what an [']Aughtlight['] is!' He experimentally turned the Aughtlight left and right, then pointed it up at the ceiling. 'What do you suppose we should do with it?'[or]'That's right, Marbles! You did a great job finding that tag.'[stopping]";
	now suppression flag is true;
	now the Aughtlight is switched on;
	now the folding metal chair is remote;
	
[so far as this d index goes, my intent was simply to know when two separate actions had been completed. I initially had truth states for each but thought having a single number to track might be better]

before meowing at the tag for the first time:
	increment D index.
	
[this exemplifies the rather out-of-hand nature of the game during this scene, multiple things to check and respond to, generally difficult to follow. I'm not sure what I'd do different, but for now I'll settle for "it works."

Also note that "chair is ripe for discussion" is axiomatically the same as D index equalling 2]

carry out meowing at the folding metal chair:
	if the chair is ripe for discussion:
		say "D looked up from the Aughtlight. 'What's that, Marbles? The chair? Gosh, you're right! I could aim this Aughtlight into the theater if I were a little taller.

'Here,' he said, 'I'll pick you up and carry you down the ladder. That way, you can tell me where to aim the darkness. Just say the word, and I'll point the Aughtlight!'

And with that, he gently carried me down, then set me down on the floor. 'OK, Marbles, let's go!' he said, disappearing up the ladder once more.";
		say line break;
		move Marbles to the main entrance, without printing a room description;
		say cat prompt;
		now the current scene is experimental Aughtlight;
		let N be the number of filled rows in the source of status information;
		set statusbar height to N;
		now suppression flag is true;
	otherwise if the tag is undiscussed:
		say "Wasn't I missing something? D seemed quite interested in the spotlight. Perhaps I should help out, even if it seemed a bit ridiculous.";
		now suppression flag is true;
	otherwise:
		say "Wasn't I missing something? Maybe a bit of elevation would be useful. It almost always is, as any cat can tell you.".
		
carry out meowing at the flat board:
	if the tag is undiscussed:
		say "D took a break from the spotlight to look at the ledge. 'You're right, Marbles, there might be something good up there! But help me out with this spotlight first, OK?";
	otherwise:
		say "'Great idea, Marbles! See if you can get up there.'".
		
carry out meowing at the Aughtlight:
	now suppression flag is true;
	say "[if the tag is undiscussed][first time]D, who was already looking at [the Aughtlight], gave it a tap. [only]'This doggone thing! I can't figure it out.'[otherwise][first time]'That's right, Marbles!' D patted [the Aughtlight] enthusiastically. 'This has to be the key!' [only]D was already quite interested in [the Aughtlight], whether I commented on it or not."
		
section 2 (scratching)

instead of scratching when the noun is the Aughtlight or the noun is the folding metal chair or the noun is the tag:
	say "That human metal stuff is terrible. Just terrible! I chirped at it, annoyed.";
	
carry out scratching the flat board:
	say "[one of]Ooh. Ooh yeah, that is a bit of fine, scratch-friendly wood. I gave it my all, first leaning into it, then pulling back. It was a shame that I had no time for a nap.[or]I gave the wood a wistful look. I could have scratched that thing all day, but D and I had a dinner to get to.[stopping]".
	
instead of scratching the floor in the spotlight booth:
	say "The carpet was suite shabby, really, and unworthy of my claws[dot][first time] After giving it a light tug, I gave up. Worthless[ex][only][lb]".
	
section 3 (biting)

instead of biting when the noun is the Aughtlight or the noun is the folding metal chair:
	try scratching the noun

instead of biting the tag:
	try scratching the Aughtlight instead.
	
instead of biting the flat board:
	say "That board was for scratching, not biting.".
	
section 4 (hissing at)

carry out hissing at the Aughtlight:
	say "[The Aughtlight] really bothered me, for some reason! The way it towered over me was completely unacceptable. Unreasonable! I arched my back and really let go."
	
instead of hissing at the tag:
	try hissing at the Aughtlight.
	
carry out hissing at the folding metal chair:
	say "I don't know what it was with that chair. I knew that it was important. Maybe it knew, too. I decided to take it down a peg with a good hissing."
	
carry out hissing at the flat board:
	say "I reconsidered. [if the flat board is scratched]That ledge was so good for scratching that[otherwise]Since that ledge looked like it might be good for a scratch or two,[end if] I wanted to stay on its good side.".
	
section 5 (marking)

instead of marking the Aughtlight:
	say "No. Absolutely not. I would not be associated with that hideous thing.".

instead of marking the tag:
	try marking the Aughtlight.
	
carry out marking the chair:
	say "A fine idea! I dragged my side along [if the player is held by the spotlight booth]one of the chair's legs[otherwise if the player is held by the folding metal chair]the chair's backrest[end if]."
	
carry out marking the flat board:
	say "As much as I wanted to claim the board, the angle was all wrong. I could only [oc]SCRATCH[cc] it."

	
section 6 (jumping to)

[another very high-effort implementation, this time to handle the different possibilities of three jumping surfaces with a pretty significant world state shift in the middle.

this is the other cat behavior that advances the story.

I'm abivalent about these rules. I think I was struggling to read everything in one rule, so I broke it into separate chunks. I'm not sure. I'd like to rewrite this whole area, I'm not really happy with it. But it works and players seem to have enjoyed themselves.

If you're new to Inform: this bad code was enough to make a game people enjoyed! So don't be too hard on yourself.]
	
instead of jumping to the folding metal chair:
	if Marbles is held by the folding metal chair:
		follow the jumping in place rule;
	otherwise if Marbles is held by the flat board:
		follow the jumping from the ledge rule;
	otherwise if Marbles is held by the spotlight booth:
		follow the jumping from the floor rule;
		
instead of directing transit to the folding metal chair when the location is the spotlight booth:
	try jumping to the noun.

		
this is the jumping in place rule:
	say "I was already on the chair. I can be very efficient!".
	
this is the jumping from the floor rule:
	say "I leapt[em]quite gracefully, I think[em]from the floor to the chair. It wouldn't have been a bad place to nap, were the grue population a tad lower.";
	now the player is in the folding metal chair;
	
this is the jumping from the ledge rule:
	say "With an elegant hop, I descended to the chair. From there, it was just another short jump to the floor.";
	now the player is in the folding metal chair.
		
instead of entering the folding metal chair:
	try jumping to the folding metal chair.
	
instead of directing transit to the flat board when the location is the spotlight booth:
	try jumping to the noun.
	

instead of jumping to the flat board when Marbles is held by the flat board:
	say "I was already on the ledge. I'm very efficient!"
	
instead of jumping to the flat board when Marbles is held by the spotlight booth:
	say "Even though I could make the jump, I was worried about the drop on the other side of the wall. It would be better if I could find something to jump on first, then jump again from there.";
	
carry out jumping to the flat board when Marbles is held by the folding metal chair and the tag is undiscussed:
	if Marbles has not been held by the flat board:
		increment D index;
		say "With one nimble, little jump, I reached the top of the wall. From here, I could see the entire theater! The chairs, the stage, everything!";
	now Marbles is held by the flat board;
	
carry out jumping to the flat board when Marbles is held by the folding metal chair and the tag is discussed:
	if Marbles has not been held by the flat board:
		increment D index;
		say "With one nimble, little jump, I reached the top of the wall. It was quite a sight. From there, I could see both the stage and the auditorium.";
	now Marbles is held by the flat board;

	
instead of directing transit to the floor when marbles is held by the flat board:
	follow the board to floor rule.
			
instead of jumping to the floor when Marbles is held by the flat board:
	follow the board to floor rule.
	
this is the board to floor rule:
	say "After a quick and easy leap, I was on the floor without muss or fuss.";
	move the player to the spotlight booth.
	
instead of directing transit to the floor when marbles is held by the folding metal chair:
	try jumping to the floor.
	
instead of jumping to the floor when Marbles is held by the folding metal chair:
	say "After a short, graceful hop, I was back on the floor again.";
	move the player to the spotlight booth.
	
[there are so many built-in commands that might apply!]
	
before getting off the folding metal chair:
	try jumping to the floor instead;
	
before getting off the flat board:
	try jumping to the floor instead;
	
instead of exiting when Marbles is held by the flat board:
	try jumping to the floor.
	
instead of exiting when Marbles is held by the folding metal chair:
	try jumping to the floor.
	
before jumping to down when Marbles is held by the folding metal chair:
	try jumping to the floor instead.
	
before jumping to down when Marbles is held by the flat board:
	try jumping to the floor instead.
	
carry out jumping to the Aughtlight:
	say "I reared back, then rested my front paws on the long pedestal of [the Aughtlight]. 'Mraow!' I said to it.".
	
instead of jumping to the tag:
	try jumping to the Aughtlight.
	
section 7 (pawing)

instead of pawing the tag:
	try pawing the Aughtlight instead.
	
carry out pawing the Aughtlight:
	say "I gave [the Aughtlight] a good slap. Served that thing right!"
	
carry out pawing the folding metal chair:
	say "The chair's only reaction was a near-silent 'plunk' sound."
	
carry out pawing the flat board:
	say "The perch was better for scratching than for pawing, but I gave it a quick, exploratory tap."
	
section 8 (smelling)

before smelling the aughtlight when the aughtlight is not in the location and the aughtlight is switched on:
	say "(from a distance)[lb][if rescue the grue is happening]Even from a distance, I could smell the strange, burnt television smell of the Aughtlight.[otherwise]The aughtlight smelled a little like a television that had been in a fire." instead;

carry out smelling the spotlight booth:
	say "[if the Aughtlight is switched off]There was a faint electrical smell on the air.[otherwise]That place smelled like ten televisions![end if]".
	
carry out smelling the Aughtlight:
	say "[if the Aughtlight is switched off]It smelled like electricity, like D's garage.[otherwise]The Aughtlight was really stinky! Like smoke and television. Like a smoking television![end if]"
	
carry out smelling the folding metal chair:
	say "No. Absolutely not. Who knew where the seat of that chair had been?".
	
carry out smelling the flat board:
	say "The board gave off a pleasantly woody smell.".
	
instead of smelling the tag:
	try smelling the Aughtlight.
	


section 9 (listening)

[the aughtlight is pretty noisy once it's been turned on]
	
carry out listening to the spotlight booth:
	say "[if Aughtlight is switched off]Things were pretty quiet in the booth, though I sometimes heard Gruecilla gurgle from her box onstage.[otherwise][The Aughtlight] made an ugly, buzzing racket. Such a detestable device!".
	
carry out listening to the folding metal chair:
	say "[if the Aughtlight is switched off]That sly chair thought that it could escape my notice. And it nearly did, thanks to its tendencies toward stillness and silence.[otherwise]It was hard to hear anything above the constant buzzing of [the Aughtlight]."
	
carry out listening to the flat board:
	say "[if the Aughtlight is switched off]The ledge hunkered in silence atop the low wall. What had it been up to, and what were its intentions? There were no auditory answers.[otherwise]That nasty [Aughtlight] made such a racket that the ledge was a good as silent."
	
carry out listening to the Aughtlight:
	say "[if the Aughtlight is switched off][The Aughtlight] was silent, as if waiting to strike.[otherwise][The Aughtlight] buzzed angrily. I wouldn't let my guard down around it, that was for certain.".
	
before listening to the aughtlight when the aughtlight is not in the location and the aughtlight is switched on:
	say "(from a distance)[lb]The aughtlight hissed and cracked rather dangerously. I hoped  that D was safe with it." instead;
	
instead of listening to the tag:
	try listening to the Aughtlight.
	
section 10 (grooming)

[the grooming action is mostly jokes; I love it]

instead of grooming the folding metal chair:
	say "How many cats have you known, I wonder, and how was their health?".
	
instead of grooming the Aughtlight:
	say "I dislike the taste of metal. I hate even the look of it.".
	
instead of grooming the tag:
	try grooming the Aughtlight.
	
instead of grooming the flat board:
	say "The ledge looked better for scratching than licking, and grooming it posed a meaningful risk of tongue splinters.".
	
instead of grooming the wall:
	say "Many sorts of human paint tasted awful, and I could tell by looking that the walls were covered[em]slathered[em]in the worst and most unpleasant sort of paint. I'd sooner groom a Chihuahua.".

section 3 (going)

instead of going in the spotlight booth:
	if going down when the player is held by the folding metal chair:
		try jumping to the floor instead;
	if going down when the player is held by the flat board:
		try jumping to the floor instead;
	otherwise if going down:
		say "I could have jumped down from the booth, but it would have been tricky. There just wasn't a good way for a cat[em]not even a skilled cat like me[em]to hop down rung-to-rung. I decided to stay with D until the mysteries of the booth were solved.";
	otherwise if going nowhere:
		say "The only safe way out of the booth was in D's arms."
		
first before climbing the wooden ladder when the location is the spotlight booth:
	try examining the wooden ladder instead.
	
section 4 (other)

instead of doing something when the current action involves the metal chair and the player is held by the flat board:
	unless jumping to, listening to, meowing at, examining, or hissing at:
		say "The chair was too awkwardly situated for [action name part of the current action], and I expressed my annoyance with a little chirp.";
	otherwise:
		continue the action.
	
before doing something when the player is held by the flat board:
	if the noun is the Aughtlight or the noun is the tag:
		unless meowing at, hissing at, or examining:
			say "From high on my perch, there there was little I could do to or with [the noun]. I'd have to [oc]JUMP DOWN[cc] first." instead.
			
instead of performing cat behavior when the player is not held by the flat board and the noun is the flat board:
	if meowing at or jumping to or hissing at:
		continue the action;
	otherwise:
		say "If I wanted to engage with the ledge directly, I'd have to find a way up there first.";

		
Volume 6 (general endgame stuff)

[a lot of the established features of the game go out the window for the endgame. while Marbles is still in the theater, she can't touch the floor. this is a hopefully easy puzzle]

endgame is a region.

the description of egdarkness is "[if rescue the grue is happening]The Aughtlight's beam was pointing at [the aphosis of the Aughtlight], and Gruecilla was at its center."

[we need the aughtlight beam, of course. I just have it as scenery everywhere so that it's always where Marbles is.]
		
egbeam is a scenery backdrop.
egbeam is in endgame.
the description of egbeam is "[egbeam text][rp]".
understand "Aughtlight/Aughtlight's-- beam" as egbeam.
understand "Aughtlight/Aughtlight's/-- darkness / dark / beam" as egbeam.
the printed name of egbeam is "Aughtlight[']s beam".

does the player mean doing something with the egbeam:
	it is very likely.
	


to say egbeam text:
	if the aphosis of the Aughtlight is in the location:
		say "At the center of the Aughtlight beam's dark ray lurked Gruecilla, the star of The Circus of the Grues[if Gruemobile is aphotic], and her Gruemobile[end if].";
	otherwise:
		say "Even from a distance, the magic of the grue-sensitive eyeglasses revealed the shape of Gruecilla [if the Gruemobile is aphotic]and her Gruemobile [end if]lurking in the darkness of the Aughtlight's beam.".
		
[there's still a "darkness" in the gruequarium, which forces a clarification message of the beam whenever the player interacts with darkness. we should get rid of that.]
		
rule for clarifying the parser's choice of egbeam:
	do nothing.
	
[as was the case in the previous scene, it isn't possible to interact with the aughtlight beam]
	
instead of doing something to something aphotic when rescue the grue is happening:
	if examining, meowing at, grooming, or hissing at:
		continue the action;
	otherwise:
		say "Even though my consistently correct intuition indicated that Gruecilla was a good sort, I wanted to stay away. Just to avoid any misunderstandings, mind you!".
		
first instead of doing something other than examining to the egbeam:
	say "Even though my consistently correct intuition indicated that Gruecilla was a good sort, I wanted to stay away from the Aughtlight's beam. Just to avoid any misunderstandings, mind you!"
	
instead of doing something to gruecilla when rescue the grue is happening:
	if examining, meowing at, grooming, or hissing at:
		continue the action;
	otherwise:
		say "Even though my consistently correct intuition indicated that Gruecilla was a good sort, I wanted to stay away. Just to avoid any misunderstandings, mind you!".
		
instead of directing transit to the Gruemobile when the location is egladder:
	try directing transit to gruecilla.
	

after meowing at something during rescue the grue:
	now suppression flag is true;
	continue the action.
	
after looking during rescue the grue:
	now suppression flag is true;
	continue the action.
	
[during the endgame, the usual fascination of D mechanic is abandoned. instead, everything is handled with this monstrosity. Basic idea:
	
- make random check, if successful print one of D's quips. Once all possibilities are printed, cycle through a small subset of possible texts
- if check one fails, make another reandom check for the aughtlight making random electrical noises. again, cycle through small number of choices once possibilities are exhausted

obviously, this is another case where there is a ton of variations that print once, then a smaller subset of texts that repeat (A FEW FINAL OPTIONS FOR...)

note that this rule also resets the suppression/fascination dampers.]

last every turn when rescue the grue is happening and fascination damper is false:
	if suppression flag is false and a random chance of one in two succeeds:
		say "[one of]D called out from the far away booth, 'Are you OK down there Marbles? I know Gruecilla seems pretty nice for a grue, but it's OK if you are a little worried.'[or]I heard D whistling from far away and above in the Aughtlight booth.[or]'Hey Marbles!' D called out. 'Do you think grues have parents?' he paused. 'I guess it makes sense that they would.'[or]D hummed a little tune. He loved music, I guess. Music was a very human thing; I didn't really understand it.[or]'What do you suppose they did at this Circus? Gruecilla drove the car, I'm sure, but what else? Maybe they had a trapeze, or a fiery ring.'[or]'How do you suppose they got a grue into a box, anyway?' D wondered. 'It really makes you think!'[or]D tapped the Aughtlight. He was probably a little nervous, just like I was.[or][a few final options for D][stopping]";
	otherwise if suppression flag is true and a random chance of one in four succeeds:
		say "[one of]A mildly disturbing sound emerged from the Aughtlight: a brief crackle, as if the air around it fractured from pressure.[or]A strange hiss, like the song of a sneaky snake, rose, then fell. I think it must have come from the Aughtlight.[or]A sudden and single 'pop!' startled my tail-hairs to attention. That aughtlight was even noisier than a dog![or]The Aughtlight sang, and its song was a prolonged, high-pitched whine.[or]An electrical smell filled the air.[or]Another crack, another pop. Cats know little to nothing about human technologies, but it was obvious that the Aughtlight was on its last and only leg.[or][a few final options for the Aughtlight][stopping]";
	now suppression flag is false;
	now fascination damper is false;
	
to say a few final options for D:
	say "[one of]I heard D shuffle his feet far away in the booth.[or]The Aughtlight twitched momentarily. Perhaps D was holding back a sneeze.[or]I saw Gruecilla's outline looking up from the darkness. D and I needed to keep moving.[cycling]"
		
to say a few final options for the Aughtlight:
	say "[one of]A buzzing hiss... or perhaps a hissing buzz? Yet another sound emerged from the Aughtlight.[or]The air around the Aughtlight crackled, and an electrical smell filled the area.[or]The Aughtlight sparked and seethed as if burdened with electricity.[cycling]"

	
Book 1 (the ladder)

Part 1 (the room)

[like the spotlight booth, rooms in the endgame typically require multple description texts. Those, in turn, often have "first time" print conditions.]

the egladder is a room.
egladder is in endgame.
the printed name of the egladder is "On the Ladder".
The description of egladder is "The ladder stood on the stage as a kind of triangle with wide, sturdy rungs. [if gruecilla is aphotic]Below and onstage, the white outline of Gruecilla stood beside the Gruequarium, her forelimbs draped over the edges of one side.[first time] Thanks to the magical darkness cast by the Aughtlight, she had managed to leave the tank![only] The Gruemobile waited nearby for someone or something to take it for a drive.[otherwise]Nearby, the white silhouette of Gruecilla waited patiently in the dark for some help piloting the Gruemobile. Her hands were raised as if resting on an invisible steering wheel[lb][end if]

A nearby sandbag dangled from the ceiling overhead. It might offer a one-way trip across the stage, if I were willing to risk a leap."

egladder is proper-named.

part 2 (things)

chapter 1 (the Gruemobile)

[yes, the gruemobile does have its moment in the sun... er, dark]

the Gruemobile is scenery in egladder.
the printed name of the Gruemobile is "Gruemobile".
understand "Gruemobile" as the Gruemobile.

understand "Gruemobile" and "car" as the Gruemobile.

[more complexity due to the open map]

the description of the Gruemobile is "[a likeness of the Gruemobile][run paragraph on]".

to say a likeness of the Gruemobile:
	if the location is egladder:
		say "[if the Gruemobile is aphotic]Even though the car was blotted out by the magical powers of the Aughtlight, I could clearly see the outline of Gruecilla sitting within it. She held the steering wheel, tapping it with her claws as if she were mildly impatient.[otherwise]The Gruemobile was a small, colorful[em]I'm guessing, because I don't see colors very well[em]car. It was just a little too small for D, but I know he would have loved driving something like it. A pair of large, scary-looking eyes were painted on the hood.";
	otherwise if the location is the dinosaur head:
		say "[if the Gruemobile is aphotic]The Gruemobile was parked near the dinosaur's tail, and Gruecilla sat atop it fidgeting.[otherwise]The sinister, yellow eyes of the Gruemobile glared up from the car's parking space near the dinosaur.";
	otherwise:
		say "The Gruemobile lurked the far-away stage, holding no one and going nowhere.".
		
[the eyes are another "how far do I want to take this" situation]

the careyes are part of the Gruemobile.
the printed name of the careyes is "scary-looking eyes".
understand "large / scary / scary-looking / eyes" as the careyes.

the description of the careyes is "[if the Gruemobile is not aphotic]A large, spooky-looking pair of eyes glared up from the hood of the car. I wonder, do grues have eyes?[otherwise]Even though the eyes were covered in magical darkness, I could still remember how scary they looked!".

instead of doing anything other than meowing at or examining to the careyes:
	say "The eyes were just for show. There wasn't a lot for a cat to do with or to them.".
	
instead of meowing at the careyes:
	try meowing at the Gruemobile.

chapter 2 (the sandbag)

the right sandbag is in the egladder.
the printed name of the right sandbag is "raised sandbag".
understand "raised / sandbag / bag" as the right sandbag.
the right sandbag is scenery.

[the description changes to encourage the player to jump after getting Gruecilla in the car.]

the description of the right sandbag is "The sandbag was a small, heavy-looking canvas sack. Canvas, as any self-respecting cat would know, was an excellent material for scratching, claw-sharpening, and climbing. [if the Gruemobile is aphotic]It swayed overhead, as if in invitation. I was sure I could reach it if I tried to [oc]JUMP TO THE SANDBAG[cc].[otherwise]On any other day, I would have already leapt to it, just to find out what it was about.[end if]".

chapter 3 (the Gruequarium and gruecilla)

[more challenging DOES THE PLAYER MEAN content. it became important to consider how disambiguation considers scenery, backdrops, contents, and so forth. and this is all... not required? this kind of effort. but I didn't want players to get messages choosing between dark in the tank vs the aughtlight beam, that just seems disruptive to me. I spent a lot of time manipulating how the game handles disambiguation.]

the Gruequarium is an enterable container in egladder.
Gruequarium is scenery.
understand "box / tank / aquarium / Gruequarium / flurgh" as the Gruequarium.
the description of the Gruequarium is "Gruecilla had escaped the Gruequarium, leaving only magical darkness behind."

gdarkness is in the gruequarium.
understand "whirling darkness" or "whirling" or "magical darkness" or "whirling magical darkness" or "darkness" as gdarkness.
the printed name of gdarkness is "darkness within the Gruequarium".

the examine containers rule does nothing when the noun is the gruequarium.

instead of examining the gdarkness:
	try examining the Gruequarium instead.
	
does the player mean doing something with gdarkness:
	it is very unlikely.
	
after deciding the scope of marbles while rescue the grue is happening:
	place the gruequarium in scope.
	
[conditions change these texts, and it leads to another design philosophy question. it's possible to come up with one response that applies to everything--perhaps in a bland way--or else atomize and customize.]
	
Before doing something to the gruequarium when the noun is not in the location:
	if the location is dinosaur head and the tail is aphotic:
		say "Having crossed the stage, I had no way to get back to the Gruequarium. Instead of going back, I thought I might find a way up.";
	otherwise if the location is dinosaur head and the gruemobile is aphotic:
		say "Having crossed the stage, I had no way to get back to the gruequarium. I doubt very much that Gruecilla would want to return, either. Hopefully, that dinosaur held some answers for us both.";
	otherwise if the location is plank:
		say "I was so high above the theater that I could barely make out the Gruequarium. It wasn't a part of my story anymore.".
	
	
instead of doing anything other than examining or hissing at when the current action involves the gdarkness or the current action involves the Gruequarium:
	if meowing at the box:
		say "I thought about it for a moment, then decided that I didn't want to force Gruecilla back into the box.";
	otherwise:
		say "The tank and its darkness no longer imprisoned Gruecilla. Together, they were no better than a giant cat carrier, and I refused to pay them further attention."
		
carry out hissing at the gruequarium:
	say "Good riddance to that nasty fishbox! I eloquently expressed my fury and disdain."

[the "grue" of previous scenes has been replaced by Gruecilla]

Gruecilla is a female animal.
Gruecilla is in egladder.
understand "grue" as gruecilla.
gruecilla is proper-named.

rule for writing a paragraph about gruecilla:
	now gruecilla is mentioned.

does the player mean doing something with the gdarkness:
	it is very unlikely.

the description of gruecilla is "[a likeness of gruecilla][run paragraph on]".

[all depends on 1) player location and 2) the target of the aughtlight]

to say a likeness of gruecilla:
	if the location is egladder:
		say "[if gruecilla is aphotic]Gruecilla was a nearly human-looking white shape outlined by the Aughtlight's magical darkness. She seemed to have more joints than D, somehow, and her movements alternated between slow arcs and swift, jerking motions. Her head crested in with a curved point, as if it were an ice cream cone, but I couldn't tell if that was her fur or just the shape of her head. Her wrists and forelimbs were twisted oddly over the edge of the Gruequarium.

Even though I couldn't see her face, I thought that she might have been looking at me.[otherwise]Even if I couldn't see the car itself, Gruecilla was clearly sitting inside it. She held an invisible steering wheel with one paw[em]hand? claw[q][rp][em]ready to drive, and dangled the other limb out the window. That second limb flopped oddly against the door. Did grues have two elbows on each 'leg?'";
	otherwise if the location is the dinosaur head:
		say "[if the Gruemobile is aphotic]Gruecilla sat on the roof of the Gruemobile, cheerfully writhing in the dark[first time]. Why 'cheerful,' you might wonder? It is hard to put into words, but cats are blessed with an emotional intelligence that few species can match[only].[otherwise]Gruecilla's silhouette reclined on the dinosaur's tail, slathered in thick darkness. It seemed as if her spine bent and creased to match the ridges of the dinosaur's back.";
	otherwise if the location is the plank:
		say "Gruecilla's shape was turned toward me, and I could almost imagine the features of her face. She was nearly free."

[this was for troubleshooting. there is a separate rule about paragraphs for aphotic things. Gruecilla should never get a paragraph unless something is not working right.

rule for writing a paragraph about gruecilla:
	say "wow!".]
	
chapter 4 (the local ladder)

[one of those cases where the noun is a room, but also a thing to interact with. we could just put the room in scope, but then we'd have to worry about the rules governing objects and rooms. this way, we can just whip up something and use very basic action processing.]

the scladder is a scenery backdrop in endgame.
understand "ladder" and "stepladder" as the scladder.
the printed name of scladder is "ladder".

instead of examining scladder when the location is egladder:
	try looking.
	
the description of scladder is "The ladder was far away, and from this distance seemed a perfectly ordinary human stepladder."

[fast travel doesn't work in the endgame, because travel is half the puzzle.]

instead of directing transit to scladder:
	if the location is egladder:
		say "Go to the ladder? I would like to find a way off this thing!";
	otherwise:
		say "It would be difficult to return there, even if I wanted to.".
	
instead of doing something with scladder when the location is not egladder:
	say "It would be difficult to return there, even if I wanted to.".

part 3 (actions)

chapter 1 (cat actions)

[even late in the game, there are some opportunities for cat behavior. the ladder can be bitten, just in case a chance was missed with the bag]

section 1 (meowing)

[this action is required]

carry out meowing at the Gruemobile:
	if gruecilla is aphotic:
		say "I had an idea! Maybe D and I could send Gruecilla to the car. 'Great idea, Marbles! I'll do it now.' D slowly moved the Aughtlight beam from the tank to the Gruemobile. Gruecilla eagerly followed along, and we could see her outline skittering and scootching along, thanks to the grue-sensitive eyeglasses.

I bet she was happy to get away from that tank! When she reached the car, she climbed into the driver's seat, hands on the wheel (probably, we weren't wearing wheel-sensitive eyeglasses after all).";
		now the Aughtlight delumines the Gruemobile;
	otherwise if the Gruemobile is aphotic:
		say "I almost tried meowing at the Gruemobile, but I couldn't see it in all of that darkness. Wait a minute! if it was already in the dark, why did I want to meow at it?"
	
carry out meowing at the scladder:
	say "[one of]I gave the ladder a good, long, meow. 'What's that, Marbles? You want me to point the Aughtlight at the ladder?' He paused, thinking it over. 'I'm nor sure about that. I would be leading Gruecilla there, and you're there already! Gruecilla seems pretty nice, but let's send her someplace else.'[or]D and I had already discussed this. We decided to point the Aughtlight somewhere else.[stopping]"
	
carry out meowing at the right sandbag:
	say "I gave the sandbag a strong and fierce meow. [if gruecilla is aphotic]'What's that?' D called out from the booth. 'The sandbag? I don't know, Marbles. To get to the sandbag, Gruecilla would have to climb over you.'[otherwise]'Hey Marbles,' D called out, 'I think the sandbag is definitely what's next. Have you tried to [oc]JUMP TO THE SANDBAG[cc]? Maybe you could make your way across the stage that way."

carry out meowing at the schead when the location is egladder:
	say "'I agree, Marbles! That's a good place to take Gruecilla, but maybe you should get to the other side of the stage, just so you can keep an eye on things.' D had an excellent point. Who knows what might have happened without feline supervision? We could revisit the dinosaur situation later.".
	
instead of meowing at the gdarkness:
	try meowing at the box instead.
	
carry out meowing at gruecilla:
	say "'But Marbles, Gruecilla is already in the dark!' D was right, of course, but sometimes I just wanted to share my feelings about things.".

section 2 (scratching)

instead of scratching something when the location is egladder:
	if the scladder is the noun:
		continue the action;
	otherwise:
		say "I couldn't reach anything fit for scratching from atop the ladder, except for the ladder itself. The good news was that I wasn't very reachable up there, either.".
		
carry out scratching the scladder:
	say "[if the stepladder is scratched]Sure, why not? Even at my busiest, I try to make time for scratching.[otherwise]Ah, yes. That was the stuff. Some truly excellent scratching to be had there. I yawned happily."
	
section 3 (biting)

instead of biting something when the location is egladder and the noun is not scladder:
	say "The only thing worth biting there was the ladder, and I would have been better off scratching that.";
		
instead of biting scladder:
		say "The ladder looked rather dirty, and I was not tempted by its smell.".

section 4 (hissing at)

instead of hissing at something when the location is egladder:
	unless the noun is the scladder or the noun is the right sandbag or the noun is aphotic or the noun is gruecilla or the noun is the Gruequarium:
		say "I could hiss all I wanted, but the truth was that I was far from nearly everything onstage. I decided to save my ire for something or someone that would know that I was hissing at them/it.";
	otherwise:
		continue the action.
	
carry out hissing at scladder when the location is egladder:
	say "I was stuck on that ladder, and I didn't care for that. Was the ladder really to blame? Even if scratching it was pleasant, I chose to give the ladder a direct and candid hiss.".
	
instead of hissing at an aphotic thing during rescue the grue:
	say "I didn't want to antagonize Gruecilla while she was trapped in the dark. That would be cruel, wouldn't it?"
	
carry out hissing at the right sandbag:
	say "That lousy sandbag! Just hanging up there like it's above everything. I decided to let it know just how I felt about it. I had a feeling I'd be sinking my claws into it soon."
		
section 5 (marking)

instead of marking something in egladder:
	unless the noun is scladder or the noun is egdarkness:
		say "So long as I was stuck on this ladder, there was no way that I could mark [the noun].";
	otherwise if the noun is egdarkness:
		say "I wouldn't mark that, even if I were able.";
	otherwise:
		continue the action.
		
carry out marking scladder:
	say "It was a little awkward, but I slid the side of my face against the ladder. There! Any future theatergoers would know that the ladder belonged to me.".

section 6 (jumping to)

[this is the second required action]

carry out jumping to the right sandbag when the Gruemobile is aphotic:
		say "I crouched, gave my back legs a little shimmy, then leaped in the direction of the canvas bag! Once airborne, I extended my front paws toward the sandbag. It was a tricky grab, but I managed to embed my claws in the sturdy fabric.

Suddenly, the bag lurched downward, and bright sunlight emerged through a kind of skylight overhead! Squinting in the light, I saw that I was swinging in the direction of another sandbag at the other end of the stage. Preparing myself, I tensed my legs for another leap.

Soon, I was in the air again, flying toward the second bag. I sailed, a creature of elegant drama, across the sunlight falling from above. The entire stage opened below me, and I could see it all: D and his Aughtlight, the auditorium, Gruecilla and her car. I was a queen, and this theater was my kingdom. Grabbing the second bag, there was another lurch, and the sunlight overhead disappeared with the sound of a closing door. This sudden drop suspended me just above the head of the giant dinosaur.";
		say leap;
		say line break;
		say cat prompt;
		move the Gruemobile to the dinosaur head;
		move gruecilla to the dinosaur head;
		move the player to the dinosaur head;
		now suppression flag is true;
		now fascination damper is true;


instead of jumping to the right sandbag when the Gruemobile is not aphotic:
		say "The jump to the sandbag looked tricky but very doable, but I wouldn't leave the ladder before D and I found someplace for Gruecilla to go.".
		
		
instead of jumping to in egladder:
	if the noun is the right sandbag:
		continue the action;
	otherwise if the noun is the scladder:
		say "I climbed down a rung, then hopped back up.";
	otherwise:
		say "I couldn't jump to [the noun], because it was too far away. In fact, almost everything was too far away from my perch atop the ladder.".
		

section 7 (pawing)

instead of pawing in egladder:
	if the noun is the right sandbag:
		say "It was close, but not that close.";
	otherwise if the noun is scladder:
		continue the action;
	otherwise:
		say "[The noun] was out of reach, that rascal!".
		
carry out pawing the scladder:
	say "I gave the stepladder an experimental tap. It felt pretty solid!".


section 8 (smelling)

definition: a thing is marked if we have marked it.
definition: a thing is scratched if we have scratched it.
definition: a thing is scented if it is marked or it is scratched.

carry out smelling the egladder:
	say "The ladder smelled like human shoes and Gruecilla[if stepladder is scented or scladder is scented]. And me! It smelled like me, too[end if].";
	
instead of smelling in egladder when the noun is not the egladder and the noun is not scladder:
	say "The smell of grue was a bit of an olfactory bully, blotting out other nearby scents."
	
instead of smelling scladder:
	try smelling egladder.

section 9 (listening)

carry out listening to the egladder:
	say "While there was nothing nearby to listen to, electrical sounds emerged from the Aughtlight booth far away. Down on the stage, I could hear Gruecilla clickety-clack-click her claws [if gruecilla is aphotic]on the edge of the Gruequarium[otherwise]on the steering wheel of the Gruequarium[end if].".
	
instead of listening to something when the location is egladder:
	if the noun is egladder:
		continue the action;
	otherwise:
		try listening to egladder.
		
section 10 (grooming)

instead of grooming scladder:
	say "Despite my real and sincere appreciation for the ladder, concerns of timing and safety prevented me from grooming it.".
	
instead of grooming the schead:
	say "[if the location is egladder]The dinosaur's head was too far away for grooming, though getting closer probably would not have made grooming more likely.[otherwise]The dinosaur already looked its best, for whatever that was worth.".
	
instead of grooming the right sandbag:
	say "That was out of reach, fortunately."
	
[OMG! I think I just kept banging on the keyboard until everything works. Which is fine :) ]
	
instead of grooming something when rescue the grue is happening and the location is egladder:
	unless the current action involves the right sandbag or the current action involves the scladder or the current action involves the schead or the current action involves gruecilla or the current action involves Marbles or the current action involves the floor:
		say "I would not descend the ladder, especially not for the purpose of grooming inanimate things.";
	otherwise:
		continue the action.
	
instead of grooming gruecilla:
	say "Human television shows about crime, which D's parents enjoy very much, all say that a crime involves 'means, motive, and opportunity.' I had the means for licking Gruecilla: my highly capable tongue! I had an opportunity, since she was within reach. What I lacked was motive. In fact, I lacked even willingness. I did not want to lick Gruecilla. There was the danger, the smell, and the absolute darkness to consider, after all.

No, no, and no thank you.".

instead of grooming the Gruemobile:
	say "The state of the Gruemobile was hardly my responsibility and was, if I dared to guess, of little concern to Gruecilla."


part 3 (actions)

chapter 1 (general)

instead of doing anything other than examining, meowing at, hissing at, or jumping to when the current action involves the right sandbag:
	try wasting time on the right pulley.

wasting time on the right pulley is an action applying to nothing.

[I went out of my way to do this in carry out phase, but I'm not sure why. I must have had a reason...]

carry out wasting time on the right pulley:
	say "I couldn't touch the sandbag from where I stood at the top of the ladder. The only way to reach it was to [oc]JUMP TO THE SANDBAG[cc].".
	
instead of doing anything other than examining or performing cat behavior or climbing when the current action involves the scladder and the location is scladder:
	say "The ladder was mostly for standing on, and I was already doing a good job of that."
	
[it isn't possible to use directional navigation during this scene. Or directing transit to either!]
	
instead of going in egladder:
	if going up:
		say "I was already at the top of the ladder, though I might be able to [oc]JUMP TO THE SANDBAG[cc].";
	otherwise if going down:
		say "The stage was at the bottom of the ladder, but I wanted to stay above the ground while Gruecilla was loose.";
	otherwise if going nowhere:
		say "There weren't a lot of places I could go from the top of the ladder. Wherever I went next, I wouldn't be walking there.".

Book 2 (dinosaur head)

Part 1 (the room)

[continuing to revisit center stage's greatest hits]

the dinosaur head is a room.
dinosaur head is in endgame.
the printed name of the dinosaur head is "Atop a Giant Lizard".
the description of the dinosaur head is "[the details of the head]".

[more complex room descriptions. it's amazing how just one or two details can change output so radically. if you let it, that is. I could have written descriptions that had little to do with the current world state. I just didn't want to do things that way.]

to say the details of the head:
	if the tail is not aphotic:
		say "[first time]Having landed[em]quite gracefully[em]atop the giant lizard's head, I had a look around. [only]Taller than D's father, the dinosaur loomed above the stage below. It's hide was cool and hard. Just above and beyond my reach, a large, white grate was fixed to a nearby wall.

[one of]'Hey Marbles!' D called out, 'I'm going to help Gruecilla follow you across the stage.' With the guidance of the Aughtlight, Gruecilla piloted the Gruemobile across the stage before parking near the dinosaur. She climbed out of it, then sat on its roof, dangling a triple-jointed leg over the side[or]Down on the floor, Gruecilla had climbed out of the Gruemobile, and her white outline sat on its roof. One of her legs bent at unexpected angles, as if it had a second hip or knee[or]Gruecilla sat atop the Gruemobile, waiting[stopping].[lb]";
	otherwise:
		say "Just below me, the Aughtlight's darkness framed Gruecilla standing (kneeling? crawling? lying?) on the dinosaur's tail. While I thought Gruecilla had a good nature, I was a little anxious standing so close to her.[lb]";
	say "[if the tail is aphotic]A sandbag[em]the one I recently used to travel here[em]dangled overhead[dot][otherwise]The dinosaur's thick, scaly tail extended to the floor, as if it were reaching toward Gruecilla and the Gruemobile[dot]";
	
the dinosaur head is proper-named.

part 2 (things)

chapter 1 (the tail)

[note that I don't try to simulate the dinosaur's body. the head and tail are not "parts" of a dinosaur. These are all standalone scenery.]

the tail is scenery in the dinosaur head.
the printed name of the dinosaur tail is "giant lizard[']s tail".
understand "dino/ dinosaur / lizard / lizard's / tail" as the dinosaur tail.
the description of the tail is "[if the tail is not aphotic]Below me, the dinosaur's long, scaly back ended in a long, scaly tail. Dinosaurs must have been pretty scary! I wouldn't climb [down] it, but perhaps something else could climb [it]up[rt] it.[otherwise]The tail lay expansively on the floor of the stage, and Gruecilla reclined there, safely within the darkness of the Aughtlight.[first time] I wouldn't say that she waited patiently, not exactly, but she waited all the same.[only][end if]".

chapter 2 (the head)

the schead is a scenery backdrop.
the schead is in endgame.
the printed name of the schead is "[if the location is not egladder]giant lizard's head[otherwise]dinosaur".
understand "dino / dinosaur / lizard / lizard's / head" as the schead.
the description of the schead is "[if the location is the dinosaur head and the Gruemobile is aphotic]That giant lizard had a big mouth and long teeth. It could have gobbled a cat in one gulp, even if that cat was as fierce as I am.[otherwise if the location is the dinosaur head and the tail is aphotic]The dinosaur's head stood high above its tail, where Gruecilla reclined in the dark.[otherwise if location is the plank and schead is aphotic]Gruecilla's white outline crouched atop the dinosaur's head, her forelimbs and wrists dangling over her knees. She was turning her head rapidly, as if searching out an escape route.[otherwise if schead is not aphotic and location is plank]Gruecilla was looking and gesturing in the direction of the head. Was that the next step for her?[otherwise if the location is egladder]I never could have imagined that I'd be able to look a dinosaur in the eye! This was some adventure.".

[the mouth is just another one of those annoying things that comes up that people very reasonably expect to interact with. so my strategy is just to minimize effort while hopefully giving the players something worth reading.]

scmouth is part of schead.
understand "dinosaurs/dinosaur/-- mouth" and "white/-- teeth" and "white/-- fangs" as the scmouth.

the description of the scmouth is "[unless the location is dinosaur](from a distance)[lb][end if]An open mouth with long, white teeth. I admired the length of its fangs, though it would be hard for a cat to do much with them."

the printed name of scmouth is "dinosaur mouth".
	
instead of doing anything other than examining to the scmouth:
	if the location is not the dinosaur head:
		say "So long as I was stuck on this ladder, [action name part of the current action] the dinosaur's mouth was out of the question.";
	otherwise:
		say "(instead [action name part of the current action] the dinosaur's head)";
		now the noun is the schead;
		try the current action;

chapter 3 (the vent)

[the vent is just something to look at, the "real" vent is above on the plank]

the vent is scenery in the dinosaur head.
understand "white/-- metal/-- vent/lid/door/panel/grate" as the vent.

the description of the vent is "A large grate[em]large enough for D to fit through[em]was nearby. It might be openable, but that wasn't something I could check with my little paws.".

the printed name of the vent is "grate".

chapter 4 (the left sandbag)

the left sandbag is scenery in the dinosaur head.
the printed name of the left sandbag is "lowered sandbag".
understand "lowered / sandbag / bag" as the left sandbag.

the description of the left sandbag is "Covered in cat-friendly canvas cloth, the sandbag dangled within jumping distance."

instead of directing transit to the left sandbag:
	try jumping to the noun.
	
chapter 4 (skylight)

[initially the skylight could be interacted with, but I removed it from descriptions and deleted the "understand" phrases.]

egskylight is a scenery backdrop.
egskylight is in dinosaur head.
egskylight is in plank.

instead of doing something to egskylight:
	say "The skylight was more memory than thing. It opened after I jumped on the right sandbag, and closed when I jumped on the left one. Since it was fully closed, I could see no sign of it."

part 3 (actions)

Book 4 (cat behavior)

[back for more cat behavior. lots to do!]

chapter 1 (meowing)

instead of meowing at when the location is the dinosaur head:
	if the noun is the schead or the noun is the tail or the noun is the vent or the noun is the left sandbag or the noun is gruecilla:
		continue the action;
	otherwise if the noun is aphotic:
		continue the action;
	otherwise:
		say "[The noun] didn't seem a constructive path for Gruecilla.".

carry out meowing at the schead when the location is the dinosaur head:
	if the tail is not aphotic:
		say "[one of]'I'm not sure,' D called out, 'shouldn't we get you off of the dinosaur's head first? Maybe you could try meowing at a different part of it.'[or]I couldn't meow at the dinosaur's head while while I stood on it.[stopping]";
	otherwise:
		say "I thought that was a good idea, but I didn't want to share the dinosaur's head with Gruecilla. Maybe there there was a middle step I had missed.";
		
[this action is required to advance the story.]
		
carry out meowing at the tail:
	if the tail is aphotic:
		say "I felt there was more to say about the dinosaur tail. 'What's that, Marbles? Don't worry, I'm going to keep this Aughtlight pointed at the tail until you find your way someplace else. I won't let you down!'";
	otherwise:
		say "'Great idea! Maybe Gruecilla could escape through that grate over there!' D slowly swept the Aughtlight from the car to the dinosaur's tail, and Gruecilla's outline crawled, slid, sidled, and strolled along it. Once on the tail, she draped herself over it, limbs twitching. The off-kilter point atop her head swiveled like a slow-moving, inverted top.

		'OK, Marbles! I think we're pretty good at this! Let's keep going.'";
		now the Aughtlight delumines the tail.
		
carry out meowing at the vent:
	say "The white grate[em]I think humans call it a 'vent'[em]looked like a good place for Gruecilla to go[if the tail is aphotic], but I was in the way. I'd have to get off of this head first[otherwise]. I had a good feeling about it! If I could get Gruecilla to climb the dinosaur, she might be able to handle that grate[end if].".
	
carry out meowing at the left sandbag:
	say "There was no way for Gruecilla to get to the sandbag without climbing over me, and that didn't sound very nice. Besides, the sandbag looked like a good place for [it]me[rt] to go."
	

chapter 2 (scratching)

instead of scratching when the location is the dinosaur head and the noun is not the schead:
	say "The giant lizard was a desert of scratchability, and [the noun] offered no relief."

carry out scratching the schead:
	if dinosaur is scratched or schead is scratched:
		say "I looked at the dinosaur with satisfaction. Despite its hard surface, I managed to scratch it! I gave it a little celebratory rake.";
	otherwise:
		say "I had managed to mark it with my keen and lethal claws. Anyone who saw these scratches would know that I, Marbles, had passed this way.".
	
chapter 3 (biting)

instead of biting something in the dinosaur head:
	if biting the schead:
		say "The dinosaur head didn't fit in my mouth. Such was its path to durability.";
	otherwise:
		say "As much as I enjoyed biting, [the noun] was not a safe option. I was not sure about the taste, either.".
		
chapter 4 (hissing)

instead of hissing at something in the dinosaur head:
	say "Was the pressure getting to me? I don't think so. Did I think that [the noun] could have pitched in and helped a bit more? Absolutely."
	
chapter 5 (marking)

instead of marking something in the dinosaur head:
	if marking the schead:
		say "I couldn't get a good angle while standing on the head of the dinosaur.";
	otherwise:
		say "While I hoped that passers-by might detect my scent, marking [the noun] was simply impossible from where I was."
		
chapter 6 (jumping to)

instead of jumping to the left sandbag when the tail is not aphotic:
	say "The jump offered no obvious challenge. However, I needed to keep Gruecilla moving. Once I had her in the right position, I might consider it.".

carry out jumping to the left sandbag when the tail is aphotic:
		say "I leapt toward the bag, once again sinking my claws in thick canvas. There was no lurch this time; the bag was at its lowest point. Instead of trying to cross the stage once more, I scrambled upward to a narrow plank suspended high above the stage. Although the jump was easy, the stakes[em]and elevation[em]were higher this time.";
		move the player to the plank;
		move gruecilla to the plank;
		move the Gruemobile to the plank;
		
instead of directing transit to the left sandbag:
	try jumping to the noun.
		
instead of jumping to something in dinosaur head:
	if the noun is the left sandbag:
		continue the action;
	otherwise if the noun is the tail:
		try going down;
	otherwise if the noun is schead:
		say "I had already leapt to the dinosaur's head. Cats have a knack for being where we need to be.";
	otherwise if the noun is the vent:
		try directing transit to the vent;
	otherwise:
		say "I'd never be able to get that grate opened. Don't you know that opening things is a sore subject for cats? Besides, don't you think that the vent might be a good place for Gruecilla to go?";
		
chapter 7 (pawing)

instead of pawing something when the location is the dinosaur head:
	if the noun is schead:
		continue the action;
	otherwise:
		say "I was stuck on the dinosaur head, and [the noun] was beyond a safe pawing distance.";
	
carry out pawing the schead:
	say "I rapped the dinosaur's head with my hard and sharp claws. What a satisfying clicky-clack!".
	
section 8 (smelling)

instead of smelling something when the location is the dinosaur head:
	if the noun is the dinosaur head:
		continue the action;
	if the noun is schead:
		try smelling the dinosaur head;
	otherwise:
		say "Other than a distinctively gruesome smell, there were no interesting odors fit for smelling from atop the dinosaur's head.";
	
carry out smelling the dinosaur head:
	say "Smells of hard plastic and wood were nearly eclipsed by the smell of Gruecilla, who waited nearby. I'm not saying she smelled bad, OK? She was distinctive.".
	
section 9 (listening)

carry out listening to the dinosaur head:
	say "Gruecilla gurgled softly nearby, and the Aughtlight continued to buzz and crackle within the Aughtlight booth."
	
instead of listening in the dinosaur head:
	if the noun is the dinosaur head:
		continue the action;
	otherwise if the noun is schead:
		try listening to the dinosaur head instead;
	otherwise if the noun is gruecilla:
		continue the action;
	otherwise:
		say "From where I stood, I couldn't be sure if [the noun] was making any noises.".
		
carry out listening to gruecilla in the dinosaur head:
	say "It was easy to make out the familiar sound of Gruecilla's gurgling from atop the dinosaur.";
		
section 10 (grooming)

instead of grooming the tail:
	if the tail is not aphotic:
		try grooming the schead;
	otherwise:
		say "The magical darkness did far more for the tail's appearance than my tongue ever could.".
		
instead of grooming the vent:
	say "The grate was beyond reach and had in store a nobler destiny."
	
instead of grooming the left sandbag:
	say "There was no way, mechanically, for me to groom the sandbag, so there was no need to regard grooming it as a possibility."

book 5 (other)

[more navigation management. it's interesting, limiting the parser is very high effort if we are committed to recognizing the limitation consistently. navigation is the same way, going nowhere can be very high effort.]

instead of going in dinosaur head:
	if going down:
		say "[if the tail is aphotic]Gruecilla seemed like a nice grue, but I thought we should maintain healthy boundaries. Besides, even though cats can see in the dark, Aughtlights and grues were a whole different can of tuna, so to speak.[otherwise]While it wouldn't be physically difficult to climb down there, I thought I should focus on leading Gruecilla [it]up[rt]. Going down to the floor with her wouldn't help either of us.";
	otherwise if going up:
		say "I was already at the top of the dinosaur, and the plank overhead was out of reach. I could probably [oc]JUMP TO THE SANDBAG[cc], then make my way from there[dot][unless the tail is aphotic][pb]Even if the the jump looked easy enough for a skilled cat to make, I couldn't leave the dinosaur's head before I had found a path forward for Gruecilla.";
	otherwise if going nowhere:
		say "There weren't a lot of places to go, especially since I wanted to stay off of the stage floor. The grate was nearby, but I had no way to open it. A kind of plank or walkway was overhead, but it was out of reach. As a capably agile cat, I could easily jump to the nearby sandbag, then improvise from there.";
		
before directing transit to the tail:
	try going down instead.
	
instead directing transit to the vent:
	say "The grate was a barrier embedded in a sheer human wall. Someone or something else might be able to get in there, provided they had thumbs or else a thumb-like capacity."

book 3 (the plank)

[a very small space, in terms of both geography and possibility. Even cat behaviors are cut off. we are reaching the narrow exit of our "cave game's" cave.]

part 1 (the room)

the plank is a room.
plank is in endgame.
the printed name of the plank is "Platform Above the Stage".
the description of the plank is "While height can mean safety, it can also be a trap. The plank, whatever it was, did not promise safety. It promised little, in fact, as a plain wooden platform suspended a fatal distance above the floor.

The sandbag dangled awkwardly below, so there was no safe return via that route. Below the bag remained the toothsome dinosaur. To its side, a white grate was affixed to a wall."

plank is proper-named.

part 2 (things)

chapter 1 (the tightrope)

the tightrope is scenery in the plank.
understand "tight / rope" as the tightrope.
the description of the tightrope is "A very thick rope[em]possibly thick enough for my tiny cat feet[em]ran from one side of the stage to another. It seemed to be meant for some strange human activity, something that involved hands.".

chapter 2 (the escape)

the escape is scenery in the plank.
the printed name of the escape is "white metal grate".
understand "white / metal / vent / grate" as the escape.
the description of the escape is "A white metal grate was embedded in the wall just below me. Perhaps Gruecilla could get through there.".

chapter 3 (the fake sandbag)

the fsandbag is scenery in the plank.
the description of the fsandbag is "The sandbag was beyond reach, and the angle was too difficult for jumping.".

understand "lowered / sandbag / bag" as the fsandbag.
the printed name of the fsandbag is "left sandbag".

chapter 4 (the frobozz magic grue repellant)



the plastic bottle is in the plank.
the description of the plastic bottle is "A container made of human plastic. It had a black label with white letters, but I don't know what it said. Cats can't read, and there's nothing wrong with that! The bottle stood[em]rather precariously[em]at the edge of the plank."

understand "plastic / container" as the plastic bottle.

instead of doing anything with the plastic bottle when the plastic bottle is gone:
	say "The bottle may have bounced out of sight, but its memory endures even now."

the plastic bottle can be present or gone.
the plastic bottle is present.

section 1 (the label)

the BL is part of the plastic bottle.
understand "black / label" as the BL.
understand "white / letters" as the BL.

the description of the BL is "I think I can read it! The letters say 'scritchy sritchy scratch scratch scratch.'";

instead of doing anything other than examining with the BL:
	say "(the plastic bottle)[command clarification break]";
	now the noun is the plastic bottle;
	continue the action;

part 3 (cat behavior)

chapter 1 (meowing)

[this action is required]

carry out meowing at the schead when the location is plank and the tail is aphotic:
	say "Now that I had found a way off the dinosaur, D and I should show Gruecilla how to reach the dinosaur's head! I let D know what I thought. 'Great idea! Maybe we can lead Gruecilla to that grate!' D once again guided Gruecilla, using the power of the Frobozzco Magic Aughtlight, and she slithered and sidled up the dinosaur's back.";
	now the Aughtlight delumines the schead;
	
instead of meowing at the schead when the location is plank and the schead is aphotic:
	say "'Hey Marbles!' D called out, 'I've already pointed the Aughtlight at the dinosaur's head. Everything's going great!'";
	
	
carry out meowing at the fsandbag:
	say "I was pretty sure that Gruecilla could make it to the sandbag, but I wanted to lead her out of here, not to me.".
	
[this is the second required action on the plank.]

carry out meowing at the escape:
	if the schead is aphotic:
		say "This was it! I took a deep breath, pushed out my chest, and meowed with all my might. 'OK, Marbles! Here we go!' D pointed at the grate, and Gruecilla leapt, sinking her claws into the wall. Next came a sound of bending and tearing. The grate fell out of the Aughtlight's beam, suddenly visible as a crumpled wad of white metal. What was left of the grate landed on the floor with a distant clank.

Gruecilla turned to me, waving. For a moment, I could see the profile of her head: open mouth, pointed head. I gave a friendly chirp. She was, after all, a fellow beast. And then she was gone, silently going wherever the the space beyond the grate might lead.

'Wow, Marbles! I guess that's it! But how do you suppose[em]'

And then, a loud 'pop' from the Aughtlight, followed by a whoosh and a crack overhead. The lights went out, and, just like that, the theater was as silent and as dark as any cave. I couldn't see D or anything else.

And then, the sound of opening doors: the exit doors were open. Were those one-way doors? What a devious human invention! I looked, sighting a terrible sight: two white silhouettes, slinking in the darkness. D, I knew, saw them, but he somehow managed to remain silent. What a brave boy!

And then, my eyes adjusted. The smallest bit of light poked through the window above. It wasn't enough to scare a grue, but I could at least see the tightrope ahead of me.";
		now gruecilla is nowhere;
		now the Aughtlight delumines the escape;
		say line break;
		say cat prompt;
		now the current scene is escape the theater;
		let N be the number of filled rows in the source of status information;
		set statusbar height to N;
		now the Aughtlight delumines nothing;
		now the egbeam is nowhere;
		now the Aughtlight is switched off;
	otherwise:
		say "I needed to help Gruecilla get closer to the grate first.".
		
instead of meowing at something in the plank:
	if the noun is gruecilla or the noun is the escape or the noun is schead:
		continue the action;
	otherwise:
		say "That wasn't a way out. Looking around, I wondered where Gruecilla might go next.".
		
instead of performing cat behavior in the plank:
	if meowing at or jumping to:
		continue the action;
	if grooming marbles:
		say "Even though grooming could calm a troubled cat, it wouldn't have a lasting effect this high above the floor.";
	if the plastic bottle is the noun:
		continue the action;
	otherwise:
		say "The platform was no cat tree, that's for sure! However, the nearby plastic bottle held promise."
		
		
chapter 2 (jumping to)

instead of jumping to the tightrope:
	say "The jump looked possible, but it was far too dangerous to attempt without a compelling reason.";
		
instead of jumping to the fsandbag:
	say "The sandbag was straight down, and under the plank. It was an impossible jump.".
	
instead of jumping to the vent:
	say "Although the grate was within jumping distance, it was closed. My little paws couldn't open it! Gruecilla might have better luck with it.".
	
instead of jumping to escape:
	say "The angle was all wrong, and the grate was closed. We cats are bad at opening things, everybody knows that.".
	
instead of jumping to the the plastic bottle:
	say "Even though the bottle could use a good pouncing, it was too close to the edge of the platform. And thus, it escaped my wrath."
	
chapter 3 (grooming)

instead of grooming the escape:
	say "No. I couldn't get to it from there, and besides, the grate was meant for someone else."
	
instead of grooming fsandbag:
	say "There was little to do there and far to fall, there at the end of my little tale. The sandbag remained ungroomed."
	
carry out grooming the plastic bottle:
	say "I gave the bottle an experimental lick. It had that familiar nothing taste of plastic, but underneath it was a faint and curious savor: an old, sweaty sock, perhaps? Cats occasionally enjoy finding an old, balled-up sock under a bed or couch. A smooth surface combined with the features of an old sock? Brilliant!";
	
chapter 4 (going)

instead of going in plank:
	if going down:
		say "Cats do not care for vertical jumps. We are forward-leapers and pouncers, such is our art. There was no safe way down and, since Gruecilla had not yet escaped, no reason for going down.";
	otherwise if going up:
		say "It didn't get any higher than this, fortunately.";
	otherwise if going east:
		say "The tightrope was directly to the east, but the jump made me a bit nervous. Not that I was afraid, mind you, but you shouldn't mistake my bravery for foolishness!";
	otherwise:
		say "The plank offered no easy or obvious way out.";


instead of doing something in the plank when the current action involves the careyes or the current action involves the Gruemobile:
	say "I was so far above the stage that I could barely stand looking down at [the noun]."
	
chapter 5 (scratching)

instead of scratching the plastic bottle:
	try pawing the plastic bottle;
	
chapter 6 (biting)

carry out biting the plastic bottle:
	say "Holding the bottle with my forepaws, I pressed my teeth against the plastic. What an excellent mouth feel! The bottle has a very faint taste reminiscent of an old sock under a couch. Very nice! Human containers in Zork are much better than the ones in D's house.

The bottle teetered dangerously when released but remained standing."
	
chapter 7 (hissing)

carry out hissing at the plastic bottle:
	say "For a brief moment, my feline composure faltered, and I hissed a long and frightful hiss at the plastic bottle. The bottle, however, did not react.";
	
chapter 8 (marking)

carry out marking the plastic bottle:
	say "Rubbing my side against the bottle, I declared it my territory and property. However, in doing so, I toppled it over the edge of the platform. After what seemed like a long time, I heard it bounce against the stage. Remarkable!";
	now the plastic bottle is gone;
	now the plastic bottle is undescribed;
	
chapter 9 (pawing)

carry out pawing the plastic bottle:
	say "Ah, yes, the temptations of things at the edges of things! I gave the bottle a gentle tap, and then another. It began to wobble. The excitement was too much, and I knocked the bottle over the edge with a firm and precise bat of the paw. Seconds later, the hollow sound of its bounce echoed through the theater. It was just one more accomplishment in the course of an accomplished day!";
	now the plastic bottle is gone;
	now the plastic bottle is undescribed;
	
chapter 10 (smelling)

carry out smelling the plastic bottle:
	say "The bottle was graced with the faint-yet-pleasant smell of old socks. What? Of course cats like that sort of thing! What self-respecting creature doesn't?".
	
chapter 11 (listening)

instead of listening to the plastic bottle:
	say "While the bottle made no noise, I might have been able to make some noise with it if I applied myself!";

book 4 (escape the theater)

part 1 (backdrops)

the climax is a region.

[there is not much left to do. empty rooms with ambient text, a timer. the end is four moves away]

when escape the theater begins:
	show toc 9;
	say "[lb][tab][bt]FINALE[rt]
[lb][tab][it]In Which a Cat's Mettle Was Tested[rt]

";
	move the player to cplank;
	now the grues is in climax;
	now big grue is in climax;
	now medium grue is in climax;
	
[scenery grues for the players to examine]

grues is a scenery backdrop in climax.
grues is a plural-named thing.
the description of the grues is "The grues[if small grue is nowhere], one bigger than the other[otherwise], large, medium, and small[end if], were far away (good!) and very close to D (really, really bad!).[if small grue is nowhere] I think they were one grue shy of what adventurers call a 'grue convention.'[otherwise] I think that it only takes three grues to make what adventurers call a 'grue convention.'".
understand "grues" and "grue/-- convention/family" as the grues.

the big grue is a scenery backdrop in climax.
the description of the big grue is "The big grue was physically imposing but no less flexible than its fellow grues. It seemed quite interested in a nearby scent.[unless small grue is nowhere] The big grue and its medium-sized counterpart seemed to be having an argument with the small grue (Gruecilla?).[end if]"

the medium grue is a scenery backdrop in climax.
the description of the medium grue is "The medium-sized grue was slender and rather agile-looking. Agility, as every cat knows, is a lethal armament. It seemed quite interested in a nearby scent.[unless small grue is nowhere] The medium-sized grue and its big counterpart seemed to be having an argument with the small grue (Gruecilla?).[end if]".
understand "medium-sized/medium-size/-- grue" as the medium grue.

the small grue is a scenery backdrop.
the small grue is nowhere.
understand "Gruecilla" as the small grue.
the description of small grue is "[one of]I'd recognize that pointy head anywhere! Even from the corner of my eye, I knew that the small one was Gruecilla. She[or]Gruecilla[stopping] appeared to be arguing with the larger grues. Was that her family? It seemed that everyone's fur was raised.".

Before doing something when the current action involves grues or the current action involves big grue or the current action involves medium grue or the current action involves small grue:
	if examining:
		continue the action;
	otherwise if performing cat behavior:
		continue the action;
	otherwise:
		say "The grues were far away, both fortunately and unfortunately.".
		
[just a generic backdrop in case someone uses "darkness" in a command. this is just being thorough. it's a dark space.]

cdarkness is a scenery backdrop.
cdarkness is in abovew.
cdarkness is in abovec. 
cdarkness is in abovee.
cdarkness is in cplank.
the printed name of cdarkness is "darkness".
understand "darkness" and "dark" as cdarkness.

the description of cdarkness is "It was dark in the theater, quite dark. It was unlikely D could see anything but the grues, thanks to the grue-sensitive eyeglasses. The faint light spilling in from above gave my sensitive cat eyes something to work with, but it wasn't much. I needed to get some more light in here."

instead of doing something other than examining when the current action involves cdarkness:
	say "Darkness was usually good for hiding and lurking, but it wasn't any help to me here.".
	
clight is a scenery backdrop.
clight is in climax.
the printed name of clight is "faint light from above".
understand "faint/-- light from/-- above/--" as clight.

instead of examining clight:
	try examining cdarkness.
	
instead of doing something other than examining when the current action involves clight:
	say "I couldn't do anything to the light directly, but if I was clever[em]as clever as usual, that is[em]I could find a way to let [it]more[rt] light in, making this theater a little less grue-friendly."

part 2 (deprecated)
	

Part 3 (the rooms)

Chapter 1 (the final plank)

cplank is a room.
cplank is in climax.
the description of cplank is "A faint light illuminated the tightrope in front of me. A comfortable distance for a jump, but a terrible distance for a fall.[first time] It led to a space high above the opposite end of the stage.[only]".
the printed name of cplank is "Far Above the Stage".

the plank count is a number that varies.
the plank count is zero.

[while the ending is not completely on rails, the game isn't going to let the player kill D! after a few turns, Marbles will move forward to the next action/room. this should be more than enough time to examine things, there's not a lot to do here.]

every turn when the location is the cplank and the current scene is escape the theater:
	increment plank count;
	say "[one of]Across the auditorium to my right, I saw the outline of the two grues crawling, scootching, and slavering near the open exit doors.[or]One of the grues[em]smaller than the other[em]dropped to all fours and bobbed its head upward, as if smelling the air.[or]The larger grue began to slide down the aisle toward the auditorium, then stopped, looking left and right.[or]An unpleasant gurgle emerged from one or both of the grues.[or]I needed to stop pushing my[em]and D's[em]luck and get across the stage![or]I had delayed long enough. I hope you don't think I was too scared to jump. I wasn't![stopping]";
	if plank count is 6:
		try jumping to the ctightrope.

chapter 2 (things)

section 1 (the tightrope)

ctightrope is scenery in cplank.
the printed name of ctightrope is "tightrope".
the description of ctightrope is " It was within jumping distance, but landing correctly would be very tricky. Still, I was a brave cat and hardly unfamiliar with tricky tricks.".
understand "tightrope / rope" as the ctightrope.


section 2 (the vent)

cvent is scenery in cplank.
understand "white/metal/-- vent" as the cvent.
the description of cvent is "We helped Gruecilla escape through the vent, but I didn't have time to celebrate!".
the printed name of cvent is "white metal vent".


section 3 (the fake sandbag redux)

csandbag is scenery in cplank.
the printed name of csandbag is "inaccessible sandbag".
understand "inaccessible/-- bag/sandbag" as csandbag.
the description of csandbag is "The sandbag dangled almost directly below me. It was an impossible jump, despite my knack for feline feats of agility."

chapter 3 (actions)

section 1 (meowing)


section 2 (jumping to)

carry out jumping to ctightrope:
	say "Going east would require a bit of a jump. A risky one, certainly, but there's a kind of situation I like, a bad situation usually, where it's so clear what one must. You can't even worry or think about it, you can only act. This is a cat's best life, a life of action, of certainty. I didn't know if I could get across that rope, but I absolutely knew that I would attempt the leap. If I made it, I would run. Run until I either fell or else jumped again.

Crouching, I gave my back end a little shake, then leapt for the tightrope.

My landing was shaky, and the rope wobbled underneath my little paws.

Even though I couldn't really turn my head, I saw movement near the entrance: a third, smaller grue! Was that Gruecilla?";
	move small grue to climax;
	move the player to aboveW.

carry out jumping to csandbag:
	try examining csandbag instead.
	
carry out jumping to cvent:
	say "Even though the vent was open, the jump was impossible from my perch above the plank. Besides, how could I keep an eye on D from inside a wall?"
	
[very narrow possiblities at this point. there's a craft idea that endings are best linear and short. I lean into that.]

instead of performing cat behavior when escape the theater is happening:
	if jumping to ctightrope:
		continue the action;
	otherwise if jumping to the skylight:
		continue the action;
	otherwise if meowing at something:
		say "This was not a time to be talking to D! He was hiding from grues, a very serious form of hiding. A challenge fit for cats, not humans.";
	otherwise if hissing at something:
		say "I'm not sure whether the grues would hear me or not, but I couldn't save D if I caught their attention.";
	otherwise:
		say "All of my cat training had prepared me for this moment, but I could not train anymore. The feline felicity at my disposal was my natural gift for [oc]JUMPing[cc].".
	
section 3 (going)
	
instead of going in cplank:
	if going down:
		try jumping to csandbag;
	if going east:
		say "If I wanted to go east, I had to [oc]JUMP TO THE TIGHTROPE[cc].";
	otherwise:
		say "The only way was a rope just east of here, just a jump from here to there.";
		
chapter 2 (the tightrope geography)

[I've added a "forward" action, since that's part of the tightrope descriptions]

forwarding is an action applying to nothing.
understand "forward" as forwarding.
understand "go forward" as forwarding.

instead of forwarding:
	if escape the theater is not happening:
		say "I couldn't figure out which way was forward from there. Maybe trying a direction or trying to [oc]GO TO something or somewhere[cc] might be better.";
	otherwise:
		try going east;
		
section 1 (the west end of the tightrope)

Wrope count is a number that varies.
wrope count is zero.
		
every turn when the location is aboveW:
	increment wrope count;
	say "[one of]Gruecilla seemed to be communicating with the larger grues. They all appeared to be gurgling and hissing.[or]Gruecilla waved a limb above her head, then pointed to the stage, slavering loudly.[or]A flurry of gurgles emerged from the grue convention, and it sounded like an argument.[or]I couldn't afford to stay there any longer, so I ran [oc]EAST[cc] just as fast as I could.[stopping]";
	if wrope count is four:
		try going east.

aboveW is in the climax.
the printed name of aboveW is "High Above the Theater".
the description of aboveW is "The tightrope wobbled dangerously under my feet.

There was no way back; I could only run forward and [oc]EAST[cc].".

aboveW is proper-named.

the skylight is in aboveW

instead of going in aboveW:
	if going down:
		say "That drop was enough to do any cat in, no matter their number of lives.";
	otherwise if going east:
		continue the action;
	otherwise:
		say "The rope was too narrow for turning and too wobbly for standing. I could only run forward and [oc]EAST[cc].";

section 2 (the middle of the tightrope)

crope count is a number that varies.
crope count is zero.
	
every turn when the location is aboveC:
	increment crope count;
	say "[one of]Gruecilla stood between the grues and the ladder leading up to the Aughtlight booth, waving her limbs.[or]One of the grues hissed loudly.[or]The medium-sized grue stood between Gruecilla and the larger grue. A soft, almost musical burble filled the air.[or]How had I dawdled there so long! I hurried east.[stopping]";
	if crope count is four:
		try going east.

aboveC is in the climax.
aboveC is east of aboveW.
the printed name of aboveC is "High Above the Theater".
the description of aboveC is "I was at the center point of the tightrope, which bounced under my paws.

There was no way back; I could only run forward and [oc]EAST[cc].".

abovec is proper-named.

the skylight is in aboveW.

instead of going in aboveW:
	if going down:
		say "That drop was enough to do any cat in, and D needed saving.";
	otherwise if going east:
		continue the action;
	otherwise:
		say "The rope was too narrow for turning and too wobbly for standing. I could only run forward and [oc]EAST[cc]."
		
section 3 (the east end of the tightrope)

erope count is a number that varies.
		
every turn when the location is aboveE:
	increment erope count;
	say "[one of]Gruecilla leapt to the ladder, which she clung to with three of her claws. Using the fourth claw, she took a remarkably cat-like swipe at the large grue.[or]Gruecilla turned and waved at me, as if bidding me to hurry.[or]The largest grue began walking and sliding and slithering toward Gruecilla. It had seemed dangerous all along, but its dangerousness was expanding like the tail of a startled cat.[or]I don't know what had come over me, stalling like that! I jumped, hopefully in time to save D.[stopping]";
	if erope count is four:
		try jumping to the skylight.

aboveE is in the climax.
aboveE is east of aboveC.
the printed name of aboveE is "High Above the Theater".
the description of aboveE is "I reached the far end of the tightrope just as my balance had begun to falter. The sandbag swayed in the dark, empty air ahead and below. It looked like a dangerous jump.

The way was neither back nor forward, but through nothing to something.".

the skylight is in aboveE

abovee is proper-named.

instead of going in aboveE:
	if going down:
		say "I might have been able to make the [oc]JUMP TO THE SANDBAG[cc], but it would be a once-in-a-career leap.";
	otherwise if going east:
		continue the action;
	otherwise if going nowhere:
		say "I had reached the rope's end. My only path arced into the airy dark."

section 1 (the skylight)

[jump for it!]

the skylight is a scenery backdrop.
the printed name of the skylight is "[unless the player is in abovee]distant sandbag[otherwise]nearby sandbag".
understand "nearby / distant / sandbag / bag" as the skylight.
the description of the skylight is "[if the player is in abovew]The sandbag waited beyond the far end of the rope.[otherwise if the player is in abovec]Soon, the sandbag would be within jumping distance.

Maybe.

Hopefully.[otherwise]I had finally reached the place where I would jump. This was that place.".

to say pbag:
	say "[skylight]" in title case.

SCrope is a scenery backdrop.
SCrope is in aboveW.
SCrope is in aboveC.
SCrope is in aboveE.
understand "rope" as scrope.

instead of doing anything when the current action involves scrope:
	try looking.

part 5 (the big finish)

[the game-ending action]

carry out jumping to the skylight:
	if the location is not aboveE:
		say "I might be able to use that sandbag to get some light in here. But I had to cross that crazy tightrope first.";
	otherwise if the location is aboveE:
		say "I crouched, then sprang in the direction of the sandbag. It was a long way forward and down from the rope!




[bt]Thin Air[rt]
[lb]I was sailing through the air, high above the floor. The bag waited ahead and below, and I reached forward, stretching my forelimbs as far as they would go.



";
		say cat prompt;
		say "[bt]Near the Sandbag[rt]
[lb]I was close, very close! Extending my claws, I grabbed for the canvas...



";
		say cat prompt;
		say "[bt]The Sandbag[rt]
[lb]I barely reached the sandbag, snaring it with one claw and then pulling myself to it. The window overhead lurched open, flooding the stage with light. I looked up to see the white outline of the grue family[em]they seemed very much like the human families I had seen[em]slither into a nearby vent.

'Gosh, Marbles, you did it!' D said, making his way to the stage. 'Let's get you down from there. I think I can reach you from the ladder.'

Moments later, we were making our way through the still-open entry doors. 'I guess it makes sense that grues have families. Everybody does.' D paused, frowning. 'Gruecilla is a grue in a grue family, and that's just how it is. She can't decide.' I didn't say anything. Sometimes, you had to let D work through things. He was a sensitive boy.



";
		say cat prompt;
		say "[bt]The Guild Hall[rt]
[lb]'...and that's exactly how it happened!' I say, taking a bite of fish. 'I grabbed the sandbag and held on with desperate desperation! Thanks to my added weight, the window opened slowly and agonizingly! Would it be too late? Had I saved D in time? Thank goodness the light drove the grues away! D was obviously shaken, poor kid, but I knew everything would be OK. We've always been lucky, the two of us.'

Loretta, Guildmaster Fweep's familiar, looks at me with wide eyes. 'Can you believe it?' I say. Loretta doesn't answer, as she's more of a listener. There's nothing wrong with that; lots of cats are listeners. 'Well, anyway, it was all in a day's work. We're adventurers, after all, and we travel all the way from Hot Springs, Arkansas, to explore Zork and solve its problems. Here, the world is deadly but fair, and we wouldn't have it any other way.'

Loretta stuffs some grapes in her mouth, her unblinking orange eyes staring at me all the while. Cats, a refined species, know how rude it is to stare, but when it comes to primates, we remain philosophical. After all, we cats wouldn't be so special if everyone and everything knew the world as well as we do.

Down the table, D was talking and laughing with Guildmaster Fweep and Elizabar, highest-ranking Enchanter in the Thriff Guild. It's good to see him like this. I wish I could keep us here forever, but cats[em]while magical[em]wield no magic of our own. Nevertheless, for now there is laughter, warmth, and fish. 

'Let us celebrate!' I call out, 'I salute Loretta and Guildmaster Fweep and Enchanter Elizabar and Gruecilla and yes, especially and sincerely yes, D, a fine human boy.' I raise a paw in tribute. 'To bravery in the dark, and to braving the light. To friendship.'

And the cheers fell over the table from all around.";
		end the story finally saying "We Made It to Dinner in Time";
	otherwise:
		say "sheesh, what a bug! I bet Drew Cook will be pretty embarrassed, huh?";
	now the description of abovee is "An enjoyable party at the Thriff Enchanter's Guildhall.";
	now the printed name of aboveE is "A Celebration!".
		
[unlocks parts of the guide, based on ranking.

finishing the game: unlocks general questions
exemplary rank: unlocks Marbles interview
transcendant rank: unlocks cat pictures]

when play ends:
	show toc 10;
	if progress of Marbles is exemplary:
		show toc 11;
	if progress of Marbles is transcendent:
		show toc 11;		
		show toc 12;
		
		
book 5 (the final question)

[just a couple of tweaks to the final question options]

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"review Marbles's REPORT card"	true	"report" or "score"	report card rule	--
"visit the [oc]HELP[cc] system ([bt]Updated[ex][rt])"	true	"help" or "guide" or "reference"	help menuing rule	--
		
Volume 7 - accessibility and help

[lots of informational texts as well as all tables for the menu system]

when play begins:
	now mn_master_table is table of cat information;
	
to say gameplay:
	say "[bt]How to Play[rt]
 
The main character of [it]Marbles, D, and the Sinister Spotlight[rt] is a cat named Marbles. As a cat, she cannot perform actions requiring hands or several feet of height. In fact, the solutions to most problems involve 'cat behavior':

[tab][oc]MEOW AT [bk]something[cb][cc]
[lb][tab][oc]SCRATCH [bk]something[cb][cc]
[lb][tab][oc]BITE [bk]something[cb][cc]
[lb][tab][oc]HISS AT [bk]something[cb][cc]
[lb][tab][oc]GROOM [bk]something[cb][cc]
[lb][tab][oc]MARK [bk]something[cb][cc]
[lb][tab][oc]JUMP TO [bk]something[cb][cc]
[lb][tab][oc]PAW [bk]something[cb][cc]
[lb][tab][oc]PURR[cc]
[lb][tab][oc]SMELL [bk]something[cb][cc]
[lb][tab][oc]LISTEN TO [bk]something[cb][cc]

Examining is important, too!

These behaviors raise Marbles's ranking, too. Type [oc]SCORE[cc] to see her rank as well as requirements for advancing to the next rank. Achieving higher ranks will unlock new hint content and, at the highest level, pictures of Moxie, the inspiration for Marbles.

[bt]Other important commands:[rt]
[lb][tab][oc]HELP[cc]: view this work's custom help system.
[lb][tab][oc]NAVIGATION[cc]: reading the status line and getting around."

howing is an action out of world applying to nothing.
understand "commands" as howing.
understand "verbs" as howing.
understand "instructions" as howing.
understand "gameplay" as howing.

learning is an action out of world applying to nothing.

carry out howing:
	say gameplay.

navigating is an action out of world applying to nothing.

[I decided to print two different responses to navigation help based on advancement of the narrative]

understand "navigation" and "navigate" as navigating.

carry out navigating when rescue the grue has not happened:
	say navigation 1.
	
carry out navigating when experimental aughtlight has ended:
	say navigation 2.

to say navigation 2:
	say "[bt]Getting Around[rt]

Once D and I began using the Aughtlight, I could no longer just [oc]GO TO someplace[cc] (or something). I was stuck above the floor and would have to make my way slowly.

Fortunately, the status bar still showed points of interest that might help me progress."
	
to say navigation 1:
	say "[bt]Getting Around[rt]

In a large, open area, I could usually see or interact with things from a distance. If I wanted to travel to the stage, it was enough to [oc]GO TO CENTER STAGE[CC].

If I wanted to interact with or examine distant objects, I just had to say so:

[OC]MEOW AT THE BOX[CC] (whether the box was nearby or not).
[lb][OC]GO TO THE BOX[CC].
[lb][OC]EXAMINE THE BOX[CC] (since the box was visible from a distance, I would describe it as it appeared to me from where I stood).

Do you see that broad, dark band at the top of the screen? Even though it was full of people writing, I could tell that it contained some good places and things for cats to investigate. It changed whenever I made progress in my adventure, so I decided to keep a close eye on it!

[it]Note that the 'Important Landmarks' were not the only objects I could interact with! It might pay to explore, especially if I wanted to increase my cat ranking.

I could also [OC]FOLLOW D[CC] or [oc]GO TO D[cc], naturally. Someone had to keep an eye on him!

If I ever needed to review this information, I could request [oc]HELP[cc]."

to say hnavigation:
	say "[bt]Getting Around[rt]

In a large, open area, Marbles could usually see or interact with things from a distance. If she wanted to travel to the stage, it was enough to [oc]GO TO CENTER STAGE[CC].

If she wanted to interact with or examine distant objects, she only had to so:

[OC]MEOW AT THE BOX[CC] (whether the box was nearby or not).
[lb][OC]GO TO THE BOX[CC].
[lb][OC]EXAMINE THE BOX[CC] (since the box was visible from a distance, this was a view from her location).

Even though the dark band at the top of the screen was full of people writing, Marbles could tell that it contained some good places and things for cats to investigate.

[it]Note that the 'Important Landmarks' were not the only objects Marbles could interact with! It might pay to explore, especially if she wanted to increase her cat ranking.

Marbles could also [OC]FOLLOW D[CC] or [oc]GO TO D[cc], naturally. Someone had to keep an eye on him!

If she ever needed to review this information, she could find it by requesting [oc]HELP[cc].

At some points in the story, this sort of navigation is not possible. It will be clear when that is true."

catting is an action out of world applying to nothing.
understand "cat" as catting.

carry out catting:
	say cat.

to say cat:
	say "[bt]Cat Behavior and Cat Excellence[rt]

I'm a cat, obviously, and a rather impressive one at that. I'm sure you agree!

To maintain my skills and status, I needed to do the things that cats do. Some cat behaviors are performed for their own sake, while some help D and me with our adventures. 

Most of these were just for fun! I didn't need to tire myself out trying everything on everything. 

[OC]MEOW AT [bk]something[cb][cc]: talk to D about something.
[lb][oc]SCRATCH [bk]something[cb][cc]: use my natural weaponry.
[lb][OC]BITE [bk]something[cb][cc]: give something a light fanging.
[lb][oc]HISS AT [bk]something[cb][cc]: express my displeasure.
[lb][OC]GROOM [bk]something[cb][cc]: try to improve or maintain appearances.
[lb][OC]MARK [bk]something[cb][cc]: apply my appealing feline scent; assert ownership.
[lb][OC]JUMP TO [bk]something[cb][cc]: jump on something that can bear my weight.
[lb][OC]PAW [bk]something[cb][cc]: give something a little slap. Usually but not always playful.
[lb][OC]SMELL[cc]: smell the general area.
[lb][OC]SMELL [bk]something[cb][cc]: smell something specific.
[lb][OC]LISTEN[cc]: listen to the general area.
[lb][OC]LISTEN TO [bk]something[cb][cc]: listen to something specific.

If acts of feline fundamentals do not advance a story, then they count as practice. Practice increased my cat ranking, so I needed to be diligent!

I could check my progress at any time with the [oc]SCORE[cc] command.

D says that there is more information in the [oc]HELP[cc] system, but that they might contain light spoilers. I don't know what that means!"

to say cat2:
	say "[bt]Cat Behavior and Cat Excellence[rt]

As an impressive and excellent cat, Marbles maintains her skills and status by doing the things that cats do. Some cat behaviors are performed for their own sake, while some help Marbles progress through her adventures. 

Since some actions are just for fun, Marbles never challenged herself to try everything on everything. She could get a top rank without going that far.

[OC]MEOW AT [bk]something[cb][cc]: talk to D about something.
[lb][oc]SCRATCH [bk]something[cb][cc]: employ natural weaponry.
[lb][OC]BITE [bk]something[cb][cc]: give something a light fanging.
[lb][oc]HISS AT [bk]something[cb][cc]: express displeasure.
[lb][OC]GROOM [bk]something[cb][cc]: try to improve or maintain appearances.
[lb][OC]MARK [bk]something[cb][cc]: apply an appealing feline scent; assert ownership.
[lb][OC]JUMP TO [bk]something[cb][cc]: jump to or on something.
[lb][OC]PAW [bk]something[cb][cc]: give something a little slap. Usually but not always playful.
[lb][OC]SMELL[cc]: smell the general area.
[lb][OC]SMELL [bk]something[cb][cc]: smell something specific.
[lb][OC]LISTEN[cc]: listen to the general area.
[lb][OC]LISTEN TO [bk]something[cb][cc]: listen to something specific.

If successful acts of feline fundamentals do not advance the story, they might increase Marbles's cat ranking.

Marbles could check her progress at any time with the [oc]SCORE[cc] command. This would reveal requirements for Marbles's next rank.

[it]The last item in this section, 'HINTS! I've been looking and looking, but there's one behavior that does not seem to work anywhere!' contains spoilers.[rt]"

[I combined the built-in Version feedback with my own credits. I also added the Quixe terp information, since I removed it from the web page template]

understand the command "version" as something new.
understand the command "about" as something new.

abouting is an action out of world applying to nothing.
understand "credits" as abouting.
understand "about" as abouting.
understand "version" as abouting.


carry out abouting:
	follow the announce the story file version rule;
	say "Quixe interpreter by Andrew Plotkin

The completion of [it]Marbles, D, and the Sinister Spotlight[rt] was tricky business! That Drew Cook guy is pretty grateful to the humans who helped 'test this game,' whatever that means:

Adam Biltcliffe, arlo, N. Cormier, Garry Francis, Hidnook, Emery Joyce, Mathbrush, Dana Montgomery, Petter Sjölund, and Brett Witty.

Max Fog and Tabitha O'Connell played this game a whole lot! More than anybody! That was pretty nice of them >^-^<

Callie Smith made the pretty art. I like it a lot, and Drew Cook seems to like [it]her[rt] a lot.

Thank you for having an adventure with us!".


	

Book 1 - help and hints

[this disables book mode in the menu system, since it skips hint-formatted material]

when play begins:
	now mn_modes_allowed is "menu only".
	
[I had to mess around with the typical behavior for starting the menus/help menu code so that everything would look OK with my custom status line. I've learned that supporting mobile requires commitment; anything other than vanilla formatting will probably involve a bit of tweaking.]

understand the command "help" as something new.
understand the command "hint" as something new.
understand the command "guide" as something new.

checking the guide is an action out of world applying to nothing.
understand "help" or "hint" or "hints" or "guide" as checking the guide.
	
Carry out checking the guide (this is the help menuing rule):
	carry out the displaying activity;
	clear the screen;
	if mobile is false:
		now right alignment depth is 23;
	otherwise:
		now right alignment depth is 16;
	say paragraph break;
	try looking;
	
content checking is true.
			
available content is the table of marbles content.
content checking is true.
	
table of marbles content
index	availability	note
1	true	"how to play"
2	true	"hint prologue"
3	false	"hint inspect the box"
4	false	"hint the bag"
5	false	"hint meow grue"
6	false	"hint find the Aughtlight"
7	false	"hint try the Aughtlight"
8	false	"hint rescue gruecilla"
9	false	"hint escape"
10	false	"general questions"
11	false	"questions for Marbles"
12	false	"photos"

[standard help menu stuff from here. the extension documentation for Menus and Basic Help Menu explain everything]

			
table of cat information
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"How to Play"	table of instruction	--
"Hints: Prologue"	table of prologue hints	--
"Hints: After Flipping the Switch"	table of inspection hints	--
"Hints: After Examining the Gruequarium"	table of bag hints	--
"Hints: After Telling D about the Bag"	table of grue hints	--
"Hints: After Discovering Gruecilla"	table of spotlight hints	--
"Hints: Experimenting with the Aughtlight"	table of Aughtlight hints	--
"Hints: Gruecilla"	table of gruecilla hints	--
"Hints: Yikes!"	table of yikes hints	--
"General Questions (NEW!)"	table of GQs	--
"BONUS: Questions for Marbles (NEW!)"	table of MQs	--
"BONUS: Cat Tax (NEW!)"	table of images	--	


	
table of instruction
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"Gameplay Commands"	--	"[gameplay]"
["The Tutorial System"	--	"[tutorial]"]
"Navigating the Theater"	--	"[hnavigation]"
"Scoring and Ranking"	table of achievement	--

table of achievement
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"Marbles's scoring and ranking (read first)"	--	"[cat2]"
"Please explain the scoring system in greater detail (spoiler-free)"	table of hinting	"Marbles earns points for behaving like a cat."
"hint"	--	"If you look at the play instructions (either in these help menus or via the [oc]GAMEPLAY[CC] command), you'll find a list of cat behaviors."
"hint"	--	"Look at Marbles's [oc]REPORT[cc] card or type [oc]SCORE[cc] for a detailed breakdown of Marbles's activities."
"hint"	--	"The [oc]REPORT[cc] card also displays the requirements for achieving the next rank."
"hint"	--	"Successfully performing cat behaviors that do not advance the story will earn points. If it's part of a puzzle solution, then it's not worth any points."
"hint"	--	"Actions must be at least close to successful. For instance, trying to scratch a diamond wouldn't be worth any points, because it is too hard to scratch."
"hint"	--	"Just keep an eye on your [oc]SCORE[cc], and you'll probably know what to do."
"I don't understand how things get unlocked. (spoiler-free)"	table of hinting	"Each rating or grade has specific requirements listed on the [oc]REPORT[cc] card."
"hint"	--	"The starting grade is PASSING, which unlocks this 'General Questions' section of the help menu."
"hint"	--	"EXEMPLARY rank unlocks an interview with Marbles."
"hint"	--	"The highest tier, TRANSCENDENT, reveals a photo gallery featuring Moxie, the real-world inspiration for Marbles."
"I want to see everything ranking up. (spoiler-free)"	table of hinting	"Well, you can always look at the source code for the interviews. I'll publish that as soon as Spring Thing is over."
"hint"	--	"That doesn't help with the pictures, I know."
"hint"	--	"Ultimately, players must decide between saving five minutes and seeing the pictures."
"HINTS! I've been looking and looking, but I'm missing something! (spoilers)"	table of hinting	"There are two actions that are very limited in terms of where or how they can be used."
"hint"	--	"When you think about it, you can probably understand why."
"hint"	--	"They involve Marbles's mouth. You'd be picky too, I hope."
"hint"	--	"The first one doesn't really require searching."
"hint"	--	"The second one is trickier, because Marbles has to find it."
"hint"	--	"If you have reached Act Six, you've missed it (a second chance 'mercy' object has been added to this version)."
"hint"	--	"If you haven't reached Act Three, you can't do it yet."
"hint"	--	"There's only one thing in the game that will fit in a little cat mouth."
"hint"	--	"The next hint just blurts out the answers!"
"hint"	--	"[oc]GROOM ME[cc] and [oc]BITE THE BAG[cc] (as a fallback, Marbles can [oc]BITE THE LADDER[cc] during the endgame, but the bag is the canon solution)."


book (hints)

	
table of prologue hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"What is Marbles supposed to do here?"	table of hinting	"Her friend D seems pretty interested in something."
"hint"	--	"The door."
"hint"	--	" You're more worried about the dark, though."
"OK, but how does Marbles actually do what she needs to do?"	table of hinting	"The best way to figure out what to do in parser games is to read the text. Sometimes carefully, sometimes not."
"hint"	--	"If Marbles uses the [oc]LOOK[cc] command, the room description will say something about a light switch."
"hint"	--	"After five turns, Marbles herself will mention the light switch."
"hint"	--	"To get D to look at something, just meow at it. In this case: [oc]MEOW AT THE LIGHT SWITCH[cc]." 

table of inspection hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"What is Marbles supposed to do now?"	table of hinting	"D seems pretty interested in something onstage."
"hint"	--	"Marbles can get to the stage by going [oc]NORTH[cc] (or just [oc]N[cc])."
"hint"	--	"Perhaps more elegantly, Marbles can [oc]FOLLOW D[cc]."
"hint"	--	"Marbles could also [oc]GO TO BOX[cc] (or just [oc]GO BOX[cc])."
"hint"	--	"Or [oc]GO STAGE[cc], [oc]GO TO CENTER STAGE[cc], or use a similar construction."
"hint"	--	"Notable places and things are listed in the status bar at the top of the screen."
"hint"	--	"In any case: Marbles needs to get to the stage."
"OK, I'm where I'm supposed to be. What am I supposed to do?"	table of hinting	"Marbles could [oc]SCRATCH THE DINOSAUR[cc]..."
"hint"	--	"Or [oc]SMELL THE LADDER[cc]..."
"hint"	--	"Such dalliances are a cat's prerogative!"
"hint"	--	"To advance the story, Marbles must [oc]EXAMINE THE BOX[cc]."

table of bag hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"What is Marbles supposed to do now?"	table of hinting	"It isn't immediately clear what Marbles is supposed to do."
"hint"	--	"Another important feature of many parser games is exploration."
"hint"	--	"Marbles should try wandering around."
"hint"	--	"Room descriptions are helpful."
"hint"	--	"That isn't enough, though, is it?"
"hint"	--	"Marbles is a cat."
"hint"	--	"Marbles would probably rely on her sense of [oc]SMELL[cc]. She can also be more specific and [oc]SMELL [bk]something[cb][cc]."
"hint"	--	"[oc]SMELL[cc] while in the auditorium. [oc]SMELL THE SEATS[cc]."
"Alright, I did the thing and something happened."	table of hinting	"It isn't possible to [oc]TAKE[cc] it."
"hint"	--	"Maybe Marbles could [oc]SCRATCH[cc] it."
"hint"	--	"That gives a hint!"
"hint"	--	"Let D know it's there. [oc]MEOW AT THE BAG[cc]."

table of grue hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"What now?"	table of hinting	"No harm in goofing off a bit. D is pretty interested in the flyer, so he won't mind."
"hint"	--	"You could always try some cat actions on things."
"hint"	--	"But sooner or later, you're going to have to check out the box and its contents."
"Gosh, Marbles!"	table of hinting	"Yes, it is a grue."
"hint"	--	"You could [oc]SMELL[cc] it..."
"hint"	--	"Ultimately, Marbles should tell D. He is Marbles's adventuring partner, after all."

table of spotlight hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"Things are getting interesting! What now?"	table of hinting	"Once Act Four begins, some room descriptions change."
"hint"	--	"Specifically, center stage and the main entrance."
"hint"	--	"Descriptions of those locations both mention the booth above the main entrance."
"hint"	--	"Have Marbles go to the main entrance, then try to [oc]GO UP[cc], [oc]CLIMB LADDER[cc] or [oc]JUMP TO LADDER[cc]."
"hint"	--	"Marbles needs a hand from D. [oc]MEOW LADDER[cc]."
"Alright, I'm here. Seems like there's a few things to do."	table of hinting	"It's a spotlight, and the name of this game is [it]Marbles, D, and the Sinister Spotlight[rt]."
"hint"	--	"Marbles needs to help D use the spotlight."
"hint"	--	"There are two things involved, and discovering the purpose of the spotlight is a good way to start."
"hint"	--	"If Marbles has examined the spotlight..."
"hint"	--	"Then she has found the tag."
"hint"	--	"She can't read it, though, so [oc]MEOW AT THE TAG[cc]."
"hint"	--	"The second objective involves D's view of the audience."
"hint"	--	"Did you notice the chair?"
"hint"	--	"Marbles could [oc]MARK[cc] it..."
"hint"	--	"But the goal is to jump to it."
"hint"	--	"How else could she [oc]JUMP TO THE LEDGE[cc]?"
"Marbles has done all the things!"	table of hinting	"Just let D know that you've figured it out."
"hint"	--	"[oc]MEOW AT THE CHAIR[cc]"

table of Aughtlight hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"The Aughtlight"	table of hinting	"You might be wondering: what's this thing for?"
"hint"	--	"Have Marbles [oc]MEOW AT[cc] some things."
"hint"	--	"Neat!"
"hint"	--	"Is there something nearby that could be effected by darkness?"
"hint"	--	"Gruecilla."
"hint"	--	"Just [oc]MEOW AT GRUECILLA[cc]."
"Is that all?"	table of hinting	"It is."
"hint"	--	"Still, there are some things Marbles might do."
"hint"	--	"Act Five is the last, good place for to Marbles to increase her rank. Unless she needs meow points, since meowing now directs the Aughtlight."
"hint"	--	"Higher ranks unlock extras."
"hint"	--	"Including an interview with Marbles."
"hint"	--	"And some cat pictures."

table of gruecilla hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"The stage is different, somehow."	table of hinting	"It certainly is."
"hint"	--	"Now that Gruecilla is loose (somewhat), Marbles will have to stay off of the floor."
"hint"	--	"Old place, new angle."
"What are Marbles and D up to?"	table of hinting	"They've discussed it."
"hint"	--	"They want to help Gruecilla escape the theater."
"How can Marbles and D complete their task?"	table of hinting	"Take things one step at a time."
"hint"	--	"In every location, there is something to do."
"hint"	--	"In every location, there is a way to leave."
"hint"	--	"D will provide support with the Aughtlight, provided Marbles helps him along."
"The first place"	table of hinting	"You mean the ladder, right?"
"hint"	--	"Gruecilla needs darkness."
"hint"	--	"To remain in darkness, she must follow the Aughtlight beam."
"hint"	--	"Have Marbles [oc]MEOW AT THE LADDER[cc] for instance."
"hint"	--	"No? How about the sandbag?"
"hint"	--	"Perhaps Gruecilla would like to travel in style."
"hint"	--	"[oc]MEOW AT THE GRUEMOBILE[cc]"
"hint"	--	"Once Gruecilla is safely behind the wheel, Marbles can leave."
"hint"	--	"She'll have to jump!"
"hint"	--	"[oc]JUMP TO SANDBAG[cc]"
"The second place"	table of hinting	"You mean the dinosaur, right?"
"hint"	--	"There's a lot of useful information in the room's description."
"hint"	--	"Anything stand out?"
"hint"	--	"The panel. Marbles might want to [oc]EXAMINE IT[cc] or [oc]MEOW AT IT[cc]."
"hint"	--	"That isn't good enough, but it might give you a hint."
"hint"	--	"Gruecilla can't access the vent with you in the way."
"hint"	--	"You can't leave until she's closer to the vent."
"hint"	--	"[oc]MEOW AT THE TAIL[cc]."
"hint"	--	"[oc]JUMP TO THE SANDBAG[cc]."
"The third place"	table of hinting	"The platform above the stage, right?"
"hint"	--	"If you've been paying attention, you know where Gruecilla needs to go."
"hint"	--	"[oc]MEOW AT THE VENT[cc]"
"hint"	--	"Oh? Well, how about where Marbles was a few minutes ago?"
"hint"	--	"[oc]MEOW AT THE HEAD[cc]"
"hint"	--	"Ah-ha! I bet you know what to do now."
"hint"	--	"[oc]MEOW AT THE VENT[cc]"


table of yikes hints
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"What is Marbles supposed to do now?"	--	"Save D!"
"How can Marbles save D?"	table of hinting	"She saves D, no matter what. This is not the kind of story where children get eaten by grues."
"hint"	--	"That's a fail-safe, though. Marbles can handle things herself!"
"hint"	--	"Marbles needs to open the skylight and let some light in."
"hint"	--	"The sandbag that can open it is at the other end of the stage, unfortunately."
"hint"	--	"[oc]JUMP TO THE TIGHTROPE[cc]"
"hint"	--	"[oc]EAST[cc], then [oc]EAST[cc] again"
"hint"	--	"[oc]JUMP TO THE SANDBAG[cc]"
"hint"	--	"Well done, Marbles!"


book (general questions)

table of GQs
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"This game is set in something called 'Zork.' What does that mean?"	table of hinting	"The [it]Zork[rt] Trilogy was a series of computer games from the 1980s. The games were, for a period of years, unstoppable bestsellers."
"hint"	--	"They take place in what is called the 'Great Underground Empire,' which is underneath a kingdom called 'Quendor.'"
"hint"	--	"The Empire is a failed colonial project, and the games feature both high fantasy and science fiction elements."
"Is Marbles, D, and the Sinister Spotlight an extension of the story told by the Zork Trilogy?"	table of hinting	"Not exactly."
"hint"	--	"Thanks to its success, [it]Zork[rt] spawned many spin-offs, including a series of four CYOA-style books by Steve Meretzky."
"hint"	--	"Those books[em]known collectively as the What-Do-I-Do-Now series[em]riffed on problems and settings in the original games, but were a separate continuity."
"hint"	--	"The stars of these books were Bill and June, who were probably a couple of years older than D, a character in this game."
"hint"	--	"[it]Marbles, D, and the Sinister Spotlight[rt] is part of that tradition of Zork-inspired adventure stories for young adults."
"What is a grue?"	table of hinting	"A quote from [it]Zork I[rt]: 'The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is adventurers, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale.'"
"hint"	--	"You meet one during the game. What do you think?"
"It has been said that this game came from something called Let's Make IF. How did Let's Make IF lead to the creation of this game?"	table of hinting	"Let's Make IF is an ongoing series of Inform tutorials published at a blog called Top Expert."
"hint"	--	"This work was built around two techniques or features that are part of Inform: scenes and relations."
"hint"	--	"In the beginning, the author didn't know anything about them. He used the blog to document his own learning experiences."
"hint"	--	"At least one person has said that Top Expert's discussion of scenes was helpful, and that person used scenes in a game that Drew liked."
"hint"	--	"And that's what this whole thing is about!"
"OK, what are scenes?"	table of hinting	"They are a way to designate specific parts of a game's narrative. As the name suggests, their existence suggests a kind of dramatic intent."
"hint"	--	"Usually, it is not announced when scenes begin and end in a mechanical sense."
"hint"	--	"However, this game announces new scenes specifically (Act One, Act Two, and so forth) so that beginning authors can see how scenes can affect text, actions, and many other things."
"How about relations?"	table of hinting	"A lot of authors, including Drew Cook, find relations intimidating."
"hint"	--	"They do what the documentation says that they do, relating things to other things, but the details are murky."
"hint"	--	"Drew wanted to learn about them, in spite of the challenges involved."
"hint"	--	"The things that D says are based on relations. D has a relationship with the things that he talks about."
"hint"	--	"The Aughtlight has a relationship with the things that it covers in darkness."
"hint"	--	"These techniques allowed the author to provide hints and ambiance with D's comments."
"hint"	--	"They also allowed him to track where the Aughtlight was pointed, which was very important during Act Six."
"hint"	--	"In the end, Drew found them useful. Hopefully other people will, too."
"The scoring system seems rather complex, with different counters for different actions."	table of hinting	"It's one of the trickiest things that Drew has done with Inform."
"hint"	--	"A tester suggested that the scoring system should encourage using all of the various cat behaviors."
"hint"	--	"Which led to the ranking system that had different measurements for each level."
"hint"	--	"It probably would have been easy for a more skilled programmer..."
"hint"	--	"...but that's not who Drew is."
"hint"	--	"Thank goodness that didn't prevent him from making this game!"
"Has this been done before? A cat protagonist in a parser game?"	table of hinting	"There have been a few cat protagonists in text games, but they seem rare."
"hint"	--	"There is at least one famous dog, and a famous pig."
"hint"	--	"But there is no famous cat protagonist as far as I know."
"hint"	--	"But let's keep trying, until a cat has soared to similar heights!"
"hint"	--	"If Drew can't do it, maybe you can."
"hint"	--	"That's what this whole thing is about!"
"Is this a sequel to 'Repeat the Ending?'"	table of hinting	"There are similarly-named characters."
"hint"	--	"'Marbles, D, and the Sinister Spotlight' takes place in the 1980s, and so does the Prologue to 'Repeat the Ending.'"
"hint"	--	"But there's no reason to read too much into things!"
"hint"	--	"...or too little."

book (marbles interview questions)

table of MQs
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"There are few cat adventurers in the land of Zork."	table of hinting	"[it]There are few cat adventurers in the land of Zork. What is it like to be such a rare specimen[q][rt][lb]Well, Loretta, I would be a rare specimen regardless, so I am quite accustomed to the feeling!"
"hint"	--	"[it]Yes, I'm sure, but are there any special considerations for cat adventurers[q][rt][lb]I think Zork is a fine place for feline adventures, but it is important to bring a human along to make sure there are adequate snacks."
"hint"	--	"[it]Which of your feline abilities is most useful when working with a human partner[q][rt][lb]The senses. Humans are bad listeners, as I'm sure you know."
"hint"	--	"[it]I wouldn't have guessed that! You seem to have meowed a lot in your last adventure[dot][rt][lb]True, but without first sensing, there is no meow!"
"hint"	--	"[it]Do you feel your contributions are recognized[q][rt][lb]Of course! D is a thoughtful boy. We are a great team."
"Life as a cat."	table of hinting	"[it]Let's talk about life as a cat. There must be ups and downs[dot][rt][lb]Certainly! The advantages are many."
"hint"	--	"[it]Such as[q][rt][lb]We are quite agile. Everybody knows that! We have an innate sense of danger, too. D's parents own something called a 'vacuum cleaner.' It's obviously dangerous! Thanks to my outstanding capacity for discernment, that vacuum cleaner has never managed to harm me. Incredible? Yes, but also just the daily life of a cat."
"hint"	--	"[it]Anything else?[q][rt][lb]We sleep well, and often. I'm sure all humans wish they could do the same! D is up and down all night."
"hint"	--	"[it]What are your thoughts on hunting? Cat's are famously good at catching prey[dot][rt][lb]Ah, yes. What cat does not love the thrill of the hunt? I have never seen a rodent in D's house, so I have to keep my skills honed in other ways."
"hint"	--	"[it]Yes[q][rt][lb]Shoelaces, milk rings, bread ties. Socks, even! There is always something to pounce on. Wherever a cat goes, the hunt goes, too."
"hint"	--	"[it]Of all the feline abilities at your disposal, which are your favorite[q][rt][lb]Purring and grooming. Both calm me. I always groom before taking a long nap."
"hint"	--	"[it]What does your dream home look like[q][rt][lb]I'm a simple cat. Snacks, a clean litter box, plenty of quiet. If someone changed the sheets on a human bed once a day, that would be excellent. I love it when D changes the sheets. If only he did it more often!"
"You live with humans."	table of hinting	"[it]You live with humans. What is that like[q][rt][lb]As everyone knows, the average human is brutish, selfish, and loud, but we have to make peace with them. They're everywhere!"
"hint"	--	"[it]There must be something good about it, since you have lived among them for years[dot][rt][lb]Well, if you find the right ones, the amenities are fantastic: food on a schedule, protection from cold, and the litter box! It is hard to give up a regularly cleaned litter box. I enjoy all of these comforts."
"hint"	--	"[it]Is that really enough, though[q][rt][lb]You can get attached, of course. I'm very fond of D. I really can't stand his parents, but I put up with them. I wouldn't leave him."
"hint"	--	"[it]Anything else on humans[q][rt][lb]They have thumbs, which seems nice. Closed doors and containers can ruin any cat's day! But a cat never wishes to have what cats do not."
"hint"	--	"[it]Humans seem to enjoy television and computers. What do you think about them[q][rt][lb]They are very stupid, obviously, and yet I'm quite fond of them."
"hint"	--	"[it]Really? Why is that[q][rt][lb]D only sits still when he is staring at them, so we use that time to enjoy each other's company."
"hint"	--	"Doors[em]yes or no? How do you feel about them[q][rt][lb]I hate them! Doors are just a way for humans to lord their thumbs over everybody."
"About D."	table of hinting	"[it]Can I ask about D? He seems an important part of your life[dot][rt][lb]D is a good boy. Very considerate. He only picks me up when he can tell that I won't mind."
"hint"	--	"[it]You've suggested he's unhappy. Why do you think that is[q][rt][lb]I think most humans are unhappy. Is D unusually unhappy? I'm not sure. D doesn't like living among humans. I've told him we can leave. We can go off on our own anytime. I keep telling him."
"hint"	--	"[it]You two are obviously close friends. What's that like[q][rt][lb]D and I enjoy each other's company. If he's at the computer, I'm on the desk. If he's in his human bed, I'm on the bed. Sharing space is the foundation of our relationship."
"hint"	--	"[it]That's it[q][rt][lb]No, that's not it, but it is the foundation. From that starting point we play, eat, and sleep together. Unless he's out of the house, we're together."
"hint"	--	"[it]Where does he go when he leaves[q][rt][lb]School, mostly. He spends a lot of time there."
"hint"	--	"[it]What is a school[q][rt][lb]I think it is a kind of day-prison for adolescent humans. I wonder where they are stored? D often comes home upset."
"Other questions."	table of hinting	"[it]Do you have a favorite food[q][rt][lb]Fish. All kinds, but I like tuna best of all."
"hint"	--	"[it]Have you ever eaten human food[q][rt][lb]No. Once, I took a fish stick from D's plate and hid behind the couch. But his parents caught me before I could eat it. It smelled very nice!"
"hint"	--	"[it]Where were you born[q][rt][lb]I believe I was born in a place called Hot Springs. I still live there."
"hint"	--	"[it]How old are you[q][rt][lb]Cat math only has two numbers: one and more than one. I'm more than one, definitely."
"hint"	--	"[it]What do you think of Zork[q][rt][lb]It's a lot of fun! I wish D and I could stay there all the time. We don't have problems in Zork, we solve them. It's filled with nice people and creatures, too."
"hint"	--	"[it]Are you the same Marbles as the one in that game [bt]Repeat the Ending[it]? The main character is named 'D'[dot][lb][rt]Oh, I wouldn't know about that. I watch D use the computer sometimes, but computers are very human-centered."
"hint"	--	"[it]What do you think of tigers[q][rt][lb]They are very impressive, to be sure, but they're born into that. What has a tiger ever earned? Some of us have to show our work."
"Other questions (continued)."	table of hinting	"[it]Cats seem to enjoy chairs. What is the perfect chair[q][rt][lb]The thing non-cats need to understand is that there is no such thing as a perfect chair. Sometimes, I want warmth. At other times, I want to roll on my back and showboat around. Sometimes, I want to be able to scratch the chair. And so forth. Ideally, a cat has three or more chairs to work with, though she can survive with two."
"hint"	--	"[it]If you had one wish, what would you wish for[q][rt][lb]That's tough! Even though I would like some fish, I think I would give D some magic powers. He could be a wizard's apprentice, and I could be his familiar. We'd be very judicious and smart about our powers, obviously."
"hint"	--	"What is something you are proud of[q][rt][lb]We cats have a reputation for self-involvement, and I think that's probably fair, but we can practice loyalty and friendship. I'm proud of that."
"hint"	--	"[it]Is there anything else that you would like people to know[q][rt][lb]There is nothing like the adventurer's life, and I am happy to live it. Certainty of purpose, the clarifying nature of a hero's duty, an ever-increasing sense of mastery: these are its promises! Everything I've ever done adventuring, I would do again."
"hint"	--	"[it]Wow[ex][rt][lb]Also, dear readers, please be wary of vacuum cleaners. Vigilance is safety![pb]Thanks Loretta and everyone for listening to me[dot][pb]love,[lb]Marbles <3"


book (images)

figure chair is the file "chair.jpg".
figure lowchair is the file "chair 720.jpg".

to say red:
	if screenreader is true:
		say "An small, adolescent cat with wide eyes looks to the camera with a serious expression. She is perched on a curved, modernistic chair. The combination is quite is both dramatic and silly.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure chair;
	otherwise:
		display figure lowchair.
		
figure elegance is the file "elegant drama.jpg".
figure lowelegance is the file "elegant drama 720.jpg".

to say elegant drama:
	if screenreader is true:
		say "A cat reclines on a bare, carpeted floor. She is looking calmly at something outside of the frame. Bright, warming sunlight falls over her and the floor. Her expression is thoughtful.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display the figure elegance;
	otherwise:
		display the figure lowelegance.


figure cubby is the file "cubby.jpg".
figure lowcubby is the file "cubby 720.jpg".

to say empty:
	if screenreader is true:
		say "A small cat stands in a wood cubby. She stands tall and confident, and reminds one of an explorer standing atop a mountain. She is watching something off-camera. Her expression is one of thoughtful vigilance.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure cubby;
	otherwise:
		display figure lowcubby.


figure final is the file "final2k.jpg".
figure lowfinal is the file "final720.jpg".

to say final:
	if screenreader is true:
		say "A whimsical drawing depicting the final scene of the game. Four figures sit in a greenhouse, eating and cheerfully talking. At left, a boy who might be ten years old sits in jeans and a striped shirt. This is the character D. He is laughing and chatting with an elderly man in a star-covered robe.

At right, Marbles grooms her forelimb with her long tongue. Beside her sits Loretta, a ruffed lemur. Loretta is happily eating grapes.

It is a festive and joyous scene.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display the figure final;
	otherwise:
		display the figure lowfinal;

figure fish is the file "fish.jpg".
figure lowfish is the file "fish 720.jpg".

to say trout:
	if screenreader is true:
		say "A small cat sprawls comfortably across a large couch cushion. She looks directly at the camera. A tuft of longer hair covers her belly, and the pads of her rear paws have a glossy shine.

She holds a toy fish between her front paws and seems quite proud of her possession.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure fish;
	otherwise:
		display figure lowfish.
		
figure leap is the file "leap2k.jpg".
figure lowleap is the file "leap720.jpg".

to say leap:
	if screenreader is true:
		say "A dramatic drawing of a cat leaping through space. Her front and rear legs are fully extended. Far below her sprawls a theater stage featuring a ladder and a large, artificial dinosaur.
		
	The length and height of the jump make this leap a dangerous one.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure leap;
	otherwise:
		display figure lowleap.
		
figure lee is the file "lee.jpg".
figure lowlee is the file "lee 720.jpg".

to say lemur:
	if screenreader is true:
		say "A larger black cat sits on a wooden shelf. Beside her, vintage boxes from Infocom games stand, including ones for [it]Spellbreaker[rt], [it]Plundered Hearts[rt], and [it]A Mind Forever Voyaging[rt].";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure lee;
	otherwise:
		display figure lowlee.

figure leemox is the file "moxie and lee.jpg".
figure lowleemox is the file "moxie and lee 720.jpg".


to say moxie and lee:
	if screenreader is true:
		say "A close up image of two cats cuddling. One rests its chin upon the neck of the other, creating a sort of natural yin-yang symbol. It is a moment of quiet reflection.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure leemox;
	otherwise:
		display figure lowleemox.
		
figure scratch is the file "scratcher.jpg".
figure lowscratch is the file "scratcher 720.jpg".

to say scratcher:
	if screenreader is true:
		say "A small kitten sits on top of a cat scratcher. Just as is the case for many kittens, her paws seem too large for her legs. She stares into the camera, head slightly tilted, as if confused.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure scratch;
	otherwise:
		display figure lowscratch.

figure shelf is the file "shelf.jpg".
figure lowshelf is the file "shelf 720.jpg".

to say shelf:
	if screenreader is true:
		say "A small cat is perched atop a high wooden shelf. She is staring intently at something off camera. Her expression is alert and serious.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure shelf;
	otherwise:
		display figure lowshelf.

figure pink is the file "shoe.jpg".
figure lowpink is the file "shoe 720.jpg".

to say shoe:
	if screenreader is true:
		say "A tiny kitten lies on a wood floor. She is holding a running shoe with her front paws and kicking it with her left. She is focused on her task, and her expression quite serious.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure pink;
	otherwise:
		display figure lowpink.

figure stripes is the file "striped.jpg".
figure lowstripes is the file "striped 720.jpg".

to say striped:
	if screenreader is true:
		say "A small cat lies atop a blanket. The focus is on her head and face. Her eyes are very wide, and her head is raised above the blanket. It conveys a strange mood, and she seems to be both relaxed and alert.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure stripes;
	otherwise:
		display figure lowstripes.


figure bowl is the file "sunbathing.jpg".
figure lowbowl is the file "sunbathing 720.jpg".

to say sunbowl:
	if screenreader is true:
		say "A small cat is curled up in a clear plastic bowl. Warm sunlight pours in from a nearby window. The top half of her head is visible above the top of the bowl. Her eyes are closed. She is clearly enjoying a bit of sunbathing.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure bowl;
	otherwise:
		display figure lowbowl.


figure title is the file "title2k.jpg" ("A large splash logo for the game Marbles, D, and the Sinister Spotlight. It features a black cat and a boy operating a spotlight. The letters are curved and whimsical.").
figure lowtitle is the file "title 720.jpg" ("A large splash logo for the game Marbles, D, and the Sinister Spotlight. It features a black cat and a boy operating a spotlight. The letters are curved and whimsical.").

to say splash:
	if screenreader is true:
		say "Descriptive text.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure title;
	otherwise:
		display figure lowtitle.

figure towels is the file "towels.jpg".
figure lowtowels is the file "towels 720.jpg".

to say towel:
	if screenreader is true:
		say "A small cat has found her way into a storage shelf for towels. She lies atop several rolled-up towels, looking at the camera with an expression of relaxed satisfaction.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure towels;
	otherwise:
		display figure lowtowels.

figure trap is the file "trap2k.jpg".
figure lowtrap is the file "trap720.jpg".

to say trapdoor:
	if screenreader is true:
		say "A whimsical drawing of a cat peeking out of a trapdoor in a wood floor. She is about to climb out. Her expression is cheerful and friendly.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display figure trap;
	otherwise:
		display figure lowtrap.

figure tv is the file "tv.jpg".
figure lowtv is the file "tv 720.jpg".

to say television:
	if screenreader is true:
		say "A kitten lies atop a fanciful cat scratcher that imitates the shape and features of a television.";
	otherwise if bisquixe is active:
		follow the tall images rule;
		display figure tv;
	otherwise:
		display figure lowtv.

figure gruequarium is the file "tank2k.jpg".
figure lowgruequarium is the file "tank720.jpg".

to say tank:
	if screenreader is true:
		say "descriptive text.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display the figure gruequarium;
	otherwise:
		display the figure lowgruequarium.
		
to say trap:
	if screenreader is true:
		say "Descriptive text.";
	otherwise if bisquixe is active:
		follow the wide images rule;
		display the figure trap;
	otherwise:
		display the figure lowtrap;
		
[it's possible to display images in the menu system. I just use the substitutions immediately above. these are a reward for completing the game with a transcendent rank]

table of images
title (text)	subtable (table name)	description (text)	used (number)	bookpage (number)	localpage (number)
"Moxie with Fish"	--	"[trout]"
"Sunbathing with Clear Plastic Bowl"	--	"[sunbowl]"
"Portrait with Shoe"	--	"[shoe]"
"One White Wooden Cubby (empty)"	--	"[empty]"
"Moxie atop Television"	--	"[television]"
"Perched Kitten"	--	"[scratcher]"
"Guest Visitor: Baby Lee"	--	"[lemur]"
"Profile with Striped Blanket"	--	"[striped]"
"Baby Lee and Moxie"	--	"[moxie and lee]"
"Among the Towels"	--	"[towel]"
"A Creature of Elegant Drama"	--	"[elegant drama]"
"Kitten with Chair"	--	"[red]"

 
Book 2 - story mode

[
story mode]

[in the current version of story mode, the author can state which table is to be used for story mode]

the storybook is the table of Marbles stories.

[a simple list of commands]

table of Marbles stories	
index	input
(a number)	"south"
--	"north"
--	"south"
--	"south"
--	"examine the doors"
--	"look"
--	"examine the switch"
--	"meow at the switch"
--	"north"
--	"scratch the chairs"
--	"jump on the chairs"
--	"score"
--	"listen"
--	"hiss at the chairs"
--	"go north"
--	"smell"
--	"smell the box"
--	"examine the stepladder"
--	"jump on the stepladder"
--	"examine the dinosaur"
--	"mark the dinosaur"
--	"examine the box"
--	"go south"
--	"smell"
--	"examine the chairs"
--	"smell the chairs"
--	"examine bag"
--	"bite bag"
--	"meow at the bag"
--	"listen to the bag"
--	"hiss at the bag"
--	"go north"
--	"examine the box"
--	"meow at the grue"
--	"score"
--	"scratch the ladder"
--	"paw at the box"
--	"south"
--	"groom me"
--	"south"
--	"listen to the door"
--	"meow at the door"
--	"hiss at the door"
--	"climb the ladder"
--	"meow at the ladder"
--	"groom myself"
--	"examine the spotlight"
--	"examine the tag"
--	"meow at the tag"
--	"examine the chair"
--	"jump to the chair"
--	"jump to the ledge"
--	"examine the chair"
--	"meow at the chair"
--	"north"
--	"meow at the bag"
--	"examine the bag"
--	"purr"
--	"score"
--	"north"
--	"examine gruecilla"
--	"meow at gruecilla"
--	"examine Gruemobile"
--	"examine gruecilla"
--	"meow at the Gruemobile"
--	"examine the Gruemobile"
--	"examine the sandbag"
--	"jump to the sandbag"
--	"examine panel"
--	"meow at the panel"
--	"examine the tail"
--	"meow at the tail"
--	"up"
--	"jump to the sandbag"
--	"examine the dinosaur"
--	"meow at the dinosaur"
--	"examine gruecilla"
--	"examine the vent"
--	"meow at the vent"
--	"examine the tightrope"
--	"jump to tightrope"
--	"east"
--	"east"
--	"jump to sandbag"

[story mode]

[I didn't feel like numbering the index columns myself. Maybe nobody would? I'm not sure.]
		
when play begins:
	let n be one;
	if storybook is the table of marbles stories:
		repeat through the storybook:
			now index entry is n;
			increment n;

[
story mode]

[some added commands that won't pause the walkthrough]

table of whitelisted commands (continued)
input
"report"
"status"
"gameplay"
"grade"
"commands"
"verbs"
"gameplay"
"navigating"
"navigation"


volume 9 (error messages, default reports, and so on)

[these are all rewrites of messages from the standard rules. you can see my complete list here:

https://kamin3ko.itch.io/default-reponses-template
]


The requested actions require persuasion rule response (A) is "Cats don't like getting bossed around. You'll never teach me to fetch! We don't like doing the bossing, either. If I wanted something from someone[em]even D[em]I [oc]MEOWed AT it[cc]. That's my way of doing things. A cat's way.".

The action processing internal rule response (A) is "I suppose I was the only one who knew that was an adventure game.".

The action processing internal rule response (K) is "I suppose that didn't make sense. But that's the way I like it! I had no intention of making sense.".

The action processing internal rule response (J) is "Ah-ha! You failed to anticipate this scenario. That's what happens when you move a cat around without her permission!".

The parser error internal rule response (A) is "[unless escape the theater is happening]Silence is every cat's prerogative.[otherwise if escape the theater is happening]Silence is every cat's prerogative, but this is hardly the time!".

The parser error internal rule response (B) is "I decided to add something extra to my request, but it didn't work. I guess that was no way to ".

The parser error internal rule response (C) is "Hey! I can't understand that extra stuff. I think you might have meant to just ".

The parser error internal rule response (D) is "Math isn't a strength of my kind. It's a bit ungenerous to rub it in, don't you think?".

The parser error internal rule response (E) is "I apologize if I have overlooked something, but I can't see that right now.".

The parser error internal rule response (H) is "I didn't want to spread myself too thin, as focus is a measure of prowess. Please try one thing at a time.".

The parser error internal rule response (J) is "Cats struggle with human pronouns. Please be specific.".

The parser error internal rule response (K) is "At first I thought I had things worked out, but then I got confused. What is a pronoun, exactly?".

The parser error internal rule response (M) is "Some know-it-all adventure game might have only let me try that on a person or animal. But we know a cat could have managed. Of course we could!".

The parser error internal rule response (N) is "That isn't something I can do, because I only know a few human words. By choice, mind you, I'm very smart!".

The parser error internal rule response (Q) is "I'm not interested in numbers, OK? That's people stuff.".

The parser error internal rule response (R) is "Every once in a while, some silly human will make a mistake with something called 'command grammar.' Don't ask me what that is; I'm just a cat! It puts me in awkward situations, though. Hopefully we can get it right next time.".

The parser error internal rule response (T) is "Punctuation is human stuff. You don't need a comma to talk to a cat.".

The parser error internal rule response (U) is "I thought I might want to have a conversation using human sentence structures. But I don't.".

The parser error internal rule response (V) is "If I wanted to talk to or about something, I [oc]MEOWed AT it[cc]".

The parser error internal rule response (W) is "If I wanted to talk to or about something, I [oc]MEOWed AT it[cc]".

The parser error internal rule response (X) is "[if escape the theater is not happening]That's fine. Cats are fond of silence.[otherwise]That wouldn't do in a time like this! I needed to come up with [it]something.[rt]".

The parser nothing error internal rule response (B) is "The author of this so-called 'program' took it for granted that I wouldn't try to do something like that with 'ALL'. But it looks like we fooled him and fooled him good!".

The parser nothing error internal rule response (C) is "The author of this so-called 'program' took it for granted that I wouldn't try to do something like that with 'ALL'. But it looks like we fooled him and fooled him good!".

The parser nothing error internal rule response (D) is "Ah, yes. Putting things in things, taking things from things. Beloved human pastimes!".

The parser nothing error internal rule response (E) is "I didn't think I can open that, but I guess that's true of most things.".

The parser nothing error internal rule response (F) is "The author of this so-called 'program' took it for granted that I wouldn't try to do something with 'ALL'. But it looks like we fooled him and fooled him good!".

The darkness name internal rule response (A) is "Bazinga!".

The parser command internal rule response (A) is "That's not a mistake, it's a beauty flop.".

The parser command internal rule response (B) is "A mistake is just an excuse to groom.".

The parser command internal rule response (C) is "A mistake is just an excuse to groom.".

The parser command internal rule response (D) is "My goal today is to do something worth repeating."

The parser clarification internal rule response (A) is "Wait a minute! I wasn't sure if I meant ".
.
The parser clarification internal rule response (B) is "I wasn't sure what I had in mind. Was it ".

The parser clarification internal rule response (C) is "I had a hard time deciding. Did I mean ".

The parser clarification internal rule response (D) is "Who or what did I have in mind? It could have only been  ".

The parser clarification internal rule response (E) is "There was so much stuff in the theater. What specific thing did I have in mind?"

The yes or no question internal rule response (A) is "I wasn't usually this picky, but I needed to answer with either 'yes' or 'no'.".


The immediately undo rule response (A) is "I guess we broke [oc]UNDO[cc] somehow, whatever that is!".

The immediately undo rule response (B) is "No way. D and I were not going back into that tunnel.".

The immediately undo rule response (C) is "Wow! You got this 'game' to run in an 'interpreter' that doesn't support [oc]UNDO[cc]! You'll have us out of this theater in no time.".

The immediately undo rule response (E) is "I decided to try that again.".

The immediately undo rule response (F) is "Sorry, but it wasn't possible to go back any farther. I can't remember what I was doing.".

The quit the game rule response (A) is "Cats never quit. Are you sure? ".
The save the game rule response (A) is "I have no idea what this means, but that save didn't work out.".
The save the game rule response (B) is "I did it!".
The restore the game rule response (A) is "I have no idea what this means, but that restore didn't work out.".
The restore the game rule response (B) is "I did it!".
The restart the game rule response (A) is "From the beginning? Are you sure? ".
The restart the game rule response (B) is "I'm glad you changed your mind. We're making good progress!".
The verify the story file rule response (A) is "Looks like you passed the very serious human business check.".
The verify the story file rule response (B) is "I don't know how to tell you this, but this game file is no good. Being a human must be hard sometimes.".
The switch the story transcript on rule response (A) is "You are already transcribing play, just as any reasonable cat would do.".
The switch the story transcript on rule response (B) is "Let's transcribe:".
The switch the story transcript on rule response (C) is "This transcription is off to a bad start.".
The switch the story transcript off rule response (A) is "I'm not sure what the bigger story is. Is it that transcription is off? Or is it that you would like to turn it off [it]some more[rt]?".
The switch the story transcript off rule response (B) is "[line break]Here ends a transcript of [it]Marbles, D, and the Sinister Spotlight[rt].[lb]".
The switch the story transcript off rule response (C) is "The transcript didn't end as requested, but that isn't my fault.".

The standard report preferring abbreviated room descriptions rule response (A) is " is now in its 'superbrief' mode, a fine way to conserve what humans call 'tractor feed paper.' Hopefully that strange stuff at the top of the screen will help a little.".
The standard report preferring unabbreviated room descriptions rule response (A) is " is now in its 'verbose' mode, the choice of all sensible cats.".
The standard report preferring sometimes abbreviated room descriptions rule response (A) is " is now in 'brief' mode, just in case you are playing on D's Commodore 64. Not that I know what that is!".

The print the final prompt rule response (A) is "> [run paragraph on]".
The print the final question rule response (A) is "Now that we've won, we can ".
The print the final question rule response (B) is " or ".
The standard respond to final question rule response (A) is "Things are pretty limited here at the end of the story. Try one of the options above.".

The examine undescribed things rule response (A) is "Oh, boy! It looks like some human named 'Drew Cook' didn't write a description for [the noun]. Tell him about it, but be nice, OK? He'll probably be embarrassed.".

The standard looking under rule response (A) is "Because of our height, cat's are always looking under things. I didn't need an invitation.".

The can't search unless container or supporter rule response (A) is "Cats don't search by searching. We search by [oc]SMELLing[cc] and [oc]LISTENing[cc]".

The block consulting rule response (A) is "I could read if I wanted, certainly, but I choose not to.".

The print empty inventory rule response (A) is "A cat is her own treasure[if the cgsg are in theater] Sadly, my elegant features had been marred by those clumsy glasses[end if].".

The can't take yourself rule response (A) is "Only humans try to take what they already have.".
The can't take other people rule response (A) is "Cats take only snacks and toys, and we never take them far.".


The can't enter what's already entered rule response (A) is "Having anticipated your request, I was already on [the noun].".
The can't enter what's already entered rule response (B) is "Having anticipated your request, I was already in [the noun].".
The can't enter what's not enterable rule response (A) is "I preferred to stand elsewhere.".
The can't enter what's not enterable rule response (B) is "I love sitting on things, just as any cat might, but time and logistics rendered it undesirable in that moment.".
The can't enter what's not enterable rule response (C) is "I love lying on things, just as any cat might, but time and logistics rendered it undesirable in that moment.".
The can't enter what's not enterable rule response (D) is "That seemed impenetrable, even for a cat as agile and resourceful as I was.".
The can't enter closed containers rule response (A) is "Foiled again by something closed! When will it end?".


The can't open unless openable rule response (A) is "Are you trying to tease me? You know cats don't understand opening very well.".
The can't open what's already open rule response (A) is "See what a great job I've been doing? It's open, and I didn't even have to touch it!".
The can't open what's locked rule response (A) is "When the writer of this story decided that there was no way to trigger this message, I thought to myself, 'Is that really true?' I didn't say anything, as cats care little for writing.".

The reveal any newly visible interior rule response (A) is "Wow! I never thought I'd get that open! It's hard to believe, but inside I found a ".

[====]

The standard report opening rule response (A) is "Wow, did I open that? I mean, I opened it! I did!".
The can't close unless openable rule response (A) is "If you can't open it, then you can't close it. Even cats know that!".
The can't close what's already closed rule response (A) is "Wow, did I close that? I mean, I closed it! I did!".
The standard report closing rule response (A) is "I don't know how I closed that. I don't get it! But a cat is a living surprise. We even surprise ourselves!".


The block showing rule response (A) is "I'm always showing off what I have: me! A cat is her own treasure.".
The block waking rule response (A) is "Everyone needs sleep, that's a fact of living. A fact we cats know very well! But nothing slept in that theater.".
The futile to throw things at inanimate objects rule response (A) is "Throw? What is this primate folly?".
The block throwing at rule response (A) is "Throw? What is this primate folly?".
The block attacking rule response (A) is "While I have the tools[em]claws, fangs, astounding agility[em]they may only be used for hunting and self-defence. Such is the cat's code.".

instead of attacking marbles:
	say "I'm sorry, but you must have wandered into the wrong story by mistake."

The kissing yourself rule response (A) is "Huh? Cat's don't kiss, we [oc]GROOM[cc].".
The block kissing rule response (A) is "Yuck! That's people stuff.".
The standard report waiting rule response (A) is "Very well, but I didn't want to dawdle for too long. We cats are busy creatures.".

The report touching yourself rule response (A) is "[oc]TOUCHing[cc] is more of a human thing, isn't it? Investigate cat-specific [oc]ACTIONS[cc] for alternatives.".

The report touching other people rule response (A) is "[oc]TOUCHing[cc] is kind of a human thing, isn't it? Investigate cat-specific [oc]ACTIONS[cc] for alternatives.".

The report touching things rule response (A) is "[oc]TOUCHing[cc] is kind of a human thing, isn't it? Investigate cat-specific [oc]ACTIONS[cc] for alternatives.".

The can't wave what's not held rule response (A) is "It isn't kind of you to assume that everyone has thumbs.".

The innuendo about squeezing people rule response (A) is "Your suggestion is a little insensitive. Cats cannot squeeze creatures or things, as I'm sure you realize.".
The report squeezing rule response (A) is "Your suggestion is a little insensitive. Cats cannot squeeze creatures or things, as I'm sure you realize.".

The block burning rule response (A) is "I had no desire to shout 'fire' in an empty theater.".
The block waking up rule response (A) is "As much as cats love naps, I had make it through dinner before I could sleep.".
The block thinking rule response (A) is "Cats think all the time! We are thought in action.".
The block cutting rule response (A) is "Cats do not cut; we [oc]SCRATCH[cc].".
The block tying rule response (A) is "I don't have thumbs, which I shouldn't have to tell you. Primates are so proud of their thumbs, aren't they?".
The block drinking rule response (A) is "I was feeling a bit thirsty, now that you mention it, but there was nothing to drink.".
The block saying sorry rule response (A) is "There's no need for that. Mine is a magnanimous species.".
The block swinging rule response (A) is "It's a shame that you weren't there, since you're the one with the thumbs.".

The block setting it to rule response (A) is "Setting things to things is a human concept. We cats tend to leave things as they are, barring a bit of biting and scratching, of course. Scratching enhances the beauty of something! You can't convince me that it doesn't.".
The report waving hands rule response (A) is "Hands, you say?".

The block buying rule response (A) is "Money hasn't done primates a lot of good, if you ask me. Why would I want to fuss with it?".


The can't eat unless edible rule response (A) is "There was nothing for a cat to eat there, and I was positively starving. I just barely made it here for dinner!".

The standard report eating rule response (A) is "I still don't believe that I found something to eat in that theater. Somebody goofed, if you ask me, but 'programming' so-called 'games' is no cat's business.".

The block answering rule response (A) is "That's no way for a cat to communicate. If I wanted to talk about things, I just needed to [oc]MEOW AT [bk]something[cb][cc].".
The telling yourself rule response (A) is "I was already talking to myself. A cat is her own closest confidant.".
The block telling rule response (A) is "That's no way for a cat to communicate. If I wanted to talk about things, I just needed to [oc]MEOW AT [bk]something[cb][cc].".
The block asking rule response (A) is "That's no way for a cat to communicate. If I wanted to talk about things, I just needed to [oc]MEOW AT [bk]something[cb][cc].".
The block saying yes rule response (A) is "There is no need for that, as a cat's life is one, ongoing 'yes.'".
The block saying no rule response (A) is "To what would I say no? I assure you that I will let you know when the occasion arises.".

The can't reach inside rooms rule response (A) is "That wasn't possible from a distance, not even for a capable cat like me.".
 


Volume 99 - scratch pad

[test commands]

test door with "
smell/
s/
scratch aisle/
s/
smell/
meow switch
"
	
test box with "
test door/
scratch ladder/
listen/
listen to door/
n/
listen/
n/
paw ladder/
mark dinosaur/
meow dinosaur/
x box/"

test bag with "
test box/
scratch dinosaur/
scratch ladder/
listen/
s/
scratch aisle/
smell/
smell seats/
meow bag/"

test cb with "
test box/
s/
scratch aisle/
smell/
smell seats
/"

test grue with "
test bag/
bite bag/
bite bag/
jump chairs/
hiss chairs/
jump aisle/
n/
n/
purr/
meow box/"

test l1 with "
test grue /
s /
hiss bag/
s
"

test bt with "
test l1 /
meow ladder
"


test ladder with "
test grue/
s/
s/
meow ladder"

test al with "
test ladder/
z/
meow tag/
jump to chair/
jump to board/
jump to floor/
meow at tag /
meow at chair
"
	
test rg with "
test al /
n /
n /
meow grue
"

test egp with "
test rg /
meow car /
jump bag /
meow tail /
jump bag"

test plank with "
test rg /
meow car /
jump bag /
meow tail /
jump bag /
meow head /
meow escape
"

test dino with "
test rg /
meow car /
jump bag /
meow tail
"

test ts with "
test rg/
meow car/
jump to sandbag/"

test ending with "
test rg/
meow car/
groom me/
jump to sandbag/
meow tail/
jump to sandbag/
meow head/
meow vent/
jump to tightrope/
e/
e/
jump to sandbag
/"

test t with "
n/
n/
x doors/
l/
x switch/
meow switch
/
help/
s/
jump to chairs/
score/
s/
smell/
smell box/
x box
"
		
test s with "
test t/
s/
smell/
smell chairs/
bite bag/
meow bag
"			
	

[here ends Marbles, D, and the Sinister Spotlight]
