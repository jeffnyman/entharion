# By default, just typing GMAKE will compile the target with debugging turned
# on.
# GMAKE REL will compile with debugging off
# GMAKE ABBREV will compile a release version and turn on abbreviations.  It
# also dumps out the compilation statistics.
#
# Things you might need to change to get it to work on your system:
# ROOTDIR if your Inform compiler isn't on your root drive.
# INFRMROOT to point to the root of your Inform installation
# TARGET to the name of your main executable
#
# I've also included a MAX_OBJECTS definition, mainly to illustrate how to
# properly pass $ commands to Inform through the makefile.
#
# All these flags are located near the beginning of the file to make them easy
# to change.

# Modify the line below (and uncomment it) if your Inform executable is not on
# your root drive
#ROOTDIR=D:

# Modify this line to point to your Inform directory
#INFRMROOT=$(ROOTDIR)\devl\inform
INFRMROOT=/usr/local/inform

# Change this to match the name of your main source file
TARGET=risorg

# Uncomment the line below if you have any custom .h files for your game and
# you want make to recompile the target if the .h files change
DEPS=$(TARGET).h risabbr.h

# Uncomment the line below if you want to compile to V8
#V8=1

# Change the line below if you need more than 640 objects (default)
# If you intend to leave it at 640, you can leave it commented out
FLAGS=\$$MAX_PROP_TABLE_SIZE=45000 \$$MAX_DICT_ENTRIES=2000

# Library and include directory settings
#LIBDIR=$(INFRMROOT)\Lib630
#CONTRIBDIR=$(LIBDIR)\Contrib
#INFRM=$(INFRMROOT)\Lib630\Infrmw32.exe
LIBDIR=$(INFRMROOT)/library
CONTRIBDIR=$(LIBDIR)/contrib
INFRM=$(LIBDIR)/inform

# see top of file for explanation of default settings
DBGFLAGS=-S -D $(FLAGS) \$$MAX_VERBS=200
RELFLAGS=-~S -~D -~X $(FLAGS)
GLULXFLAGS=-G
INFFLAGS=-v8
ABBREVFLAGS=$(RELFLAGS) -e -s
INCLUDE=+include_path=./,$(LIBDIR),$(CONTRIBDIR)
#RM=del /q
RM=rm -f

SRCS=$(TARGET).inf

$(TARGET) : $(SRCS) $(DEPS)
	$(INFRM) $(GLULXFLAGS) $(DBGFLAGS) $(INCLUDE) $(TARGET).inf
	$(INFRM) $(DBGFLAGS) $(INFFLAGS) $(INCLUDE) $(SRCS)

rel: release

release: $(TARGET).inf
	$(INFRM) $(RELFLAGS) $(INFFLAGS) $(INCLUDE) $(TARGET).inf
	$(INFRM) $(GLULXFLAGS) $(RELFLAGS) $(INCLUDE) $(TARGET).inf

abbrev: $(TARGET).inf
	$(INFRM) $(ABBREVFLAGS) $(INFFLAGS) $(INCLUDE) $(TARGET).inf
	$(INFRM) $(ABBREVFLAGS) $(GLULXFLAGS) $(INCLUDE) $(TARGET).inf

clean:
	-$(RM) $(TARGET).z5 $(TARGET).z8 $(TARGET).ulx
