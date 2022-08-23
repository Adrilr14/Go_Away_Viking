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
.include "man/entity.h.s"
.include "man/menu.h.s"
.include "man/levels.h.s"
.include "sys/render.h.s"
.include "sys/collision.h.s"

;;================================
;;================================
;;PRVATE DATA
;;================================
;;================================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;SYS COLLISION: Update
;;          Check collisions between all Entity collision bodies
;;INPUT:
;;      IX --> Puntero a la primera entidad de la pareja
;;      IY --> Puntero a la segunda entidad de la pareja
;;DESTROYS:
;;
sys_collision_update::

collision_primero_segundo:

    ld      a, e_collisionable(ix)
    ld      b, e_object(iy)
    and     b
    ld      b, a
    jr      nz, sys_collision_check       

collision_segundo_primero:

    ld      a, e_collisionable(iy)
    ld      b, e_object(ix)
    and     b
    ld      b, a
    ret     z

sys_collision_check:
    ld      a, #e_object_enemy
    and     b
    jr      nz, collision_with_enemy_or_invisible_or_key_or_hammer

    ld      a, #e_object_invisible
    and     b
    jr      nz, collision_with_enemy_or_invisible_or_key_or_hammer

    ld      a, #e_object_key
    and     b
    jr      nz, collision_with_enemy_or_invisible_or_key_or_hammer

    ld      a, #e_object_hammer
    and     b
    jr      nz, collision_with_enemy_or_invisible_or_key_or_hammer

    ld      a, #e_object_door
    and     b
    jp      nz, collision_with_door

    ld      a, #e_object_ladder
    and     b
    jp      nz, collision_with_ladder

    ret
;;-----------------------------------------------------------------------------------
;; Colisión con una entidad enemigo o invisible
collision_with_enemy_or_invisible_or_key_or_hammer:
    ;;EJE X
    ;; if (A < B) no_collision
    ;; if (e_x(ix) + e_w(ix) < e_x(iy))   no_collision
    ;; if (e_x(ix) + e_w(ix) - e_x(iy) < 0)   no_collision
    ;; Si en un eje no colisiona es que estan separados

    ld      a, e_x(ix)
    add     e_w(ix)
    sub     e_x(iy)
    jp      c, no_collision                        ;; m es minus (que sea negativo)


    ;; if (C < D) no_collision
    ;; if (e_x(iy) + e_w(iy) < e_x(ix))   no_collision
    ;; if (e_x(iy) + e_w(iy) - e_x(ix) < 0)   no_collision
    ld      a, e_x(iy)
    add     e_w(iy)
    sub     e_x(ix)
    jr      c, no_collision                        ;; m es minus (que sea negativo), p es positive
    
    ;;EJE Y
    ;; if (e_y(ix) + e_h(ix) - e_y(iy) < 0)   no_collision
    ld      a, e_y(ix)
    add     e_h(ix)
    sub     e_y(iy)
    jr      c, no_collision 


    ;; if (e_y(iy) + e_h(iy) - e_y(ix) < 0)   no_collision
    ld      a, e_y(iy)
    add     e_h(iy)
    sub     e_y(ix)
    jr      c, no_collision

    ;; Comprobamos si la colisión es con un enemigo
    ld      a, #e_object_enemy
    and     b
    jr      nz, collision_with_enemy

    ;; Comprobamos si la colisión es con una llave (key)
    ld      a, #e_object_key
    and     b
    jp      nz, collision_with_key

    ;; Comprobamos si la colisión es con una martillo (hammer)
    ld      a, #e_object_hammer
    and     b
    jp      nz, collision_with_hammer

;;-----------------------------------------------------------------------------------
;; Collision con una entidad invisible
collision_with_invisible:
    ;;ld      a, e_object(ix)
    ;;and     #e_object_enemy
    ;;jr      nz, update_enemy_after_collision_ix_invisible
;;
    ;;ld      a, e_object(iy)
    ;;and     #e_object_enemy
    ;;jr      nz, update_enemy_after_collision_iy_invisible

    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, update_hero_after_collision_ix_invisible

;;update_hero_after_collision_iy_invisible:
;;
;;    ld      e_type(iy), #0x0E
;;    ret

update_hero_after_collision_ix_invisible:

;; Comprobamos si la entidad invisible está a la izquierda (left)
collision_with_invisible_left:
    ld      a, e_x(ix)
    sub     #1          ;; Así se comprueba si está al lado
    xor     e_x(iy)
    jr      nz, collision_with_invisible_right

    ;; Le añadimos la máscara del tipo e_type_invisible_left para que no pueda ir hacia la izquierda
    ld      a, e_invisible(ix)
    or      #e_invisible_left
    ld      e_invisible(ix), a

    ret

