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

;;.include "man/game.h.s"
.include "man/menu.h.s"
.include "cpct_functions.h.s"
;;.include "man/entity.h.s"
.include "man/interrupt.h.s"
;;.include "cpctelera.h.s"
;;.include "sys/render.h.s"

.module _main

.globl	reset

.area _DATA
.area _CODE

.globl _song_menu

_main::

	;;CAMBIAR LA PILA DE SITIO
	;;ld 		sp, #0x8000  ;; a partir de 8000 es todo video

	;; Disable firmware to prevent it from interfering with string drawing
   	;;call 	cpct_disableFirmware_asm

	;; LLamamos al init de las interrupciones
	call  	man_ir_init

	ld 		de, #_song_menu
	call 	cpct_akp_musicInit_asm

	call 	man_menu_init
	
