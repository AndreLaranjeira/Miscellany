# Executable name.
EXE = executable

# Project paths.
INC_DIR = include
OBJ_DIR = src/obj
SRC_DIR = src

# File extensions.
INC_EXT = h
OBJ_EXT = o
SRC_EXT = c

# Compiler configuration.
COMP = gcc
CFLAGS = -Wall -g -I $(INC_DIR)
LIBS = -lm

# Project main.
MAIN = main

# Project modules.
MODULES =	# Add module names (shared by a source and header file pair) here.

# Makefile function definitions.
FULL_PATH = $(patsubst %,$(2)/%.$(3),$(1))

# Joining file names with their respective paths and extensions.
DEPS = $(call FULL_PATH,$(MODULES),$(INC_DIR),$(INC_EXT))
OBJ = $(call FULL_PATH,$(MODULES) $(MAIN),$(OBJ_DIR),$(OBJ_EXT))
# SRC = $(call FULL_PATH,$(MODULES) $(MAIN),$(SRC_DIR),$(SRC_EXT))

# Project executable compilation rule.
$(EXE): $(OBJ)
	$(COMP) -o $@ $^ $(CFLAGS) $(LIBS)

# Object files compilation rule.
$(OBJ_DIR)/%.$(OBJ_EXT): $(SRC_DIR)/%.$(SRC_EXT) $(DEPS)
	@if [ ! -d $(OBJ_DIR) ]; then mkdir $(OBJ_DIR); fi
	$(COMP) -c -o $@ $< $(CFLAGS)

# List of aditional makefile commands.
.PHONY: all
.PHONY: clean

# Generate all available targets.
all: $(EXE)

# Command to clean object files and project executable.
clean:
	@rm -f $(OBJ_DIR)/*.o *~ core
	@if [ -f $(EXE) ]; then \
		rm -i $(EXE); \
	fi
