

; STRINGS ARE DEFINED HERE

STRBEG::

	.SEGMENT "0"

	.GSTR STR?1,"up"
	.GSTR STR?2,"down"
	.GSTR STR?3,"north"
	.GSTR STR?4,"northeast"
	.GSTR STR?5,"east"
	.GSTR STR?6,"southeast"
	.GSTR STR?7,"south"
	.GSTR STR?8,"southwest"
	.GSTR STR?9,"west"
	.GSTR STR?10,"northwest"
	.GSTR STR?11,": "
	.GSTR STR?12,"I beg your pardon?"
	.GSTR STR?13,"Use numerals for numbers, for example ""10."""
	.GSTR STR?14,"Does your mother know you use words like that?"
	.GSTR STR?15,"Now, now. Let's not get vulgar."
	.GSTR STR?16,"Are we going to have to scrape your mouth out with pumice?"
	.GSTR STR?17,"Such language is frowned upon in chivalrous circles."
	.GSTR STR?18,"Obscenity is the first refuge of a dirty mind."
	.GSTR STR?19," (something)."
P-SOMETHING=STR?19
	.GSTR STR?20,"No inside"
P-NO-INSIDE=STR?20
	.GSTR STR?21,"No surface"
P-NO-SURFACE=STR?21
	.GSTR STR?22,"Nothing"
P-NOTHING=STR?22
	.GSTR STR?23,":
"
	.GSTR STR?24,"Please be more specific."
	.GSTR STR?25,"are"
	.GSTR STR?26,"word"
	.GSTR STR?27,"letter"
	.GSTR STR?28,"take lance"
	.GSTR STR?29,"verb"
	.GSTR STR?30,"Sorry, but I don't understand. Please rephrase that, or try something else."
	.GSTR STR?31,"do"
	.GSTR STR?32,"Haven't I seen you playing third base for the Red Sox?"
	.GSTR STR?33,"Feeling self-destructive? Dial 1-800-HIT-SELF for an incredibly expensive but absolutely worthless brochure from Masochists Anonymous. Call anytime - our lines are always busy!"
	.GSTR STR?34,"have"
	.GSTR STR?35,"try"
	.GSTR STR?36,"empty"
	.GSTR STR?37,"fly"
	.GSTR STR?38,"dry"
	.GSTR STR?39,"kiss"
	.GSTR STR?40,"push"
	.GSTR STR?41,"miss"
	.GSTR STR?42,"pass"
	.GSTR STR?43,"toss"
	.GSTR STR?44,"touch"
	.GSTR STR?45,"catch"
	.GSTR STR?46,"snatch"
	.GSTR STR?47,"brush"
	.GSTR STR?48,"Time passes..."
K-TIME-PASSES-MSG=STR?48
	.GSTR STR?49,"chivalry"
	.GSTR STR?50,"wisdom"
	.GSTR STR?51,"experience"
	.GSTR STR?52,"quest"
	.GSTR STR?53,"Debugging"
	.GSTR STR?54,"Apple IIe"
	.GSTR STR?55,"Macintosh"
	.GSTR STR?56,"Amiga"
	.GSTR STR?57,"Atari ST"
	.GSTR STR?58,"IBM"
	.GSTR STR?59,"Commodore 128"
	.GSTR STR?60,"Commodore 64"
	.GSTR STR?61,"Apple IIc"
	.GSTR STR?62,"Apple IIgs"
	.GSTR STR?63,"text"
	.GSTR STR?64,"background"
	.GSTR STR?65,"Please press a number from 1 to "
K-TYPE-NUMBER-MSG=STR?65
	.GSTR STR?66,"no change"
	.GSTR STR?67,"the standard color"
	.GSTR STR?68,"black"
	.GSTR STR?69,"red"
	.GSTR STR?70,"green"
	.GSTR STR?71,"yellow"
	.GSTR STR?72,"blue"
	.GSTR STR?73,"magenta"
	.GSTR STR?74,"cyan"
	.GSTR STR?75,"white"
	.GSTR STR?76,"Merlin nods his head and says, ""Very well, Arthur."""
K-MERLIN-NODS-MSG=STR?76
	.GSTR STR?77,"Merlin shakes his head and says, ""It seems that is beyond my power, Arthur. Perhaps you would like to try another."""
K-MERLIN-SORRY-MSG=STR?77
	.GSTR STR?78,"Undo"
	.GSTR STR?79,"Restart"
	.GSTR STR?80,"Restore"
	.GSTR STR?81,"Quit"
	.GSTR STR?82,"go"
	.GSTR STR?83,"It's too dark to see.
"
K-TOO-DARK-MSG=STR?83
	.GSTR STR?84,"isn't likely"
	.GSTR STR?85,"seems doubtful"
	.GSTR STR?86,"seems unlikely"
	.GSTR STR?87,"doesn't seem likely"
	.GSTR STR?88,"not do anything useful"
	.GSTR STR?89,"accomplish nothing"
	.GSTR STR?90,"have no desirable effect"
	.GSTR STR?91,"not be very productive"
	.GSTR STR?92,"serve no purpose"
	.GSTR STR?93,"be pointless"
	.GSTR STR?94,"be a waste of time"
	.GSTR STR?95,"unusual"
	.GSTR STR?96,"special"
	.GSTR STR?97,"interesting"
	.GSTR STR?98,"important"
	.GSTR STR?99,"of interest"
	.GSTR STR?100,"Talking to yourself is a bad sign."
K-TALK-TO-SELF-MSG=STR?100
	.GSTR STR?101,"How do you intend to do that?"
K-HOW-INTEND-MSG=STR?101
	.GSTR STR?102,"Begin"
	.GSTR STR?103,"Failed"
	.GSTR STR?104,"Already begun"
	.GSTR STR?105,"End"
	.GSTR STR?106,"Already ended"
	.GSTR STR?107,"Save"
	.GSTR STR?108,"see"
	.GSTR STR?109,"There's no one here to ask.
"
K-NOBODY-TO-ASK-MSG=STR?109
	.GSTR STR?110,"say"
	.GSTR STR?111,"Attacking"
	.GSTR STR?112,"And you'd DEFINITELY lose chivalry points."
	.GSTR STR?113,"Blowing"
	.GSTR STR?114,"Trying to destroy"
	.GSTR STR?115,"Which isn't surprising, considering this is a barter economy."
	.GSTR STR?116,"Don't you feel a little silly challenging an inanimate object?"
	.GSTR STR?117,"ignore"
	.GSTR STR?118,"is looking for a fight"
	.GSTR STR?119,"Please try to control these unchivalrous urges."
	.GSTR STR?120,"Kinky!"
	.GSTR STR?121,"mount"
	.GSTR STR?122,"And it probably wouldn't be much fun if you could."
	.GSTR STR?123,"climb on"
	.GSTR STR?124,"close"
	.GSTR STR?125,"closed"
	.GSTR STR?126,"take off"
	.GSTR STR?127,"drop"
	.GSTR STR?128,"float"
	.GSTR STR?129,"land"
	.GSTR STR?130,"get"
	.GSTR STR?131,"get in"
	.GSTR STR?132,"So now we're into bestiality, eh?"
	.GSTR STR?133,"What are you referring to?"
K-REFERRING-MSG=STR?133
	.GSTR STR?134,"To get a hint, look into the crystal ball."
	.GSTR STR?135,"If only you had a crystal ball...."
	.GSTR STR?136,"hold"
	.GSTR STR?137,"Boy, we're having fun now!"
	.GSTR STR?138,"would appreciate your advances"
	.GSTR STR?139,"You must have a very strange social life."
	.GSTR STR?140,"Paying respect to"
	.GSTR STR?141,"kneel"
	.GSTR STR?142,"resume"
	.GSTR STR?143,"open"
	.GSTR STR?144,"scratch"
	.GSTR STR?145,"You perch there for a moment, see nothing of interest, and then take off again.
"
K-PERCH-MSG=STR?145
	.GSTR STR?146,"hear"
	.GSTR STR?147,"locked"
	.GSTR STR?148,"lock"
	.GSTR STR?149,"stare down"
	.GSTR STR?150,"You blink first."
	.GSTR STR?151,"look in "
	.GSTR STR?152,"see inside"
	.GSTR STR?153,"see outside"
	.GSTR STR?154,"look through"
	.GSTR STR?155,"look up"
	.GSTR STR?156,"Dictionaries haven't been invented yet."
	.GSTR STR?157,"Toying in this way with"
	.GSTR STR?158,"Pushing"
	.GSTR STR?159,"Pulling"
	.GSTR STR?160,"Moving"
	.GSTR STR?161,"put"
	.GSTR STR?162,"give"
	.GSTR STR?163,"swing"
	.GSTR STR?164,"step"
	.GSTR STR?165,"Pointing"
	.GSTR STR?166,"mutter"
	.GSTR STR?167,"You won't get any more chivalry points for it, but it looks like you could still use the help."
	.GSTR STR?168,"in it"
	.GSTR STR?169,"Have you no fashion sense at all?"
	.GSTR STR?170,"Please refer to your instruction manual about how to talk to characters."
	.GSTR STR?171,"Scratching"
	.GSTR STR?172,"This is no time for resting."
K-NO-RESTING-MSG=STR?172
	.GSTR STR?173,"talk to"
	.GSTR STR?174,"take"
	.GSTR STR?175,"reach"
	.GSTR STR?176,"look"
	.GSTR STR?177,"talk"
	.GSTR STR?178,"shrug"
	.GSTR STR?179,"sail"
	.GSTR STR?180,"whisper"
	.GSTR STR?181,"tip over"
	.GSTR STR?182,"give "
	.GSTR STR?183,"trade "
	.GSTR STR?184," for"
	.GSTR STR?185,"decide"
	.GSTR STR?186,"undress"
	.GSTR STR?187,"unlocked"
	.GSTR STR?188,"That time has already passed."
	.GSTR STR?189,"You can only wait for a specific time or length of time."
	.GSTR STR?190,"wide awake"
	.GSTR STR?191,"ascend"
	.GSTR STR?192,"descend"
	.GSTR STR?193,"follow"
	.GSTR STR?194,"[Which direction do you want to go?]
