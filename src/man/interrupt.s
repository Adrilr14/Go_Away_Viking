;;-----------------------------LICENSE NOTICE------------------------------------
;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.
;;
;;  You should have received a copy of the GNU General Public License
;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;  
;;  Email:      adrilaro99@gmail.com
;;              elena78eas@gmail.com
;;
;;  Twitter:    @sanspielers
;;-------------------------------------------------------------------------------

.include "cpctelera.h.s"
.include "cpct_functions.h.s"
.include "man/interrupt.h.s"

;;

man_ir_num_interrupt:: .db 6

man_ir1::
   cpctm_push  af, bc, hl

   setNumIR 1
   setNextManIR man_ir2

   ;;cpctm_setBorder_asm HW_BLACK

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir2::
   cpctm_push  af, bc, hl

   setNumIR 2
   setNextManIR man_ir3

   ;;cpctm_setBorder_asm HW_GREEN

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir3::
   cpctm_push  af, bc, hl

   setNumIR 3
   setNextManIR man_ir4

   ;;pctm_setBorder_asm HW_RED

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir4::
   cpctm_push  af, bc, hl

   setNumIR 4
   setNextManIR man_ir5

   ;;cpctm_setBorder_asm HW_BLUE

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir5::
   cpctm_push  af, bc,de, hl
   exx
   ex    af, af'
   cpctm_push  af, bc, de, hl

   setNumIR 5
   setNextManIR man_ir6

   ;;cpctm_setBorder_asm HW_YELLOW
   ;;call  cpct_akp_musicPlay_asm
   ;;call cpct_scanKeyboard_if_asm

   cpctm_pop  hl, de, bc, af 
   exx
   ex    af, af'
   cpctm_pop   hl, de, bc, af 
   ei
   reti

man_ir6::
   cpctm_push  af, bc,de, hl
   exx
   ex    af, af'
   cpctm_push  af, bc, de, hl

   setNumIR 6
   setNextManIR man_ir7

   ;;cpctm_setBorder_asm HW_YELLOW
   call  cpct_akp_musicPlay_asm
   call cpct_scanKeyboard_if_asm

   cpctm_pop  hl, de, bc, af 
   exx
   ex    af, af'
   cpctm_pop   hl, de, bc, af 
   ei
   reti

man_ir7::
   cpctm_push  af, bc, hl

   setNumIR 7
   setNextManIR man_ir8

   ;;cpctm_setBorder_asm HW_BLACK

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir8::
   cpctm_push  af, bc, hl

   setNumIR 8
   setNextManIR man_ir9

   ;;cpctm_setBorder_asm HW_GREEN

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir9::
   cpctm_push  af, bc, hl

   setNumIR 9
   setNextManIR man_ir10

   ;;cpctm_setBorder_asm HW_RED

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir10::
   cpctm_push  af, bc, hl

   setNumIR 10
   setNextManIR man_ir11

   ;;cpctm_setBorder_asm HW_BLUE

   cpctm_pop   hl, bc, af
   ei
   reti

man_ir11::
   cpctm_push  af, bc, hl
   

   setNumIR 11
   setNextManIR man_ir12

   ;;cpctm_setBorder_asm HW_YELLOW

   cpctm_pop   hl, bc, af 
   ei
   reti

man_ir12::
   cpctm_push  af, bc, hl
   

   setNumIR 12
   setNextManIR man_ir1

   ;;cpctm_setBorder_asm HW_PURPLE
    
   cpctm_pop  hl, bc, af
   ei
   reti


man_ir_init::
   im    1
   call  cpct_waitVSYNC_asm
   halt
   halt
   call  cpct_waitVSYNC_asm
   di
   ;; Poner JP en 0x38
   ld    a, #0xC3    ;; JP == 0xC3
   ld    (0x38), a
   ;; Dirección de salto
   ld    hl, #man_ir1
   ld    (0x39), hl
   ei
   ret
   