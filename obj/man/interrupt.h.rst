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
                             43 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             44 
                             45 .macro setNumIR number
                             46    ld    a, #number
                             47    ld    (man_ir_num_interrupt), a
                             48 .endm
