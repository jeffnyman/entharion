"Swigian" by Rainbus North

[you can make a fire here; or just you can sleep here]

Release along with the source text.

Use scoring. Maximum score is 15.

When play begins:
	say "I don't like talking. Let's build a fire.";
	
LookFlag is a number that varies. LookFlag is 0.

Report looking:
	say "[exit list].[line break]";
		

IsAnExit is a number that varies. IsAnExit is 0.

To say exit list: 
	now IsAnExit is 0;
	repeat with way running through directions: 
		let place be the room way from the location of the player;
		if place is a room:
			say "[if IsAnExit is 1]; looking[otherwise]Looking[end if] [way], you see the [place]";
			now IsAnExit is 1;
	if IsAnExit is 0:
		say " none";
		

Crediting is an action out of world. Understand "help" or "about" or "credit" or "credits" or "info" as crediting.

Carry out crediting:
	say "Swigian was beta tested by Mike Sousa, Hugo Labrande, Victor Ojuel, Chandler Groover and heartless zombie.

The cover art is by Geni, a user on Wikimedia Commons. The license is a Attribution-ShareAlike 4.0 International (CC BY-SA 4.0), which can be read in full at https://creativecommons.org/licenses/by-sa/4.0/. The original image is located at https://commons.wikimedia.org/wiki/File:Sutton_Hoo_helmet_2016.png, and was retrieved in June of 2017. 

Type HINT at any time for a hint. Type it again for a better hint.";

Include (- Replace LanguageVerbMayBeName; -) before "Language.i6t"

Include (- 
[ LanguageVerbMayBeName w;
  if (w == ’long’ or ’short’ or ’normal’ or 'chisel' or 'crown'
		   or ’brief’ or ’full’ or ’verbose’)
	 rtrue;
  rfalse;
];
-) after "Commands" in "Language.i6t".

Part I - Rooms

Chapter 1 - Foresty region

Section 1- Lake

Lake is a room. "You are by a lake. The lake is still."

The stilllake is scenery in Lake. Understand "lake" or "water" or "still" as stilllake. The printed name of stilllake is "lake".

The LakeForest is scenery in Lake. Understand "forest" as the lakeforest. The printed name of LakeForest is "forest".

The description of LakeForest is "[one of]If you want to see it, just go there. I won't mention this again.[or]I can't see what you're talking about.[stopping]"

Instead of drinking the stilllake:
	say "You drink the water.";

Instead of entering the stilllake:
	try swimming;
	
Instead of taking the stilllake:
	say "Don't bother; but you can drink some."

Instead of touching something:
	say "You don't like touching anything.";

Does the player mean drinking the stilllake: it is likely.

Instead of searching the stilllake:
	try examining the player;

An axe is in Lake. Understand "steel" as axe.

After taking the axe:
	if the flint is carried by the player:
		say "Taken.

Now you have flint and steel. You can burn something small. Or cut something.";
	otherwise:
		say "Taken.

Now you can cut things.";

The firewood is nowhere. Understand "wood" or "fire" or "log" as firewood.

Understand "make [something]" or "build [something]" as burning.

Understand "fire" or "wood" as log.

Swimming is an action applying to nothing. Understand "swim" as swimming.

Carry out swimming:
	if the player is in the lake:
		say "Not now.";
	otherwise if the player is in WaterRegion:
		say "You are already in the water.";
	otherwise if the player is in Beach:
		say "It's not time to swim.";
	otherwise:
		say "You can not swim in that.";

Inswimming is an action applying to one visible thing.

Understand "swim [something]" or "swim in [something]" as inswimming.

Carry out inswimming:
	if the noun is the stilllake:
		say "Not now.";
	otherwise if the player is in WaterRegion:
		say "You are already in the water.";
	otherwise if the player is in Beach:
		say "It's not time to swim.";
	otherwise:
		say "You can not swim in that.";

Understand "swim [a direction]" or "paddle [a direction]" as going.

The campfire is nowhere. "You can see a campfire here. You are sleepy." The campfire is not portable. Understand "fire" as the campfire.

Understand "put out" as attacking. Understand "extinguish" as attacking.

Instead of attacking the campfire:
	say "It'll be safe as you sleep."

Instead of burning something:
	if the noun is not the firewood:
		say "Not right now.";
	otherwise if the flint is not carried by the player:
		say "You need flint and steel to start the fire.";
	otherwise if the axe is not carried by the player:
		say "You need the axe to make sparks with the flint.";
	otherwise if the player is not enclosed by Lake:
		say "Let's burn the wood by the lake. They're scared of water.";
	otherwise:
		say "You made a fire. Let's sleep.";
		now the firewood is nowhere;
		now the campfire is in Lake;
		
Instead of sleeping:
	if campfire is not in Lake:
		say "You need something to warm you up, first.";
	otherwise if the player is not enclosed by lake:
		say "That lake was the only place you feel good sleeping.";
	otherwise:
		increase the score by 1;
		now the player is in StandingStones;
		say "They came while you were asleep. You're not where you should be. You are hungry. You are cold.";
		repeat with current running through things carried by the player:
			now current is nowhere;

Section 2 - Forest

Forest is south from lake. "You are in a forest. It is night."

The hereforest is scenery in Forest. Understand "forest" as the hereforest. The printed name of the hereforest is "forest".

A log is in Forest. A log is not portable. Understand "tree" or "trunk" as log.

Instead of taking the log:
	say "It's too big to take. You [if the axe is not carried by the player]could[otherwise]can[end if] cut it[if the axe is not carried by the player], if you had an axe[end if]."

Instead of burning the log:
	say "The log is too big to burn."

Instead of cutting the log:
	if axe is not carried by the player:
		say "You don't have an axe.";
	otherwise:
		say "You cut the log up into firewood and take it. You [if the flint is carried by the player]can[otherwise]could[end if] burn it[if the flint is not carried by the player], if you had flint with your steel[end if].";
		now the log is nowhere;
		now firewood is carried by the player;

Instead of attacking the log:
	try cutting the log;

Section 3 - Mountain

Mountain is south from Forest. "You are on a mountainside. Everything is dry."

The realmountain is scenery in Mountain. The printed name of the realmountain is "mountain". Understand "mountain" or "mount" or "mountainside" as the realmountain.

Section 4 - Gravel Pit

Gravel Pit is east from Mountain. "You are in an empty gravel pit."

The realgravelpit is scenery in Gravel Pit. The printed name of the realgravelpit is "gravel pit". Understand "empty" or "gravel" or "pit" as the realgravelpit.

The flint is in Gravel Pit.

Instead of attacking the flint:
	if the axe is carried by the player:
		say "Think easier; just burn something.";
	otherwise:
		say "You have no steel.";

After taking the flint:
	if the axe is carried by the player:
		say "Taken.

Now you can burn something small.";
	otherwise:
		say "Taken.

Now you need steel.";

Chapter 2 - Beowulf

Section 1 - Standing Stones

StandingStones are a room. "You are surrounded by standing stones." The printed name of StandingStones is "Standing Stones"

The standing stones are scenery in StandingStones. Understand "rock" or "rocks" or "monolith" or "monoliths" or "stone" as the standing stones.

Shivering is an action applying to nothing.  Understand "shiver" as shivering.

Carry out shivering:
	if the player is in StandingStones:
		say "You shiver.";
	otherwise:
		say "You aren't cold.";

Instead of climbing the standing stones:
	say "You climb the stones, then come back down.";
	
Instead of going nowhere from StandingStones when the noun is up:
	try climbing the standing stones;

Section 2 - Moor

The Moor is west from StandingStones. "The moor is silent. Keep moving."

The realmoor is scenery in moor. The printed name of realmoor is "moor". Understand "moor" as realmoor.

MoorCounter is a number that varies. MoorCounter is 0.

Every turn:
	if the player is not in Moor:
		now MoorCounter is 0;
	otherwise:
		now MoorCounter is MoorCounter plus one;
		if MoorCounter is 1:
			say "They will see you. Go now.";
		otherwise if MoorCounter > 1:
			end the story saying "They found you";

