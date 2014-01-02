SRC_DIR		= power_fixer
BUILD_DIR	= build
PREFIX		= /usr/local/

all: $(BUILD_DIR)/power_fixer

$(BUILD_DIR)/power_fixer:
	mkdir -p $(BUILD_DIR)
	$(CC) $(SRC_DIR)/main.c -o $@

clean:
	rm -f $(BUILD_DIR)/*

install: all
	cp $(BUILD_DIR)/power_fixer $(PREFIX)/bin/
	sudo cp com.power_fixer.plist /Library/LaunchDaemons/
	launchctl load /Library/LaunchDaemons/com.power_fixer.plist
