	assume adl=1

	section .text

include 'include/ti84pceg.inc'

	public _hidePrgm

_hidePrgm:
    push ix
    ld ix, 0
    add ix, sp
    ld a, (ix + 9) ; get type
    ld hl, (ix + 6) ; get name
    pop ix
    ld (ti.OP1), a ; move type to OP1
    ld de, ti.OP1 + 1
    ld bc, 8
    ldir ; move name to OP1

    call ti.ChkFindSym
    ld de, -7
    add hl, de
    ld a, (hl)
    xor a, 01000000b
    ld (hl), a
    ret