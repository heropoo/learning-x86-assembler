ASM_FILE=c05_mbr.asm

all: vhd

bin: $(ASM_FILE)
	nasm -f bin $(ASM_FILE) -o mbr.bin 

vhd: bin
	-rm boot.vhd
	VBoxManage convertfromraw mbr.bin boot.vhd --format VHD --variant Fixed

#img: bin
#	dd if=mbr.bin of=boot.img count=1 bs=512
#	dd if=/dev/zero of=boot.img bs=512 seek=1 skip=1 count=2879

#run: img
#	qemu-system-i386 -drive file=boot.img,format=raw,if=floppy

clean :
	-rm -rf *.vhd *.bin
