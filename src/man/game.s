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
.include "sys/render.h.s"
.include "sys/physics.h.s"
.include "sys/collision.h.s"
.include "man/entity.h.s"
.include "man/levels.h.s"
.include "man/menu.h.s"
.include "man/patrol.h.s"
.include "man/interrupt.h.s"
.include "sys/ai_control.h.s"


;;

.area _DATA
.area _CODE

_invisible_sp::
	.db	0x0F


;;------------------------------------------------------------------------------------------------------
;; ----------------------DECLARATION OF ENTITIES-------------------------------
;;------------------------------------------------------------------------------------------------------



;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 1
entities_level1::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x24, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x04, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 2
entities_level2::

;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x49, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x30, 0xA4, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l2_01, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x1E, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1E, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x21, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x45, 0x68, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x3C, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 3
entities_level3::

;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0x68, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x39, 0xA4, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l3_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x68, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l3_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x0E, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0E, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x20, 0x2C, 0, 0, 1, 16
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x1D, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x45, 0x2C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x2A, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 4
entities_level4::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x25, 0x68, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x39, 0x68, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l4_01, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x10, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x06, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x1D, 0xA4, 0, 0, 1, 16
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x28, 0xA4, 0, 0, 1, 16
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 5
entities_level5::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1A, 0x68, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l5_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x68, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l5_02, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x1A, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x06, 0x68, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x2E, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x28, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x0C, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp


;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x43, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x2C, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0A, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x2F, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 6
entities_level6::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x01, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_render|e_type_collision, e_object_enemy, 0x37, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw 0x0000, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x43, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x06, 0x68, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x1B, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp


;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x20, 0xA4 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 7
entities_level7::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x14, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x37, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l7_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x37, 0x7C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l7_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x37, 0x7C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x45, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x24, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x06, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp


;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x04, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x21, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x22, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x15, 0x68 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 8
entities_level8::

;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x01, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
;; Dirección de memoria del patrol
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0xA4, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, 0x01	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l8_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x10, 0x68, 0, 0, 6, 16 
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l8_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Invisible entities
.db e_type_collision, e_object_invisible, 0x35, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x42, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x11, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI	
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x3C, 0x6B, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x45, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x2F , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x0C, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1C, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 9
entities_level9::

;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x39, 0x2C, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
;; Dirección de memoria del patrol
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x04, 0xA4, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l9_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x34, 0x68, 0, 0, 6, 16 
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l9_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Invisible entities
.db e_type_collision, e_object_invisible, 0x25, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x47, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x18, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI	
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x03, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x07, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x2F , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x1E, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x40, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 10
entities_level10::

;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
;; Dirección de memoria del patrol
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x2C, 0, 0, 6, 16 
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, 0x01	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l10_03, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x41, 0xA4, 0, 0, 6, 16
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l10_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x30, 0x68, 0, 0, 6, 16 
.db e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l10_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Invisible entities
.db e_type_collision, e_object_invisible, 0x12, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI	
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x3D, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x06, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x47, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI	
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x25, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x2A, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x3A, 0x2C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer,0x0E, 0xA4 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x36, 0xA4, 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x24, 0x68, 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 11
entities_level11::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x27, 0xA4, 1, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l11_01, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0xA4, 1, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l11_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x06, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x08, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x3A, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp


;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x38, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1B, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x45, 0x68 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 12
entities_level12::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2D, 0x68, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l12_02, _enemy_sp_0

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l12_01, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x45, 0x2C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x1A, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x32, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp


;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x39, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x18, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x30, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x29, 0x68 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 13
entities_level13::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2F, 0x2C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l13_01, _enemy_sp_1
 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1D, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l13_02, _enemy_sp_0

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x26, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x27, 0x2C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x10, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x3A, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x02, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x48, 0x68 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x2E, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x21, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 14
entities_level14::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0x68, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l14_01, _enemy_sp_1
 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0x40, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l14_02, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x3D, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x2D, 0x68, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x0C, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1E, 0x68 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x3A, 0x68 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x39, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0A, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x13, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1C, 0x40, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x41, 0x40, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x0D, 0x68 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0



;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 15
entities_level15::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x04, 0x18, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l15_02, _enemy_sp_1
 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0x40, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l15_01, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x15, 0x7C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x39, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x22, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1C, 0x40 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x36, 0x68 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x0A, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x29, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x34, 0x68, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1A, 0x40, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x3D, 0x40, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x23, 0x18, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x24, 0x40 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 16