"
K-WHICH-DIR-MSG=STR?194
	.GSTR STR?195,"move around within"
	.GSTR STR?196,"fit"
	.GSTR STR?197,"walk under"
	.GSTR STR?198,"wave"
	.GSTR STR?199,"wear"
	.GSTR STR?200,"put on"
	.GSTR STR?201,"Awww. Don't cry. You'll figure it out eventually."
	.GSTR STR?202,"Good. Let it out. Now do you feel better?"
	.GSTR STR?203,"would respond"
	.GSTR STR?204,"That was just a rhetorical question."
	.GSTR STR?205,"You would drown.
"
K-WOULD-DROWN-MSG=STR?205
	.GSTR STR?206,"Playing a restored game, are we?"
K-RESTORED-GAME-MSG=STR?206
	.GSTR STR?207,"Nothing happens."
K-NOTHING-HAPPENS-MSG=STR?207
	.GSTR STR?208,"Everything you were wearing magically reappears in its place."
K-CLOTHES-REAPPEAR-MSG=STR?208
	.GSTR STR?209,"cyr "
	.GSTR STR?210,"What shape do you want to assume?"
	.GSTR STR?211,"fall"
	.GSTR STR?212,"Your wings won't carry you any higher."
K-NO-HIGHER-MSG=STR?212
	.GSTR STR?213,"You swoop down into the fog, but immediately come upon an impenetrable thicket of thorns that offers you nowhere to land."
K-NO-LAND-MSG=STR?213
	.GSTR STR?214,"land in "
	.GSTR STR?215,"Where do you want to land, in the nest or in the grove?"
	.GSTR STR?216,"tasty-looking "
K-TASTY-MSG=STR?216
	.GSTR STR?217,"Chivalry"
	.GSTR STR?218,"Wisdom"
	.GSTR STR?219,"Experience"
	.GSTR STR?220,"Quest"
	.GSTR STR?221,"Carrying:"
	.GSTR STR?222,"You are carrying:"
	.GSTR STR?223,"nothing"
	.GSTR STR?224,"Wearing:"
	.GSTR STR?225,"You are wearing:"
	.GSTR STR?237,"slide"
	.GSTR STR?279,"Geez! You'll try anything, won't you?"
	.GSTR STR?301,"place"
	.GSTR STR?309,"Not a pretty sight."
	.GSTR STR?310,"glance"
	.GSTR STR?311,"wearing the armour"
	.GSTR STR?312,"wriggle"
	.GSTR STR?316," falls to the ground and shatters."
K-ICE-FALL-MSG=STR?316
	.GSTR STR?326,"make"
	.GSTR STR?340,"emerge"
	.GSTR STR?341," It quickly evaporates."
K-EVAPORATES-MSG=STR?341
	.GSTR STR?342,"XXX"
	.GSTR STR?343,"MOTHER MACREE'S IRISH WHISKY"
	.GSTR STR?344,"fill"
	.GSTR STR?345,"pour"
	.GSTR STR?367,"unlock"
	.GSTR STR?368,"taste"
	.GSTR STR?400,"[You don't need to refer to "
K-NO-REFER-MSG=STR?400
	.GSTR STR?401,"inside your shell"
	.GSTR STR?402,"in your shell"
	.GSTR STR?403,"out of your shell"
	.GSTR STR?404,"Please refer to specific objects."
	.GSTR STR?405,"It's part of the crumbling fortifications left over from the days of the Roman occupation."
K-ROMAN-FORT-MSG=STR?405
	.GSTR STR?406,"look behind"
	.GSTR STR?416,"Hints have been disallowed for this session."
K-NO-HINTS-MSG=STR?416
	.GSTR STR?854,"underneath"
	.GSTR STR?855,"undergrowth"
	.GSTR STR?856,"underground"
	.GSTR STR?857,"tasty-looking"
	.GSTR STR?858,"superbrief"
	.GSTR STR?859,"stationfall"
	.GSTR STR?860,"stalagmite"
	.GSTR STR?861,"stalactite"
	.GSTR STR?862,"spellbreaker"
	.GSTR STR?863,"salamander"
	.GSTR STR?864,"rumplestiltskin"
	.GSTR STR?865,"planetfall"
	.GSTR STR?866,"pikestaffs"
	.GSTR STR?867,"pearlfender"
	.GSTR STR?868,"passageway"
	.GSTR STR?869,"nasty-looking"
	.GSTR STR?870,"mysterious"
	.GSTR STR?871,"murmurring"
	.GSTR STR?872,"leprechaun"
	.GSTR STR?873,"invisiclues"
	.GSTR STR?874,"gravestone"
	.GSTR STR?875,"glittering"
	.GSTR STR?876,"forbidding"
	.GSTR STR?877,"footprints"
	.GSTR STR?878,"extinguish"
	.GSTR STR?879,"everything"
	.GSTR STR?880,"end.of.input"
	.GSTR STR?881,"electrocute"
	.GSTR STR?882,"downstairs"
	.GSTR STR?883,"directions"
	.GSTR STR?884,"conversation"
	.GSTR STR?885,"cocksucker"
	.GSTR STR?886,"churchyard"
	.GSTR STR?887,"blacksmith"
	.GSTR STR?888,"bite-sized"
	.GSTR STR?889,"apparition"
	.ENDSEG

	.SEGMENT "LAKE"

	.SEGMENT "STARTUP"

	.SEGMENT "TOWN"

	.GSTR STR?264,"WHOSO PULLETH OUT THIS SWORD OF THIS STONE, IS RIGHTWISE KING BORN OF ALL ENGLAND"
K-WHOSO-PULLETH-MSG=STR?264
	.ENDSEG

	.SEGMENT "BOG"

	.GSTR STR?327,"The peasant groans in pain and you quickly withdraw.
"
K-PEASANT-GROAN-MSG=STR?327
	.GSTR STR?328,"Yeeeouch! Hot hot hot....
"
K-HOT-MSG=STR?328
	.GSTR STR?329,"WARNING"
	.GSTR STR?330,"BOG"
	.GSTR STR?331,"DANGER"
	.GSTR STR?332,"PERIL"
	.GSTR STR?333,"STAY OUT"
	.GSTR STR?334,"THIS MEANS YOU!"
	.GSTR STR?335,"sink"
	.SEGMENT "CASTLE"

	.SEGMENT "TOWN"

	.GSTR STR?289,"poke"
	.ENDSEG

	.SEGMENT "CASTLE"

	.GSTR STR?226,"behind the cell door"
	.GSTR STR?227," says, ""If I give it to you, someone might recognize me.""
"
K-TAKE-SMITH-HELMET-MSG=STR?227
	.GSTR STR?228,"It looks like the guard's clothes are too big for you, yet too small for the muscular blacksmith.
"
K-UNDRESS-GUARD-MSG=STR?228
	.GSTR STR?229,"bean"
	.GSTR STR?230," calls out for help. Other guards come"
K-GUARDS-COME-MSG=STR?230
	.GSTR STR?231," ""Ooo. What a loverly"
K-LOVERLY-MSG=STR?231
	.GSTR STR?232,"."" He skewers you with his sword.
"
K-SKEWER-MSG=STR?232
	.GSTR STR?233," hear footsteps in the hall outside the door.
"
K-FOOTSTEPS-MSG=STR?233
	.GSTR STR?234,"call"
	.GSTR STR?235,"
In the distance you hear shouts and running footsteps. "
K-SHOUT-FOOTSTEP-MSG=STR?235
	.GSTR STR?236,"remove the prisoner to another cell."
K-REMOVE-PRISONER-MSG=STR?236
	.GSTR STR?246,"Merlin appears to you and says, ""You have failed, Arthur. By leaving the prisoner within the castle, you have ensured the doom of an innocent man. No man who would be King can allow an innocent subject to die."""
K-MERLIN-PRISONER-MSG=STR?246
	.GSTR STR?247,"pay"
	.GSTR STR?248,"skewer"
	.GSTR STR?249," muttering curses about the cold.
"
K-MUTTERING-MSG=STR?249
	.GSTR STR?250,"It sounds as if the soldiers are getting closer.
"
K-GETTING-CLOSER-MSG=STR?250
	.GSTR STR?251,"growl"
	.GSTR STR?252,"sidestep"
	.GSTR STR?254,"enters"
	.GSTR STR?255,"leaves"
	.GSTR STR?256,"Lot's eyes widen with greed when he sees"
K-LOT-GREED-MSG=STR?256
	.GSTR STR?257,". Then, just as quickly, the look is gone. ""It doesn't look very valuable,"" he says. ""But if you would like me to hold it in safekeeping for you, I would be happy to."""
K-LOT-WANT-MSG=STR?257
	.GSTR STR?258,". ""Take his bracelet,"" Lot shouts. They strip you of your bracelet, toss it to Lot,"
K-TAKE-BRACELET-MSG=STR?258
	.GSTR STR?259," and bear you off to rot in a dungeon."
K-BEAR-OFF-MSG=STR?259
	.GSTR STR?260,"chatter"
	.GSTR STR?290,"put out"
	.GSTR STR?291,"climb into"
	.SEGMENT "DEMON"

	.GSTR STR?272,"tug"
	.ENDSEG

	.SEGMENT "CASTLE"

	.SEGMENT "LAKE"

	.GSTR STR?253,"cuff"
	.ENDSEG

	.SEGMENT "DEMON"

	.GSTR STR?268,"The dragon opens one eye and casually swats you away with his tail, saying ""Get away from me kid. Ya bother me."" Lazily, he closes his eye again.
