!==============================================================================
! $Id: risorg.h,v 1.8 2006/03/09 03:45:15 michael Exp $
!
! $Log: risorg.h,v $
! Revision 1.8  2006/03/09 03:45:15  michael
! Added release note for final version.
!
! Revision 1.7  2006/03/09 03:38:19  michael
! Bugfixes and context-driven hints. Final, final version.
!
! Revision 1.6  2004/04/24 01:32:51  michael
! - hints are now adaptive and use DMenus instead of Hints and Altmenu
!
! Revision 1.5  2003/11/27 16:15:50  michael
! Updated release information for version 3.
!
! Revision 1.4  2003/11/27 16:09:13  michael
! Updated hints about Ninario and spectacles to match game.
!
! Revision 1.3  2003/09/26 03:37:34  michael
! Few final bugfixes for Comp03.  Smelling, searching NPCs, version info.
!
! Revision 1.2  2003/09/24 20:59:21  michael
! Initial competition release
!
! Revision 1.1  2003/07/05 03:06:48  michael
! Initial release to beta-testers
!
!
!==============================================================================
!Replace DoMenu;
!Replace LowKey_Menu;
!Constant ALTMENU_PROP_STUBS;

Constant HINTD__TX = "HINTS disabled.";
Constant HINT_NOMORE = "^^No more hints available.^";
Constant NO_GRAMMAR;
Constant NO_HOWTO_GRAMMAR;
Constant INCLUDE_HINTOPTION 0;
Constant HINT__TX   = "RETURN = read hint";
Constant HINT__KY = $0D; 
Constant HINT_NOBLANKLINES 0+INCLUDE_HINTOPTION; 
Constant HINT_WARNING = "[Warning: It is recognised that the temptation for
            help may at times be so exceedingly strong that you might
            fetch hints prematurely. Therefore, you may at any time during
            the story type HINTS OFF, and this will disallow the seeking
            out of help for the present session of the story. If you still
            want a hint now, ";

Include "DMenus";
Include "howtoplay";
Include "ccpl";

Menu HelpMenu with short_name [; print (string) Story; rtrue; ];

Menu    ->   AboutMenu
    with    short_name [; print "About ", (string) Story; rtrue; ];