entities_level16::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x40, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0x68, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l16_01, _enemy_sp_1
 
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x09, 0x40, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l16_02, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x25, 0x18, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x0A, 0x18, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x02, 0x40 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1E, 0x68 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x2F, 0x40, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x38, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x31, 0x18, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x40 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

.db e_type_render|e_type_collision, e_object_hammer, 0x3F, 0x68 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp
;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0



;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 17
entities_level17::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x10, 0x18, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2A, 0x54, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l17_01, _enemy_sp_1


.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x34, 0x7C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l17_03, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x17, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l17_02, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x43, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x21, 0xA4, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x0A, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x26, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x38, 0xA4, 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1A, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x30, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x06, 0x54 , 0, 0, 6, 60
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x23, 0x18, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;.db e_type_collision, e_object_invisible, 0x04, 0x68, 0, 0, 1, 1
;;.db e_object_none
;;.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
;;.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
;;.db 0, 0
;;.db e_ai_st_noAI, e_ai_st_noAI
;;.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x08, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x21, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x24, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x3F, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x08, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x2D, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x36, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x11, 0x54 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp


;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 18
entities_level18::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x36, 0x2C, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x17, 0x2C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l18_01, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x14, 0x54, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l18_02, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2C, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l18_03, _enemy_sp_1
;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x26, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x3D, 0x7C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x16, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x02, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x24, 0x54, 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp
;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x0E, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x41, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1D, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x32, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x47, 0x54, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x39, 0x54, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0C, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x41, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp
;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x11, 0x7C , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

.db e_type_render|e_type_collision, e_object_hammer, 0x31, 0x54 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp
;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 19
entities_level19::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x1E, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_0

;;------------------------------------------------------------------------------------------------------
;; Enemies	

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x010, 0x54, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l19_01, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1E, 0x7C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l19_02, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x45, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l19_03, _enemy_sp_1

;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x35, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x06, 0x54, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x2C, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x1E, 0x54 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x18, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0E, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x3F, 0x54, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0A, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x45, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer
.db e_type_render|e_type_collision, e_object_hammer, 0x3C, 0x54 , 0, 0, 2, 12
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_sp

;;------------------------------------------------------------------------------------------------------
;; Hammer (throw)
.db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _hammer_lado_sp_0


;;------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------
;; Entities level 20
entities_level20::
;;------------------------------------------------------------------------------------------------------
;; Hero
.db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x38, 0xA4, 0, 0, 6, 16
.db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _viking_sp_1

;;------------------------------------------------------------------------------------------------------
;; Enemies	
.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x21, 0x7C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l20_01, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2E, 0x7C, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l20_02, _enemy_sp_1

.db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x12, 0xA4, 0, 0, 6, 16
.db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
.db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_stand_by, e_ai_st_stand_by
.dw _patrol_l20_03, _enemy_sp_1
;;------------------------------------------------------------------------------------------------------
;; Door
.db e_type_collision, e_object_door, 0x39, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

;;------------------------------------------------------------------------------------------------------
;; Key
.db e_type_render|e_type_collision, e_object_key, 0x1F, 0x2C, 0, 0, 2, 8
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _key_sp

;;------------------------------------------------------------------------------------------------------
;; Ladders
.db e_type_collision, e_object_ladder, 0x26, 0xA4 , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x18, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x3C, 0x7C , 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_ladder, 0x28, 0x54, 0, 0, 6, 40
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp
;;------------------------------------------------------------------------------------------------------
;;Invisible entities
.db e_type_collision, e_object_invisible, 0x0C, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x45, 0xA4, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0C, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x45, 0x7C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x0C, 0x54, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x45, 0x54, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x1C, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.db e_type_collision, e_object_invisible, 0x45, 0x2C, 0, 0, 1, 1
.db e_object_none
.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
.db 0, 0
.db e_ai_st_noAI, e_ai_st_noAI
.dw 0x0000, _invisible_sp

.dw 0x0000, _hammer_lado_sp_0
;;------------------------------------------------------------------------------------------------------
;; ----------------------INIT2-------------------------------
;;------------------------------------------------------------------------------------------------------
reset::

	call 	man_entity_destroy
	call 	man_menu_init

ret