Section 2 - Aftermath

Aftermath is west from Moor. "There was a battle here. Almost everything is trampled."

The battle is scenery in aftermath. The trampled things are scenery in aftermath. The trampled things are plural-named.

The meal is in aftermath. 

Every turn when the meal is carried by the player:
	say "[one of][or]You need a safe place to eat.[cycling]"

Instead of eating the meal:
	if the player is in Aftermath:
		say "It's not safe to eat here. Take it with you.";
	otherwise if the player is in Moor:
		say "It's not safe to stop here.";
	otherwise:
		increase the score by 1;
		say "You eat the food carefully. You feel much better now.";
		now the meal is nowhere;
		change the north exit of StandingStones to bog;
		now SingSong is 1;
		
SingSong is a number that varies. SingSong is 0.

Every turn when SingSong is 1:
	say "You hear music from[if the player is in StandingStones] the north[otherwise] somewhere nearby[end if]."

Every turn when the meal is nowhere:
	if the score < 2:
		if the player is in StandingStones:
			say "You hear music from the north.";
		otherwise:
			say "You hear distant music, from the standing stones.";
		

Instead of taking the meal:
	if the basket is not carried by the player:
		say "It slips through your hands. You need something to carry it.";
	otherwise:
		say "You lift the meal into the basket.";
		now the meal is in the basket;

Section 4 - Spring

The Spring is east from StandingStones. "Water wells up from below. You are safe here."

The welling water is scenery in Spring. Understand "spring" or "well" or "wells" as the welling water.

Instead of taking the welling water:
	say "You drink some water.";

The basket is a container in the spring.

Chapter 3 - Music

Section 1 - Bog

Bog is a room. "Small lights dance behind trees far away. You hear music."

Before going north from StandingStones:
	now SingSong is 0.

Instead of listening when the score is 2:
	say "You hear music."

Instead of going nowhere when the player is in Bog:
	say "You are still in the bog. You hear music."

The small lights are scenery in the bog. The trees are scenery in the bog. The music is scenery in the bog.

Section 2 - Sea side

Sea Side is north from the bog. "You are at the sea side. You hear music from the west."

The Realseaside is scenery in Sea Side. The printed name of Realseaside is "sea side". Understand "sea" or "side" or "water" or "saltwater" or "salt" as realseaside.

Instead of taking the realseaside:
	say "You don't want it."
	
Instead of entering the realseaside:
	say "Not yet.";
	
Instead of inswimming the realseaside:
	say "Later.";

The old spear is in Sea Side.

Instead of inserting the old spear into the basket:
	say "That is too large."

Section 3 - Cove 

The Cove is east from Sea Side. "You are in a cove. You are safe."

The realcove is scenery in Cove. Understand "cove" as the realcove. The printed name of the realcove is "cove".

Section 4 - Burial Mound

The Burial Mound is east from the Cove. "You are on a small mound with white flowers."

The small mound is scenery in the burial mound.

The white flowers are scenery in the burial mound. Understand "flower" as white flowers.

Instead of eating the white flowers:
	say "They have a better purpose.";
	
Instead of cutting the white flowers:
	say "To what end?";
	
Instead of taking the white flowers:
	say "They are fine where they are.";
	
Instead of smelling the white flowers:
	say "You inhale. You exhale.";
	
Understand "trample [something]" as entering.

Instead of entering the white flowers:
	say "Don't hurt them."

The old shield is in the burial mound.

Section 5 - Outside Mead-Hall

Outside-Mead-Hall is north from Sea Side. "You are outside the mead-hall. They are dancing inside. They have not heard you yet." The printed name of Outside-Mead-Hall is "Outside of the Mead-Hall".

The mead hall is a backdrop in Outside-Mead-Hall.  Understand "mead-hall" as mead hall.

Before going north from Outside-Mead-Hall:
	if the old spear is not enclosed by the player:
		say "You should be prepared for a fight." instead;
	otherwise if the old shield is not enclosed by the player:
		say "You'll need some protection as well." instead;	

Section 6 - Inside Mead-Hall

Inside-Mead-Hall is north from Outside-Mead-Hall. "The mead-hall is dark and dusty." The printed name of Inside-Mead-Hall is "Inside of the Mead-Hall".

The mead hall is scenery in Inside-Mead-Hall.

The opponent is a person. The opponent is in Inside-Mead-Hall.

Every turn when the player is in Inside-Mead-Hall:
	change the south exit of Inside-Mead-Hall to nowhere;

The ground hole is scenery.

Instead of entering the ground hole:
	try going down;

Instead of attacking the opponent:
	if the shield is not carried by the player:
		end the story saying "The shield was more important than you thought.";
	otherwise if the spear is carried by the player:
		say "You attack the opponent. He vanishes through a hole in the ground.";
		change the down exit of Inside-Mead-Hall to Burrow;
		now the opponent is nowhere;
		now the ground hole is in Inside-Mead-Hall;
		increase the score by 1;
	otherwise:
		end the story saying "You shouldn't have dropped the spear.";

DownFollowing is an action applying to nothing.  Understand "follow opponent" as downfollowing.

Carry out downfollowing:
	if the player is in Inside-Mead-Hall:
		try going down;
	otherwise:
		say "There is no need to do that."

Chapter 3 - Underground

Section 1 - Burrow

Burrow is a room. "You are in a burrow. The walls are made of packed dirt."

The walls of packed dirt are scenery in burrow. Understand "burrow" as the walls of packed dirt.

Section 2 - Corner

Tunnel is south from Burrow. "You are in a tunnel."

The realtunnel is scenery in tunnel. Understand "tunnel" as realtunnel. The printed name of realtunnel is "tunnel".

The shroud is in tunnel. The shroud is wearable.

Instead of waving the shroud:
	say "You're coming at this the wrong way.";

Sneezing is an action applying to nothing.

Understand "sneeze" as sneezing.

Carry out sneezing:
	say "Bless you. Now keep going."

Section 3 - Cave Pool

Cave Pool is south from Tunnel. "Water drips into a pool. A deep hole is here."

The dripping water is scenery in cave pool.

The deep hole is scenery in Cave Pool.

The hook is in Cave Pool. "A chain goes into the hole. It has a hook. You can put something on it." The hook is not portable. The hook is a supporter. Understand "chain" as the hook.

Instead of dropping the basket:
	say "Not yet."

Instead of inserting something into the hook:
	try putting the noun on the hook;

Before putting something on the hook:
	if the noun is not the basket:
		say "The [noun] slips off of the hook." instead;
		
Every turn when the basket is on the hook:
	if the old shield is in the basket:
		say "The basket goes into the hole. A bucket comes up. It has a worn coin in it[if the shroud is in the basket]. The shroud is in the bucket too[end if]. Your shield has been accepted.";
		now the hook is nowhere;
		now the basket is nowhere;
		now the bucket is in Cave Pool;
		if the shroud is in the basket:
			now the shroud is in the bucket;
		if the chisel is in the basket:
			now the chisel is in the bucket;
	otherwise:
		say "The basket is too light to sink down.";
		
The bucket is not portable. The bucket is a container. 

The worn coin is in the bucket.
	
Instead of inserting something into the deep hole:
	say "You should care for your things.";

Section 4 - Limestone Cave

Limestone Cave is east from Cave Pool. "You are in a limestone cave. The floor is covered in frost."

The frost covered floor is scenery in limestone cave. Understand "limestone" or "cave" as the frost covered floor.

The frozen door is a door. The frozen door is east of Limestone Cave and west of Inside-Burial-Mound. "There is a frozen door[if the vines are enclosed by Limestone cave] covered in vines[end if]."

The vines are scenery in Limestone Cave. 

Before cutting the door:
	if the vines are enclosed by Limestone Cave:
		try cutting the vines instead;

Instead of opening the door when the vines are enclosed by Limestone Cave:
	say "The vines hold the door shut."
	
Instead of attacking the vines:
	try cutting the vines.
	
