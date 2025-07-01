.thumb

.equ gUnitSubject, 0x2033F3C

push		{r4-r5, r14}
mov			r4, r0
ldr			r0, =gUnitSubject
ldr			r0, [r0, #0x00]
ldrb		r0, [r0, #0x0B]
lsl			r0, #0x18
asr			r0, #0x18
mov			r1, #0x0B
ldsb		r1, [r4, r1]
ldr			r2, AreUnitsAllied
mov			r14, r2
.short		0xF800
lsl			r0, #0x18
cmp			r0, #0x00
beq			End					@Change this for 'bne End' to make it work only on enemies.

ldr			r0, [r4, #0x0C]
mov			r1, #0x20
and			r0, r1
cmp			r0, #0x00
bne			End

mov			r0, r4
add			r0, #0x30
ldrb		r1, [r0, #0x00]
mov			r0, #0x1F			@Change this for 'mov r0, #0x0F' to make it work without Status Expansion, NOT TESTED.
and			r0, r1
cmp			r0, #0x00
beq			End

ldr 		r2, BeneficialStatusList
StatusLoop:
ldrb 		r1, [r2]
cmp			r1, #0
beq			EndLoop
cmp			r0, r1
beq			End
add			r2, #1
b			StatusLoop

EndLoop:
mov			r0, #0x10
ldsb		r0, [r4, r0]
mov			r1, #0x11
ldsb		r1, [r4, r1]
mov			r2, #0x0B
ldsb		r2, [r4, r2]
mov			r3, #0x00
ldr			r5, AddTarget
mov			r14, r5
.short		0xF800

End:
pop			{r4-r5}
pop			{r0}
bx			r0

.align
AreUnitsAllied:
.long 0x8024D8D
AddTarget:
.long 0x804F8BD

.ltorg 
BeneficialStatusList:
