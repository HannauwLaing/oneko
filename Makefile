# Variables
SRC = src/main/java
RES = src/main/resources
BIN = bin
MAIN = NekoMain
PKGROOT = pkg/oneko
PKGNAME = oneko
PKGVERSION = 2.0.2
PKGARCH = all
PKGSECTION = games
PKGPRIORITY = optional
PKGDEPENDS = default-jre
PKGMAINTAINER = Hannauw Laing
PKGDESCRIPTION = Desktop cat that moves around the screen

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


install-with-deb: deb
	sudo apt install ./pkg/oneko.deb

deb: clean compile
	rm -rf pkg
	mkdir -p $(PKGROOT)/DEBIAN
	mkdir -p $(PKGROOT)/usr/share/$(PKGNAME)
	mkdir -p $(PKGROOT)/usr/bin
	mkdir -p $(PKGROOT)/usr/share/applications
	cp -r $(BIN) $(PKGROOT)/usr/share/$(PKGNAME)/
	printf '%s\n' \
		'Package: $(PKGNAME)' \
		'Version: $(PKGVERSION)' \
		'Section: $(PKGSECTION)' \
		'Priority: $(PKGPRIORITY)' \
		'Architecture: $(PKGARCH)' \
		'Depends: $(PKGDEPENDS)' \
		'Maintainer: $(PKGMAINTAINER)' \
		'Description: $(PKGDESCRIPTION)' \
		' A Java desktop pet based on oneko.' \
		> $(PKGROOT)/DEBIAN/control
	printf '%s\n' \
		'#!/bin/sh' \
		'exec java -cp /usr/share/$(PKGNAME)/bin $(MAIN)' \
		> $(PKGROOT)/usr/bin/$(PKGNAME)
	chmod 755 $(PKGROOT)/usr/bin/$(PKGNAME)
	printf '%s\n' \
		'[Desktop Entry]' \
		'Name=$(PKGNAME)' \
		'Exec=$(PKGNAME)' \
		'Type=Application' \
		'Terminal=false' \
		'Categories=Game;' \
		> $(PKGROOT)/usr/share/applications/$(PKGNAME).desktop
	dpkg-deb --build pkg/$(PKGNAME)


purge:
	@pkill -f "^java -cp bin NekoMain$$"; echo "Cats have been purged"






