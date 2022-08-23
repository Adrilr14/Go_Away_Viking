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

.module Entity_Manager

;; Sprites
.globl _viking_sp_0
.globl _viking_sp_1
.globl _viking_sp_2
.globl _enemy_sp_0
.globl _enemy_sp_1
.globl _enemy_sp_2
.globl _key_sp
.globl _hammer_sp
.globl _hammer_lado_sp_0
.globl _hammer_lado_sp_1
.globl _invisible_sp

;;Entities

num_entities_l1 = 3
num_entities_l2 = 7
num_entities_l3 = 10
num_entities_l4 = 8
num_entities_l5 = 12
num_entities_l6 = 8
num_entities_l7 = 12
num_entities_l8 = 12
num_entities_l9 = 12
num_entities_l10 = 17
num_entities_l11 = 11
num_entities_l12 = 12
num_entities_l13 = 11
num_entities_l14 = 16
num_entities_l15 = 17
num_entities_l16 = 14
num_entities_l17 = 22
num_entities_l18 = 21
num_entities_l19 = 16
num_entities_l20 = 18

e_type              = 0
e_object            = 1
e_x                 = 2
e_y                 = 3
e_vx                = 4
e_vy                = 5
e_w                 = 6
e_h                 = 7
e_collisionable     = 8
e_ladder            = 9
e_invisible         = 10
e_frame             = 11  
e_ai_aim_x          = 12
e_ai_aim_y          = 13 
e_ai_st             = 14
e_ai_pre_st         = 15
e_ai_patrol_step_l  = 16
e_ai_patrol_step_h  = 17
e_sprite            = 18

;;Entity info


sizeof_e    = 20
max_entities = 22
;;BIt for individual testing
e_type_alive_bit = 7

;; BIT TYPE (MASKS)

e_type_invalid                          = 0x00
e_type_input                            = 0x01
e_type_physics                          = 0x02
e_type_render                           = 0x04
e_type_collision                        = 0x08
e_type_ai                               = 0x10
e_type_none                             = 0x20


;; OBJECT TYPE (MASKS)

e_object_none                           = 0x00
e_object_hero                           = 0x01
e_object_enemy                          = 0x02
e_object_ladder                         = 0x04
e_object_door                           = 0x08
e_object_invisible                      = 0x10
e_object_hammer                         = 0x20
e_object_key                            = 0x40

;; LADDER TYPE (MASKS)

e_ladder_nothing                        = 0x00
e_ladder_up                             = 0x01
e_ladder_down                           = 0x02
e_ladder_dentro                         = 0x04

;; MASKS FOR INVISIBLE ENTITIES
e_invisible_nothing            = 0x00
e_invisible_left               = 0x01
e_invisible_right              = 0x02
e_invisible_collision          = 0x04

;; MASKS ENTITY AI STATUS
e_ai_st_noAI        = 0x00
e_ai_st_stand_by    = 0x01
e_ai_st_move_to     = 0x02
e_ai_st_patrol      = 0x04

;; MASKS FRAME
e_frame_inactivo      = 0x01
e_frame_activo        = 0xFF

;; TYPE (MASKS)

e_type_alive = (1 << e_type_alive_bit)
e_type_default = 0xFF
e_type_dead = 0x80


;;Public Functions
.globl man_entity_getEntityVector_IX
.globl man_entity_getEntity_hero_IY
.globl man_entity_init
.globl man_entity_create
.globl man_entity_destroy
.globl man_entity_forall
.globl man_entity_forall_matching
.globl man_entity_forall_pairs_matching
.globl man_entity_ladder_invisible_matching
