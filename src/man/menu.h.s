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

.globl man_menu_init
.globl man_menu_run
.globl _myDrawStringM0
.globl man_menu_lose
;;.globl man_menu_restart
.globl man_menu_level_completed
.globl man_menu_continue
.globl man_menu_controls
.globl man_menu_credits
.globl man_menu_finish
;;.globl man_pulsar_controls
;;.globl man_pulsar_credits

.globl _screenmenu_c_end

;;.macro DefineNEntities _name, _n
;;    _c = 0
;;    .rept _n
;;        DefineEntityDefault _name, \_c 
;;        _c = _c +1
;;    .endm
;;.endm

;;.macro DefineNEntities _name
;;    _n = _n + 1
;;    _name'_n
;;.endm