;; Comprobamos si la entidad invisible está a la derecha (right)
collision_with_invisible_right:
    ld      a, e_x(ix)
    add     e_w(ix)     ;; Si la colisión es en la derecha se le añade el ancho (width) a la posición del hero
    ;;add     #1          ;; Así se comprueba si está al lado
    xor     e_x(iy)
    ret     nz

    ;; Le añadimos la máscara del tipo e_type_invisible_right para que no pueda ir hacia la izquierda
    ld      a, e_invisible(ix)
    or      #e_invisible_right
    ld      e_invisible(ix), a

    ret

;;update_enemy_after_collision_iy_invisible:
;;    
;;    ld      e_vx(iy), #-1
;;    ret
;;
;;update_enemy_after_collision_ix_invisible:
;;
;;    ld      e_vx(ix), #-1
;;    ret

;;-----------------------------------------------------------------------------------
;; Collision con una entidad enemigo
collision_with_enemy:
    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, update_hero_after_collision_ix

;;update_hero_after_collision_iy:
;;    ;;ld__e_iyl
;;    ;;ld__d_iyh
;;    ld      b, #0x01
;;    ;;call    update_XOR_after_hero_collision
;;    ld      e_x(iy), #0x00
;;    ld      e_y(iy), #0xA4
;;    ret

update_hero_after_collision_ix:
    ;; MUERE AQUI
    ;;call    man_entity_destroy
    call    man_menu_lose
    ;;ld__e_ixl
    ;;ld__d_ixh
    ;;ld      b, #0x00
    ;;call    update_XOR_after_hero_collision
    ;;ld      e_x(ix), #0x00
    ;;ld      e_y(ix), #0xA4
    ret

;;-----------------------------------------------------------------------------------
;; No hay collision
no_collision:
    ;; Comprobamos si la colisión es con una entidad invisible
    ld      a, #e_object_invisible
    and     b
    ret     z 

    ;; Comprobamos si el que colisiona es un hero y no el enemigo
    ld      a, e_object(ix)
    and     #e_object_hero
    ret     z

    ld      a, e_y(ix)
    xor     e_y(iy)
    ret     nz
    
;; Comprobamos si hay una entidad invisible con la que choca el hero en x

    ;;ld__e_iyl
    ;;ld__d_iyh
;;
    ;;ld      hl, #comprobar_invisible_x
    ;;ld      a, #e_object_invisible
    ;;call    man_entity_ladder_invisible_matching
;;
    ;;ld__iyl_e
    ;;ld__iyh_d
;;
    ;;ld      a, e_invisible(ix)
    ;;xor     #e_invisible_collision
    ;;jr      z, hay_otra_invisible_x
;;
    ;;;;ld      e_ladder(ix), #e_ladder_nothing
    ;;;;jr      ladder_misma_y
    ;;jr      no_collision_left_invisible
;;
    ;;ret
;;comprobar_invisible_x:
;;
;;    ld      a, e_x(ix)
;;    sub     #1          ;; Así se comprueba si está al lado
;;    xor     e_x(iy)
;;    jr      z, golpe_invisible
;;
;;    ld      a, e_x(ix)
;;    add     e_w(ix)     ;; Si la colisión es en la derecha se le añade el ancho (width) a la posición del hero
;;    ;;add     #1          ;; Así se comprueba si está al lado
;;    xor     e_x(iy)
;;    jr      z, golpe_invisible
;;    ret   

;;golpe_invisible:
;;
;;    ld      a, e_y(ix)
;;    xor     e_y(iy)
;;    ret     nz  
;;
;;    ld      a, e_invisible(ix)
;;    or      #e_invisible_collision
;;    ld      e_invisible(ix), a
;;    ret

;;hay_otra_invisible_x:
;;
;;    ld      a, e_invisible(ix)
;;    xor     #e_invisible_collision
;;    ret     nz
;;
;;    ld      a, e_invisible(ix)
;;    sub     #e_invisible_collision
;;    ld      e_invisible(ix), a
;;    ret

no_collision_left_invisible:

    ld      a, e_x(ix)
    sub     #2          ;; Así se comprueba si está al lado
    xor     e_x(iy)
    jr      nz, no_collision_right_invisible

    ld      a, e_invisible(ix)
    and     #e_invisible_left
    jr      z, no_collision_right_invisible

    ld      a, e_invisible(ix)
    sub     #e_invisible_left
    ld      e_invisible(ix), a

no_collision_right_invisible:

    ld      a, e_x(ix)
    add     e_w(ix)     ;; Si la colisión es en la derecha se le añade el ancho (width) a la posición del hero
    add     #1          ;; Así se comprueba si está al lado
    xor     e_x(iy)
    ret     nz

    ld      a, e_invisible(ix)
    and     #e_invisible_right
    ret     z

    ld      a, e_invisible(ix)
    sub     #e_invisible_right
    ld      e_invisible(ix), a

    ret

