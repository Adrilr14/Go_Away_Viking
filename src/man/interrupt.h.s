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

;;
;; INTERRUPT MANAGER
;;
.module Interrupt_Manager

;; PUBLIC FUNCTIONS
.globl man_ir_init
.irp _num, 1,2,3,4,5,6,7,8,9,10,11,12        ;; Con esto creamos todos los .globl de man_ir, significa repetición indefinida y se repite 
    .globl man_ir'_num                       ;; el número de veces de valores que haya
.endm

;; PUBLIC DATA
.globl man_ir_num_interrupt


;; MACROS
.macro setNextManIR direccion
   ld    hl, #direccion
   ld    (0x39), hl
.endm

.macro setNumIR number
   ld    a, #number
   ld    (man_ir_num_interrupt), a
.endm
