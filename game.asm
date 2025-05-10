[org 0x0100]
jmp Entry
score: dw 0
x_offset: dw 4
y_offset: dw 9

; Player address will always point to the player matrix
player_address: dw 0

player: db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 0
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 1
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 2
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 3
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 4
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 5
        db 0,0,1,1,1,1,1,1,1,0,0,    ; Row 6 (Rectangle top)
        db 0,0,1,1,1,1,1,1,1,0,0,    ; Row 7 (Rectangle middle)
        db 0,0,1,1,1,1,1,1,1,0,0,    ; Row 8 (Rectangle bottom)
        db 0,0,4,0,0,4,4,0,0,4,0,    ; Row 9 (Tires)
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 10
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 11
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 12
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 13
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 14
        db 0,0,0,0,0,0,0,0,0,0,0,    ; Row 15

collided: dw 0

;===========================OBJ CODE START==============================
obj_pixel_color: dw 0xE000

; Reduced obstacle density (fewer 1s, larger gaps)
objects: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object2: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object3: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object4: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object5: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object6: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object7: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
object8: db 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

shift_objects:
pushA
mov bx,objects
call obj_move_left
mov bx,object2
call obj_move_left
mov bx,object3
call obj_move_left
mov bx,object4
call obj_move_left
mov bx,object5
call obj_move_left
mov bx,object6
call obj_move_left
mov bx,object7
call obj_move_left
mov bx,object8
call obj_move_left
popA
ret

shift_left:
pushA
mov dx,0
shift_all:
add dx,1
mov cx,[bx+1]
mov [bx],cx
add bx,1
cmp dx,79
jne shift_all
popA
ret

obj_move_left:
push ax
mov ax,[bx]
call shift_left
mov [bx+79],ah
pop ax
ret

Create_objects:
pushA
mov cx,0
mov si,0
mov di,0
mov bx,objects
complete_obj_pixel:
cmp si,79
jna y_coord_adjusted_obj
sub si,80
add di,1
y_coord_adjusted_obj:
mov ax,[bx]
cmp al,0
je skip_obj_pixel
push word [obj_pixel_color]
add si,0
add di,17
push si
push di
sub si,0
sub di,17
call CreatePixel
skip_obj_pixel:
add si,1
add bx,1
add cx,1
cmp cx,640
jne complete_obj_pixel
popA
ret

Delete_objects:
pushA
mov cx,0
mov si,0
mov di,0
mov bx,objects
delete_obj_pixel:
cmp si,79
jna y_coord_adjusted_delete_obj
sub si,80
add di,1
y_coord_adjusted_delete_obj:
mov ax,[bx]
cmp al,0
je skip_delete_obj_pixel
push 0x0000
add si,0
add di,17
push si
push di
sub si,0
sub di,17
call CreatePixel
skip_delete_obj_pixel:
add si,1
add bx,1
add cx,1
cmp cx,640
jne delete_obj_pixel
popA
ret

;===============================OBJ CODE END===================================

CreatePixel:
push bp
mov bp,sp
push es
push ax
push si
push bx
mov si,0
mov ax,0
mov bx,0
push 0xb800
pop es
mov ax,[bp+4]
mov si,80
mul si
add ax,[bp+6]
shl ax,1
mov si,ax
mov bx,[bp+8]
mov word [es:si],bx
pop bx
pop si
pop ax
pop es
mov sp,bp
pop bp
ret 6

;====================================PLAYER CODE START=============================

CreatePlayer:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push si
push di
mov ax,[bp+6]
mov [x_offset],ax
mov ax,[bp+4]
mov [y_offset],ax
mov ax,0
mov cx,0
mov si,0
mov di,0
mov bx,[player_address]
complete_player_pixel:
cmp si,10
jna y_coord_adjusted
sub si,11
add di,1
y_coord_adjusted:
mov ax,[bx]
cmp al,0
je skip_pixel
cmp al,4
je skip_pixel
cmp al,2
je print_white_skin
cmp al,3
je print_eye
push 0xA000
continue_skin:
add si,[bp+6]
add di,[bp+4]
push si
push di
sub si,[bp+6]
sub di,[bp+4]
call CreatePixel
skip_pixel:
add si,1
add bx,1
add cx,1
cmp cx,176
jne complete_player_pixel
pop di
pop si
pop dx
pop cx
pop bx
pop ax
mov sp,bp
pop bp
ret 4

