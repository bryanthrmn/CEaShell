;--------------------------------------
;
; CEaShell Source Code - editProgram.asm
; By RoccoLox Programs and TIny_Hacker
; Copyright 2022 - 2024
; License: GPL-3.0
;
;--------------------------------------

    assume adl=1

    section .text

include 'include/equates.inc'

    public _asm_editProgram_edit
    public _asm_editProgram_goto
    public _asm_editProgram_main
    public _asm_editProgram_restoreAppVar

    extern _asm_hooks_appChangeHook
    extern _asm_hooks_removeAppChangeHook
    extern _asm_utils_arcUnarc
    extern _asm_utils_backupPrgmName
    extern _asm_runProgram_error
    extern _asm_utils_lcdNormal
    extern _asm_apps_reloadApp
    extern _asm_hooks_installHomescreenHook
    extern _rodata_tempAppVarPrgm

_asm_editProgram_edit: ; editing from CEaShell
    ld iy, 0
    add iy, sp
    ld hl, (iy + 9)
    ld de, 15
    add hl, de
    ld de, (hl)
    ld (editArcProgs), de
    xor a, a
    ld (returnLoc), a
    ld (isCelticVar), a
    ld hl, ti.OP1
    ld (hl), ti.ProgObj
    ld de, (iy + 3) ; program name
    ld a, (iy + 6) ; celtic var status
    bit 0, a
    jr z, .loadName
    ld (hl), ti.AppVarObj
    ld a, true
    ld (isCelticVar), a

.loadName:
    inc hl
    ex de, hl
    ld bc, 8
    ldir
    xor a, a
    ld (arcOnExit), a
    ld a, (isCelticVar)
    or a, a
    call nz, editProgram_prepAppVar
    xor a, a
    sbc hl, hl
    ld (errorOffset), hl
    ld (editMode), a
    ld iy, ti.flags
    jr _asm_editProgram_main + 5

_asm_editProgram_goto:
    ld hl, (ti.curPC)
    ld bc, (ti.begPC)
    or a, a
    sbc hl, bc
    ld (errorOffset), hl
    ld a, true
    ld (editMode), a
    xor a, a
    ld (isCelticVar), a

_asm_editProgram_main: ; OP1 = File name to edit
    xor a, a
    ld (arcOnExit), a
    ld (lockOnExit), a
    ld de, (ti.asm_prgm_size)
    or a, a
    sbc hl, hl
    ld (ti.asm_prgm_size), hl
    ld hl, ti.userMem
    call ti.DelMem
    ; make these flags are these values, for Celtic compatibility
    res 3, (iy + ti.asm_Flag2)
    set 5, (iy + ti.asm_Flag1)
    call ti.ChkFindSym
    ld a, (hl)
    cp a, ti.ProgObj
    jr z, .notLocked
    ld (hl), ti.ProgObj
    ld hl, lockOnExit
    ld (hl), true

.notLocked:
    call ti.ChkInRam
    jr z, .inRam
    call _asm_utils_arcUnarc
    ld hl, arcOnExit
    ld (hl), true

.inRam:
    call _asm_utils_backupPrgmName
    xor a, a
    ld (appChangeHookLoc), a
    bit ti.appChangeHookActive, (iy + ti.hookflags4)
    jr z, .install
    inc a
    ld (appChangeHookLoc), a
    ld hl, (ti.appChangeHookPtr)
    ld (appChangeHookLoc + 1), hl

.install:
    ld hl, _asm_hooks_appChangeHook
    call ti.SetAppChangeHook
    xor a, a
    ld (ti.menuCurrent), a
    call ti.CursorOff
    call ti.RunIndicOff
    call _asm_utils_lcdNormal
    ld hl, backupPrgmName
    push hl
    inc hl
    ld de, ti.progToEdit
    call ti.Mov9b
    pop hl
    ld de, ti.basic_prog
    call ti.Mov9b
    ld hl, editProgram_editHelper
    ld de, ti.cursorImage + 256
    ld bc, editHelperSize
    ldir ; relocate editProgram_editHelper to ti.cursorImage + 256
    jp ti.cursorImage + 256

