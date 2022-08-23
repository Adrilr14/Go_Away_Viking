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
.include "menu.h.s"
.include "sys/render.h.s"
.include "sys/physics.h.s"
.include "cpct_functions.h.s"
.include "man/game.h.s"
.include "man/levels.h.s"
;;.include "assets/screen/screenmenu_c.h.s"
.include "man/entity.h.s"


;;-------------------------------------------------------------------------
;;MENU INICIO
;;-------------------------------------------------------------------------
string_start:           .asciz "1-START"
string_continue:        .asciz "1-CONTINUE"
string_controls:        .asciz "2-CONTROLS"
string_credits_menu:    .asciz "3-CREDITS"

man_menu_init::

    ;;call    sys_physics_reset_frame_enemy
    ;;call    sys_physics_reset_frame_hero

    call 	man_entity_destroy
    call    sys_render_clearBackBuffer
    call    sys_render_init

    ;;imprimir la imagen
    ld      hl, #_screenmenu_c_end
    ld      de, #0xFFFF
    call    cpct_zx7b_decrunch_s_asm

    ;;imprime start
    ld      hl, #0x0004
    call    cpct_setDrawCharM0_asm

    ;; Si el nivel es el primero escribimos en el menú start, sino escribimos continue
    ld      a, (num_level)
    sub     #1
    jr      z, start

continue:
    ld      iy, #string_continue
    jr      draw_1

start:
    ld      iy, #string_start

draw_1:
    X = 31
    Y = 50
    ld      hl, #0xDA80 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0


    ;;imprime controls
    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_controls
    X = 31
    Y = 50
    ld      hl, #0xDB70 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0


    ;;imprime credits
    ld      hl, #0x0002
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_credits_menu
    X = 31
    Y = 50
    
    ld      hl, #0xDC60 + 64 + (Y / 8) + 2048 * (Y & 7) + X

    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0
    call    man_menu_run

ret

man_menu_run::
    ;;call    cpct_scanKeyboard_f_asm
pulsar_start:
    ld      hl, #Key_1
    call    cpct_isKeyPressed_asm
    jr      z, pulsar_controls
    call    man_game_init2
    ret
pulsar_controls:
    ;;;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_2
    call    cpct_isKeyPressed_asm
    jr      z, pulsar_credits
    call    man_menu_controls
    ret
pulsar_credits:
    ;;;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_3
    call    cpct_isKeyPressed_asm
    jr      z, man_menu_run
    call    man_menu_credits
    ret
ret

;;-------------------------------------------------------------------------
;;MENU MUERTE
;;-------------------------------------------------------------------------

string_lose:   .asciz "YOU DIED"
string_restart:   .asciz "PRESS ENTER TO START"

man_menu_lose::

    ;;call    sys_physics_reset_frame_enemy
    ;;call    sys_physics_reset_frame_hero

    call 	man_entity_destroy
    call    sys_render_clearBackBuffer
    ;;call    sys_render_init
    
    ld      hl, #0x0002
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_lose
    X = 32
    Y = 40
    ld      hl, #0xD940 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0
   
    ld      hl, #0x0004
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_restart
    X = 7
    Y = 80
    ld      hl, #0xDCB0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

    ;;call    man_menu_restart
;;
    ;;ret

man_menu_restart:
    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Return
    call    cpct_isKeyPressed_asm
    jr      z, man_menu_restart
    call    man_game_init2
ret

;;------------------------------------------------------------------------------------------------------
;; ----------------------MENU CONTROLS-------------------------------
;;------------------------------------------------------------------------------------------------------

string_title:    .asciz "CONTROLS"
string_right:   .asciz 	"RIGHT  =  P"
string_left:   .asciz 	"LEFT   =  O"
string_up:   .asciz 	"UP     =  Q"
string_down:   .asciz 	"DOWN   =  A"
string_throw:   .asciz 	"THROW  =  SPACE"
string_press:   .asciz 	"PRESS ESC TO RETURN"


man_menu_controls::

    call 	man_entity_destroy
    call    sys_render_clearBackBuffer
    call    sys_render_init

    ;;imprime start
    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_title
    X = 31
    Y = 50
    ld      hl, #0xD8A0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0


    ;;imprime controls
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_right
    X = 21
    Y = 50
    ld      hl, #0xD230 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0


    ;;imprime credits
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_left
    X = 21
    Y = 50
    ld      hl, #0xD2D0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;imprime credits
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_up
    X = 21
    Y = 50
    ld      hl, #0xD370 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;imprime credits
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_down
    X = 21
    Y = 50
    ld      hl, #0xD410 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;imprime credits
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_throw
    X = 21
    Y = 50
    ld      hl, #0xD4B0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0



	;;imprime credits
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_press
    X = 12
    Y = 50
    ld      hl, #0xD640 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

repeat1:
    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Esc
    call    cpct_isKeyPressed_asm
    jr      z, repeat1
    ;;call 	man_entity_destroy
	call 	man_menu_init
    ret


;;------------------------------------------------------------------------------------------------------
;; ----------------------MENU CREDITS-------------------------------
;;------------------------------------------------------------------------------------------------------

