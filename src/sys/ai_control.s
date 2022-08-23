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
.include "sys/render.h.s"
.include "man/entity.h.s"
.include "sys/ai_control.h.s"
.include "man/patrol.h.s"

.module sys_ai_control

;; INITS THE AI-CONTROL SYSTEM

sys_ai_control_init::
;;; TODO REMOVE TEMPORAL
    ;;ld      (_ent_array_otr_temp_standby), ix
    ;;ld      (m_first_entity_free), ix

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;SYS AI CONTROL:: Update
;; Updates all AI entities
;;INPUT
;;  IX; Pointer to the entity array
;;  A: Number of elements in the array
;;DESTROYS: AF, BC, DE, IX
;;STACK USE: 2 bytes
;;
sys_ai_control_update::

    ld      a, e_ai_st(ix)
    cp      #e_ai_st_noAI
    jr      z,_no_AI_ent

_AI_ent:

    cp      #e_ai_st_stand_by
    call    z, sys_ai_stand_by
    cp      #e_ai_st_move_to
    call    z, sys_ai_move_to
    cp      #e_ai_st_patrol
    call    z, sys_ai_patrol

_no_AI_ent:

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;======================================================
;;===========BEHAVIOURS========================
;;======================================================


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;SYS AI CONTROL::stand_by
;;  An entity waiting for an event occur
;;INPUT
;;  IX: = Pointer to the entity
;;DESTROYS; AF, IY
;;

sys_ai_stand_by::

    ;; Guardamos el hero en IY
    call    man_entity_getEntity_hero_IY

    ld      e_ai_pre_st(ix), #e_ai_st_stand_by      ;; El enemigo utiliza e_ai_pre_st para guardar el estado anterior
    ld      e_ai_st(ix), #e_ai_st_patrol

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;SYS AI CONTROL::move_to
;;  The entity changes its velocity to move
;;      to an X, Y location (e_ai_aim_x, e_ai_aim_y )
;;INPUT
;;  IX: = Pointer to the entity
;;DESTROYS; AF, IY
;;

sys_ai_move_to::
    ;;ld      e_vy(ix), #0

;;UPDATE X
    ;;ld      c, #0
    ld      a, e_ai_aim_x(ix)   ;; A = x_objetivo
    sub     e_x(ix)             ;; A = obj_x - x
    jr      nc, _objx_greater_or_equal    ;; if (obj_x - x > 0)

_objx_lesser:
    ld      e_vx(ix), #-1
    jr      _endif_x

_objx_greater_or_equal:
    jr      z, _arrived_x
    ld      e_vx(ix), #1
    jr      _endif_x

_arrived_x:

    ld      e_vx(ix), #0

_endif_x:
;;UPDATE Y
    ld      a, e_ai_aim_y(ix)   ;; A = y_objetivo
    sub     e_y(ix)             ;; A = obj_y - y
    jr      nc, _objy_greater_or_equal    ;; if (obj_y - y > 0)

_objy_lesser:
    ld      e_vy(ix), #-2
    jr      _endif_y

_objy_greater_or_equal:
    jr      z, _arrived_y
    ld      e_vy(ix), #2
    jr      _endif_y

_arrived_y:
    ld      e_vy(ix), #0
    ld      a, e_vx(ix)
    or      a 
    jr      nz, _endif_y
    ;; X and Y are both 0
    ld      a, e_ai_pre_st(ix)
    ld      e_ai_st(ix), a
    ld      e_ai_pre_st(ix), #e_ai_st_move_to
_endif_y:
    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;SYS AI CONTROL::patrol

;;INPUT
;;  IX: = Pointer to the entity
;;DESTROYS; AF, IY
;;

sys_ai_patrol::
    ;;HL Points to next (X,Y) AI patrol step. AQUI LO LEO
    ld      l, e_ai_patrol_step_l(ix)
    ld      h, e_ai_patrol_step_h(ix) ;;con esto tendria en hl el puntero que me he guardado

    ;;COMPROBAR X != -1
    ld      a, (hl)
    cp      #patrol_invalid_move_x
    jr      z, _reset_patrol

    ;;Set AI-AIM(X,Y)
    ld      a, (hl) ;; A  = x
    ld      e_ai_aim_x(ix), a
    
    inc     hl                  ;;Point to y
    ld      a, (hl) ;; A  = x
    ld      e_ai_aim_y(ix), a

    ;;SET e ai patrol_step + 1. AQUI ACTUALIZO HL SUMANDO UNO
    inc     hl
    ld      e_ai_patrol_step_l(ix), l
    ld      e_ai_patrol_step_h(ix), h

    ;;CHANGE TO move to
    ld      e_ai_pre_st(ix), #e_ai_st_patrol       ;; El enemigo utiliza e_ai_pre_st para guardar el estado anterior
    ld      e_ai_st(ix), #e_ai_st_move_to

    ret

_reset_patrol:
    ;;GET Next 2 bytes pointed by HL, which point to the start of the patrol
    inc     hl
    ld      a, (hl)
    inc     hl 
    ld      h, (hl)

    ;;Reset patrol_step
    ld      e_ai_patrol_step_l(ix), a
    ld      e_ai_patrol_step_h(ix), h 
ret