Instead of cutting the vines:
	if the old spear is not carried by the player:
		say "You have nothing to cut the vines with.";
	otherwise:
		say "You cut off all the vines. Your spear freezes and breaks.";
		now the old spear is nowhere;
		now the vines are nowhere;
		increase the score by one;

Chapter 4 - Burial mound

Section 1 - Inside Burial Mound

Inside-Burial-Mound is a room. The printed name of Inside-Burial-Mound is "Inside Burial Mound".  "You are inside the burial mound."

The trueburialmound is scenery in Inside-Burial-Mound. Understand "burial" or "mound" as the trueburialmound. The printed name of the trueburialmound is "burial mound".

The wooden crypt is a closed enterable openable container in Inside-Burial-Mound. The wooden crypt is not portable.  Understand "coffin" or "dusty" as the wooden crypt.

The wooden crypt is scenery.

HalfOpen is a number that varies. HalfOpen is 0.

NamesDusty is a number that varies. NamesDusty is 1.

Understand "blow [something]" as rubbing.

Instead of unlocking the crypt with the chisel:
	try opening the crypt;

Instead of rubbing the name-runes:
	try rubbing the crypt;

Instead of rubbing the crypt:
	say "The dust comes off. There is a list of name runes on the crypt[if the chisel is carried by the player]. You can cut the crypt to write your name[end if].[line break]";
	now NamesDusty is 0;

The name-runes are in Inside-Burial-Mound. "[if NamesDusty is 1]There is a crypt here, covered in dust[otherwise]You see name-runes engraved on the crypt[end if]."The name-runes are plural-named. The name-runes are not portable. Understand "list" or "names" or "name" or "rune" or "runes" or "room" or "dust" as the name-runes. The printed name of the name-runes is "[if NamesDusty is 1]dust[otherwise]name-runes[end if]".

The description of the name-runes is "[if NamesDusty is 1]You can clean the dust.[otherwise if NameOnCrypt is 0]The last name rune is Ingeld.[otherwise]The last name rune is yours.[end if]"

The chisel is in Inside-Burial-Mound.

Report taking the chisel:
	say "[if NamesDusty is 0]The chisel is small. You can cut the crypt to write your name.[otherwise]The dust on the crypt makes you sneeeze.[end if]"

Before opening the wooden crypt:
	if NamesDusty is 1:
		say "The dust makes the crypt slippery." instead;
	otherwise if HalfOpen is 0:
		say "You open it a crack. Try again.";
		now HalfOpen is 1 instead;

Understand "write [something]" as cutting.

After opening the wooden crypt:
	say "Your opponent is here. He is wearing a shroud. He has a coin in his mouth. He fades away."
	
The mouth is part of the player. The mouth is a container. The mouth is proper-named. The printed name of the mouth is "your mouth". Understand "tongue" as the mouth.

Understand "put [other things] under [something]" as inserting it into.

Before inserting something into the mouth:
	if the noun is not the worn coin:
		if the noun is not the meal:
			say "You cannot put that in your mouth." instead;

Instead of inserting the meal into the mouth:
	try eating the meal;
	
Instead of eating the worn coin:
	try inserting the worn coin into the mouth.

Instead of dropping the chisel:
	say "You need this.";

NameOnCrypt is a number that varies. NameOnCrypt is 0.

Understand "hack [something]" or "chisel [something]" as cutting.

Understand "carve [something]" as cutting. Understand "name" as the name-runes.

Instead of cutting the name-runes:
	try cutting the crypt;

Instead of cutting the crypt:
	if the chisel is not carried by the player:
		say "You cannot cut the crypt without a chisel.";
	otherwise if NameOnCrypt is 1:
		say "Your name is on the crypt already.";
	otherwise:
		say "You write your name rune on the crypt.";
		now NameOnCrypt is 1;
	
Before entering the wooden crypt:
	if the crypt is not open:
		say "The crypt is not open." instead;
	otherwise if the shroud is not worn by the player:
		say "You're not wearing the shroud." instead;
	otherwise if the worn coin is not in the mouth:
		say "The coin is not in your mouth." instead;
	otherwise if NameOnCrypt is 0:
		say "You don't want the wrong name. It's not safe. You should cut the crypt." instead;

Understand "bless me" or "bless you" as praying.
	
After entering the wooden crypt:
	say "You get into the wooden crypt. It is small. You can close it now."

After closing the wooden crypt:
	say "You close the wooden crypt. They cannot follow you here. You have been this way before.";
	now the player is in Darkness;
	repeat with current running through things enclosed by the player:
		now current is nowhere;
	now the worn coin is nowhere;
	increase the score by one;
	
Section 2 - Darkness

Darkness is a dark room.

Rule for printing the description of a dark room:
	say "It is almost pitch dark. You can see almost nothing."

Chapter 5 - Dragon's lair

Section 1 - Lair

Lair is down from darkness. "You are in the lair. The room stinks. You are safe. He will protect you."

The truelair is scenery in lair. The printed name of the truelair is "lair". Understand "lair" as the truelair.

Instead of smelling something when the player is in Lair:
	say "The room stinks.";

Instead of smelling when the player is in Lair:
	say "The room stinks.";

After going down from darkness:
	change the up exit of Lair to nothing;
	try looking;

Chapter 6 - Armory

Armory is south from Lair. "You are in his armory[if the number of messy things in Armory > 0]. It needs to be cleaned[end if]."

TrueArmory is scenery in Armory. Understand "armory" as truearmory. The printed name of truearmory is "armory".

A thing can be messy or not messy. A thing is usually not messy.

The dusty armor is in armory.  The dusty armor is messy. 

Instead of rubbing the dusty armor:
	if the dusty armor is messy:
		say "You clean the armor.";
		now the dusty armor is not messy;
		now the printed name of the dusty armor is "clean armor";
	otherwise:
		say "It is already clean.";

The open cabinet is in Armory. The open cabinet is messy.

Instead of closing the open cabinet:
	if the cabinet is messy:
		say "You close the cabinet.";
		now the cabinet is not messy;
		now the printed name of the open cabinet is "closed cabinet";
	otherwise:
		say "It's already closed.";
		
Instead of opening the open cabinet:
	say "No.";

Before taking something when the player is in Armory:
	if the noun is the open cabinet:
		say "He likes this as it is." instead;
	otherwise if the noun is the dusty armor:
		say "He likes this as it is." instead;
	otherwise if the noun is the leaning pile:
		say "He likes this as it is." instead;
		

A dry snack is in Armory. A dry snack is messy. A dry snack is edible.

Before taking the dry snack:
	say "You eat it.";
	now the dry snack is nowhere instead;

Instead of dropping the dry snack:
	say "But you're hungry.";
	
ArmoryDone is a scene.  ArmoryDone begins when the number of messy things in Armory is 0.

The leaning pile is in Armory. The leaning pile is messy. The description of the leaning pile is "It needs to be pushed."

Instead of pushing the leaning pile:
	if the leaning pile is messy:
		say "Now it's not leaning.";
		now the leaning pile is not messy;
		now the printed name of the leaning pile is "straight pile";
	otherwise:
		say "It's already straight.";
		
Instead of pulling the leaning pile:
	try pushing the leaning pile.

When ArmoryDone begins:
	now readycounter is readycounter plus one;
	increase the score by one;
	say "Now it's not messy.";

Chapter 7 - Remains

Section 1 - Boneyard

Boneyard is west from Lair. "The bones of the common are piled here."

The common bones are scenery in Boneyard. Understand "bone" or "pile" or "piles" as the common bones.

Section 2 - The valiant

The Home of the Valiant is west from Boneyard. "The bones of the valiant are here, each with spear and helmet."

The Valiant bones are scenery in The Home of the Valiant. Understand "spear" or "spears" or "bone" or "helmet" or "helmets" as the valiant bones.

Section 3 - The noble

The Nobles' End is west from the home of the valiant. "The bones of the nobles are laid here in gold."

The noble bones are scenery in the Nobles' End. Understand "gold" or "nobles" or "bone" as the noble bones.

Section 4 - The kings

