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
;; PHYSIC SYSTEM
;;

.include "man/entity.h.s"
.include "sys/render.h.s"
.include "cpct_functions.h.s"
.include "cpctelera.h.s"

direccion_hammer:   .db 2           ;; Si es 2 irá hacia la derecha, y si es -2 (0xFE) a la izquierda

;;
;; UPDATE
;;      Moves every entities
;; Input
;;      IX: Entity to move
;;
sys_physics_update::

    ld      a, e_object(ix)
    and     #e_object_enemy
    jp      nz, entity_enemy_move

    ld      a, e_object(ix)
    sub     #e_object_hammer            ;; No se hace and porque se le añade al hero el object hammer (martillo) y entonces
    jp      z, entity_hammer_lado_move  ;; entra a esta función y no a la suya, así solo entra si tiene SOLO el object hammer


entity_moveKeyboard::

    ld      a, e_frame(ix)
    sub     #e_frame_activo
    jp      nz, move_hero_after_init

    ;;call    cpct_scanKeyboard_asm ;;llamamos se escanea y ya
    ld      hl, #Key_O
    call    cpct_isKeyPressed_asm ;;tenemos que mandarle la tecla que queremos saber si esta pulsada
    jr      z, o_no_pulsada  ;;si me quiero mover a la izquierda hay que restar -1
    ld      a, e_ladder(ix)
    xor     #e_ladder_up
    xor     #e_ladder_down
    jr      z, o_no_pulsada
    ;; Comprobamos que no tenga una entidad invisible a la izquierda
    ld      a, e_invisible(ix)
    xor     #e_invisible_left
    jr      z, o_no_pulsada

    ;;ld      e_ai_aim_x(ix), #1
    ld      e_vx(ix), #0xFF

o_no_pulsada:
    ;;ld      e_ai_aim_x(ix), #0

    ld      hl, #Key_P
    call    cpct_isKeyPressed_asm ;;tenemos que mandarle la tecla que queremos saber si esta pulsada
    jr      z, p_no_pulsada  ;;si me quiero mover a la derecha hay que sumar 1
    ld      a, e_ladder(ix)
    xor     #e_ladder_up
    xor     #e_ladder_down
    jr      z, p_no_pulsada
    ;; Comprobamos que no tenga una entidad invisible a la derecha
    ld      a, e_invisible(ix)
    xor     #e_invisible_right
    jr      z, p_no_pulsada

    ;;ld      e_ai_aim_x(ix), #1
    ld      e_vx(ix), #0x01

p_no_pulsada:
    ;;ld      e_ai_aim_x(ix), #0
    
    ld      hl, #Key_Q
    call    cpct_isKeyPressed_asm ;;tenemos que mandarle la tecla que queremos saber si esta pulsada
    jr      z, q_no_pulsada  ;;si quiero subir hay que restar -1
    ld      a, e_ladder(ix)
    and     #e_ladder_up
    jr      z, q_no_pulsada
    ld      e_vy(ix), #-1
    ld      e_vy(ix), #0xFE
    ld      e_vx(ix), #0x00

q_no_pulsada:

    ld      hl, #Key_A
    call    cpct_isKeyPressed_asm ;;tenemos que mandarle la tecla que queremos saber si esta pulsada
    jr      z, a_no_pulsada  ;;si quiero bajar hay que sumar 1
    ld      a, e_ladder(ix)
    and     #e_ladder_down
    jr      z, a_no_pulsada
    ld      e_vy(ix), #1
    ld      e_vy(ix), #0x02
    ld      e_vx(ix), #0x00
    
a_no_pulsada:

    ld      a, e_vy(ix)
    xor     #0xFE
    jr      z, vely_negativa
    ld      a, e_vy(ix)
    xor     #0x02
    jr      z, vely_positiva

    ld      a, e_vx(ix)
    xor     #0xFF
    jr      z, velx_negativa
    ld      a, e_vx(ix)
    or      #0x00
    ret     z

velx_positiva:
    ld      a, #80
    sub     e_w(ix)
    ld      b, a
    ld      a, e_x(ix)
    add     e_vx(ix)
    xor     b 
    jp      z, velxy_0
    jr      sprite_delete
    

velx_negativa:
    ld      a, e_x(ix)
    add     e_vx(ix)
    jp      z, velxy_0
    jr      sprite_delete

vely_positiva:
    ld      a, #0xC9        ;; 200 en hexadecimal
    sub     e_h(ix)
    ld      b, a
    ld      a, e_y(ix)
    add     e_vy(ix)
    xor     b 
    jr      z, velxy_0
    jr      sprite_delete

vely_negativa:
    ld      a, e_y(ix)
    ld      b, a
    add     e_vy(ix)
    sub     b 
    jr      nc, velxy_0
    jr      sprite_delete

sprite_delete:
    call    update_XOR_borrar_IX

sprite_up_down:

    ld      a, e_vy(ix)
    sub     #2
    jr      z, sprite_inside_out
    ld      a, e_vy(ix)
    sub     #-2
    jr      z, sprite_inside_out
    jr      sprite_right

sprite_inside_out:

    ld      hl, #_viking_sp_2
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    jr      entity_move

sprite_right:

    ld      a, e_vx(ix)
    sub     #1
    jr      nz, sprite_left

    ld      hl, #_viking_sp_0
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    ld      a, #2
    ld      (direccion_hammer), a
    jr      entity_move

