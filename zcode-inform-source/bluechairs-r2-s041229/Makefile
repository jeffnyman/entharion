INFORM_INCLUDE = /usr/local/lib/inform/
SOURCES = abbrevs.inf bluechairs.inf cubicle.inf party.inf driving.inf inaugural.inf gas-station.inf work.inf beatrice.inf epilogue.inf
MAIN = bluechairs.inf
GAMEFILE = bluechairs

debug: $(SOURCES)
	inform -E1 -Dv8 +./,$(INFORM_INCLUDE) $(MAIN) ../$(GAMEFILE)debug.z8

nowarns: $(SOURCES)
	inform -E1 -Dwv8 +./,$(INFORM_INCLUDE) $(MAIN) ../$(GAMEFILE)debug.z8 '$$MAX_PROP_TABLE_SIZE=20000'
 
proof: $(SOURCES)
	inform -rwv8 +./,$(INFORM_INCLUDE) $(MAIN) ../$(GAMEFILE)debug.z8

abbrevs: $(SOURCES)
	inform -uwv8 +./,$(INFORM_INCLUDE) $(MAIN)

release: $(SOURCES)
	inform -E1 -~S -eswv5 +./,$(INFORM_INCLUDE) $(MAIN) ../$(GAMEFILE).z5