The Hall of Kings is west from the Nobles' end. "Three thrones are here, with three kings."

The three-thrones are scenery in the hall of kings. Understand "three" or "thrones" or "throne" or "three-thrones" as the three-thrones. The printed name of the three-thrones is "three thrones".

The three-kings are scenery in the hall of kings.  Understand "three" or "kings" or "three kings" or "king" or "oldest" or "old" or "crownless" as the three-kings. The printed name of the three-kings is "three kings".

The dull crown is in the hall of kings. "A crown is cast down here."

Crowning is an action applying to one thing. Understand "crown [something]" as crowning.

Carry out crowning:
	if the dull crown is not carried by the player:
		say "You have nothing to crown anyone with.";
	otherwise:
		try putting the dull crown on the noun;

Report taking the dull crown:
	say "The oldest king is crownless."
	
Instead of putting something on the three-kings:
	if the noun is the dull crown:
		say "The king bows his head. You put the crown on him. You may leave.";
		now ReadyCounter is ReadyCounter plus one;
		now the dull crown is nowhere;
		increase the score by one;
	otherwise:
		say "There is only one thing the king [if the dull crown is nowhere]wanted[otherwise]wants[end if].";

Before going east from the Hall of Kings:
	if the dull crown is carried by the player:
		say "The king is crownless. It would be rude to leave." instead;

Instead of wearing the dull crown:
	say "It is not yours.";

Instead of rubbing the dull crown:
	say "Its age will never come off."

Chapter 8 - Treasures

TreasureRegion is a region. New Treasures, Old Treasures, and Ancient Treasures are in TreasureRegion.

TreasuresCounter is a number that varies. TreasuresCounter is 0.

A treasure is a kind of thing. 

To say treasuresaying:
	say "[if TreasuresCounter < 3]. His treasures are wrong. Put them right[end if]. ";

A thing has a room called TreasureRoom. TreasureRoom is usually lair.

A treasure can be replaced or not replaced. A treasure is usually not replaced.

Before taking a treasure: 
	if the player is in the TreasureRoom of the noun:
		say "It is already in its place." instead;
	otherwise:
		say "Put it in its place.";
		
Report dropping a treasure:
	if the player is in the TreasureRoom of the noun:
		say "It is in its place.";
		now the noun is replaced;
		now TreasuresCounter is TreasuresCounter plus one;
		if TreasuresCounter is 3:
			now readycounter is readycounter plus one;
			increase the score by one;
	otherwise if the noun is the ring mail:
		if the location of the player is Armory:
			say "That is not the right place.";

Instead of wearing the ring mail:
	say "It is not sized for our kind."

Section 1 - New treasures

New Treasures is east from lair. "This treasure room is full of tapestries, musical instruments, and iron[treasuresaying]"

The tapestries are scenery in New Treasures. The musical instruments are scenery in New Treasures. The iron is scenery in New Treasures.

The canopic jar is a treasure in New Treasures. The treasureroom of the canopic jar is Ancient Treasures.

Instead of opening the canopic jar:
	say "It's ancient; he wouldn't be pleased."

Section 2 - Old treasures

Old Treasures is east from New Treasures. "This treasure room is full of pottery, statues and silver[treasuresaying]"

The pottery and statues and silver are scenery in Old Treasures. Understand "pot" or "vase" as the pottery. Understand "statue" as the statues. The statues are plural-named.

The ring mail is a treasure in Old Treasures. The treasureRoom of the ring mail is new Treasures.

Section 3 - Ancient Treasures

Ancient Treasures is east from Old Treasures. "This room is full of sarcophagi, rotten spices and gold[treasuresaying]"

The sarcophagi and the rotten spices and the gold are scenery in Ancient Treasures. Understand "sarcophagus" as the sarcophagi. The sarcophagi are plural-named.

The marble bust is treasure in Ancient Treasures. The treasureroom of the marble bust is old treasures.

Chapter 9 - Outside

FiryRegion is a region. Entrance, Rocky Tumble, Scrub, Cliff are in FiryRegion.

A thing can be obstructing or not obstructing. A thing is usually not obstructing.

Report taking an obstructing thing:
	say "At the cliff, you can throw this."

FireDone is a scene. FireDone begins when the number of obstructing things in FiryRegion is 0.

When FireDone begins:
	increase the score by one.

CurrentObstruct is a thing that varies. CurrentObstruct is the sharp iron.

Section 1 - Entrance 


Entrance is north from Lair. "You are by a barrow. The ground is on fire[if the number of obstructing things in firyregion > 0]. They are trying to stop him; clear his way[end if]."

The barrow is scenery in Entrance.  The description of the barrow is "The barrow is a grave, a tomb, a cave."

The ground fire is scenery in Entrance.

The sharp iron is an obstructing thing in entrance.

After going north from Lair:
	try looking;
	change the south exit of Entrance to nowhere;

ReadyCounter is a number that varies. ReadyCounter is 0;

Before going north from Lair:
	if ReadyCounter < 3:
		say "His protection comes with a price.  His house is not in order." instead;


Section 2 -Rocky Tumble

Rocky Tumble is west from Entrance.

The tumbled rocks are scenery in rocky tumble. Understand "rocky" or "rock" or "tumble" as the tumbled rocks. The tumbled rocks are plural-named.

The jagged rock is an obstructing thing in Rocky Tumble.

Instead of looking under the jagged rock:
	say "It is small.";
	
Instead of climbing the jagged rock:
	say "It is small.";

Section 3 - Scrub

Scrub is east from Entrance.

The scrubby plants are scenery in scrub. Understand "scrub" as the scrubby plants.

The thornbush is an obstructing thing in Scrub. Understand "bush" or "thorn" or "thorns" as thornbush.

Section 4 - Cliff

Cliff is north from Entrance. "The fire stops by the cliff. The water is inviting[if the number of obstructing things in firyregion > 0]. You can throw something[otherwise]. You can go now.[end if]"

The truecliff is scenery in Cliff. Understand "cliff" as the truecliff. The printed name of truecliff is "cliff".

The ocean water is scenery in Cliff.

Instead of throwing something at something when the player is in Cliff:
	try dropping the noun;

Instead of dropping something when the player is in Cliff:
	say "You throw [the noun] in the water.";
	now the noun is nowhere;
	if the number of obstructing things in firyregion is 0:
		say "You can go now.";
	otherwise:
		if the noun is CurrentObstruct:
			now CurrentObstruct is a random obstructing thing in FiryRegion;

Before going down from Cliff:
	if the number of obstructing things in firyregion > 0:
		say "Something is in his way. Clear his path." instead;
	otherwise:
		say "You hear him come home. You fall."

Instead of jumping when the player is in Cliff:
	if the number of obstructing things in firyregion > 0:
		say "Something is in his way. Clear his path." instead;
	otherwise:
		say "You jump from the cliff.";
		now the player is in Shallow Waters;

Chapter 10 - Coastline

WaterRegion is a region. Coastline, Deeper Waters, Shallow Waters, Choppy Waters are in WaterRegion.

Instead of going somewhere in WaterRegion when the player is not in the boat:
	say "You need the boat."

Understand "dive" as swimming.

Section 1 - Shallow Waters

Shallow Waters is down from Cliff.

The trueshallowwaters are scenery in shallow waters. The printed name of the trueshallowwaters is "shallow waters". Understand "shallow" or "waters" or "water" as the trueshallowwaters.

The boat is a vehicle in Shallow Waters. Understand "ship" as boat.

Instead of going up to Cliff when the player is in the boat:
	say "The boat cannot go up."

Instead of going up to Cliff when the player is not in the boat:
	say "It is too steep.";

Instead of going east to Coastline when the player is not in the boat:
	say "You need the boat."

Section 2 - Coastline

Coastline is east from Shallow Waters. "You are following the coastline; you are close to home."

The coast is scenery in coastline. Understand "coastline" as the coast.

Section 3 - Deeper waters

Deeper Waters is north from Coastline. "You are in deep waters. Something is under the water."