print_white_skin:
push 0xFF21
jmp continue_skin
print_eye:
push 0x7931
jmp continue_skin

ClearPlayer:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push si
push di
mov cx,0
mov si,0
mov di,0
mov bx,[player_address]
complete_player_clear:
cmp si,10
jna y_coord_adjusted_clr
sub si,11
add di,1
y_coord_adjusted_clr:
mov ax,[bx]
cmp al,0
je skip_pixel_clr
cmp al,4
je skip_pixel_clr
push 0x0000
add si,[x_offset]
add di,[y_offset]
push si
push di
sub si,[x_offset]
sub di,[y_offset]
call CreatePixel
skip_pixel_clr:
add si,1
add bx,1
add cx,1
cmp cx,176
jne complete_player_clear
pop di
pop si
pop dx
pop cx
pop bx
pop ax
mov sp,bp
pop bp
ret

movePlayer:
push bp
mov bp,sp
push ax
push bx
push cx
push si
push di
call ClearPlayer
mov ax,[x_offset]
add [bp+6],ax
mov ax,[bp+6]
add word [x_offset],ax
mov ax,[y_offset]
add [bp+4],ax
mov ax,[bp+4]
add word [y_offset],ax
push word [bp+6]
push word [bp+4]
call CreatePlayer
pop di
pop si
pop cx
pop bx
pop ax
mov sp,bp
pop bp
ret 4

delay:
push ax
mov ax,0
complete_delay:
add ax,1
cmp ax,0xFFFF
jne complete_delay
pop ax
ret

;=======================================PLAYER CODE END==========================

CheckCollision:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push si
push di
mov cx,0
mov si,0
mov di,0
mov bx,[player_address]
complete_player_collide:
cmp si,10
jna y_coord_adjusted_collide
sub si,11
add di,1
y_coord_adjusted_collide:
mov ax,[bx]
cmp al,0
je skip_pixel_collide
push 0x0000
add si,[x_offset]
add di,[y_offset]
push si
push di
sub si,[x_offset]
sub di,[y_offset]
call isPlayerPixel
skip_pixel_collide:
add si,1
add bx,1
add cx,1
cmp cx,176
jne complete_player_collide
pop di
pop si
pop dx
pop cx
pop bx
pop ax
mov sp,bp
pop bp
ret

isPlayerPixel:
push bp
mov bp,sp
push es
push ax
push si
push bx
mov si,0
mov ax,0
mov bx,0
push 0xb800
pop es
mov ax,[bp+4]
mov si,80
mul si
add ax,[bp+6]
shl ax,1
mov si,ax
mov bx,[bp+8]
mov ax,[obj_pixel_color]
cmp word [es:si],ax
jne skip
mov word [collided],1
skip:
pop bx
pop si
pop ax
pop es
mov sp,bp
pop bp
ret 6

kbisr:
in ax, 0x60
cmp al,42 ; Shift key press
jne skip_shift_press
cmp word [y_offset],5
je skip_shift_press ; Skip if at top (y_offset = 5)
push 0
push -1
call movePlayer
call delay
skip_shift_press:
cmp al,185 ; Spacebar press
jne skip_space_press
cmp word [y_offset],24
je skip_space_press ; Skip if at bottom (y_offset = 24)
push 0
push 1
call movePlayer
call delay
skip_space_press:
cmp al,144 ; Quit key
jne end_isr
mov word [end_prog_bool],1
end_isr:
mov al, 0x20
out 0x20, al
iret