sprite_left:

    ld      a, e_vx(ix)
    sub     #-1
    jr      nz, entity_move

    ld      hl, #_viking_sp_1
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    ld      a, #-2
    ld      (direccion_hammer), a
    jr      entity_move

entity_move::
    ld      a, e_x(ix)
    add     e_vx(ix)
    ld      e_x(ix),a

    ld      a, e_y(ix)
    add     e_vy(ix)
    ld      e_y(ix), a

    jr      velxy_0

velxy_0:
    ld      e_vx(ix), #0
    ld      e_vy(ix), #0
    ret

move_hero_after_init:
    ld      a, e_frame(ix)
    or      #e_frame_activo
    ld      e_frame(ix), a
    ret

;;----------------------------------------------------------------------------
entity_enemy_move::

    ld      a, e_frame(ix)
    sub     #e_frame_activo
    jr      nz, next_frame_move

sprite_enemy_delete:
    call    update_XOR_borrar_IX

sprite_up_down_enemy:

    ld      a, e_vy(ix)
    sub     #2
    jr      z, sprite_inside_out_enemy
    ld      a, e_vy(ix)
    sub     #-2
    jr      z, sprite_inside_out_enemy
    jr      sprite_right_enemy

sprite_inside_out_enemy:

    ld      hl, #_enemy_sp_2
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    jr      move_enemy

sprite_right_enemy:

    ld      a, e_vx(ix)
    sub     #1
    jr      nz, sprite_left_enemy

    ld      hl, #_enemy_sp_1
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    jr      move_enemy

sprite_left_enemy:

    ld      a, e_vx(ix)
    sub     #-1
    jr      nz, move_enemy

    ld      hl, #_enemy_sp_0
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

move_enemy::

    ld      a, e_x(ix)
    add     e_vx(ix)
    ld      e_x(ix), a

    ld      a, e_y(ix)
    add     e_vy(ix)
    ld      e_y(ix), a

    ld      a, #e_frame_inactivo
    ld      e_frame(ix), a

    ret

next_frame_move:
    ld      a, e_frame(ix)
    or      #e_frame_activo
    ld      e_frame(ix), a
    ret

;;----------------------------------------------------------------------------
;; IX --> Martillo a lanzar
;; IY --> Hero
entity_hammer_lado_move:

    call    man_entity_getEntity_hero_IY

    ;; Comprobamos que el hero no está en mitad de la escalera
    ld      a, e_ladder(iy)
    xor     #e_ladder_up
    xor     #e_ladder_down
    jr      z, hammer_tiene_velocidad

    ;;call    cpct_scanKeyboard_asm ;;llamamos se escanea y ya
    ld      hl, #Key_Space
    call    cpct_isKeyPressed_asm ;;tenemos que mandarle la tecla que queremos saber si esta pulsada
    jr      z, hammer_tiene_velocidad

    ;; Comprobamos que el hero tiene un martillo (hammer)
    ld      a, e_object(iy)
    and     #e_object_hammer
    jr      z, hammer_tiene_velocidad

    ;; Añadimos los parámetros a la entidad martillo (hammer) para que se lance delante 
    ld      a, e_type(ix)
    or      #e_type_render
    ld      e_type(ix), a

    ld      a, e_y(iy)
    add     #4
    ld      e_y(ix), a

    ld      a, (direccion_hammer)
    ld      e_vx(ix), a

direccion_hammer_right:

    ld      a, e_vx(ix)    
    sub     #2
    jr      nz, direccion_hammer_left

    ld      hl, #_hammer_lado_sp_0
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h

    ld      a, e_x(iy)
    add     #7
    ld      e_x(ix), a

    jr      quitar_hammer

direccion_hammer_left:

    ld      hl, #_hammer_lado_sp_1
    ld      e_sprite(ix), l
    ld      e_sprite + 1(ix), h
    
    ld      a, e_x(iy)
    sub     #3
    ld      e_x(ix), a

quitar_hammer:
    ;; Le quitamos al hero el martillo (hammer)
    ld      a, e_object(iy)
    sub     #e_object_hammer
    ld      e_object(iy), a

    ;; Pintamos con el OR el martillo para que cuando se use el XOR se borre la primera vez
    call    sys_render_update

;; Comprobamos que tenga velocidad
hammer_tiene_velocidad:
    ld      a, e_vx(ix)
    cp      #0x02
    jr      z, vx_positiva_hammer
    cp      #0xFE
    ret     nz

;; Comprobamos que al avanzar no se sale de la pantalla
vx_negativa_hammer:
    ld      a, e_x(ix)
    sub     #3
    jr      c, restablecer_hammer
    jr      sprite_hammer_delete

vx_positiva_hammer:
    ld      a, e_x(ix)
    add     e_w(ix)
    ld      b, a
    ld      a, #76
    sub     b
    jr      c, restablecer_hammer

;; Borramos en la posición actual el martillo para pintar en la siguiente
sprite_hammer_delete:
    call    update_XOR_borrar_IX

;; Movemos el martillo (hammer)
move_hammer::
    ld      a, e_x(ix)
    add     e_vx(ix)
    ld      e_x(ix),a

    ret

;; Reestablecemos las características de la entidad martillo (hammer)
restablecer_hammer:
    call    update_XOR_borrar_IX
    ld      e_x(ix), #0x02
    ld      e_y(ix), #0x02
    ld      e_vx(ix), #0x00
    ld      a, e_type(ix)
    xor     #e_type_render      ;; También se podría eliminar con sub
    ld      e_type(ix), a

    ret
;;----------------------------------------------------------------------------
entity_nothing::

    ret  