;;-----------------------------------------------------------------------------------
;; Collision con una entidad llave (key)
collision_with_key:
    ;; Se le añade al hero el object key para que así pueda salir por la puerta del nivel
    ld      a, e_object(ix)
    and     #e_object_key
    ret     nz

    ld      a, e_object(ix)
    or      #e_object_key
    ld      e_object(ix), a

    ;; Se hace desaparecer la llave eliminando el e_type_render y e_type_collision (para que no vuelva a colisionar)
    ;;ld      a, e_type(iy)
    ;;and     #e_type_render
    ;;ret     z
;;
    ;;ld      a, e_type(iy)
    ;;sub     #e_type_render
    ;;ld      e_type(iy), a
    ld      e_type(iy), #e_type_none
    call    update_XOR_borrar_IY

    ret

;;-----------------------------------------------------------------------------------
;; Collision con una entidad martillo (hammer)
collision_with_hammer:
;; Comprobamos si la colisión es con el hero
    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, collision_with_hammer_hero

;; El martillo (hammer) golpea al enemigo
collision_with_hammer_enemy:
    ;; Borra y reestablece el martillo (hammer)
    call    update_XOR_borrar_IY
    ld      e_x(iy), #0x02
    ld      e_y(iy), #0x02
    ld      e_vx(iy), #0x00
    ld      a, e_type(iy)
    xor     #e_type_render      ;; También se podría eliminar con sub
    ld      e_type(iy), a

    ;; Borra al enemigo y se le pone e_type_none y e_object_none

    call    update_XOR_borrar_IX
    ld      e_type(ix), #e_type_none
    ld      e_object(ix), #e_object_none

    ret

;; El hero coge el martillo (hammer)
collision_with_hammer_hero:
    ;; Se le añade al hero el object hammer para que así pueda salir por la puerta del nivel (solo si no lo tiene añadido ya)
    ld      a, e_object(ix)
    and     #e_object_hammer
    ret     nz

    ld      a, e_object(ix)
    or      #e_object_hammer
    ld      e_object(ix), a

    ;; Se convierte el martillo (hammer) en un e_object_none
    ld      e_object(iy), #e_object_none

    ;; Se hace desaparecer el martillo (hammer) eliminando el e_type_render
    ld      e_type(iy), #e_type_none
    call    update_XOR_borrar_IY

    ret

;;-----------------------------------------------------------------------------------
;; Collision con una entidad puerta (door)
collision_with_door:
;; Comprobamos que el hero tiene la llave (key)
    ld      a, e_object(ix)
    and     #e_object_key
    ret     z

;; Comprobamos que la X sea igual para que estén en la misma posición
    ld      a, e_x(ix)
    xor     e_x(iy)
    jp      nz, no_collision

;; Comprobamos que la Y sea igual para que estén en la misma posición
    ld      a, e_y(ix)
    xor     e_y(iy)
    jp      nz, no_collision

;; Si llega AQUI es que ha entrado por la puerta y pasado de nivel

    ld      a, (num_level)
    sub     #20
    jr      z, call_finish_game

    call    man_menu_level_completed
    
    ret

call_finish_game:
    call    man_menu_finish
    ret

;;-----------------------------------------------------------------------------------
;; Collision con una entidad escalera (ladder)
collision_with_ladder:
;; Comprobamos que la X sea igual para que estén en la misma posición
    ld      a, e_x(ix)
    xor     e_x(iy)
    jr      nz, no_collision_ladder

;; Comprobamos si el hero está en IX o en IY
    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, hero_move_up_down_ix

hero_move_up_down_ix:
    ld      a, e_ladder(ix)
    or      #e_ladder_up
    or      #e_ladder_down
    ld      e_ladder(ix), a
    jr      comprobar_ladder_y_up


;; Hacemos comprobaciones en la Y para evitar que suba más de la escalera y baje más de la misma
comprobar_ladder_y_up:

    ld      a, e_y(iy)
    sub     e_h(iy)
    ;sub     e_h(ix)
    ld      b, e_y(ix)   
    sub     b
    jp      nc, no_collision_ladder_up

    ld      a, e_y(iy)
    add     #0x01
    ld      b, a
    ld      a, e_y(ix)
    sub     b
    jp      nc, no_collision_ladder_up
    
    ;;ret

comprobar_ladder_y_down:
    ld      a, e_y(iy)
    ld      b, a  
    ld      a, e_y(ix)
    sub     b
    jp      nc, no_collision_ladder_down

    ret

;;-----------------------------------------------------------------------------------
;; No hay collision con ladder
no_collision_ladder:

    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, no_collision_ladder_ix

