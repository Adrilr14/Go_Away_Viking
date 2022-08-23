                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tilesProt
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _tiles0_sp_63
                             12 	.globl _tiles0_sp_62
                             13 	.globl _tiles0_sp_61
                             14 	.globl _tiles0_sp_60
                             15 	.globl _tiles0_sp_59
                             16 	.globl _tiles0_sp_58
                             17 	.globl _tiles0_sp_57
                             18 	.globl _tiles0_sp_56
                             19 	.globl _tiles0_sp_55
                             20 	.globl _tiles0_sp_54
                             21 	.globl _tiles0_sp_53
                             22 	.globl _tiles0_sp_52
                             23 	.globl _tiles0_sp_51
                             24 	.globl _tiles0_sp_50
                             25 	.globl _tiles0_sp_49
                             26 	.globl _tiles0_sp_48
                             27 	.globl _tiles0_sp_47
                             28 	.globl _tiles0_sp_46
                             29 	.globl _tiles0_sp_45
                             30 	.globl _tiles0_sp_44
                             31 	.globl _tiles0_sp_43
                             32 	.globl _tiles0_sp_42
                             33 	.globl _tiles0_sp_41
                             34 	.globl _tiles0_sp_40
                             35 	.globl _tiles0_sp_39
                             36 	.globl _tiles0_sp_38
                             37 	.globl _tiles0_sp_37
                             38 	.globl _tiles0_sp_36
                             39 	.globl _tiles0_sp_35
                             40 	.globl _tiles0_sp_34
                             41 	.globl _tiles0_sp_33
                             42 	.globl _tiles0_sp_32
                             43 	.globl _tiles0_sp_31
                             44 	.globl _tiles0_sp_30
                             45 	.globl _tiles0_sp_29
                             46 	.globl _tiles0_sp_28
                             47 	.globl _tiles0_sp_27
                             48 	.globl _tiles0_sp_26
                             49 	.globl _tiles0_sp_25
                             50 	.globl _tiles0_sp_24
                             51 	.globl _tiles0_sp_23
                             52 	.globl _tiles0_sp_22
                             53 	.globl _tiles0_sp_21
                             54 	.globl _tiles0_sp_20
                             55 	.globl _tiles0_sp_19
                             56 	.globl _tiles0_sp_18
                             57 	.globl _tiles0_sp_17
                             58 	.globl _tiles0_sp_16
                             59 	.globl _tiles0_sp_15
                             60 	.globl _tiles0_sp_14
                             61 	.globl _tiles0_sp_13
                             62 	.globl _tiles0_sp_12
                             63 	.globl _tiles0_sp_11
                             64 	.globl _tiles0_sp_10
                             65 	.globl _tiles0_sp_09
                             66 	.globl _tiles0_sp_08
                             67 	.globl _tiles0_sp_07
                             68 	.globl _tiles0_sp_06
                             69 	.globl _tiles0_sp_05
                             70 	.globl _tiles0_sp_04
                             71 	.globl _tiles0_sp_03
                             72 	.globl _tiles0_sp_02
                             73 	.globl _tiles0_sp_01
                             74 	.globl _tiles0_sp_00
                             75 	.globl _tilesProt
                             76 ;--------------------------------------------------------
                             77 ; special function registers
                             78 ;--------------------------------------------------------
                             79 ;--------------------------------------------------------
                             80 ; ram data
                             81 ;--------------------------------------------------------
                             82 	.area _DATA
                             83 ;--------------------------------------------------------
                             84 ; ram data
                             85 ;--------------------------------------------------------
                             86 	.area _INITIALIZED
                             87 ;--------------------------------------------------------
                             88 ; absolute external ram data
                             89 ;--------------------------------------------------------
                             90 	.area _DABS (ABS)
                             91 ;--------------------------------------------------------
                             92 ; global & static initialisations
                             93 ;--------------------------------------------------------
                             94 	.area _HOME
                             95 	.area _GSINIT
                             96 	.area _GSFINAL
                             97 	.area _GSINIT
                             98 ;--------------------------------------------------------
                             99 ; Home
                            100 ;--------------------------------------------------------
                            101 	.area _HOME
                            102 	.area _HOME
                            103 ;--------------------------------------------------------
                            104 ; code
                            105 ;--------------------------------------------------------
                            106 	.area _CODE
                            107 	.area _CODE
   0985                     108 _tilesProt:
   0985 05 0A               109 	.dw _tiles0_sp_00
   0987 0D 0A               110 	.dw _tiles0_sp_01
   0989 15 0A               111 	.dw _tiles0_sp_02
   098B 1D 0A               112 	.dw _tiles0_sp_03
   098D 25 0A               113 	.dw _tiles0_sp_04
   098F 2D 0A               114 	.dw _tiles0_sp_05
   0991 35 0A               115 	.dw _tiles0_sp_06
   0993 3D 0A               116 	.dw _tiles0_sp_07
   0995 45 0A               117 	.dw _tiles0_sp_08
   0997 4D 0A               118 	.dw _tiles0_sp_09
   0999 55 0A               119 	.dw _tiles0_sp_10
   099B 5D 0A               120 	.dw _tiles0_sp_11
   099D 65 0A               121 	.dw _tiles0_sp_12
   099F 6D 0A               122 	.dw _tiles0_sp_13
   09A1 75 0A               123 	.dw _tiles0_sp_14
   09A3 7D 0A               124 	.dw _tiles0_sp_15
   09A5 85 0A               125 	.dw _tiles0_sp_16
   09A7 8D 0A               126 	.dw _tiles0_sp_17
   09A9 95 0A               127 	.dw _tiles0_sp_18
   09AB 9D 0A               128 	.dw _tiles0_sp_19
   09AD A5 0A               129 	.dw _tiles0_sp_20
   09AF AD 0A               130 	.dw _tiles0_sp_21
   09B1 B5 0A               131 	.dw _tiles0_sp_22
   09B3 BD 0A               132 	.dw _tiles0_sp_23
   09B5 C5 0A               133 	.dw _tiles0_sp_24
   09B7 CD 0A               134 	.dw _tiles0_sp_25
   09B9 D5 0A               135 	.dw _tiles0_sp_26
   09BB DD 0A               136 	.dw _tiles0_sp_27
   09BD E5 0A               137 	.dw _tiles0_sp_28
   09BF ED 0A               138 	.dw _tiles0_sp_29
   09C1 F5 0A               139 	.dw _tiles0_sp_30
   09C3 FD 0A               140 	.dw _tiles0_sp_31
   09C5 05 0B               141 	.dw _tiles0_sp_32
   09C7 0D 0B               142 	.dw _tiles0_sp_33
   09C9 15 0B               143 	.dw _tiles0_sp_34
   09CB 1D 0B               144 	.dw _tiles0_sp_35
   09CD 25 0B               145 	.dw _tiles0_sp_36
   09CF 2D 0B               146 	.dw _tiles0_sp_37
   09D1 35 0B               147 	.dw _tiles0_sp_38
   09D3 3D 0B               148 	.dw _tiles0_sp_39
   09D5 45 0B               149 	.dw _tiles0_sp_40
   09D7 4D 0B               150 	.dw _tiles0_sp_41
   09D9 55 0B               151 	.dw _tiles0_sp_42
   09DB 5D 0B               152 	.dw _tiles0_sp_43
   09DD 65 0B               153 	.dw _tiles0_sp_44
   09DF 6D 0B               154 	.dw _tiles0_sp_45
   09E1 75 0B               155 	.dw _tiles0_sp_46
   09E3 7D 0B               156 	.dw _tiles0_sp_47
   09E5 85 0B               157 	.dw _tiles0_sp_48
   09E7 8D 0B               158 	.dw _tiles0_sp_49
   09E9 95 0B               159 	.dw _tiles0_sp_50
   09EB 9D 0B               160 	.dw _tiles0_sp_51
   09ED A5 0B               161 	.dw _tiles0_sp_52
   09EF AD 0B               162 	.dw _tiles0_sp_53
   09F1 B5 0B               163 	.dw _tiles0_sp_54
   09F3 BD 0B               164 	.dw _tiles0_sp_55
   09F5 C5 0B               165 	.dw _tiles0_sp_56
   09F7 CD 0B               166 	.dw _tiles0_sp_57
   09F9 D5 0B               167 	.dw _tiles0_sp_58
   09FB DD 0B               168 	.dw _tiles0_sp_59
   09FD E5 0B               169 	.dw _tiles0_sp_60
   09FF ED 0B               170 	.dw _tiles0_sp_61
   0A01 F5 0B               171 	.dw _tiles0_sp_62
   0A03 FD 0B               172 	.dw _tiles0_sp_63
   0A05                     173 _tiles0_sp_00:
   0A05 80                  174 	.db #0x80	; 128
   0A06 00                  175 	.db #0x00	; 0
   0A07 C0                  176 	.db #0xc0	; 192
   0A08 C0                  177 	.db #0xc0	; 192
   0A09 80                  178 	.db #0x80	; 128
   0A0A 00                  179 	.db #0x00	; 0
   0A0B C0                  180 	.db #0xc0	; 192
   0A0C C0                  181 	.db #0xc0	; 192
   0A0D                     182 _tiles0_sp_01:
   0A0D 00                  183 	.db #0x00	; 0
   0A0E 00                  184 	.db #0x00	; 0
   0A0F C0                  185 	.db #0xc0	; 192
   0A10 C0                  186 	.db #0xc0	; 192
   0A11 00                  187 	.db #0x00	; 0
   0A12 00                  188 	.db #0x00	; 0
   0A13 C0                  189 	.db #0xc0	; 192
   0A14 C0                  190 	.db #0xc0	; 192
   0A15                     191 _tiles0_sp_02:
   0A15 00                  192 	.db #0x00	; 0
   0A16 40                  193 	.db #0x40	; 64
   0A17 C0                  194 	.db #0xc0	; 192
   0A18 C0                  195 	.db #0xc0	; 192
   0A19 00                  196 	.db #0x00	; 0
   0A1A 40                  197 	.db #0x40	; 64
   0A1B C0                  198 	.db #0xc0	; 192
   0A1C C0                  199 	.db #0xc0	; 192
   0A1D                     200 _tiles0_sp_03:
   0A1D C0                  201 	.db #0xc0	; 192
   0A1E C0                  202 	.db #0xc0	; 192
   0A1F 80                  203 	.db #0x80	; 128
   0A20 00                  204 	.db #0x00	; 0
   0A21 80                  205 	.db #0x80	; 128
   0A22 C0                  206 	.db #0xc0	; 192
   0A23 80                  207 	.db #0x80	; 128
   0A24 C0                  208 	.db #0xc0	; 192
   0A25                     209 _tiles0_sp_04:
   0A25 C0                  210 	.db #0xc0	; 192
   0A26 C0                  211 	.db #0xc0	; 192
   0A27 00                  212 	.db #0x00	; 0
   0A28 00                  213 	.db #0x00	; 0
   0A29 C0                  214 	.db #0xc0	; 192
   0A2A C0                  215 	.db #0xc0	; 192
   0A2B C0                  216 	.db #0xc0	; 192
   0A2C C0                  217 	.db #0xc0	; 192
   0A2D                     218 _tiles0_sp_05:
   0A2D C0                  219 	.db #0xc0	; 192
   0A2E C0                  220 	.db #0xc0	; 192
   0A2F 00                  221 	.db #0x00	; 0
   0A30 00                  222 	.db #0x00	; 0
   0A31 C0                  223 	.db #0xc0	; 192
   0A32 C0                  224 	.db #0xc0	; 192
   0A33 C0                  225 	.db #0xc0	; 192
   0A34 C0                  226 	.db #0xc0	; 192
   0A35                     227 _tiles0_sp_06:
   0A35 C0                  228 	.db #0xc0	; 192
   0A36 C0                  229 	.db #0xc0	; 192
   0A37 00                  230 	.db #0x00	; 0
   0A38 40                  231 	.db #0x40	; 64
   0A39 C0                  232 	.db #0xc0	; 192
   0A3A 40                  233 	.db #0x40	; 64
   0A3B C0                  234 	.db #0xc0	; 192
   0A3C 40                  235 	.db #0x40	; 64
   0A3D                     236 _tiles0_sp_07:
   0A3D 00                  237 	.db #0x00	; 0
   0A3E 00                  238 	.db #0x00	; 0
   0A3F 00                  239 	.db #0x00	; 0
   0A40 2A                  240 	.db #0x2a	; 42
   0A41 00                  241 	.db #0x00	; 0
   0A42 00                  242 	.db #0x00	; 0
   0A43 2A                  243 	.db #0x2a	; 42
   0A44 00                  244 	.db #0x00	; 0
   0A45                     245 _tiles0_sp_08:
   0A45 00                  246 	.db #0x00	; 0
   0A46 00                  247 	.db #0x00	; 0
   0A47 00                  248 	.db #0x00	; 0
   0A48 00                  249 	.db #0x00	; 0
   0A49 00                  250 	.db #0x00	; 0
   0A4A 05                  251 	.db #0x05	; 5
   0A4B 05                  252 	.db #0x05	; 5
   0A4C 05                  253 	.db #0x05	; 5
   0A4D                     254 _tiles0_sp_09:
   0A4D 00                  255 	.db #0x00	; 0
   0A4E 00                  256 	.db #0x00	; 0
   0A4F 0A                  257 	.db #0x0a	; 10
   0A50 00                  258 	.db #0x00	; 0
   0A51 0A                  259 	.db #0x0a	; 10
   0A52 00                  260 	.db #0x00	; 0
   0A53 0F                  261 	.db #0x0f	; 15
   0A54 0F                  262 	.db #0x0f	; 15
   0A55                     263 _tiles0_sp_10:
   0A55 00                  264 	.db #0x00	; 0
   0A56 00                  265 	.db #0x00	; 0
   0A57 00                  266 	.db #0x00	; 0
   0A58 00                  267 	.db #0x00	; 0
   0A59 00                  268 	.db #0x00	; 0
   0A5A 00                  269 	.db #0x00	; 0
   0A5B 00                  270 	.db #0x00	; 0
   0A5C 00                  271 	.db #0x00	; 0
   0A5D                     272 _tiles0_sp_11:
   0A5D 80                  273 	.db #0x80	; 128
   0A5E C0                  274 	.db #0xc0	; 192
   0A5F 80                  275 	.db #0x80	; 128
   0A60 C0                  276 	.db #0xc0	; 192
   0A61 80                  277 	.db #0x80	; 128
   0A62 C0                  278 	.db #0xc0	; 192
   0A63 80                  279 	.db #0x80	; 128
   0A64 C0                  280 	.db #0xc0	; 192
   0A65                     281 _tiles0_sp_12:
   0A65 C0                  282 	.db #0xc0	; 192
   0A66 C0                  283 	.db #0xc0	; 192
   0A67 C0                  284 	.db #0xc0	; 192
   0A68 C0                  285 	.db #0xc0	; 192
   0A69 C0                  286 	.db #0xc0	; 192
   0A6A C0                  287 	.db #0xc0	; 192
   0A6B C0                  288 	.db #0xc0	; 192
   0A6C C0                  289 	.db #0xc0	; 192
   0A6D                     290 _tiles0_sp_13:
   0A6D C0                  291 	.db #0xc0	; 192
   0A6E C0                  292 	.db #0xc0	; 192
   0A6F C0                  293 	.db #0xc0	; 192
   0A70 C0                  294 	.db #0xc0	; 192
   0A71 C0                  295 	.db #0xc0	; 192
   0A72 C0                  296 	.db #0xc0	; 192
   0A73 C0                  297 	.db #0xc0	; 192
   0A74 C0                  298 	.db #0xc0	; 192
   0A75                     299 _tiles0_sp_14:
   0A75 C0                  300 	.db #0xc0	; 192
   0A76 40                  301 	.db #0x40	; 64
   0A77 C0                  302 	.db #0xc0	; 192
   0A78 40                  303 	.db #0x40	; 64
   0A79 C0                  304 	.db #0xc0	; 192
   0A7A 40                  305 	.db #0x40	; 64
   0A7B C0                  306 	.db #0xc0	; 192
   0A7C 40                  307 	.db #0x40	; 64
   0A7D                     308 _tiles0_sp_15:
   0A7D 00                  309 	.db #0x00	; 0
   0A7E 00                  310 	.db #0x00	; 0
   0A7F 00                  311 	.db #0x00	; 0
   0A80 00                  312 	.db #0x00	; 0
   0A81 00                  313 	.db #0x00	; 0
   0A82 2A                  314 	.db #0x2a	; 42
   0A83 00                  315 	.db #0x00	; 0
   0A84 00                  316 	.db #0x00	; 0
   0A85                     317 _tiles0_sp_16:
   0A85 0F                  318 	.db #0x0f	; 15
   0A86 0F                  319 	.db #0x0f	; 15
   0A87 05                  320 	.db #0x05	; 5
   0A88 0F                  321 	.db #0x0f	; 15
   0A89 00                  322 	.db #0x00	; 0
   0A8A 05                  323 	.db #0x05	; 5
   0A8B 0F                  324 	.db #0x0f	; 15
   0A8C 0F                  325 	.db #0x0f	; 15
   0A8D                     326 _tiles0_sp_17:
   0A8D 0D                  327 	.db #0x0d	; 13
   0A8E 0A                  328 	.db #0x0a	; 10
   0A8F 0F                  329 	.db #0x0f	; 15
   0A90 0F                  330 	.db #0x0f	; 15
   0A91 0F                  331 	.db #0x0f	; 15
   0A92 0F                  332 	.db #0x0f	; 15
   0A93 0F                  333 	.db #0x0f	; 15
   0A94 0F                  334 	.db #0x0f	; 15
   0A95                     335 _tiles0_sp_18:
   0A95 00                  336 	.db #0x00	; 0
   0A96 00                  337 	.db #0x00	; 0
   0A97 00                  338 	.db #0x00	; 0
   0A98 00                  339 	.db #0x00	; 0
   0A99 00                  340 	.db #0x00	; 0
   0A9A 00                  341 	.db #0x00	; 0
   0A9B 00                  342 	.db #0x00	; 0
   0A9C 00                  343 	.db #0x00	; 0
   0A9D                     344 _tiles0_sp_19:
   0A9D 80                  345 	.db #0x80	; 128
   0A9E C0                  346 	.db #0xc0	; 192
   0A9F 80                  347 	.db #0x80	; 128
   0AA0 C0                  348 	.db #0xc0	; 192
   0AA1 80                  349 	.db #0x80	; 128
   0AA2 C0                  350 	.db #0xc0	; 192
   0AA3 80                  351 	.db #0x80	; 128
   0AA4 C0                  352 	.db #0xc0	; 192
   0AA5                     353 _tiles0_sp_20:
   0AA5 C0                  354 	.db #0xc0	; 192
   0AA6 C0                  355 	.db #0xc0	; 192
   0AA7 C0                  356 	.db #0xc0	; 192
   0AA8 C0                  357 	.db #0xc0	; 192
   0AA9 C0                  358 	.db #0xc0	; 192
   0AAA C0                  359 	.db #0xc0	; 192
   0AAB C0                  360 	.db #0xc0	; 192
   0AAC C0                  361 	.db #0xc0	; 192
   0AAD                     362 _tiles0_sp_21:
   0AAD C0                  363 	.db #0xc0	; 192
   0AAE C0                  364 	.db #0xc0	; 192
   0AAF C0                  365 	.db #0xc0	; 192
   0AB0 C0                  366 	.db #0xc0	; 192
   0AB1 C0                  367 	.db #0xc0	; 192
   0AB2 C0                  368 	.db #0xc0	; 192
   0AB3 C0                  369 	.db #0xc0	; 192
   0AB4 C0                  370 	.db #0xc0	; 192
   0AB5                     371 _tiles0_sp_22:
   0AB5 C0                  372 	.db #0xc0	; 192
   0AB6 40                  373 	.db #0x40	; 64
   0AB7 C0                  374 	.db #0xc0	; 192
   0AB8 40                  375 	.db #0x40	; 64
   0AB9 C0                  376 	.db #0xc0	; 192
   0ABA 40                  377 	.db #0x40	; 64
   0ABB C0                  378 	.db #0xc0	; 192
   0ABC 40                  379 	.db #0x40	; 64
   0ABD                     380 _tiles0_sp_23:
   0ABD 2A                  381 	.db #0x2a	; 42
   0ABE 00                  382 	.db #0x00	; 0
   0ABF 00                  383 	.db #0x00	; 0
   0AC0 2A                  384 	.db #0x2a	; 42
   0AC1 00                  385 	.db #0x00	; 0
   0AC2 00                  386 	.db #0x00	; 0
   0AC3 00                  387 	.db #0x00	; 0
   0AC4 00                  388 	.db #0x00	; 0
   0AC5                     389 _tiles0_sp_24:
   0AC5 30                  390 	.db #0x30	; 48	'0'
   0AC6 20                  391 	.db #0x20	; 32
   0AC7 30                  392 	.db #0x30	; 48	'0'
   0AC8 20                  393 	.db #0x20	; 32
   0AC9 30                  394 	.db #0x30	; 48	'0'
   0ACA 20                  395 	.db #0x20	; 32
   0ACB 00                  396 	.db #0x00	; 0
   0ACC 00                  397 	.db #0x00	; 0
   0ACD                     398 _tiles0_sp_25:
   0ACD 10                  399 	.db #0x10	; 16
   0ACE 30                  400 	.db #0x30	; 48	'0'
   0ACF 10                  401 	.db #0x10	; 16
   0AD0 30                  402 	.db #0x30	; 48	'0'
   0AD1 10                  403 	.db #0x10	; 16
   0AD2 30                  404 	.db #0x30	; 48	'0'
   0AD3 00                  405 	.db #0x00	; 0
   0AD4 00                  406 	.db #0x00	; 0
   0AD5                     407 _tiles0_sp_26:
   0AD5 00                  408 	.db #0x00	; 0
   0AD6 00                  409 	.db #0x00	; 0
   0AD7 00                  410 	.db #0x00	; 0
   0AD8 00                  411 	.db #0x00	; 0
   0AD9 00                  412 	.db #0x00	; 0
   0ADA 00                  413 	.db #0x00	; 0
   0ADB 00                  414 	.db #0x00	; 0
   0ADC 00                  415 	.db #0x00	; 0
   0ADD                     416 _tiles0_sp_27:
   0ADD 80                  417 	.db #0x80	; 128
   0ADE C0                  418 	.db #0xc0	; 192
   0ADF 80                  419 	.db #0x80	; 128
   0AE0 C0                  420 	.db #0xc0	; 192
   0AE1 80                  421 	.db #0x80	; 128
   0AE2 C0                  422 	.db #0xc0	; 192
   0AE3 80                  423 	.db #0x80	; 128
   0AE4 C0                  424 	.db #0xc0	; 192
   0AE5                     425 _tiles0_sp_28:
   0AE5 C0                  426 	.db #0xc0	; 192
   0AE6 C0                  427 	.db #0xc0	; 192
   0AE7 C0                  428 	.db #0xc0	; 192
   0AE8 C0                  429 	.db #0xc0	; 192
   0AE9 C0                  430 	.db #0xc0	; 192
   0AEA C0                  431 	.db #0xc0	; 192
   0AEB C0                  432 	.db #0xc0	; 192
   0AEC C0                  433 	.db #0xc0	; 192
   0AED                     434 _tiles0_sp_29:
   0AED C0                  435 	.db #0xc0	; 192
   0AEE 80                  436 	.db #0x80	; 128
   0AEF C0                  437 	.db #0xc0	; 192
   0AF0 80                  438 	.db #0x80	; 128
   0AF1 C0                  439 	.db #0xc0	; 192
   0AF2 C0                  440 	.db #0xc0	; 192
   0AF3 C0                  441 	.db #0xc0	; 192
   0AF4 C0                  442 	.db #0xc0	; 192
   0AF5                     443 _tiles0_sp_30:
   0AF5 40                  444 	.db #0x40	; 64
   0AF6 40                  445 	.db #0x40	; 64
   0AF7 40                  446 	.db #0x40	; 64
   0AF8 40                  447 	.db #0x40	; 64
   0AF9 C0                  448 	.db #0xc0	; 192
   0AFA 40                  449 	.db #0x40	; 64
   0AFB C0                  450 	.db #0xc0	; 192
   0AFC 40                  451 	.db #0x40	; 64
   0AFD                     452 _tiles0_sp_31:
   0AFD 00                  453 	.db #0x00	; 0
   0AFE 00                  454 	.db #0x00	; 0
   0AFF 00                  455 	.db #0x00	; 0
   0B00 00                  456 	.db #0x00	; 0
   0B01 00                  457 	.db #0x00	; 0
   0B02 00                  458 	.db #0x00	; 0
   0B03 00                  459 	.db #0x00	; 0
   0B04 00                  460 	.db #0x00	; 0
   0B05                     461 _tiles0_sp_32:
   0B05 10                  462 	.db #0x10	; 16
   0B06 30                  463 	.db #0x30	; 48	'0'
   0B07 10                  464 	.db #0x10	; 16
   0B08 30                  465 	.db #0x30	; 48	'0'
   0B09 10                  466 	.db #0x10	; 16
   0B0A 30                  467 	.db #0x30	; 48	'0'
   0B0B 00                  468 	.db #0x00	; 0
   0B0C 00                  469 	.db #0x00	; 0
   0B0D                     470 _tiles0_sp_33:
   0B0D 30                  471 	.db #0x30	; 48	'0'
   0B0E 20                  472 	.db #0x20	; 32
   0B0F 30                  473 	.db #0x30	; 48	'0'
   0B10 20                  474 	.db #0x20	; 32
   0B11 30                  475 	.db #0x30	; 48	'0'
   0B12 20                  476 	.db #0x20	; 32
   0B13 00                  477 	.db #0x00	; 0
   0B14 00                  478 	.db #0x00	; 0
   0B15                     479 _tiles0_sp_34:
   0B15 00                  480 	.db #0x00	; 0
   0B16 00                  481 	.db #0x00	; 0
   0B17 00                  482 	.db #0x00	; 0
   0B18 00                  483 	.db #0x00	; 0
   0B19 00                  484 	.db #0x00	; 0
   0B1A 00                  485 	.db #0x00	; 0
   0B1B 00                  486 	.db #0x00	; 0
   0B1C 00                  487 	.db #0x00	; 0
   0B1D                     488 _tiles0_sp_35:
   0B1D 80                  489 	.db #0x80	; 128
   0B1E C0                  490 	.db #0xc0	; 192
   0B1F 80                  491 	.db #0x80	; 128
   0B20 C0                  492 	.db #0xc0	; 192
   0B21 80                  493 	.db #0x80	; 128
   0B22 C0                  494 	.db #0xc0	; 192
   0B23 80                  495 	.db #0x80	; 128
   0B24 C0                  496 	.db #0xc0	; 192
   0B25                     497 _tiles0_sp_36:
   0B25 C0                  498 	.db #0xc0	; 192
   0B26 C0                  499 	.db #0xc0	; 192
   0B27 C0                  500 	.db #0xc0	; 192
   0B28 C0                  501 	.db #0xc0	; 192
   0B29 C0                  502 	.db #0xc0	; 192
   0B2A C0                  503 	.db #0xc0	; 192
   0B2B C0                  504 	.db #0xc0	; 192
   0B2C C0                  505 	.db #0xc0	; 192
   0B2D                     506 _tiles0_sp_37:
   0B2D C0                  507 	.db #0xc0	; 192
   0B2E C0                  508 	.db #0xc0	; 192
   0B2F C0                  509 	.db #0xc0	; 192
   0B30 C0                  510 	.db #0xc0	; 192
   0B31 C0                  511 	.db #0xc0	; 192
   0B32 C0                  512 	.db #0xc0	; 192
   0B33 C0                  513 	.db #0xc0	; 192
   0B34 C0                  514 	.db #0xc0	; 192
   0B35                     515 _tiles0_sp_38:
   0B35 C0                  516 	.db #0xc0	; 192
   0B36 40                  517 	.db #0x40	; 64
   0B37 C0                  518 	.db #0xc0	; 192
   0B38 40                  519 	.db #0x40	; 64
   0B39 C0                  520 	.db #0xc0	; 192
   0B3A 40                  521 	.db #0x40	; 64
   0B3B C0                  522 	.db #0xc0	; 192
   0B3C 40                  523 	.db #0x40	; 64
   0B3D                     524 _tiles0_sp_39:
   0B3D 00                  525 	.db #0x00	; 0
   0B3E 00                  526 	.db #0x00	; 0
   0B3F 00                  527 	.db #0x00	; 0
   0B40 00                  528 	.db #0x00	; 0
   0B41 00                  529 	.db #0x00	; 0
   0B42 00                  530 	.db #0x00	; 0
   0B43 00                  531 	.db #0x00	; 0
   0B44 00                  532 	.db #0x00	; 0
   0B45                     533 _tiles0_sp_40:
   0B45 30                  534 	.db #0x30	; 48	'0'
   0B46 00                  535 	.db #0x00	; 0
   0B47 30                  536 	.db #0x30	; 48	'0'
   0B48 00                  537 	.db #0x00	; 0
   0B49 30                  538 	.db #0x30	; 48	'0'
   0B4A 00                  539 	.db #0x00	; 0
   0B4B 30                  540 	.db #0x30	; 48	'0'
   0B4C 00                  541 	.db #0x00	; 0
   0B4D                     542 _tiles0_sp_41:
   0B4D 00                  543 	.db #0x00	; 0
   0B4E 00                  544 	.db #0x00	; 0
   0B4F 00                  545 	.db #0x00	; 0
   0B50 3C                  546 	.db #0x3c	; 60
   0B51 00                  547 	.db #0x00	; 0
   0B52 33                  548 	.db #0x33	; 51	'3'
   0B53 00                  549 	.db #0x00	; 0
   0B54 33                  550 	.db #0x33	; 51	'3'
   0B55                     551 _tiles0_sp_42:
   0B55 00                  552 	.db #0x00	; 0
   0B56 00                  553 	.db #0x00	; 0
   0B57 3C                  554 	.db #0x3c	; 60
   0B58 28                  555 	.db #0x28	; 40
   0B59 39                  556 	.db #0x39	; 57	'9'
   0B5A 22                  557 	.db #0x22	; 34
   0B5B 39                  558 	.db #0x39	; 57	'9'
   0B5C 22                  559 	.db #0x22	; 34
   0B5D                     560 _tiles0_sp_43:
   0B5D 80                  561 	.db #0x80	; 128
   0B5E C0                  562 	.db #0xc0	; 192
   0B5F 80                  563 	.db #0x80	; 128
   0B60 C0                  564 	.db #0xc0	; 192
   0B61 80                  565 	.db #0x80	; 128
   0B62 C0                  566 	.db #0xc0	; 192
   0B63 80                  567 	.db #0x80	; 128
   0B64 C0                  568 	.db #0xc0	; 192
   0B65                     569 _tiles0_sp_44:
   0B65 C0                  570 	.db #0xc0	; 192
   0B66 C0                  571 	.db #0xc0	; 192
   0B67 C0                  572 	.db #0xc0	; 192
   0B68 C0                  573 	.db #0xc0	; 192
   0B69 C0                  574 	.db #0xc0	; 192
   0B6A C0                  575 	.db #0xc0	; 192
   0B6B C0                  576 	.db #0xc0	; 192
   0B6C C0                  577 	.db #0xc0	; 192
   0B6D                     578 _tiles0_sp_45:
   0B6D C0                  579 	.db #0xc0	; 192
   0B6E C0                  580 	.db #0xc0	; 192
   0B6F C0                  581 	.db #0xc0	; 192
   0B70 C0                  582 	.db #0xc0	; 192
   0B71 C0                  583 	.db #0xc0	; 192
   0B72 C0                  584 	.db #0xc0	; 192
   0B73 C0                  585 	.db #0xc0	; 192
   0B74 C0                  586 	.db #0xc0	; 192
   0B75                     587 _tiles0_sp_46:
   0B75 C0                  588 	.db #0xc0	; 192
   0B76 40                  589 	.db #0x40	; 64
   0B77 C0                  590 	.db #0xc0	; 192
   0B78 40                  591 	.db #0x40	; 64
   0B79 C0                  592 	.db #0xc0	; 192
   0B7A 40                  593 	.db #0x40	; 64
   0B7B C0                  594 	.db #0xc0	; 192
   0B7C 40                  595 	.db #0x40	; 64
   0B7D                     596 _tiles0_sp_47:
   0B7D 00                  597 	.db #0x00	; 0
   0B7E 00                  598 	.db #0x00	; 0
   0B7F 00                  599 	.db #0x00	; 0
   0B80 00                  600 	.db #0x00	; 0
   0B81 00                  601 	.db #0x00	; 0
   0B82 00                  602 	.db #0x00	; 0
   0B83 00                  603 	.db #0x00	; 0
   0B84 00                  604 	.db #0x00	; 0
   0B85                     605 _tiles0_sp_48:
   0B85 00                  606 	.db #0x00	; 0
   0B86 30                  607 	.db #0x30	; 48	'0'
   0B87 00                  608 	.db #0x00	; 0
   0B88 30                  609 	.db #0x30	; 48	'0'
   0B89 00                  610 	.db #0x00	; 0
   0B8A 30                  611 	.db #0x30	; 48	'0'
   0B8B 00                  612 	.db #0x00	; 0
   0B8C 30                  613 	.db #0x30	; 48	'0'
   0B8D                     614 _tiles0_sp_49:
   0B8D 00                  615 	.db #0x00	; 0
   0B8E 00                  616 	.db #0x00	; 0
   0B8F 00                  617 	.db #0x00	; 0
   0B90 00                  618 	.db #0x00	; 0
   0B91 00                  619 	.db #0x00	; 0
   0B92 00                  620 	.db #0x00	; 0
   0B93 00                  621 	.db #0x00	; 0
   0B94 00                  622 	.db #0x00	; 0
   0B95                     623 _tiles0_sp_50:
   0B95 28                  624 	.db #0x28	; 40
   0B96 00                  625 	.db #0x00	; 0
   0B97 28                  626 	.db #0x28	; 40
   0B98 00                  627 	.db #0x00	; 0
   0B99 28                  628 	.db #0x28	; 40
   0B9A 00                  629 	.db #0x00	; 0
   0B9B 28                  630 	.db #0x28	; 40
   0B9C 00                  631 	.db #0x00	; 0
   0B9D                     632 _tiles0_sp_51:
   0B9D 80                  633 	.db #0x80	; 128
   0B9E C0                  634 	.db #0xc0	; 192
   0B9F 80                  635 	.db #0x80	; 128
   0BA0 C0                  636 	.db #0xc0	; 192
   0BA1 80                  637 	.db #0x80	; 128
   0BA2 C0                  638 	.db #0xc0	; 192
   0BA3 80                  639 	.db #0x80	; 128
   0BA4 C0                  640 	.db #0xc0	; 192
   0BA5                     641 _tiles0_sp_52:
   0BA5 C0                  642 	.db #0xc0	; 192
   0BA6 C0                  643 	.db #0xc0	; 192
   0BA7 C0                  644 	.db #0xc0	; 192
   0BA8 C0                  645 	.db #0xc0	; 192
   0BA9 C0                  646 	.db #0xc0	; 192
   0BAA C0                  647 	.db #0xc0	; 192
   0BAB C0                  648 	.db #0xc0	; 192
   0BAC C0                  649 	.db #0xc0	; 192
   0BAD                     650 _tiles0_sp_53:
   0BAD C0                  651 	.db #0xc0	; 192
   0BAE C0                  652 	.db #0xc0	; 192
   0BAF C0                  653 	.db #0xc0	; 192
   0BB0 C0                  654 	.db #0xc0	; 192
   0BB1 C0                  655 	.db #0xc0	; 192
   0BB2 C0                  656 	.db #0xc0	; 192
   0BB3 C0                  657 	.db #0xc0	; 192
   0BB4 C0                  658 	.db #0xc0	; 192
   0BB5                     659 _tiles0_sp_54:
   0BB5 C0                  660 	.db #0xc0	; 192
   0BB6 40                  661 	.db #0x40	; 64
   0BB7 C0                  662 	.db #0xc0	; 192
   0BB8 40                  663 	.db #0x40	; 64
   0BB9 C0                  664 	.db #0xc0	; 192
   0BBA 40                  665 	.db #0x40	; 64
   0BBB C0                  666 	.db #0xc0	; 192
   0BBC 40                  667 	.db #0x40	; 64
   0BBD                     668 _tiles0_sp_55:
   0BBD 30                  669 	.db #0x30	; 48	'0'
   0BBE 00                  670 	.db #0x00	; 0
   0BBF 30                  671 	.db #0x30	; 48	'0'
   0BC0 00                  672 	.db #0x00	; 0
   0BC1 30                  673 	.db #0x30	; 48	'0'
   0BC2 30                  674 	.db #0x30	; 48	'0'
   0BC3 30                  675 	.db #0x30	; 48	'0'
   0BC4 30                  676 	.db #0x30	; 48	'0'
   0BC5                     677 _tiles0_sp_56:
   0BC5 30                  678 	.db #0x30	; 48	'0'
   0BC6 30                  679 	.db #0x30	; 48	'0'
   0BC7 30                  680 	.db #0x30	; 48	'0'
   0BC8 30                  681 	.db #0x30	; 48	'0'
   0BC9 00                  682 	.db #0x00	; 0
   0BCA 00                  683 	.db #0x00	; 0
   0BCB 00                  684 	.db #0x00	; 0
   0BCC 00                  685 	.db #0x00	; 0
   0BCD                     686 _tiles0_sp_57:
   0BCD 00                  687 	.db #0x00	; 0
   0BCE 00                  688 	.db #0x00	; 0
   0BCF 00                  689 	.db #0x00	; 0
   0BD0 00                  690 	.db #0x00	; 0
   0BD1 00                  691 	.db #0x00	; 0
   0BD2 00                  692 	.db #0x00	; 0
   0BD3 00                  693 	.db #0x00	; 0
   0BD4 00                  694 	.db #0x00	; 0
   0BD5                     695 _tiles0_sp_58:
   0BD5 28                  696 	.db #0x28	; 40
   0BD6 00                  697 	.db #0x00	; 0
   0BD7 28                  698 	.db #0x28	; 40
   0BD8 00                  699 	.db #0x00	; 0
   0BD9 28                  700 	.db #0x28	; 40
   0BDA 00                  701 	.db #0x00	; 0
   0BDB 28                  702 	.db #0x28	; 40
   0BDC 00                  703 	.db #0x00	; 0
   0BDD                     704 _tiles0_sp_59:
   0BDD 00                  705 	.db #0x00	; 0
   0BDE 00                  706 	.db #0x00	; 0
   0BDF 00                  707 	.db #0x00	; 0
   0BE0 00                  708 	.db #0x00	; 0
   0BE1 00                  709 	.db #0x00	; 0
   0BE2 00                  710 	.db #0x00	; 0
   0BE3 00                  711 	.db #0x00	; 0
   0BE4 00                  712 	.db #0x00	; 0
   0BE5                     713 _tiles0_sp_60:
   0BE5 30                  714 	.db #0x30	; 48	'0'
   0BE6 30                  715 	.db #0x30	; 48	'0'
   0BE7 30                  716 	.db #0x30	; 48	'0'
   0BE8 30                  717 	.db #0x30	; 48	'0'
   0BE9 30                  718 	.db #0x30	; 48	'0'
   0BEA 00                  719 	.db #0x00	; 0
   0BEB 30                  720 	.db #0x30	; 48	'0'
   0BEC 00                  721 	.db #0x00	; 0
   0BED                     722 _tiles0_sp_61:
   0BED 30                  723 	.db #0x30	; 48	'0'
   0BEE 30                  724 	.db #0x30	; 48	'0'
   0BEF 30                  725 	.db #0x30	; 48	'0'
   0BF0 30                  726 	.db #0x30	; 48	'0'
   0BF1 00                  727 	.db #0x00	; 0
   0BF2 30                  728 	.db #0x30	; 48	'0'
   0BF3 00                  729 	.db #0x00	; 0
   0BF4 30                  730 	.db #0x30	; 48	'0'
   0BF5                     731 _tiles0_sp_62:
   0BF5 00                  732 	.db #0x00	; 0
   0BF6 00                  733 	.db #0x00	; 0
   0BF7 00                  734 	.db #0x00	; 0
   0BF8 00                  735 	.db #0x00	; 0
   0BF9 30                  736 	.db #0x30	; 48	'0'
   0BFA 30                  737 	.db #0x30	; 48	'0'
   0BFB 30                  738 	.db #0x30	; 48	'0'
   0BFC 30                  739 	.db #0x30	; 48	'0'
   0BFD                     740 _tiles0_sp_63:
   0BFD 00                  741 	.db #0x00	; 0
   0BFE 30                  742 	.db #0x30	; 48	'0'
   0BFF 00                  743 	.db #0x00	; 0
   0C00 30                  744 	.db #0x30	; 48	'0'
   0C01 30                  745 	.db #0x30	; 48	'0'
   0C02 30                  746 	.db #0x30	; 48	'0'
   0C03 30                  747 	.db #0x30	; 48	'0'
   0C04 30                  748 	.db #0x30	; 48	'0'
                            749 	.area _INITIALIZER
                            750 	.area _CABS (ABS)
