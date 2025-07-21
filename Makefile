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
	echo "Ran all"


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











# # Find all Java source files in the project
# SOURCES := $(shell find src -name "*.java")
#
# # JavaFX paths (change path to locally stored location of javafx lib)
# JAVAFX_SDK := ./javafx-sdk-23.0.2/lib
# MODULES := javafx.controls,javafx.fxml
#
# # JavaFX module path setup
# MODULE_PATH := --module-path $(JAVAFX_SDK) --add-modules $(MODULES)
#
# all: run-Neko
# 	echo "Run all"
#
# run-Neko: compile
# 	java -cp bin main.java.Neko
#
# # Compile all Java sources into bin
# compile: clean
# 	javac -d bin -sourcepath src $(SOURCES)
#
# # Clean all compiled files
# clean:
# 	rm -rf bin/*