no_collision_ladder_ix:

    ld      a, e_y(ix)
    xor     e_y(iy)
    jr      nz, no_down_without_more_ladders

;; Comprobamos si hay escaleras en la misma x

    ld__e_iyl
    ld__d_iyh

    ld      hl, #comprobar_otras_x
    ld      a, #e_object_ladder
    call    man_entity_ladder_invisible_matching

    ld__iyl_e
    ld__iyh_d

    ld      a, e_ladder(ix)
    xor     #e_ladder_dentro
    jr      z, permitir_bajar

    jr      ladder_misma_y

    ret

comprobar_otras_x:
    ld      a, e_x(ix)
    xor     e_x(iy)
    ret     nz

    ld      a, e_y(ix)
    xor     #0xA4
    ret     z

    ;; Conprobamos que tenga debajo una escalera
    ld      a, e_y(ix)
    add     e_h(iy)
    sub     e_y(iy)
    ret     nz

    ld      e_ladder(ix), #e_ladder_dentro
    ret

permitir_bajar:

    ld      e_ladder(ix), #e_ladder_down
    ret

;; Comprobamos si hay escaleras en la misma y
ladder_misma_y:

    ld__e_iyl
    ld__d_iyh

    ld      hl, #comprobar_otras_y
    ld      a, #e_object_ladder
    call    man_entity_ladder_invisible_matching

    ld__iyl_e
    ld__iyh_d

    ld      a, e_ladder(ix)
    xor     #e_ladder_dentro
    jr      z, permitir_subir

    ld      e_ladder(ix), #e_ladder_nothing

    ret

comprobar_otras_y:
    ld      a, e_y(ix)
    xor     e_y(iy)
    ret     nz

    ld      a, e_x(ix)
    xor     e_x(iy)
    ret     nz

    ld      e_ladder(ix), #e_ladder_dentro
    ret

permitir_subir:

    ld      e_ladder(ix), #e_ladder_up
    ret

no_down_without_more_ladders:

;; Comprobamos si hay escaleras en la misma x

    ld__e_iyl
    ld__d_iyh

    ld      hl, #comprobar_mas_x
    ld      a, #e_object_ladder
    call    man_entity_ladder_invisible_matching

    ld__iyl_e
    ld__iyh_d

    ld      a, e_ladder(ix)
    and     #e_ladder_dentro
    jr      nz, permitir_bajar_mas_x

    ;;ld      e_ladder(ix), #e_ladder_nothing
    jr      no_more_ladders_x

    ret

comprobar_mas_x:
    ld      a, e_x(ix)
    xor     e_x(iy)
    ret     nz

    ld      a, e_y(ix)
    xor     #0xA4
    ret     z

    ;; Conprobamos que tenga debajo una escalera
    ld      a, e_y(ix)
    add     e_h(iy)
    sub     e_y(iy)
    ret     nz

    ld      a, e_ladder(ix)
    or      #e_ladder_dentro
    ld      e_ladder(ix), a
    ret

permitir_bajar_mas_x:

    ld      a, e_ladder(ix)
    sub     #e_ladder_dentro
    ld      e_ladder(ix), a

    ld      a, e_ladder(ix)
    or      #e_ladder_down
    ld      e_ladder(ix), a

    ret

no_more_ladders_x:

    ld      a, e_y(iy)
    sub     e_h(iy)
    ld      b, a
    ld      a, e_y(ix)
    xor     b
    ret     nz

    ;;ld      e_ladder(ix), #e_ladder_nothing

    ld      a, e_ladder(ix)
    and     #e_ladder_down
    ret     z

    ld      a, e_ladder(ix)
    sub     #e_ladder_down
    ld      e_ladder(ix), a

    ret

;;-----------------------------------------------------------------------------------
;; Encima de la escalera, para evitar que siga subiendo
no_collision_ladder_up:

    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, no_collision_ladder_up_ix

no_collision_ladder_up_ix:

    ld      a, e_ladder(ix)
    and     #e_ladder_up
    jp      z, comprobar_ladder_y_down
    ld      a, e_ladder(ix)
    sub     #e_ladder_up
    ld      e_ladder(ix), a
    jp      comprobar_ladder_y_down
    ret

;;-----------------------------------------------------------------------------------
;; Debajo de la escalera, para evitar atraviese el suelo bajando
no_collision_ladder_down:

    ld      a, e_object(ix)
    and     #e_object_hero
    jr      nz, no_collision_ladder_down_ix

no_collision_ladder_down_ix:

    ld      a, e_ladder(ix)
    and     #e_ladder_down
    ret     z
    ld      a, e_ladder(ix)
    sub     #e_ladder_down
    ld      e_ladder(ix), a
    ret