Option  -> -> AboutGame "About the game"
    with    description [; print "I started this game in March of 2003 when I
                rediscovered r.a.i-f and first heard of the Inform programming
                language.^
                ^It was created using gVim on a Duron 1.3GHz machine
                running Linux. A patched build of the Inform
                compiler and library files were used in compilation.^
                ^The idea for the plot grew out of a short story I had started
                to write about a student being accidentally sucked into the
                internship programme in an alternate dimension. That was about
                the extent of the story when I started the game, and it has
                grown from there.^
                ^The name of the game came from my desire to capture the idea
                that the Wizards Guild were suppressing a magical society on the
                verge of breaking through into the age of reason. Risorgimento
                is a legitimate English word, taken from Italian, meaning ",
                (i) "a time of renewal or renaissance", ". Once I had chosen one
                Italian word, I opted for ", (i) "Risorgimento Represso", " for
                its literal meaning of ", (i) "Renaissance Repressed",
                (string)period, "^
                ^The game and hints were completed by July 1, 2003, and the
                first beta release to the testers was made at that time.^
                ^The second beta-release followed on August 31, and the
                testers were then given one final version to look over on
                September 17. The initial competition release was built
                on September 24, and uploaded to the IF Comp website.^
                ^Note that spellings of some words may look incorrect. This is
                because British spellings have been used throughout, given the
                main character's nationality. Of particular note is the word
                ~carcase~ which may look wrong but is, in fact, correct. Also,
                in Europe, the ground level of a building is often referred to
                as the ~ground floor~, and climbing the first set of stairs
                takes you up to the ~first floor.~^";];

Option  -> -> AboutAuthor "About the author"
    with    description [; print ">ask michael about himself
                ^Michael shrugs. ~There's not much to tell. I have a Bachelor of
                Science degree in Computer Engineering, which I got because I
                figured that my love of English would doom me to teaching
                English, and that I could always write fiction in my spare time
                if I had a steady job.^
                ^~For the last five years, I've been working designing computer
                hardware: mobile handheld computer terminals for an American
                company.^
                ^~In my spare time, well, lately, it's been mostly coding of
                Risorgimento Represso, but I also have keen interests in Linux,
                reading, writing... and of course, my wife and I have a
                seven-month old baby in the house now too, who receives a lot
                of our spare time.^
                ^~We also have a somewhat disenchanted cat named Oscar, who
                still feels he got a raw deal over the whole baby thing. After
                all, no one consulted ", (i) "him", " about it.~^
                ^Michael stops and glances at you. ~Is that the sort of thing
                you were looking for?~^
                ^>ask michael about himself
                ^Michael frowns. ~I've already told you everything you really
                need to know. Why not get back to the game?^
                ^~Oh wait, you're
                right, one more thing. I'd love to hear any comments you have
                about the game, and can be reached at coyne@@64mts.net.~^
                ^Michael falls silent and resumes staring intently at his gVim
                editor window.^"; ];
                
!Separator -> -> -> " ";
LineGap    -> ->;

!Menu    ->  -> HowItem
Option  ->  -> HowItem
    with    short_name [; print "How to Play Interactive Fiction"; rtrue; ],
            !select [; HowToMenu.select(); return 2; ];
            before [; HowToMenu.select(); return 2; ];

Menu    ->  -> "License Information"
    with    before [; license_menu.select(); return 2; ];

!Separator -> -> -> " ";
LineGap    -> ->;

Option  -> -> Credits "Credits"
    with    description [; print "Thanks to ", (b) "Graham Nelson", " for
                creating Inform, not to mention the DM4.^
                ^Thanks to ", (b) "Roger Firth", " and ", (b) "Sonja Kesserich",
                " for creating the IBG, which got me started on this whole
                thing.^
                ^Thanks to ", (b) "Fredrik Ramsberg", ", whose ", (i) "A
                Beginner's Guide to Playing Interactive Fiction", " enabled me
                to easily add a ", (i) "How to Play", " section to my help
                menus.^
                ^Many thanks to those whose library extensions
                I've used, specifically:^",
                (b) "Irene Callaci", " (", (i) "AskTellOrder", ")^",
                (b) "Neil Cerutti", " (", (i) "pname", ")^",
                (b) "Michael Coyne", " (", (i) "howtoplay", ") - oh, wait a
                    minute^",
                (b) "Roger Firth", " (", (i) "CCPL", " and ", (i) "Writelist",
                    ")^",
                (b) "Cedric Knight", " (", (i) "seeno", ")^",
                (b) "L. Ross Raszewski", " (", (i) "Hints", " and ",
                    (i) "yesno", ")^
                ^Also, many thanks to my various beta testers:^",
                (b) "Matt Gardner^
                David Griffith^
                Jessica Knoch^
                Stark Springs^",
                "^Everyone's input was a big help, but special mention simply ",
                (i) "must", " be made of the debt owed to Jessica, who did a
                really superb job of beta-testing, finding some really obscure
                problems, and providing an extensive list of additional
                topics for the NPCs. She's the main reason my
                $$MAX_DICT_ENTRIES is set to 2000 for compilation.^
                ^Oh, and one more thank you: thanks for playing!^"; ];

Option  -> -> RelNotes "Release Notes"
    with    description [; print "Release 1, 030925: initial Comp 2003
                release^
                Release 2, 031117: post-comp bugfix release^
                Release 3, 031127: fixed end-game timer bug^
                Release 4, 060308: final release. Glulx support, context
                    sensitive hints.^"; ];

Option  -> -> Problems "Problems and bugs"
    with    description [; print "Reports of bugs, problems and errors can be
                sent to me at coyne@@64mts.net.^
                ^I'd also love to hear from you if you enjoyed the game, and
                think it's worth plugging away on the sequel!^"; ];

Option  -> -> Special_Features "Special Features"
    with    description [; print "A brief mention of some of the less common
                functionality this game supports that might be of
                interest to the player:^
                ^- compasslook (i.e. 'look ne') is supported.
                ^^- all doors open automatically, and also unlock automatically
                if you're carrying the right key in your hand or the satchel.
                ^^- when you ~open door~ in an area with more than one door, the
                game will choose the correct door if only one of them is closed.
                ^^- likewise for ~close door~, as well as lock and unlock. In
                all other cases, disambiguation proceeds as normal.
                ^^- you can ~look through~ most of the doors in the game to see
                the room beyond... you can't make out much detail, but you get
                some information about the room you're about to step into.
                Naturally, if the door is closed, you don't see much.
                ^^- just typing ~hello~ in a location with an NPC will direct
                the statement to them, and act as though the player typed ~say
                hello to <NPC>~.^
                ^- the regular build of the game supports recording and
                replay if you wish to use them^
                ^- getting into the farm is an optional puzzle, but it does
                mean you'll have to jump into a later puzzle with both feet,
                and also really butter Ninario up properly if you want to win^
                ^- ", (i) "win", " and ", (i) "walkthrough", " verbs are
                also supplied, in case you run out of time.^"; ];

!Separator -> -> -> " ";
LineGap    -> ->;

Option -> -> "Go Back" with description [; return 3; ];

!Separator -> " ";
LineGap    ->;

Option ->   Points_Scored_in_Main "How the Points are Scored"
    with    description [;
                if (self hasnt general)
                    print "[Warning: this section may contain spoilers for the
                    game. If you haven't yet finished the game, you may not
                    want to read these. If you still want to, select this menu
                    item again.]^";
                else { font off; print
                    "ACTION                                             POINTS^
                    Entering the glowing portal                            1^
                    Cleaning the library                                   1^
                    Turning on the magnesium flare                         1^
                    Unblocking the sewer vat                               4^
                    Getting the spectacles clean                           1^
                    Giving the spectacles to Ninario                       1^
                    Having Ninario attempt to close the rift               4^
                    Raising the portcullis                                 2^
                    Creating the black powder                              4^
                    Blasting yourself/cannonball through the caer doors   4/2^
                    Spreading wood hastener on the elm tree                1^
                    Getting past the hawk in the elm tree                  1^
                    Landing in the farm garden                             1^
                    Getting rid of the dogs in the garden                  1^
                    Finding the arktos essence in the barn                 1^
                    Exiting the farmyard through the gate                  1^
                    Finding the gold coin in the Building Society          1^
                    Opting to brutally murder the old crone               -2^
                    Using the scrying bowl the first time                  1^
                    Giving drill/10 plotkins/5 plotkins to guard         4/2/1^
                    Getting past the bear on the ledge                     4^
                    Giving goggles or pillow to hermit                     1^
                    Getting hermit to open hermetically sealed bottle      2^
                    Blowing up first floor of Wizards Guild Hall           2^
                    Spreading wood hastener on cell door                   1^
                    Escaping the Wizards Guild Hall                        5^
                    MAXIMUM POSSIBLE SCORE                                50^";
                    font on;
                }
                give self general; rtrue; ];

Option ->   Amusement_in_Main "For your Amusement and Edification"
    with    description [;
                if (self hasnt general) {
                    give self general;
                    print "[Warning: this section may contain spoilers for the
                    game. If you haven't yet finished the game, you may not
                    want to read these. If you still want to, select this menu
                    item again.]^";
                }
                else {
                    print "Have you tried...^
                    1) singing?^
                    2) singing in the presence of the various characters in the
                    game? Of the crone, both dead and alive?^
                    3) burning things?^
                    4) climbing things that can't be climbed?^
                    5) saying xyzzy, plugh or plover? Doing so in front of
                    various NPCs?^
                    6) trying to eat inedible things?^
                    7) typing JUMP? HOP? SKIP? JAUNT?^
                    8) kissing NPCs? Touching NPCs? Licking NPCs? Doing all the
                    same to yourself?^
                    9) listening to yourself?^
                    10) smelling yourself after reaching into the sewer vat or
                    while you're wearing the arktos essence?^
                    11) swimming in the fountain, watering can or chamberpot?^
                    12) tasting yourself both before and after wearing butter
                    or arktos essence?^
                    13) waving things in the presence of various characters?^
                    14) examining yourself before and after entering the
                    portal?^
                    15) wandering around in the dark for a few turns?^
                    16) trying to empty water over the floor in Ninario's
                    study, while he's in there?^
                    17) entering areas with NPCs while wearing the chamberpot,
                    helmet, bearskin rug, or goggles?^
                    18) donning and doffing the chamberpot, helmet, bearskin
                    rug and goggles in the presence of NPCs?^
                    19) yawning in the presence of NPCs?^
                    20) examining the professor after each time you try the
                    doors in the lecture hall?^
                    21) greeting all the NPCs in the game (using NPC, HELLO or
                    SAY HELLO TO NPC) ?^
                    22) waking your fellow students?^
                    23) smashing all the windows in the game?^
                    24) smashing the library windows before and after Ninario
                    is taken away?^
                    25) opening or closing windows after they've been smashed?^
                    26) leaving the study or bedroom via the windows?^
                    27) looking under the cushions on the couch while Ninario
                    is in the room?^
                    28) dropping the carpet or rug in the presence of NPCs and
                    then looking under it?^
                    29) placing the rug or carpet over the trap door in the
                    shed?^
                    30) discovering all the words that can be used to refer to
                    the toilet? There are 25 or so.^
                    31) asking Ninario repeatedly about his robes?^
                    32) asking Ninario about his entrance examination at the
                    Wizards Guild?^";
                    print "33) asking Ninario about theft? Magic? Thalion?^
                    34) asking Ninario about the copper sulphate, then about
                    the mushrooms he mentions?^
                    35) showing the bearskin rug to Ninario once you find him
                    again?^
                    36) showing your robes to Ninario?^
                    37) showing the black powder to Ninario?^
                    38) showing the vial of muriatic acid to Ninario?^
                    39) showing the chamberpot to Ninario twice?^
                    40) asking Ninario to open and close the study door?^
                    41) using the chamberpot?^
                    42) firing yourself into the portcullis?^
                    43) climbing on the laboratory's rickety metal table, or
                    placing the heavy cannonball on it?^
                    44) smashing the figurines on the fountain both before and
                    after Ninario leaves the caer?^
                    45) taking or riding the dogs in the farmyard?^
                    46) attacking, kissing, touching or taking the townsfolk
                    in Vechlee?^
                    47) entering Wizardry Wooding many times to see all the
                    messages? There are a few that only occur 1.5% of the time,
                    and one that only occurs 0.5% of the time.^
                    48) hanging around in Wizardry Wooding to watch all the
                    things Betty the shopkeeper does? There are a couple that
                    only occur 0.67% of the time.^
                    49) greeting Betty more than once?^
                    50) putting things on Betty's countertop?^
                    51) cleaning the countertop in Wizardry Wooding?^
                    52) attacking the old crone and then playing the game
                    through to completion?^
                    53) touching or kissing the old crone before and after
                    attacking her?^
                    54) asking the old crone about Ninario?^
                    55) asking the old crone about Renaldo?^
                    56) asking the old crone about zorkmids?^
                    57) asking the old crone about the trophy case?^
                    58) taking the marble columns from the guild hall?^
                    59) showing the flying carpet to the hermit?^
                    60) ordering the hermit around before and after getting him
                    to unseal the bottle?^
                    61) asking the hermit about Renaldo?^
                    62) asking the hermit about the union, and then the three
                    league radius and gang wars he subsequently mentions?^
                    63) working your way through all the cheese visions? There
                    are fifteen of them, but only ten cheeses that provide
                    visions. There are eleven cheeses in the game, but the
                    Caerphilly never provides a vision, due to its poor
                    tyromantic capabilities.^
                    64) looking under things? Looking under yourself?^
                    65) selling things to yourself or other NPCs?^
                    ^There are a few others not mentioned in this list. Have
                    fun finding them!";
                }
                rtrue;
            ];

#ifdef USE_HINTS;
!Separator -> " ";
LineGap    ->;


Option  -> PreHints "Hints"
    with    description [;
                print (string) HINT_WARNING;
                "select this menu item again.]";],
            after [;
                give HintMenu ~concealed;
                give self concealed;
            ];

Menu    ->  HintMenu "Hints"
    with    short_name [;
                if (self has open) {
                    print "Hints for ", (string) Story;
                    rtrue;
                }
            ],
    has     concealed;

Menu    -> -> LectMenu "Lecture Hall";
HintOption  -> -> -> "What do I need to do here?"
    with description
        "Have you tried staying around for the lecture?"
        "It's dead boring, yet oddly hypnotic."
        "You have to find a way out of here before the lecture ensnares
        you.";

