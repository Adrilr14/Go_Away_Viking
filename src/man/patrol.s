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

.include "man/patrol.h.s"
;;
;;PATROL MANAGER
;;
_patrol_l2_01::
    .db     0x20, 0xA4
    .db     0x42, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l2_01

_patrol_l3_01::
    .db     0x0F, 0xA4
    .db     0x40, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l3_01

_patrol_l3_02::
    .db     0x0F, 0x68
    .db     0x33, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l3_02

_patrol_l4_01::
    .db     0x45, 0x68
    .db     0x0F,0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l4_01  

_patrol_l5_01::
    .db     0x1A, 0x68
    .db     0x0A, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l5_01 

_patrol_l5_02::
    .db     0x20, 0x68
    .db     0x39, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l5_02

_patrol_l7_01::
    .db     0x3E, 0xA4
    .db     0x1E, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l7_01

_patrol_l7_02::
    .db     0x27,0x7C
    .db     0x49, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l7_02 

_patrol_l8_01::
    .db     0x0A, 0xA4
    .db     0x2F, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l8_01

_patrol_l8_02::
    .db     0x34, 0x68
    .db     0x03, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l8_02

_patrol_l9_01::
    .db     0x1A, 0xA4
    .db     0x04, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l9_01

_patrol_l9_02::
    .db     0x03, 0x68
    .db     0x39, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l9_02

_patrol_l10_01::
    .db     0x2C, 0xA4
    .db     0x49, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l10_01

_patrol_l10_02::
    .db     0x16, 0x68
    .db     0x39, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l10_02

_patrol_l10_03::
    .db     0x09, 0x2C
    .db     0x2A, 0x2C
    .db     patrol_invalid_move_x
    .dw     _patrol_l10_03

_patrol_l11_01::
    .db     0x3A, 0xA4
    .db     0x29, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l11_01

_patrol_l11_02::
    .db     0x14, 0xA4
    .db     0x14, 0x68
    .db     0x10, 0x68
    .db     0x14, 0x68
    .db     0x14, 0xA4
    .db     0x20, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l11_02

_patrol_l12_01::
    .db     0x28, 0xA4
    .db     0x1A, 0xA4
    .db     0x1A, 0x68
    .db     0x21, 0x68
    .db     0x1A, 0x68
    .db     0x1A, 0xA4
    .db     0x28, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l12_01

_patrol_l12_02::
    .db     0x2D, 0x68
    .db     0x32, 0x68
    .db     0x32, 0x2C
    .db     0x3E, 0x2C
    .db     0x32, 0x2C
    .db     0x32, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l12_02_1
_patrol_l12_02_1:
    .db     0x32, 0x68
    .db     0x2D, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l12_02

_patrol_l13_01::
    .db     0x2F, 0x2C
    .db     0x48, 0x2C
    .db     0x48, 0x68
    .db     0x30, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l13_01_1
_patrol_l13_01_1:
    .db     0x30, 0x68
    .db     0x3A, 0x68
    .db     0x3A, 0xA4
    .db     0x40, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l13_01_2
_patrol_l13_01_2:
    .db     0x40, 0xA4
    .db     0x2F, 0xA4
    .db     0x3A, 0xA4
    .db     0x3A, 0x68
    .db     0x48, 0x68
    .db     0x48, 0x2C
    .db     0x2F, 0x2C
    .db     patrol_invalid_move_x
    .dw     _patrol_l13_01

_patrol_l13_02::
    .db     0x1D, 0xA4
    .db     0x10, 0xA4
    .db     0x10, 0x68
    .db     0x1A, 0x68
    .db     0x02, 0x68
    .db     0x02, 0x2C
    .db     0x1D, 0x2C
    .db     0x02, 0x2C
    .db     0x02, 0x68
    .db     0x10, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l13_02_1
_patrol_l13_02_1:
    .db     0x10, 0x68    
    .db     0x10, 0xA4
    .db     0x1D, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l13_02

_patrol_l14_02::
    .db     0x3A, 0x40
    .db     0x3A, 0x68
    .db     0x30, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_02_5
_patrol_l14_02_5:
    .db     0x30, 0x68
    .db     0x48, 0x68
    .db     0x48, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_02_1
_patrol_l14_02_1:
    .db     0x48, 0xA4
    .db     0x40, 0xA4
    .db     0x48, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_02_2
_patrol_l14_02_2:
    .db     0x48, 0xA4
    .db     0x48, 0x68
    .db     0x48, 0x68
    .db     0x3A, 0x68
    .db     0x3A, 0x40
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_02_03
_patrol_l14_02_03:
    .db     0x3A, 0x40
    .db     0x2E, 0x40
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_02
_patrol_l14_01::
    .db     0x1E, 0x68
    .db     0x1E, 0x40
    .db     0x2A, 0x40
    .db     0x1E, 0x40
    .db     0x1E, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_01_1
_patrol_l14_01_1:
    .db     0x1E, 0x68
    .db     0x28, 0x68
    .db     0x11, 0x68
    .db     0x1E, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l14_01

_patrol_l15_01::
    .db     0x36, 0x40
    .db     0x36, 0x68
    .db     0x48, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_01_1
