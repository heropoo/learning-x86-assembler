# bochs

## 创建软盘/硬盘镜像文件
```
bximage
```

## 编译
```
nasm boot.asm -o boot.bin
```

## 将引导程序写进软盘镜像
```
dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
```

## 启动bochs
```
bochs -f bochsrc.txt
```

也可直接运行bochs ,进入后键入2来更改配置文件路径，键入6运行虚拟机, c 继续运行
