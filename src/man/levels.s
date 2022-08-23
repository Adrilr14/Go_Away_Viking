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

.include "man/levels.h.s"
;;.include "cpctelera.h.s"
.include "cpct_functions.h.s"

man_level_map:: .ds man_level_map_size
man_level_map_end = .-1
num_level:: .db 1

man_level_reset::

    ld      a, #1
    ld      (num_level), a
    ret

man_level_add::

    ld      a, (num_level)
    add     #1
    ld      (num_level), a

    ret


man_level_init::

    ld      a, (num_level)
    cp      #2
    jr      z, descompress2

    cp      #3
    jr      z, descompress3

    cp      #4
    jr      z, descompress4

    cp      #5
    jr      z, descompress5
 
    cp      #6
    jr      z, descompress6

    cp      #7
    jr      z, descompress7

    cp      #8
    jp      z, descompress8

    cp      #9
    jp      z, descompress9

    cp      #10
    jp      z, descompress10

    cp      #11
    jp      z, descompress11

    cp      #12
    jp      z, descompress12

    cp      #13
    jp      z, descompress13

    cp      #14
    jp      z, descompress14

    cp      #15
    jp      z, descompress15

    cp      #16
    jp      z, descompress16

    cp      #17
    jp      z, descompress17

    cp      #18
    jp      z, descompress18

    cp      #19
    jp      z, descompress19

    cp      #20
    jp      z, descompress20

descompress1:
    ;; Decompress level 1
    ld      hl, #_level1_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress2:
    ;; Decompress level 2
    ld      hl, #_level2_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret
descompress3:
    ;; Decompress level 3
    ld      hl, #_level3_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress4:
    ;; Decompress level 4
    ld      hl, #_level4_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress5:
    ;; Decompress level 5
    ld      hl, #_level5_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress6:
    ;; Decompress level 6
    ld      hl, #_level6_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress7:
    ;; Decompress level 7
    ld      hl, #_level7_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress8:
    ;; Decompress level 8
    ld      hl, #_level8_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress9:
    ;; Decompress level 9
    ld      hl, #_level9_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress10:
    ;; Decompress level 10
    ld      hl, #_level10_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress11:
    ;; Decompress level 11
    ld      hl, #_level11_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress12:
    ;; Decompress level 12
    ld      hl, #_level12_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress13:
    ;; Decompress level 13
    ld      hl, #_level13_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress14:
    ;; Decompress level 14
    ld      hl, #_level14_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress15:
    ;; Decompress level 15
    ld      hl, #_level15_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress16:
    ;; Decompress level 16
    ld      hl, #_level16_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress17:
    ;; Decompress level 17
    ld      hl, #_level17_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

descompress18:
    ;; Decompress level 18
    ld      hl, #_level18_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret
descompress19:
    ;; Decompress level 19
    ld      hl, #_level19_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret
descompress20:
    ;; Decompress level 20
    ld      hl, #_level20_end
    ld      de, #man_level_map_end
    call    cpct_zx7b_decrunch_s_asm
    ret

;; RENDER LEVEL
;;      Pinta el tilemap guardado en man_level_map    
;;
man_level_render::

    ld      a, (num_level)
    cp      #20
    jr      nc, insert_tiles3
    cp      #11
    jr      nc, insert_tiles2

insert_tiles1:
    ld      hl, #_tilesProt
    call    cpct_etm_setTileset2x4_asm
    jr      insert_tilemap

insert_tiles2:
    ld      hl, #_tilesProt2
    call    cpct_etm_setTileset2x4_asm
    jr      insert_tilemap

insert_tiles3:
    ld      hl, #_tilesPrince
    call    cpct_etm_setTileset2x4_asm

insert_tilemap:
    ld      hl, #man_level_map
    push    hl
    ld      hl, #0xC000 ;; Front buffer
    push    hl
    ld       b, #0
    ld       c, #0
    ld      de, #0x3228 ;; 50 de altura (height) y 40 de ancho (width)
    ld       a, #40     ;; 40 de ancho (width)
    call    cpct_etm_drawTileBox2x4_asm

    ret