The truedeepwaters are scenery in deeper waters. The printed name of the truedeepwaters is "deep waters". Understand "deep" or "waters" or "water" as the truedeepwaters.

The csomething is scenery in deeper waters. Understand "something" as the csomething. The printed name of the csomething is "something".

Section 4 - Choppy waters

Choppy Waters is east from Deeper Waters. "The water is choppy here."

The truechoppywaters are scenery in choppy waters. The printed name of the truechoppywaters is "choppy waters". Understand "choppy" or "waters" or "water" as the trueshallowwaters.

The shark is an animal in Choppy Waters.

After going east to choppy waters:
	now the player is in Choppy Waters;
	say "A shark has tipped the boat. You are in the water.";
	change the west exit of Choppy Waters to nowhere;
	
Before entering the boat when the player is in Choppy Waters:
	if the shark is in Choppy Waters:
		say "The shark prevents you. You must attack it." instead;
	
Instead of attacking the shark for the first time:
	say "The shark fights back.";

Instead of attacking the shark for the second time:
	try looking;
	say "You punch the shark away.";
	now the shark is nowhere;

Instead of going east from Choppy Waters when the player is not in the boat:
	say "You need the boat."

Sharkjumping is an action applying to nothing. Understand "jump shark" as sharkjumping.

Carry out sharkjumping:
	if the shark is enclosed by the location of the player:
		say "You leap over the shark, crying 'Victor!'";
	otherwise:
		say "This is meaninglesss."

Section 5 - Beach

BeachWaterRegion is a region. WaterRegion is in BeachWaterRegion. Beach is in BeachWaterRegion.

Beach is east from Choppy Waters. "You are at the beach. You don't need the boat."

The truebeach is scenery in beach. Understand "beach" as the truebeach. The printed name of the truebeach is "beach".

Report exiting when the player is in Beach:
	increase the score by one;
	say "You are hungry again.";
	
Instead of entering the boat when the player is in Beach:
	say "You don't need the boat."

Instead of going west from Beach when the player is not in the boat:
	say "No. Time to go home."

Chapter 11 - Mountains

The dry land is scenery in Beach.

Instead of going north from Beach when the player is in the boat:
	say "The boat can't go on dry land."

Section 1 - Foothill

Foothill is north from Beach. "They don't like it here. The mountains are between you and home."

The distant mountains are scenery in Foothill.

Section 2 - Path

Footpath is east from Foothill. "This path was made by them. Be careful."

The path is scenery in Footpath.

Section 3 - Outside House

Outside-House is east from footpath. "You are outside one of their houses. It is very small." The printed name of Outside-House is "Outside House"

The very small house is scenery in Outside-House.

Section 4 -Inside House

Inside-House is east from Outside-House. "You are in the small house." The printed name of Inside-House is "Inside House".

The small house interior is scenery in Inside-House.

The fresh snack is in Inside-House.

Instead of eating the fresh snack:
	say "You eat it.";
	now the fresh snack is nowhere;
	increase the score by one;

Chapter 12 - Waterfall

Section 1 - Peak

Peak is up from Foothill. "You are close to home. A pool of water is here[if the boulders are in Peak]. The boulders are blocking it[otherwise]. A waterfall comes out of it[end if]."

Waterfall is a backdrop. Waterfall is in Peak. Waterfall is not portable.

The water pool is scenery in peak.

Before going up from Foothill:
	if the fresh snack is not nowhere:
		say "You are too weak to climb. You need to eat." instead;
		
Section 2 - Slope

Slope is east from Peak. "The ground slopes up here."

The sloping ground is scenery in Slope.

Section 3 - Rocky Summit

Rocky Summit is up from Slope. "You are on a rocky summit. There is a cliff to the west."

The truerockysummit is scenery in Rocky Summit. Understand "rocky"or "summit" or "cliff" as the truerockysummit. The printed name of the truerockysummit is "rocky summit".

There are some boulders in Rocky Summit. Some boulders are plural-named. Understand "boulder" as boulders.

Instead of taking the boulders:
	say "They are too heavy to lift[if the boulders are in Peak]. You should push them[end if].";
	
Instead of pushing the boulders to something:
	if the boulders are not in Peak:
		say "You push the boulders down the cliff.";
		now the boulders are in Peak;
	otherwise:
		say "Their purpose is accomplished.";
	
Instead of pushing the boulders:
	if the boulders are not in Peak:
		say "You push the boulders down the cliff.";
		now the boulders are in Peak;
	otherwise:
		say "Their purpose is accomplished.";

[Instead of pushing the boulders a direction:
	say "You push the boulders, and they roll down off the cliff.";
	now the boulders are nowhere;]

Section 4 - Slick Drop

Slick Drop is north from Peak. "The ground here is [if the boulders are not in Peak]dry now[otherwise]slick[end if].  It goes straight down."

The slick ground is scenery in slick drop.

Before going down from Slick Drop:
	if the boulders are not in Peak:
		say "The waterfall is too strong." instead;

The waterfall is scenery in Slick Drop.

Section 5 -Halfway down

HalfRegion is a region. Eastern Ledge is in HalfRegion. Western Ledge is in HalfRegion.

Eastern Ledge is down from slick drop.

Western Ledge is west from Eastern Ledge.

After going down from Slick Drop:
	change the up exit of Eastern Ledge to nowhere.

Rockfall is a number that varies. Rockfall is 0.

FallRegion is a room that varies. FallRegion is Eastern Ledge.

Every turn when the player is in HalfRegion:
	now Rockfall is Rockfall plus one;
	if Rockfall is 1:
		say "The boulders are coming loose. One is falling above you.";
		now FallRegion is the location of the player;
	otherwise if Rockfall is 2:
		if the location of the player is FallRegion:
			end the story saying "You are crushed.";
		otherwise:
			say "A boulder smashes on the other side. You hear another boulder above you.";
			now FallRegion is the location of the player;
	otherwise if Rockfall is 3:
		if the location of the player is FallRegion:
			end the story saying "You are crushed.";
		otherwise:
			say " A boulder smashes on the other side. You hear two boulders above you.";
	otherwise if Rockfall is 4:
		say "The boulders miss you. They opened a path.";
		change the down exit of Eastern Ledge to Soggy Ground;
		change the down exit of Western Ledge to Soggy Ground;
		increase the score by one;

Chapter 13 - Fen

Section 1 - Soggy Ground

Soggy Ground is a room. "The ground is marshy here."

The marshy ground is scenery in soggy ground.

Section 2 - Fen

Fen is north from Soggy Ground. "You are in a fen. You hear wolves."

The wolves are scenery in Fen.

Instead of listening to Fen:
	try listening to the wolves;
	
Instead of listening to the wolves:
	say "They are howling.";

The truefen is scenery in Fen. The printed name of the truefen is "fen". Understand "fen"as the truefen.

Section 3 - Mist

Mist is north from Fen. "You are in the mist. You are safe. You are not lost."

The truemist is scenery in Mist. Understand "mist" as the truemist. The printed name of truemist is "mist".

MistCounter is a number that varies. MistCounter is 0.

Report going north from Fen:
	change the south exit of Mist to Mist;
	change the north exit of Mist to Mist;
	change the east exit of Mist to Mist;
	change the west exit of Mist to Mist;

LastMistDirection is a direction that varies.

After going to Mist from Mist:
	try looking;
	say "Now you are closer.[paragraph break]";
	now MistCounter is MistCounter plus one;
	if MistCounter is 1:
		say "You'll be home soon.";
	otherwise if MistCounter is 2:
		say "There is some blood in the water. Now it's gone.";
	otherwise if MistCounter is 3:
		say "You hear the wolves.";
	otherwise if MistCounter is 4:
		say "It feels chilly.";
	otherwise if MistCounter is 5:
		say "The ground is getting firmer.";
	otherwise if MistCounter is 6:
		say "You see out of the mist.";
		change the north exit of mist to Frozen Trees;
		change the east exit of mist to nothing;
		change the west exit of mist to nothing;
		change the south exit of mist to nothing;

Chapter 14 - Mere

Section 1 - Frozen trees