HintOption -> -> -> "What's this yogurt for?"
    with description
        "Have you tried picking it up to find out?"
        "Oops... now it's disappeared under the desk."
        "You'd best retrieve it... the cleaning staff aren't very thorough
            here."
        "You can't find it just by reaching under the desk."
        "LOOK UNDER DESK";
    
HintOption -> -> -> "How do I get out of here?"
    with description
    "Hmmm... the doors are locked. They seem to be the only way out."
    "Have you tried interacting with the objects in the room or waiting around
        to see what happens?"
    "That's an odd rumbling coming from under the desk."
    "LOOK UNDER DESK";

HintOption -> -> -> "How do I open the doors?"
    with description
        "Do you have a key? Or anything else for opening doors?"
        "The doors are not the way out of here.";

HintOption -> -> -> Portal_Hint "Where did this portal come from?"
    with description
        "It seems to have spontaneously arrived."
        "You could probably find out where it came from by finding out where it
            leads."
        "ENTER PORTAL",
    has concealed;

Option -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> CaerMenu "Ninario's Caer"
    has concealed;

Option -> -> -> "What on earth is a caer?"
    with description [;
        print (i) "Caer", " is a Celtic and Welsh word meaning ",
        (i) "fort", ". It is properly pronounced KIRE. Simply, it rhymes with
        the English word ", (i) "hire", " though the ending R should be trilled
        on the end of the tongue.^"; ];

Menu    -> -> ->    "Library";
HintOption -> -> -> -> "How do I get out of the library?"
    with description
        "Something is preventing you from going through the doors."
        "It's a pity the room is such a mess."
        "TIDY MESS, MOVE PAPERS or TIDY ROOM";

HintOption -> -> -> -> "Is there anything interesting in these books?"
    with description
        "You could always read them and find out."
        "You don't need to worry about the books in the library.";

HintOption -> -> -> -> Keyhint "What's the key for?"
    with description
        "Have you found any locked doors yet?"
        "You could go around and try it in all of them."
        "If you try to walk through a locked door and you're carrying the
            correct key, the door will be unlocked automatically."
        "The small steel key opens the polished steel door on the main level.",
    has concealed;

HintOption -> -> -> -> Sathint "Where did this satchel come from?"
    with description
        "Try licking it, tasting it or smelling it. Remind you of anything?"
        "Much as your clothes were transformed coming through the portal, so
            too the yogurt cup. It has changed into a magical bottomless
            satchel."
        "You can put as many things as you like into it and it will never
            become full or heavy.",
    has concealed;

Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> -> StudyMenu "Study"
    has concealed;

HintOption -> -> -> -> "Where can I find Ninario's spectacles?"
    with description
        "Have you tried asking him about them?"
        "The last place he remembers having them is in the toilet."
        [;  if (Toilet hasnt visited)
                print "Perhaps you'd better go check out the toilet before
                    reading any more.";
                else print "There wasn't much in there... other than a big hole
                    leading down to the sewer vat in the basement."; ]
        "Ninario suspects that he dropped them down the drain, and he's right."
        "They're now sitting in the sewer vat in the basement. See the basement
        hints for more information.";

HintOption -> -> -> -> "How do I get Ninario to close the rift?"
    with description
        "Did you try asking him?"
        "Try NINARIO, CLOSE RIFT or NINARIO, SEND ME HOME or even ASK NINARIO
            ABOUT SENDING ME HOME or ASK NINARIO ABOUT CLOSING RIFT";

HintOption -> -> -> -> "Ninario's spell left me stranded!"
    with description
        "Did you notice anything odd about Ninario after you gave him the
            spectacles?"
        "Watch him for a short time; he's behaving rather oddly."
        "Did you examine the glasses before you gave them back to him?"
        "They're filthy after their time in the vat."
        "Before you give the spectacles to Ninario, CLEAN SPECTACLES"
        "Or, you can order NINARIO, CLEAN GLASSES if you've already given them
            to him, or ask NINARIO, GIVE ME GLASSES and then clean them
            yourself."
        "Ninario will now be able to cast the spell properly.";

HintOption -> -> -> -> "How do I take the rug without Ninario noticing?"
    with description
        "You can't. As long as Ninario is around, he won't let you take the
            rug."
        "After Ninario casts the spell to close the rift, you'll be able to
            take the rug.";
Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->  MainHallMenu "Main Hall"
    has concealed;

HintOption -> -> -> -> "How do I get through the rusty metal door?"
    with description
        "If you're carrying the right key and try to walk through the door, it
            will be unlocked and opened automatically for you."
        "However, this particular key is nowhere to be found."
        "Ninario has it, but he doesn't know it."
        "He won't give it to you if you ask for it, and you can't take it away
            from him."
        "But don't worry. It will turn up once you find Ninario's spectacles
            and ask him about closing the rift or sending you home.";

HintOption -> -> -> -> "How do I get through the shiny steel door?"
    with description "If you're carrying the right key and try to walk through
        the door, it will be unlocked and opened automatically for you.";


Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->  WorkshopMenu "Workshop"
    has concealed;

HintOption -> -> -> -> "What's with all these odd devices and machines?"
    with description
        "They're all Ninario's projects, some finished, some unfinished."
        "You don't have to worry about most of them, but a few might prove
            interesting."
        "The drill, goggles, ball mill and blast furnace are all of interest.";

HintOption -> -> -> -> "What's the drill for?"
    with description
        "The drill can help you in three ways; the specifics are covered in the
            appropriate sections of the hints.";

HintOption -> -> -> -> "How do I use the ball mill?"
    with description
        "It's used to effectively mix chemicals together."
        "You must drop the right chemicals into it, and then mix them by
            turning the mill."
        "If you don't know what you need to make, explore the tower a bit more."
        "You need to make some black powder."
        [;  if (Ninario in Study)
                print " If you don't know how, there's someone around who
                    might.";
                else print " With Ninario gone, you'll have to figure out how
                    on your own."; ]
        "Have you checked your class notes? If you can't figure it out from the
            notes or from Ninario, the next few hints will tell you."
        "The yellow powder is sulphur."
        "The white powdery substance is saltpetre or potassium nitrate (KNO3)."
        "The black grainy substance is charcoal."
        "If you mix all these together, you'll get black powder."
        "To mix the substances, drop them all into the ball mill, and then turn
            the crank."
        "EMPTY FLASK INTO MILL^
         EMPTY PURSE INTO MILL^
         EMPTY POUCH INTO MILL^
         TURN MILL";

HintOption -> -> -> -> "I put everything in the ball mill, but nothing
        happened!"
    with description
        "Did you turn the ball mill?"
        "Make sure the proper ingredients (and of course the lead balls) are
            the only substances in the ball mill.";

HintOption -> -> -> -> "What do I do with the blast furnace?"
    with description
        "Have you examined it? Or tried opening it?"
        "It looks like the last time it was used, Ninario was making
            cannonballs."
        "The cannonball has two purposes in the game, so it's a useful thing to
            have around.";

HintOption -> -> -> -> "What can I use the goggles for?"
    with description
        "They're very dark, and make walking around a bit difficult."
        "The goggles have two distinct uses in the game. Specific hints are
            found in the relevant places.";
Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->  KitchenMenu "Kitchen"
    has concealed;

HintOption -> -> -> -> "What do I do with the margarine?"
    with description
        "It's butter, not margarine. If you refer to it as margarine once, the
            game corrects you."
        "If you wish, though, you can continue to refer to it as margarine
            after this. Or at least until you find some real margarine.";

HintOption -> -> -> -> "What do I do with the butter?"
    with description
        "What is butter good for apart from spreading on toast?"
        "It makes a very effective lubricant."
        [;  if (Cannon.tried == false)
                print "Perhaps you should do a bit more exploring, and try a few
                more things; you might find a need for the butter.^";
            else print "You've already tried something that failed because
                there was too much friction.^"; ]
        "The butter can help you ease your way into the cannon."
        "SPREAD BUTTER ON ME or WEAR BUTTER or SPREAD BUTTER ON CANNON"
        "It can also come in handy later for a similar purpose.";

HintOption -> -> -> -> "What do I do with the pots and pans?"
    with description
        "Have you examined them or tried to take them?"
        "Just as it says, they're too rusted to be of real use.";
Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->  BasementMenu "In the Basement";

HintOption -> -> -> -> "Where do I find a light source to get into the basement?"
    with description
        "Pretty dark down there, isn't it?"
        [;  if (Laboratory hasnt visited)
                print "Perhaps you should explore a few more rooms first.^";
            else print "There's an item in Ninario's laboratory that can be used as a light
                source.^"; ]
        "Take a careful look at everything you found in there."
        "It's not one of the chemical compounds."
        "Magnesium flares are very bright. And magnesium is element #12."
        "The silvery-white cylinder is really a commercial grade magnesium flare; in other
            words, a light source."
        "You can turn it on by shaking it, twisting it, opening it, breaking it
            or turning it.";

HintOption -> -> -> -> SewerHints "How do I empty or unblock the vat?"
    with description
        "Have you examined the sewer channel in the basement? It appears to be
            blocked."
        "You'll have to find a way to unblock all that mess, but you can't do
            it by hand."
        "Something in the laboratory can assist you in unblocking the sewer channel."
        "Have you examined the stone bottle closely?"
        "It contains a warning not to mix it with methane."
        "Have you tried opening the bottle in the sewer room?"
        "Yikes! That doesn't work too well. If only there was a way to get the
            open bottle down into the sewer without taking it there yourself."
        "The toilet hole transports anything dropped into it down to the sewer
            vat."
        "POUR WIZSTRIP INTO HOLE",
    has concealed;

HintOption -> -> -> -> RubbishHints "What do I need to do with this heap of
        rubbish?"
    with description "Try examining it.",
    has concealed;

Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->   CourtMenu "In the Courtyard"
    has concealed;

HintOption -> -> -> -> Shedhint "How do I enter the shed?"
    with description
        "The lock is so rusted even if you found the right key it probably
            wouldn't work."
        "Rather than unlocking the shed door, the lock can be circumvented.
            There are two ways to do this."
        "The first involves an item in the laboratory."
        "The second involves an item from the workshop."
        "The lock, being old and rusty, is now very weak metal."
        "The muriatic acid from the laboratory can eat through the lock in a
            matter of moments."
        "You could also use the drill from the workshop to drill out the
            tumblers."
        "POUR ACID OVER LOCK or DRILL LOCK",
    has concealed;

HintOption -> -> -> -> "How do I open the portcullis?"
    with description
        "You can't unlock it or raise it by hand."
        "But there is a machine that can do it."
        [;  if (Gatehouse hasnt visited)
                print "If you do a bit more exploring, you might find it.";
            else print "You saw it in the gatehouse, above the bailey."; ];

HintOption -> -> -> -> HydroHints "How do I use the hydrolytic machine?"
    with description
        "It's hydrolytic which means it operates by hydrolysis: the splitting
            of water into hydrogen and oxygen."
        "But it only operates properly if the correct amount of water is placed
            into it."
        [;  if (Chamberpot has moved && Watering_Can has moved)
                print "You've found an item that holds 3 pints of water, and
                    another that holds 5.^";
            else
                print "You should explore a bit more and find all the items
                    that can carry water.^"; ]
        "The chamberpot under the bed holds 3 pints of water, while the
            watering can in the shed holds 5."
        "If you try pouring 3 pints into the funnel, the machine strains to
            move, but doesn't quite make it. Perhaps 3 isn't enough."
        "If you try pouring 5 pints into the funnel, the machine pulls the
            portcullis open with such force that it hits the top and slams back
            down again. Perhaps 5 is too much."
        "What's less than 5 but more than 3?"
        "There's also a hint on the machine itself about the proper quantity."
        "The machine operates with more than 3 pints and less than 5. In other
            words, 4."
        "Now all you need is something that holds 4 pints.",
    has concealed;

Menu    -> -> -> -> LiqMenu "How do I get the proper amount of liquid for the machine?"
    has concealed;

HintOption -> -> -> -> -> "Getting the proper amount of liquid (METHOD 1)"
    with description
        [;  print "The first method involves ";
            if (Watering_Can hasnt moved && Chamberpot hasnt moved)
                print "two items you haven't found yet. Perhaps you should
                    explore a bit more, or go back and read about one of the
                    other methods.^";
            else if (Watering_Can hasnt moved)
                print "the chamberpot and another item you haven't found yet.
                    Perhaps you should explore a bit more.^";
            else if (Chamberpot hasnt moved) print "the watering can and another
                item you haven't found  yet. Perhaps you should explore a bit
                more, or go back and read about one of the other methods.^";
            else print " the watering can and the chamberpot.^"; ]
        "The watering can holds 5 pints. That's too much."
        "The chamberpot holds 3 pints. That's too little."
        "But water can be transferred between them to make the proper amount of
            liquid."
        "While in the courtyard:^
            FILL CAN^
            POUR CAN INTO POT^
            EMPTY POT^
            POUR CAN INTO POT^
            FILL CAN^
            POUR CAN INTO POT^
            The can now contains 4 pints of water.";
        
HintOption -> -> -> -> -> "Getting the proper amount of liquid (METHOD 2)"
    with description
        [; print "The second method involves ";
            if (Watering_Can hasnt moved && Helmet hasnt moved)
                print "two items you haven't found yet. Perhaps you should
                    explore a bit more, or go back and read about one of the
                    other methods.^";
            else if (Watering_Can hasnt moved)
                print "the helmet and another item you haven't found yet.
                    Perhaps you should explore a bit more.^";
            else if (Helmet hasnt moved) print "the watering can and another
                item you haven't found yet. Perhaps you should explore a bit
                more, or go back and read about one of the other methods.^";
            else print "the watering can and the helmet.^"; ]
        "The watering can holds 5 pints. That's too much."
        "The helmet holds 1 pint. That's too little."
        "But water can be transferred between them to make the proper amount of
            liquid."
        "In the courtyard:^
            FILL CAN^
            POUR CAN INTO HELMET^
            The can now contains 4 pints of water.";

HintOption -> -> -> -> -> "Getting the proper amount of liquid (METHOD 3)"
    with description
        "The third method involves modifying the watering can. It normally
            holds 5 pints of water."
        "There's no way to make it hold less than 5 pints of water."
        "But there is a way to make it lose water after you fill it. If you
            then carry it to the machine in time, it will be holding exactly 4
            pints of water when you empty it into the funnel."
        "There are two ways to make the watering can drip."
        "The first involves an item in the laboratory, the second an item in
            the workshop."
        "The muriatic acid can be poured into the watering can, where it will
            eat through the metal, creating a hole."
        "You can also use the hand drill to drill a hole in the can.";
Option -> -> -> -> -> "Go Back" with description [; return 3; ];

HintOption -> -> -> -> "How do I open the doors of the caer?"
    with description
        "There is no key for these doors. Ninario keeps them locked magically
            all the time."
        [; "Sheer brute force ", (i) "will", " work to punch through the
            gates."; ]
        "But you're not strong enough."
        "You'll need some serious concussive force."
        [;  if (Tower_Roof hasnt visited)
                print "You might not realise how to achieve that until you've
                    done a bit more exploring.^";
            else print "Remember what you saw on the tower roof?^"; ];

Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->   LabMenu "Laboratory"
    has concealed;

HintOption -> -> -> -> "What do I need to do in here?"
    with description "Not much. But there are some items of interest.";

HintOption -> -> -> -> "What are all these unknown substances?"
    with description
        "If you mix the right ones together properly, you can make something
            new."
        [;  if (Ninario in Study)
                print "If you show the substances to Ninario, he will identify
                    them for you.^";
            else print "If Ninario were still around, he could tell you what
                they were, but as he's gone, take a closer look at the names
                written on the substance containers.^"; ]
        "If you look at a periodic table, you should be able to figure out what
            the compounds are.";

HintOption -> -> -> -> "How do I make something new with these substances?"
    with description
        "If you mix the right ones together properly, a new substance can be
            formed."
        "Often when mixing compounds, you need to use a mortar and pestle to
            grind them up nicely."
        "Ninario doesn't have one. But perhaps he has something better."
        [;  if (Workshop hasnt visited)
                print "Perhaps you should explore a few more rooms first.^";
            else print "The ball mill in the workshop can be used to grind the
               substances together.^"; ];

HintOption -> -> -> -> "What do I need to make with these substances?"
    with description
        "There's something very specific you need to make."
        [;  if (Tower_Roof hasnt visited)
                print "You might not realise what it is until you've done a bit
                    more exploring.^";
            else print "It's got something to do with the tower roof.^"; ]
        [;  if (Tower_Roof hasnt visited)
                print "It's got something to do with the tower roof, a";
            else print "A"; print "nd the doors of the caer.^"; ]
        "Have you tried firing the cannon?"
        "It has no black powder in it. You'll have to create some."
        "If you're unsure of the ingredients, Ninario can tell you how."
        [;  if (TestScope(notebook))
                print "If he's gone, don't fret; you've also got an item that
                    tells you how to make black powder.^";
            else
                print "There's another item in the game that tells you how to
                make black powder; you were carrying it when the game began.^"; ]
        "Try reading your exercise book."
        "If you still can't figure it out, the next few hints will tell you
            what you need to know to make black powder."
        "The yellow powder is sulphur."
        "The white powdery substance is saltpetre or potassium nitrate (KNO3)."
        "The black grainy substance is charcoal."
        "If you mix all these together, you'll get black powder."
        "See the workshop hints for more information.";
        
HintOption -> -> -> -> "What is this silvery-white cylinder?"
    with description
        "It's a #12 Illuminator, Commercial Grade."
        "Would it help if you knew that element #12 on the periodic table is
            magnesium?"
        "And that magnesium burns with an intense white flame?"
        "The cylinder is really a commercial grade magnesium flare; in other
            words, a light source."
        "You can turn it on by shaking it, twisting it, opening it, breaking it
            or turning it.";

HintOption -> -> -> -> "What is wood hastener?"
    with description
        "It's used for hastening the growth of wood. Try it on a few things,
            wooden and otherwise."
        [;  if (End_Lane hasnt visited)
                print "You should do more exploring outside of the caer before
                    reading further.^";
            else print "You've seen a few things made of wood, both animate and
                inanimate.^"; ]
        "Try using it on anything wooden that you'd like to see grow a bit more
            quickly."
        [;  if (End_Lane hasnt visited)
                print "You should do more exploring outside of the caer before
                    trying to figure this one out.^";
            else print "You saw a tree somewhere outside the caer. Why don't you
                head back there?^"; ];

Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> ->   TowerMenu "Tower"
    has concealed;

HintOption -> -> -> -> "What should I do with this cannon?"
    with description
        "Have you found any really big obstacles in your journey onward? Is
            your progress blocked anywhere?"
        "The cannon is the key to the way out of the caer."
        "Notice that the swivel base allows it to be aimed at a variety of
            targets."
        "AIM CANNON AT DOORS";
        
HintOption -> -> -> -> "How do I fire the cannon?"
    with description
        "Have you examined it?"
        "Have you read the plaque?"
        "PULL CORD"
        "It isn't loaded; see the hints about loading the cannon.";

HintOption -> -> -> -> "How do I load the cannon?"
    with description
        "Have you examined it?"
        "Have you read the plaque?"
        "It needs to be loaded with powder bag and shot."
        [;  if (TestScope(Blackpowder))
                print "If you try to put the black powder directly into the
                    cannon, it will just get all over.^";
                else print "Ninario seems to have run out of black powder. See
                    the workshop or laboratory hints to find out how to get
                    some more.^"; ]
        "As the plaque on the cannon says, you'll also need a powder bag of
                some sort."
        "Have you seen anything suitable?"
        [;  if (Bedroom hasnt visited)
                print "You might not realise how to achieve that until you've
                    done a bit more exploring.^";
            else {
                if (Pillow hasnt moved)
                    print "You saw something in the bedroom that would work.^";
                else print "You picked up something in the bedroom that might
                    work.^"; } ]
        "In fact, if you show the item to Ninario a couple of times, he'll even
            suggest it himself."
        "If you empty the stuffing out of the pillow it will work well as a
            powder bag."
        "Or, you've already found a couple of bags suitable for holding various
            substances."
        "The leather pouch and the silk purse will work equally well."
        "Of course, you also need some ammunition."
        "There are a couple of items you could use. The first one is in
            Ninario's workshop."
        "The second item you're guaranteed to have with you, of course."
        "You can either use the cannonball from the blast furnace in the
            workshop, or, if you're feeling brave, you can fire yourself out of
            the cannon.";

Option -> -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> FarmMenu "At the Farm"
    has concealed;

HintOption -> -> -> "What do I need to do at the farm?"
    with description
        "There's an item that will help you solve a later puzzle."
        "However, it's not essential to get into the farmyard, as that later
            puzzle has an alternate solution."
        "As long as you're willing to jump to it...";

HintOption -> -> -> "How do I get into the farmyard?"
    with description
        "The gate has been magically sealed by the Wizards Guild to prevent
            anyone going in there and seeing evidence of the dangerous,
            unsanitary and illicit practices that were carried out."
        "Of course, the gate's not the only way in."
        "If you head east down the lane, you'll notice the tall fence."
        "It's too tall to be climbed, but that tree looks pretty convenient,
            and there's a long springy limb extending over the fence."
        "CLIMB TREE, then GET ON BRANCH"
        "Hmmm... it's too springy. Perhaps you need to make the branch stronger
            somehow."
        [;  print "You could wait around for it to grow a bit, but that would
            take quite a few years.^";
            give TreeGrowthHint ~concealed; ]
        "See the hint about getting the tree to grow faster.";

HintOption -> -> -> TreeGrowthHint "How do I make the tree grow faster?"
    with description
        [; if (Hastener hasnt moved)
                print "You might not realise how to achieve that until you've
                    found some more items.^";
                else print "You found something in the laboratory that might
                    hasten the growth of trees.^"; ]
        [;  give BranchHint ~concealed;
            print "SPREAD WOOD HASTENER ON TREE^"; ],
    has concealed;

HintOption -> -> -> BranchHint "I've made the tree bigger. Now how do I get
        into the farmyard?"
    with description
        "Did you climb the tree and then GET ON BRANCH?"
        "Ouch! That rapid growth must have really taken it out of that branch."
        "But did you notice that the tree is now big enough that you can climb
            farther up it?"
        "CLIMB TREE"
        "Ouch! The hawk doesn't take kindly to that, however."
        [;  if (Goggles hasnt moved)
                print "You might want to explore Ninario's caer a bit more
                    fully, and find something to cover your eyes.^";
            else print "You found something in Ninario's workshop that might
                help protect your eyes.^"; ]
        "WEAR GOGGLES, then CLIMB TREE"
        "Ouch! Now the hawk has gone for other parts of your body."
        "Your clothing obviously isn't enough protection, Have you seen
            anything else that might protect you?"
        "There's something in Ninario's study."
        "He wouldn't let you near it before, but if he's gone, you might be
            able to take it."
        "In Ninario's study, TAKE RUG and then try wearing it."
        "Now you can climb to the very top of the tree. It's very precarious up
            there!"
        "But you're simply not heavy enough to make the tree bend down low
            enough to the fence."
        "But what if you carried something extremely heavy?"
        "Something very heavy can be found in Ninario's workshop."
        "The cast-iron cannonball from the blast furnace would certainly work,
            but you can't climb the tree while you're carrying it."
        "You need a way to get up into the tree with the cannonball, without
            its weight affecting you."
        "You have an item that weighs the same, no matter what you put into it."
        "PUT CANNONBALL IN SATCHEL"
        "Now once you're at the top of the tree, REMOVE CANNONBALL FROM SATCHEL"
        "Of course, if you're holding the satchel, you won't be able to take
            the cannonball out."
        "But if you drop the satchel, it will fall all the way down to the
            ground."
        "And the branches are too flimsy for you to put the satchel on them
            while you remove the cannonball."
        "You need to free up your hands."
        "Have you examined the satchel?"
        "It's got a nice sturdy strap."
        "WEAR SATCHEL and then REMOVE CANNONBALL FROM SATCHEL"
        "Ouch! That fence is extremely dangerous. You'll have to protect your
            head somehow."
        "Have you found anything to wear on your head?"
        "WEAR HELMET or WEAR CHAMBERPOT before removing the cannonball from the
            satchel.",
    has concealed;

HintOption -> -> -> "How do I get rid of the dogs?"
    with description
        "Rather large and ferocious, aren't they?"
        "If you try attacking them, they'll just leap on you all the sooner."
        "There's a way to frighten them into thinking you're more dangerous
            than you really are."
        "It's the same method you used to keep the hawk from pecking at your
            body."
        "Before you descend in the tree, or after your land in the yard,
            WEAR BEARSKIN RUG";
        
HintOption -> -> -> "What is this arktos essence stuff?"
    with description
        "It's a very useful compound."
        [; print "Do you know what the word ", (i) "arktos", " means?^"; ]
        [; print "It's the root of the name ", (i) "Arthur", " or ",
            (i) "Artos", ".^"; ]
        "There's something in the rubble area that might give you some clues."
        "Arktos is a Greek word. The Latin for the word is ursine."
        "Arktos means bear.";
        
HintOption -> -> -> "What does this scrap of paper really say?"
    with description
        "It's a portion of a letter someone at the farm was writing to some
            friends, thanking them for a gift."
        "The gift was an animal repellant kit, to combat the marauding beasts
            mangling their crops and attacking their farm animals."
        "It sounds like everything worked perfectly, except the arktos essence.
            It had the opposite effect to that desired."
        "Which is to say it attracted the beasts it was meant to drive away."
        "See the hint about the arktos essence if you want to know what kind of
            beast..."
        "The full text of the scrap of paper is in the next hint."
        "The full text of the message is:^
        ^Thank you for the animal repellant kit. Everything worked perfectly to
        keep the marauders away, except for the arktos essence: quite the
        opposite! We decided not to use it, as it kept attracting bears to
        the farm. In the end, the dogs are just as effective to use, as
        they give us advance warning...";

Option -> -> -> "Go Back" with description [; return 3; ];

Menu    ->  -> VechleeMenu "In the town of Vechlee"
    has concealed;

HintOption -> -> -> "What do I do at Wizardry Wooding?"
    with description
        "You can talk to Betty, the friendly neighbourhood shopkeeper, ask
            some questions, or even buy some wood."
        "But in fact, you really don't have to do anything here. It's just
            another example of what the Wizards Guild are doing to industry in
            Vechlee.";

HintOption -> -> -> "What do I do at William's Woodcraft?"
    with description
        "There's one familiar item in there you'll probably need."
        "Apart from that, it's another sad reminder of what the Wizards Guild
            is doing to this town."
        "In fact, the notice on the door can provide more information than it
            may seem at first glance."
        "Read the last word of each line in order, and you'll discover a last
            message from William explaining the real reason behind his closure
            of the shop.";

HintOption -> -> -> WizstripHint "How do I open this second bottle of WizStrip?"
    with description
        [; "It seems to be ", (i) "hermetically", " sealed."; ]
        "You'll have to find someone who understands that sort of thing."
        "If you read your lecture notes, you'll find a hint about the origins
            of the hermetic seal."
        "There's a particular type of person who could probably help you..."
        "And if you poke around the market square, you may find a hint about
            just where you'd find the sort of person who might know how to help
            you.",
    has concealed;

Menu    -> -> -> CheeseMenu  "Eliza's Cheese Emporium"
    has concealed;

HintOption -> -> -> -> "What happened in here?"
    with description
        "Did you read the sign outside the shop?"
        "It seems Eliza broke a few rules, and her shop's been closed down."
        "If you ask some of the passersby, they might tell you a bit more.";
        
HintOption -> -> -> -> "What's with all the cheese?"
    with description
        [; "Well, it ", (i) "is", " a cheese shop."; ]
        "The Wizards Guild will doubtless be coming back to clear it out. In
            the meantime however, the cheese can be licked, tasted, smelled or
            eaten."
        "If you've read your exercise book, specifically, your philosophy
            notes, you'll know there's something else you can do with it too."
        [;  if (Sorcery_Supply hasnt visited)
                print "You'd best explore the town a bit more first.^";
            else {
                if (Scrying_Bowl.bought == false)
                    print "You saw";
                else print "You bought";
                print " something you could use with the cheese at Sorcery
                    Supply.^"; } ]
        "The scrying bowl is not just any ordinary scrying bowl. In fact, it's
            specifically designed for tyromancy, or using coagulating cheese
            for divination."
        "Drop some cheese in it, and see what happens.";

HintOption -> -> -> -> "Do I have to do anything with the cheese?"
    with description
        "Using the cheese is not necessary to finish the game, unless you're
            trying for maximum points."
        "However, it can provide very useful hints, as well as glimpses of the
            past and future.";
Option -> -> -> -> "Go Back" with description [; return 3; ];

HintOption -> -> -> Market1 "What on earth is a building society?"
    with description
        "A building society is really just the British version of a savings
            and loan. In other words, it's a bank.",
    has concealed;
        
HintOption -> -> -> Market2 "Is the building society important?"
    with description
        "It was a very important part of everyday Vechlee life, a social
            centre."
        "But that's probably not what you mean; it's important in that it
            contains a useful item, but apart from that, don't worry about it.",
    has concealed;
        
HintOption -> -> -> Market3 "How do I get into the Wizards Guild Savings and
        Loan?"
    with description
        "You don't need to worry about getting into the Savings and Loan.",
    has concealed;
        
HintOption -> -> -> Market4 "What do I need to do at Sorcery Supply?"
    with description
        "You can chat away with the old crone if you like."
        "Apart from that, there's an item of interest available for purchase.",
    has concealed;
        
HintOption -> -> -> SS1 "I can't afford the silver bowl!"
    with description
        "If you don't have any money, you'd best find some."
        "Where would you normally expect to find money?"
        [;  if (Soldiers.Reason == 3)
                print "You gave your 10 plotkin piece to the guard at the
                    entrance to the guild hall? Oh dear. In that case, don't
                    worry about it. Buying the silver bowl is not essential to
                    finishing the game.^";
            else print "Try the Vechlee Townsfolk Building Society.^"; ],
    has concealed;
        
HintOption -> -> -> SS2 "What's the silver bowl for?"
    with description
        "As the old crone can tell you, it's a bowl of scrying."
        "But the important question is, what do you put in it?"
        "You could try a bunch of different things and see what happens."
        "You could ask the old crone about divination, and see what she says."
        [;  if (Cheese_Shop hasnt visited)
                print "Or you could explore Vechlee a bit more thoroughly and
                    see if anything new turns up.^";
                else print "You've visited one spot and seen the items that
                    will unlock the secrets of the scrying bowl.^"; ]
        "Try heading back to the Vechlee Gate area again.",
    has concealed;
        
HintOption -> -> -> SS3 "I can't afford the items in the trophy case!"
    with description
        "All very expensive, aren't they?"
        "If you ask the old crone about the trophy case, she tells you someone
            else has already expressed interest in the items."
        "Unless you can find more than the 10 plotkin piece in the Building
            Society, you'll just have to look and drool."
        "The 10 plotkin piece is the most valuable coin in the whole game.
            Don't worry about the items in the trophy case.",
    has concealed;

HintOption -> -> -> SS4 "I can't open the trophy case!"
    with description
        "That's because it's locked; if anyone could just open it, the old
            crone wouldn't stay in business long."
        "Perhaps you're simply not meant to have these items.",
    has concealed;
        
HintOption -> -> -> Out1 "I can't understand the guard!"
    with description
        "He's speaking in a dialect similar to what was spoken in the North and
            East ridings of Yorkshire in the late 1800s."
        "Most of the phrases were taken from a book written on the subject in
            1892 by the Reverend M.C.F. Morris."
        "It differs somewhat from the more modern Yorkshire folk dialect, but
            you should be able to glean enough meaning from most of what the
            guard says in order to continue on in the game.",
    has concealed;
        
HintOption -> -> -> Out2 "How can I get the guard to let me in?"
    with description
        "Have you tried listening to him for a little while?"
        "There are three different ways to get past the guard. All involve
            giving him something."
        "His chatter may provide you with hints about what you should try
            giving him."
        "He complains about not having a lot of money."
        [;  print "You could pay him off with the 10 plotkin piece";
            if (Scrying_Bowl.bought == true)
                print " or with the 5 plotkin piece you received when you
                    bought the bowl";
            print ".^"; ]
        "But the best way is to give him something even more valuable, so he
            can sell it to help support his wife and children."
        "The one word the guard keeps mentioning in reference to his recruits
            might give you a clue."
        [;  print "It's an item you";
            if (TestScope(Hand_Drill))
                print "'ve got with you.^";
                else print " saw in Ninario's workshop.^"; ]
        "Giving the drill to the guard is the best way to get rid of him; it
            will also makes the eventual end-game a little bit easier by buying
            you more time.",
    has concealed;
        
HintOption -> -> -> FoyerHint "How can I get up the stairs in the Guild Hall?"
    with description
        "The guards won't let you up, no matter how hard you try."
        "You'll have to find a way to distract them."
        "Try fiddling with everything on the ground floor of the guild hall,
            and see if anything occurs to you.",
    has concealed;

HintOption -> -> -> ClosetHint "What do I do with the valve and the vent?"
    with description
        "Have you tried opening the valve?"
        "When you do, poisonous methane gas starts filling the room. That's not
            good."
        "Some of it will undoubtedly leak up into the first floor via the air
            intake vent, but not quickly enough to have an effect, and
            certainly not before the ground floor becomes saturated and unsafe."
        "But there is a way to funnel all the gas directly into the air intake
            vent."
        [;  if (TestScope(Hose))
                print "You're carrying an item that would help.^";
            else
                print "When you opened the portcullis in Ninario's caer, you
                    saw an item that might help.^"; ]
        "PUT HOSE ON NOZZLE and then PUT HOSE IN VENT. This will route the gas
            directly up to the first floor."
        "However, that's still not enough. The first floor is so big, just
            filling it with methane won't get you results fast enough."
        "You'll need to find a way to kick things off up there with a bang."
        "See some of the other hints for more information.",
    has concealed;

HintOption -> -> -> KitchenHint "What do I do with the dumb waiter?"
    with description
        "Whenever you close the door, the dumb waiter is hauled up to the
            first floor one turn later."
        "The dumb waiter can be very useful in transporting something up to the
            second floor for you."
        "However, if you start fiddling with the contents, such as removing the
            tray or getting rid of the meat or drink, the person upstairs gets
            annoyed and sends it back down."
        "You've got to send up something that looks just like the meat and
            drink he was expecting."
        [;  if (Stone_Bottle hasnt moved)
                print "You should explore Vechlee a bit more before
                    continuing.^";
                else
                    print "You found something in William's Woodcraft that
                        looks just like that stone bottle of ginger beer.^"; ]
        "Of course, just sending up the bottle of paint stripper won't work too
            well."
        "You've used a bottle of this WizStrip stuff before; what did it react
            well with?"
        "If you can find a way to inject some methane into the first floor, and
            then send up the bottle of WizStrip, you'll find it's an explosive
            combination."
        "Of course, if the bottle of WizStrip still has that waxy seal on it,
            that won't do anyone any good."
        "You'll have to find a way to break that seal first.",
    has concealed;

HintOption -> -> -> FirstHallHint "How do I get through this plain unfinished
    door?"
    with description
        "It's locked, and you don't have the key. Have you examined it?"
        "It's very green, fresh wood. If you knock on it, Ninario also
            mentions that it seems impervious to magic."
        "You'll have to find some way of affecting the door that the Wizards
            Guild didn't anticipate."
        "It's very green wood; in other words, it's only recently off the tree.
            In fact, it probably hasn't finished growing."
        [;  if (TestScope(Hastener))
                print "You've got something";
                else print "There's an item";
            print " that can be used to speed up the growth of wood.^"; ]
        "SMEAR WOOD HASTENER ON DOOR",
    has concealed;

HintOption -> -> -> EscapeHint "How can Ninario and I get out of here?"
    with description
        "You'll have to find a way to escape before the soldiers arrive and
            capture both of you."
        "You can't head back down the stairs, but there are two other ways to
            get out of the building."
        [;  if (Red_Carpet has general)
                print "Because you've already used the flying carpet, that
                    rules out that option.^";
                else print "If you've got the flying carpet with you, you and
                    Ninario can use it to escape.^"; ]
        "The other possibility is pretty disgusting."
        "Did you know you can fit down the toilet hole?"
        "Of course, Ninario can't follow you. He's just a bit too rotund."
        [;  if (TestScope(Margarine) || TestScope(Butter))
                print "You've got an item that can help Ninario fit into the
                    toilet hole.^";
            else print "There was an item in the kitchen that would have
                helped.^"; ]
        "Give the butter or the margarine to Ninario.",
    has concealed;

Option -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> MountMenu "The Mountain"
    has concealed;

HintOption -> -> -> "How do I get past the bear?"
    with description
        "Walking past it doesn't work."
        "Offering it things doesn't work."
        "You need to convince it you're a friend."
        "It will never trust a human as a friend."
        "You'll need to look like a friend."
        "What could you wear that would make a bear think you were a friend?"
        "It's something in Ninario's tower. Ninario wouldn't let you near it
            before, but if he's gone, you might be able to take it."
        "Take the bearskin rug from Ninario's study and try wearing it."
        "The bear still doesn't like you! But why? You look like a bear."
        "Do you smell like one?"
        "Or just like a mouldy old rug?"
        [;  if (Arktos has moved)
                print "You found something in the farm that might help you.^";
            else print "You haven't yet found the necessary item, however, so
                you might want to stop reading and explore some more.^"; ]
        [; "Perhaps if you knew that the Greek word for ", (i) "bear", " is ",
        (i) "arktos", "."; ]
        "SPREAD ARKTOS ESSENCE ON RUG or SPREAD ARKTOS ESSENCE ON ME"
        "Now the bear loves you, but it plays a little too rough. Do you have
            any way to protect your head?"
        [;  if (Helmet has concealed)
                print "You need to search Ninario's basement more thoroughly.^";
                else print "You found something in Ninario's basement that
                    would help.^"; ]
        "WEAR HELMET"
        "Now the bear will let you past. Of course, rather than bothering with
            all this you could just have typed JUMP OFF CLIFF";

HintOption -> -> -> StuckHint "I can't get back down the mountain!"
    with description
        "You must have jumped off the cliff right from the start instead of
            placating the bear."
        "But never fear, there's another way to get down the mountain. It
            involves the item you received after jumping off the cliff."
        "SIT ON CARPET",
    has concealed;
        
HintOption -> -> -> Hermit1 "What do I need to do with the hermit?"
    with description
        [;  if (Stone_Bottle hasnt moved)
                print "Perhaps you should explore a bit more before asking
                    that.^";
                else
                    print "You found something in Vechlee he could help you
                        with.^"; ]
        "Have you tried opening that second bottle of WizStrip you found?"
        [; "It seems to be ", (i) "hermetically", " sealed."; ]
        "Of course, the hermit won't help you just out of the goodness of his
            heart; he's feeling a bit ungrateful toward the world in general."
        "Perhaps if you did something for him, he'd be more inclined to help
            you.",
    has concealed;
        
HintOption -> -> -> Hermit2 "How do I get the hermit to help me?"
    with description
        "Have you tried asking him to do what you want?"
        "If he doesn't seem agreeable, perhaps you need to do something for
            him."
        "In fact, there are two things you can do for the hermit."
        "Try examining him and his surroundings, listening to him for a bit,
            or talking to him. Is there anything he lacks?"
        "The hermit's eyes are sorely bothered by the sun. And his rock looks
            none too comfortable as well. You could help him with either of
            those."
        "GIVE GOGGLES TO HERMIT or, as long as the stuffing is still inside it,
            GIVE PILLOW TO HERMIT",
    has concealed;

Option -> -> -> "Go Back" with description [; return 3; ];

Menu    -> -> "General Questions";
HintOption -> -> -> "Who am I?"
    with description
        "You are a Classics student just entering your third year of studies.
            The students and fellows at Worrell College accept you, even though
            you only joined the college this year.^
        ^This term, you are signed up to take the Celtic Elements course as well
        as chemistry and philosophy. A light course load but you're nearing the
        end of your degree and picking up a few electives.";
Option -> -> -> "Go Back" with description [; return 3; ];
#endif;

LineGap    -> ->;
Option -> -> "How the Points are Scored"
    with description [; Points_Scored_in_Main.description(); ];

Option -> -> Amusement "For your Amusement and Edification"
    with    description [;
                Amusement_in_Main.description();
            ];

LineGap    -> ->;
Option -> -> "Go Back" with description [; return 3; ];

Option  Walkthrough_in_Main "Walkthrough" HelpMenu
    with    description [;
                if (self has locked)
                    print "[Consultation of the walkthrough has been disabled]^";
                else if (self hasnt general) {
                    give self general;
                    print "The walkthrough contains the optimum solution for
                        the game, and might spoil things for you. ";
                    if (self.typed == true) {
                        print "Are you really sure you want to see it and spoil
                            everything for yourself?^";
                        YesNo.Ask(self.YesWalk,self.NoWalk,0);
                    }
                    else
                        print "If you're really sure you want to see it, select
                            this menu item again.^";
                    rtrue;
                }
                else {
                    print "For a text file version of this walkthrough, which
                        can be input into the game using ~replay~, please
                        visit:^
                        http://www.mts.net/@@126coyne/risorg.rec^";
                    font off; print
                    "^get cup^
                    l under desk^
                    n^
                    tidy room^
                    get all^
                    e^
                    !press any key to continue^
                    ^
                    ask ninario about spectacles^
                    w^
                    n^
                    n^
                    w^
                    get pillow^
                    ! l under bed to find chamberpot^
                    l under bed^
                    e^
                    s^
                    u^
                    x cannon^
                    d^
                    s^
                    e^
                    ask ninario about cannon^
                    ask ninario about gunpowder^
                    w^
                    n^
                    d^
                    s^
                    get all^
                    n^
                    x rod^
                    twist rod^
                    d^
                    s^";
                    print
                    "! x pile to find helmet^
                    x pile^
                    n^
                    n^
                    ! x gas to get idea that the sewer is full of methane^
                    x gas^
                    s^
                    u^
                    u^
                    ! x bottle, see that it says ~do not mix with methane~^
                    x bottle^
                    n^
                    e^
                    ! pour wizstrip into the toilet so it ends up in the sewer^
                    ! room. Carrying open bottle directly into sewer room will^
                    ! NOT work. Try it if you like.^
                    pour wizstrip in hole^
                    w^
                    s^
                    d^
                    d^
                    n^
                    enter vat^
                    ! Ninario's spectacles are sitting in the vat^
                    get spectacles^
                    exit^
                    x specs^
                    clean specs^
                    s^
                    u^
                    u^
                    s^
                    e^
                    give specs to ninario^
                    ninario, close rift^
                    ! press any key to continue^
                    ! something falls from Ninario's robes when he's pulled
                    through the portal^
                    x something^
                    get key^
                    get rug^
                    put all in satchel^
                    wear satchel^
                    w^
                    n^
                    d^
                    nw^";
                    print
                    "get all^
                    put all in satchel^
                    open furnace^
                    get cannonball^
                    put it in satchel^
                    open mill^
                    ! empty saltpetre, sulphur and charcoal into ball mill^
                    empty purse in mill^
                    empty pouch in mill^
                    empty flask in mill^
                    turn mill^
                    open mill^
                    get blackpowder^
                    empty pillow^
                    ! put blackpowder into the pillow, pouch or purse to use as
                    a powder bag^
                    put blackpowder in pillow^
                    se^
                    ne^
                    get butter^
                    sw^
                    w^
                    se^
                    ! x lock on shed to see that it's all rusted^
                    x lock^
                    pour acid on lock^
                    s^
                    get can^
                    n^
                    nw^
                    ! need 4 pints of water for the portcullis machine^
                    fill can^
                    pour can into pot^
                    empty pot^
                    pour can into pot^
                    fill can^
                    pour can into pot^
                    u^
                    w^
                    empty can into funnel^
                    ! when the portcullis opened, a hose sprang free from the
                    machine^
                    get hose^
                    e^
                    d^
                    e^
                    u^
                    u^
                    wear helmet^
                    smear butter on me^
                    get pillow^
                    put pillow in cannon^
                    ! grab the cord, so we can pull it from inside the cannon^
                    get cord^
                    aim cannon at doors^
                    enter cannon^
                    pull cord^
                    ! look ne and sw along the long road to see what looks more
                    interesting^
                    look ne^
                    look sw^
                    ne^
                    x sign^
                    e^
                    smear hastener on tree^
                    ! wear rug and goggles to protect us from hawk^
                    wear rug^
                    wear goggles^
                    u^
                    u^
                    put all in satchel^
                    ! fall into yard by taking cannonball out of satchel and
                    making us heavier^
                    get cannonball^
                    ! remove rug and goggles to stop annoying ~with the rug
                    on...~ messages every^
                    ! time we move^
                    remove rug^
                    remove goggles^
                    put rug and goggles in satchel^
                    w^
                    n^
                    ! read scrap of paper to get hint about what arktos essence
                    does^
                    read scrap^
                    s^
                    w^
                    open cabinet^
                    get jar^
                    e^
                    ! exit via farm gate to break spell and earn single point^
                    s^
                    sw^
                    sw^
                    n^
                    w^
                    ! x second bottle of Wizstrip, this one with a hermetic
                    seal^
                    x bottle^
                    get it^
                    e^
                    s^
                    sw^
                    ! read paper to see that a former merchant has moved to a
                    mountaintop and become^
                    ! a hermit^
                    read paper^
                    n^
                    get coin^
                    x it^
                    s^";
                    print
                    "nw^
                    buy silver bowl^
                    se^
                    ne^
                    s^
                    get asiago^
                    ! use any cheese in the bowl to get single point
                    put it in bowl^
                    n^
                    sw^
                    sw^
                    w^
                    n^
                    ! smear arktos essence on rug and then wear rug to get past
                    bear^
                    smear jar on rug^
                    wear rug^
                    n^
                    get carpet^
                    e^
                    ! x hermit, note the darkly tanned and weathered skin and
                    tears streaming from^
                    ! his eyes^
                    x hermit^
                    ask hermit about tears^
                    give goggles to hermit^
                    show bottle to hermit^
                    w^
                    s^
                    s^
                    remove rug^
                    put it in satchel^
                    e^
                    guard, hi^
                    ! talking to Ned gives valuable information about what he
                    wants or needs^
                    ask guard about himself^
                    ask guard about meagre pay^
                    ask guard about science^
                    show drill to guard^
                    give drill to guard^
                    s^
                    e^
                    x pipe^
                    attach hose to valve^
                    put hose in vent^
                    open valve^
                    w^
                    s^
                    ! x ginger beer, note that the bottle looks the same as the
                    Wizstrip bottle^
                    x beer^
                    get beer^
                    get margarine^
                    put wizstrip on tray^
                    close door^
                    z^
                    n^
                    u^
                    ! smear wood hastener on the green wood of the door to make
                    it grow and burst^
                    ! out of the doorframe^
                    smear hastener on door^
                    say hi to ninario^
                    w^
                    ! try entering the toilet hole, Ninario can't follow^
                    d^
                    give margarine to ninario^
                    ! with Ninario all slicked up, head down again, and enjoy
                    the end of the game!^
                    d^";
                    font on;
                }
                rtrue; ],
            typed false,
            YesWalk [;
                Walkthrough_in_Main.description();
                rtrue; ],
            NoWalk [;
                give Walkthrough_in_Main ~general;
                "A bold gesture!"; ];

!Separator " " HelpMenu;
LineGap    LaterGap HelpMenu;

Option "Return to game" HelpMenu with description [; return 3; ];

Option  Hintlock "Hints disabled"
    with    description "Hints have been disabled.";

[ AboutSub;
    AboutMenu.select();
];

[ CreditsSub;
    Credits.description();
];

[ HelpOffSub;
        print (string) HINTD__TX;
        give HintMenu locked;
        move Hintlock to HintMenu;
        rtrue;
        ];

[ HelpSub;
    if (HintMenu has concealed) {
        print (string) HINT_WARNING, "indicate HINT.]^";
        give HintMenu ~concealed;
        give Prehints concealed;
        rtrue;
    }
    if (HintMenu has locked)
        print_ret "Hints have been disabled.";
    HintMenu.select();
];
[ MainMenuSub;
    HelpMenu.select();
];

[ WalkthroughSub;
    Walkthrough_in_Main.typed = true;
    Walkthrough_in_Main.description();
    Walkthrough_in_Main.typed = false;
];

[ WalkthroughOffSub;
    give Walkthrough_in_Main locked;
];

[ WinGameSub;
    Soldiers.Reason = 4;
    print "In a sudden amazing burst of inspiration, you figure out absolutely
        everything you need to do, and complete it all in record time!^";
    HitKey();
    EndGame();
];

#ifdef NO_HOWTO_GRAMMAR;
Verb meta 'help' 'menu'
    *           ->MainMenu;
#endif;

#ifdef NO_GRAMMAR;
Verb meta 'Hint' 'hints' 'clues' 'clue'
    * 'off'     ->HelpOff
    *           ->Help;   
#endif;

Verb meta 'walkthrou' 'walkthru'
    * 'off'     ->WalkthroughOff
    *           ->Walkthrough;

Verb meta 'about'
    *               ->About
    * 'game'        ->About
    * 'the' 'game'  ->About;

Verb meta 'credit' 'credits'
    *               ->Credits;

Verb meta 'win'
    *               ->WinGame
    * 'now'         ->WinGame
    * 'the' 'game'  ->WinGame;
