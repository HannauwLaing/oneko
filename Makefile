# Variables
SRC = src/main/java
RES = src/main/resources
BIN = bin
MAIN = NekoMain

# Find all .java files in the source directory

SOURCES := $(wildcard $(SRC)/*.java)
CLASSES := $(SOURCES:$(SRC)/%.java=$(BIN)/%.class)
RESOURCES := $(RES)

# Default target
all: run

# Run the program
run:
	java -cp $(BIN) $(MAIN)

# Compile .java to .class files in bin/
compile:  $(CLASSES)
$(BIN)/%.class: $(SRC)/%.java
	mkdir -p $(BIN)
	javac -d $(BIN) $(SOURCES)
	cp -r $(RESOURCES)/* $(BIN)/


# Clean up compiled classes
clean:
	rm -rf $(BIN)/*

run-disown:
	$(MAKE) -C ~/path/to/oneko run 0<&- >/dev/null 2>&1 & disown


purge:
	@pkill -f "^java -cp bin NekoMain$$"; echo "Cats have been purged"







