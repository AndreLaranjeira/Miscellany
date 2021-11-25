# Executable name:
EXE = executable

# Compiler configuration:
COMP = gcc
CFLAGS = -Wall -g -I $(IDIR)
LIBS = -lm

# Project paths:
IDIR = include
ODIR = src/obj
SDIR = src

# File extensions:
IEXT = h
OEXT = o
SEXT = c

# Project main:
MAIN = main

# Project modules:
MODULES =	# Add module names (shared by a source and header file pair) here.

# Makefile function definitions:
FULL_PATH = $(patsubst %,$(2)/%.$(3),$(1))

# Joining file names with their respective paths and extensions:
DEPS = $(call FULL_PATH,$(MODULES),$(IDIR),$(IEXT))
OBJ = $(call FULL_PATH,$(MODULES) $(MAIN),$(ODIR),$(OEXT))
# SRC = $(call FULL_PATH,$(MODULES) $(MAIN),$(SDIR),$(SEXT))

# Project executable compilation rule:
$(EXE): $(OBJ)
	$(COMP) -o $@ $^ $(CFLAGS) $(LIBS)

# Object files compilation rule:
$(ODIR)/%.$(OEXT): $(SDIR)/%.$(SEXT) $(DEPS)
	@if [ ! -d $(ODIR) ]; then mkdir $(ODIR); fi
	$(COMP) -c -o $@ $< $(CFLAGS)

# List of aditional makefile commands:
.PHONY: all
.PHONY: clean

# Generate all available targets:
all: $(EXE)

# Command to clean object files and project executable:
clean:
	@rm -f $(ODIR)/*.o *~ core
	@if [ -f $(EXE) ]; then \
		rm -i $(EXE); \
	fi