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
;;PATROL MANAGER
;;

;; CONSTANTS
patrol_invalid_move_x = -1

;; PUBLIC FUNCTIONS
.globl man_patrol_init

;; PATROLS
.globl _patrol_l2_01
.globl _patrol_l3_01
.globl _patrol_l3_02
.globl _patrol_l4_01
.globl _patrol_l5_01
.globl _patrol_l5_02
.globl _patrol_l7_01
.globl _patrol_l7_02
.globl _patrol_l8_01
.globl _patrol_l8_02
.globl _patrol_l9_01
.globl _patrol_l9_02
.globl _patrol_l10_01
.globl _patrol_l10_02
.globl _patrol_l10_03
.globl _patrol_l11_01
.globl _patrol_l11_02
.globl _patrol_l12_01
.globl _patrol_l12_02
.globl _patrol_l13_01
.globl _patrol_l13_02
.globl _patrol_l14_01
.globl _patrol_l14_02
.globl _patrol_l15_01
.globl _patrol_l15_02
.globl _patrol_l16_01
.globl _patrol_l16_02
.globl _patrol_l17_01
.globl _patrol_l17_02
.globl _patrol_l17_03
.globl _patrol_l18_01
.globl _patrol_l18_02
.globl _patrol_l18_03
.globl _patrol_l19_01
.globl _patrol_l19_02
.globl _patrol_l19_03
.globl _patrol_l20_01
.globl _patrol_l20_02
.globl _patrol_l20_03