Frozen Trees is a room. "You are in a forest. The trees are covered by snow."

After going north to Frozen Trees:
	try looking;
	change the south exit of Frozen trees to nowhere;
	increase the score by one;

The snow trees are scenery in Frozen Trees.

Section 2 - Mereside

Mereside is north from Frozen Trees. "You are by the mere. It is glowing."

The mere is scenery in Mereside.

The serpent is an animal in Mereside. Understand "snake" or "viper" or "adder" as the serpent.

Instead of attacking the serpent:
	say "The serpent is not your enemy. You are almost home. You can ask the serpent about [italic type]them[roman type]."

Talking to is an action applying to one thing. Understand "talk to [someone]" as talking to.

Carry out talking to:
	say "You don't want to talk to [the noun].";

CurrentTopic is some text that varies. CurrentTopic is "[italic type]them[roman type]".

SingleAsking is an action applying to one topic.

Understand "ask about [text]" as SingleAsking.

CurrentPerson is a person that varies. CurrentPerson is the serpent.

Carry out singleasking:
	if the number of animals in the location of the player > 0:
		now CurrentPerson is a random animal in the location of the player;
	otherwise:
		now CurrentPerson is a random person in the location of the player;
	try asking CurrentPerson about the topic understood;

Instead of talking to the serpent:
	say "You can ask the serpent about [CurrentTopic]."

Instead of asking the serpent about "them":
	say "The serpent says 'They stay away. They hate the fire.'

You can ask the serpent about fire.";
	Now CurrentTopic is "fire".

Instead of asking the serpent about "fire":
	say "The serpent says 'The fen-fire frightens them. I have seen Hrothgar.'

You can ask about Hrothgar.";
	Now CurrentTopic is "Hrothgar".

Instead of asking the serpent about "Hrothgar":
	say "The serpent says 'Hrothgar is calling for help.'

You can ask about help.";
	Now CurrentTopic is "help".

Instead of asking the serpent about "help":
	say "The serpent says 'He is calling for Beowulf.'

You can ask about Beowulf.";
	Now CurrentTopic is "Beowulf".

Instead of asking the serpent about "Beowulf":
	say "The serpent says 'Beware of Beowulf.'

The serpent swims away. Come home. You are almost there.";
	increase the score by one;
	now the serpent is nowhere;
	change the north exit of mereside to In-Mere;

Section 3 - In Mere

In-Mere is a room. "You are swimming in the fen-fire." The printed name of In-Mere is "In Mere". 

The fen-fire is scenery in In-Mere. Understand "mere" or "fen" or "fire" as the fen-fire.

Section 4 - Center of Mere

Center of Mere is north from In-Mere. "You are in the center of the mere."

Chapter 15 - Home

Descent is down from Center of Mere. "It takes them all day to reach the bottom."

Bottom is down from Descent. "You are faster than them."

After going down from Descent:
	try looking;
	change the up exit of descent to nowhere;

Cavern is north from Bottom. "You are in a cavern. You are home. You are safe[first time].

You are thirsty, hungry, and tired[only]."

Larder is east from cavern. "You are in your larder."

The truelarder is scenery in larder. Understand "larder" as the truelarder. The printed name of truelarder is "larder".

There is a last snack in the larder.

Instead of eating the last snack:
	say "They try to get away, but you eat them.";
	now the last snack is nowhere;

Mead Room is west from Cavern. "The mead you have taken is stored here."

The pale mead is in Mead Room.

Instead of drinking the pale mead:
	say "You drink the mead. You are not thirsty.";
	now the pale mead is nowhere;

Mother is north from Cavern. "Mother is here."

Instead of going north from Cavern:
	if the last snack is not nowhere:
		say "You are still hungry.";
	otherwise if the pale mead is not nowhere:
		say "You are still thirsty.";
	otherwise:
		now the player is in Mother;
		increase the score by one;
		end the story finally saying "You are with mother."

Part 2 - Random stuff


Understand "batter" as attacking.

LookBehinding is an action applying to one thing. Understand "look behind" as lookbehinding.

Carry out lookbehinding:
	say "You do not need to look behind anything, with your senses.";

Praying is an action out of world. Understand "pray" as praying. 

Carry out praying:
	say "Father ure, thu the art in heofenan..."

[The Hades deadman switch is a backdrop. The Hades deadman switch is everywhere.

The description of the Hades deadman switch is "If you would like to try to access the deadman switch remotely, type SWI."]
	
Singing is an action applying to nothing. Understand "sing" or "yell" as singing.

Carry out singing:
	say "Hwæt! We Gar-Dena in gear-dagum[line break]þeod-cyninga,   þrym gefrunon,[line break]hu ða æþelingas   ellen fremedon![line break]Oft Scyld Scefing   sceaþena þreatum[line break]monegum mægþum   meodo-setla ofteah;";

 The block vaguely going rule response (A) is "I don't like talking, but I would like to know what direction you want to go to."
 The can't take yourself rule response (A) is "You always have yourself."

 The can't take other people rule response (A) is "Don't take people. You have better things to do."

  The can't drop yourself rule response (A) is "Don't hate yourself so much. I like you.".

  The can't eat unless edible rule response (A) is "Find a snack instead.".

  The examine undescribed things rule response (A) is "[The noun]? That is what it is[first time]. I'll tell you everything that's important the first time[only]."

   The standard looking under rule response (A) is "It's not worth it to look under."

The block showing rule response (A) is "No one wants to see that, dear."
	
The block throwing at rule response (A) is "Throwing is beneath you."
	
The block attacking rule response (A) is "Everything in time; you're coming at this the wrong way.".

The kissing yourself rule response (A) is "You kiss yourself. I don't like talking."
	
The block kissing rule response (A) is "No."

The block answering rule response (A) is "I don't like talking."

The telling yourself rule response (A) is "I don't like talking."
The block telling rule response (A) is "I don't like talking."

The block asking rule response (A) is "I don't like talking."

The standard report waiting rule response (A) is "You wait.".

The report touching yourself rule response (A) is "Why? Don't tell me."

The report touching other people rule response (A) is "They feel normal, dear."
The report touching things rule response (A) is "There will never be a need for that. I'll tell you what you see."

The can't pull people rule response (A) is "No. Be direct."
	
The can't push people rule response (A) is "No. Be direct."

The can't turn people rule response (A) is "No. Be bold."
	
The innuendo about squeezing people rule response (A) is "They pop a little before they get free."
	
The description of the player is "You look like me."

You is part of the player.  You is a person. The description of you is "I look like you."

The block saying yes rule response (A) is "No.".

The block saying no rule response (A) is "I agree.".

The block burning rule response (A) is "You can burn firewood, when you have flint and steel. Nothing else."

The block waking up rule response (A) is "You already woke up."

The block thinking rule response (A) is "[one of]Think again.[or]Clever.[or]You think of home and snacks.[stopping]".

The report smelling rule response (A) is "There's no need; I'll tell you what you sense."

The report listening rule response (A) is "I'll tell you the first time when you hear something." 

The report tasting rule response (A) is "Eat, don't taste."
	
The block cutting rule response (A) is "I'll tell you when you can cut something. This isn't the time.".
   
The parser error internal rule response (E) is "I didn't understand the thing you were talking about.";

The parser error internal rule response (X) is "[LookAction] [no line break] ";

The parser error internal rule response (N) is "I didn't understand the first thing you said."; 

The parser error internal rule response (B) is "Talk less; just ";[fix this and the next one]

The parser error internal rule response (C) is "Talk less; just (go)";
	
	The report jumping rule response (A) is "You leap. It doesn't help."
	
	The block tying rule response (A) is "I don't want you to tie anything."
	
	The block drinking rule response (A) is "You aren't thirsty."
	
