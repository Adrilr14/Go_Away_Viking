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
;; LEVELS MANAGER
;;
.module Levels_Manager

;; PUBLIC FUNCTIONS
.globl man_level_add
.globl man_level_reset
.globl man_level_init
.globl man_level_render

;; TILESET
.globl _tilesProt
.globl _tilesProt2
.globl _tilesPrince

;; CONSTANTS
.globl _level1
.globl _level1_end
.globl _level2
.globl _level2_end
.globl _level3
.globl _level3_end
.globl _level4
.globl _level4_end
.globl _level5
.globl _level5_end
.globl _level6
.globl _level6_end
.globl _level7
.globl _level7_end
.globl _level8
.globl _level8_end
.globl _level9
.globl _level9_end
.globl _level10
.globl _level10_end
.globl _level11
.globl _level11_end
.globl _level12
.globl _level12_end
.globl _level13
.globl _level13_end
.globl _level14
.globl _level14_end
.globl _level15
.globl _level15_end
.globl _level16
.globl _level16_end
.globl _level17
.globl _level17_end
.globl _level18
.globl _level18_end
.globl _level19
.globl _level19_end
.globl _level20
.globl _level20_end

;; ---------------------------------------------------
;; LEVEL MAP
;; ---------------------------------------------------
man_level_map_w = 40
man_level_map_h = 50
man_level_map_size = man_level_map_w * man_level_map_h

.globl  num_level