"
K-WAKE-DRAGON-MSG=STR?268
	.GSTR STR?269,"""Hush, boy! You're interrupting a valuable experiment in self-anesthesiology.""
"
K-HUSH-BOY-MSG=STR?269
	.GSTR STR?270,"In his drunken stupor, the dragon mistakes your action for an amorous approach and he directs a playful wall of flame in your direction. Fortunately, he currently sees two of you, and he fries the wrong one.
"
K-AMOROUS-APPROACH-MSG=STR?270
	.GSTR STR?271,"You'd have better luck trying to wake the dead."
	.GSTR STR?273,"They howl at you in reply."
K-HOWL-MSG=STR?273
	.GSTR STR?274,"
Ghosts close in around you, shrieking and howling. They stand between you and the interior of the cave.
"
	.GSTR STR?275,"
A ghostly boar lowers his head and starts to charge at you!
"
	.GSTR STR?276,"
Suddenly, the spirit of the black knight leaps forward and swings a phantom sword at your head!
"
	.GSTR STR?277,"
A spectral kraken slithers forward. His wraithlike tentacles start to wrap themselves around you.
"
	.GSTR STR?278,"
The apparitions join ghostly hands and dance in a circle around you.
"
	.GSTR STR?313,"You're even sicker than I thought."
	.GSTR STR?314,"The word comes at you in a explosion of incredible force that blasts you out of the hall, through the outer rooms, and dumps you on the ledge next to the slumbering dragon."
K-DEMON-SCREAMS-MSG=STR?314
	.GSTR STR?315,"Your tongue immediately freezes to the ice. Panic-stricken, you struggle to free it, wondering all the while what Merlin will do to you if he discovers how incredibly stupid you've been. Suddenly you wrench yourself free. Your tongue hurts so much you'd like to lick it, but you can't figure out how."
K-EAT-ICE-MSG=STR?315
	.GSTR STR?317,"Your throat is so dry, you can't manage to say a word."
K-DRY-THROAT-MSG=STR?317
	.ENDSEG

	.SEGMENT "LAKE"

	.GSTR STR?261," Moments later you hear the distant"
K-MOMENTS-LATER-MSG=STR?261
	.GSTR STR?262," sound of crowds cheering, and you realize that Lot's coronation has taken place."
K-REALIZE-MSG=STR?262
	.GSTR STR?263,"Suddenly, a parade led by King Lot "
K-PARADE-MSG=STR?263
	.GSTR STR?265,"You're not going anywhere with that kraken holding on to you.
"
K-KRAKEN-HOLD-MSG=STR?265
	.GSTR STR?266,"heave"
	.GSTR STR?292," the egg of a giant raven"
K-RAVEN-EGG-MSG=STR?292
	.GSTR STR?293," the hair that grows between the eyes of a dragon"
K-DRAGON-HAIR-MSG=STR?293
	.GSTR STR?294," the tusk of the wild boar that stalks the enchanted forest"
K-BOAR-TUSK-MSG=STR?294
	.GSTR STR?295," the Golden Fleece of the evil demon Nudd"
K-GOLDEN-FLEECE-MSG=STR?295
	.GSTR STR?296,"continue"
	.GSTR STR?297,"steal"
	.GSTR STR?298,"She's under a spell. She can't hear you."
K-ENCHANTMENT-MSG=STR?298
	.GSTR STR?299,"Everything you always wanted on a bier...."
	.GSTR STR?300,"But it was worth a shot."
	.GSTR STR?302,"The rocks are too steep to climb.
"
K-ROCKS-STEEP-MSG=STR?302
	.SEGMENT "TOWER"

	.GSTR STR?243,"hit"
	.ENDSEG

	.SEGMENT "OWL"

	.GSTR STR?245," the river, you feel yourself changing back into your human form."
K-SHAPECHANGE-MSG=STR?245
	.SEGMENT "TOWER"

	.GSTR STR?284,"You are flying high above the forest."
K-FLY-HIGH-MSG=STR?284
	.ENDSEG

	.SEGMENT "TOWN"

	.GSTR STR?238,"You are too big to fit in the hole.
"
K-TOO-BIG-MSG=STR?238
	.GSTR STR?267,"One look at those sharp thorns convinces you that it would be suicide to try to pass through."
K-THORN-BUSH-MSG=STR?267
	.GSTR STR?347,"Merlin's voice echoes in your mind, "
K-MERLIN-ECHOES-MSG=STR?347
	.GSTR STR?348," Perhaps you should have heeded Merlin's warning.
"
K-HEEDED-WARNING-MSG=STR?348
	.GSTR STR?349,"Merlin appears before you and says sadly, ""I see you have learned nothing, Arthur. I'm afraid my time with you has been wasted."""
K-MERLIN-WASTED-MSG=STR?349
	.GSTR STR?350,"Merlin moves the scroll beyond your reach and says, ""Some secrets, Arthur, are best kept hidden.""
"
K-NO-READ-SCROLL-MSG=STR?350
	.GSTR STR?351,", the crystal walls of the cave start to vibrate ominously and you wisely withdraw.
"
K-NO-TOUCH-CRYSTAL-MSG=STR?351
	.GSTR STR?352,"enter"
	.GSTR STR?353,"A large farmer absentmindedly cuffs you on the head, says, ""Begone, lad,"" and returns to the conversation.
"
K-FARMER-CUFFS-MSG=STR?353
	.GSTR STR?354,"The cook ignores you and continues about his business.
"
K-COOK-IGNORES-MSG=STR?354
	.GSTR STR?355,"""Not now, boy. I'm busy.""
"
K-NOT-NOW-MSG=STR?355
	.GSTR STR?356," ""Get out of here, you mangy"
K-GET-OUT-MSG=STR?356
	.GSTR STR?357,"""Fat chance.""
"
K-FAT-CHANCE-MSG=STR?357
	.GSTR STR?358," and resumes his work at the table.
"
K-COOK-RESUMES-WORK-MSG=STR?358
	.GSTR STR?359,"The cook cuffs you on the head. ""Hands off.""
"
K-HANDS-OFF-MSG=STR?359
	.GSTR STR?360,"The cook takes a sidelong glance at the cupboard and then says gruffly, ""I don't use no spices. Too 'ard to come by.""
"
K-NO-SPICE-MSG=STR?360
	.GSTR STR?361,"stalk"
	.GSTR STR?362,"The bird chatters an answer back to you and then looks frustrated that you don't understand.
"
K-BIRD-CHATTERS-MSG=STR?362
	.GSTR STR?363,"The bird flies up and disappears into the thatch of the roof. Moments later, a key falls to the floor. The bird pokes his head out of the thatch,"
K-BIRD-GETS-KEY-MSG=STR?363
	.GSTR STR?364," leaves a small present on the table for the cook, and then flies out the door.
"
K-DROPPING-MSG=STR?364
	.GSTR STR?365,"""Sacre bleu! Ze time she ees flying, and I am not. Open ze cage and let me out of 'ere.""
"
K-LET-OUT-MSG=STR?365
	.GSTR STR?366,"It sounds as if the bird is trying to tell you something.
"
K-BIRD-SOUNDS-MSG=STR?366
	.GSTR STR?369,"Oooooh, gross!"
	.GSTR STR?370,"You see something glittering on the ground to the east."
K-GLITTER-MSG=STR?370
	.GSTR STR?371," It looks like an overcrowded junk shop. Bric-a-brac is piled everywhere."
K-JUNK-SHOP-MSG=STR?371
	.GSTR STR?372,"""Pity."" The knight turns his attention elsewhere."
K-PITY-MSG=STR?372
	.GSTR STR?373,"Don't you feel a little silly trying to look at an invisible knight?"
	.GSTR STR?374,"But then, some people are like that."
	.GSTR STR?375,"""We could trade if you want."""
K-IDIOT-TRADE-MSG=STR?375
	.GSTR STR?376,"""Go out to where the gate used to be and turn right. Then go to where the big tree used to be and turn left. When you get to the place where the whatsis was until they moved it to the spot where it was before they put it where it is now, then take two quick rights. After that, go straight for about twice as far, and when you hit the trees, you're almost there. You can't miss it.""
"
K-IDIOT-DIRECTION-MSG=STR?376
	.GSTR STR?377,"ask idiot about "
	.GSTR STR?378," ""Beware the Invisible Knight."""
	.GSTR STR?379," ""I'm not as dumb as you look. Go ahead. Ask me about anything."""
	.GSTR STR?380," ""Wherever I go, there I am."""
	.GSTR STR?381," ""King Lot is a greedy goat."""
	.GSTR STR?382," ""I'm not really an idiot. I'm just extremely stupid."""
	.GSTR STR?383," ""Sometimes my invisible playmate gives me things."""
	.GSTR STR?384,"
   ""Roses are red,
    Violets are blue.
    I'm schizophrenic,
    And so am I."""
	.GSTR STR?385," ""When the tough get tough, the going get going."""
	.GSTR STR?386,"Stop trying to confuse the poor boy."
	.GSTR STR?387,"The idiot isn't as dumb as you look."
	.GSTR STR?388,"Let's not get morbid, shall we?"
	.GSTR STR?389,"behind the gravestone"
	.GSTR STR?390,"jump"
	.GSTR STR?391,"walk"
	.GSTR STR?392,"cower"
	.GSTR STR?393,"The gate creaks as it swings"
K-GATE-CREAKS-MSG=STR?393
	.GSTR STR?394," They seize you immediately and arrest you for violating the curfew. Then they drag you through the streets to the castle, where they toss you into a dungeon and forget about you.
"
K-ARREST-MSG=STR?394
	.GSTR STR?395,"seize"
	.GSTR STR?396,"drag"
	.GSTR STR?397,"Let's not overdo the chivalry bit."
	.GSTR STR?398,"What kind of heathen would try to steal from a church?"
K-HEATHEN-MSG=STR?398
	.GSTR STR?399,"You hear Merlin's voice echo from a previous lesson: ""It is not seeming to venture forth unclothed, Arthur.""
"
K-UNDRESS-MSG=STR?399
	.ENDSEG

	.SEGMENT "TOWER"

	.GSTR STR?239,"A strong updraft pushes you high into the air.