man_game_init2::

	call    man_entity_init
    call    man_entity_getEntityVector_IX
	call    sys_render_init
	call    man_level_init

    call  man_level_render

    ld      a, (num_level)
    cp      #2
    jr      z, create_entities_l2

    cp      #3
    jr      z, create_entities_l3

    cp      #4
    jr      z, create_entities_l4

    cp      #5
    jr      z, create_entities_l5

    cp      #6
    jr      z, create_entities_l6

    cp      #7
    jr      z, create_entities_l7

    cp      #8
    jr      z, create_entities_l8

    cp      #9
    jr      z, create_entities_l9

    cp      #10
    jr      z, create_entities_l10

    cp      #11
    jp      z, create_entities_l11

    cp      #12
    jp      z, create_entities_l12

    cp      #13
    jp      z, create_entities_l13

    cp      #14
    jp      z, create_entities_l14

    cp      #15
    jp      z, create_entities_l15

    cp      #16
    jp      z, create_entities_l16

    cp      #17
    jp      z, create_entities_l17

    cp      #18
    jp      z, create_entities_l18

    cp      #19
    jp      z, create_entities_l19

    cp      #20
    jp      z, create_entities_l20

create_entities_l1:
    ld      hl, #entities_level1
    call    man_entity_create
    jp      man_game_update

create_entities_l2:
    ld      hl, #entities_level2
    call    man_entity_create
    jp      man_game_update

create_entities_l3:
    ld      hl, #entities_level3
    call    man_entity_create
    jp      man_game_update

create_entities_l4:
    ld      hl, #entities_level4
    call    man_entity_create
    jp      man_game_update

create_entities_l5:
    ld      hl, #entities_level5
    call    man_entity_create
    jr      man_game_update

create_entities_l6:
    ld      hl, #entities_level6
    call    man_entity_create
    jr      man_game_update

create_entities_l7:
    ld      hl, #entities_level7
    call    man_entity_create
    jr      man_game_update

create_entities_l8:
    ld      hl, #entities_level8
    call    man_entity_create
    jr      man_game_update

create_entities_l9:
    ld      hl, #entities_level9
    call    man_entity_create
    jr      man_game_update

create_entities_l10:
    ld      hl, #entities_level10
    call    man_entity_create
    jr      man_game_update

create_entities_l11:
    ld      hl, #entities_level11
    call    man_entity_create
    jr      man_game_update

create_entities_l12:
    ld      hl, #entities_level12
    call    man_entity_create
    jr      man_game_update

create_entities_l13:
    ld      hl, #entities_level13
    call    man_entity_create
    jr      man_game_update

create_entities_l14:
    ld      hl, #entities_level14
    call    man_entity_create
    jr      man_game_update

create_entities_l15:
    ld      hl, #entities_level15
    call    man_entity_create
    jr      man_game_update

create_entities_l16:
    ld      hl, #entities_level16
    call    man_entity_create
    jr      man_game_update

create_entities_l17:
    ld      hl, #entities_level17
    call    man_entity_create
    jr      man_game_update

create_entities_l18:
    ld      hl, #entities_level18
    call    man_entity_create
    jr      man_game_update

create_entities_l19:
    ld      hl, #entities_level19
    call    man_entity_create
    jr      man_game_update

create_entities_l20:
    ld      hl, #entities_level20
    call    man_entity_create
    jr      man_game_update

man_game_update::

loop:

find_interrupt1:
    ld    a, (man_ir_num_interrupt)
    cp    #1
    jr    nz, find_interrupt1

	ld    	hl, #sys_ai_control_update
	ld		 a, #e_type_ai			;; Se envía en A el tipo que queramos usar
	call  	man_entity_forall_matching

    ld 		hl, #sys_collision_update
	ld		 a, #e_type_collision	;; Se envía en A el tipo que queramos usar
	call  	man_entity_forall_pairs_matching
	

find_interrupt2:
    ld    a, (man_ir_num_interrupt)
    cp    #6
    jr    nz, find_interrupt2

    ld    	hl, #sys_physics_update
	ld		 a, #e_type_physics		;; Se envía en A el tipo que queramos usar
	call  	man_entity_forall_matching

	ld    	hl, #sys_render_update  ;;y se los mando al render
	ld		 a, #e_type_render		;; Se envía en A el tipo que queramos usar
	call  	man_entity_forall_matching
	

    ;;call    cpct_scanKeyboard_f_asm
    ld      hl, #Key_Esc
    call    cpct_isKeyPressed_asm
    jp      nz, reset

jr  loop