Instead  of drinking the welling water:
	try taking the welling water;

	The block saying sorry rule response (A) is "Never apologize."
	The block swinging rule response (A) is "No. Be direct."
	
	The can't rub another person rule response (A) is "No. Be direct."
	
	The block buying rule response (A) is "Why bother?"

	The block climbing rule response (A) is "If you want to go up, go up. If you can't, then don't."
	
	The block sleeping rule response (A) is "Not after what happened last time.".

	The requested actions require persuasion rule response (A) is "Fight, or talk.".

	The carry out requested actions rule response (A) is "They can't.".

	The can't go that way rule response (A) is "Not that way."

	The immediately undo rule response (B) is "You've done nothing to undo.".
	
	The immediately undo rule response (C) is "Something unnatural is blocking you.".
	
	The immediately undo rule response (D) is "Something unfathomable stops you.".
	
	The immediately undo rule response (E) is "It is undone."

	The restart the game rule response (A) is "Do you wish to undo it all?".

	The restart the game rule response (B) is "You can't; I don't know why.".
	
	The restore the game rule response (A) is "You can't; I don't know why.".
	
	The restore the game rule response (B) is "Yes, I remember. You were here...".
	
	The save the game rule response (A) is "I can't keep you here. I don't know why.".
	
	The save the game rule response (B) is "I'll remember.".


To say lookaction:
	say "[bold type][The location of the player][roman type][line break][The description of the location of the player][paragraph break]";
	say "[Exit List]. ";

Instead of waving hands:
	say "No. Be more direct."

XYZZYing is an action applying to nothing. Understand "xyzzy" as XYZZYing.

Carry out xyzzying:
	say "[one of]The gods of old treasure their names. Don't speak it again.[or][Deathtext][stopping]"

To say deathtext:
	say "I'll remember you.";
	end the story saying "You have died."

Part 3 - Testing

Test fire with "take axe / s / cut log / s / e / take flint / w / n /  n / burn firewood / sleep" [11 commands]

Test meal with "e /  take basket / w / w / w / take meal /e /e / eat meal / n"; [10 commands]

Test music with "n / take old spear / e / e / take old shield / w / w / n / n / attack opponent"; [10 commands]

Test underground with " d /  s  / take shroud / s / put basket on hook / put shield in basket / take coin / e / cut vines / open door / e" [ 10 commands]

Test crypt with "rub crypt / read names / take chisel / cut crypt / open wooden crypt / open wooden crypt / wear shroud / put coin in mouth / enter wooden crypt / close wooden crypt" [10 commands]

Test lair with " d "[1 command]

Test treasures with " e / take jar / e / take mail / e / take bust / drop jar / w / drop bust / w / drop mail / w" [12 commands]

Test armory with  " s / clean armor / close cabinet / take snack / eat snack / push pile / n" [7 commands]

Test boneyard with "w / w / w / w / take crown / put crown on king / e / e / e / e" [10 commands]

Test outside with "n / take sharp iron / w / take jagged rock / e / e / take thornbush / w / n / drop all" [10 commands]

Test boat with "d / enter boat / e / n / e / attack shark / attack shark / enter boat / e / out " [10 commands]

Test house with "n / e / e / e / eat snack / w / w / w / u" [9 commands]

Test waterfall with "e / u / push boulders / d / w / n / d / w / e / d" [9 commands]

Test mist with "d / n / n / n / n / n / n / n / n / n" [10 commands]

Test serpent with "n / attack serpent / ask serpent about them / ask serpent about fire / ask serpent about hrothgar / ask serpent about help / ask serpent about beowulf/ n / n" [8 commands]

Test home with "d / d / n / e / eat last snack / w / w / drink mead / e / n" [10 commands]

Test megatest with "test fire / test meal / test music / test underground / test crypt / test lair / test treasures / test armory / test boneyard / test outside / test boat / test house / test waterfall / test mist / test serpent / test home"

Test megatest1 with "test fire / test meal / test music / test underground / test crypt / test lair / test treasures / test armory / test boneyard / test outside / test boat"

Part 4 - Hinting

Hinting is an action out of world. Understand "hint" as hinting.