"
K-UPDRAFT-MSG=STR?239
	.GSTR STR?240," pacing back and forth"
K-PACING-MSG=STR?240
	.GSTR STR?241," with a single tusk"
K-SINGLE-TUSK-MSG=STR?241
	.GSTR STR?242,"The boar doesn't understand you.
"
K-BOAR-UNDERSTAND-MSG=STR?242
	.GSTR STR?244,"Of course, in Alabama the Tuscaloosa."
	.GSTR STR?280,"The giant raven squawks at you in response."
K-RAVEN-SQUAWKS-MSG=STR?280
	.GSTR STR?281,"flail"
	.GSTR STR?282,"You hear the beat of approaching wings."
K-RAVEN-APPROACH-MSG=STR?282
	.GSTR STR?283,"Suddenly a giant raven swoops down from the sky. "
K-RAVEN-SWOOP-MSG=STR?283
	.GSTR STR?285,"You would fall and kill yourself."
K-DEADLY-FALL-MSG=STR?285
	.GSTR STR?286,"climb up"
	.GSTR STR?287,"climb down"
	.GSTR STR?288,"move"
	.GSTR STR?303,"A gnarled, leafy hand knocks you sprawling on the ground and the tree says, ""'Ere now. 'Ow would you like it if folks was climbin' all over you? Keep to yourself, mate.""
"
K-CLIMB-TREE-MSG=STR?303
	.GSTR STR?304,"shield"
	.GSTR STR?305,"aim"
	.GSTR STR?306,"Which lance would you like, the red one or the green one?""
"
K-WHICH-LANCE-MSG=STR?306
	.GSTR STR?307,"untie"
	.GSTR STR?308," He retreats inside the pavilion and closes the door."
K-RETREATS-INSIDE-MSG=STR?308
	.GSTR STR?318,"You try to move forward into the barrage, but get nowhere."
K-BARRAGE-MSG=STR?318
	.GSTR STR?319,"The horse chestnut trees continue to attack"
K-TREES-ATTACK-MSG=STR?319
	.GSTR STR?320," The force of the repeated blows finally overwhelms you. You fall to the ground and die.
"
K-PAIN-TOO-MUCH-MSG=STR?320
	.GSTR STR?321,"The conkers bounce harmlessly off your shell.
"
K-CONKER-HARMLESS-MSG=STR?321
	.GSTR STR?322,"go through"
	.GSTR STR?323,"What do you think this is, Zork?"
	.GSTR STR?324,"You are too big to fit through the crack."
K-TOO-BIG-CRACK-MSG=STR?324
	.GSTR STR?325,"On the wall are written the following letters: AMHTIR AMU SMOTUS."
K-WALL-LETTERS-MSG=STR?325
	.GSTR STR?336," disappears into the undergrowth."
K-DISAPPEARS-MSG=STR?336
	.GSTR STR?337," ""Try, try, as hard as ye might. Ye won't catch me, I'm too fast a sprite."""
K-SPRITE-MSG=STR?337
	.GSTR STR?338,"behind the rock"
	.GSTR STR?339,"hide"
	.GSTR STR?346,"Lush."
	.ENDSEG

	.SEGMENT "HINTS"

	.GSTR STR?407,"Return for hints."
RETURN-SEE-HINT=STR?407
	.GSTR STR?408,"Return for a hint."
RETURN-SEE-NEW-HINT=STR?408
	.GSTR STR?409,"M for main menu."
M-MAIN-HINT-MENU=STR?409
	.GSTR STR?410,"M for hint menu."
M-SEE-HINT-MENU=STR?410
	.GSTR STR?411,"P for previous item."
PREVIOUS-HINT=STR?411
	.GSTR STR?412,"N for next item."
NEXT-HINT=STR?412
	.GSTR STR?413,"Q to resume story."
Q-RESUME-STORY=STR?413
	.GSTR STR?414,"(Or use mouse.)"
H-OR-USE-MOUSE=STR?414
	.GSTR STR?415,"[No more hints.]"
NO-MORE-HINTS=STR?415
	.GSTR STR?417,"How do I keep the soldiers from arresting me?"
	.GSTR STR?418,"Hide where they can't see you."
	.GSTR STR?419,"You can't hide in the church."
	.GSTR STR?420,"Hmmm. Doesn't that gravestone look pretty big?"
	.GSTR STR?421,"Hide behind the gravestone."
	.GSTR STR?422,"How do I keep Lot from stealing the stone?"
	.GSTR STR?423,"You can't."
	.GSTR STR?424,"What can I do in the church?"
	.GSTR STR?425,"What should any chivalrous knight do when starting a quest?"
	.GSTR STR?426,"Pray."
	.GSTR STR?427,"THE CHURCHYARD"
	.GSTR STR?428,"Who is King Lot?"
	.GSTR STR?429,"He is one of the many lesser kings who live in Britain. He wants to be High King."
	.GSTR STR?430,"Why does Lot ignore me in the Great Hall?"
	.GSTR STR?431,"You are but a boy - insignificant in his eyes."
	.GSTR STR?432,"How can I get Lot's attention?"
	.GSTR STR?433,"You need to challenge him in the traditional way."
	.GSTR STR?434,"Unless the next hint topic begins, ""More on getting Lot's attention,"" then someplace in the game there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?435,"More on getting Lot's attention"
	.GSTR STR?436,"Take the gauntlet to the Great Hall and hit Lot with it."
	.GSTR STR?437,"How can I defeat Lot in battle?"
	.GSTR STR?438,"Lot is a better swordsman than you."
	.GSTR STR?439,"You'll have to resort to something other than swordplay."
	.GSTR STR?440,"You'll have to distract him."
	.GSTR STR?441,"Have you noticed his dominant personality characteristic?"
	.GSTR STR?442,"Have you noticed how greedy he is?"
	.GSTR STR?443,"Throw the bracelet on the ground."
	.GSTR STR?444,"More on defeating Lot"
	.GSTR STR?445,"Once you have him at your mercy, you must spare his life."
	.GSTR STR?446,"KING LOT"
	.GSTR STR?447,"Why is the idiot in the Town Square?"
	.GSTR STR?448,"The idiot is a metaphor for the angst of the human condition. He has positioned himself in the Town Square as a silent protest against man's inhumanity to man, and as a constant reminder of society's responsibility to care for its intellectually inferior elements."
	.GSTR STR?449,"Actually, he just likes it there."
	.GSTR STR?450,"How can I get things from the idiot?"
	.GSTR STR?451,"The idiot isn't too bright."
	.GSTR STR?452,"He has no concept of value."
	.GSTR STR?453,"He'll trade you anything he's got for anything you've got."
	.GSTR STR?454,"THE VILLAGE IDIOT"
	.GSTR STR?455,"Are the farmers important?"
	.GSTR STR?456,"Without farmers there would be no crops, and eventually everyone would die."
	.GSTR STR?457,"Oh! You mean in the GAME?"
	.GSTR STR?458,"Yes."
	.GSTR STR?459,"Their conversation provides an important clue."
	.GSTR STR?460,"Do I have to get into the locked cupboard?"
	.GSTR STR?461,"Is the Queen English?"
	.GSTR STR?462,"Are wild bears Catholic?"
	.GSTR STR?463,"Does the Pope....(well, never mind)."
	.GSTR STR?464,"How do I get into the locked cupboard?"
	.GSTR STR?465,"Have you asked the cook to open it for you?"
	.GSTR STR?466,"Of course, he's such a jerk that he probably wouldn't help you."
	.GSTR STR?467,"The wooden key opens the locked cupboard."
	.GSTR STR?468,"Have you asked the cook where the key is?"
	.GSTR STR?469,"Oh yeah. We forgot. He's a jerk."
	.GSTR STR?470,"Do not read the next clue until you have paid a visit to Merlin."
	.GSTR STR?471,"Have you asked the bird about the key?"
	.GSTR STR?472,"Turn yourself into an owl and see what the bird has to say."
	.GSTR STR?473,"(But wait until that jerk leaves the room.)"
	.GSTR STR?474,"THE TAVERN"
	.GSTR STR?475,"How can I get back what the invisible knight steals?"
	.GSTR STR?476,"He trades away some of the things he steals to another character in the game."
	.GSTR STR?477,"The other character is the idiot."
	.GSTR STR?478,"You can trade with the idiot for whatever he has."
	.GSTR STR?479,"The Invisible Knight will keep the rest of your possessions until you track him to his lair."
	.GSTR STR?480,"Unless the next hint topic begins, ""More on the invisible knight,"" then someplace in the game, there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?481,"More on the invisible knight"
	.GSTR STR?482,"Think of the Invisible Knight as an unseen force."
	.GSTR STR?483,"Go to the meadow and rub the magic ring."
	.GSTR STR?484,"INVISIBLE KNIGHT"
	.GSTR STR?485,"What is the solution to the invisible knight's riddle?"
	.GSTR STR?486,"This is the first clue"
	.GSTR STR?487,"This is the second clue"
	.GSTR STR?488,"This is the third clue"
	.GSTR STR?489,"This is the fourth clue"
	.GSTR STR?490,"Examine the first four clues carefully"
	.GSTR STR?491,"The first four clues form a sequence"
	.GSTR STR?492,"The clue after the first four clues would be the fifth clue"
	.GSTR STR?493,"Look at the last two letters of the words in the first four clues"
	.GSTR STR?494,"The letters the knight is looking for are TH (as in fifTH)"
	.GSTR STR?495,"THE BRASS EGG"
	.GSTR STR?496,"What is the magic of Merlin's bag?"
	.GSTR STR?497,"No matter what you put into it, it never fills up."
	.GSTR STR?498,"MERLIN'S BAG"
	.GSTR STR?499,"How can I get into the castle?"
	.GSTR STR?500,"Give the guard at the gate the password."
	.GSTR STR?501,"More on getting into the castle"
	.GSTR STR?502,"You must go down the badger hole to get into the castle."
	.GSTR STR?503,"Push the stone."
	.GSTR STR?504,"How can I get the password?"
	.GSTR STR?505,"Strangely enough, you will have to get into the castle before you can learn the password."
	.GSTR STR?506,"Don't read the next hint until you have visited Merlin."
	.GSTR STR?507,"You need to turn yourself into an animal in order to get into the castle."
	.GSTR STR?508,"You must enter the castle as a badger."
	.GSTR STR?509,"Unless the next hint topic begins, ""More on getting the password,"" then you should come back after you've explored more thoroughly as a badger."
	.GSTR STR?510,"More on getting the password"
	.GSTR STR?511,"Have you listened to the farmers in the tavern?"
	.GSTR STR?512,"The ""He"" they are referring to is Lot."
	.GSTR STR?513,"The poem they are referring to is in your documentation."
	.GSTR STR?514,"Lot announces the password every canonical hour."
	.GSTR STR?515,"You have to be where you can hear Lot set the password."
	.GSTR STR?516,"You have to be somewhere other than in the Great Hall."
	.GSTR STR?517,"Unless the next hint topic begins, ""Still more on getting the password,"" then you should come back after you have escaped from the cell."
	.GSTR STR?518,"Still more on getting the password"
	.GSTR STR?519,"Have you found a dark passage yet?"
	.GSTR STR?520,"Perhaps the small chamber at the end of the hall bears closer examination."
	.GSTR STR?521,"Perhaps there is a secret exit from the small chamber."
	.GSTR STR?522,"Look behind the tapestry."
	.GSTR STR?523,"The next hint will be the very last hint on how to get the password."
	.GSTR STR?524,"Wait behind the throne until the canonical hour changes. You will hear Lot announce a verse and a line. That line is the password."
	.GSTR STR?525,"How do I use the password?"
	.GSTR STR?526,"In your documentation, you will find a poem about King Lot. Look up the verse and line that you overheard from Lot. Then go to the guard and repeat that line using the following format:
