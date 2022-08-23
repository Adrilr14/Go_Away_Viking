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
.module Physics_System

;; PUBLIC FUNCTIONS
.globl sys_physics_update

.globl entity_moveKeyboard
.globl entity_enemy_move
.globl entity_nothing

.globl entity_move
.globl move_enemy
.globl move_hammer

