ASM_FILE=c05_mbr.asm
DIST_PATH=.
VHD_FILE=$(DIST_PATH)/boot.vhd
VM_NAME=learn-asm

all: vhd

bin: $(ASM_FILE)
	nasm -f bin $(ASM_FILE) -o mbr.bin 

vhd: bin
	-rm $(VHD_FILE)
	VBoxManage convertfromraw mbr.bin $(VHD_FILE) --format VHD --variant Fixed

run: vhd change-vm-vhd
	VBoxManage startvm $(VM_NAME)

stop: 
	-VBoxManage controlvm $(VM_NAME) savestate
	-VBoxManage discardstate $(VM_NAME)

create-vm: vhd
	VBoxManage createvm --name $(VM_NAME) --register
	VBoxManage modifyvm $(VM_NAME) --memory 64
	VBoxManage storagectl $(VM_NAME) --name SATA --add sata --controller IntelAhci --bootable on
	#VBoxManage storageattach $(VM_NAME) --storagectl SATA --port 0 --device 0 --type hdd --medium $(VHD_FILE)

change-vm-vhd: vhd
	#-VBoxManage discardstate $(VM_NAME)
	#-VBoxManage unregistervm $(VM_NAME)
	#-VBoxManage registervm '/Users/ttt/VirtualBox VMs/learn-asm/learn-asm.vbox'
	#VBoxManage internalcommands sethduuid $(VHD_FILE)
	VBoxManage storageattach $(VM_NAME) --storagectl SATA --port 0 --device 0 --type hdd --medium $(VHD_FILE)

unregister-vm:
	-VBoxManage unregistervm $(VM_NAME)

delete-vm:
	-VBoxManage unregistervm --delete $(VM_NAME)

clean :
	-rm -rf *.vhd *.bin