string_credits:    .asciz "CREDITS"
string_name1:   .asciz 	"ELENA"
string_ap1n1:   .asciz 	"ALCARAZ"
string_ap2n1:   .asciz 	"SANCHEZ"
string_name2:   .asciz 	"ADRIAN"
string_ap1n2:   .asciz 	"LARROSA"
string_ap2n2:   .asciz 	"ROMERO"
string_group:   .asciz 	"SANSPIELERS"


man_menu_credits::

    call 	man_entity_destroy
    call    sys_render_clearBackBuffer
    call    sys_render_init

    ;;imprime start
    ld      hl, #0x4080
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_credits
    X = 36
    Y = 50
    ld      hl, #0xD8A0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0


    ;;NOMBRE ADRIAN
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_name2
    X = 20
    Y = 50
    ld      hl, #0xCA80 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0


    ;;PRIMER APELLIDO ADRIAN
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_ap1n2
    X = 20
    Y = 50
    ld      hl, #0xCB20 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;SEGUNDO APELLIDO ADRIAN
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_ap2n2
    X = 20
    Y = 50
    ld      hl, #0xCBC0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0


    ;;NOMBRE ELENA
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_name1
    X = 60
    Y = 50
    ld      hl, #0xEA80 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0


    ;;PRIMER APELLIDO ELENA
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_ap1n1
    X = 60
    Y = 50
    ld      hl, #0xEB20 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;SEGUNDO APELLIDO ELENA
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_ap2n1
    X = 60
    Y = 50
    ld      hl, #0xEBC0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;NOMBRE GRUPO
	;    ld      hl, #0x0005
		call    cpct_setDrawCharM0_asm
		ld      iy, #string_group
		X = 30
		Y = 50
		ld      hl, #0xD500 + 64 + (Y / 8) + 2048 * (Y & 7) + X
		;;ld      hl, #0xDCB0
		call    _myDrawStringM0


	;;PRESS KEY
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_press
    X = 12
    Y = 50
    ld      hl, #0xD640 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

repeat2:
    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Esc
    call    cpct_isKeyPressed_asm
    jr      z, repeat2
    ;;call 	man_entity_destroy
	call 	man_menu_init
ret


;;-------------------------------------------------------------------------
;; MENU LEVEL COMPLETED
;;-------------------------------------------------------------------------

string_level_completed:     .asciz "LEVEL COMPLETED!"
string_to_continue:         .asciz "ENTER TO CONTINUE"


man_menu_level_completed::

    call    man_level_add

    ;;call    sys_physics_reset_frame_enemy
    ;;call    sys_physics_reset_frame_hero

    ;;call    cpct_disableFirmware_asm
    call    man_entity_destroy
    call    sys_render_clearBackBuffer
    ;;call    sys_render_init
    
    ld      hl, #0x0004
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_level_completed
    X = 20
    Y = 40
    ld      hl, #0xD940 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0
   
    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_to_continue
    X = 13
    Y = 80
    ld      hl, #0xDCB0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0
    call    man_menu_continue
ret

man_menu_continue::
    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Return
    call    cpct_isKeyPressed_asm
    jr      z, man_menu_continue
    call    man_game_init2
ret

;;------------------------------------------------------------------------------------------------------
;; ----------------------PANTALLA FINAL-------------------------------
;;------------------------------------------------------------------------------------------------------

string_congr:       .asciz 	"CONGRATULATIONS!"
string_finish1:     .asciz  "YOU HAVE COMPLETED"
string_finish2:     .asciz  "THE GAME"
string_pressEnter:  .asciz "PRESS ENTER"
string_pressRestart: .asciz "TO RESTART"

man_menu_finish::

    call    man_level_reset

    ;;call    sys_physics_reset_frame_enemy
    ;;call    sys_physics_reset_frame_hero

    ;;ld      a, #0
    ;;ld      (frame_move_enemy), a
;;
    ;;ld      a, #0
    ;;ld      (frame_move_hero), a

    call 	man_entity_destroy
    call    sys_render_clearBackBuffer
    ;;call    sys_render_init

    ;;imprime CONGRATULATIONS
    ld      hl, #0x4080
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_congr
    X = 20
    Y = 50
    ld      hl, #0xD8A0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xD940
    call    _myDrawStringM0


    ;;COMPLETED
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_finish1
    X = 18
    Y = 50
    ld      hl, #0xCA80 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

    ;;THE GAME
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_finish2
    X = 36
    Y = 50
    ld      hl, #0xCB20 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

	;;PRESS ENTER
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_pressEnter
    X =  30
    Y = 50
    ld      hl, #0xD5F0 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

    ;;PRESS TO RESTART
   ;    ld      hl, #0x0005
    call    cpct_setDrawCharM0_asm
    ld      iy, #string_pressRestart
    X = 32
    Y = 50
    ld      hl, #0xD690 + 64 + (Y / 8) + 2048 * (Y & 7) + X
    ;;ld      hl, #0xDCB0
    call    _myDrawStringM0

repeat3:
    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Return
    call    cpct_isKeyPressed_asm
    jr      z, repeat3
	call 	man_menu_init
ret