Carry out hinting:
	if the score > 13:
		if the last snack is not nowhere:
			if the player is in the location of the last snack:
				say "Eat the snack.";
			otherwise:
				let way be the best route from the location of the player to the location of the last snack;
				say "If you want me to pick, go [way].";
		otherwise if the pale mead is not nowhere:
			if the player is in the location of the pale mead:
				say "Drink the mead.";
			otherwise:
				let way be the best route from the location of the player to the location of the pale mead;
				say "If you want me to pick, go [way].";
		otherwise:
			let way be the best route from the location of the player to Mother;
			say "Go [way].";
	otherwise if the score is 13:
		if the player is not in the location of the serpent:
			let way be the best route from the location of the player to the location of the serpent;
			say "Go [way].";
		otherwise:
			say "[one of]Have you talked to the serpent?[or]Ask the serpent about [CurrentTopic].[stopping]";
	otherwise if the score is 12:
		if the player is not in mist:
			let way be the best route from the location of the player to Mist;
			say "Go [way].";
		otherwise:
			say "Go north.";
	otherwise if the score is 11:
		if the boulders are not in Peak:
			if the player is not in the location of the boulders:
				let way be the best route from the location of the player to the location of the boulders;
				say "If you want me to pick, go [way].";
			otherwise:
				say "Push the boulders.";
		otherwise:
			if Eastern Ledge is not FallRegion:
				if the player is in Eastern Ledge:
					say "Just wait.";
				otherwise:
					let way be the best route from the location of the player to Eastern Ledge;
					say "Go [way].";
			otherwise:
				if the player is in Western Ledge:
					say "Just wait.";
				otherwise:
					let way be the best route from the location of the player to Western Ledge;
					say "Go [way].";
	otherwise if the score is 10:
		if the fresh snack is not nowhere:
			if the player is not in the location of the fresh snack:
				let way be the best route from the location of the player to the location of the fresh snack;
				say "I smell something good; go [way].";
			otherwise:
				say "Eat the snack.";
		otherwise:
			say "I'm not sure what you should do.";
	otherwise if the score is 9:
		if the player is not in BeachWaterRegion:
			let way be the best route from the location of the player to the location of the boat;
			say "If you want me to pick, go [way].";
		otherwise if the shark is in the location of the player:
			say "Attack the shark until it leaves.";
		otherwise if the player is not in the boat:
			say "Get in the boat.";
		otherwise if the player is enclosed by Beach:
			say "Get out of the boat.";
		otherwise:
			 let way be the best route from the location of the player to Beach;
			say "If you want me to pick, go [way].";
	otherwise if the score is 8:
		if the number of obstructing things that are not nowhere is 0:
			say "I'm not really sure what you should do.";
		otherwise:
			if currentobstruct is carried by the player:
				if the player is in Cliff:
					say "[one of]You can throw it away here.[or]Throw [the currentobstruct].[stopping]";
				otherwise:
					let way be the best route from the location of the player to Cliff;
					say "If you want me to pick, go [way].";
			otherwise:
				if the player is in the location of currentobstruct:
					say "[one of]Get rid of [the currentobstruct].[or]Take [the currentobstruct].[stopping]";
				otherwise:
					let way be the best route from the location of the player to the location of currentobstruct;
					say "If you want me to pick, go [way].";
	otherwise if the score > 4:
		if the number of messy things in Armory > 0:
			if the player is not in Armory:
				let way be the best route from the location of the player to Armory;
				say "If you want me to pick for you, go [way].";
			otherwise:
				say "You should take care of [the random messy thing in the location of the player].";
		otherwise if treasurescounter < 3:
			let currentTreasure be a random not replaced treasure;
			if currentTreasure is not carried by the player:
				if currenttreasure is in the location of the player:
					say "Take [the currenttreasure].";
				otherwise:
					let way be the best route from the location of the player to the location of currenttreasure;
					say "If you want me to pick for you, go [way].";
			otherwise:
				if the player is in treasureroom of currenttreasure:
					say "Drop [the currenttreasure].";
				otherwise:
					let way be the best route from the location of the player to treasureroom of currenttreasure;
					say "If you want me to pick, go [way].";
		otherwise if the dull crown is not nowhere:
			if the dull crown is not carried by the player:
				if the dull crown is not in the location of the player:
					let way be the best route from the location of the player to the location of the dull crown;
					say "If you want me to pick, go [way].";
				otherwise:
					say "Take the crown.";
			otherwise:
				if the player is not in the hall of kings:
					let way be the best route from the location of the player to the hall of kings;
					say "If you want me to pick, go [way].";
				otherwise:
					say "Put the crown on the king.";
	otherwise if the score is 4:
		if the shroud is not enclosed by the player:
			if the shroud is not enclosed by the location of the player:
				let way be the best route from the location of the player to the location of the shroud, using doors;
				say "You need the shroud to the [way].";
			otherwise:
				say "Take the shroud.";
		otherwise if NamesDusty is 1:
			if the player is not enclosed by Inside-Burial-Mound:
				let way be the best route from the location of the player to Inside-Burial-Mound, using doors;
				say "You need to be in the burial mound, to the [way].";
			otherwise:
				say "Clean the crypt.";
		otherwise if the wooden crypt is closed:
			if the player is enclosed by the wooden crypt:
				say "Go down.";
			otherwise:
				if the player is not enclosed by Inside-Burial-Mound:
					let way be the best route from the location of the player to Inside-Burial-Mound, using doors;
					say "You need to be in the burial mound, to the [way].";
				otherwise:
					say "Open the crypt.";
		otherwise if the shroud is not worn by the player:
			say "Wear the shroud.";
		otherwise if the coin is not in the mouth:
			if the coin is nowhere:
				if the basket is not on the hook:
					if the basket is not carried by the player:
						if the basket is in the location of the player:
							say "Take the basket.";
						otherwise:
							say "You need";
							let way be the best route from the location of the player to the location of the basket, using doors;
							say "You need the basket to the [way].";
					otherwise:
						if the player is in the location of the hook:
							say "Put the basket on the hook.";
						otherwise:
							let way be the best route from the location of the player to the location of the hook, using doors;
							say "You need to be at the hook to the [way].";
				otherwise:
					if the shield is not carried by the player:
						if the shield is not enclosed by the location of the player:
							let way be the best route from the location of the player to the location of the shield, using doors;
							say "You need the shield, to the [way].";
						otherwise:
							say "Take the shield.";
					otherwise:
						if the player is in the location of the hook:
							say "Put the shield in the basket.";
						otherwise:
							let way be the best route from the location of the player to the location of the hook, using doors;
							say "You need to be at the hook to the [way].";
			otherwise if the worn coin is not enclosed by the location of the player:
				let way be the best route from the location of the player to the location of the worn coin, using doors;
				say "You need the coin to the [way].";
			otherwise:
				say "Eat the coin.";
		otherwise if NameOnCrypt is 0:
			if the chisel is not enclosed by the location of the player:		
				let way be the best route from the location of the player to the location of the chisel, using doors;
				say "You need something to the [way].";
			otherwise if the player is not enclosed by Inside-Burial-Mound:
				say "Take the chisel.";
			otherwise if the chisel is not enclosed by the player:
				say "Take the chisel.";
			otherwise:
				say "Cut the crypt.";
		otherwise if the player is not enclosed by Inside-Burial-Mound:	
			let way be the best route from the location of the player to Inside-Burial-Mound, using doors;
			say "You path is to to the [way].";
		otherwise:
			if the player is not enclosed by the crypt:
				say "Enter the crypt.";
			otherwise:
				say "Close the crypt.";
	otherwise if the score is 3:
		if the worn coin is enclosed by the player:
			if spear is not enclosed by the player:
				if spear is enclosed by the location of the player:
					say "Take the spear.";
				otherwise:
					let way be the best route from the location of the player to the location of the spear;
					say "You need the spear, to the [way].";
			otherwise:
				if the player is not in Limestone Cave:
					let way be the best route from the location of the player to the limestone cave;
					say "You need to go further, to the [way].";
				otherwise:
					say "Attack the vines.";
		otherwise:
			if the worn coin is not nowhere:
				if the worn coin is enclosed by the location of the player:
					say "Take the coin.";
				otherwise:
					let way be the best route from the location of the player to the location of the worn coin;
					say "You need the coin to the [way].";
			otherwise:
				if the basket is on the hook:
					if the shield is not carried by the player:
						if the shield is in the location of the player:
							say "Take the shield.";
						otherwise:
							let way be the best route from the location of the player to the location of the shield;
							say "You need the shield to the [way].";
					otherwise:
						if the player is in the location of the hook:
							say "Put the shield in the basket.";
						otherwise:
							let way be the best route from the location of the player to the location of the hook;
							say "The shield could weigh down the basket, to the [way].";
				otherwise:
					if the basket is carried by the player:
						if the player is not in the location of the hook:
							let way be the best route from the location of the player to the location of the hook;
							say "I remember something that you need. Go [way].";
						otherwise:
							say "Put the basket on the hook.";
					otherwise:
						if the basket is in the location of the player:
							say "Take the basket.";
						otherwise:
							let way be the best route from the location of the player to the location of the basket;
							say "You need the basket, to the [way].";
	otherwise if the score is 2:
		if the spear is not carried by the player:
			if the spear is not enclosed by the location of the player:
				let way be the best route from the location of the player to the location of the spear;
				say "[one of]You'd do well to arm yourself.[or]I left something for you to the [way].[stopping]";
			otherwise:
				say "Take the spear.";
		otherwise if the shield is not carried by the player:
			if the shield is not enclosed by the location of the player:
				let way be the best route from the location of the player to the location of the shield;
				say "[one of]You'd do well to find defenses.[or]I left something for you to the [way].[stopping]";
			otherwise:
				say "Take the shield.";
		otherwise if opponent is in Inside-Mead-Hall:
			if the player is not in Inside-Mead-Hall:
				let way be the best route from the location of the player to Inside-Mead-Hall;
				say "[one of]You must go to them.[or]Go [way].[stopping]";
			otherwise:
				say "Attack him.";
	otherwise if the score is 1:
		if the meal is enclosed by the player:
			if the player is in Spring:
				say "Eat the meal.";
			otherwise if the player is in StandingStones:
				say "Eat the meal.";
			otherwise:
				say "You can eat safely [if the player is in Aftermath]far [end if]to the east.";
		otherwise if the basket is carried by the player:
			if the meal is enclosed by the location of the player:
				say "Take the meal.";
			otherwise:
				let way be the best route from the location of the player to the location of the meal;
				say "[one of]You are hungry.[or]I know there is food to the [way].[stopping]";
		otherwise:
			if the basket is enclosed by the location of the player:
				say "Take the basket.";
			otherwise:
				let way be the best route from the location of the player to the location of the basket;
				say "[one of]You'll need some supplies.[or]I left a basket to the [way].[stopping]";
	otherwise:
		if the campfire is not nowhere:
			if the player is in the location of the campfire:
				say "Sleep.";
			otherwise:
				let way be the best route from the location of the player to the campfire;
				say "[one of]You'll be safe by the fire.[or]The fire is to the [way].[stopping]";
		otherwise if the firewood is carried by the player:
			if the flint is carried by the player:
				if the player is not in Lake:
					let way be the best route from the location of the player to Lake;
					say "[one of]You'll be safe by the lake.[or]Go [way].[stopping]";
				otherwise:
					say "[one of]You should make a fire.[or]BURN FIREWOOD.[stopping]";
			otherwise:
				if the flint is not enclosed by the location of the player:
					let way be the best route from the location of the player to the location of the flint;
					say "[one of]You need flint to make a fire.[or]Get the flint to the [way].[stopping]";
				otherwise:
					say "Take the flint.";
		otherwise:
			if the axe is carried by the player:
				if the log is enclosed by the location of the player:
					say "Cut the log.";
				otherwise:
					let way be the best route from the location of the player to the location of the log;
					say "If you want me to pick, go [way].";
			otherwise:
				if the axe is enclosed by the location of the player:
					say "Take the axe.";
				otherwise:
					let way be the best route from the location of the player to the location of the axe;
					say "[one of]You need the axe.[or]The axe is to the [way].[stopping]";		