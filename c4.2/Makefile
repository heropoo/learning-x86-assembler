ASM_FILE=4-2.asm
BIN_FILE=4-2.bin
DIST_PATH=.
VHD_FILE=$(DIST_PATH)/4-2.img

$(VHD_FILE): $(BIN_FILE)
	dd if=$(BIN_FILE) of=$(VHD_FILE) count=1 bs=512
	#dd if=/dev/zero of=$(VHD_FILE) bs=512 seek=1 skip=1 count=2879

run: $(VHD_FILE)
	#qemu-system-i386 -hda $(VHD_FILE)
	qemu-system-i386 -m 64 -drive file=$(VHD_FILE),if=ide,format=raw

$(BIN_FILE): $(ASM_FILE)
	nasm -f bin $(ASM_FILE) -o $(BIN_FILE) -l mbr.list

clean :
	-rm -rf *.img *.bin *.list