key_count: dw 0
kbisrVect: dw 0,0
end_prog_bool: dw 0
obstacle_speed_counter: dw 0  ; Counter to slow down obstacle movement

;+++++++++++++++++++++++++++++++++++++++++++++++++++++START PROGRAM++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
yourscore:      db   'SCORE:'
Entry:
mov word [player_address],player
clear_screen:
mov di,0
push es
push 0xb800
pop es
comp2:
mov word [es:di],0x0000
add di,2
cmp di,4000
jne comp2
pop es
mov  ah, 0x13
mov  al, 1
mov  bh, 0
mov  bl, 6
mov  dx, 0x022F
mov  cx, 6
push cs
pop  es
mov  bp, yourscore
int  0x10
push word [x_offset]
push word [y_offset]
call CreatePlayer
mov di,0
Install_timer_isr:
push   ds
xor    cx, cx
mov    ds, cx
mov    ax, [ds:8*4]
mov    dx, [ds:8*4+2]
cli
mov    word [ds:8*4],InterruptHandler
mov    [ds:8*4+2], cs
pop    ds
mov    word [OldIntVect], ax
mov    word [OldIntVect+2], dx
sti
Install_KeyBoard_isr:
push   ds
xor    cx, cx
mov    ds, cx
mov    ax, [ds:9*4]
mov    dx, [ds:9*4+2]
cli
mov    word [ds:9*4],kbisr
mov    [ds:9*4+2], cs
pop    ds
mov    word [kbisrVect], ax
mov    word [kbisrVect+2], dx
sti
l1:
cmp word [end_prog_bool],1
je Start_end_Prog
jmp l1
Start_end_Prog:
push es
push 0xb800
pop es
mov cx,1920
mov di,0
mov ax,0x0700
rep stosw
pop es
Unhook_interrupt_Kbisr:
mov    ax, word [kbisrVect]
mov    dx, word [kbisrVect+2]
push   ds
xor    cx, cx
mov    ds, cx
cli
mov    [ds:9*4], ax
mov    [ds:9*4+2], dx
sti
pop    ds
Unhook_interrupt_Timer:
mov    ax, word [OldIntVect]
mov    dx, word [OldIntVect+2]
push   ds
xor    cx, cx
mov    ds, cx
cli
mov    [ds:8*4], ax
mov    [ds:8*4+2], dx
sti
pop    ds
end_Prog:
mov ax,0x4c00
int   21h

;=============================================Timer ISR START=========================================
InterruptHandler:
pushf
call far [cs:OldIntVect]
cmp word [busy],1
je ExitHandler
mov word [busy],1
call CheckCollision
cmp word [collided],1
je ExitHandler
call Delete_objects
; Slow down obstacle movement by shifting only every 3rd tick
inc word [obstacle_speed_counter]
mov ax,[obstacle_speed_counter]
cmp ax,3
jne skip_shift
mov word [obstacle_speed_counter],0  ; Reset counter
call shift_objects
skip_shift:
call Create_objects
push ax
add word [score],1
mov ax,[score]
call printax
pop ax
cmp word [score],100
jb skip_color_score_100
mov word [obj_pixel_color],0xb000
skip_color_score_100:
cmp word [score],300
jb skip_color_score_300
mov word [obj_pixel_color],0xd000
skip_color_score_300:
isr_routine_complete:
mov word [busy],0
ExitHandler:
iret
;=========================TIMER ISR END===================================

printax:
pushA
mov si,0
mov di,0
keep_dividing:
mov bx,0
mov dx,0
mov cx,10
div cx
add di,1
push dx
cmp ax,0
jne keep_dividing
keep_printing:
pop ax
mov ah,07h
add al,30h
push es
push 0xb800
pop es
mov bx,450
add bx,si
mov [es:bx],ax
add si,2
pop es
sub di,1
cmp di,0
jne keep_printing
popA
ret
;============================================Print score end==============================

block:dw 3998
OldIntVect: dd 0
busy:dw 0
time:dw 0