>Say ""Correct line from poem"""
	.GSTR STR?527,"Do I need to free the prisoner?"
	.GSTR STR?528,"It would be the chivalrous thing to do."
	.GSTR STR?529,"Yes. You need to free the prisoner."
	.GSTR STR?530,"How do I free the prisoner?"
	.GSTR STR?531,"The chains and the padlock can't be broken."
	.GSTR STR?532,"You have to unlock the padlock."
	.GSTR STR?533,"Guards generally have keys to padlocks."
	.GSTR STR?534,"Have you asked the prisoner about the guards?"
	.GSTR STR?535,"Call the guard."
	.GSTR STR?536,"More on freeing the prisoner"
	.GSTR STR?537,"Did we mention that you should hide behind the door before you call the guard?"
	.GSTR STR?538,"Did we mention that you will have to hit the guard in order to get the key?"
	.GSTR STR?539,"Did we mention that you need to use the stone in order to knock out the guard?"
	.GSTR STR?540,"Are you sick of us forgetting to mention things?"
	.GSTR STR?541,"How do I get out of the underground corridor?"
	.GSTR STR?542,"Forget the guard at the top of the stairs. He'll kill you every time."
	.GSTR STR?543,"Look around the small chamber."
	.GSTR STR?544,"How about that tapestry."
	.GSTR STR?545,"How do I get out of the dark passage?"
	.GSTR STR?546,"If you emerge from behind the throne, you'll always get killed."
	.GSTR STR?547,"You'll have to get through that fire somehow."
	.GSTR STR?548,"Gee....what animal was it that walks through fire?"
	.GSTR STR?549,"Turn yourself into a salamander."
	.GSTR STR?550,"How do I get the prisoner through the fire?"
	.GSTR STR?551,"The prisoner can't turn himself into a salamander."
	.GSTR STR?552,"You can't turn him into a salamander."
	.GSTR STR?553,"It looks like you'll have to put out that fire."
	.GSTR STR?554,"Push over the barrel of water."
	.GSTR STR?555,"How do I get the prisoner to leave the kitchen?"
	.GSTR STR?556,"He needs a disguise so the guards won't recognize him."
	.GSTR STR?557,"Perhaps something that will cover part of his face."
	.GSTR STR?558,"Remember that guard you knocked out?"
	.GSTR STR?559,"Give him the guard's helmet."
	.GSTR STR?560,"How do I get the prisoner past the guard?"
	.GSTR STR?561,"Give the guard the password."
	.GSTR STR?562,"See the hints on getting and using the password."
	.GSTR STR?563,"THE CASTLE"
	.GSTR STR?564,"How can I get the sword from under the tree?"
	.GSTR STR?565,"The smith said he buried it."
	.GSTR STR?566,"Perhaps you should try digging."
	.GSTR STR?567,"Perhaps you should try digging as another animal."
	.GSTR STR?568,"Turn yourself into a badger, then dig."
	.GSTR STR?569,"THE SMITH'S SWORD"
	.GSTR STR?570,"How do I get past the red knight?"
	.GSTR STR?571,"Give him what he wants."
	.GSTR STR?572,"THE RED KNIGHT"
	.GSTR STR?573,"Do I have to go through the badger maze?"
	.GSTR STR?574,"How do I get through the badger maze?"
	.GSTR STR?575,"The maze can be mapped."
	.GSTR STR?576,"Although you cannot carry anything as a badger, you can still map the maze."
	.GSTR STR?577,"You need some way to distinguish one room from another."
	.GSTR STR?578,"You need to find a unique way to mark each room."
	.GSTR STR?579,"What natural tools does a badger have?"
	.GSTR STR?580,"Use your claws to mark each room."
	.GSTR STR?581,"When you enter the first room, put one claw mark on the wall. When you enter the next room, put two claw marks on the wall. Keep doing that and you will soon be able to map the entire maze."
	.GSTR STR?582,"The next two hints will give you the exact directions through the maze."
	.GSTR STR?583,"From the smithy, go down, south, up, down, and up."
	.GSTR STR?584,"From Thorney Island, go down, north, north, and up."
	.GSTR STR?585,"How can I remove the hawthorn sprig from my fur?"
	.GSTR STR?586,"You can't reach it with your claws."
	.GSTR STR?587,"When you change back to human form, the sprig will fall to the ground."
	.GSTR STR?588,"What else can I do on the island?"
	.GSTR STR?589,"Lie on the beach?"
	.GSTR STR?590,"Sing 'Goodbye My Thorney Island Baby'?"
	.GSTR STR?591,"Nothing."
	.GSTR STR?592,"THE BADGER MAZE"
	.GSTR STR?593,"How do I start the joust?"
	.GSTR STR?594,"First you'll have to find some armour...."
	.GSTR STR?595,"Then of course you'll need a shield...."
	.GSTR STR?596,"And you'll need to polish the shield...."
	.GSTR STR?597,"With the pumice stone...."
	.GSTR STR?598,"And then get on the horse."
	.GSTR STR?599,"How do I win the joust?"
	.GSTR STR?600,"The blue knight seems to place a great deal of importance on honorable behavior."
	.GSTR STR?601,"Don't think of the joust as a fight. Think of it as a gentleman's sport, with gentleman's rules and conventions."
	.GSTR STR?602,"A gentleman wouldn't truly try to hurt another gentleman."
	.GSTR STR?603,"Have you noticed where the blue knight always ends up aiming?"
	.GSTR STR?604,"The blue knight will always end up aiming at your body."
	.GSTR STR?605,"You must always end up shielding your body...."
	.GSTR STR?606,"And you must always end up aiming at his body."
	.GSTR STR?607,"THE JOUST"
	.GSTR STR?608,"Why do the enchanted trees throw conkers at me?"
	.GSTR STR?609,"They don't need a reason. They're enchanted."
	.GSTR STR?610,"How do I survive the attack of the enchanted trees?"
	.GSTR STR?611,"You can't destroy the trees."
	.GSTR STR?612,"Find a way to protect yourself."
	.GSTR STR?613,"Your armour and shield can't quite protect all of your body."
	.GSTR STR?614,"Turn into a turtle."
	.GSTR STR?615,"Retract your head and legs into your shell."
	.GSTR STR?616,"Wait until the trees stop throwing the conkers."
	.GSTR STR?617,"THE CONKERS"
	.GSTR STR?618,"Do I need the bracelet?"
	.GSTR STR?619,"How do I get the bracelet?"
	.GSTR STR?620,"The Kraken won't give it to you."
	.GSTR STR?621,"You'll have to take it from him."
	.GSTR STR?622,"You'll have to use violence."
	.GSTR STR?623,"You'll have to cut it off with your sword."
	.GSTR STR?624,"You can't carry a sword while you're swimming."
	.GSTR STR?625,"If you can't get the sword to the kraken, you'll have to get the kraken to the sword."
	.GSTR STR?626,"If you zap the kraken as an eel, he'll start to chase you."
	.GSTR STR?627,"Leave the sword in the ford or the shallows."
	.GSTR STR?628,"Zap the kraken and go back to where you left the sword. Change back to human form, take the sword, and cut off the bracelet."
	.GSTR STR?629,"More on getting the bracelet"
	.GSTR STR?630,"Think of the bracelet as a hoop."
	.GSTR STR?631,"Swim through the bracelet."
	.GSTR STR?632,"Swim through the bracelet as a turtle."
	.GSTR STR?633,"Take the bracelet to the shallows or the ford and then pull your head inside your shell."
	.GSTR STR?634,"THE KRAKEN"
	.GSTR STR?635,"What is rustling in the undergrowth?"
	.GSTR STR?636,"Perhaps it is something that is afraid of you."
	.GSTR STR?637,"Maybe you should hide somewhere."
	.GSTR STR?638,"Hide behind the rock."
	.GSTR STR?639,"What is the murmuring below the rock?"
	.GSTR STR?640,"Listen to it."
	.GSTR STR?641,"It's a leprechaun complaining about something."
	.GSTR STR?642,"How do I catch the leprechaun?"
	.GSTR STR?643,"Listen to the murmuring from below the rock."
	.GSTR STR?644,"Don't read the next clue until you have opened the cupboard in the tavern."
	.GSTR STR?645,"The leprechaun is complaining about the lack of spice in his Irish stew."
	.GSTR STR?646,"Leave the spice in the glade, then hide behind the rock."
	.GSTR STR?647,"Catch the leprechaun while he is looking at the bottle of spice."
	.GSTR STR?648,"THE GLADE"
	.GSTR STR?649,"Where is the raven's egg?"
	.GSTR STR?650,"Where do ravens usually keep eggs?"
	.GSTR STR?651,"It's in the raven's nest."
	.GSTR STR?652,"The nest is at the top of the tall tree in the grove."
	.GSTR STR?653,"How can I get the gold egg out of the nest?"
	.GSTR STR?654,"You need to get into the nest...."
	.GSTR STR?655,"Then you need to distract the raven long enough to get the egg."
	.GSTR STR?656,"Unless the next hint topic begins, ""More on getting the gold egg,"" then someplace in the game, there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?657,"More on getting the gold egg"
	.GSTR STR?658,"The raven likes bright objects."
	.GSTR STR?659,"The bird may even think the brass egg is real."
	.GSTR STR?660,"Drop the brass egg in the grove."
	.GSTR STR?661,"Fly up to the nest."
	.GSTR STR?662,"Push the egg out of the nest."
	.GSTR STR?663,"Get out of there before the raven kills you."
	.GSTR STR?664,"THE RAVEN"
	.GSTR STR?665,"How do I get into the ivory tower?"
	.GSTR STR?666,"You need a key."
	.GSTR STR?667,"Unless the next hint topic begins, ""More on getting into the tower,"" then someplace in the game, there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?668,"More on getting into the tower"
	.GSTR STR?669,"The Blue Knight gave you an ivory key. Use it."
	.GSTR STR?670,"How can I find out the man's name?"
	.GSTR STR?671,"It isn't Rumplestiltskin."
	.GSTR STR?672,"Magical creatures who have secret names usually have an irresistible urge to write it down somewhere."
	.GSTR STR?673,"There's more than one room on this floor of the tower."
	.GSTR STR?674,"Crawl through the crack in the wall on the landing."
	.GSTR STR?675,"More on the secret name"
	.GSTR STR?676,"The letters on the wall of the abandoned room are a cryptogram."
	.GSTR STR?677,"The key to cryptogram is somewhere else."
	.GSTR STR?678,"Still more on the secret name"
	.GSTR STR?679,"Think of the writing on the cellar wall as two strings of letters, rather than words."
	.GSTR STR?680,"The writing on the cellar wall is the key to the cryptogram in the abandoned room."
	.GSTR STR?681,"It is a substitution cypher."
	.GSTR STR?682,"Every letter that appears in the phrase AMHTIR AMU SMOTUS also appears in the name RIOTHAMUS."
	.GSTR STR?683,"Substitute the letters in the phrase AMHTIR AMU SMOTUS with the letters in SAYMOTHER that appear above the corresponding letters in RIOTHAMUS."
	.GSTR STR?684,"For example, the 'S' of SAYMOTHER appears directly above the 'R' of RIOTHAMUS, so wherever you see an 'R' in AMHTIR AMU SMOTUS, substitute the letter 'S.'"
	.GSTR STR?685,"The man's name is Thomas The Rhymer."
	.GSTR STR?686,"What is in the cellar?"
	.GSTR STR?687,"It's too dark to see."
	.GSTR STR?688,"Actually, it's only too dark for a human to see."
	.GSTR STR?689,"Turn yourself into an owl."
	.GSTR STR?690,"THE IVORY TOWER"
	.GSTR STR?691,"How do I get across the chasm?"
	.GSTR STR?692,"You can't jump over it."
	.GSTR STR?693,"Don't read the next clue until you have visited Merlin."
	.GSTR STR?694,"Fly over the chasm as an owl."
	.GSTR STR?695,"How do I get the tusk from the boar?"
	.GSTR STR?696,"You'll have to kill the boar."
	.GSTR STR?697,"You can't kill it with your bare hands."
	.GSTR STR?698,"And it looks too big to kill with a conventional weapon."
	.GSTR STR?699,"So maybe you could poison it."
	.GSTR STR?700,"Gee. If only there were a poison apple in the game."
	.GSTR STR?701,"But wait! What luck! There IS a poison apple - conveniently located just east of the ford."
	.GSTR STR?702,"That's really all you need to know, unless you're having difficulty getting the apple to where the boar is - in which case, read on."
	.GSTR STR?703,"Well, first you'll have to get the apple safely out of the land east of the river, which is covered in a separate hint topic."
	.GSTR STR?704,"But once you've done that, you've still got to get the apple to the other side of the chasm."
	.GSTR STR?705,"Of course, the chasm really isn't all that wide."
	.GSTR STR?706,"Throw the apple over the chasm."
	.GSTR STR?707,"More on getting the tusk"
	.GSTR STR?708,"Have you tried pulling the tusk out?"
	.GSTR STR?709,"Cut off the tusk with the sword."
	.GSTR STR?710,"Then throw everything back over the chasm."
	.GSTR STR?711,"How do I get the apple where I need it?"
	.GSTR STR?712,"There are actually two ways to do it."
	.GSTR STR?713,"One way is to carry it past the Black Knight and back through the bog."
	.GSTR STR?714,"Of course to do that, you would have to know how to get through the bog."
	.GSTR STR?715,"Or you could take it by another route."
	.GSTR STR?716,"Been bobbing for apples recently?"
	.GSTR STR?717,"Drop the apple in the ford, go to the shallows, and you'll find that the current has carried it there."
	.GSTR STR?718,"THE BOAR"
	.GSTR STR?719,"What's wrong with the peasant?"
	.GSTR STR?720,"He has passed out from the cold."
	.GSTR STR?721,"How do I awaken the peasant?"
	.GSTR STR?722,"You need to warm him up."
	.GSTR STR?723,"The fire has gone out."
	.GSTR STR?724,"You need to restart the fire."
	.GSTR STR?725,"You need some new fuel for the fire."
	.GSTR STR?726,"Peat is a good fuel."
	.GSTR STR?727,"Go to the bog and cut some peat."
	.GSTR STR?728,"Use the slean."
	.GSTR STR?729,"THE COTTAGE"
	.GSTR STR?730,"How do I get through the bog?"
	.GSTR STR?731,"You need expert guidance."
	.GSTR STR?732,"Ask the peasant in the cottage."
	.GSTR STR?733,"How do I get to the island in the middle of the bog?"
	.GSTR STR?734,"You can't get to it from the bog."
	.GSTR STR?735,"You can't get to it from the air."
	.GSTR STR?736,"Do not read the next clue until you are really stumped."
	.GSTR STR?737,"You have to solve the badger maze to get to the island."
	.GSTR STR?738,"THE BOG"
	.GSTR STR?739,"How can I get past the black knight?"
	.GSTR STR?740,"You'll have to defeat him in battle."
	.GSTR STR?741,"You'll need a good weapon."
	.GSTR STR?742,"Unless the next hint topic begins, ""More on getting past the black knight,"" then someplace in the game there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?743,"More on getting past the black knight"
	.GSTR STR?744,"You have to attack the knight with your sword."
	.GSTR STR?745,"Unless the next hint topic begins, ""Still more on getting past the black knight,"" then you don't have enough experience to defeat him yet."
	.GSTR STR?746,"Still more on getting past the black knight"
	.GSTR STR?747,"You now have all the experience you need to defeat the black knight."
	.GSTR STR?748,"However, you have to do more than simply attack him."
	.GSTR STR?749,"The black knight is enchanted."
	.GSTR STR?750,"Have you looked at him?"
	.GSTR STR?751,"The medallion is the source of his enchanted power."
	.GSTR STR?752,"Wait until you have knocked the sword from his hand, then cut off the medallion."
	.GSTR STR?753,"THE BLACK KNIGHT"
	.GSTR STR?754,"How can I kill the dragon?"
	.GSTR STR?755,"Bloodthirsty sort, aren't you?"
	.GSTR STR?756,"You can't kill the dragon."
	.GSTR STR?757,"How can I get past the dragon?"
	.GSTR STR?758,"Unless the next hint topic begins, ""More on getting past the dragon,"" then someplace in the game there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?759,"More on getting past the dragon"
	.GSTR STR?760,"Does the dragon remind you of anyone?"
	.GSTR STR?761,"Like someone who would rather be in Philadelphia?"
	.GSTR STR?762,"Like someone known for his alcoholic intake?"
	.GSTR STR?763,"Give him the jug of whisky."
	.GSTR STR?764,"THE DRAGON"
	.GSTR STR?765,"How can I kill the apparitions?"
	.GSTR STR?766,"You can't. They're already dead."
	.GSTR STR?767,"How can I stop the apparitions from killing me?"
	.GSTR STR?768,"The apparitions aren't real."
	.GSTR STR?769,"They are being created in your mind by an evil force."
	.GSTR STR?770,"If you leave them alone, they'll leave you alone."
	.GSTR STR?771,"THE APPARITIONS"
	.GSTR STR?772,"How can I stop the basilisk from killing me?"
	.GSTR STR?773,"The basilisk turns everything it sees into stone."
	.GSTR STR?774,"Perhaps if it caught a glimpse of itself...."
	.GSTR STR?775,"Like in a mirror, perhaps..."
	.GSTR STR?776,"Or something that was sort of like a mirror."
	.GSTR STR?777,"Point your shield at the basilisk."
	.GSTR STR?778,"THE BASILISK"
	.GSTR STR?779,"What can I do in the ice room?"
	.GSTR STR?780,"Make ice cream?"
	.GSTR STR?781,"Freeze things."
	.GSTR STR?782,"See the hints for the Hot Room."
	.GSTR STR?783,"THE ICE ROOM"
	.GSTR STR?784,"How can I get past the talking door?"
	.GSTR STR?785,"Just say the word and the door will open."
	.GSTR STR?786,"Oh yeah. We forgot. You can't talk."
	.GSTR STR?787,"Unless the next hint topic begins, ""More on getting past the talking door,"" then someplace in the game there is some object or information that you have not yet discovered. Until you do, it is unlikely that you will solve this puzzle."
	.GSTR STR?788,"More on getting past the talking door"
	.GSTR STR?789,"It sure is hot in here."
	.GSTR STR?790,"Real hot."
	.GSTR STR?791,"Hot enough to melt almost anything."
	.GSTR STR?792,"Especially ice."
	.GSTR STR?793,"Especially ice that contained a frozen word."
	.GSTR STR?794,"Like Nudd."
	.GSTR STR?795,"Go to the ice room, say ""Nudd,"" catch the block of ice before it falls, and bring it back to the hot room."
	.GSTR STR?796,"THE HOT ROOM"
	.GSTR STR?797,"Should I free the girl?"
	.GSTR STR?798,"Have you tried kissing her?"
	.GSTR STR?799,"Take our word for it. You don't want to free her."
	.GSTR STR?800,"She's not what she pretends to be."
	.GSTR STR?801,"If you show her that you know who she is, her disguise will disappear."
	.GSTR STR?802,"She's really the demon himself."
	.GSTR STR?803,"Either attack her, or address her as Nudd."
	.GSTR STR?804,"How do I get out of the demon's lair alive?"
	.GSTR STR?805,"Well, you could turn down the demon's deal and simply leave."
	.GSTR STR?806,"Of course, in that case you wouldn't get the fleece."
	.GSTR STR?807,"It looks as if you'll have to accept his offer."
	.GSTR STR?808,"But perhaps you could outsmart him."
	.GSTR STR?809,"Like if you fulfilled the letter - but not the spirit - of the contract."
	.GSTR STR?810,"All you have to do is open the manacles."
	.GSTR STR?811,"He didn't say anything about not being able to close them again."
	.GSTR STR?812,"Of course, you'd have to open them one at a time."
	.GSTR STR?813,"THE DEMON'S LAIR"
	.GSTR STR?814,"Who is the sleeping woman?"
	.GSTR STR?815,"She is Nimue. The Lady of the Lake."
	.GSTR STR?816,"How can I break the enchantment?"
	.GSTR STR?817,"You must heed Merlin's message in the documentation."
	.GSTR STR?818,"THE UNDERGROUND CHAMBER"
	.GSTR STR?819,"I've defeated King Lot. Now what?"
	.GSTR STR?820,"Remember the instructions of the lady of the lake?"
	.GSTR STR?821,"Call Nimue."
	.GSTR STR?822,"THE ENDGAME"
	.GSTR STR?823,"Can I get more than 100 points in some categories?"
	.GSTR STR?824,"Yes. There are more opportunities to be chivalrous than you absolutely need; you can acquire a few extra wisdom points along the way; and you can get one extra experience point by eating on Christmas Day."
	.GSTR STR?825,"How do the points affect the play of the game?"
	.GSTR STR?826,"Yes. Your experience points affect the fight with the Black Knight; the chivalry and wisdom points are tested by Merlin before he will let you pull the sword from the stone; and the quest points determine your ranking as the game progresses."
	.GSTR STR?827,"POINTS"
	.GSTR STR?828,"Reality vs. romance"
	.GSTR STR?829,"	There is inherent conflict built into writing a game about King Arthur. It is the conflict between history and legend - the way things were, versus the way we wish they were.
	The historical Arthur probably lived in Post-Roman Britain, and reigned between about 454 and 470 AD, although even this is widely debated.
	The bulk of Arthurian legend, however, is based on a series of romances written beginning in the 12th century. The writers of these tales shamelessly projected then-current styles, fashions and culture backwards across the centuries and fastened them to Arthur, where they have stuck firmly ever since.
	Thus, the historical Arthur never jousted. Camelot, if it existed, was not a stone castle with crenellated towers, but a reinforced hill fort with a wooden palisades surrounding a few half-timbered, thatched buildings. Chivalry hadn't been invented yet, nor had the idea of courtly love. Armor consisted primarily of chain mail. The cumbersome suits of plate armor one sees in the Tower of London did not come into vogue for at least 500 years after Arthur's death at the battle of Camlann.
	Given the fanciful nature of the game, it may seem silly to be concerned with the accuracy of historical detail. Nevertheless, I have tried wherever possible to cleave to the Britain of the true Arthur. A few glaring anachronisms - the jousting scene, for example - have been included to make the game more enjoyable. Others, like calling Britain England (Angle-Land), are included as a bow to modern usage. But by and large, the setting is pre-Norman - and even pre-Saxon - Britain."
	.GSTR STR?830,"Post-Roman Britain"
	.GSTR STR?831,"The last Roman legions left England in the year 410. With their departure, the Emperor Honorius authorized the Britons to take up arms to repel the invading Angles and Saxons and Jutes.
	A series of leaders including the historic Arthur (who ruled from about 454 to 470) fought with varying degrees of success to keep the invaders at bay. After Arthur's death, however, the barbarians overran the island, and Britain began the long slide into the Dark Ages.
	The game is set in this period between the departure of the Romans and the descent into darkness. During this time, central authority became fragmented and regional kings came into power. Coinage passed out of use in favor of a barter economy.
	One interesting feature of those years was the curious blend of Christian and pagan beliefs that held sway in Britain. When the Emperor Constantine converted to Christianity in 312, the new faith spread rapidly through the empire. But resident Romans were notorious for incorporating local religious beliefs into their own, and many Britons worshipped both the new god and the old Celtic gods simultaneously (see the appendix item on the Holy Thorn).
	Another prominent feature of the times was the crumbling infrastructure. When the Romans left, they took their knowledge of stonemasonry with them. The towns and fortresses fell into disrepair, and no one knew how to build replacements. In the game, I have modelled the town on the old Roman city of Portchester in the south of England. Here there is an encircling town wall (which survives today) with a fortress at one end. My fictional King Lot built his timber Great Hall behind the old stone walls of the fortress, and positioned it so that his throne backed up to the secret passage that led to the cells below."
	.GSTR STR?832,"Book of hours"
	.GSTR STR?833,"Before the invention of the mechanical clock (the first public clock that struck the hours wasn't built until 1335), people were far less concerned with the precise measure of time than they are today.
	The members of a monastic community, however, had strictly regimented lives consisting of community service, scriptural study, and manual labor that included domestic, garden, and craft work. Moreover, at regular intervals throughout the day they were required to praise the Lord in prayer or song. The periods of time into which they divided the day came to be known as the canonical hours, and the sequence of prayers became known as the divine office.
	Through the centuries, as the requirements of monastic life changed, the number, duration, and nomenclature of the canonical hours changed as well. Thus, at one time, Matins was approximately five hours long, beginning around midnight. Later, it became associated with dawn, and was reduced in length to around three hours.
	Because of these changes, it is impossible to determine with accuracy the actual system that was in effect during Arthurian times. Instead, I created a composite version of the divine office for the game, using wherever possible the earliest known spelling and sequence of the canonical hours:
	Matins:  Midnight - 3:00 a.m.
	Lauds:  3:00 - 6:00 a.m.
	Prime:  6:00 - 9:00 a.m.
	Terce:  9:00 a.m. - Noon
	Sext:  Noon - 3:00 p.m.
	None:  3:00 - 6:00 p.m.
	Vespers:  6:00 - 9:00 p.m.
	Compline:  9:00 p.m. - Midnight
	Elaborately illuminated Celtic gospels - such as the Book of Kells - survive from as long ago as the late 600's. These works of art were too rare - and too heavy - for a monk to carry with him as he performed his daily chores. Instead he would carry a smaller devotional book that contained the prayers to be said at the canonical hours. This breviary was called a Book of Hours.
	The game has adapted the idea of the Book of Hours to help explain the canonical hours to the modern player. Although the book would have contained prayers written in Latin, we have substituted poems that deal with the various activities appropriate to each canonical hour.
	In Arthur's day, centuries before the Norman Invasion, poets neither wrote in rhyme nor counted syllables. The predominant style of poetry was called alliterative verse, and it relied on the frequent repetition of consonant sounds within any given line. The foremost example of this is the masterful 'Sir Gawain and the Green Knight.' The style died out completely when the Conquest brought rhyming, metered poetry to England's shores in 1066.
	We have chosen this style over the more familiar rhyming style for the book of hours and for Lot's poem.
	Finally, for anyone who is wondering why a Book of Hours contains a poem in praise of the evil King Lot, the explanation lies in the system of patronage and indulgences that was popular in the Middle Ages. Under this frequently corrupt scheme, wealthy individuals could buy forgiveness for their less-than-pious acts by sponsoring the creation of holy works of art. Thus, this particular Book of Hours was financed by Lot, who insisted that the poem (which he also payed for) be included."
	.GSTR STR?834,"Thomas the Rhymer"
	.GSTR STR?835,"Thomas the Rhymer was a real man, a seer and poet who lived in the 13th Century. Records of him survive in the form of documents and deeds which he signed as Thomas Rymour de Erceldoune. It is believed that he was the author of the metrical 'Sir Tristrem,' the source from which the great Arthurian romance 'Tristan and Isolde' was later taken.
	After his death, his name passed into popular lore, and by the 15th century it was often linked closely with Merlin's.
	In legend, Thomas the Rhymer acquired his prophetic powers when he met the Queen of Elfland and followed her into the land of the fairies. There he stayed for seven years, before returning to the outside world with the gift of prophecy. After his return, he lived a long and happy life in Erceldoune until one day, while he was feasting in his castle, word came that a hart and a hind were wandering through his village. He left the castle to look at them, and when they turned and went into the forest, he followed them - never to return. Yet for years thereafter, mortals who ventured into fairyland reported that he lived there still, as a councillor to the queen of the fairies.
	In this game, Thomas belongs to the class of supernatural creatures who place tremendous importance on the secrecy of their names. A striking feature of this group of imps is that whenever one of them finds himself alone, he is overwhelmed by an urge to shout out the very name he is trying to conceal. The most famous example of this peculiar behavior can be found in the Grimm fairy tale 'Rumpelstiltskin.' While our Thomas has managed to control the urge to shout his name aloud, perhaps the player will understand his compensatory need to encrypt his name and write it on one of the walls of his tower, while providing the key to the code on another."
	.GSTR STR?836,"Holy thorn"
	.GSTR STR?837,"Legend has it that after Joseph of Arimathea placed Jesus in the tomb, he came to Britain with the Holy Grail, the cup used at the Last Supper. When he arrived in Glastonbury, he thrust his staff into the ground on Weary-All Hill, where it miraculously took root and grew into the Holy Thorn tree that blossoms on Christmas day.
	Descendents of this tree (the original was cut down in Cromwell's time) still grow around Glastonbury. But ever since the calendar reform of 1752 that involved a shift of eleven days, the trees no longer bloom exactly on Christmas Day itself, but rather sometime around Christmas Week.
	In Arthur's day, Glastonbury was surrounded by marshes that flooded each winter, turning the higher ground on which the Holy Thorn grew into an island that the Celts held sacred and called Ynys-wittin - the Island of Glass. Later traditions hold that this is the legendary Island of Avalon.
	At the same time, some 100 miles to the east, lay another island with sacred connotations. On it was a small church dedicated to St. Peter. A few centuries later, Westminster Abbey was built on the foundations of that church, and the land on which it stood was called Thorney Island.
	The urge to have the game combine these two places into one island that was accessible only through supernatural means proved irresistible, leaving unsolved the mystery whether it was pagan magic or a Christian miracle (or a combination of both) that brought Arthur to the throne of Britain."
	.GSTR STR?838,"Nudd"
	.GSTR STR?839,"Nudd is really Gwyn ap Nudd, the Celtic king of the underworld, also known variously as Nodons and Lludd. His name pops up from time to time throughout the body of Arthurian legend. In the tale of St. Collen, for example, the saint goes up to the top of Glastonbury Tor and enters the hill through a magic opening. There he finds Nudd sitting on a golden throne, surrounded by courtiers dressed in red and blue that the saint describes as ""the red of burning fire and the blue of cold.""
	In the Black Book of Carmarthen, Arthur himself ventures into Nudd's realm of Annwn to bring back a miraculous cauldron of inspiration and plenty. In the Old French verse 'Merlin,' written about 1200 by Robert de Boron, we learn that Nudd was also responsible for placing the two dragons underneath the foundations of Vortigern's tower. (It was Merlin's subsequent discovery of these dragons that launched his career as a prophet and magician.)
	The game takes bits and pieces of these legends, pastes them together, and then invents a few more for good measure. The first of these inventions is the idea that Nudd's evil influence spreads over all the land east of the river. Merlin's magic has no power there, which explains why the 'cyr' word will not work, and why the bag will no longer hold an impossible number of objects.
	Another addition is the ""deal with the devil,"" which is not found in Arthurian tradition. The unusual part of these pacts is that the devil always seems to keep his word. One might think that, since he is evil incarnate, he wouldn't bother to honor his promises. A long tradition of tall tales, however, argues otherwise."
	.GSTR STR?840,"Riothamus"
	.GSTR STR?841,"I cannot recommend highly enough a book called The Discovery of King Arthur, by Geoffrey Ashe (copyright 1985, Henry Holt & Co). In it, Ashe puts forward a persuasive argument that identifies King Arthur with a known historical figure named Riothamus.
	Riothamus appears in French historical chronicles as the King of the Britons who led a force of 12,000 men onto the continent during the reign of Pope Leo. His existence is well documented, in fact a letter still survives that was written to him in the year 469 or 470 by a man named Sidonius.
	If Arthur was Riothamus, why didn't contemporary historians refer to him as King Arthur? In its original British form, Riothamus would have been Rigotamos, which meant ""king-most"" or ""supremely royal."" Ashe argues that this was an honorific or title (like 'generalissimo') given to Arthur, by which he was known to his contemporaries. He points out that the same sort of name substitution happened to the Mongol warlord Temujin, who is better known to history by his honorific, ""very mighty ruler,"" or Ghengis Khan."
	.GSTR STR?842,"Nimue"
	.GSTR STR?843,"Through the centuries, the Lady of the Lake has had many different names, including Viviane, Eviene, Niviene, and Nina. But in Le Morte D'Arthur, Sir Thomas Malory calls her Nimue. The game follows Malory on this point, despite the fact that other authors cast Nimue as an evil sorceress who sometimes becomes Merlin's nemesis.
	In many versions of the legend, it is the Lady of the Lake who gives the mighty Excalibur to Arthur. In some texts, however, Excalibur appears in a churchyard as the sword in the stone, and Arthur must prove his right to the throne by pulling it free on Christmas Day.
	This game puts Excalibur into Arthur's hand in a way that satisfies both of these traditions. Arthur does indeed pull the sword from the stone on Christmas Day, but it is the Lady of the Lake who gives him the power to do so by parting the waters of the lake when he calls her name."
	.GSTR STR?844,"The blank gravestone"
	.GSTR STR?845,"So many people have asked the meaning of the blank gravestone in the churchyard that I have decided to explain it here, rather than waiting for a possible sequel.
	When Sir Lancelot was born, he was taken away from his parents and raised by the Lady of the Lake (which is why he is sometimes called Lancelot du Lac). Like Arthur, he grew up in ignorance of his name and royal parentage.
	Lancelot does not learn his true name until he captures Dolorous Gard and breaks the enchantment that lays over the castle. There, in a magic cemetery, he finds a tomb in which he is told he will one day lie. While he stands there, his name magically appears upon the previously blank tombstone, and that is how he learns his true identity.
	In this game, this is the tombstone that conceals Arthur from Lot's soldiers. Lancelot and the other Knights of the Round Table do not belong in this game, but I thought it appropriate that before he even comes into the world, Lancelot is already acting as Arthur's friend and protector."
	.GSTR STR?846,"Geography"
	.GSTR STR?847,"I have taken great liberties with geography, specifically by implying that all the game's action takes place in Lot's kingdom.
	Lot was the king of Lothian, which is in the north of Britain. The location of the sword in the stone is most frequently given as London or Winchester. Merlin's cave was in Carmarthen (Caer Myrddin) in Wales. The Lady of the Lake lived near Glastonbury.
	For the sake of convenience, I have moved Lot's kingdom south, Merlin's cave east, and the sword in the stone west (or north), so that they all converge on a spot near the home of the Lady of the Lake, in a setting that can be called Glastonbury-ish."
	.GSTR STR?848,"Bibliography"
	.GSTR STR?849,"The following is a partial list of books I found useful and/or interesting in the creation of this game.

	FICTION:

	Le Morte D'Arthur, by Sir Thomas Mallory
	The History of the Kings of Britain, by Geoffrey of Monmouth
	Sir Gawain and the Green Knight, translated by J.R.R Tolkein
	The Once and Future King, by T.H. White
	The Crystal Cave, by Mary Stewart
	The Hollow Hills, by Mary Stewart
	The Last Enchantment, by Mary Stewart
	The Wicked Day, by Mary Stewart
	The Acts of King Arthur & His Noble Knights, by John Steinbeck

	NON-FICTION:

	King Arthur's Avalon, by Geoffrey Ashe
	The Quest for Arthur's Britain, by Geoffrey Ashe (Editor)
	The Discovery of King Arthur, by Geoffrey Ashe
	The Landscape of King Arthur, by Geoffrey Ashe
	Arthur's Britain, by Leslie Alcock
	Was This Camelot?, by Leslie Alcock
	The Arthurian Encyclopedia, by Norris Lacy (Editor)

	Folklore, Myths, & Legends of Britain, by Reader's Digest
	An Encyclopedia of Fairies, by Katharine Briggs
	Brewer's Dictionary of Phrase & Fable, by Ivor Evans (Editor)
	Literary Britain, by Frank Morley
	Intelligent Travellers Guide to Historic Britain, by Philip A. Crowl
	Treasures of Britain, by Drive Publications Ltd. for AA
	Art Treasures in the British Isles, by Bernard S. Myers & Trewin Copplestone (Editors)"
	.GSTR STR?850,"SENIOR PROGRAMMER
Duane Beck

TECHNICAL CONSULTANT, FRIEND, & SHERPA GUIDE TO THE PARSER
Stu Galley

TESTERS (Alphabetically by first name)
Adam Levesque, Amy Briggs, Avril Korman, Byron Goulding, Duncan Blanchard, Elizabeth Langosy, Jacob Galley, James Bates, Joe Prosser, Liz Cyr-Jones, Patti Pizer, Peggy L. Bates, Richard Bates, Shaun Kelly, Steve Watkins, Stuart Kirsch

PRODUCERS
Jon Palace, Christopher Erhardt, Mike Kawahara

COMPUTER GRAPHICS
Darrell Myers, Tanya Isaacson, Sophie Green, Donna Dennison, Jim Sullivan

PACKAGE DESIGN
Carl Genatossio, Gayle Syska

COVER ART
Greg Hildebrandt

PACKAGE POETRY
Antonio Alfredo Giarraputo

BOOK OF HOURS ART
Ed Bradley

GRAPHICS WIZARD
Tom Veldran

MICRO INTERPRETERS
Duncan Blanchard, Jon Arnold, Scott Fray

GURU
Tim Anderson

AT THE LAST MINUTE
AND AT GREAT EXPENSE
Dave Lebling

Special thanks also to Dave Wilt, John May, Joel Berez, and Chris Reeve, who got the whole thing started."
K-CREDITS-MSG=STR?850
	.GSTR STR?851,"Credits"
	.GSTR STR?852,"NOTES"
	.GSTR STR?853," InvisiClues (tm)"
INVISICLUES=STR?853
	.ENDSEG


	.ENDI
