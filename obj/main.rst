ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
                              3 ;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU General Public License
                             16 ;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
                             17 ;;  
                             18 ;;  Email:      adrilaro99@gmail.com
                             19 ;;              elena78eas@gmail.com
                             20 ;;
                             21 ;;  Twitter:    @sanspielers
                             22 ;;-------------------------------------------------------------------------------
                             23 
                             24 ;;.include "man/game.h.s"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             25 .include "man/menu.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
                              3 ;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU General Public License
                             16 ;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
                             17 ;;  
                             18 ;;  Email:      adrilaro99@gmail.com
                             19 ;;              elena78eas@gmail.com
                             20 ;;
                             21 ;;  Twitter:    @sanspielers
                             22 ;;-------------------------------------------------------------------------------
                             23 
                             24 .globl man_menu_init
                             25 .globl man_menu_run
                             26 .globl _myDrawStringM0
                             27 .globl man_menu_lose
                             28 ;;.globl man_menu_restart
                             29 .globl man_menu_level_completed
                             30 .globl man_menu_continue
                             31 .globl man_menu_controls
                             32 .globl man_menu_credits
                             33 .globl man_menu_finish
                             34 ;;.globl man_pulsar_controls
                             35 ;;.globl man_pulsar_credits
                             36 
                             37 .globl _screenmenu_c_end
                             38 
                             39 ;;.macro DefineNEntities _name, _n
                             40 ;;    _c = 0
                             41 ;;    .rept _n
                             42 ;;        DefineEntityDefault _name, \_c 
                             43 ;;        _c = _c +1
                             44 ;;    .endm
                             45 ;;.endm
                             46 
                             47 ;;.macro DefineNEntities _name
                             48 ;;    _n = _n + 1
                             49 ;;    _name'_n
                             50 ;;.endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             26 .include "cpct_functions.h.s"
                              1 .globl cpct_disableFirmware_asm
                              2 .globl cpct_getScreenPtr_asm
                              3 .globl cpct_setDrawCharM1_asm
                              4 .globl cpct_drawStringM1_asm
                              5 .globl cpct_waitVSYNC_asm
                              6 .globl cpct_setVideoMode_asm
                              7 .globl cpct_setPalette_asm
                              8 .globl cpct_drawSprite_asm
                              9 .globl cpct_scanKeyboard_asm
                             10 .globl cpct_scanKeyboard_f_asm
                             11 .globl cpct_isKeyPressed_asm
                             12 .globl cpct_setVideoMemoryPage_asm
                             13 .globl cpct_memset_f64_asm
                             14 .globl cpct_etm_setTileset2x4_asm
                             15 .globl cpct_etm_drawTileBox2x4_asm
                             16 .globl cpct_getScreenToSprite_asm
                             17 .globl cpct_drawSpriteBlended_asm
                             18 .globl cpct_setBlendMode_asm
                             19 .globl cpct_setDrawCharM0_asm
                             20 .globl cpct_drawStringM0_asm
                             21 .globl cpct_memset_f8_asm
                             22 .globl cpct_isAnyKeyPressed_f_asm
                             23 .globl cpct_zx7b_decrunch_s_asm
                             24 .globl cpct_scanKeyboard_if_asm
                             25 .globl cpct_akp_musicPlay_asm
                             26 .globl cpct_akp_musicInit_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             27 ;;.include "man/entity.h.s"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             28 .include "man/interrupt.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
                              3 ;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU General Public License
                             16 ;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
                             17 ;;  
                             18 ;;  Email:      adrilaro99@gmail.com
                             19 ;;              elena78eas@gmail.com
                             20 ;;
                             21 ;;  Twitter:    @sanspielers
                             22 ;;-------------------------------------------------------------------------------
                             23 
                             24 ;;
                             25 ;; INTERRUPT MANAGER
                             26 ;;
                             27 .module Interrupt_Manager
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl man_ir_init
                             31 .irp _num, 1,2,3,4,5,6,7,8,9,10,11,12        ;; Con esto creamos todos los .globl de man_ir, significa repetición indefinida y se repite 
                             32     .globl man_ir'_num                       ;; el número de veces de valores que haya
                             33 .endm
                              1     .globl man_ir1                       ;; el número de veces de valores que haya
                              1     .globl man_ir2                       ;; el número de veces de valores que haya
                              1     .globl man_ir3                       ;; el número de veces de valores que haya
                              1     .globl man_ir4                       ;; el número de veces de valores que haya
                              1     .globl man_ir5                       ;; el número de veces de valores que haya
                              1     .globl man_ir6                       ;; el número de veces de valores que haya
                              1     .globl man_ir7                       ;; el número de veces de valores que haya
                              1     .globl man_ir8                       ;; el número de veces de valores que haya
                              1     .globl man_ir9                       ;; el número de veces de valores que haya
                              1     .globl man_ir10                       ;; el número de veces de valores que haya
                              1     .globl man_ir11                       ;; el número de veces de valores que haya
                              1     .globl man_ir12                       ;; el número de veces de valores que haya
                             34 
                             35 ;; PUBLIC DATA
                             36 .globl man_ir_num_interrupt
                             37 
                             38 
                             39 ;; MACROS
                             40 .macro setNextManIR direccion
                             41    ld    hl, #direccion
                             42    ld    (0x39), hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             43 .endm
                             44 
                             45 .macro setNumIR number
                             46    ld    a, #number
                             47    ld    (man_ir_num_interrupt), a
                             48 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             29 ;;.include "cpctelera.h.s"
                             30 ;;.include "sys/render.h.s"
                             31 
                             32 .module _main
                             33 
                             34 .globl	reset
                             35 
                             36 .area _DATA
                             37 .area _CODE
                             38 
                             39 .globl _song_menu
                             40 
   29DC                      41 _main::
                             42 
                             43 	;;CAMBIAR LA PILA DE SITIO
                             44 	;;ld 		sp, #0x8000  ;; a partir de 8000 es todo video
                             45 
                             46 	;; Disable firmware to prevent it from interfering with string drawing
                             47    	;;call 	cpct_disableFirmware_asm
                             48 
                             49 	;; LLamamos al init de las interrupciones
   29DC CD BD 4A      [17]   50 	call  	man_ir_init
                             51 
   29DF 11 50 02      [10]   52 	ld 		de, #_song_menu
   29E2 CD 08 66      [17]   53 	call 	cpct_akp_musicInit_asm
                             54 
   29E5 CD 37 54      [17]   55 	call 	man_menu_init
                             56 	
