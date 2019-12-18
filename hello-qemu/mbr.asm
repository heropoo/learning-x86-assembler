;文件说明：硬盘主引导扇区代码

mov ax,0xb800                 ;es寄存器指向文本模式的显示缓冲区
mov es,ax

;以下显示字符串"Label offset:"
;字符的显示属性分为两个字节
;第一个字节是字符的ASCII码，第二个字节是字符的显示属性
;下面的0x07表示字符以黑底白字，无闪烁无加亮的方式显示
mov byte [es:0x00],'H'
mov byte [es:0x01],0x07
mov byte [es:0x02],'e'
mov byte [es:0x03],0x07
mov byte [es:0x04],'l'
mov byte [es:0x05],0x07
mov byte [es:0x06],'l'
mov byte [es:0x07],0x07
mov byte [es:0x08],'o'
mov byte [es:0x09],0x07
mov byte [es:0x0a],' '
mov byte [es:0x0b],0x07
mov byte [es:0x0c],"w"
mov byte [es:0x0d],0x07
mov byte [es:0x0e],'o'
mov byte [es:0x0f],0x07
mov byte [es:0x10],'r'
mov byte [es:0x11],0x07
mov byte [es:0x12],'l'
mov byte [es:0x13],0x07
mov byte [es:0x14],'d'
mov byte [es:0x15],0x07
mov byte [es:0x16],'!'
mov byte [es:0x17],0x07

infi: jmp near infi                 ;无限循环

times 0x1fe-($-$$) db 0
db 0x55,0xaa