_patrol_l15_01_1:
    .db     0x48, 0x68
    .db     0x48, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_01_2
_patrol_l15_01_2:
    .db     0x48, 0xA4
    .db     0x3E, 0xA4
    .db     0x48, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_01_3
_patrol_l15_01_3:
    .db     0x48, 0xA4
    .db     0x48, 0x68
    .db     0x36, 0x68
    .db     0x36, 0x40
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_01_4
_patrol_l15_01_4:
    .db     0x36, 0x40
    .db     0x2E, 0x40
    .db     0x36, 0x40
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_01

_patrol_l15_02::
    .db     0x15, 0xA4
    .db     0x33, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l15_02

_patrol_l16_01::
    .db     0x09, 0x68
    .db     0x36, 0x68
    .db     patrol_invalid_move_x
    .dw     _patrol_l16_01

_patrol_l16_02::
    .db     0x10, 0x40
    .db     0x1E, 0x40
    .db     patrol_invalid_move_x
    .dw     _patrol_l16_02

_patrol_l17_01::
    .db     0x45, 0x54
    .db     0x15, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_01

_patrol_l17_02::
    .db     0x0A, 0xA4
    .db     0x0A, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_02_01
_patrol_l17_02_01:
    .db     0x0A, 0x7C
    .db     0x18, 0x7C
    .db     0x0A, 0x7C
    .db     0x0A, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_02_02
_patrol_l17_02_02:
    .db     0x0A, 0xA4
    .db     0x17, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_02

_patrol_l17_03::
    .db     0x38, 0x7C
    .db     0x38, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_03_01
_patrol_l17_03_01:
    .db     0x38, 0xA4
    .db     0x42, 0xA4
    .db     0x38, 0xA4
    .db     0x38, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_03_02
_patrol_l17_03_02:
    .db     0x38, 0x7C
    .db     0x34, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l17_03

_patrol_l18_01::
    .db     0x2B, 0x2C
    .db     0x17, 0x2C
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_01

_patrol_l18_02::
    .db     0x02, 0x54
    .db     0x02, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_02_01
_patrol_l18_02_01:
    .db     0x02, 0x7C
    .db     0x09, 0x7C
    .db     0x02, 0x7C
    .db     0x02, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_02_02
_patrol_l18_02_02:
    .db     0x02, 0x54
    .db     0x14, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_02

_patrol_l18_03::
    .db     0x37, 0xA4
    .db     0x16, 0xA4
    .db     0x16, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_03_01
_patrol_l18_03_01:
    .db     0x16, 0x7C
    .db     0x14, 0x7C
    .db     0x16, 0x7C
    .db     0x16, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_03_02
_patrol_l18_03_02:
    .db     0x16, 0xA4
    .db     0x2C, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l18_03

_patrol_l19_01::
    .db     0x10, 0x54
    .db     0x1E, 0x54
    .db     0x1E, 0x40
    .db     0x1E, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_01_1
_patrol_l19_01_1:
    .db     0x1E, 0x54
    .db     0x10, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_01

_patrol_l19_02::
    .db     0x1E, 0x7C
    .db     0x2C, 0x7C
    .db     0x2C, 0x54
    .db     0x24, 0x54
    .db     0x32, 0x54
    .db     0x2C, 0x54
    .db     0x2C, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_02_1
_patrol_l19_02_1:
    .db     0x2C, 0x7C
    .db     0x1E, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_02

_patrol_l19_03::
    .db     0x45, 0xA4
    .db     0x34, 0xA4
    .db     0x34, 0x7C
    .db     0x42, 0x7C
    .db     0x34, 0x7C
    .db     0x34, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_03_1
_patrol_l19_03_1:
    .db     0x34, 0xA4
    .db     0x45, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l19_03


_patrol_l20_01::
    .db     0x18, 0x7C
    .db     0x18, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_01_01
_patrol_l20_01_01:
    .db     0x18, 0x54
    .db     0x23, 0x54
    .db     0x18, 0x54
    .db     0x18, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_01_02
_patrol_l20_01_02:
    .db     0x18, 0x7C
    .db     0x21, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_01

_patrol_l20_02::
    .db     0x3C, 0x7C
    .db     0x3C, 0x54
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_02_01
_patrol_l20_02_01:
    .db     0x3C, 0x54
    .db     0x2A, 0x54 ;; 0x38, 0x54
    .db     0x3C, 0x54
    .db     0x3C, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_02_02
_patrol_l20_02_02:
    .db     0x3C, 0x7C
    .db     0x2E, 0x7C
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_02


_patrol_l20_03::
    .db     0x26, 0xA4
    .db     0x26, 0x90
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_03_01
_patrol_l20_03_01:
    .db     0x26, 0x90
    .db     0x26, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_03_02
_patrol_l20_03_02:
    .db     0x26, 0xA4
    .db     0x2B, 0xA4
    .db     0x26, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_03_03
_patrol_l20_03_03:
    .db     0x26, 0xA4
    .db     0x26, 0x90
    .db     0x26, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_03_04
_patrol_l20_03_04:
    .db     0x26, 0xA4
    .db     0x12, 0xA4
    .db     patrol_invalid_move_x
    .dw     _patrol_l20_03

man_patrol_init::
ret