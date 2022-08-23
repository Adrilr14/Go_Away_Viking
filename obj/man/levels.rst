ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
                              3 ;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU General Public License
                             16 ;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
                             17 ;;  
                             18 ;;  Email:      adrilaro99@gmail.com
                             19 ;;              elena78eas@gmail.com
                             20 ;;
                             21 ;;  Twitter:    @sanspielers
                             22 ;;-------------------------------------------------------------------------------
                             23 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             24 .include "man/levels.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of Go Away Viking: An Amstrad CPC Videogame  
                              3 ;;  Copyright (C) 2020  Adrián Larrosa Romero / Elena Alcaraz Sánchez / Sanspielers
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU General Public License
                             16 ;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.
                             17 ;;  
                             18 ;;  Email:      adrilaro99@gmail.com
                             19 ;;              elena78eas@gmail.com
                             20 ;;
                             21 ;;  Twitter:    @sanspielers
                             22 ;;-------------------------------------------------------------------------------
                             23 
                             24 ;;
                             25 ;; LEVELS MANAGER
                             26 ;;
                             27 .module Levels_Manager
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl man_level_add
                             31 .globl man_level_reset
                             32 .globl man_level_init
                             33 .globl man_level_render
                             34 
                             35 ;; TILESET
                             36 .globl _tilesProt
                             37 .globl _tilesProt2
                             38 .globl _tilesPrince
                             39 
                             40 ;; CONSTANTS
                             41 .globl _level1
                             42 .globl _level1_end
                             43 .globl _level2
                             44 .globl _level2_end
                             45 .globl _level3
                             46 .globl _level3_end
                             47 .globl _level4
                             48 .globl _level4_end
                             49 .globl _level5
                             50 .globl _level5_end
                             51 .globl _level6
                             52 .globl _level6_end
                             53 .globl _level7
                             54 .globl _level7_end
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl _level8
                             56 .globl _level8_end
                             57 .globl _level9
                             58 .globl _level9_end
                             59 .globl _level10
                             60 .globl _level10_end
                             61 .globl _level11
                             62 .globl _level11_end
                             63 .globl _level12
                             64 .globl _level12_end
                             65 .globl _level13
                             66 .globl _level13_end
                             67 .globl _level14
                             68 .globl _level14_end
                             69 .globl _level15
                             70 .globl _level15_end
                             71 .globl _level16
                             72 .globl _level16_end
                             73 .globl _level17
                             74 .globl _level17_end
                             75 .globl _level18
                             76 .globl _level18_end
                             77 .globl _level19
                             78 .globl _level19_end
                             79 .globl _level20
                             80 .globl _level20_end
                             81 
                             82 ;; ---------------------------------------------------
                             83 ;; LEVEL MAP
                             84 ;; ---------------------------------------------------
                     0028    85 man_level_map_w = 40
                     0032    86 man_level_map_h = 50
                     07D0    87 man_level_map_size = man_level_map_w * man_level_map_h
                             88 
                             89 .globl  num_level
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             25 ;;.include "cpctelera.h.s"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             26 .include "cpct_functions.h.s"
                              1 .globl cpct_disableFirmware_asm
                              2 .globl cpct_getScreenPtr_asm
                              3 .globl cpct_setDrawCharM1_asm
                              4 .globl cpct_drawStringM1_asm
                              5 .globl cpct_waitVSYNC_asm
                              6 .globl cpct_setVideoMode_asm
                              7 .globl cpct_setPalette_asm
                              8 .globl cpct_drawSprite_asm
                              9 .globl cpct_scanKeyboard_asm
                             10 .globl cpct_scanKeyboard_f_asm
                             11 .globl cpct_isKeyPressed_asm
                             12 .globl cpct_setVideoMemoryPage_asm
                             13 .globl cpct_memset_f64_asm
                             14 .globl cpct_etm_setTileset2x4_asm
                             15 .globl cpct_etm_drawTileBox2x4_asm
                             16 .globl cpct_getScreenToSprite_asm
                             17 .globl cpct_drawSpriteBlended_asm
                             18 .globl cpct_setBlendMode_asm
                             19 .globl cpct_setDrawCharM0_asm
                             20 .globl cpct_drawStringM0_asm
                             21 .globl cpct_memset_f8_asm
                             22 .globl cpct_isAnyKeyPressed_f_asm
                             23 .globl cpct_zx7b_decrunch_s_asm
                             24 .globl cpct_scanKeyboard_if_asm
                             25 .globl cpct_akp_musicPlay_asm
                             26 .globl cpct_akp_musicInit_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             27 
   4AD5                      28 man_level_map:: .ds man_level_map_size
                     07CF    29 man_level_map_end = .-1
   52A5 01                   30 num_level:: .db 1
                             31 
   52A6                      32 man_level_reset::
                             33 
   52A6 3E 01         [ 7]   34     ld      a, #1
   52A8 32 A5 52      [13]   35     ld      (num_level), a
   52AB C9            [10]   36     ret
                             37 
   52AC                      38 man_level_add::
                             39 
   52AC 3A A5 52      [13]   40     ld      a, (num_level)
   52AF C6 01         [ 7]   41     add     #1
   52B1 32 A5 52      [13]   42     ld      (num_level), a
                             43 
   52B4 C9            [10]   44     ret
                             45 
                             46 
   52B5                      47 man_level_init::
                             48 
   52B5 3A A5 52      [13]   49     ld      a, (num_level)
   52B8 FE 02         [ 7]   50     cp      #2
   52BA 28 5F         [12]   51     jr      z, descompress2
                             52 
   52BC FE 03         [ 7]   53     cp      #3
   52BE 28 65         [12]   54     jr      z, descompress3
                             55 
   52C0 FE 04         [ 7]   56     cp      #4
   52C2 28 6B         [12]   57     jr      z, descompress4
                             58 
   52C4 FE 05         [ 7]   59     cp      #5
   52C6 28 71         [12]   60     jr      z, descompress5
                             61  
   52C8 FE 06         [ 7]   62     cp      #6
   52CA 28 77         [12]   63     jr      z, descompress6
                             64 
   52CC FE 07         [ 7]   65     cp      #7
   52CE 28 7D         [12]   66     jr      z, descompress7
                             67 
   52D0 FE 08         [ 7]   68     cp      #8
   52D2 CA 57 53      [10]   69     jp      z, descompress8
                             70 
   52D5 FE 09         [ 7]   71     cp      #9
   52D7 CA 61 53      [10]   72     jp      z, descompress9
                             73 
   52DA FE 0A         [ 7]   74     cp      #10
   52DC CA 6B 53      [10]   75     jp      z, descompress10
                             76 
   52DF FE 0B         [ 7]   77     cp      #11
   52E1 CA 75 53      [10]   78     jp      z, descompress11
                             79 
   52E4 FE 0C         [ 7]   80     cp      #12
   52E6 CA 7F 53      [10]   81     jp      z, descompress12
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             82 
   52E9 FE 0D         [ 7]   83     cp      #13
   52EB CA 89 53      [10]   84     jp      z, descompress13
                             85 
   52EE FE 0E         [ 7]   86     cp      #14
   52F0 CA 93 53      [10]   87     jp      z, descompress14
                             88 
   52F3 FE 0F         [ 7]   89     cp      #15
   52F5 CA 9D 53      [10]   90     jp      z, descompress15
                             91 
   52F8 FE 10         [ 7]   92     cp      #16
   52FA CA A7 53      [10]   93     jp      z, descompress16
                             94 
   52FD FE 11         [ 7]   95     cp      #17
   52FF CA B1 53      [10]   96     jp      z, descompress17
                             97 
   5302 FE 12         [ 7]   98     cp      #18
   5304 CA BB 53      [10]   99     jp      z, descompress18
                            100 
   5307 FE 13         [ 7]  101     cp      #19
   5309 CA C5 53      [10]  102     jp      z, descompress19
                            103 
   530C FE 14         [ 7]  104     cp      #20
   530E CA CF 53      [10]  105     jp      z, descompress20
                            106 
   5311                     107 descompress1:
                            108     ;; Decompress level 1
   5311 21 0C 24      [10]  109     ld      hl, #_level1_end
   5314 11 A4 52      [10]  110     ld      de, #man_level_map_end
   5317 CD BC 5E      [17]  111     call    cpct_zx7b_decrunch_s_asm
   531A C9            [10]  112     ret
                            113 
   531B                     114 descompress2:
                            115     ;; Decompress level 2
   531B 21 05 23      [10]  116     ld      hl, #_level2_end
   531E 11 A4 52      [10]  117     ld      de, #man_level_map_end
   5321 CD BC 5E      [17]  118     call    cpct_zx7b_decrunch_s_asm
   5324 C9            [10]  119     ret
   5325                     120 descompress3:
                            121     ;; Decompress level 3
   5325 21 F5 21      [10]  122     ld      hl, #_level3_end
   5328 11 A4 52      [10]  123     ld      de, #man_level_map_end
   532B CD BC 5E      [17]  124     call    cpct_zx7b_decrunch_s_asm
   532E C9            [10]  125     ret
                            126 
   532F                     127 descompress4:
                            128     ;; Decompress level 4
   532F 21 FF 20      [10]  129     ld      hl, #_level4_end
   5332 11 A4 52      [10]  130     ld      de, #man_level_map_end
   5335 CD BC 5E      [17]  131     call    cpct_zx7b_decrunch_s_asm
   5338 C9            [10]  132     ret
                            133 
   5339                     134 descompress5:
                            135     ;; Decompress level 5
   5339 21 FD 1F      [10]  136     ld      hl, #_level5_end
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   533C 11 A4 52      [10]  137     ld      de, #man_level_map_end
   533F CD BC 5E      [17]  138     call    cpct_zx7b_decrunch_s_asm
   5342 C9            [10]  139     ret
                            140 
   5343                     141 descompress6:
                            142     ;; Decompress level 6
   5343 21 11 1F      [10]  143     ld      hl, #_level6_end
   5346 11 A4 52      [10]  144     ld      de, #man_level_map_end
   5349 CD BC 5E      [17]  145     call    cpct_zx7b_decrunch_s_asm
   534C C9            [10]  146     ret
                            147 
   534D                     148 descompress7:
                            149     ;; Decompress level 7
   534D 21 2E 1E      [10]  150     ld      hl, #_level7_end
   5350 11 A4 52      [10]  151     ld      de, #man_level_map_end
   5353 CD BC 5E      [17]  152     call    cpct_zx7b_decrunch_s_asm
   5356 C9            [10]  153     ret
                            154 
   5357                     155 descompress8:
                            156     ;; Decompress level 8
   5357 21 13 1D      [10]  157     ld      hl, #_level8_end
   535A 11 A4 52      [10]  158     ld      de, #man_level_map_end
   535D CD BC 5E      [17]  159     call    cpct_zx7b_decrunch_s_asm
   5360 C9            [10]  160     ret
                            161 
   5361                     162 descompress9:
                            163     ;; Decompress level 9
   5361 21 0F 1C      [10]  164     ld      hl, #_level9_end
   5364 11 A4 52      [10]  165     ld      de, #man_level_map_end
   5367 CD BC 5E      [17]  166     call    cpct_zx7b_decrunch_s_asm
   536A C9            [10]  167     ret
                            168 
   536B                     169 descompress10:
                            170     ;; Decompress level 10
   536B 21 28 1B      [10]  171     ld      hl, #_level10_end
   536E 11 A4 52      [10]  172     ld      de, #man_level_map_end
   5371 CD BC 5E      [17]  173     call    cpct_zx7b_decrunch_s_asm
   5374 C9            [10]  174     ret
                            175 
   5375                     176 descompress11:
                            177     ;; Decompress level 11
   5375 21 2B 1A      [10]  178     ld      hl, #_level11_end
   5378 11 A4 52      [10]  179     ld      de, #man_level_map_end
   537B CD BC 5E      [17]  180     call    cpct_zx7b_decrunch_s_asm
   537E C9            [10]  181     ret
                            182 
   537F                     183 descompress12:
                            184     ;; Decompress level 12
   537F 21 2D 19      [10]  185     ld      hl, #_level12_end
   5382 11 A4 52      [10]  186     ld      de, #man_level_map_end
   5385 CD BC 5E      [17]  187     call    cpct_zx7b_decrunch_s_asm
   5388 C9            [10]  188     ret
                            189 
   5389                     190 descompress13:
                            191     ;; Decompress level 13
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   5389 21 F3 17      [10]  192     ld      hl, #_level13_end
   538C 11 A4 52      [10]  193     ld      de, #man_level_map_end
   538F CD BC 5E      [17]  194     call    cpct_zx7b_decrunch_s_asm
   5392 C9            [10]  195     ret
                            196 
   5393                     197 descompress14:
                            198     ;; Decompress level 14
   5393 21 25 17      [10]  199     ld      hl, #_level14_end
   5396 11 A4 52      [10]  200     ld      de, #man_level_map_end
   5399 CD BC 5E      [17]  201     call    cpct_zx7b_decrunch_s_asm
   539C C9            [10]  202     ret
                            203 
   539D                     204 descompress15:
                            205     ;; Decompress level 15
   539D 21 02 16      [10]  206     ld      hl, #_level15_end
   53A0 11 A4 52      [10]  207     ld      de, #man_level_map_end
   53A3 CD BC 5E      [17]  208     call    cpct_zx7b_decrunch_s_asm
   53A6 C9            [10]  209     ret
                            210 
   53A7                     211 descompress16:
                            212     ;; Decompress level 16
   53A7 21 11 15      [10]  213     ld      hl, #_level16_end
   53AA 11 A4 52      [10]  214     ld      de, #man_level_map_end
   53AD CD BC 5E      [17]  215     call    cpct_zx7b_decrunch_s_asm
   53B0 C9            [10]  216     ret
                            217 
   53B1                     218 descompress17:
                            219     ;; Decompress level 17
   53B1 21 B1 13      [10]  220     ld      hl, #_level17_end
   53B4 11 A4 52      [10]  221     ld      de, #man_level_map_end
   53B7 CD BC 5E      [17]  222     call    cpct_zx7b_decrunch_s_asm
   53BA C9            [10]  223     ret
                            224 
   53BB                     225 descompress18:
                            226     ;; Decompress level 18
   53BB 21 85 12      [10]  227     ld      hl, #_level18_end
   53BE 11 A4 52      [10]  228     ld      de, #man_level_map_end
   53C1 CD BC 5E      [17]  229     call    cpct_zx7b_decrunch_s_asm
   53C4 C9            [10]  230     ret
   53C5                     231 descompress19:
                            232     ;; Decompress level 19
   53C5 21 48 11      [10]  233     ld      hl, #_level19_end
   53C8 11 A4 52      [10]  234     ld      de, #man_level_map_end
   53CB CD BC 5E      [17]  235     call    cpct_zx7b_decrunch_s_asm
   53CE C9            [10]  236     ret
   53CF                     237 descompress20:
                            238     ;; Decompress level 20
   53CF 21 24 10      [10]  239     ld      hl, #_level20_end
   53D2 11 A4 52      [10]  240     ld      de, #man_level_map_end
   53D5 CD BC 5E      [17]  241     call    cpct_zx7b_decrunch_s_asm
   53D8 C9            [10]  242     ret
                            243 
                            244 ;; RENDER LEVEL
                            245 ;;      Pinta el tilemap guardado en man_level_map    
                            246 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   53D9                     247 man_level_render::
                            248 
   53D9 3A A5 52      [13]  249     ld      a, (num_level)
   53DC FE 14         [ 7]  250     cp      #20
   53DE 30 14         [12]  251     jr      nc, insert_tiles3
   53E0 FE 0B         [ 7]  252     cp      #11
   53E2 30 08         [12]  253     jr      nc, insert_tiles2
                            254 
   53E4                     255 insert_tiles1:
   53E4 21 85 09      [10]  256     ld      hl, #_tilesProt
   53E7 CD 75 5D      [17]  257     call    cpct_etm_setTileset2x4_asm
   53EA 18 0E         [12]  258     jr      insert_tilemap
                            259 
   53EC                     260 insert_tiles2:
   53EC 21 05 07      [10]  261     ld      hl, #_tilesProt2
   53EF CD 75 5D      [17]  262     call    cpct_etm_setTileset2x4_asm
   53F2 18 06         [12]  263     jr      insert_tilemap
                            264 
   53F4                     265 insert_tiles3:
   53F4 21 F5 02      [10]  266     ld      hl, #_tilesPrince
   53F7 CD 75 5D      [17]  267     call    cpct_etm_setTileset2x4_asm
                            268 
   53FA                     269 insert_tilemap:
   53FA 21 D5 4A      [10]  270     ld      hl, #man_level_map
   53FD E5            [11]  271     push    hl
   53FE 21 00 C0      [10]  272     ld      hl, #0xC000 ;; Front buffer
   5401 E5            [11]  273     push    hl
   5402 06 00         [ 7]  274     ld       b, #0
   5404 0E 00         [ 7]  275     ld       c, #0
   5406 11 28 32      [10]  276     ld      de, #0x3228 ;; 50 de altura (height) y 40 de ancho (width)
   5409 3E 28         [ 7]  277     ld       a, #40     ;; 40 de ancho (width)
   540B CD E9 5C      [17]  278     call    cpct_etm_drawTileBox2x4_asm
                            279 
   540E C9            [10]  280     ret