editProgram_editHelper:
    ld a, ti.cxPrgmEdit
    call ti.NewContext
    xor a, a
    ld (ti.winTop), a
    call ti.ScrollUp
    call ti.HomeUp
    ld a, ':'
    call ti.PutC
    ld a, (editMode)
    or a, a
    jr z, .noGoto
    ld hl, (ti.editTop)
    ld de, (ti.editCursor)
    or a, a
    sbc hl, de
    add hl, de
    jr nz, .endGoto
    ld bc, (errorOffset)
    ld a, b
    or a, c
    jr z, .endGoto
    ld hl, (ti.editTail)
    ldir
    ld (ti.editTail), hl
    ld (ti.editCursor), de
    call ti.cursorImage + 256 + (.newLineGoto - editProgram_editHelper)

.endGoto:
    call ti.DispEOW
    ld hl, $100
    ld.sis (ti.curRow and $FFFF), hl
    jr .skip

.noGoto:
    call ti.DispEOW
    ld hl, $100
    ld.sis (ti.curRow and $FFFF), hl
    call ti.BufToTop

.skip:
    xor a, a
    ld (ti.menuCurrent), a
    set 7, (iy + $28)
    ld (backupSP), sp
    jp ti.Mon

.newLineGoto:
    ld hl, (ti.editCursor)
    ld a, (hl)
    cp a, ti.tEnter
    jr z, .newLineGotoBack

.loop:
    ld a, (hl)
    ld de, (ti.editTop)
    or a, a
    sbc hl, de
    ret z
    add hl, de
    dec hl
    push af
    ld a, (hl)
    call ti.Isa2ByteTok
    pop de
    jr z, .newLineGotoBack
    ld a, d
    cp a, ti.tEnter
    jr z, .newLineGotoNext

.newLineGotoBack:
    call ti.BufLeft
    ld hl, (ti.editCursor)
    jr .loop

.newLineGotoNext:
    jp ti.BufRight

editHelperSize := $ - editProgram_editHelper

editProgram_prepAppVar:
    ld hl, ti.OP1
    ld de, backupAppVarName
    call ti.Mov9b
    call ti.ChkFindSym
    call ti.ChkInRam
    jr z, .inRam
    ld a, true
    ld (arcOnExit), a
    ld hl, 10
    add hl, de
    ld a, c
    ld bc, 0
    ld c, a
    add hl, bc
    ex de, hl

.inRam:
    ex de, hl
    ld de, 0
    ld e, (hl)
    inc hl
    ld d, (hl)
    push de
    push de
    ld hl, _rodata_tempAppVarPrgm
    call ti.Mov9ToOP1
    pop hl
    push hl
    call ti.EnoughMem
    pop hl
    ld a, ti.E_Memory
    jp c, _asm_runProgram_error
    call ti.CreateProg
    push de
    ld hl, backupAppVarName
    call ti.Mov9ToOP1
    call ti.ChkFindSym ; the AppVar could've moved if it was in RAM
    call ti.ChkInRam
    jr z, .inRam2
    ld hl, 10
    add hl, de
    ld a, c
    ld bc, 0
    ld c, a
    add hl, bc
    ex de, hl

.inRam2:
    ex de, hl
    inc hl
    inc hl
    pop de
    inc de
    inc de
    pop bc

.load:
    ld a, b
    or a, c
    jr z, .loadComplete
    ldi
    jr .load

.loadComplete:
    ld hl, _rodata_tempAppVarPrgm
    call ti.Mov9ToOP1
    ret

_asm_editProgram_restoreAppVar:
    call ti.PushOP1 ; temp program for editing the appvar
    ld hl, backupAppVarName
    call ti.Mov9ToOP1
    call ti.ChkFindSym
    call nc, ti.DelVarArc
    call ti.PopOP1
    call ti.ChkFindSym
    ex de, hl
    ld de, 0
    ld e, (hl)
    inc hl
    ld d, (hl)
    push de
    ex de, hl
    call ti.EnoughMem
    ld a, ti.E_Memory
    pop hl
    jp c, _asm_runProgram_error
    push hl
    ld hl, backupAppVarName
    call ti.Mov9ToOP1
    call ti.PushOP1
    pop hl
    push hl
    call ti.CreateAppVar
    inc de
    inc de
    push de
    ld hl, _rodata_tempAppVarPrgm
    call ti.Mov9ToOP1
    call ti.ChkFindSym
    inc de
    inc de
    ex de, hl
    pop de
    pop bc

.load:
    ld a, b
    or a, c
    jr z, .loadComplete
    ldi
    jr .load

.loadComplete:
    call ti.ChkFindSym
    call ti.DelVarArc
    call ti.PopOP1
    ld a, (arcOnExit)
    or a, a
    ret z
    jp _asm_utils_arcUnarc
