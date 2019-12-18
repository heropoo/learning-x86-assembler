ASM_FILE=mbr.asm
DIST_PATH=.
VHD_FILE=$(DIST_PATH)/boot.img
VM_NAME=learn-asm

$(VHD_FILE): mbr.bin
	dd if=mbr.bin of=$(VHD_FILE) count=1 bs=512
	#dd if=/dev/zero of=$(VHD_FILE) bs=512 seek=1 skip=1 count=2879

run: $(VHD_FILE)
	#qemu-system-i386 -hda $(VHD_FILE)
	qemu-system-i386 -m 64 -drive file=$(VHD_FILE),if=ide,format=raw

mbr.bin: $(ASM_FILE)
	nasm -f bin $(ASM_FILE) -o mbr.bin -l mbr.list

clean :
	-rm -rf *.img *.bin *.list
