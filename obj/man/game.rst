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



                             24 .include "cpctelera.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;; All CPCtelera include files
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             20 .include "macros/allmacros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             19 .include "macros/cpct_maths.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Math Macros
                             21 ;;
                             22 ;;    Useful assembler macros for doing common math operations
                             23 ;;
                             24 
                             25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             26 ;; Macro: add_REGPAIR_a 
                             27 ;;
                             28 ;;    Performs the operation REGPAIR = REGPAIR + A. REGPAIR is any given pair of 8-bit registers.
                             29 ;;
                             30 ;; ASM Definition:
                             31 ;;    .macro <add_REGPAIR_a> RH, RL
                             32 ;;
                             33 ;; Parameters:
                             34 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                             35 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                             36 ;; 
                             37 ;; Input Registers: 
                             38 ;;    RH:RL - 16-value used as left-operand and final storage for the sum
                             39 ;;    A     - Second sum operand
                             40 ;;
                             41 ;; Return Value:
                             42 ;;    RH:RL - Holds the sum of RH:RL + A
                             43 ;;
                             44 ;; Details:
                             45 ;;    This macro performs the sum of RH:RL + A and stores it directly on RH:RL.
                             46 ;; It uses only RH:RL and A to perform the operation.
                             47 ;;
                             48 ;; Modified Registers: 
                             49 ;;    A, RH, RL
                             50 ;;
                             51 ;; Required memory:
                             52 ;;    5 bytes
                             53 ;;
                             54 ;; Time Measures:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             55 ;; (start code)
                             56 ;;  Case | microSecs(us) | CPU Cycles
                             57 ;; ------------------------------------
                             58 ;;  Any  |       5       |     20
                             59 ;; ------------------------------------
                             60 ;; (end code)
                             61 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             62 .macro add_REGPAIR_a rh, rl
                             63    ;; First Perform RH = E + A
                             64    add rl    ;; [1] A' = RL + A 
                             65    ld  rl, a ;; [1] RL' = A' = RL + A. It might generate Carry that must be added to RH
                             66    
                             67    ;; Then Perform RH = RH + Carry 
                             68    adc rh    ;; [1] A'' = A' + RH + Carry = RL + A + RH + Carry
                             69    sub rl    ;; [1] Remove RL'. A''' = A'' - RL' = RL + A + RH + Carry - (RL + A) = RH + Carry
                             70    ld  rh, a ;; [1] Save into RH (RH' = A''' = RH + Carry)
                             71 .endm
                             72 
                             73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             74 ;; Macro: add_de_a
                             75 ;;
                             76 ;;    Performs the operation DE = DE + A
                             77 ;;
                             78 ;; ASM Definition:
                             79 ;;    .macro <add_de_a>
                             80 ;;
                             81 ;; Parameters:
                             82 ;;    None
                             83 ;; 
                             84 ;; Input Registers: 
                             85 ;;    DE    - First sum operand and Destination Register
                             86 ;;    A     - Second sum operand
                             87 ;;
                             88 ;; Return Value:
                             89 ;;    DE - Holds the sum of DE + A
                             90 ;;
                             91 ;; Details:
                             92 ;;    This macro performs the sum of DE + A and stores it directly on DE.
                             93 ;; It uses only DE and A to perform the operation.
                             94 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                             95 ;;
                             96 ;; Modified Registers: 
                             97 ;;    A, DE
                             98 ;;
                             99 ;; Required memory:
                            100 ;;    5 bytes
                            101 ;;
                            102 ;; Time Measures:
                            103 ;; (start code)
                            104 ;;  Case | microSecs(us) | CPU Cycles
                            105 ;; ------------------------------------
                            106 ;;  Any  |       5       |     20
                            107 ;; ------------------------------------
                            108 ;; (end code)
                            109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                            110 .macro add_de_a
                            111    add_REGPAIR_a  d, e
                            112 .endm
                            113 
                            114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            115 ;; Macro: add_hl_a
                            116 ;;
                            117 ;;    Performs the operation HL = HL + A
                            118 ;;
                            119 ;; ASM Definition:
                            120 ;;    .macro <add_hl_a>
                            121 ;;
                            122 ;; Parameters:
                            123 ;;    None
                            124 ;; 
                            125 ;; Input Registers: 
                            126 ;;    HL    - First sum operand and Destination Register
                            127 ;;    A     - Second sum operand
                            128 ;;
                            129 ;; Return Value:
                            130 ;;    HL - Holds the sum of HL + A
                            131 ;;
                            132 ;; Details:
                            133 ;;    This macro performs the sum of HL + A and stores it directly on HL.
                            134 ;; It uses only HL and A to perform the operation.
                            135 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            136 ;;
                            137 ;; Modified Registers: 
                            138 ;;    A, HL
                            139 ;;
                            140 ;; Required memory:
                            141 ;;    5 bytes
                            142 ;;
                            143 ;; Time Measures:
                            144 ;; (start code)
                            145 ;;  Case | microSecs(us) | CPU Cycles
                            146 ;; ------------------------------------
                            147 ;;  Any  |       5       |     20
                            148 ;; ------------------------------------
                            149 ;; (end code)
                            150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            151 .macro add_hl_a
                            152    add_REGPAIR_a  h, l
                            153 .endm
                            154 
                            155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            156 ;; Macro: add_bc_a
                            157 ;;
                            158 ;;    Performs the operation BC = BC + A
                            159 ;;
                            160 ;; ASM Definition:
                            161 ;;    .macro <add_bc_a>
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    None
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                            165 ;; 
                            166 ;; Input Registers: 
                            167 ;;    BC    - First sum operand and Destination Register
                            168 ;;    A     - Second sum operand
                            169 ;;
                            170 ;; Return Value:
                            171 ;;    BC - Holds the sum of BC + A
                            172 ;;
                            173 ;; Details:
                            174 ;;    This macro performs the sum of BC + A and stores it directly on BC.
                            175 ;; It uses only BC and A to perform the operation.
                            176 ;;    This macro is a direct instantiation of the macro <add_REGPAIR_a>.
                            177 ;;
                            178 ;; Modified Registers: 
                            179 ;;    A, BC
                            180 ;;
                            181 ;; Required memory:
                            182 ;;    5 bytes
                            183 ;;
                            184 ;; Time Measures:
                            185 ;; (start code)
                            186 ;;  Case | microSecs(us) | CPU Cycles
                            187 ;; ------------------------------------
                            188 ;;  Any  |       5       |     20
                            189 ;; ------------------------------------
                            190 ;; (end code)
                            191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            192 .macro add_bc_a
                            193    add_REGPAIR_a  b, c
                            194 .endm
                            195 
                            196 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            197 ;; Macro: sub_REGPAIR_a 
                            198 ;;
                            199 ;;    Performs the operation REGPAIR = REGPAIR - A. REGPAIR is any given pair of 8-bit registers.
                            200 ;;
                            201 ;; ASM Definition:
                            202 ;;    .macro <sub_REGPAIR_a> RH, RL
                            203 ;;
                            204 ;; Parameters:
                            205 ;;    RH    - Register 1 of the REGPAIR. Holds higher-byte value
                            206 ;;    RL    - Register 2 of the REGPAIR. Holds lower-byte value
                            207 ;;  ?JMPLBL - Optional Jump label. A temporal one will be produced if none is given.
                            208 ;; 
                            209 ;; Input Registers: 
                            210 ;;    RH:RL - 16-value used as left-operand and final storage for the subtraction
                            211 ;;    A     - Second subtraction operand (A > 0)
                            212 ;;
                            213 ;; Preconditions:
                            214 ;;    A > 0 - Value in register A is considered to be unsigned and must be greater
                            215 ;;            than 0 for this macro to work properly.
                            216 ;;
                            217 ;; Return Value:
                            218 ;;    RH:RL - Holds the result of RH:RL - A
                            219 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                            220 ;; Details:
                            221 ;;    This macro performs the subtraction of RH:RL - A and stores it directly on RH:RL.
                            222 ;; It uses only RH:RL and A to perform the operation.
                            223 ;;    With respect to the optional label ?JMPLBL, it is often better not to provide 
                            224 ;; this parameter. A temporal local symbol will be automatically generated for that label.
                            225 ;; Only provide it when you have a specific reason to do that.
                            226 ;;
                            227 ;; Modified Registers: 
                            228 ;;    A, RH, RL
                            229 ;;
                            230 ;; Required memory:
                            231 ;;    7 bytes
                            232 ;;
                            233 ;; Time Measures:
                            234 ;; (start code)
                            235 ;;  Case | microSecs(us) | CPU Cycles
                            236 ;; ------------------------------------
                            237 ;;  Any  |       7       |     28
                            238 ;; ------------------------------------
                            239 ;; (end code)
                            240 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            241 .macro sub_REGPAIR_a rh, rl, ?jmplbl
                            242    ;; First Perform A' = A - 1 - RL 
                            243    ;; (Inverse subtraction minus 1, used  to test for Carry, needed to know when to subtract 1 from RH)
                            244    dec    a          ;; [1] --A (In case A == RL, inverse subtraction should produce carry not to decrement RH)
                            245    sub   rl          ;; [1] A' = A - 1 - RL
                            246    jr     c, jmplbl  ;; [2/3] If A <= RL, Carry will be produced, and no decrement of RH is required, so jump over it
                            247      dec   rh        ;; [1] --RH (A > RL, so RH must be decremented)
                            248 jmplbl:   
                            249    ;; Now invert A to get the subtraction we wanted 
                            250    ;; { RL' = -A' - 1 = -(A - 1 - RL) - 1 = RL - A }
                            251    cpl            ;; [1] A'' = RL - A (Original subtraction we wanted, calculated trough one's complement of A')
                            252    ld    rl, a    ;; [1] Save into RL (RL' = RL - A)
                            253 .endm
                            254 
                            255 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            256 ;; Macro: sub_de_a 
                            257 ;;
                            258 ;;    Performs the operation DE = DE - A. DE is any given pair of 8-bit registers.
                            259 ;;
                            260 ;; ASM Definition:
                            261 ;;    .macro <sub_de_a>
                            262 ;; 
                            263 ;; Input Registers: 
                            264 ;;    DE - 16-value used as left-operand and final storage for the subtraction
                            265 ;;    A  - Second subtraction operand
                            266 ;;
                            267 ;; Return Value:
                            268 ;;    DE - Holds the result of DE - A
                            269 ;;
                            270 ;; Details:
                            271 ;;    This macro performs the subtraction of DE - A and stores it directly on DE.
                            272 ;; It uses only DE and A to perform the operation.
                            273 ;;
                            274 ;; Modified Registers: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            275 ;;    A, DE
                            276 ;;
                            277 ;; Required memory:
                            278 ;;    7 bytes
                            279 ;;
                            280 ;; Time Measures:
                            281 ;; (start code)
                            282 ;;  Case | microSecs(us) | CPU Cycles
                            283 ;; ------------------------------------
                            284 ;;  Any  |       7       |     28
                            285 ;; ------------------------------------
                            286 ;; (end code)
                            287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            288 .macro sub_de_a
                            289    sub_REGPAIR_a  d, e
                            290 .endm
                            291 
                            292 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            293 ;; Macro: sub_hl_a 
                            294 ;;
                            295 ;;    Performs the operation HL = HL - A. HL is any given pair of 8-bit registers.
                            296 ;;
                            297 ;; ASM Definition:
                            298 ;;    .macro <sub_hl_a>
                            299 ;; 
                            300 ;; Input Registers: 
                            301 ;;    HL - 16-value used as left-operand and final storage for the subtraction
                            302 ;;    A  - Second subtraction operand
                            303 ;;
                            304 ;; Return Value:
                            305 ;;    HL - Holds the result of HL - A
                            306 ;;
                            307 ;; Details:
                            308 ;;    This macro performs the subtraction of HL - A and stores it directly on HL.
                            309 ;; It uses only HL and A to perform the operation.
                            310 ;;
                            311 ;; Modified Registers: 
                            312 ;;    A, HL
                            313 ;;
                            314 ;; Required memory:
                            315 ;;    7 bytes
                            316 ;;
                            317 ;; Time Measures:
                            318 ;; (start code)
                            319 ;;  Case | microSecs(us) | CPU Cycles
                            320 ;; ------------------------------------
                            321 ;;  Any  |       7       |     28
                            322 ;; ------------------------------------
                            323 ;; (end code)
                            324 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            325 .macro sub_hl_a
                            326    sub_REGPAIR_a  h, l
                            327 .endm
                            328 
                            329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            330 ;; Macro: sub_bc_a 
                            331 ;;
                            332 ;;    Performs the operation BC = BC - A. BC is any given pair of 8-bit registers.
                            333 ;;
                            334 ;; ASM Definition:
                            335 ;;    .macro <sub_bc_a>
                            336 ;; 
                            337 ;; Input Registers: 
                            338 ;;    BC - 16-value used as left-operand and final storage for the subtraction
                            339 ;;    A  - Second subtraction operand
                            340 ;;
                            341 ;; Return Value:
                            342 ;;    BC - Holds the result of BC - A
                            343 ;;
                            344 ;; Details:
                            345 ;;    This macro performs the subtraction of BC - A and stores it directly on BC.
                            346 ;; It uses only BC and A to perform the operation.
                            347 ;;
                            348 ;; Modified Registers: 
                            349 ;;    A, BC
                            350 ;;
                            351 ;; Required memory:
                            352 ;;    7 bytes
                            353 ;;
                            354 ;; Time Measures:
                            355 ;; (start code)
                            356 ;;  Case | microSecs(us) | CPU Cycles
                            357 ;; ------------------------------------
                            358 ;;  Any  |       7       |     28
                            359 ;; ------------------------------------
                            360 ;; (end code)
                            361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            362 .macro sub_bc_a
                            363    sub_REGPAIR_a  b, c
                            364 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                             20 .include "macros/cpct_opcodeConstants.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Opcodes
                             21 ;;
                             22 ;;    Constant definitions of Z80 opcodes. This will be normally used as data
                             23 ;; for self-modifying code.
                             24 ;;
                             25 
                             26 ;; Constant: opc_JR
                             27 ;;    Opcode for "JR xx" instruction. Requires 1-byte parameter (xx)
                     0018    28 opc_JR   = 0x18
                             29 
                             30 ;; Constant: opc_LD_D
                             31 ;;    Opcode for "LD d, xx" instruction. Requires 1-byte parameter (xx)
                     0016    32 opc_LD_D = 0x16
                             33 
                             34 ;; Constant: opc_EI
                             35 ;;    Opcode for "EI" instruction. 
                     00FB    36 opc_EI = 0xFB
                             37 
                             38 ;; Constant: opc_DI
                             39 ;;    Opcode for "DI" instruction. 
                     00F3    40 opc_DI = 0xF3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                             21 .include "macros/cpct_reverseBits.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Reverse Bits
                             21 ;;
                             22 ;;    Useful macros for bit reversing and selecting in different ways. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             27 ;; Macro: cpctm_reverse_and_select_bits_of_A
                             28 ;;
                             29 ;;    Reorders the bits of A and mixes them letting the user select the 
                             30 ;; new order for the bits by using a selection mask.
                             31 ;;
                             32 ;; Parameters:
                             33 ;;    TReg          - An 8-bits register that will be used for intermediate calculations.
                             34 ;; This register may be one of these: B, C, D, E, H, L
                             35 ;;    SelectionMask - An 8-bits mask that will be used to select the bits to get from 
                             36 ;; the reordered bits. It might be an 8-bit register or even (hl).
                             37 ;; 
                             38 ;; Input Registers: 
                             39 ;;    A     - Byte to be reversed
                             40 ;;    TReg  - Should have a copy of A (same exact value)
                             41 ;;
                             42 ;; Return Value:
                             43 ;;    A - Resulting value with bits reversed and selected 
                             44 ;;
                             45 ;; Details:
                             46 ;;    This macro reorders the bits in A and mixes them with the same bits in
                             47 ;; their original order by using a *SelectionMask*. The process is as follows:
                             48 ;;
                             49 ;;    1. Consider the 8 bits of A = TReg = [01234567]
                             50 ;;    2. Reorder the 8 bits of A, producing A2 = [32547610]
                             51 ;;    2. Reorder the bits of TReg, producing TReg2 = [76103254]
                             52 ;;    3. Combines both reorders into final result using a *SelectionMask*. Each 
                             53 ;; 0 bit from the selection mask means "select bit from A2", whereas each 1 bit
                             54 ;; means "select bit from TReg2".
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                             55 ;;
                             56 ;;    For instance, a selection mask 0b11001100 will produce this result:
                             57 ;;
                             58 ;; (start code)
                             59 ;;       A2 = [ 32 54 76 10 ]
                             60 ;;    TReg2 = [ 76 10 32 54 ]
                             61 ;;  SelMask = [ 11 00 11 00 ] // 1 = TReg2-bits, 0 = A2-bits
                             62 ;;  ---------------------------
                             63 ;;   Result = [ 76 54 32 10 ]
                             64 ;; (end code)
                             65 ;;
                             66 ;;    Therefore, mask 0b11001100 produces the effect of reversing the bits of A
                             67 ;; completely. Other masks will produce different reorders of the bits in A, for
                             68 ;; different requirements or needs.
                             69 ;;
                             70 ;; Modified Registers: 
                             71 ;;    AF, TReg
                             72 ;;
                             73 ;; Required memory:
                             74 ;;    16 bytes
                             75 ;;
                             76 ;; Time Measures:
                             77 ;; (start code)
                             78 ;;  Case | microSecs(us) | CPU Cycles
                             79 ;; ------------------------------------
                             80 ;;  Any  |      16       |     64
                             81 ;; ------------------------------------
                             82 ;; (end code)
                             83 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             84 .macro cpctm_reverse_and_select_bits_of_A  TReg, SelectionMask
                             85    rlca            ;; [1] | Rotate left twice so that...
                             86    rlca            ;; [1] | ... A=[23456701]
                             87 
                             88    ;; Mix bits of TReg and A so that all bits are in correct relative order
                             89    ;; but displaced from their final desired location
                             90    xor TReg        ;; [1] TReg = [01234567] (original value)
                             91    and #0b01010101 ;; [2]    A = [23456701] (bits rotated twice left)
                             92    xor TReg        ;; [1]   A2 = [03254761] (TReg mixed with A to get bits in order)
                             93    
                             94    ;; Now get bits 54 and 10 in their right location and save them into TReg
                             95    rlca            ;; [1]    A = [ 32 54 76 10 ] (54 and 10 are in their desired place)
                             96    ld TReg, a      ;; [1] TReg = A (Save this bit location into TReg)
                             97    
                             98    ;; Now get bits 76 and 32 in their right location in A
                             99    rrca            ;; [1] | Rotate A right 4 times to...
                            100    rrca            ;; [1] | ... get bits 76 and 32 located at their ...
                            101    rrca            ;; [1] | ... desired location :
                            102    rrca            ;; [1] | ... A = [ 76 10 32 54 ] (76 and 32 are in their desired place)
                            103    
                            104    ;; Finally, mix bits from TReg and A to get all bits reversed and selected
                            105    xor TReg          ;; [1] TReg = [32547610] (Mixed bits with 54 & 10 in their right place)
                            106    and SelectionMask ;; [2]    A = [76103254] (Mixed bits with 76 & 32 in their right place)
                            107    xor TReg          ;; [1]   A2 = [xxxxxxxx] final value: bits of A reversed and selected using *SelectionMask*
                            108 .endm
                            109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                            110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            111 ;; Macro: cpctm_reverse_bits_of_A 
                            112 ;; Macro: cpctm_reverse_mode_2_pixels_of_A
                            113 ;;
                            114 ;;    Reverses the 8-bits of A, from [01234567] to [76543210]. This also reverses
                            115 ;; all pixels contained in A when A is in screen pixel format, mode 2.
                            116 ;;
                            117 ;; Parameters:
                            118 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            119 ;; This register may be one of these: B, C, D, E, H, L
                            120 ;; 
                            121 ;; Input Registers: 
                            122 ;;    A    - Byte to be reversed
                            123 ;;    TReg - Should have a copy of A (same exact value)
                            124 ;;
                            125 ;; Return Value:
                            126 ;;    A - Resulting value with bits reversed 
                            127 ;;
                            128 ;; Requires:
                            129 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            130 ;;
                            131 ;; Details:
                            132 ;;    This macro reverses the bits in A. If bits of A = [01234567], the final
                            133 ;; result after processing this macro will be A = [76543210]. Register TReg is
                            134 ;; used for intermediate calculations and its value is destroyed.
                            135 ;;
                            136 ;; Modified Registers: 
                            137 ;;    AF, TReg
                            138 ;;
                            139 ;; Required memory:
                            140 ;;    16 bytes
                            141 ;;
                            142 ;; Time Measures:
                            143 ;; (start code)
                            144 ;;  Case | microSecs(us) | CPU Cycles
                            145 ;; ------------------------------------
                            146 ;;  Any  |      16       |     64
                            147 ;; ------------------------------------
                            148 ;; (end code)
                            149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            150 .macro cpctm_reverse_bits_of_A  TReg
                            151    cpctm_reverse_and_select_bits_of_A  TReg, #0b11001100
                            152 .endm
                            153 .macro cpctm_reverse_mode_2_pixels_of_A   TReg
                            154    cpctm_reverse_bits_of_A  TReg
                            155 .endm
                            156 
                            157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            158 ;; Macro: cpctm_reverse_mode_1_pixels_of_A
                            159 ;;
                            160 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            161 ;; in screen pixel format, mode 1.
                            162 ;;
                            163 ;; Parameters:
                            164 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            165 ;; This register may be one of these: B, C, D, E, H, L
                            166 ;; 
                            167 ;; Input Registers: 
                            168 ;;    A    - Byte with pixel values to be reversed
                            169 ;;    TReg - Should have a copy of A (same exact value)
                            170 ;;
                            171 ;; Return Value:
                            172 ;;    A - Resulting byte with the 4 pixels values reversed in order
                            173 ;;
                            174 ;; Requires:
                            175 ;;   - Uses the macro <cpctm_reverse_and_select_bits_of_A>.
                            176 ;;
                            177 ;; Details:
                            178 ;;    This macro considers that A contains a byte that codifies 4 pixels in 
                            179 ;; screen pixel format, mode 1. It modifies A to reverse the order of its 4 
                            180 ;; contained pixel values left-to-right (1234 -> 4321). With respect to the 
                            181 ;; order of the 8-bits of A, the concrete operations performed is:
                            182 ;; (start code)
                            183 ;;    A = [01234567] == reverse-pixels ==> [32107654] = A2
                            184 ;; (end code)
                            185 ;;    You may want to check <cpct_px2byteM1> to know how bits codify both pixels
                            186 ;; in one single byte for screen pixel format, mode 1.
                            187 ;;
                            188 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            189 ;; destroying its original value (that should be same as A, at the start).
                            190 ;;
                            191 ;; Modified Registers: 
                            192 ;;    AF, TReg
                            193 ;;
                            194 ;; Required memory:
                            195 ;;    16 bytes
                            196 ;;
                            197 ;; Time Measures:
                            198 ;; (start code)
                            199 ;;  Case | microSecs(us) | CPU Cycles
                            200 ;; ------------------------------------
                            201 ;;  Any  |      16       |     64
                            202 ;; ------------------------------------
                            203 ;; (end code)
                            204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            205 .macro cpctm_reverse_mode_1_pixels_of_A  TReg
                            206    cpctm_reverse_and_select_bits_of_A  TReg, #0b00110011
                            207 .endm
                            208 
                            209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            210 ;; Macro: cpctm_reverse_mode_0_pixels_of_A
                            211 ;;
                            212 ;;    Reverses the order of pixel values contained in register A, assuming A is 
                            213 ;; in screen pixel format, mode 0.
                            214 ;;
                            215 ;; Parameters:
                            216 ;;    TReg - An 8-bits register that will be used for intermediate calculations.
                            217 ;; This register may be one of these: B, C, D, E, H, L
                            218 ;; 
                            219 ;; Input Registers: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



                            220 ;;    A    - Byte with pixel values to be reversed
                            221 ;;    TReg - Should have a copy of A (same exact value)
                            222 ;;
                            223 ;; Return Value:
                            224 ;;    A - Resulting byte with the 2 pixels values reversed in order
                            225 ;;
                            226 ;; Details:
                            227 ;;    This macro considers that A contains a byte that codifies 2 pixels in 
                            228 ;; screen pixel format, mode 0. It modifies A to reverse the order of its 2 
                            229 ;; contained pixel values left-to-right (12 -> 21). With respect to the 
                            230 ;; order of the 8-bits of A, the concrete operation performed is:
                            231 ;; (start code)
                            232 ;;    A = [01234567] == reverse-pixels ==> [10325476] = A2
                            233 ;; (end code)
                            234 ;;    You may want to check <cpct_px2byteM0> to know how bits codify both pixels
                            235 ;; in one single byte for screen pixel format, mode 0.
                            236 ;;
                            237 ;;    *TReg* is an 8-bit register that will be used for intermediate calculations,
                            238 ;; destroying its original value (that should be same as A, at the start).
                            239 ;;
                            240 ;; Modified Registers: 
                            241 ;;    AF, TReg
                            242 ;;
                            243 ;; Required memory:
                            244 ;;    7 bytes
                            245 ;;
                            246 ;; Time Measures:
                            247 ;; (start code)
                            248 ;;  Case | microSecs(us) | CPU Cycles
                            249 ;; ------------------------------------
                            250 ;;  Any  |       7       |     28
                            251 ;; ------------------------------------
                            252 ;; (end code)
                            253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            254 .macro cpctm_reverse_mode_0_pixels_of_A  TReg
                            255    rlca            ;; [1] | Rotate A twice to the left to get bits ordered...
                            256    rlca            ;; [1] | ... in the way we need for mixing, A = [23456701]
                            257   
                            258    ;; Mix TReg with A to get pixels reversed by reordering bits
                            259    xor TReg        ;; [1] | TReg = [01234567]
                            260    and #0b01010101 ;; [2] |    A = [23456701]
                            261    xor TReg        ;; [1] |   A2 = [03254761]
                            262    rrca            ;; [1] Rotate right to get pixels reversed A = [10325476]
                            263 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                             22 .include "macros/cpct_undocumentedOpcodes.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Undocumented Opcodes
                             21 ;;
                             22 ;;    Macros to clarify source code when using undocumented opcodes. Only
                             23 ;; valid to be used from assembly language (not from C).
                             24 ;;
                             25 
                             26 ;; Macro: jr__0
                             27 ;;    Opcode for "JR #0" instruction
                             28 ;; 
                             29 .macro jr__0
                             30    .DW #0x0018  ;; JR #00 (Normally used as a modifiable jump, as jr 0 is an infinite loop)
                             31 .endm
                             32 
                             33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             35 ;; SLL Instructions
                             36 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             38 
                             39 ;; Macro: sll__b
                             40 ;;    Opcode for "SLL b" instruction
                             41 ;; 
                             42 .macro sll__b
                             43    .db #0xCB, #0x30  ;; Opcode for sll b
                             44 .endm
                             45 
                             46 ;; Macro: sll__c
                             47 ;;    Opcode for "SLL c" instruction
                             48 ;; 
                             49 .macro sll__c
                             50    .db #0xCB, #0x31  ;; Opcode for sll c
                             51 .endm
                             52 
                             53 ;; Macro: sll__d
                             54 ;;    Opcode for "SLL d" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                             55 ;; 
                             56 .macro sll__d
                             57    .db #0xCB, #0x32  ;; Opcode for sll d
                             58 .endm
                             59 
                             60 ;; Macro: sll__e
                             61 ;;    Opcode for "SLL e" instruction
                             62 ;; 
                             63 .macro sll__e
                             64    .db #0xCB, #0x33  ;; Opcode for sll e
                             65 .endm
                             66 
                             67 ;; Macro: sll__h
                             68 ;;    Opcode for "SLL h" instruction
                             69 ;; 
                             70 .macro sll__h
                             71    .db #0xCB, #0x34  ;; Opcode for sll h
                             72 .endm
                             73 
                             74 ;; Macro: sll__l
                             75 ;;    Opcode for "SLL l" instruction
                             76 ;; 
                             77 .macro sll__l
                             78    .db #0xCB, #0x35  ;; Opcode for sll l
                             79 .endm
                             80 
                             81 ;; Macro: sll___hl_
                             82 ;;    Opcode for "SLL (hl)" instruction
                             83 ;; 
                             84 .macro sll___hl_
                             85    .db #0xCB, #0x36  ;; Opcode for sll (hl)
                             86 .endm
                             87 
                             88 ;; Macro: sll__a
                             89 ;;    Opcode for "SLL a" instruction
                             90 ;; 
                             91 .macro sll__a
                             92    .db #0xCB, #0x37  ;; Opcode for sll a
                             93 .endm
                             94 
                             95 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             97 ;; IXL Related Macros
                             98 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             99 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            100 
                            101 ;; Macro: ld__ixl    Value
                            102 ;;    Opcode for "LD ixl, Value" instruction
                            103 ;;  
                            104 ;; Parameters:
                            105 ;;    Value - An inmediate 8-bits value that will be loaded into ixl
                            106 ;; 
                            107 .macro ld__ixl    Value 
                            108    .db #0xDD, #0x2E, Value  ;; Opcode for ld ixl, Value
                            109 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



                            110 
                            111 ;; Macro: ld__ixl_a
                            112 ;;    Opcode for "LD ixl, a" instruction
                            113 ;; 
                            114 .macro ld__ixl_a
                            115    .dw #0x6FDD  ;; Opcode for ld ixl, a
                            116 .endm
                            117 
                            118 ;; Macro: ld__ixl_b
                            119 ;;    Opcode for "LD ixl, B" instruction
                            120 ;; 
                            121 .macro ld__ixl_b
                            122    .dw #0x68DD  ;; Opcode for ld ixl, b
                            123 .endm
                            124 
                            125 ;; Macro: ld__ixl_c
                            126 ;;    Opcode for "LD ixl, C" instruction
                            127 ;; 
                            128 .macro ld__ixl_c
                            129    .dw #0x69DD  ;; Opcode for ld ixl, c
                            130 .endm
                            131 
                            132 ;; Macro: ld__ixl_d
                            133 ;;    Opcode for "LD ixl, D" instruction
                            134 ;; 
                            135 .macro ld__ixl_d
                            136    .dw #0x6ADD  ;; Opcode for ld ixl, d
                            137 .endm
                            138 
                            139 ;; Macro: ld__ixl_e
                            140 ;;    Opcode for "LD ixl, E" instruction
                            141 ;; 
                            142 .macro ld__ixl_e
                            143    .dw #0x6BDD  ;; Opcode for ld ixl, e
                            144 .endm
                            145 
                            146 ;; Macro: ld__ixl_ixh
                            147 ;;    Opcode for "LD ixl, IXH" instruction
                            148 ;; 
                            149 .macro ld__ixl_ixh
                            150    .dw #0x6CDD  ;; Opcode for ld ixl, ixh
                            151 .endm
                            152 
                            153 ;; Macro: ld__a_ixl
                            154 ;;    Opcode for "LD A, ixl" instruction
                            155 ;; 
                            156 .macro ld__a_ixl
                            157    .dw #0x7DDD  ;; Opcode for ld a, ixl
                            158 .endm
                            159 
                            160 ;; Macro: ld__b_ixl
                            161 ;;    Opcode for "LD B, ixl" instruction
                            162 ;; 
                            163 .macro ld__b_ixl
                            164    .dw #0x45DD  ;; Opcode for ld b, ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            165 .endm
                            166 
                            167 ;; Macro: ld__c_ixl
                            168 ;;    Opcode for "LD c, ixl" instruction
                            169 ;; 
                            170 .macro ld__c_ixl
                            171    .dw #0x4DDD  ;; Opcode for ld c, ixl
                            172 .endm
                            173 
                            174 ;; Macro: ld__d_ixl
                            175 ;;    Opcode for "LD D, ixl" instruction
                            176 ;; 
                            177 .macro ld__d_ixl
                            178    .dw #0x55DD  ;; Opcode for ld d, ixl
                            179 .endm
                            180 
                            181 ;; Macro: ld__e_ixl
                            182 ;;    Opcode for "LD e, ixl" instruction
                            183 ;; 
                            184 .macro ld__e_ixl
                            185    .dw #0x5DDD  ;; Opcode for ld e, ixl
                            186 .endm
                            187 
                            188 ;; Macro: add__ixl
                            189 ;;    Opcode for "Add ixl" instruction
                            190 ;; 
                            191 .macro add__ixl
                            192    .dw #0x85DD  ;; Opcode for add ixl
                            193 .endm
                            194 
                            195 ;; Macro: sub__ixl
                            196 ;;    Opcode for "SUB ixl" instruction
                            197 ;; 
                            198 .macro sub__ixl
                            199    .dw #0x95DD  ;; Opcode for sub ixl
                            200 .endm
                            201 
                            202 ;; Macro: adc__ixl
                            203 ;;    Opcode for "ADC ixl" instruction
                            204 ;; 
                            205 .macro adc__ixl
                            206    .dw #0x8DDD  ;; Opcode for adc ixl
                            207 .endm
                            208 
                            209 ;; Macro: sbc__ixl
                            210 ;;    Opcode for "SBC ixl" instruction
                            211 ;; 
                            212 .macro sbc__ixl
                            213    .dw #0x9DDD  ;; Opcode for sbc ixl
                            214 .endm
                            215 
                            216 ;; Macro: and__ixl
                            217 ;;    Opcode for "AND ixl" instruction
                            218 ;; 
                            219 .macro and__ixl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



                            220    .dw #0xA5DD  ;; Opcode for and ixl
                            221 .endm
                            222 
                            223 ;; Macro: or__ixl
                            224 ;;    Opcode for "OR ixl" instruction
                            225 ;; 
                            226 .macro or__ixl
                            227    .dw #0xB5DD  ;; Opcode for or ixl
                            228 .endm
                            229 
                            230 ;; Macro: xor__ixl
                            231 ;;    Opcode for "XOR ixl" instruction
                            232 ;; 
                            233 .macro xor__ixl
                            234    .dw #0xADDD  ;; Opcode for xor ixl
                            235 .endm
                            236 
                            237 ;; Macro: cp__ixl
                            238 ;;    Opcode for "CP ixl" instruction
                            239 ;; 
                            240 .macro cp__ixl
                            241    .dw #0xBDDD  ;; Opcode for cp ixl
                            242 .endm
                            243 
                            244 ;; Macro: dec__ixl
                            245 ;;    Opcode for "DEC ixl" instruction
                            246 ;; 
                            247 .macro dec__ixl
                            248    .dw #0x2DDD  ;; Opcode for dec ixl
                            249 .endm
                            250 
                            251 ;; Macro: inc__ixl
                            252 ;;    Opcode for "INC ixl" instruction
                            253 ;; 
                            254 .macro inc__ixl
                            255    .dw #0x2CDD  ;; Opcode for inc ixl
                            256 .endm
                            257 
                            258 
                            259 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            261 ;; IXH Related Macros
                            262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            263 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            264 
                            265 ;; Macro: ld__ixh    Value
                            266 ;;    Opcode for "LD IXH, Value" instruction
                            267 ;;  
                            268 ;; Parameters:
                            269 ;;    Value - An inmediate 8-bits value that will be loaded into IXH
                            270 ;; 
                            271 .macro ld__ixh    Value 
                            272    .db #0xDD, #0x26, Value  ;; Opcode for ld ixh, Value
                            273 .endm
                            274 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 22.
Hexadecimal [16-Bits]



                            275 ;; Macro: ld__ixh_a
                            276 ;;    Opcode for "LD IXH, a" instruction
                            277 ;; 
                            278 .macro ld__ixh_a
                            279    .dw #0x67DD  ;; Opcode for ld ixh, a
                            280 .endm
                            281 
                            282 ;; Macro: ld__ixh_b
                            283 ;;    Opcode for "LD IXH, B" instruction
                            284 ;; 
                            285 .macro ld__ixh_b
                            286    .dw #0x60DD  ;; Opcode for ld ixh, b
                            287 .endm
                            288 
                            289 ;; Macro: ld__ixh_c
                            290 ;;    Opcode for "LD IXH, C" instruction
                            291 ;; 
                            292 .macro ld__ixh_c
                            293    .dw #0x61DD  ;; Opcode for ld ixh, c
                            294 .endm
                            295 
                            296 ;; Macro: ld__ixh_d
                            297 ;;    Opcode for "LD IXH, D" instruction
                            298 ;; 
                            299 .macro ld__ixh_d
                            300    .dw #0x62DD  ;; Opcode for ld ixh, d
                            301 .endm
                            302 
                            303 ;; Macro: ld__ixh_e
                            304 ;;    Opcode for "LD IXH, E" instruction
                            305 ;; 
                            306 .macro ld__ixh_e
                            307    .dw #0x63DD  ;; Opcode for ld ixh, e
                            308 .endm
                            309 
                            310 ;; Macro: ld__ixh_ixl
                            311 ;;    Opcode for "LD IXH, IXL" instruction
                            312 ;; 
                            313 .macro ld__ixh_ixl
                            314    .dw #0x65DD  ;; Opcode for ld ixh, ixl
                            315 .endm
                            316 
                            317 ;; Macro: ld__a_ixh
                            318 ;;    Opcode for "LD A, IXH" instruction
                            319 ;; 
                            320 .macro ld__a_ixh
                            321    .dw #0x7CDD  ;; Opcode for ld a, ixh
                            322 .endm
                            323 
                            324 ;; Macro: ld__b_ixh
                            325 ;;    Opcode for "LD B, IXH" instruction
                            326 ;; 
                            327 .macro ld__b_ixh
                            328    .dw #0x44DD  ;; Opcode for ld b, ixh
                            329 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 23.
Hexadecimal [16-Bits]



                            330 
                            331 ;; Macro: ld__c_ixh
                            332 ;;    Opcode for "LD c, IXH" instruction
                            333 ;; 
                            334 .macro ld__c_ixh
                            335    .dw #0x4CDD  ;; Opcode for ld c, ixh
                            336 .endm
                            337 
                            338 ;; Macro: ld__d_ixh
                            339 ;;    Opcode for "LD D, IXH" instruction
                            340 ;; 
                            341 .macro ld__d_ixh
                            342    .dw #0x54DD  ;; Opcode for ld d, ixh
                            343 .endm
                            344 
                            345 ;; Macro: ld__e_ixh
                            346 ;;    Opcode for "LD e, IXH" instruction
                            347 ;; 
                            348 .macro ld__e_ixh
                            349    .dw #0x5CDD  ;; Opcode for ld e, ixh
                            350 .endm
                            351 
                            352 ;; Macro: add__ixh
                            353 ;;    Opcode for "ADD IXH" instruction
                            354 ;; 
                            355 .macro add__ixh
                            356    .dw #0x84DD  ;; Opcode for add ixh
                            357 .endm
                            358 
                            359 ;; Macro: sub__ixh
                            360 ;;    Opcode for "SUB IXH" instruction
                            361 ;; 
                            362 .macro sub__ixh
                            363    .dw #0x94DD  ;; Opcode for sub ixh
                            364 .endm
                            365 
                            366 ;; Macro: adc__ixh
                            367 ;;    Opcode for "ADC IXH" instruction
                            368 ;; 
                            369 .macro adc__ixh
                            370    .dw #0x8CDD  ;; Opcode for adc ixh
                            371 .endm
                            372 
                            373 ;; Macro: sbc__ixh
                            374 ;;    Opcode for "SBC IXH" instruction
                            375 ;; 
                            376 .macro sbc__ixh
                            377    .dw #0x9CDD  ;; Opcode for sbc ixh
                            378 .endm
                            379 
                            380 ;; Macro: and__ixh
                            381 ;;    Opcode for "AND IXH" instruction
                            382 ;; 
                            383 .macro and__ixh
                            384    .dw #0xA4DD  ;; Opcode for and ixh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 24.
Hexadecimal [16-Bits]



                            385 .endm
                            386 
                            387 ;; Macro: or__ixh
                            388 ;;    Opcode for "OR IXH" instruction
                            389 ;; 
                            390 .macro or__ixh
                            391    .dw #0xB4DD  ;; Opcode for or ixh
                            392 .endm
                            393 
                            394 ;; Macro: xor__ixh
                            395 ;;    Opcode for "XOR IXH" instruction
                            396 ;; 
                            397 .macro xor__ixh
                            398    .dw #0xACDD  ;; Opcode for xor ixh
                            399 .endm
                            400 
                            401 ;; Macro: cp__ixh
                            402 ;;    Opcode for "CP IXH" instruction
                            403 ;; 
                            404 .macro cp__ixh
                            405    .dw #0xBCDD  ;; Opcode for cp ixh
                            406 .endm
                            407 
                            408 ;; Macro: dec__ixh
                            409 ;;    Opcode for "DEC IXH" instruction
                            410 ;; 
                            411 .macro dec__ixh
                            412    .dw #0x25DD  ;; Opcode for dec ixh
                            413 .endm
                            414 
                            415 ;; Macro: inc__ixh
                            416 ;;    Opcode for "INC IXH" instruction
                            417 ;; 
                            418 .macro inc__ixh
                            419    .dw #0x24DD  ;; Opcode for inc ixh
                            420 .endm
                            421 
                            422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            423 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            424 ;; IYL Related Macros
                            425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            427 
                            428 ;; Macro: ld__iyl    Value
                            429 ;;    Opcode for "LD iyl, Value" instruction
                            430 ;;  
                            431 ;; Parameters:
                            432 ;;    Value - An inmediate 8-bits value that will be loaded into iyl
                            433 ;; 
                            434 .macro ld__iyl    Value 
                            435    .db #0xFD, #0x2E, Value  ;; Opcode for ld iyl, Value
                            436 .endm
                            437 
                            438 ;; Macro: ld__iyl_a
                            439 ;;    Opcode for "LD iyl, a" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 25.
Hexadecimal [16-Bits]



                            440 ;; 
                            441 .macro ld__iyl_a
                            442    .dw #0x6FFD  ;; Opcode for ld iyl, a
                            443 .endm
                            444 
                            445 ;; Macro: ld__iyl_b
                            446 ;;    Opcode for "LD iyl, B" instruction
                            447 ;; 
                            448 .macro ld__iyl_b
                            449    .dw #0x68FD  ;; Opcode for ld iyl, b
                            450 .endm
                            451 
                            452 ;; Macro: ld__iyl_c
                            453 ;;    Opcode for "LD iyl, C" instruction
                            454 ;; 
                            455 .macro ld__iyl_c
                            456    .dw #0x69FD  ;; Opcode for ld iyl, c
                            457 .endm
                            458 
                            459 ;; Macro: ld__iyl_d
                            460 ;;    Opcode for "LD iyl, D" instruction
                            461 ;; 
                            462 .macro ld__iyl_d
                            463    .dw #0x6AFD  ;; Opcode for ld iyl, d
                            464 .endm
                            465 
                            466 ;; Macro: ld__iyl_e
                            467 ;;    Opcode for "LD iyl, E" instruction
                            468 ;; 
                            469 .macro ld__iyl_e
                            470    .dw #0x6BFD  ;; Opcode for ld iyl, e
                            471 .endm
                            472 
                            473 ;; Macro: ld__iyl_iyh
                            474 ;;    Opcode for "LD iyl, IXL" instruction
                            475 ;; 
                            476 .macro ld__iyl_iyh
                            477    .dw #0x6CFD  ;; Opcode for ld iyl, ixl
                            478 .endm
                            479 
                            480 ;; Macro: ld__a_iyl
                            481 ;;    Opcode for "LD A, iyl" instruction
                            482 ;; 
                            483 .macro ld__a_iyl
                            484    .dw #0x7DFD  ;; Opcode for ld a, iyl
                            485 .endm
                            486 
                            487 ;; Macro: ld__b_iyl
                            488 ;;    Opcode for "LD B, iyl" instruction
                            489 ;; 
                            490 .macro ld__b_iyl
                            491    .dw #0x45FD  ;; Opcode for ld b, iyl
                            492 .endm
                            493 
                            494 ;; Macro: ld__c_iyl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 26.
Hexadecimal [16-Bits]



                            495 ;;    Opcode for "LD c, iyl" instruction
                            496 ;; 
                            497 .macro ld__c_iyl
                            498    .dw #0x4DFD  ;; Opcode for ld c, iyl
                            499 .endm
                            500 
                            501 ;; Macro: ld__d_iyl
                            502 ;;    Opcode for "LD D, iyl" instruction
                            503 ;; 
                            504 .macro ld__d_iyl
                            505    .dw #0x55FD  ;; Opcode for ld d, iyl
                            506 .endm
                            507 
                            508 ;; Macro: ld__e_iyl
                            509 ;;    Opcode for "LD e, iyl" instruction
                            510 ;; 
                            511 .macro ld__e_iyl
                            512    .dw #0x5DFD  ;; Opcode for ld e, iyl
                            513 .endm
                            514 
                            515 ;; Macro: add__iyl
                            516 ;;    Opcode for "Add iyl" instruction
                            517 ;; 
                            518 .macro add__iyl
                            519    .dw #0x85FD  ;; Opcode for add iyl
                            520 .endm
                            521 
                            522 ;; Macro: sub__iyl
                            523 ;;    Opcode for "SUB iyl" instruction
                            524 ;; 
                            525 .macro sub__iyl
                            526    .dw #0x95FD  ;; Opcode for sub iyl
                            527 .endm
                            528 
                            529 ;; Macro: adc__iyl
                            530 ;;    Opcode for "ADC iyl" instruction
                            531 ;; 
                            532 .macro adc__iyl
                            533    .dw #0x8DFD  ;; Opcode for adc iyl
                            534 .endm
                            535 
                            536 ;; Macro: sbc__iyl
                            537 ;;    Opcode for "SBC iyl" instruction
                            538 ;; 
                            539 .macro sbc__iyl
                            540    .dw #0x9DFD  ;; Opcode for sbc iyl
                            541 .endm
                            542 
                            543 ;; Macro: and__iyl
                            544 ;;    Opcode for "AND iyl" instruction
                            545 ;; 
                            546 .macro and__iyl
                            547    .dw #0xA5FD  ;; Opcode for and iyl
                            548 .endm
                            549 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 27.
Hexadecimal [16-Bits]



                            550 ;; Macro: or__iyl
                            551 ;;    Opcode for "OR iyl" instruction
                            552 ;; 
                            553 .macro or__iyl
                            554    .dw #0xB5FD  ;; Opcode for or iyl
                            555 .endm
                            556 
                            557 ;; Macro: xor__iyl
                            558 ;;    Opcode for "XOR iyl" instruction
                            559 ;; 
                            560 .macro xor__iyl
                            561    .dw #0xADFD  ;; Opcode for xor iyl
                            562 .endm
                            563 
                            564 ;; Macro: cp__iyl
                            565 ;;    Opcode for "CP iyl" instruction
                            566 ;; 
                            567 .macro cp__iyl
                            568    .dw #0xBDFD  ;; Opcode for cp iyl
                            569 .endm
                            570 
                            571 ;; Macro: dec__iyl
                            572 ;;    Opcode for "DEC iyl" instruction
                            573 ;; 
                            574 .macro dec__iyl
                            575    .dw #0x2DFD  ;; Opcode for dec iyl
                            576 .endm
                            577 
                            578 ;; Macro: inc__iyl
                            579 ;;    Opcode for "INC iyl" instruction
                            580 ;; 
                            581 .macro inc__iyl
                            582    .dw #0x2CFD  ;; Opcode for inc iyl
                            583 .endm
                            584 
                            585 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            586 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            587 ;; IYH Related Macros
                            588 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            589 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                            590 
                            591 ;; Macro: ld__iyh    Value
                            592 ;;    Opcode for "LD iyh, Value" instruction
                            593 ;;  
                            594 ;; Parameters:
                            595 ;;    Value - An inmediate 8-bits value that will be loaded into iyh
                            596 ;; 
                            597 .macro ld__iyh    Value 
                            598    .db #0xFD, #0x26, Value  ;; Opcode for ld iyh, Value
                            599 .endm
                            600 
                            601 ;; Macro: ld__iyh_a
                            602 ;;    Opcode for "LD iyh, a" instruction
                            603 ;; 
                            604 .macro ld__iyh_a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 28.
Hexadecimal [16-Bits]



                            605    .dw #0x67FD  ;; Opcode for ld iyh, a
                            606 .endm
                            607 
                            608 ;; Macro: ld__iyh_b
                            609 ;;    Opcode for "LD iyh, B" instruction
                            610 ;; 
                            611 .macro ld__iyh_b
                            612    .dw #0x60FD  ;; Opcode for ld iyh, b
                            613 .endm
                            614 
                            615 ;; Macro: ld__iyh_c
                            616 ;;    Opcode for "LD iyh, C" instruction
                            617 ;; 
                            618 .macro ld__iyh_c
                            619    .dw #0x61FD  ;; Opcode for ld iyh, c
                            620 .endm
                            621 
                            622 ;; Macro: ld__iyh_d
                            623 ;;    Opcode for "LD iyh, D" instruction
                            624 ;; 
                            625 .macro ld__iyh_d
                            626    .dw #0x62FD  ;; Opcode for ld iyh, d
                            627 .endm
                            628 
                            629 ;; Macro: ld__iyh_e
                            630 ;;    Opcode for "LD iyh, E" instruction
                            631 ;; 
                            632 .macro ld__iyh_e
                            633    .dw #0x63FD  ;; Opcode for ld iyh, e
                            634 .endm
                            635 
                            636 ;; Macro: ld__iyh_iyl
                            637 ;;    Opcode for "LD iyh, IyL" instruction
                            638 ;; 
                            639 .macro ld__iyh_iyl
                            640    .dw #0x65FD  ;; Opcode for ld iyh, iyl
                            641 .endm
                            642 
                            643 ;; Macro: ld__a_iyh
                            644 ;;    Opcode for "LD A, iyh" instruction
                            645 ;; 
                            646 .macro ld__a_iyh
                            647    .dw #0x7CFD  ;; Opcode for ld a, iyh
                            648 .endm
                            649 
                            650 ;; Macro: ld__b_iyh
                            651 ;;    Opcode for "LD B, iyh" instruction
                            652 ;; 
                            653 .macro ld__b_iyh
                            654    .dw #0x44FD  ;; Opcode for ld b, iyh
                            655 .endm
                            656 
                            657 ;; Macro: ld__c_iyh
                            658 ;;    Opcode for "LD c, iyh" instruction
                            659 ;; 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 29.
Hexadecimal [16-Bits]



                            660 .macro ld__c_iyh
                            661    .dw #0x4CFD  ;; Opcode for ld c, iyh
                            662 .endm
                            663 
                            664 ;; Macro: ld__d_iyh
                            665 ;;    Opcode for "LD D, iyh" instruction
                            666 ;; 
                            667 .macro ld__d_iyh
                            668    .dw #0x54FD  ;; Opcode for ld d, iyh
                            669 .endm
                            670 
                            671 ;; Macro: ld__e_iyh
                            672 ;;    Opcode for "LD e, iyh" instruction
                            673 ;; 
                            674 .macro ld__e_iyh
                            675    .dw #0x5CFD  ;; Opcode for ld e, iyh
                            676 .endm
                            677 
                            678 ;; Macro: add__iyh
                            679 ;;    Opcode for "Add iyh" instruction
                            680 ;; 
                            681 .macro add__iyh
                            682    .dw #0x84FD  ;; Opcode for add iyh
                            683 .endm
                            684 
                            685 ;; Macro: sub__iyh
                            686 ;;    Opcode for "SUB iyh" instruction
                            687 ;; 
                            688 .macro sub__iyh
                            689    .dw #0x94FD  ;; Opcode for sub iyh
                            690 .endm
                            691 
                            692 ;; Macro: adc__iyh
                            693 ;;    Opcode for "ADC iyh" instruction
                            694 ;; 
                            695 .macro adc__iyh
                            696    .dw #0x8CFD  ;; Opcode for adc iyh
                            697 .endm
                            698 
                            699 ;; Macro: sbc__iyh
                            700 ;;    Opcode for "SBC iyh" instruction
                            701 ;; 
                            702 .macro sbc__iyh
                            703    .dw #0x9CFD  ;; Opcode for sbc iyh
                            704 .endm
                            705 
                            706 ;; Macro: and__iyh
                            707 ;;    Opcode for "AND iyh" instruction
                            708 ;; 
                            709 .macro and__iyh
                            710    .dw #0xA4FD  ;; Opcode for and iyh
                            711 .endm
                            712 
                            713 ;; Macro: or__iyh
                            714 ;;    Opcode for "OR iyh" instruction
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 30.
Hexadecimal [16-Bits]



                            715 ;; 
                            716 .macro or__iyh
                            717    .dw #0xB4FD  ;; Opcode for or iyh
                            718 .endm
                            719 
                            720 ;; Macro: xor__iyh
                            721 ;;    Opcode for "XOR iyh" instruction
                            722 ;; 
                            723 .macro xor__iyh
                            724    .dw #0xACFD  ;; Opcode for xor iyh
                            725 .endm
                            726 
                            727 ;; Macro: cp__iyh
                            728 ;;    Opcode for "CP iyh" instruction
                            729 ;; 
                            730 .macro cp__iyh
                            731    .dw #0xBCFD  ;; Opcode for cp iyh
                            732 .endm
                            733 
                            734 ;; Macro: dec__iyh
                            735 ;;    Opcode for "DEC iyh" instruction
                            736 ;; 
                            737 .macro dec__iyh
                            738    .dw #0x25FD  ;; Opcode for dec iyh
                            739 .endm
                            740 
                            741 ;; Macro: inc__iyh
                            742 ;;    Opcode for "INC iyh" instruction
                            743 ;; 
                            744 .macro inc__iyh
                            745    .dw #0x24FD  ;; Opcode for inc iyh
                            746 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 31.
Hexadecimal [16-Bits]



                             23 .include "macros/cpct_pushpop.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2020 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;
                             20 ;; File: Push - Pop Macros
                             21 ;;
                             22 ;;    Useful macros to simplify push-pop save/restore operations
                             23 ;;
                             24 
                             25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             26 ;; Macro: cpctm_push RO, R1, R2, R3, R4, R5
                             27 ;;
                             28 ;;    Pushes any given registers (up to 6) into the stack
                             29 ;;
                             30 ;; ASM Definition:
                             31 ;;    .macro <cpctm_push> R0, R1, R2, R3, R4, R5
                             32 ;;
                             33 ;; Parameters:
                             34 ;;    R0-R5 - Any number of 16-bit pushable registers, up to 6
                             35 ;;
                             36 ;; Details:
                             37 ;;    This macro converts the list of 16-bit registers given as parameters into a list
                             38 ;; of 'push' operations to push all of them into the stack. The registers are pushed
                             39 ;; into the stack in the same order as they are given in the parameter list.
                             40 ;;    The macro accepts any number of registers up to the maximum of 6 that are 
                             41 ;; predefined as parameters. However, you may use it with 1, 2, 3, 4 or 5 registers
                             42 ;; as parameters. There is no need to give the 6 parameters: only those given will 
                             43 ;; be considered.
                             44 ;;
                             45 ;; Modified Registers: 
                             46 ;;    none
                             47 ;;
                             48 ;; Required memory:
                             49 ;;    1 byte per register given (2 if they are IX or IY)
                             50 ;;
                             51 ;; Time Measures:
                             52 ;; (start code)
                             53 ;;  Case     | microSecs(us) | CPU Cycles
                             54 ;; ------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 32.
Hexadecimal [16-Bits]



                             55 ;;  Per Reg  |       4       |     16
                             56 ;; ------------------------------------
                             57 ;;  Per IX/IY|       5       |     20
                             58 ;; ------------------------------------
                             59 ;; (end code)
                             60 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             61 .macro cpctm_push r0, r1, r2, r3, r4, r5
                             62    .narg v
                             63    .if v
                             64    push r0
                             65    .if v-1
                             66    push r1
                             67    .if v-2
                             68    push r2
                             69    .if v-3
                             70    push r3
                             71    .if v-4
                             72    push r4
                             73    .if v-5
                             74    push r5
                             75    .else
                             76    .mexit
                             77    .endif
                             78    .else
                             79    .mexit
                             80    .endif
                             81    .else
                             82    .mexit
                             83    .endif
                             84    .else
                             85    .mexit
                             86    .endif
                             87    .else
                             88    .mexit
                             89    .endif
                             90    .else
                             91    .mexit
                             92    .endif
                             93 .endm
                             94 
                             95 
                             96 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             97 ;; Macro: cpctm_pop RO, R1, R2, R3, R4, R5
                             98 ;;
                             99 ;;    Pops any given registers (up to 6) from the stack
                            100 ;;
                            101 ;; ASM Definition:
                            102 ;;    .macro <cpctm_pop> R0, R1, R2, R3, R4, R5
                            103 ;;
                            104 ;; Parameters:
                            105 ;;    R0-R5 - Any number of 16-bit pushable/popable registers, up to 6
                            106 ;;
                            107 ;; Details:
                            108 ;;    This macro converts the list of 16-bit registers given as parameters into a list
                            109 ;; of 'pop' operations to pop all of them from the stack. The registers are poped
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 33.
Hexadecimal [16-Bits]



                            110 ;; in the same order as they are given in the parameter list.
                            111 ;;    The macro accepts any number of registers up to the maximum of 6 that are 
                            112 ;; predefined as parameters. However, you may use it with 1, 2, 3, 4 or 5 registers
                            113 ;; as parameters. There is no need to give the 6 parameters: only those given will 
                            114 ;; be considered.
                            115 ;;
                            116 ;; Modified Registers: 
                            117 ;;    R0, R1, R2, R3, R4, R5 (Those given as parameters are loaded from the stack)
                            118 ;;
                            119 ;; Required memory:
                            120 ;;    1 byte per register given (2 if they are IX or IY)
                            121 ;;
                            122 ;; Time Measures:
                            123 ;; (start code)
                            124 ;;  Case     | microSecs(us) | CPU Cycles
                            125 ;; ------------------------------------
                            126 ;;  Per Reg  |       3       |     12
                            127 ;; ------------------------------------
                            128 ;;  Per IX/IY|       5       |     20
                            129 ;; ------------------------------------
                            130 ;; (end code)
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            132 .macro cpctm_pop r0, r1, r2, r3, r4, r5
                            133    .narg v
                            134    .if v
                            135    pop r0
                            136    .if v-1
                            137    pop r1
                            138    .if v-2
                            139    pop r2
                            140    .if v-3
                            141    pop r3
                            142    .if v-4
                            143    pop r4
                            144    .if v-5
                            145    pop r5
                            146    .else
                            147    .mexit
                            148    .endif
                            149    .else
                            150    .mexit
                            151    .endif
                            152    .else
                            153    .mexit
                            154    .endif
                            155    .else
                            156    .mexit
                            157    .endif
                            158    .else
                            159    .mexit
                            160    .endif
                            161    .else
                            162    .mexit
                            163    .endif
                            164 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 34.
Hexadecimal [16-Bits]



                             24 
                             25 ;;//////////////////////////////////////////////////////////////////////
                             26 ;; Group: General Useful Macros
                             27 ;;//////////////////////////////////////////////////////////////////////
                             28 
                             29 ;;
                             30 ;; Macro: cpctm_produceHalts_asm
                             31 ;;
                             32 ;;   Produce a set of consecutive halt instructions in order to wait for 
                             33 ;; a given number of interrupts.
                             34 ;;
                             35 ;; C Definition:
                             36 ;;   .macro <cpctm_produceHalts_asm> *N*
                             37 ;;
                             38 ;; Input Parameters:
                             39 ;;   (_) N - Number of consecutive halts to be produced
                             40 ;;
                             41 ;; Known issues:
                             42 ;;    * *N* must be a constant expression that can evaluate to a number
                             43 ;; at compile time.
                             44 ;;    * If the code generated by this macro is executed with interrupts
                             45 ;; being disabled, your CPU will effectively hang forever.
                             46 ;;    * This macro can only be used from assembler code. For C callings
                             47 ;; use <cpctm_produceHalts> instead.
                             48 ;;
                             49 ;; Size of generated code:
                             50 ;;    * *N* bytes (1 byte each halt instruction produced)
                             51 ;;
                             52 ;; Time Measures:
                             53 ;;    * Time depends on the exact moment of execution and the status of
                             54 ;; interrupts. *N* interrupts will pass.
                             55 ;;
                             56 ;; Details:
                             57 ;;    This macro produces a set of *N* consecutive *halt* assembly 
                             58 ;; instructions. Each *halt* instruction stops de Z80 CPU until 
                             59 ;; an interrupt is received. Therefore, this waits for *N* interrupts
                             60 ;; to be produced. This can be used for waiting or synchronization 
                             61 ;; purposes.
                             62 ;;
                             63 ;;    Please, take into account that this is a macro, and not a function.
                             64 ;; Each time this macro is used in your code it will produce the requested
                             65 ;; amount of halts. That can produce more code than you effectively need.
                             66 ;; For a unique function that controls a loop of *halt* waiting use
                             67 ;; <cpct_waitHalts> instead.
                             68 ;;
                             69 ;;
                             70 .macro cpctm_produceHalts N
                             71    .rept N
                             72       halt
                             73    .endm
                             74 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 35.
Hexadecimal [16-Bits]



                             21 .include "keyboard/keyboard.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_keyboard
                             19 
                             20 ;;
                             21 ;; Constant: Key Definitions (asm)
                             22 ;;
                             23 ;;    Definitions of the KeyCodes required by <cpct_isKeyPressed> 
                             24 ;; function for assembler programs. These are 16-bit values that define 
                             25 ;; matrix line in the keyboard layout (Most Significant Byte) and bit to
                             26 ;; be tested in that matrix line status for the given key (Least Significant
                             27 ;; byte). Each matrix line in the keyboard returns a byte containing the
                             28 ;; status of 8 keys, 1 bit each.
                             29 ;;
                             30 ;; CPCtelera include file:
                             31 ;;    _keyboard/keyboard.h.s_
                             32 ;;
                             33 ;; Keycode constant names:
                             34 ;; (start code)
                             35 ;;  KeyCode | Constant        || KeyCode | Constant      || KeyCode |  Constant
                             36 ;; -------------------------------------------------------------------------------
                             37 ;;   0x0100 | Key_CursorUp    ||  0x0803 | Key_P         ||  0x4006 |  Key_B
                             38 ;;          |                 ||         |               ||     ''  |  Joy1_Fire3
                             39 ;;   0x0200 | Key_CursorRight ||  0x1003 | Key_SemiColon ||  0x8006 |  Key_V
                             40 ;;   0x0400 | Key_CursorDown  ||  0x2003 | Key_Colon     ||  0x0107 |  Key_4
                             41 ;;   0x0800 | Key_F9          ||  0x4003 | Key_Slash     ||  0x0207 |  Key_3
                             42 ;;   0x1000 | Key_F6          ||  0x8003 | Key_Dot       ||  0x0407 |  Key_E
                             43 ;;   0x2000 | Key_F3          ||  0x0104 | Key_0         ||  0x0807 |  Key_W
                             44 ;;   0x4000 | Key_Enter       ||  0x0204 | Key_9         ||  0x1007 |  Key_S
                             45 ;;   0x8000 | Key_FDot        ||  0x0404 | Key_O         ||  0x2007 |  Key_D
                             46 ;;   0x0101 | Key_CursorLeft  ||  0x0804 | Key_I         ||  0x4007 |  Key_C
                             47 ;;   0x0201 | Key_Copy        ||  0x1004 | Key_L         ||  0x8007 |  Key_X
                             48 ;;   0x0401 | Key_F7          ||  0x2004 | Key_K         ||  0x0108 |  Key_1
                             49 ;;   0x0801 | Key_F8          ||  0x4004 | Key_M         ||  0x0208 |  Key_2
                             50 ;;   0x1001 | Key_F5          ||  0x8004 | Key_Comma     ||  0x0408 |  Key_Esc
                             51 ;;   0x2001 | Key_F1          ||  0x0105 | Key_8         ||  0x0808 |  Key_Q
                             52 ;;   0x4001 | Key_F2          ||  0x0205 | Key_7         ||  0x1008 |  Key_Tab
                             53 ;;   0x8001 | Key_F0          ||  0x0405 | Key_U         ||  0x2008 |  Key_A
                             54 ;;   0x0102 | Key_Clr         ||  0x0805 | Key_Y         ||  0x4008 |  Key_CapsLock
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 36.
Hexadecimal [16-Bits]



                             55 ;;   0x0202 | Key_OpenBracket ||  0x1005 | Key_H         ||  0x8008 |  Key_Z
                             56 ;;   0x0402 | Key_Return      ||  0x2005 | Key_J         ||  0x0109 |  Joy0_Up
                             57 ;;   0x0802 | Key_CloseBracket||  0x4005 | Key_N         ||  0x0209 |  Joy0_Down
                             58 ;;   0x1002 | Key_F4          ||  0x8005 | Key_Space     ||  0x0409 |  Joy0_Left
                             59 ;;   0x2002 | Key_Shift       ||  0x0106 | Key_6         ||  0x0809 |  Joy0_Right
                             60 ;;          |                 ||     ''  | Joy1_Up       ||         |
                             61 ;;   0x4002 | Key_BackSlash   ||  0x0206 | Key_5         ||  0x1009 |  Joy0_Fire1
                             62 ;;          |                 ||     ''  | Joy1_Down     ||         |
                             63 ;;   0x8002 | Key_Control     ||  0x0406 | Key_R         ||  0x2009 |  Joy0_Fire2
                             64 ;;          |                 ||     ''  | Joy1_Left     ||         |
                             65 ;;   0x0103 | Key_Caret       ||  0x0806 | Key_T         ||  0x4009 |  Joy0_Fire3
                             66 ;;          |                 ||     ''  | Joy1 Right    ||
                             67 ;;   0x0203 | Key_Hyphen      ||  0x1006 | Key_G         ||  0x8009 |  Key_Del
                             68 ;;          |                 ||     ''  | Joy1_Fire1    ||
                             69 ;;   0x0403 | Key_At          ||  0x2006 | Key_F         ||
                             70 ;;          |                 ||     ''  | Joy1_Fire2    ||
                             71 ;; -------------------------------------------------------------------------------
                             72 ;;  Table 1. KeyCodes defined for each possible key, ordered by KeyCode
                             73 ;; (end)
                             74 ;;
                             75 
                             76 ;; Matrix Line 0x00
                     0100    77 Key_CursorUp     = #0x0100  ;; Bit 0 (01h) => | 0000 0001 |
                     0200    78 Key_CursorRight  = #0x0200  ;; Bit 1 (02h) => | 0000 0010 |
                     0400    79 Key_CursorDown   = #0x0400  ;; Bit 2 (04h) => | 0000 0100 |
                     0800    80 Key_F9           = #0x0800  ;; Bit 3 (08h) => | 0000 1000 |
                     1000    81 Key_F6           = #0x1000  ;; Bit 4 (10h) => | 0001 0000 |
                     2000    82 Key_F3           = #0x2000  ;; Bit 5 (20h) => | 0010 0000 |
                     4000    83 Key_Enter        = #0x4000  ;; Bit 6 (40h) => | 0100 0000 |
                     8000    84 Key_FDot         = #0x8000  ;; Bit 7 (80h) => | 1000 0000 |
                             85 ;; Matrix Line 0x01
                     0101    86 Key_CursorLeft   = #0x0101
                     0201    87 Key_Copy         = #0x0201
                     0401    88 Key_F7           = #0x0401
                     0801    89 Key_F8           = #0x0801
                     1001    90 Key_F5           = #0x1001
                     2001    91 Key_F1           = #0x2001
                     4001    92 Key_F2           = #0x4001
                     8001    93 Key_F0           = #0x8001
                             94 ;; Matrix Line 0x02
                     0102    95 Key_Clr          = #0x0102
                     0202    96 Key_OpenBracket  = #0x0202
                     0402    97 Key_Return       = #0x0402
                     0802    98 Key_CloseBracket = #0x0802
                     1002    99 Key_F4           = #0x1002
                     2002   100 Key_Shift        = #0x2002
                     4002   101 Key_BackSlash    = #0x4002
                     8002   102 Key_Control      = #0x8002
                            103 ;; Matrix Line 0x03
                     0103   104 Key_Caret        = #0x0103
                     0203   105 Key_Hyphen       = #0x0203
                     0403   106 Key_At           = #0x0403
                     0803   107 Key_P            = #0x0803
                     1003   108 Key_SemiColon    = #0x1003
                     2003   109 Key_Colon        = #0x2003
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 37.
Hexadecimal [16-Bits]



                     4003   110 Key_Slash        = #0x4003
                     8003   111 Key_Dot          = #0x8003
                            112 ;; Matrix Line 0x04
                     0104   113 Key_0            = #0x0104
                     0204   114 Key_9            = #0x0204
                     0404   115 Key_O            = #0x0404
                     0804   116 Key_I            = #0x0804
                     1004   117 Key_L            = #0x1004
                     2004   118 Key_K            = #0x2004
                     4004   119 Key_M            = #0x4004
                     8004   120 Key_Comma        = #0x8004
                            121 ;; Matrix Line 0x05
                     0105   122 Key_8            = #0x0105
                     0205   123 Key_7            = #0x0205
                     0405   124 Key_U            = #0x0405
                     0805   125 Key_Y            = #0x0805
                     1005   126 Key_H            = #0x1005
                     2005   127 Key_J            = #0x2005
                     4005   128 Key_N            = #0x4005
                     8005   129 Key_Space        = #0x8005
                            130 ;; Matrix Line 0x06
                     0106   131 Key_6            = #0x0106
                     0106   132 Joy1_Up          = #0x0106
                     0206   133 Key_5            = #0x0206
                     0206   134 Joy1_Down        = #0x0206
                     0406   135 Key_R            = #0x0406
                     0406   136 Joy1_Left        = #0x0406
                     0806   137 Key_T            = #0x0806
                     0806   138 Joy1_Right       = #0x0806
                     1006   139 Key_G            = #0x1006
                     1006   140 Joy1_Fire1       = #0x1006
                     2006   141 Key_F            = #0x2006
                     2006   142 Joy1_Fire2       = #0x2006
                     4006   143 Key_B            = #0x4006
                     4006   144 Joy1_Fire3       = #0x4006
                     8006   145 Key_V            = #0x8006
                            146 ;; Matrix Line 0x07
                     0107   147 Key_4            = #0x0107
                     0207   148 Key_3            = #0x0207
                     0407   149 Key_E            = #0x0407
                     0807   150 Key_W            = #0x0807
                     1007   151 Key_S            = #0x1007
                     2007   152 Key_D            = #0x2007
                     4007   153 Key_C            = #0x4007
                     8007   154 Key_X            = #0x8007
                            155 ;; Matrix Line 0x08
                     0108   156 Key_1            = #0x0108
                     0208   157 Key_2            = #0x0208
                     0408   158 Key_Esc          = #0x0408
                     0808   159 Key_Q            = #0x0808
                     1008   160 Key_Tab          = #0x1008
                     2008   161 Key_A            = #0x2008
                     4008   162 Key_CapsLock     = #0x4008
                     8008   163 Key_Z            = #0x8008
                            164 ;; Matrix Line 0x09
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 38.
Hexadecimal [16-Bits]



                     0109   165 Joy0_Up          = #0x0109
                     0209   166 Joy0_Down        = #0x0209
                     0409   167 Joy0_Left        = #0x0409
                     0809   168 Joy0_Right       = #0x0809
                     1009   169 Joy0_Fire1       = #0x1009
                     2009   170 Joy0_Fire2       = #0x2009
                     4009   171 Joy0_Fire3       = #0x4009
                     8009   172 Key_Del          = #0x8009
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 39.
Hexadecimal [16-Bits]



                             22 .include "video/videomode.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_video
                             19    
                             20 ;;
                             21 ;; Includes
                             22 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 40.
Hexadecimal [16-Bits]



                             23 .include "video/video_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;//////////////////////////////////////////////////////////////////////
                             20 ;;//////////////////////////////////////////////////////////////////////
                             21 ;; File: Macros (asm)
                             22 ;;//////////////////////////////////////////////////////////////////////
                             23 ;;//////////////////////////////////////////////////////////////////////
                             24 
                             25 ;;//////////////////////////////////////////////////////////////////////
                             26 ;; Group: Video memory manipulation
                             27 ;;//////////////////////////////////////////////////////////////////////
                             28 
                             29 ;;
                             30 ;; Constant: CPCT_VMEM_START_ASM
                             31 ;;
                             32 ;;    The address where screen video memory starts by default in the Amstrad CPC.
                             33 ;;
                             34 ;;    This address is exactly 0xC000, and this macro represents this number but
                             35 ;; automatically converted to <u8>* (Pointer to unsigned byte). You can use this
                             36 ;; macro for any function requiring the start of video memory, like 
                             37 ;; <cpct_getScreenPtr>.
                             38 ;;
                     C000    39 CPCT_VMEM_START_ASM = 0xC000
                             40 
                             41 ;;
                             42 ;; Constants: Video Memory Pages
                             43 ;;
                             44 ;; Useful constants defining some typical Video Memory Pages to be used as 
                             45 ;; parameters for <cpct_setVideoMemoryPage>
                             46 ;;
                             47 ;; cpct_pageCO - Video Memory Page 0xC0 (0xC0··)
                             48 ;; cpct_page8O - Video Memory Page 0x80 (0x80··)
                             49 ;; cpct_page4O - Video Memory Page 0x40 (0x40··)
                             50 ;; cpct_page0O - Video Memory Page 0x00 (0x00··)
                             51 ;;
                     0030    52 cpct_pageC0_asm = 0x30
                     0020    53 cpct_page80_asm = 0x20
                     0010    54 cpct_page40_asm = 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 41.
Hexadecimal [16-Bits]



                     0000    55 cpct_page00_asm = 0x00
                             56 
                             57 ;;
                             58 ;; Macro: cpctm_memPage6_asm
                             59 ;;
                             60 ;;    Macro that encodes a video memory page in the 6 Least Significant bits (LSb)
                             61 ;; of a byte, required as parameter for <cpct_setVideoMemoryPage>. It loads resulting
                             62 ;; value into a given 8-bits register.
                             63 ;;
                             64 ;; ASM Definition:
                             65 ;; .macro <cpct_memPage6_asm> *REG8*, *PAGE*
                             66 ;;
                             67 ;; Parameters (1 byte):
                             68 ;; (__) REG8 - 8bits register where result will be loaded
                             69 ;; (1B) PAGE - Video memory page wanted 
                             70 ;;
                             71 ;; Known issues:
                             72 ;;   * This macro can only be used from assembler code. It is not accessible from 
                             73 ;; C scope. For C programs, please refer to <cpct_memPage6>
                             74 ;;   * This macro will work *only* with constant values, as its value needs to
                             75 ;; be calculated in compilation time. If fed with variable values, it will give 
                             76 ;; an assembler error.
                             77 ;;
                             78 ;; Destroyed Registers:
                             79 ;;    REG8
                             80 ;;
                             81 ;; Size of generated code:
                             82 ;;    2 bytes 
                             83 ;;
                             84 ;; Time Measures:
                             85 ;;    * 2 microseconds
                             86 ;;    * 8 CPU Cycles
                             87 ;;
                             88 ;; Details:
                             89 ;;  This is just a macro that shifts *PAGE* 2 bits to the right, to leave it
                             90 ;; with just 6 significant bits. For more information, check functions
                             91 ;; <cpct_setVideoMemoryPage> and <cpct_setVideoMemoryOffset>.
                             92 ;;
                             93 .macro cpctm_memPage6_asm REG8, PAGE 
                             94    ld REG8, #PAGE / 4      ;; [2] REG8 = PAGE/4
                             95 .endm
                             96 
                             97 ;;
                             98 ;; Macro: cpctm_screenPtr_asm
                             99 ;;
                            100 ;;    Macro that calculates the video memory location (byte pointer) of a 
                            101 ;; given pair of coordinates (*X*, *Y*). Value resulting from calculation 
                            102 ;; will be loaded into a 16-bits register.
                            103 ;;
                            104 ;; ASM Definition:
                            105 ;;    .macro <cpctm_screenPtr_asm> *REG16*, *VMEM*, *X*, *Y*
                            106 ;;
                            107 ;; Parameters:
                            108 ;;    (__) REG16 - 16-bits register where the resulting value will be loaded
                            109 ;;    (2B) VMEM  - Start of video memory buffer where (*X*, *Y*) coordinates will be calculated
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 42.
Hexadecimal [16-Bits]



                            110 ;;    (1B) X     - X Coordinate of the video memory location *in bytes* (*BEWARE! NOT in pixels!*)
                            111 ;;    (1B) Y     - Y Coordinate of the video memory location in pixels / bytes (they are same amount)
                            112 ;;
                            113 ;; Parameter Restrictions:
                            114 ;;    * *REG16* has to be a 16-bits register that can perform ld REG16, #value.
                            115 ;;    * *VMEM* will normally be the start of the video memory buffer where you want to 
                            116 ;; draw something. It could theoretically be any 16-bits value. 
                            117 ;;    * *X* must be in the range [0-79] for normal screen sizes (modes 0,1,2). Screen is
                            118 ;; always 80 bytes wide in these modes and this function is byte-aligned, so you have to 
                            119 ;; give it a byte coordinate (*NOT a pixel one!*).
                            120 ;;    * *Y* must be in the range [0-199] for normal screen sizes (modes 0,1,2). Screen is 
                            121 ;; always 200 pixels high in these modes. Pixels and bytes always coincide in vertical
                            122 ;; resolution, so this coordinate is the same in bytes that in pixels.
                            123 ;;    * If you give incorrect values to this function, the returned pointer could
                            124 ;; point anywhere in memory. This function will not cause any damage by itself, 
                            125 ;; but you may destroy important parts of your memory if you use its result to 
                            126 ;; write to memory, and you gave incorrect parameters by mistake. Take always
                            127 ;; care.
                            128 ;;
                            129 ;; Known issues:
                            130 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            131 ;; C scope. For C programs, please refer to <cpct_getScreenPtr>
                            132 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            133 ;; performed at assembler time.
                            134 ;;
                            135 ;; Destroyed Registers:
                            136 ;;    REG16
                            137 ;;
                            138 ;; Size of generated code:
                            139 ;;    3 bytes 
                            140 ;;
                            141 ;; Time Measures:
                            142 ;;    * 3 microseconds
                            143 ;;    * 12 CPU Cycles
                            144 ;;
                            145 ;; Details:
                            146 ;;    This macro does the same calculation than the function <cpct_getScreenPtr>. However,
                            147 ;; as it is a macro, if all 3 parameters (*VMEM*, *X*, *Y*) are constants, the calculation
                            148 ;; will be done at compile-time. This will free the binary from code or data, just putting in
                            149 ;; the result of this calculation (2 bytes with the resulting address). It is highly 
                            150 ;; recommended to use this macro instead of the function <cpct_getScreenPtr> when values
                            151 ;; involved are all constant. 
                            152 ;;
                            153 ;; Recommendations:
                            154 ;;    All constant values - Use this macro <cpctm_screenPtr_asm>
                            155 ;;    Any variable value  - Use the function <cpct_getScreenPtr>
                            156 ;;
                            157 .macro cpctm_screenPtr_asm REG16, VMEM, X, Y 
                            158    ld REG16, #VMEM + 80 * (Y / 8) + 2048 * (Y & 7) + X   ;; [3] REG16 = screenPtr
                            159 .endm
                            160 
                            161 ;;
                            162 ;; Macro: cpctm_setCRTCReg
                            163 ;;
                            164 ;;    Macro that sets a new value for a given CRTC register.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 43.
Hexadecimal [16-Bits]



                            165 ;;
                            166 ;; ASM Definition:
                            167 ;;    .macro <cpctm_setCRTCReg> *HEXREG*, *HEXVAL*
                            168 ;;
                            169 ;; Parameters:
                            170 ;;    (1B) HEXREG - New value to be set for the register (in hexadecimal)
                            171 ;;    (1B) HEXVAL - Number of the register to be set (in hexadecimal)
                            172 ;;
                            173 ;; Parameter Restrictions:
                            174 ;;    * *HEXREG* has to be an hexadecimal value from 00 to 1F
                            175 ;;    * *HEXVAL* has to be an hexadecimal value. Its valid range will depend
                            176 ;;          upon the selected register that will be modified. 
                            177 ;;
                            178 ;; Known issues:
                            179 ;;   * This macro can *only* be used from assembler code. It is not accessible from 
                            180 ;; C scope. 
                            181 ;;   * This macro can only be used with *constant values*. As given values are 
                            182 ;; concatenated with a number, they must also be hexadecimal numbers. If a 
                            183 ;; register or other value is given, this macro will not work.
                            184 ;;   * Using values out of range have unpredicted behaviour and can even 
                            185 ;; potentially cause damage to real Amstrad CPC monitors. Please, use with care.
                            186 ;;
                            187 ;; Destroyed Registers:
                            188 ;;    BC
                            189 ;;
                            190 ;; Size of generated code:
                            191 ;;    10 bytes 
                            192 ;;
                            193 ;; Time Measures:
                            194 ;;    * 14 microseconds
                            195 ;;    * 56 CPU Cycles
                            196 ;;
                            197 ;; Details:
                            198 ;;    This macro expands to two CRTC commands: Register selection and Register setting.
                            199 ;; It selects the register given as first parameter, then sets its new value to 
                            200 ;; that given as second parameter. Both given parameters must be of exactly 1 byte
                            201 ;; in size and the have to be provided in hexadecimal. This is due to the way
                            202 ;; that macro expansion and concatenation works. Given values will be concatenated
                            203 ;; with another 8-bit hexadecimal value to form a unique 16-bits hexadecimal value.
                            204 ;; Therefore, any parameter given will always be considered hexadecimal.
                            205 ;;
                            206 .macro cpctm_setCRTCReg_asm HEXREG, HEXVAL
                            207    ld    bc, #0xBC'HEXREG  ;; [3] B=0xBC CRTC Select Register, C=register number to be selected
                            208    out  (c), c             ;; [4] Select register
                            209    ld    bc, #0xBD'HEXVAL  ;; [3] B=0xBD CRTC Set Register, C=Value to be set
                            210    out  (c), c             ;; [4] Set the value
                            211 .endm
                            212 
                            213 ;;//////////////////////////////////////////////////////////////////////
                            214 ;; Group: Setting the border
                            215 ;;//////////////////////////////////////////////////////////////////////
                            216 
                            217 ;;
                            218 ;; Macro: cpctm_setBorder_asm
                            219 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 44.
Hexadecimal [16-Bits]



                            220 ;;   Changes the colour of the screen border.
                            221 ;;
                            222 ;; ASM Definition:
                            223 ;;   .macro <cpctm_setBorder_asm> HWC 
                            224 ;;
                            225 ;; Input Parameters (1 Byte):
                            226 ;;   (1B) HWC - Hardware colour value for the screen border in *hexadecimal [00-1B]*.
                            227 ;;
                            228 ;; Known issues:
                            229 ;;   * *Beware!* *HWC* colour value must be given in *hexadecimal*, as it is
                            230 ;; substituted in place, and must be in the range [00-1B].
                            231 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            232 ;; C scope. For C programs, please refer to <cpct_setBorder>
                            233 ;;   * This macro will work *only* with constant values, as calculations need to be 
                            234 ;; performed at assembler time.
                            235 ;;
                            236 ;; Destroyed Registers:
                            237 ;;    AF, B, HL
                            238 ;;
                            239 ;; Size of generated code:
                            240 ;;    * 16 bytes 
                            241 ;;     6b - generated code
                            242 ;;    10b - cpct_setPALColour_asm code
                            243 ;;
                            244 ;; Time Measures:
                            245 ;;    * 28 microseconds
                            246 ;;    * 112 CPU Cycles
                            247 ;;
                            248 ;; Details:
                            249 ;;   This is not a real function, but an assembler macro. Beware of using it along
                            250 ;; with complex expressions or calculations, as it may expand in non-desired
                            251 ;; ways.
                            252 ;;
                            253 ;;   For more information, check the real function <cpct_setPALColour>, which
                            254 ;; is called when using <cpctm_setBorder_asm> (It is called using 16 as *pen*
                            255 ;; argument, which identifies the border).
                            256 ;;
                            257 .macro cpctm_setBorder_asm HWC
                            258    .radix h
                            259    cpctm_setBorder_raw_asm \HWC ;; [28] Macro that does the job, but requires a number value to be passed
                            260    .radix d
                            261 .endm
                            262 .macro cpctm_setBorder_raw_asm HWC
                            263    .globl cpct_setPALColour_asm
                            264    ld   hl, #0x'HWC'10         ;; [3]  H=Hardware value of desired colour, L=Border INK (16)
                            265    call cpct_setPALColour_asm  ;; [25] Set Palette colour of the border
                            266 .endm
                            267 
                            268 ;;//////////////////////////////////////////////////////////////////////
                            269 ;; Group: Screen clearing
                            270 ;;//////////////////////////////////////////////////////////////////////
                            271 
                            272 ;;
                            273 ;; Macro: cpctm_clearScreen_asm
                            274 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 45.
Hexadecimal [16-Bits]



                            275 ;;    Macro to simplify clearing the screen.
                            276 ;;
                            277 ;; ASM Definition:
                            278 ;;   .macro <cpct_clearScreen_asm> COL
                            279 ;;
                            280 ;; Input Parameters (1 byte):
                            281 ;;   (1B) COL - Colour pattern to be used for screen clearing. 
                            282 ;;
                            283 ;; Parameters:
                            284 ;;    *COL* - Any 8-bits value or the A register are valid. Typically, a 0x00 is used 
                            285 ;; to fill up all the screen with 0's (firmware colour 0). However, you may use it in 
                            286 ;; combination with <cpct_px2byteM0>, <cpct_px2byteM1> or a manually created colour pattern.
                            287 ;;
                            288 ;; Known issues:
                            289 ;;   * This macro can only be used from assembler code. It is not accessible from 
                            290 ;; C scope. For C programs, please refer to <cpct_clearScreen>
                            291 ;;
                            292 ;; Details:
                            293 ;;   Fills up all the standard screen (range [0xC000-0xFFFF]) with *COL* byte, the colour 
                            294 ;; pattern given.
                            295 ;;
                            296 ;; Destroyed Registers:
                            297 ;;    BC, DE, HL
                            298 ;;
                            299 ;; Size of generated code:
                            300 ;;    13 bytes 
                            301 ;;
                            302 ;; Time Measures:
                            303 ;;    98309 microseconds (*4.924 VSYNCs* on a 50Hz display).
                            304 ;;    393236 CPU Cycles 
                            305 ;;
                            306 .macro cpctm_clearScreen_asm COL
                            307    ld    hl, #0xC000    ;; [3] HL Points to Start of Video Memory
                            308    ld    de, #0xC001    ;; [3] DE Points to the next byte
                            309    ld    bc, #0x4000    ;; [3] BC = 16384 bytes to be copied
                            310    ld   (hl), #COL      ;; [3] First Byte = given Colour
                            311    ldir                 ;; [98297] Perform the copy
                            312 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 46.
Hexadecimal [16-Bits]



                             24 .include "video/colours.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2017 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;//////////////////////////////////////////////////////////////////////
                             20 ;;//////////////////////////////////////////////////////////////////////
                             21 ;; File: Colours (asm)
                             22 ;;//////////////////////////////////////////////////////////////////////
                             23 ;;//////////////////////////////////////////////////////////////////////
                             24 ;;
                             25 ;;    Constants and utilities to manage the 27 colours from
                             26 ;; the CPC Palette comfortably in assembler.
                             27 ;;
                             28 ;;
                             29 
                             30 ;; Constant: Firmware colour values
                             31 ;;
                             32 ;;    Enumerates all 27 firmware colours for assembler programs
                             33 ;;
                             34 ;; Values:
                             35 ;; (start code)
                             36 ;;   [=================================================]
                             37 ;;   | Identifier        | Val| Identifier        | Val|
                             38 ;;   |-------------------------------------------------|
                             39 ;;   | FW_BLACK          |  0 | FW_BLUE           |  1 |
                             40 ;;   | FW_BRIGHT_BLUE    |  2 | FW_RED            |  3 |
                             41 ;;   | FW_MAGENTA        |  4 | FW_MAUVE          |  5 |
                             42 ;;   | FW_BRIGHT_RED     |  6 | FW_PURPLE         |  7 |
                             43 ;;   | FW_BRIGHT_MAGENTA |  8 | FW_GREEN          |  9 |
                             44 ;;   | FW_CYAN           | 10 | FW_SKY_BLUE       | 11 |
                             45 ;;   | FW_YELLOW         | 12 | FW_WHITE          | 13 |
                             46 ;;   | FW_PASTEL_BLUE    | 14 | FW_ORANGE         | 15 |
                             47 ;;   | FW_PINK           | 16 | FW_PASTEL_MAGENTA | 17 |
                             48 ;;   | FW_BRIGHT_GREEN   | 18 | FW_SEA_GREEN      | 19 |
                             49 ;;   | FW_BRIGHT_CYAN    | 20 | FW_LIME           | 21 |
                             50 ;;   | FW_PASTEL_GREEN   | 22 | FW_PASTEL_CYAN    | 23 |
                             51 ;;   | FW_BRIGHT_YELLOW  | 24 | FW_PASTEL_YELLOW  | 25 |
                             52 ;;   | FW_BRIGHT_WHITE   | 26 |                   |    |
                             53 ;;   [=================================================]
                             54 ;; (end code)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 47.
Hexadecimal [16-Bits]



                             55 
                     0000    56 FW_BLACK          =  0
                     0001    57 FW_BLUE           =  1
                     0002    58 FW_BRIGHT_BLUE    =  2
                     0003    59 FW_RED            =  3
                     0004    60 FW_MAGENTA        =  4
                     0005    61 FW_MAUVE          =  5
                     0006    62 FW_BRIGHT_RED     =  6
                     0007    63 FW_PURPLE         =  7
                     0008    64 FW_BRIGHT_MAGENTA =  8
                     0009    65 FW_GREEN          =  9
                     000A    66 FW_CYAN           = 10
                     000B    67 FW_SKY_BLUE       = 11
                     000C    68 FW_YELLOW         = 12
                     000D    69 FW_WHITE          = 13
                     000E    70 FW_PASTEL_BLUE    = 14
                     000F    71 FW_ORANGE         = 15
                     0010    72 FW_PINK           = 16
                     0011    73 FW_PASTEL_MAGENTA = 17
                     0012    74 FW_BRIGHT_GREEN   = 18
                     0013    75 FW_SEA_GREEN      = 19
                     0014    76 FW_BRIGHT_CYAN    = 20
                     0015    77 FW_LIME           = 21
                     0016    78 FW_PASTEL_GREEN   = 22
                     0017    79 FW_PASTEL_CYAN    = 23
                     0018    80 FW_BRIGHT_YELLOW  = 24
                     0019    81 FW_PASTEL_YELLOW  = 25
                     001A    82 FW_BRIGHT_WHITE   = 26
                             83 
                             84 ;; Constant: Hardware colour values
                             85 ;;
                             86 ;;    Enumerates all 27 hardware colours for assembler programs
                             87 ;;
                             88 ;; Values:
                             89 ;; (start code)
                             90 ;;   [=====================================================]
                             91 ;;   | Identifier        | Value| Identifier        | Value|
                             92 ;;   |-----------------------------------------------------|
                             93 ;;   | HW_BLACK          | 0x14 | HW_BLUE           | 0x04 |
                             94 ;;   | HW_BRIGHT_BLUE    | 0x15 | HW_RED            | 0x1C |
                             95 ;;   | HW_MAGENTA        | 0x18 | HW_MAUVE          | 0x1D |
                             96 ;;   | HW_BRIGHT_RED     | 0x0C | HW_PURPLE         | 0x05 |
                             97 ;;   | HW_BRIGHT_MAGENTA | 0x0D | HW_GREEN          | 0x16 |
                             98 ;;   | HW_CYAN           | 0x06 | HW_SKY_BLUE       | 0x17 |
                             99 ;;   | HW_YELLOW         | 0x1E | HW_WHITE          | 0x00 |
                            100 ;;   | HW_PASTEL_BLUE    | 0x1F | HW_ORANGE         | 0x0E |
                            101 ;;   | HW_PINK           | 0x07 | HW_PASTEL_MAGENTA | 0x0F |
                            102 ;;   | HW_BRIGHT_GREEN   | 0x12 | HW_SEA_GREEN      | 0x02 |
                            103 ;;   | HW_BRIGHT_CYAN    | 0x13 | HW_LIME           | 0x1A |
                            104 ;;   | HW_PASTEL_GREEN   | 0x19 | HW_PASTEL_CYAN    | 0x1B |
                            105 ;;   | HW_BRIGHT_YELLOW  | 0x0A | HW_PASTEL_YELLOW  | 0x03 |
                            106 ;;   | HW_BRIGHT_WHITE   | 0x0B |                   |      |
                            107 ;;   [=====================================================]
                            108 ;; (end code)
                            109 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 48.
Hexadecimal [16-Bits]



                     0014   110 HW_BLACK          = 0x14
                     0004   111 HW_BLUE           = 0x04
                     0015   112 HW_BRIGHT_BLUE    = 0x15
                     001C   113 HW_RED            = 0x1C
                     0018   114 HW_MAGENTA        = 0x18
                     001D   115 HW_MAUVE          = 0x1D
                     000C   116 HW_BRIGHT_RED     = 0x0C
                     0005   117 HW_PURPLE         = 0x05
                     000D   118 HW_BRIGHT_MAGENTA = 0x0D
                     0016   119 HW_GREEN          = 0x16
                     0006   120 HW_CYAN           = 0x06
                     0017   121 HW_SKY_BLUE       = 0x17
                     001E   122 HW_YELLOW         = 0x1E
                     0000   123 HW_WHITE          = 0x00
                     001F   124 HW_PASTEL_BLUE    = 0x1F
                     000E   125 HW_ORANGE         = 0x0E
                     0007   126 HW_PINK           = 0x07
                     000F   127 HW_PASTEL_MAGENTA = 0x0F
                     0012   128 HW_BRIGHT_GREEN   = 0x12
                     0002   129 HW_SEA_GREEN      = 0x02
                     0013   130 HW_BRIGHT_CYAN    = 0x13
                     001A   131 HW_LIME           = 0x1A
                     0019   132 HW_PASTEL_GREEN   = 0x19
                     001B   133 HW_PASTEL_CYAN    = 0x1B
                     000A   134 HW_BRIGHT_YELLOW  = 0x0A
                     0003   135 HW_PASTEL_YELLOW  = 0x03
                     000B   136 HW_BRIGHT_WHITE   = 0x0B
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 49.
Hexadecimal [16-Bits]



                             25 
                             26 ;;
                             27 ;; Constant values
                             28 ;;
                     7F00    29 GA_port        = 0x7F00  ;; 16-bit Port of the Gate Array (for the use with BC register)
                     007F    30 GA_port_byte   = 0x7F    ;; 8-bit Port of the Gate Array
                     0000    31 PAL_PENR       = 0x00    ;; Command to select a PEN register in the PAL chip
                     0040    32 PAL_INKR       = 0x40    ;; Command to set the INK of a previously selected PEN register in the PAL chip
                     00F5    33 PPI_PORT_B     = 0xF5    ;; Port B of the PPI, used to read Vsync/Jumpers/PrinterBusy/CasIn/Exp information
                     00BC    34 CRTC_SELECTREG = 0xBC    ;; CRTC Port and command "Select Register"
                     00BD    35 CRTC_SETVAL    = 0xBD    ;; CRTC Port and command "Set Value"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 50.
Hexadecimal [16-Bits]



                             23 .include "sprites/sprites.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;#####################################################################
                             22 ;;### Functions, macros and definitions used for managing sprites
                             23 ;;### in assembler code
                             24 ;;#####################################################################
                             25 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 51.
Hexadecimal [16-Bits]



                             26 .include "sprites/flipping/flipping_macros.h.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 
                             19 ;;#####################################################################
                             20 ;;### MODULE: Sprites
                             21 ;;### SUBMODULE: flipping.macros
                             22 ;;#####################################################################
                             23 ;;### Macros used to speed up calculations required for to assist
                             24 ;;### flipping functions. Assembler version.
                             25 ;;#####################################################################
                             26 
                             27 ;;
                             28 ;; Macro: cpctm_ld_spbloff
                             29 ;;
                             30 ;;    Macro that calculates the offset to add to a sprite pointer to point 
                             31 ;; to its bottom left pixel.
                             32 ;;
                             33 ;; ASM Definition:
                             34 ;;    .macro <cpctm_ld_spbloff> *REG*, *W*, *H*
                             35 ;;
                             36 ;; Acronym stands for:
                             37 ;;    ld_sbloff = Load Sprite Bottom Left Offset
                             38 ;;
                             39 ;; Parameters:
                             40 ;;    (1-2B) REG - Register that will load the resulting offset (8 or 16 bits)
                             41 ;;    (1B) W     - Width of the sprite in *bytes*
                             42 ;;    (1B) H     - Height of the sprite in pixels
                             43 ;;
                             44 ;; Parameter Restrictions:
                             45 ;;    *REG* - Must be a valid 8/16 bits register that can be immediately loaded
                             46 ;; using ld REG, #immediate.
                             47 ;;    *W*   - Must be an immediate value representing the width of the sprite 
                             48 ;; in *bytes* (Beware! Not in pixels). For sprites having interlaced mask, you 
                             49 ;; may input 2 times the width of the sprite for appropriate results.
                             50 ;;    *H*   - Must be an immediate value representing the height of the sprite 
                             51 ;; in pixels.
                             52 ;;
                             53 ;; Returns:
                             54 ;; (start code)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 52.
Hexadecimal [16-Bits]



                             55 ;;    REG = W * (H - 1) ;; Register loaded with the offset
                             56 ;; (end code)
                             57 ;;
                             58 ;; Details:
                             59 ;;    This macro calculates the offset of the initial byte of the last row 
                             60 ;; of a given sprite (i.e. its bottom-left byte), with respect to its first
                             61 ;; byte (top-left corner). This value can easily be added to any sprite 
                             62 ;; pointer to get a pointer to the bottom-left byte. This pointer is required
                             63 ;; byte many flipping functions (like <cpct_vflipSprite>). Values for width
                             64 ;; and height of the sprite must be constant immediate values. Otherwise, this
                             65 ;; macro will generate incorrect code that will fail to compile. 
                             66 ;;    The macro calculates *W* * (*H*-1) at compile-time and loads it into
                             67 ;; the given register. Please, take into account that the macro does no check
                             68 ;; about the size of the resulting values. If multiplication results in a value
                             69 ;; greater than 255, you will need to load it into a 16-bit register. You must
                             70 ;; take care of the expected size of the offset value.
                             71 ;;
                             72 ;; Known issues:
                             73 ;;    * This is a assembler macro. It cannot be called or used from C code.
                             74 ;;
                             75 .macro cpctm_ld_spbloff REG, W, H
                             76    ld    REG, #W * (H-1)
                             77 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 53.
Hexadecimal [16-Bits]



                             25 .include "cpct_functions.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 54.
Hexadecimal [16-Bits]



                             26 .include "sys/render.h.s"
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
                             25 ;; RENDER SYSTEM
                             26 ;;
                             27 .module Render_System
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl ren_init_backBuffer
                             31 .globl sys_render_handler
                             32 .globl sys_render_clearBackBuffer
                             33 .globl sys_render_init
                             34 .globl sys_render_update
                             35 .globl update_XOR_borrar_IX
                             36 .globl update_XOR_borrar_IY
                             37 .globl sys_render_newScene
                             38 
                             39 ;; CONSTANTS
                             40 .globl _main_palette
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 55.
Hexadecimal [16-Bits]



                             27 .include "sys/physics.h.s"
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
                             25 ;; PHYSIC SYSTEM
                             26 ;;
                             27 .module Physics_System
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl sys_physics_update
                             31 
                             32 .globl entity_moveKeyboard
                             33 .globl entity_enemy_move
                             34 .globl entity_nothing
                             35 
                             36 .globl entity_move
                             37 .globl move_enemy
                             38 .globl move_hammer
                             39 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 56.
Hexadecimal [16-Bits]



                             28 .include "sys/collision.h.s"
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
                             25 ;; COLLISION SYSTEM
                             26 ;;
                             27 .module Collision_System
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl sys_collision_update
                             31 
                             32 ;; CONSTANTS
                             33 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 57.
Hexadecimal [16-Bits]



                             29 .include "man/entity.h.s"
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
                             24 .module Entity_Manager
                             25 
                             26 ;; Sprites
                             27 .globl _viking_sp_0
                             28 .globl _viking_sp_1
                             29 .globl _viking_sp_2
                             30 .globl _enemy_sp_0
                             31 .globl _enemy_sp_1
                             32 .globl _enemy_sp_2
                             33 .globl _key_sp
                             34 .globl _hammer_sp
                             35 .globl _hammer_lado_sp_0
                             36 .globl _hammer_lado_sp_1
                             37 .globl _invisible_sp
                             38 
                             39 ;;Entities
                             40 
                     0003    41 num_entities_l1 = 3
                     0007    42 num_entities_l2 = 7
                     000A    43 num_entities_l3 = 10
                     0008    44 num_entities_l4 = 8
                     000C    45 num_entities_l5 = 12
                     0008    46 num_entities_l6 = 8
                     000C    47 num_entities_l7 = 12
                     000C    48 num_entities_l8 = 12
                     000C    49 num_entities_l9 = 12
                     0011    50 num_entities_l10 = 17
                     000B    51 num_entities_l11 = 11
                     000C    52 num_entities_l12 = 12
                     000B    53 num_entities_l13 = 11
                     0010    54 num_entities_l14 = 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 58.
Hexadecimal [16-Bits]



                     0011    55 num_entities_l15 = 17
                     000E    56 num_entities_l16 = 14
                     0016    57 num_entities_l17 = 22
                     0015    58 num_entities_l18 = 21
                     0010    59 num_entities_l19 = 16
                     0012    60 num_entities_l20 = 18
                             61 
                     0000    62 e_type              = 0
                     0001    63 e_object            = 1
                     0002    64 e_x                 = 2
                     0003    65 e_y                 = 3
                     0004    66 e_vx                = 4
                     0005    67 e_vy                = 5
                     0006    68 e_w                 = 6
                     0007    69 e_h                 = 7
                     0008    70 e_collisionable     = 8
                     0009    71 e_ladder            = 9
                     000A    72 e_invisible         = 10
                     000B    73 e_frame             = 11  
                     000C    74 e_ai_aim_x          = 12
                     000D    75 e_ai_aim_y          = 13 
                     000E    76 e_ai_st             = 14
                     000F    77 e_ai_pre_st         = 15
                     0010    78 e_ai_patrol_step_l  = 16
                     0011    79 e_ai_patrol_step_h  = 17
                     0012    80 e_sprite            = 18
                             81 
                             82 ;;Entity info
                             83 
                             84 
                     0014    85 sizeof_e    = 20
                     0016    86 max_entities = 22
                             87 ;;BIt for individual testing
                     0007    88 e_type_alive_bit = 7
                             89 
                             90 ;; BIT TYPE (MASKS)
                             91 
                     0000    92 e_type_invalid                          = 0x00
                     0001    93 e_type_input                            = 0x01
                     0002    94 e_type_physics                          = 0x02
                     0004    95 e_type_render                           = 0x04
                     0008    96 e_type_collision                        = 0x08
                     0010    97 e_type_ai                               = 0x10
                     0020    98 e_type_none                             = 0x20
                             99 
                            100 
                            101 ;; OBJECT TYPE (MASKS)
                            102 
                     0000   103 e_object_none                           = 0x00
                     0001   104 e_object_hero                           = 0x01
                     0002   105 e_object_enemy                          = 0x02
                     0004   106 e_object_ladder                         = 0x04
                     0008   107 e_object_door                           = 0x08
                     0010   108 e_object_invisible                      = 0x10
                     0020   109 e_object_hammer                         = 0x20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 59.
Hexadecimal [16-Bits]



                     0040   110 e_object_key                            = 0x40
                            111 
                            112 ;; LADDER TYPE (MASKS)
                            113 
                     0000   114 e_ladder_nothing                        = 0x00
                     0001   115 e_ladder_up                             = 0x01
                     0002   116 e_ladder_down                           = 0x02
                     0004   117 e_ladder_dentro                         = 0x04
                            118 
                            119 ;; MASKS FOR INVISIBLE ENTITIES
                     0000   120 e_invisible_nothing            = 0x00
                     0001   121 e_invisible_left               = 0x01
                     0002   122 e_invisible_right              = 0x02
                     0004   123 e_invisible_collision          = 0x04
                            124 
                            125 ;; MASKS ENTITY AI STATUS
                     0000   126 e_ai_st_noAI        = 0x00
                     0001   127 e_ai_st_stand_by    = 0x01
                     0002   128 e_ai_st_move_to     = 0x02
                     0004   129 e_ai_st_patrol      = 0x04
                            130 
                            131 ;; MASKS FRAME
                     0001   132 e_frame_inactivo      = 0x01
                     00FF   133 e_frame_activo        = 0xFF
                            134 
                            135 ;; TYPE (MASKS)
                            136 
                     0080   137 e_type_alive = (1 << e_type_alive_bit)
                     00FF   138 e_type_default = 0xFF
                     0080   139 e_type_dead = 0x80
                            140 
                            141 
                            142 ;;Public Functions
                            143 .globl man_entity_getEntityVector_IX
                            144 .globl man_entity_getEntity_hero_IY
                            145 .globl man_entity_init
                            146 .globl man_entity_create
                            147 .globl man_entity_destroy
                            148 .globl man_entity_forall
                            149 .globl man_entity_forall_matching
                            150 .globl man_entity_forall_pairs_matching
                            151 .globl man_entity_ladder_invisible_matching
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 60.
Hexadecimal [16-Bits]



                             30 .include "man/levels.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 61.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 62.
Hexadecimal [16-Bits]



                             31 .include "man/menu.h.s"
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
                             24 .globl man_menu_init
                             25 .globl man_menu_run
                             26 .globl _myDrawStringM0
                             27 .globl man_menu_lose
                             28 ;;.globl man_menu_restart
                             29 .globl man_menu_level_completed
                             30 .globl man_menu_continue
                             31 .globl man_menu_controls
                             32 .globl man_menu_credits
                             33 .globl man_menu_finish
                             34 ;;.globl man_pulsar_controls
                             35 ;;.globl man_pulsar_credits
                             36 
                             37 .globl _screenmenu_c_end
                             38 
                             39 ;;.macro DefineNEntities _name, _n
                             40 ;;    _c = 0
                             41 ;;    .rept _n
                             42 ;;        DefineEntityDefault _name, \_c 
                             43 ;;        _c = _c +1
                             44 ;;    .endm
                             45 ;;.endm
                             46 
                             47 ;;.macro DefineNEntities _name
                             48 ;;    _n = _n + 1
                             49 ;;    _name'_n
                             50 ;;.endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 63.
Hexadecimal [16-Bits]



                             32 .include "man/patrol.h.s"
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
                             25 ;;PATROL MANAGER
                             26 ;;
                             27 
                             28 ;; CONSTANTS
                     FFFFFFFF    29 patrol_invalid_move_x = -1
                             30 
                             31 ;; PUBLIC FUNCTIONS
                             32 .globl man_patrol_init
                             33 
                             34 ;; PATROLS
                             35 .globl _patrol_l2_01
                             36 .globl _patrol_l3_01
                             37 .globl _patrol_l3_02
                             38 .globl _patrol_l4_01
                             39 .globl _patrol_l5_01
                             40 .globl _patrol_l5_02
                             41 .globl _patrol_l7_01
                             42 .globl _patrol_l7_02
                             43 .globl _patrol_l8_01
                             44 .globl _patrol_l8_02
                             45 .globl _patrol_l9_01
                             46 .globl _patrol_l9_02
                             47 .globl _patrol_l10_01
                             48 .globl _patrol_l10_02
                             49 .globl _patrol_l10_03
                             50 .globl _patrol_l11_01
                             51 .globl _patrol_l11_02
                             52 .globl _patrol_l12_01
                             53 .globl _patrol_l12_02
                             54 .globl _patrol_l13_01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 64.
Hexadecimal [16-Bits]



                             55 .globl _patrol_l13_02
                             56 .globl _patrol_l14_01
                             57 .globl _patrol_l14_02
                             58 .globl _patrol_l15_01
                             59 .globl _patrol_l15_02
                             60 .globl _patrol_l16_01
                             61 .globl _patrol_l16_02
                             62 .globl _patrol_l17_01
                             63 .globl _patrol_l17_02
                             64 .globl _patrol_l17_03
                             65 .globl _patrol_l18_01
                             66 .globl _patrol_l18_02
                             67 .globl _patrol_l18_03
                             68 .globl _patrol_l19_01
                             69 .globl _patrol_l19_02
                             70 .globl _patrol_l19_03
                             71 .globl _patrol_l20_01
                             72 .globl _patrol_l20_02
                             73 .globl _patrol_l20_03
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 65.
Hexadecimal [16-Bits]



                             33 .include "man/interrupt.h.s"
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
                             25 ;; INTERRUPT MANAGER
                             26 ;;
                             27 .module Interrupt_Manager
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl man_ir_init
                             31 .irp _num, 1,2,3,4,5,6,7,8,9,10,11,12        ;; Con esto creamos todos los .globl de man_ir, significa repetición indefinida y se repite 
                             32     .globl man_ir'_num                       ;; el número de veces de valores que haya
                             33 .endm
                              1     .globl man_ir1                       ;; el número de veces de valores que haya
                              1     .globl man_ir2                       ;; el número de veces de valores que haya
                              1     .globl man_ir3                       ;; el número de veces de valores que haya
                              1     .globl man_ir4                       ;; el número de veces de valores que haya
                              1     .globl man_ir5                       ;; el número de veces de valores que haya
                              1     .globl man_ir6                       ;; el número de veces de valores que haya
                              1     .globl man_ir7                       ;; el número de veces de valores que haya
                              1     .globl man_ir8                       ;; el número de veces de valores que haya
                              1     .globl man_ir9                       ;; el número de veces de valores que haya
                              1     .globl man_ir10                       ;; el número de veces de valores que haya
                              1     .globl man_ir11                       ;; el número de veces de valores que haya
                              1     .globl man_ir12                       ;; el número de veces de valores que haya
                             34 
                             35 ;; PUBLIC DATA
                             36 .globl man_ir_num_interrupt
                             37 
                             38 
                             39 ;; MACROS
                             40 .macro setNextManIR direccion
                             41    ld    hl, #direccion
                             42    ld    (0x39), hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 66.
Hexadecimal [16-Bits]



                             43 .endm
                             44 
                             45 .macro setNumIR number
                             46    ld    a, #number
                             47    ld    (man_ir_num_interrupt), a
                             48 .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 67.
Hexadecimal [16-Bits]



                             34 .include "sys/ai_control.h.s"
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
                             25 ;; AI CONTROL SYSTEM
                             26 ;;
                             27 .module AI_Control_System
                             28 
                             29 ;; PUBLIC FUNCTIONS
                             30 .globl sys_ai_control_init
                             31 .globl sys_ai_control_update
                             32 .globl sys_ai_stand_by
                             33 .globl sys_ai_move_to
                             34 .globl sys_ai_patrol
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 68.
Hexadecimal [16-Bits]



                             35 
                             36 
                             37 ;;
                             38 
                             39 .area _DATA
                             40 .area _CODE
                             41 
   341D                      42 _invisible_sp::
   341D 0F                   43 	.db	0x0F
                             44 
                             45 
                             46 ;;------------------------------------------------------------------------------------------------------
                             47 ;; ----------------------DECLARATION OF ENTITIES-------------------------------
                             48 ;;------------------------------------------------------------------------------------------------------
                             49 
                             50 
                             51 
                             52 ;;------------------------------------------------------------------------------------------------------
                             53 ;;------------------------------------------------------------------------------------------------------
                             54 ;; Entities level 1
   341E                      55 entities_level1::
                             56 ;;------------------------------------------------------------------------------------------------------
                             57 ;; Hero
   341E 0F 01 24 A4 00 00    58 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x24, 0xA4, 0, 0, 6, 16
        06 10
   3426 7E                   59 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3427 00                   60 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3428 00 01                61 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   342A 00 00                62 .db 0, 0
   342C 00 00                63 .db e_ai_st_noAI, e_ai_st_noAI
   342E 00 00 8D 0D          64 .dw 0x0000, _viking_sp_0
                             65 
                             66 ;;------------------------------------------------------------------------------------------------------
                             67 ;; Door
   3432 08 08 45 A4 00 00    68 .db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   343A 00                   69 .db e_object_none
   343B 00                   70 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   343C 00 01                71 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   343E 00 00                72 .db 0, 0
   3440 00 00                73 .db e_ai_st_noAI, e_ai_st_noAI
   3442 00 00 1D 34          74 .dw 0x0000, _invisible_sp
                             75 
                             76 ;;------------------------------------------------------------------------------------------------------
                             77 ;; Key
   3446 0C 40 04 A4 00 00    78 .db e_type_render|e_type_collision, e_object_key, 0x04, 0xA4, 0, 0, 2, 8
        02 08
   344E 00                   79 .db e_object_none
   344F 00                   80 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3450 00 01                81 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3452 00 00                82 .db 0, 0
   3454 00 00                83 .db e_ai_st_noAI, e_ai_st_noAI
   3456 00 00 5D 0C          84 .dw 0x0000, _key_sp
                             85 
                             86 ;;------------------------------------------------------------------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 69.
Hexadecimal [16-Bits]



                             87 ;;------------------------------------------------------------------------------------------------------
                             88 ;; Entities level 2
   345A                      89 entities_level2::
                             90 
                             91 ;;------------------------------------------------------------------------------------------------------
                             92 ;; Hero
   345A 0F 01 49 A4 00 00    93 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x49, 0xA4, 0, 0, 6, 16
        06 10
   3462 7E                   94 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3463 00                   95 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3464 00 01                96 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3466 00 00                97 .db 0, 0
   3468 00 00                98 .db e_ai_st_noAI, e_ai_st_noAI
   346A 00 00 ED 0D          99 .dw 0x0000, _viking_sp_1
                            100 
                            101 ;;------------------------------------------------------------------------------------------------------
                            102 ;; Enemies	 
   346E 1E 02 30 A4 00 00   103 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x30, 0xA4, 0, 0, 6, 16
        06 10
   3476 20                  104 .db e_object_hammer	;; Objetos con los que puede colisionar
   3477 00                  105 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3478 00 01               106 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   347A 00 00               107 .db 0, 0
   347C 01 01               108 .db e_ai_st_stand_by, e_ai_st_stand_by
   347E 95 57 6D 0C         109 .dw _patrol_l2_01, _enemy_sp_0
                            110 
                            111 ;;------------------------------------------------------------------------------------------------------
                            112 ;;Invisible entities
   3482 08 10 1E A4 00 00   113 .db e_type_collision, e_object_invisible, 0x1E, 0xA4, 0, 0, 1, 1
        01 01
   348A 00                  114 .db e_object_none
   348B 00                  115 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   348C 00 01               116 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   348E 00 00               117 .db 0, 0
   3490 00 00               118 .db e_ai_st_noAI, e_ai_st_noAI
   3492 00 00 1D 34         119 .dw 0x0000, _invisible_sp
                            120 
   3496 08 10 1E 68 00 00   121 .db e_type_collision, e_object_invisible, 0x1E, 0x68, 0, 0, 1, 1
        01 01
   349E 00                  122 .db e_object_none
   349F 00                  123 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   34A0 00 01               124 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   34A2 00 00               125 .db 0, 0
   34A4 00 00               126 .db e_ai_st_noAI, e_ai_st_noAI
   34A6 00 00 1D 34         127 .dw 0x0000, _invisible_sp
                            128 
                            129 ;;------------------------------------------------------------------------------------------------------
                            130 ;; Door
   34AA 08 08 21 68 00 00   131 .db e_type_collision, e_object_door, 0x21, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   34B2 00                  132 .db e_object_none
   34B3 00                  133 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   34B4 00 01               134 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   34B6 00 00               135 .db 0, 0
   34B8 00 00               136 .db e_ai_st_noAI, e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 70.
Hexadecimal [16-Bits]



   34BA 00 00 1D 34         137 .dw 0x0000, _invisible_sp
                            138 
                            139 ;;------------------------------------------------------------------------------------------------------
                            140 ;; Key
   34BE 0C 40 45 68 00 00   141 .db e_type_render|e_type_collision, e_object_key, 0x45, 0x68, 0, 0, 2, 8
        02 08
   34C6 00                  142 .db e_object_none
   34C7 00                  143 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   34C8 00 01               144 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   34CA 00 00               145 .db 0, 0
   34CC 00 00               146 .db e_ai_st_noAI, e_ai_st_noAI
   34CE 00 00 5D 0C         147 .dw 0x0000, _key_sp
                            148 
                            149 ;;------------------------------------------------------------------------------------------------------
                            150 ;; Ladders
   34D2 08 04 3C A4 00 00   151 .db e_type_collision, e_object_ladder, 0x3C, 0xA4 , 0, 0, 6, 60
        06 3C
   34DA 00                  152 .db e_object_none
   34DB 00                  153 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   34DC 00 01               154 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   34DE 00 00               155 .db 0, 0
   34E0 00 00               156 .db e_ai_st_noAI, e_ai_st_noAI
   34E2 00 00 1D 34         157 .dw 0x0000, _invisible_sp
                            158 
                            159 ;;------------------------------------------------------------------------------------------------------
                            160 ;;------------------------------------------------------------------------------------------------------
                            161 ;; Entities level 3
   34E6                     162 entities_level3::
                            163 
                            164 ;;------------------------------------------------------------------------------------------------------
                            165 ;; Hero
   34E6 0F 01 45 68 00 00   166 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0x68, 0, 0, 6, 16
        06 10
   34EE 7E                  167 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   34EF 00                  168 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   34F0 00 01               169 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   34F2 00 00               170 .db 0, 0
   34F4 00 00               171 .db e_ai_st_noAI, e_ai_st_noAI
   34F6 00 00 ED 0D         172 .dw 0x0000, _viking_sp_1
                            173 
                            174 ;;------------------------------------------------------------------------------------------------------
                            175 ;; Enemies	 
   34FA 1E 02 39 A4 00 00   176 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x39, 0xA4, 0, 0, 6, 16
        06 10
   3502 20                  177 .db e_object_hammer	;; Objetos con los que puede colisionar
   3503 00                  178 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3504 00 FF               179 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3506 00 00               180 .db 0, 0
   3508 01 01               181 .db e_ai_st_stand_by, e_ai_st_stand_by
   350A 9C 57 6D 0C         182 .dw _patrol_l3_01, _enemy_sp_0
                            183 
   350E 1E 02 20 68 00 00   184 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x68, 0, 0, 6, 16
        06 10
   3516 20                  185 .db e_object_hammer	;; Objetos con los que puede colisionar
   3517 00                  186 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 71.
Hexadecimal [16-Bits]



   3518 00 01               187 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   351A 00 00               188 .db 0, 0
   351C 01 01               189 .db e_ai_st_stand_by, e_ai_st_stand_by
   351E A3 57 6D 0C         190 .dw _patrol_l3_02, _enemy_sp_0
                            191 
                            192 ;;------------------------------------------------------------------------------------------------------
                            193 ;;Invisible entities
   3522 08 10 0E A4 00 00   194 .db e_type_collision, e_object_invisible, 0x0E, 0xA4, 0, 0, 1, 1
        01 01
   352A 00                  195 .db e_object_none
   352B 00                  196 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   352C 00 01               197 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   352E 00 00               198 .db 0, 0
   3530 00 00               199 .db e_ai_st_noAI, e_ai_st_noAI
   3532 00 00 1D 34         200 .dw 0x0000, _invisible_sp
                            201 
   3536 08 10 0E 68 00 00   202 .db e_type_collision, e_object_invisible, 0x0E, 0x68, 0, 0, 1, 1
        01 01
   353E 00                  203 .db e_object_none
   353F 00                  204 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3540 00 01               205 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3542 00 00               206 .db 0, 0
   3544 00 00               207 .db e_ai_st_noAI, e_ai_st_noAI
   3546 00 00 1D 34         208 .dw 0x0000, _invisible_sp
                            209 
   354A 08 10 20 2C 00 00   210 .db e_type_collision, e_object_invisible, 0x20, 0x2C, 0, 0, 1, 16
        01 10
   3552 00                  211 .db e_object_none
   3553 00                  212 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3554 00 01               213 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3556 00 00               214 .db 0, 0
   3558 00 00               215 .db e_ai_st_noAI, e_ai_st_noAI
   355A 00 00 1D 34         216 .dw 0x0000, _invisible_sp
                            217 
                            218 ;;------------------------------------------------------------------------------------------------------
                            219 ;; Door
   355E 08 08 1D A4 00 00   220 .db e_type_collision, e_object_door, 0x1D, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3566 00                  221 .db e_object_none
   3567 00                  222 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3568 00 01               223 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   356A 00 00               224 .db 0, 0
   356C 00 00               225 .db e_ai_st_noAI, e_ai_st_noAI
   356E 00 00 1D 34         226 .dw 0x0000, _invisible_sp
                            227 
                            228 ;;------------------------------------------------------------------------------------------------------
                            229 ;; Key
   3572 0C 40 45 2C 00 00   230 .db e_type_render|e_type_collision, e_object_key, 0x45, 0x2C, 0, 0, 2, 8
        02 08
   357A 00                  231 .db e_object_none
   357B 00                  232 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   357C 00 01               233 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   357E 00 00               234 .db 0, 0
   3580 00 00               235 .db e_ai_st_noAI, e_ai_st_noAI
   3582 00 00 5D 0C         236 .dw 0x0000, _key_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 72.
Hexadecimal [16-Bits]



                            237 
                            238 ;;------------------------------------------------------------------------------------------------------
                            239 ;; Ladders
   3586 08 04 34 A4 00 00   240 .db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 60
        06 3C
   358E 00                  241 .db e_object_none
   358F 00                  242 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3590 00 01               243 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3592 00 00               244 .db 0, 0
   3594 00 00               245 .db e_ai_st_noAI, e_ai_st_noAI
   3596 00 00 1D 34         246 .dw 0x0000, _invisible_sp
                            247 
   359A 08 04 2A 68 00 00   248 .db e_type_collision, e_object_ladder, 0x2A, 0x68 , 0, 0, 6, 60
        06 3C
   35A2 00                  249 .db e_object_none
   35A3 00                  250 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   35A4 00 01               251 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   35A6 00 00               252 .db 0, 0
   35A8 00 00               253 .db e_ai_st_noAI, e_ai_st_noAI
   35AA 00 00 1D 34         254 .dw 0x0000, _invisible_sp
                            255 
                            256 ;;------------------------------------------------------------------------------------------------------
                            257 ;;------------------------------------------------------------------------------------------------------
                            258 ;; Entities level 4
   35AE                     259 entities_level4::
                            260 ;;------------------------------------------------------------------------------------------------------
                            261 ;; Hero
   35AE 0F 01 25 68 00 00   262 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x25, 0x68, 0, 0, 6, 16
        06 10
   35B6 7E                  263 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   35B7 00                  264 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   35B8 00 01               265 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   35BA 00 00               266 .db 0, 0
   35BC 00 00               267 .db e_ai_st_noAI, e_ai_st_noAI
   35BE 00 00 8D 0D         268 .dw 0x0000, _viking_sp_0
                            269 
                            270 ;;------------------------------------------------------------------------------------------------------
                            271 ;; Enemies	 
   35C2 1E 02 39 68 00 00   272 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x39, 0x68, 0, 0, 6, 16
        06 10
   35CA 30                  273 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   35CB 00                  274 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   35CC 00 01               275 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   35CE 00 00               276 .db 0, 0
   35D0 01 01               277 .db e_ai_st_stand_by, e_ai_st_stand_by
   35D2 AA 57 6D 0C         278 .dw _patrol_l4_01, _enemy_sp_0
                            279 
                            280 ;;------------------------------------------------------------------------------------------------------
                            281 ;; Door
   35D6 08 08 45 A4 00 00   282 .db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   35DE 00                  283 .db e_object_none
   35DF 00                  284 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   35E0 00 01               285 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   35E2 00 00               286 .db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 73.
Hexadecimal [16-Bits]



   35E4 00 00               287 .db e_ai_st_noAI, e_ai_st_noAI
   35E6 00 00 1D 34         288 .dw 0x0000, _invisible_sp
                            289 
                            290 ;;------------------------------------------------------------------------------------------------------
                            291 ;; Key
   35EA 0C 40 10 A4 00 00   292 .db e_type_render|e_type_collision, e_object_key, 0x10, 0xA4, 0, 0, 2, 8
        02 08
   35F2 00                  293 .db e_object_none
   35F3 00                  294 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   35F4 00 01               295 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   35F6 00 00               296 .db 0, 0
   35F8 00 00               297 .db e_ai_st_noAI, e_ai_st_noAI
   35FA 00 00 5D 0C         298 .dw 0x0000, _key_sp
                            299 
                            300 ;;------------------------------------------------------------------------------------------------------
                            301 ;; Ladders
   35FE 08 04 06 A4 00 00   302 .db e_type_collision, e_object_ladder, 0x06, 0xA4 , 0, 0, 6, 60
        06 3C
   3606 00                  303 .db e_object_none
   3607 00                  304 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3608 00 01               305 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   360A 00 00               306 .db 0, 0
   360C 00 00               307 .db e_ai_st_noAI, e_ai_st_noAI
   360E 00 00 1D 34         308 .dw 0x0000, _invisible_sp
                            309 
   3612 08 04 34 A4 00 00   310 .db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 60
        06 3C
   361A 00                  311 .db e_object_none
   361B 00                  312 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   361C 00 01               313 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   361E 00 00               314 .db 0, 0
   3620 00 00               315 .db e_ai_st_noAI, e_ai_st_noAI
   3622 00 00 1D 34         316 .dw 0x0000, _invisible_sp
                            317 
                            318 ;;------------------------------------------------------------------------------------------------------
                            319 ;;Invisible entities
   3626 08 10 1D A4 00 00   320 .db e_type_collision, e_object_invisible, 0x1D, 0xA4, 0, 0, 1, 16
        01 10
   362E 00                  321 .db e_object_none
   362F 00                  322 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3630 00 01               323 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3632 00 00               324 .db 0, 0
   3634 00 00               325 .db e_ai_st_noAI, e_ai_st_noAI
   3636 00 00 1D 34         326 .dw 0x0000, _invisible_sp
                            327 
   363A 08 10 28 A4 00 00   328 .db e_type_collision, e_object_invisible, 0x28, 0xA4, 0, 0, 1, 16
        01 10
   3642 00                  329 .db e_object_none
   3643 00                  330 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3644 00 01               331 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3646 00 00               332 .db 0, 0
   3648 00 00               333 .db e_ai_st_noAI, e_ai_st_noAI
   364A 00 00 1D 34         334 .dw 0x0000, _invisible_sp
                            335 
                            336 ;;------------------------------------------------------------------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 74.
Hexadecimal [16-Bits]



                            337 ;;------------------------------------------------------------------------------------------------------
                            338 ;; Entities level 5
   364E                     339 entities_level5::
                            340 ;;------------------------------------------------------------------------------------------------------
                            341 ;; Hero
   364E 0F 01 45 A4 00 00   342 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0xA4, 0, 0, 6, 16
        06 10
   3656 7E                  343 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3657 00                  344 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3658 00 01               345 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   365A 00 00               346 .db 0, 0
   365C 00 00               347 .db e_ai_st_noAI, e_ai_st_noAI
   365E 00 00 ED 0D         348 .dw 0x0000, _viking_sp_1
                            349 
                            350 ;;------------------------------------------------------------------------------------------------------
                            351 ;; Enemies	 
   3662 1E 02 1A 68 00 00   352 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1A, 0x68, 0, 0, 6, 16
        06 10
   366A 20                  353 .db e_object_hammer	;; Objetos con los que puede colisionar
   366B 00                  354 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   366C 00 01               355 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   366E 00 00               356 .db 0, 0
   3670 01 01               357 .db e_ai_st_stand_by, e_ai_st_stand_by
   3672 B1 57 6D 0C         358 .dw _patrol_l5_01, _enemy_sp_0
                            359 
   3676 1E 02 20 68 00 00   360 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x68, 0, 0, 6, 16
        06 10
   367E 20                  361 .db e_object_hammer	;; Objetos con los que puede colisionar
   367F 00                  362 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3680 00 FF               363 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3682 00 00               364 .db 0, 0
   3684 01 01               365 .db e_ai_st_stand_by, e_ai_st_stand_by
   3686 B8 57 CD 0C         366 .dw _patrol_l5_02, _enemy_sp_1
                            367 
                            368 ;;------------------------------------------------------------------------------------------------------
                            369 ;; Door
   368A 08 08 1A 2C 00 00   370 .db e_type_collision, e_object_door, 0x1A, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3692 00                  371 .db e_object_none
   3693 00                  372 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3694 00 01               373 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3696 00 00               374 .db 0, 0
   3698 00 00               375 .db e_ai_st_noAI, e_ai_st_noAI
   369A 00 00 1D 34         376 .dw 0x0000, _invisible_sp
                            377 
                            378 ;;------------------------------------------------------------------------------------------------------
                            379 ;; Key
   369E 0C 40 06 68 00 00   380 .db e_type_render|e_type_collision, e_object_key, 0x06, 0x68, 0, 0, 2, 8
        02 08
   36A6 00                  381 .db e_object_none
   36A7 00                  382 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   36A8 00 01               383 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   36AA 00 00               384 .db 0, 0
   36AC 00 00               385 .db e_ai_st_noAI, e_ai_st_noAI
   36AE 00 00 5D 0C         386 .dw 0x0000, _key_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 75.
Hexadecimal [16-Bits]



                            387 
                            388 ;;------------------------------------------------------------------------------------------------------
                            389 ;; Ladders
   36B2 08 04 2E A4 00 00   390 .db e_type_collision, e_object_ladder, 0x2E, 0xA4 , 0, 0, 6, 60
        06 3C
   36BA 00                  391 .db e_object_none
   36BB 00                  392 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   36BC 00 01               393 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   36BE 00 00               394 .db 0, 0
   36C0 00 00               395 .db e_ai_st_noAI, e_ai_st_noAI
   36C2 00 00 1D 34         396 .dw 0x0000, _invisible_sp
                            397 
   36C6 08 04 28 68 00 00   398 .db e_type_collision, e_object_ladder, 0x28, 0x68 , 0, 0, 6, 60
        06 3C
   36CE 00                  399 .db e_object_none
   36CF 00                  400 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   36D0 00 01               401 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   36D2 00 00               402 .db 0, 0
   36D4 00 00               403 .db e_ai_st_noAI, e_ai_st_noAI
   36D6 00 00 1D 34         404 .dw 0x0000, _invisible_sp
                            405 
   36DA 08 04 0C 68 00 00   406 .db e_type_collision, e_object_ladder, 0x0C, 0x68 , 0, 0, 6, 60
        06 3C
   36E2 00                  407 .db e_object_none
   36E3 00                  408 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   36E4 00 01               409 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   36E6 00 00               410 .db 0, 0
   36E8 00 00               411 .db e_ai_st_noAI, e_ai_st_noAI
   36EA 00 00 1D 34         412 .dw 0x0000, _invisible_sp
                            413 
                            414 
                            415 ;;------------------------------------------------------------------------------------------------------
                            416 ;;Invisible entities
   36EE 08 10 43 68 00 00   417 .db e_type_collision, e_object_invisible, 0x43, 0x68, 0, 0, 1, 1
        01 01
   36F6 00                  418 .db e_object_none
   36F7 00                  419 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   36F8 00 01               420 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   36FA 00 00               421 .db 0, 0
   36FC 00 00               422 .db e_ai_st_noAI, e_ai_st_noAI
   36FE 00 00 1D 34         423 .dw 0x0000, _invisible_sp
                            424 
   3702 08 10 2C A4 00 00   425 .db e_type_collision, e_object_invisible, 0x2C, 0xA4, 0, 0, 1, 1
        01 01
   370A 00                  426 .db e_object_none
   370B 00                  427 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   370C 00 01               428 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   370E 00 00               429 .db 0, 0
   3710 00 00               430 .db e_ai_st_noAI, e_ai_st_noAI
   3712 00 00 1D 34         431 .dw 0x0000, _invisible_sp
                            432 
   3716 08 10 0A 2C 00 00   433 .db e_type_collision, e_object_invisible, 0x0A, 0x2C, 0, 0, 1, 1
        01 01
   371E 00                  434 .db e_object_none
   371F 00                  435 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 76.
Hexadecimal [16-Bits]



   3720 00 01               436 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3722 00 00               437 .db 0, 0
   3724 00 00               438 .db e_ai_st_noAI, e_ai_st_noAI
   3726 00 00 1D 34         439 .dw 0x0000, _invisible_sp
                            440 
   372A 08 10 2F 2C 00 00   441 .db e_type_collision, e_object_invisible, 0x2F, 0x2C, 0, 0, 1, 1
        01 01
   3732 00                  442 .db e_object_none
   3733 00                  443 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3734 00 01               444 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3736 00 00               445 .db 0, 0
   3738 00 00               446 .db e_ai_st_noAI, e_ai_st_noAI
   373A 00 00 1D 34         447 .dw 0x0000, _invisible_sp
                            448 
                            449 ;;------------------------------------------------------------------------------------------------------
                            450 ;;------------------------------------------------------------------------------------------------------
                            451 ;; Entities level 6
   373E                     452 entities_level6::
                            453 ;;------------------------------------------------------------------------------------------------------
                            454 ;; Hero
   373E 0F 01 01 A4 00 00   455 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x01, 0xA4, 0, 0, 6, 16
        06 10
   3746 7E                  456 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3747 00                  457 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3748 00 01               458 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   374A 00 00               459 .db 0, 0
   374C 00 00               460 .db e_ai_st_noAI, e_ai_st_noAI
   374E 00 00 8D 0D         461 .dw 0x0000, _viking_sp_0
                            462 
                            463 ;;------------------------------------------------------------------------------------------------------
                            464 ;; Enemies	 
   3752 0C 02 37 A4 00 00   465 .db e_type_render|e_type_collision, e_object_enemy, 0x37, 0xA4, 0, 0, 6, 16
        06 10
   375A 30                  466 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   375B 00                  467 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   375C 00 01               468 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   375E 00 00               469 .db 0, 0
   3760 01 01               470 .db e_ai_st_stand_by, e_ai_st_stand_by
   3762 00 00 6D 0C         471 .dw 0x0000, _enemy_sp_0
                            472 
                            473 ;;------------------------------------------------------------------------------------------------------
                            474 ;; Door
   3766 08 08 43 A4 00 00   475 .db e_type_collision, e_object_door, 0x43, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   376E 00                  476 .db e_object_none
   376F 00                  477 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3770 00 01               478 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3772 00 00               479 .db 0, 0
   3774 00 00               480 .db e_ai_st_noAI, e_ai_st_noAI
   3776 00 00 1D 34         481 .dw 0x0000, _invisible_sp
                            482 
                            483 ;;------------------------------------------------------------------------------------------------------
                            484 ;; Key
   377A 0C 40 06 68 00 00   485 .db e_type_render|e_type_collision, e_object_key, 0x06, 0x68, 0, 0, 2, 8
        02 08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 77.
Hexadecimal [16-Bits]



   3782 00                  486 .db e_object_none
   3783 00                  487 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3784 00 01               488 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3786 00 00               489 .db 0, 0
   3788 00 00               490 .db e_ai_st_noAI, e_ai_st_noAI
   378A 00 00 5D 0C         491 .dw 0x0000, _key_sp
                            492 
                            493 ;;------------------------------------------------------------------------------------------------------
                            494 ;; Ladders
   378E 08 04 14 A4 00 00   495 .db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
        06 3C
   3796 00                  496 .db e_object_none
   3797 00                  497 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3798 00 01               498 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   379A 00 00               499 .db 0, 0
   379C 00 00               500 .db e_ai_st_noAI, e_ai_st_noAI
   379E 00 00 1D 34         501 .dw 0x0000, _invisible_sp
                            502 
                            503 ;;------------------------------------------------------------------------------------------------------
                            504 ;;Invisible entities
   37A2 08 10 1B 68 00 00   505 .db e_type_collision, e_object_invisible, 0x1B, 0x68, 0, 0, 1, 1
        01 01
   37AA 00                  506 .db e_object_none
   37AB 00                  507 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   37AC 00 01               508 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   37AE 00 00               509 .db 0, 0
   37B0 00 00               510 .db e_ai_st_noAI, e_ai_st_noAI
   37B2 00 00 1D 34         511 .dw 0x0000, _invisible_sp
                            512 
                            513 
                            514 ;;------------------------------------------------------------------------------------------------------
                            515 ;; Hammer
   37B6 0C 20 20 A4 00 00   516 .db e_type_render|e_type_collision, e_object_hammer, 0x20, 0xA4 , 0, 0, 2, 12
        02 0C
   37BE 00                  517 .db e_object_none
   37BF 00                  518 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   37C0 00 01               519 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   37C2 00 00               520 .db 0, 0
   37C4 00 00               521 .db e_ai_st_noAI, e_ai_st_noAI
   37C6 00 00 45 0C         522 .dw 0x0000, _hammer_sp
                            523 
                            524 ;;------------------------------------------------------------------------------------------------------
                            525 ;; Hammer (throw)
   37CA 0A 20 02 02 00 00   526 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   37D2 00                  527 .db e_object_none
   37D3 00                  528 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   37D4 00 01               529 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   37D6 00 00               530 .db 0, 0
   37D8 00 00               531 .db e_ai_st_noAI, e_ai_st_noAI
   37DA 00 00 05 0C         532 .dw 0x0000, _hammer_lado_sp_0
                            533 
                            534 
                            535 ;;------------------------------------------------------------------------------------------------------
                            536 ;;------------------------------------------------------------------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 78.
Hexadecimal [16-Bits]



                            537 ;; Entities level 7
   37DE                     538 entities_level7::
                            539 ;;------------------------------------------------------------------------------------------------------
                            540 ;; Hero
   37DE 0F 01 14 A4 00 00   541 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x14, 0xA4, 0, 0, 6, 16
        06 10
   37E6 7E                  542 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   37E7 00                  543 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   37E8 00 01               544 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   37EA 00 00               545 .db 0, 0
   37EC 00 00               546 .db e_ai_st_noAI, e_ai_st_noAI
   37EE 00 00 8D 0D         547 .dw 0x0000, _viking_sp_0
                            548 
                            549 ;;------------------------------------------------------------------------------------------------------
                            550 ;; Enemies	 
   37F2 1E 02 37 A4 00 00   551 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x37, 0xA4, 0, 0, 6, 16
        06 10
   37FA 30                  552 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   37FB 00                  553 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   37FC 00 FF               554 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   37FE 00 00               555 .db 0, 0
   3800 01 01               556 .db e_ai_st_stand_by, e_ai_st_stand_by
   3802 BF 57 6D 0C         557 .dw _patrol_l7_01, _enemy_sp_0
                            558 
   3806 1E 02 37 7C 00 00   559 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x37, 0x7C, 0, 0, 6, 16
        06 10
   380E 30                  560 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   380F 00                  561 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3810 00 01               562 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3812 00 00               563 .db 0, 0
   3814 01 01               564 .db e_ai_st_stand_by, e_ai_st_stand_by
   3816 C6 57 6D 0C         565 .dw _patrol_l7_02, _enemy_sp_0
                            566 
                            567 ;;------------------------------------------------------------------------------------------------------
                            568 ;; Door
   381A 08 08 37 7C 00 00   569 .db e_type_collision, e_object_door, 0x37, 0x7C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3822 00                  570 .db e_object_none
   3823 00                  571 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3824 00 01               572 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3826 00 00               573 .db 0, 0
   3828 00 00               574 .db e_ai_st_noAI, e_ai_st_noAI
   382A 00 00 1D 34         575 .dw 0x0000, _invisible_sp
                            576 
                            577 ;;------------------------------------------------------------------------------------------------------
                            578 ;; Key
   382E 0C 40 45 A4 00 00   579 .db e_type_render|e_type_collision, e_object_key, 0x45, 0xA4, 0, 0, 2, 8
        02 08
   3836 00                  580 .db e_object_none
   3837 00                  581 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3838 00 01               582 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   383A 00 00               583 .db 0, 0
   383C 00 00               584 .db e_ai_st_noAI, e_ai_st_noAI
   383E 00 00 5D 0C         585 .dw 0x0000, _key_sp
                            586 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 79.
Hexadecimal [16-Bits]



                            587 ;;------------------------------------------------------------------------------------------------------
                            588 ;; Ladders
   3842 08 04 24 A4 00 00   589 .db e_type_collision, e_object_ladder, 0x24, 0xA4 , 0, 0, 6, 40
        06 28
   384A 00                  590 .db e_object_none
   384B 00                  591 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   384C 00 01               592 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   384E 00 00               593 .db 0, 0
   3850 00 00               594 .db e_ai_st_noAI, e_ai_st_noAI
   3852 00 00 1D 34         595 .dw 0x0000, _invisible_sp
                            596 
   3856 08 04 06 A4 00 00   597 .db e_type_collision, e_object_ladder, 0x06, 0xA4 , 0, 0, 6, 60
        06 3C
   385E 00                  598 .db e_object_none
   385F 00                  599 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3860 00 01               600 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3862 00 00               601 .db 0, 0
   3864 00 00               602 .db e_ai_st_noAI, e_ai_st_noAI
   3866 00 00 1D 34         603 .dw 0x0000, _invisible_sp
                            604 
                            605 
                            606 ;;------------------------------------------------------------------------------------------------------
                            607 ;;Invisible entities
   386A 08 10 04 68 00 00   608 .db e_type_collision, e_object_invisible, 0x04, 0x68, 0, 0, 1, 1
        01 01
   3872 00                  609 .db e_object_none
   3873 00                  610 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3874 00 01               611 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3876 00 00               612 .db 0, 0
   3878 00 00               613 .db e_ai_st_noAI, e_ai_st_noAI
   387A 00 00 1D 34         614 .dw 0x0000, _invisible_sp
                            615 
   387E 08 10 21 68 00 00   616 .db e_type_collision, e_object_invisible, 0x21, 0x68, 0, 0, 1, 1
        01 01
   3886 00                  617 .db e_object_none
   3887 00                  618 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3888 00 01               619 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   388A 00 00               620 .db 0, 0
   388C 00 00               621 .db e_ai_st_noAI, e_ai_st_noAI
   388E 00 00 1D 34         622 .dw 0x0000, _invisible_sp
                            623 
   3892 08 10 22 7C 00 00   624 .db e_type_collision, e_object_invisible, 0x22, 0x7C, 0, 0, 1, 1
        01 01
   389A 00                  625 .db e_object_none
   389B 00                  626 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   389C 00 01               627 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   389E 00 00               628 .db 0, 0
   38A0 00 00               629 .db e_ai_st_noAI, e_ai_st_noAI
   38A2 00 00 1D 34         630 .dw 0x0000, _invisible_sp
                            631 
                            632 ;;------------------------------------------------------------------------------------------------------
                            633 ;; Hammer
   38A6 0C 20 15 68 00 00   634 .db e_type_render|e_type_collision, e_object_hammer, 0x15, 0x68 , 0, 0, 2, 12
        02 0C
   38AE 00                  635 .db e_object_none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 80.
Hexadecimal [16-Bits]



   38AF 00                  636 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   38B0 00 01               637 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   38B2 00 00               638 .db 0, 0
   38B4 00 00               639 .db e_ai_st_noAI, e_ai_st_noAI
   38B6 00 00 45 0C         640 .dw 0x0000, _hammer_sp
                            641 
                            642 ;;------------------------------------------------------------------------------------------------------
                            643 ;; Hammer (throw)
   38BA 0A 20 02 02 00 00   644 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   38C2 00                  645 .db e_object_none
   38C3 00                  646 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   38C4 00 01               647 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   38C6 00 00               648 .db 0, 0
   38C8 00 00               649 .db e_ai_st_noAI, e_ai_st_noAI
   38CA 00 00 05 0C         650 .dw 0x0000, _hammer_lado_sp_0
                            651 
                            652 
                            653 ;;------------------------------------------------------------------------------------------------------
                            654 ;;------------------------------------------------------------------------------------------------------
                            655 ;; Entities level 8
   38CE                     656 entities_level8::
                            657 
                            658 ;;------------------------------------------------------------------------------------------------------
                            659 ;; Hero
   38CE 0F 01 01 A4 00 00   660 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x01, 0xA4, 0, 0, 6, 16
        06 10
   38D6 7E                  661 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   38D7 00                  662 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   38D8 00 01               663 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   38DA 00 00               664 .db 0, 0
   38DC 00 00               665 .db e_ai_st_noAI, e_ai_st_noAI
                            666 ;; Dirección de memoria del patrol
   38DE 00 00 8D 0D         667 .dw 0x0000, _viking_sp_0
                            668 
                            669 ;;------------------------------------------------------------------------------------------------------
                            670 ;; Enemies	 
   38E2 1E 02 28 A4 00 00   671 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0xA4, 0, 0, 6, 16
        06 10
   38EA 20                  672 .db e_object_hammer	;; Objetos con los que puede colisionar
   38EB 00                  673 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   38EC 00 01               674 .db e_invisible_nothing, 0x01	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   38EE 00 00               675 .db 0, 0
   38F0 01 01               676 .db e_ai_st_stand_by, e_ai_st_stand_by
   38F2 CD 57 6D 0C         677 .dw _patrol_l8_01, _enemy_sp_0
                            678 
   38F6 1E 02 10 68 00 00   679 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x10, 0x68, 0, 0, 6, 16 
        06 10
   38FE 20                  680 .db e_object_hammer	;; Objetos con los que puede colisionar
   38FF 00                  681 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3900 00 FF               682 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3902 00 00               683 .db 0, 0
   3904 01 01               684 .db e_ai_st_stand_by, e_ai_st_stand_by
   3906 D4 57 6D 0C         685 .dw _patrol_l8_02, _enemy_sp_0
                            686 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 81.
Hexadecimal [16-Bits]



                            687 ;;------------------------------------------------------------------------------------------------------
                            688 ;; Invisible entities
   390A 08 10 35 A4 00 00   689 .db e_type_collision, e_object_invisible, 0x35, 0xA4, 0, 0, 1, 1
        01 01
   3912 00                  690 .db e_object_none
   3913 00                  691 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3914 00 01               692 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3916 00 00               693 .db 0, 0
   3918 00 00               694 .db e_ai_st_noAI, e_ai_st_noAI
   391A 00 00 1D 34         695 .dw 0x0000, _invisible_sp
                            696 
   391E 08 10 42 68 00 00   697 .db e_type_collision, e_object_invisible, 0x42, 0x68, 0, 0, 1, 1
        01 01
   3926 00                  698 .db e_object_none
   3927 00                  699 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3928 00 01               700 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   392A 00 00               701 .db 0, 0
   392C 00 00               702 .db e_ai_st_noAI, e_ai_st_noAI
   392E 00 00 1D 34         703 .dw 0x0000, _invisible_sp
                            704 
   3932 08 10 11 2C 00 00   705 .db e_type_collision, e_object_invisible, 0x11, 0x2C, 0, 0, 1, 1
        01 01
   393A 00                  706 .db e_object_none
   393B 00                  707 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   393C 00 01               708 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   393E 00 00               709 .db 0, 0
   3940 00 00               710 .db e_ai_st_noAI, e_ai_st_noAI	
   3942 00 00 1D 34         711 .dw 0x0000, _invisible_sp
                            712 
                            713 ;;------------------------------------------------------------------------------------------------------
                            714 ;; Key
   3946 0C 40 3C 6B 00 00   715 .db e_type_render|e_type_collision, e_object_key, 0x3C, 0x6B, 0, 0, 2, 8
        02 08
   394E 00                  716 .db e_object_none
   394F 00                  717 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3950 00 01               718 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3952 00 00               719 .db 0, 0
   3954 00 00               720 .db e_ai_st_noAI, e_ai_st_noAI
   3956 00 00 5D 0C         721 .dw 0x0000, _key_sp
                            722 
                            723 ;;------------------------------------------------------------------------------------------------------
                            724 ;; Door
   395A 08 08 45 2C 00 00   725 .db e_type_collision, e_object_door, 0x45, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3962 00                  726 .db e_object_none
   3963 00                  727 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3964 00 01               728 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3966 00 00               729 .db 0, 0
   3968 00 00               730 .db e_ai_st_noAI, e_ai_st_noAI
   396A 00 00 1D 34         731 .dw 0x0000, _invisible_sp
                            732 
                            733 ;;------------------------------------------------------------------------------------------------------
                            734 ;; Hammer
   396E 0C 20 26 2F 00 00   735 .db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x2F , 0, 0, 2, 12
        02 0C
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 82.
Hexadecimal [16-Bits]



   3976 00                  736 .db e_object_none
   3977 00                  737 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3978 00 01               738 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   397A 00 00               739 .db 0, 0
   397C 00 00               740 .db e_ai_st_noAI, e_ai_st_noAI
   397E 00 00 45 0C         741 .dw 0x0000, _hammer_sp
                            742 
                            743 ;;------------------------------------------------------------------------------------------------------
                            744 ;; Hammer (throw)
   3982 0A 20 02 02 00 00   745 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   398A 00                  746 .db e_object_none
   398B 00                  747 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   398C 00 01               748 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   398E 00 00               749 .db 0, 0
   3990 00 00               750 .db e_ai_st_noAI, e_ai_st_noAI
   3992 00 00 05 0C         751 .dw 0x0000, _hammer_lado_sp_0
                            752 
                            753 ;;------------------------------------------------------------------------------------------------------
                            754 ;; Ladders
   3996 08 04 0C A4 00 00   755 .db e_type_collision, e_object_ladder, 0x0C, 0xA4 , 0, 0, 6, 60
        06 3C
   399E 00                  756 .db e_object_none
   399F 00                  757 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   39A0 00 01               758 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   39A2 00 00               759 .db 0, 0
   39A4 00 00               760 .db e_ai_st_noAI, e_ai_st_noAI
   39A6 00 00 1D 34         761 .dw 0x0000, _invisible_sp
                            762 
   39AA 08 04 1C 68 00 00   763 .db e_type_collision, e_object_ladder, 0x1C, 0x68 , 0, 0, 6, 60
        06 3C
   39B2 00                  764 .db e_object_none
   39B3 00                  765 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   39B4 00 01               766 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   39B6 00 00               767 .db 0, 0
   39B8 00 00               768 .db e_ai_st_noAI, e_ai_st_noAI
   39BA 00 00 1D 34         769 .dw 0x0000, _invisible_sp
                            770 
                            771 ;;------------------------------------------------------------------------------------------------------
                            772 ;;------------------------------------------------------------------------------------------------------
                            773 ;; Entities level 9
   39BE                     774 entities_level9::
                            775 
                            776 ;;------------------------------------------------------------------------------------------------------
                            777 ;; Hero
   39BE 0F 01 39 2C 00 00   778 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x39, 0x2C, 0, 0, 6, 16
        06 10
   39C6 7E                  779 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   39C7 00                  780 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   39C8 00 01               781 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   39CA 00 00               782 .db 0, 0
   39CC 00 00               783 .db e_ai_st_noAI, e_ai_st_noAI
                            784 ;; Dirección de memoria del patrol
   39CE 00 00 8D 0D         785 .dw 0x0000, _viking_sp_0
                            786 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 83.
Hexadecimal [16-Bits]



                            787 ;;------------------------------------------------------------------------------------------------------
                            788 ;; Enemies	 
   39D2 1E 02 04 A4 00 00   789 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x04, 0xA4, 0, 0, 6, 16
        06 10
   39DA 20                  790 .db e_object_hammer	;; Objetos con los que puede colisionar
   39DB 00                  791 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   39DC 00 01               792 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   39DE 00 00               793 .db 0, 0
   39E0 01 01               794 .db e_ai_st_stand_by, e_ai_st_stand_by
   39E2 DB 57 6D 0C         795 .dw _patrol_l9_01, _enemy_sp_0
                            796 
   39E6 1E 02 34 68 00 00   797 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x34, 0x68, 0, 0, 6, 16 
        06 10
   39EE 20                  798 .db e_object_hammer	;; Objetos con los que puede colisionar
   39EF 00                  799 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   39F0 00 FF               800 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   39F2 00 00               801 .db 0, 0
   39F4 01 01               802 .db e_ai_st_stand_by, e_ai_st_stand_by
   39F6 E2 57 6D 0C         803 .dw _patrol_l9_02, _enemy_sp_0
                            804 
                            805 ;;------------------------------------------------------------------------------------------------------
                            806 ;; Invisible entities
   39FA 08 10 25 A4 00 00   807 .db e_type_collision, e_object_invisible, 0x25, 0xA4, 0, 0, 1, 1
        01 01
   3A02 00                  808 .db e_object_none
   3A03 00                  809 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A04 00 01               810 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A06 00 00               811 .db 0, 0
   3A08 00 00               812 .db e_ai_st_noAI, e_ai_st_noAI
   3A0A 00 00 1D 34         813 .dw 0x0000, _invisible_sp
                            814 
   3A0E 08 10 47 68 00 00   815 .db e_type_collision, e_object_invisible, 0x47, 0x68, 0, 0, 1, 1
        01 01
   3A16 00                  816 .db e_object_none
   3A17 00                  817 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A18 00 01               818 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A1A 00 00               819 .db 0, 0
   3A1C 00 00               820 .db e_ai_st_noAI, e_ai_st_noAI
   3A1E 00 00 1D 34         821 .dw 0x0000, _invisible_sp
                            822 
   3A22 08 10 18 2C 00 00   823 .db e_type_collision, e_object_invisible, 0x18, 0x2C, 0, 0, 1, 1
        01 01
   3A2A 00                  824 .db e_object_none
   3A2B 00                  825 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A2C 00 01               826 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A2E 00 00               827 .db 0, 0
   3A30 00 00               828 .db e_ai_st_noAI, e_ai_st_noAI	
   3A32 00 00 1D 34         829 .dw 0x0000, _invisible_sp
                            830 
                            831 ;;------------------------------------------------------------------------------------------------------
                            832 ;; Key
   3A36 0C 40 03 A4 00 00   833 .db e_type_render|e_type_collision, e_object_key, 0x03, 0xA4, 0, 0, 2, 8
        02 08
   3A3E 00                  834 .db e_object_none
   3A3F 00                  835 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 84.
Hexadecimal [16-Bits]



   3A40 00 01               836 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A42 00 00               837 .db 0, 0
   3A44 00 00               838 .db e_ai_st_noAI, e_ai_st_noAI
   3A46 00 00 5D 0C         839 .dw 0x0000, _key_sp
                            840 
                            841 ;;------------------------------------------------------------------------------------------------------
                            842 ;; Door
   3A4A 08 08 07 68 00 00   843 .db e_type_collision, e_object_door, 0x07, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3A52 00                  844 .db e_object_none
   3A53 00                  845 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A54 00 01               846 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A56 00 00               847 .db 0, 0
   3A58 00 00               848 .db e_ai_st_noAI, e_ai_st_noAI
   3A5A 00 00 1D 34         849 .dw 0x0000, _invisible_sp
                            850 
                            851 ;;------------------------------------------------------------------------------------------------------
                            852 ;; Hammer
   3A5E 0C 20 26 2F 00 00   853 .db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x2F , 0, 0, 2, 12
        02 0C
   3A66 00                  854 .db e_object_none
   3A67 00                  855 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A68 00 01               856 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A6A 00 00               857 .db 0, 0
   3A6C 00 00               858 .db e_ai_st_noAI, e_ai_st_noAI
   3A6E 00 00 45 0C         859 .dw 0x0000, _hammer_sp
                            860 
                            861 ;;------------------------------------------------------------------------------------------------------
                            862 ;; Hammer (throw)
   3A72 0A 20 02 02 00 00   863 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   3A7A 00                  864 .db e_object_none
   3A7B 00                  865 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A7C 00 01               866 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A7E 00 00               867 .db 0, 0
   3A80 00 00               868 .db e_ai_st_noAI, e_ai_st_noAI
   3A82 00 00 05 0C         869 .dw 0x0000, _hammer_lado_sp_0
                            870 
                            871 ;;------------------------------------------------------------------------------------------------------
                            872 ;; Ladders
   3A86 08 04 1E A4 00 00   873 .db e_type_collision, e_object_ladder, 0x1E, 0xA4 , 0, 0, 6, 60
        06 3C
   3A8E 00                  874 .db e_object_none
   3A8F 00                  875 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3A90 00 01               876 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3A92 00 00               877 .db 0, 0
   3A94 00 00               878 .db e_ai_st_noAI, e_ai_st_noAI
   3A96 00 00 1D 34         879 .dw 0x0000, _invisible_sp
                            880 
   3A9A 08 04 40 68 00 00   881 .db e_type_collision, e_object_ladder, 0x40, 0x68 , 0, 0, 6, 60
        06 3C
   3AA2 00                  882 .db e_object_none
   3AA3 00                  883 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3AA4 00 01               884 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3AA6 00 00               885 .db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 85.
Hexadecimal [16-Bits]



   3AA8 00 00               886 .db e_ai_st_noAI, e_ai_st_noAI
   3AAA 00 00 1D 34         887 .dw 0x0000, _invisible_sp
                            888 
                            889 ;;------------------------------------------------------------------------------------------------------
                            890 ;;------------------------------------------------------------------------------------------------------
                            891 ;; Entities level 10
   3AAE                     892 entities_level10::
                            893 
                            894 ;;------------------------------------------------------------------------------------------------------
                            895 ;; Hero
   3AAE 0F 01 03 A4 00 00   896 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
        06 10
   3AB6 7E                  897 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3AB7 00                  898 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3AB8 00 01               899 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3ABA 00 00               900 .db 0, 0
   3ABC 00 00               901 .db e_ai_st_noAI, e_ai_st_noAI
                            902 ;; Dirección de memoria del patrol
   3ABE 00 00 8D 0D         903 .dw 0x0000, _viking_sp_0
                            904 
                            905 ;;------------------------------------------------------------------------------------------------------
                            906 ;; Enemies	 
   3AC2 1E 02 20 2C 00 00   907 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0x2C, 0, 0, 6, 16 
        06 10
   3ACA 20                  908 .db e_object_hammer	;; Objetos con los que puede colisionar
   3ACB 00                  909 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3ACC 00 01               910 .db e_invisible_nothing, 0x01	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3ACE 00 00               911 .db 0, 0
   3AD0 01 01               912 .db e_ai_st_stand_by, e_ai_st_stand_by
   3AD2 F7 57 6D 0C         913 .dw _patrol_l10_03, _enemy_sp_0
                            914 
   3AD6 1E 02 41 A4 00 00   915 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x41, 0xA4, 0, 0, 6, 16
        06 10
   3ADE 20                  916 .db e_object_hammer	;; Objetos con los que puede colisionar
   3ADF 00                  917 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3AE0 00 01               918 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3AE2 00 00               919 .db 0, 0
   3AE4 01 01               920 .db e_ai_st_stand_by, e_ai_st_stand_by
   3AE6 E9 57 6D 0C         921 .dw _patrol_l10_01, _enemy_sp_0
                            922 
   3AEA 1E 02 30 68 00 00   923 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x30, 0x68, 0, 0, 6, 16 
        06 10
   3AF2 20                  924 .db e_object_hammer	;; Objetos con los que puede colisionar
   3AF3 00                  925 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3AF4 00 FF               926 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3AF6 00 00               927 .db 0, 0
   3AF8 01 01               928 .db e_ai_st_stand_by, e_ai_st_stand_by
   3AFA F0 57 6D 0C         929 .dw _patrol_l10_02, _enemy_sp_0
                            930 
                            931 ;;------------------------------------------------------------------------------------------------------
                            932 ;; Invisible entities
   3AFE 08 10 12 68 00 00   933 .db e_type_collision, e_object_invisible, 0x12, 0x68, 0, 0, 1, 1
        01 01
   3B06 00                  934 .db e_object_none
   3B07 00                  935 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 86.
Hexadecimal [16-Bits]



   3B08 00 01               936 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B0A 00 00               937 .db 0, 0
   3B0C 00 00               938 .db e_ai_st_noAI, e_ai_st_noAI	
   3B0E 00 00 1D 34         939 .dw 0x0000, _invisible_sp
                            940 
   3B12 08 10 3D 68 00 00   941 .db e_type_collision, e_object_invisible, 0x3D, 0x68, 0, 0, 1, 1
        01 01
   3B1A 00                  942 .db e_object_none
   3B1B 00                  943 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B1C 00 01               944 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B1E 00 00               945 .db 0, 0
   3B20 00 00               946 .db e_ai_st_noAI, e_ai_st_noAI
   3B22 00 00 1D 34         947 .dw 0x0000, _invisible_sp
                            948 
   3B26 08 10 06 2C 00 00   949 .db e_type_collision, e_object_invisible, 0x06, 0x2C, 0, 0, 1, 1
        01 01
   3B2E 00                  950 .db e_object_none
   3B2F 00                  951 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B30 00 01               952 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B32 00 00               953 .db 0, 0
   3B34 00 00               954 .db e_ai_st_noAI, e_ai_st_noAI
   3B36 00 00 1D 34         955 .dw 0x0000, _invisible_sp
                            956 
   3B3A 08 10 47 2C 00 00   957 .db e_type_collision, e_object_invisible, 0x47, 0x2C, 0, 0, 1, 1
        01 01
   3B42 00                  958 .db e_object_none
   3B43 00                  959 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B44 00 01               960 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B46 00 00               961 .db 0, 0
   3B48 00 00               962 .db e_ai_st_noAI, e_ai_st_noAI	
   3B4A 00 00 1D 34         963 .dw 0x0000, _invisible_sp
                            964 
   3B4E 08 10 25 A4 00 00   965 .db e_type_collision, e_object_invisible, 0x25, 0xA4, 0, 0, 1, 1
        01 01
   3B56 00                  966 .db e_object_none
   3B57 00                  967 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B58 00 01               968 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B5A 00 00               969 .db 0, 0
   3B5C 00 00               970 .db e_ai_st_noAI, e_ai_st_noAI
   3B5E 00 00 1D 34         971 .dw 0x0000, _invisible_sp
                            972 
   3B62 08 10 2A A4 00 00   973 .db e_type_collision, e_object_invisible, 0x2A, 0xA4, 0, 0, 1, 1
        01 01
   3B6A 00                  974 .db e_object_none
   3B6B 00                  975 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B6C 00 01               976 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B6E 00 00               977 .db 0, 0
   3B70 00 00               978 .db e_ai_st_noAI, e_ai_st_noAI
   3B72 00 00 1D 34         979 .dw 0x0000, _invisible_sp
                            980 
                            981 ;;------------------------------------------------------------------------------------------------------
                            982 ;; Key
   3B76 0C 40 3A 2C 00 00   983 .db e_type_render|e_type_collision, e_object_key, 0x3A, 0x2C, 0, 0, 2, 8
        02 08
   3B7E 00                  984 .db e_object_none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 87.
Hexadecimal [16-Bits]



   3B7F 00                  985 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B80 00 01               986 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B82 00 00               987 .db 0, 0
   3B84 00 00               988 .db e_ai_st_noAI, e_ai_st_noAI
   3B86 00 00 5D 0C         989 .dw 0x0000, _key_sp
                            990 
                            991 ;;------------------------------------------------------------------------------------------------------
                            992 ;; Door
   3B8A 08 08 45 A4 00 00   993 .db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3B92 00                  994 .db e_object_none
   3B93 00                  995 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3B94 00 01               996 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3B96 00 00               997 .db 0, 0
   3B98 00 00               998 .db e_ai_st_noAI, e_ai_st_noAI
   3B9A 00 00 1D 34         999 .dw 0x0000, _invisible_sp
                           1000 
                           1001 ;;------------------------------------------------------------------------------------------------------
                           1002 ;; Hammer
   3B9E 0C 20 0E A4 00 00  1003 .db e_type_render|e_type_collision, e_object_hammer,0x0E, 0xA4 , 0, 0, 2, 12
        02 0C
   3BA6 00                 1004 .db e_object_none
   3BA7 00                 1005 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3BA8 00 01              1006 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3BAA 00 00              1007 .db 0, 0
   3BAC 00 00              1008 .db e_ai_st_noAI, e_ai_st_noAI
   3BAE 00 00 45 0C        1009 .dw 0x0000, _hammer_sp
                           1010 
                           1011 ;;------------------------------------------------------------------------------------------------------
                           1012 ;; Hammer (throw)
   3BB2 0A 20 02 02 00 00  1013 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   3BBA 00                 1014 .db e_object_none
   3BBB 00                 1015 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3BBC 00 01              1016 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3BBE 00 00              1017 .db 0, 0
   3BC0 00 00              1018 .db e_ai_st_noAI, e_ai_st_noAI
   3BC2 00 00 05 0C        1019 .dw 0x0000, _hammer_lado_sp_0
                           1020 
                           1021 ;;------------------------------------------------------------------------------------------------------
                           1022 ;; Ladders
   3BC6 08 04 14 A4 00 00  1023 .db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
        06 3C
   3BCE 00                 1024 .db e_object_none
   3BCF 00                 1025 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3BD0 00 01              1026 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3BD2 00 00              1027 .db 0, 0
   3BD4 00 00              1028 .db e_ai_st_noAI, e_ai_st_noAI
   3BD6 00 00 1D 34        1029 .dw 0x0000, _invisible_sp
                           1030 
   3BDA 08 04 36 A4 00 00  1031 .db e_type_collision, e_object_ladder, 0x36, 0xA4, 0, 0, 6, 60
        06 3C
   3BE2 00                 1032 .db e_object_none
   3BE3 00                 1033 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3BE4 00 01              1034 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 88.
Hexadecimal [16-Bits]



   3BE6 00 00              1035 .db 0, 0
   3BE8 00 00              1036 .db e_ai_st_noAI, e_ai_st_noAI
   3BEA 00 00 1D 34        1037 .dw 0x0000, _invisible_sp
                           1038 
   3BEE 08 04 24 68 00 00  1039 .db e_type_collision, e_object_ladder, 0x24, 0x68, 0, 0, 6, 60
        06 3C
   3BF6 00                 1040 .db e_object_none
   3BF7 00                 1041 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3BF8 00 01              1042 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3BFA 00 00              1043 .db 0, 0
   3BFC 00 00              1044 .db e_ai_st_noAI, e_ai_st_noAI
   3BFE 00 00 1D 34        1045 .dw 0x0000, _invisible_sp
                           1046 
                           1047 ;;------------------------------------------------------------------------------------------------------
                           1048 ;;------------------------------------------------------------------------------------------------------
                           1049 ;; Entities level 11
   3C02                    1050 entities_level11::
                           1051 ;;------------------------------------------------------------------------------------------------------
                           1052 ;; Hero
   3C02 0F 01 45 A4 00 00  1053 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x45, 0xA4, 0, 0, 6, 16
        06 10
   3C0A 7E                 1054 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3C0B 00                 1055 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C0C 00 01              1056 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C0E 00 00              1057 .db 0, 0
   3C10 00 00              1058 .db e_ai_st_noAI, e_ai_st_noAI
   3C12 00 00 ED 0D        1059 .dw 0x0000, _viking_sp_1
                           1060 
                           1061 ;;------------------------------------------------------------------------------------------------------
                           1062 ;; Enemies	 
   3C16 1E 02 27 A4 01 00  1063 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x27, 0xA4, 1, 0, 6, 16
        06 10
   3C1E 30                 1064 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3C1F 00                 1065 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3C20 00 01              1066 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C22 00 00              1067 .db 0, 0
   3C24 01 01              1068 .db e_ai_st_stand_by, e_ai_st_stand_by
   3C26 FE 57 6D 0C        1069 .dw _patrol_l11_01, _enemy_sp_0
                           1070 
   3C2A 1E 02 20 A4 01 00  1071 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x20, 0xA4, 1, 0, 6, 16
        06 10
   3C32 30                 1072 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3C33 00                 1073 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3C34 00 FF              1074 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C36 00 00              1075 .db 0, 0
   3C38 01 01              1076 .db e_ai_st_stand_by, e_ai_st_stand_by
   3C3A 05 58 6D 0C        1077 .dw _patrol_l11_02, _enemy_sp_0
                           1078 
                           1079 ;;------------------------------------------------------------------------------------------------------
                           1080 ;; Door
   3C3E 08 08 06 68 00 00  1081 .db e_type_collision, e_object_door, 0x06, 0x68, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3C46 00                 1082 .db e_object_none
   3C47 00                 1083 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C48 00 01              1084 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 89.
Hexadecimal [16-Bits]



   3C4A 00 00              1085 .db 0, 0
   3C4C 00 00              1086 .db e_ai_st_noAI, e_ai_st_noAI
   3C4E 00 00 1D 34        1087 .dw 0x0000, _invisible_sp
                           1088 
                           1089 ;;------------------------------------------------------------------------------------------------------
                           1090 ;; Key
   3C52 0C 40 08 A4 00 00  1091 .db e_type_render|e_type_collision, e_object_key, 0x08, 0xA4, 0, 0, 2, 8
        02 08
   3C5A 00                 1092 .db e_object_none
   3C5B 00                 1093 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C5C 00 01              1094 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C5E 00 00              1095 .db 0, 0
   3C60 00 00              1096 .db e_ai_st_noAI, e_ai_st_noAI
   3C62 00 00 5D 0C        1097 .dw 0x0000, _key_sp
                           1098 
                           1099 ;;------------------------------------------------------------------------------------------------------
                           1100 ;; Ladders
   3C66 08 04 14 A4 00 00  1101 .db e_type_collision, e_object_ladder, 0x14, 0xA4 , 0, 0, 6, 60
        06 3C
   3C6E 00                 1102 .db e_object_none
   3C6F 00                 1103 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C70 00 01              1104 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C72 00 00              1105 .db 0, 0
   3C74 00 00              1106 .db e_ai_st_noAI, e_ai_st_noAI
   3C76 00 00 1D 34        1107 .dw 0x0000, _invisible_sp
                           1108 
   3C7A 08 04 3A A4 00 00  1109 .db e_type_collision, e_object_ladder, 0x3A, 0xA4 , 0, 0, 6, 60
        06 3C
   3C82 00                 1110 .db e_object_none
   3C83 00                 1111 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C84 00 01              1112 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C86 00 00              1113 .db 0, 0
   3C88 00 00              1114 .db e_ai_st_noAI, e_ai_st_noAI
   3C8A 00 00 1D 34        1115 .dw 0x0000, _invisible_sp
                           1116 
                           1117 
                           1118 ;;------------------------------------------------------------------------------------------------------
                           1119 ;;Invisible entities
   3C8E 08 10 38 68 00 00  1120 .db e_type_collision, e_object_invisible, 0x38, 0x68, 0, 0, 1, 1
        01 01
   3C96 00                 1121 .db e_object_none
   3C97 00                 1122 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3C98 00 01              1123 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3C9A 00 00              1124 .db 0, 0
   3C9C 00 00              1125 .db e_ai_st_noAI, e_ai_st_noAI
   3C9E 00 00 1D 34        1126 .dw 0x0000, _invisible_sp
                           1127 
   3CA2 08 10 1B 68 00 00  1128 .db e_type_collision, e_object_invisible, 0x1B, 0x68, 0, 0, 1, 1
        01 01
   3CAA 00                 1129 .db e_object_none
   3CAB 00                 1130 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3CAC 00 01              1131 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3CAE 00 00              1132 .db 0, 0
   3CB0 00 00              1133 .db e_ai_st_noAI, e_ai_st_noAI
   3CB2 00 00 1D 34        1134 .dw 0x0000, _invisible_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 90.
Hexadecimal [16-Bits]



                           1135 
                           1136 ;;------------------------------------------------------------------------------------------------------
                           1137 ;; Hammer
   3CB6 0C 20 45 68 00 00  1138 .db e_type_render|e_type_collision, e_object_hammer, 0x45, 0x68 , 0, 0, 2, 12
        02 0C
   3CBE 00                 1139 .db e_object_none
   3CBF 00                 1140 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3CC0 00 01              1141 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3CC2 00 00              1142 .db 0, 0
   3CC4 00 00              1143 .db e_ai_st_noAI, e_ai_st_noAI
   3CC6 00 00 45 0C        1144 .dw 0x0000, _hammer_sp
                           1145 
                           1146 ;;------------------------------------------------------------------------------------------------------
                           1147 ;; Hammer (throw)
   3CCA 0A 20 02 02 00 00  1148 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   3CD2 00                 1149 .db e_object_none
   3CD3 00                 1150 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3CD4 00 01              1151 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3CD6 00 00              1152 .db 0, 0
   3CD8 00 00              1153 .db e_ai_st_noAI, e_ai_st_noAI
   3CDA 00 00 05 0C        1154 .dw 0x0000, _hammer_lado_sp_0
                           1155 
                           1156 ;;------------------------------------------------------------------------------------------------------
                           1157 ;;------------------------------------------------------------------------------------------------------
                           1158 ;; Entities level 12
   3CDE                    1159 entities_level12::
                           1160 ;;------------------------------------------------------------------------------------------------------
                           1161 ;; Hero
   3CDE 0F 01 03 A4 00 00  1162 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
        06 10
   3CE6 7E                 1163 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3CE7 00                 1164 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3CE8 00 01              1165 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3CEA 00 00              1166 .db 0, 0
   3CEC 00 00              1167 .db e_ai_st_noAI, e_ai_st_noAI
   3CEE 00 00 8D 0D        1168 .dw 0x0000, _viking_sp_0
                           1169 
                           1170 ;;------------------------------------------------------------------------------------------------------
                           1171 ;; Enemies	 
   3CF2 1E 02 2D 68 00 00  1172 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2D, 0x68, 0, 0, 6, 16
        06 10
   3CFA 30                 1173 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3CFB 00                 1174 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3CFC 00 FF              1175 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3CFE 00 00              1176 .db 0, 0
   3D00 01 01              1177 .db e_ai_st_stand_by, e_ai_st_stand_by
   3D02 25 58 6D 0C        1178 .dw _patrol_l12_02, _enemy_sp_0
                           1179 
   3D06 1E 02 28 A4 00 00  1180 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0xA4, 0, 0, 6, 16
        06 10
   3D0E 30                 1181 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3D0F 00                 1182 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3D10 00 01              1183 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D12 00 00              1184 .db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 91.
Hexadecimal [16-Bits]



   3D14 01 01              1185 .db e_ai_st_stand_by, e_ai_st_stand_by
   3D16 14 58 6D 0C        1186 .dw _patrol_l12_01, _enemy_sp_0
                           1187 
                           1188 ;;------------------------------------------------------------------------------------------------------
                           1189 ;; Door
   3D1A 08 08 45 A4 00 00  1190 .db e_type_collision, e_object_door, 0x45, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3D22 00                 1191 .db e_object_none
   3D23 00                 1192 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D24 00 01              1193 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D26 00 00              1194 .db 0, 0
   3D28 00 00              1195 .db e_ai_st_noAI, e_ai_st_noAI
   3D2A 00 00 1D 34        1196 .dw 0x0000, _invisible_sp
                           1197 
                           1198 ;;------------------------------------------------------------------------------------------------------
                           1199 ;; Key
   3D2E 0C 40 45 2C 00 00  1200 .db e_type_render|e_type_collision, e_object_key, 0x45, 0x2C, 0, 0, 2, 8
        02 08
   3D36 00                 1201 .db e_object_none
   3D37 00                 1202 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D38 00 01              1203 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D3A 00 00              1204 .db 0, 0
   3D3C 00 00              1205 .db e_ai_st_noAI, e_ai_st_noAI
   3D3E 00 00 5D 0C        1206 .dw 0x0000, _key_sp
                           1207 
                           1208 ;;------------------------------------------------------------------------------------------------------
                           1209 ;; Ladders
   3D42 08 04 1A A4 00 00  1210 .db e_type_collision, e_object_ladder, 0x1A, 0xA4 , 0, 0, 6, 60
        06 3C
   3D4A 00                 1211 .db e_object_none
   3D4B 00                 1212 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D4C 00 01              1213 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D4E 00 00              1214 .db 0, 0
   3D50 00 00              1215 .db e_ai_st_noAI, e_ai_st_noAI
   3D52 00 00 1D 34        1216 .dw 0x0000, _invisible_sp
                           1217 
   3D56 08 04 32 68 00 00  1218 .db e_type_collision, e_object_ladder, 0x32, 0x68 , 0, 0, 6, 60
        06 3C
   3D5E 00                 1219 .db e_object_none
   3D5F 00                 1220 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D60 00 01              1221 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D62 00 00              1222 .db 0, 0
   3D64 00 00              1223 .db e_ai_st_noAI, e_ai_st_noAI
   3D66 00 00 1D 34        1224 .dw 0x0000, _invisible_sp
                           1225 
                           1226 
                           1227 ;;------------------------------------------------------------------------------------------------------
                           1228 ;;Invisible entities
   3D6A 08 10 39 68 00 00  1229 .db e_type_collision, e_object_invisible, 0x39, 0x68, 0, 0, 1, 1
        01 01
   3D72 00                 1230 .db e_object_none
   3D73 00                 1231 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D74 00 01              1232 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D76 00 00              1233 .db 0, 0
   3D78 00 00              1234 .db e_ai_st_noAI, e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 92.
Hexadecimal [16-Bits]



   3D7A 00 00 1D 34        1235 .dw 0x0000, _invisible_sp
                           1236 
   3D7E 08 10 18 68 00 00  1237 .db e_type_collision, e_object_invisible, 0x18, 0x68, 0, 0, 1, 1
        01 01
   3D86 00                 1238 .db e_object_none
   3D87 00                 1239 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D88 00 01              1240 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D8A 00 00              1241 .db 0, 0
   3D8C 00 00              1242 .db e_ai_st_noAI, e_ai_st_noAI
   3D8E 00 00 1D 34        1243 .dw 0x0000, _invisible_sp
                           1244 
   3D92 08 10 30 2C 00 00  1245 .db e_type_collision, e_object_invisible, 0x30, 0x2C, 0, 0, 1, 1
        01 01
   3D9A 00                 1246 .db e_object_none
   3D9B 00                 1247 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3D9C 00 01              1248 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3D9E 00 00              1249 .db 0, 0
   3DA0 00 00              1250 .db e_ai_st_noAI, e_ai_st_noAI
   3DA2 00 00 1D 34        1251 .dw 0x0000, _invisible_sp
                           1252 
                           1253 ;;------------------------------------------------------------------------------------------------------
                           1254 ;; Hammer
   3DA6 0C 20 29 68 00 00  1255 .db e_type_render|e_type_collision, e_object_hammer, 0x29, 0x68 , 0, 0, 2, 12
        02 0C
   3DAE 00                 1256 .db e_object_none
   3DAF 00                 1257 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3DB0 00 01              1258 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3DB2 00 00              1259 .db 0, 0
   3DB4 00 00              1260 .db e_ai_st_noAI, e_ai_st_noAI
   3DB6 00 00 45 0C        1261 .dw 0x0000, _hammer_sp
                           1262 
                           1263 ;;------------------------------------------------------------------------------------------------------
                           1264 ;; Hammer (throw)
   3DBA 0A 20 02 02 00 00  1265 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   3DC2 00                 1266 .db e_object_none
   3DC3 00                 1267 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3DC4 00 01              1268 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3DC6 00 00              1269 .db 0, 0
   3DC8 00 00              1270 .db e_ai_st_noAI, e_ai_st_noAI
   3DCA 00 00 05 0C        1271 .dw 0x0000, _hammer_lado_sp_0
                           1272 
                           1273 
                           1274 ;;------------------------------------------------------------------------------------------------------
                           1275 ;;------------------------------------------------------------------------------------------------------
                           1276 ;; Entities level 13
   3DCE                    1277 entities_level13::
                           1278 ;;------------------------------------------------------------------------------------------------------
                           1279 ;; Hero
   3DCE 0F 01 03 A4 00 00  1280 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
        06 10
   3DD6 7E                 1281 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3DD7 00                 1282 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3DD8 00 01              1283 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3DDA 00 00              1284 .db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 93.
Hexadecimal [16-Bits]



   3DDC 00 00              1285 .db e_ai_st_noAI, e_ai_st_noAI
   3DDE 00 00 8D 0D        1286 .dw 0x0000, _viking_sp_0
                           1287 
                           1288 ;;------------------------------------------------------------------------------------------------------
                           1289 ;; Enemies	 
   3DE2 1E 02 2F 2C 00 00  1290 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2F, 0x2C, 0, 0, 6, 16
        06 10
   3DEA 30                 1291 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3DEB 00                 1292 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3DEC 00 01              1293 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3DEE 00 00              1294 .db 0, 0
   3DF0 01 01              1295 .db e_ai_st_stand_by, e_ai_st_stand_by
   3DF2 3B 58 CD 0C        1296 .dw _patrol_l13_01, _enemy_sp_1
                           1297  
   3DF6 1E 02 1D A4 00 00  1298 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1D, 0xA4, 0, 0, 6, 16
        06 10
   3DFE 30                 1299 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3DFF 00                 1300 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3E00 00 FF              1301 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E02 00 00              1302 .db 0, 0
   3E04 01 01              1303 .db e_ai_st_stand_by, e_ai_st_stand_by
   3E06 62 58 6D 0C        1304 .dw _patrol_l13_02, _enemy_sp_0
                           1305 
                           1306 ;;------------------------------------------------------------------------------------------------------
                           1307 ;; Door
   3E0A 08 08 26 A4 00 00  1308 .db e_type_collision, e_object_door, 0x26, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3E12 00                 1309 .db e_object_none
   3E13 00                 1310 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E14 00 01              1311 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E16 00 00              1312 .db 0, 0
   3E18 00 00              1313 .db e_ai_st_noAI, e_ai_st_noAI
   3E1A 00 00 1D 34        1314 .dw 0x0000, _invisible_sp
                           1315 
                           1316 ;;------------------------------------------------------------------------------------------------------
                           1317 ;; Key
   3E1E 0C 40 27 2C 00 00  1318 .db e_type_render|e_type_collision, e_object_key, 0x27, 0x2C, 0, 0, 2, 8
        02 08
   3E26 00                 1319 .db e_object_none
   3E27 00                 1320 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E28 00 01              1321 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E2A 00 00              1322 .db 0, 0
   3E2C 00 00              1323 .db e_ai_st_noAI, e_ai_st_noAI
   3E2E 00 00 5D 0C        1324 .dw 0x0000, _key_sp
                           1325 
                           1326 ;;------------------------------------------------------------------------------------------------------
                           1327 ;; Ladders
   3E32 08 04 10 A4 00 00  1328 .db e_type_collision, e_object_ladder, 0x10, 0xA4 , 0, 0, 6, 60
        06 3C
   3E3A 00                 1329 .db e_object_none
   3E3B 00                 1330 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E3C 00 01              1331 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E3E 00 00              1332 .db 0, 0
   3E40 00 00              1333 .db e_ai_st_noAI, e_ai_st_noAI
   3E42 00 00 1D 34        1334 .dw 0x0000, _invisible_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 94.
Hexadecimal [16-Bits]



                           1335 
   3E46 08 04 3A A4 00 00  1336 .db e_type_collision, e_object_ladder, 0x3A, 0xA4 , 0, 0, 6, 60
        06 3C
   3E4E 00                 1337 .db e_object_none
   3E4F 00                 1338 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E50 00 01              1339 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E52 00 00              1340 .db 0, 0
   3E54 00 00              1341 .db e_ai_st_noAI, e_ai_st_noAI
   3E56 00 00 1D 34        1342 .dw 0x0000, _invisible_sp
                           1343 
   3E5A 08 04 02 68 00 00  1344 .db e_type_collision, e_object_ladder, 0x02, 0x68 , 0, 0, 6, 60
        06 3C
   3E62 00                 1345 .db e_object_none
   3E63 00                 1346 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E64 00 01              1347 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E66 00 00              1348 .db 0, 0
   3E68 00 00              1349 .db e_ai_st_noAI, e_ai_st_noAI
   3E6A 00 00 1D 34        1350 .dw 0x0000, _invisible_sp
                           1351 
   3E6E 08 04 48 68 00 00  1352 .db e_type_collision, e_object_ladder, 0x48, 0x68 , 0, 0, 6, 60
        06 3C
   3E76 00                 1353 .db e_object_none
   3E77 00                 1354 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E78 00 01              1355 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E7A 00 00              1356 .db 0, 0
   3E7C 00 00              1357 .db e_ai_st_noAI, e_ai_st_noAI
   3E7E 00 00 1D 34        1358 .dw 0x0000, _invisible_sp
                           1359 
                           1360 ;;------------------------------------------------------------------------------------------------------
                           1361 ;;Invisible entities
   3E82 08 10 2E 68 00 00  1362 .db e_type_collision, e_object_invisible, 0x2E, 0x68, 0, 0, 1, 1
        01 01
   3E8A 00                 1363 .db e_object_none
   3E8B 00                 1364 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3E8C 00 01              1365 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3E8E 00 00              1366 .db 0, 0
   3E90 00 00              1367 .db e_ai_st_noAI, e_ai_st_noAI
   3E92 00 00 1D 34        1368 .dw 0x0000, _invisible_sp
                           1369 
   3E96 08 10 21 68 00 00  1370 .db e_type_collision, e_object_invisible, 0x21, 0x68, 0, 0, 1, 1
        01 01
   3E9E 00                 1371 .db e_object_none
   3E9F 00                 1372 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3EA0 00 01              1373 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3EA2 00 00              1374 .db 0, 0
   3EA4 00 00              1375 .db e_ai_st_noAI, e_ai_st_noAI
   3EA6 00 00 1D 34        1376 .dw 0x0000, _invisible_sp
                           1377 
                           1378 ;;------------------------------------------------------------------------------------------------------
                           1379 ;;------------------------------------------------------------------------------------------------------
                           1380 ;; Entities level 14
   3EAA                    1381 entities_level14::
                           1382 ;;------------------------------------------------------------------------------------------------------
                           1383 ;; Hero
   3EAA 0F 01 03 A4 00 00  1384 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x03, 0xA4, 0, 0, 6, 16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 95.
Hexadecimal [16-Bits]



        06 10
   3EB2 7E                 1385 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3EB3 00                 1386 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3EB4 00 01              1387 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3EB6 00 00              1388 .db 0, 0
   3EB8 00 00              1389 .db e_ai_st_noAI, e_ai_st_noAI
   3EBA 00 00 8D 0D        1390 .dw 0x0000, _viking_sp_0
                           1391 
                           1392 ;;------------------------------------------------------------------------------------------------------
                           1393 ;; Enemies	 
   3EBE 1E 02 15 68 00 00  1394 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0x68, 0, 0, 6, 16
        06 10
   3EC6 30                 1395 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3EC7 00                 1396 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3EC8 00 FF              1397 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3ECA 00 00              1398 .db 0, 0
   3ECC 01 01              1399 .db e_ai_st_stand_by, e_ai_st_stand_by
   3ECE B1 58 CD 0C        1400 .dw _patrol_l14_01, _enemy_sp_1
                           1401  
   3ED2 1E 02 28 40 00 00  1402 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0x40, 0, 0, 6, 16
        06 10
   3EDA 30                 1403 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   3EDB 00                 1404 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   3EDC 00 01              1405 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3EDE 00 00              1406 .db 0, 0
   3EE0 01 01              1407 .db e_ai_st_stand_by, e_ai_st_stand_by
   3EE2 82 58 CD 0C        1408 .dw _patrol_l14_02, _enemy_sp_1
                           1409 
                           1410 ;;------------------------------------------------------------------------------------------------------
                           1411 ;; Door
   3EE6 08 08 3D A4 00 00  1412 .db e_type_collision, e_object_door, 0x3D, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   3EEE 00                 1413 .db e_object_none
   3EEF 00                 1414 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3EF0 00 01              1415 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3EF2 00 00              1416 .db 0, 0
   3EF4 00 00              1417 .db e_ai_st_noAI, e_ai_st_noAI
   3EF6 00 00 1D 34        1418 .dw 0x0000, _invisible_sp
                           1419 
                           1420 ;;------------------------------------------------------------------------------------------------------
                           1421 ;; Key
   3EFA 0C 40 2D 68 00 00  1422 .db e_type_render|e_type_collision, e_object_key, 0x2D, 0x68, 0, 0, 2, 8
        02 08
   3F02 00                 1423 .db e_object_none
   3F03 00                 1424 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F04 00 01              1425 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F06 00 00              1426 .db 0, 0
   3F08 00 00              1427 .db e_ai_st_noAI, e_ai_st_noAI
   3F0A 00 00 5D 0C        1428 .dw 0x0000, _key_sp
                           1429 
                           1430 ;;------------------------------------------------------------------------------------------------------
                           1431 ;; Ladders
   3F0E 08 04 0C A4 00 00  1432 .db e_type_collision, e_object_ladder, 0x0C, 0xA4 , 0, 0, 6, 60
        06 3C
   3F16 00                 1433 .db e_object_none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 96.
Hexadecimal [16-Bits]



   3F17 00                 1434 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F18 00 01              1435 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F1A 00 00              1436 .db 0, 0
   3F1C 00 00              1437 .db e_ai_st_noAI, e_ai_st_noAI
   3F1E 00 00 1D 34        1438 .dw 0x0000, _invisible_sp
                           1439 
   3F22 08 04 48 A4 00 00  1440 .db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
        06 3C
   3F2A 00                 1441 .db e_object_none
   3F2B 00                 1442 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F2C 00 01              1443 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F2E 00 00              1444 .db 0, 0
   3F30 00 00              1445 .db e_ai_st_noAI, e_ai_st_noAI
   3F32 00 00 1D 34        1446 .dw 0x0000, _invisible_sp
                           1447 
   3F36 08 04 1E 68 00 00  1448 .db e_type_collision, e_object_ladder, 0x1E, 0x68 , 0, 0, 6, 40
        06 28
   3F3E 00                 1449 .db e_object_none
   3F3F 00                 1450 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F40 00 01              1451 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F42 00 00              1452 .db 0, 0
   3F44 00 00              1453 .db e_ai_st_noAI, e_ai_st_noAI
   3F46 00 00 1D 34        1454 .dw 0x0000, _invisible_sp
                           1455 
   3F4A 08 04 3A 68 00 00  1456 .db e_type_collision, e_object_ladder, 0x3A, 0x68 , 0, 0, 6, 40
        06 28
   3F52 00                 1457 .db e_object_none
   3F53 00                 1458 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F54 00 01              1459 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F56 00 00              1460 .db 0, 0
   3F58 00 00              1461 .db e_ai_st_noAI, e_ai_st_noAI
   3F5A 00 00 1D 34        1462 .dw 0x0000, _invisible_sp
                           1463 
                           1464 ;;------------------------------------------------------------------------------------------------------
                           1465 ;;Invisible entities
   3F5E 08 10 39 A4 00 00  1466 .db e_type_collision, e_object_invisible, 0x39, 0xA4, 0, 0, 1, 1
        01 01
   3F66 00                 1467 .db e_object_none
   3F67 00                 1468 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F68 00 01              1469 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F6A 00 00              1470 .db 0, 0
   3F6C 00 00              1471 .db e_ai_st_noAI, e_ai_st_noAI
   3F6E 00 00 1D 34        1472 .dw 0x0000, _invisible_sp
                           1473 
   3F72 08 10 0A 68 00 00  1474 .db e_type_collision, e_object_invisible, 0x0A, 0x68, 0, 0, 1, 1
        01 01
   3F7A 00                 1475 .db e_object_none
   3F7B 00                 1476 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F7C 00 01              1477 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F7E 00 00              1478 .db 0, 0
   3F80 00 00              1479 .db e_ai_st_noAI, e_ai_st_noAI
   3F82 00 00 1D 34        1480 .dw 0x0000, _invisible_sp
                           1481 
   3F86 08 10 13 A4 00 00  1482 .db e_type_collision, e_object_invisible, 0x13, 0xA4, 0, 0, 1, 1
        01 01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 97.
Hexadecimal [16-Bits]



   3F8E 00                 1483 .db e_object_none
   3F8F 00                 1484 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3F90 00 01              1485 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3F92 00 00              1486 .db 0, 0
   3F94 00 00              1487 .db e_ai_st_noAI, e_ai_st_noAI
   3F96 00 00 1D 34        1488 .dw 0x0000, _invisible_sp
                           1489 
   3F9A 08 10 1C 40 00 00  1490 .db e_type_collision, e_object_invisible, 0x1C, 0x40, 0, 0, 1, 1
        01 01
   3FA2 00                 1491 .db e_object_none
   3FA3 00                 1492 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3FA4 00 01              1493 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3FA6 00 00              1494 .db 0, 0
   3FA8 00 00              1495 .db e_ai_st_noAI, e_ai_st_noAI
   3FAA 00 00 1D 34        1496 .dw 0x0000, _invisible_sp
                           1497 
   3FAE 08 10 41 40 00 00  1498 .db e_type_collision, e_object_invisible, 0x41, 0x40, 0, 0, 1, 1
        01 01
   3FB6 00                 1499 .db e_object_none
   3FB7 00                 1500 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3FB8 00 01              1501 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3FBA 00 00              1502 .db 0, 0
   3FBC 00 00              1503 .db e_ai_st_noAI, e_ai_st_noAI
   3FBE 00 00 1D 34        1504 .dw 0x0000, _invisible_sp
                           1505 
                           1506 ;;------------------------------------------------------------------------------------------------------
                           1507 ;; Hammer
   3FC2 0C 20 0D 68 00 00  1508 .db e_type_render|e_type_collision, e_object_hammer, 0x0D, 0x68 , 0, 0, 2, 12
        02 0C
   3FCA 00                 1509 .db e_object_none
   3FCB 00                 1510 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3FCC 00 01              1511 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3FCE 00 00              1512 .db 0, 0
   3FD0 00 00              1513 .db e_ai_st_noAI, e_ai_st_noAI
   3FD2 00 00 45 0C        1514 .dw 0x0000, _hammer_sp
                           1515 
                           1516 ;;------------------------------------------------------------------------------------------------------
                           1517 ;; Hammer (throw)
   3FD6 0A 20 02 02 00 00  1518 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   3FDE 00                 1519 .db e_object_none
   3FDF 00                 1520 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3FE0 00 01              1521 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3FE2 00 00              1522 .db 0, 0
   3FE4 00 00              1523 .db e_ai_st_noAI, e_ai_st_noAI
   3FE6 00 00 05 0C        1524 .dw 0x0000, _hammer_lado_sp_0
                           1525 
                           1526 
                           1527 
                           1528 ;;------------------------------------------------------------------------------------------------------
                           1529 ;;------------------------------------------------------------------------------------------------------
                           1530 ;; Entities level 15
   3FEA                    1531 entities_level15::
                           1532 ;;------------------------------------------------------------------------------------------------------
                           1533 ;; Hero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 98.
Hexadecimal [16-Bits]



   3FEA 0F 01 04 18 00 00  1534 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x04, 0x18, 0, 0, 6, 16
        06 10
   3FF2 7E                 1535 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   3FF3 00                 1536 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   3FF4 00 01              1537 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   3FF6 00 00              1538 .db 0, 0
   3FF8 00 00              1539 .db e_ai_st_noAI, e_ai_st_noAI
   3FFA 00 00 8D 0D        1540 .dw 0x0000, _viking_sp_0
                           1541 
                           1542 ;;------------------------------------------------------------------------------------------------------
                           1543 ;; Enemies	 
   3FFE 1E 02 15 A4 00 00  1544 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0xA4, 0, 0, 6, 16
        06 10
   4006 30                 1545 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4007 00                 1546 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4008 00 FF              1547 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   400A 00 00              1548 .db 0, 0
   400C 01 01              1549 .db e_ai_st_stand_by, e_ai_st_stand_by
   400E F6 58 CD 0C        1550 .dw _patrol_l15_02, _enemy_sp_1
                           1551  
   4012 1E 02 28 40 00 00  1552 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x28, 0x40, 0, 0, 6, 16
        06 10
   401A 30                 1553 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   401B 00                 1554 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   401C 00 01              1555 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   401E 00 00              1556 .db 0, 0
   4020 01 01              1557 .db e_ai_st_stand_by, e_ai_st_stand_by
   4022 C9 58 CD 0C        1558 .dw _patrol_l15_01, _enemy_sp_1
                           1559 
                           1560 ;;------------------------------------------------------------------------------------------------------
                           1561 ;; Door
   4026 08 08 15 7C 00 00  1562 .db e_type_collision, e_object_door, 0x15, 0x7C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   402E 00                 1563 .db e_object_none
   402F 00                 1564 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4030 00 01              1565 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4032 00 00              1566 .db 0, 0
   4034 00 00              1567 .db e_ai_st_noAI, e_ai_st_noAI
   4036 00 00 1D 34        1568 .dw 0x0000, _invisible_sp
                           1569 
                           1570 ;;------------------------------------------------------------------------------------------------------
                           1571 ;; Key
   403A 0C 40 39 A4 00 00  1572 .db e_type_render|e_type_collision, e_object_key, 0x39, 0xA4, 0, 0, 2, 8
        02 08
   4042 00                 1573 .db e_object_none
   4043 00                 1574 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4044 00 01              1575 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4046 00 00              1576 .db 0, 0
   4048 00 00              1577 .db e_ai_st_noAI, e_ai_st_noAI
   404A 00 00 5D 0C        1578 .dw 0x0000, _key_sp
                           1579 
                           1580 ;;------------------------------------------------------------------------------------------------------
                           1581 ;; Ladders
   404E 08 04 22 A4 00 00  1582 .db e_type_collision, e_object_ladder, 0x22, 0xA4 , 0, 0, 6, 40
        06 28
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 99.
Hexadecimal [16-Bits]



   4056 00                 1583 .db e_object_none
   4057 00                 1584 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4058 00 01              1585 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   405A 00 00              1586 .db 0, 0
   405C 00 00              1587 .db e_ai_st_noAI, e_ai_st_noAI
   405E 00 00 1D 34        1588 .dw 0x0000, _invisible_sp
                           1589 
   4062 08 04 48 A4 00 00  1590 .db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
        06 3C
   406A 00                 1591 .db e_object_none
   406B 00                 1592 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   406C 00 01              1593 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   406E 00 00              1594 .db 0, 0
   4070 00 00              1595 .db e_ai_st_noAI, e_ai_st_noAI
   4072 00 00 1D 34        1596 .dw 0x0000, _invisible_sp
                           1597 
   4076 08 04 1C 40 00 00  1598 .db e_type_collision, e_object_ladder, 0x1C, 0x40 , 0, 0, 6, 40
        06 28
   407E 00                 1599 .db e_object_none
   407F 00                 1600 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4080 00 01              1601 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4082 00 00              1602 .db 0, 0
   4084 00 00              1603 .db e_ai_st_noAI, e_ai_st_noAI
   4086 00 00 1D 34        1604 .dw 0x0000, _invisible_sp
                           1605 
   408A 08 04 36 68 00 00  1606 .db e_type_collision, e_object_ladder, 0x36, 0x68 , 0, 0, 6, 40
        06 28
   4092 00                 1607 .db e_object_none
   4093 00                 1608 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4094 00 01              1609 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4096 00 00              1610 .db 0, 0
   4098 00 00              1611 .db e_ai_st_noAI, e_ai_st_noAI
   409A 00 00 1D 34        1612 .dw 0x0000, _invisible_sp
                           1613 
                           1614 ;;------------------------------------------------------------------------------------------------------
                           1615 ;;Invisible entities
   409E 08 10 0A 7C 00 00  1616 .db e_type_collision, e_object_invisible, 0x0A, 0x7C, 0, 0, 1, 1
        01 01
   40A6 00                 1617 .db e_object_none
   40A7 00                 1618 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   40A8 00 01              1619 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   40AA 00 00              1620 .db 0, 0
   40AC 00 00              1621 .db e_ai_st_noAI, e_ai_st_noAI
   40AE 00 00 1D 34        1622 .dw 0x0000, _invisible_sp
                           1623 
   40B2 08 10 29 7C 00 00  1624 .db e_type_collision, e_object_invisible, 0x29, 0x7C, 0, 0, 1, 1
        01 01
   40BA 00                 1625 .db e_object_none
   40BB 00                 1626 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   40BC 00 01              1627 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   40BE 00 00              1628 .db 0, 0
   40C0 00 00              1629 .db e_ai_st_noAI, e_ai_st_noAI
   40C2 00 00 1D 34        1630 .dw 0x0000, _invisible_sp
                           1631 
   40C6 08 10 34 68 00 00  1632 .db e_type_collision, e_object_invisible, 0x34, 0x68, 0, 0, 1, 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 100.
Hexadecimal [16-Bits]



        01 01
   40CE 00                 1633 .db e_object_none
   40CF 00                 1634 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   40D0 00 01              1635 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   40D2 00 00              1636 .db 0, 0
   40D4 00 00              1637 .db e_ai_st_noAI, e_ai_st_noAI
   40D6 00 00 1D 34        1638 .dw 0x0000, _invisible_sp
                           1639 
   40DA 08 10 1A 40 00 00  1640 .db e_type_collision, e_object_invisible, 0x1A, 0x40, 0, 0, 1, 1
        01 01
   40E2 00                 1641 .db e_object_none
   40E3 00                 1642 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   40E4 00 01              1643 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   40E6 00 00              1644 .db 0, 0
   40E8 00 00              1645 .db e_ai_st_noAI, e_ai_st_noAI
   40EA 00 00 1D 34        1646 .dw 0x0000, _invisible_sp
                           1647 
   40EE 08 10 3D 40 00 00  1648 .db e_type_collision, e_object_invisible, 0x3D, 0x40, 0, 0, 1, 1
        01 01
   40F6 00                 1649 .db e_object_none
   40F7 00                 1650 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   40F8 00 01              1651 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   40FA 00 00              1652 .db 0, 0
   40FC 00 00              1653 .db e_ai_st_noAI, e_ai_st_noAI
   40FE 00 00 1D 34        1654 .dw 0x0000, _invisible_sp
                           1655 
   4102 08 10 23 18 00 00  1656 .db e_type_collision, e_object_invisible, 0x23, 0x18, 0, 0, 1, 1
        01 01
   410A 00                 1657 .db e_object_none
   410B 00                 1658 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   410C 00 01              1659 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   410E 00 00              1660 .db 0, 0
   4110 00 00              1661 .db e_ai_st_noAI, e_ai_st_noAI
   4112 00 00 1D 34        1662 .dw 0x0000, _invisible_sp
                           1663 
                           1664 ;;------------------------------------------------------------------------------------------------------
                           1665 ;; Hammer
   4116 0C 20 24 40 00 00  1666 .db e_type_render|e_type_collision, e_object_hammer, 0x24, 0x40 , 0, 0, 2, 12
        02 0C
   411E 00                 1667 .db e_object_none
   411F 00                 1668 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4120 00 01              1669 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4122 00 00              1670 .db 0, 0
   4124 00 00              1671 .db e_ai_st_noAI, e_ai_st_noAI
   4126 00 00 45 0C        1672 .dw 0x0000, _hammer_sp
                           1673 
                           1674 ;;------------------------------------------------------------------------------------------------------
                           1675 ;; Hammer (throw)
   412A 0A 20 02 02 00 00  1676 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   4132 00                 1677 .db e_object_none
   4133 00                 1678 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4134 00 01              1679 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4136 00 00              1680 .db 0, 0
   4138 00 00              1681 .db e_ai_st_noAI, e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 101.
Hexadecimal [16-Bits]



   413A 00 00 05 0C        1682 .dw 0x0000, _hammer_lado_sp_0
                           1683 
                           1684 
                           1685 ;;------------------------------------------------------------------------------------------------------
                           1686 ;;------------------------------------------------------------------------------------------------------
                           1687 ;; Entities level 16
   413E                    1688 entities_level16::
                           1689 ;;------------------------------------------------------------------------------------------------------
                           1690 ;; Hero
   413E 0F 01 40 A4 00 00  1691 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x40, 0xA4, 0, 0, 6, 16
        06 10
   4146 7E                 1692 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   4147 00                 1693 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4148 00 01              1694 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   414A 00 00              1695 .db 0, 0
   414C 00 00              1696 .db e_ai_st_noAI, e_ai_st_noAI
   414E 00 00 8D 0D        1697 .dw 0x0000, _viking_sp_0
                           1698 
                           1699 ;;------------------------------------------------------------------------------------------------------
                           1700 ;; Enemies	 
   4152 1E 02 15 68 00 00  1701 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x15, 0x68, 0, 0, 6, 16
        06 10
   415A 30                 1702 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   415B 00                 1703 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   415C 00 FF              1704 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   415E 00 00              1705 .db 0, 0
   4160 01 01              1706 .db e_ai_st_stand_by, e_ai_st_stand_by
   4162 FD 58 CD 0C        1707 .dw _patrol_l16_01, _enemy_sp_1
                           1708  
   4166 1E 02 09 40 00 00  1709 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x09, 0x40, 0, 0, 6, 16
        06 10
   416E 30                 1710 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   416F 00                 1711 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4170 00 01              1712 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4172 00 00              1713 .db 0, 0
   4174 01 01              1714 .db e_ai_st_stand_by, e_ai_st_stand_by
   4176 04 59 CD 0C        1715 .dw _patrol_l16_02, _enemy_sp_1
                           1716 
                           1717 ;;------------------------------------------------------------------------------------------------------
                           1718 ;; Door
   417A 08 08 25 18 00 00  1719 .db e_type_collision, e_object_door, 0x25, 0x18, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   4182 00                 1720 .db e_object_none
   4183 00                 1721 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4184 00 01              1722 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4186 00 00              1723 .db 0, 0
   4188 00 00              1724 .db e_ai_st_noAI, e_ai_st_noAI
   418A 00 00 1D 34        1725 .dw 0x0000, _invisible_sp
                           1726 
                           1727 ;;------------------------------------------------------------------------------------------------------
                           1728 ;; Key
   418E 0C 40 0A 18 00 00  1729 .db e_type_render|e_type_collision, e_object_key, 0x0A, 0x18, 0, 0, 2, 8
        02 08
   4196 00                 1730 .db e_object_none
   4197 00                 1731 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 102.
Hexadecimal [16-Bits]



   4198 00 01              1732 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   419A 00 00              1733 .db 0, 0
   419C 00 00              1734 .db e_ai_st_noAI, e_ai_st_noAI
   419E 00 00 5D 0C        1735 .dw 0x0000, _key_sp
                           1736 
                           1737 ;;------------------------------------------------------------------------------------------------------
                           1738 ;; Ladders
   41A2 08 04 02 40 00 00  1739 .db e_type_collision, e_object_ladder, 0x02, 0x40 , 0, 0, 6, 40
        06 28
   41AA 00                 1740 .db e_object_none
   41AB 00                 1741 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   41AC 00 01              1742 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   41AE 00 00              1743 .db 0, 0
   41B0 00 00              1744 .db e_ai_st_noAI, e_ai_st_noAI
   41B2 00 00 1D 34        1745 .dw 0x0000, _invisible_sp
                           1746 
   41B6 08 04 48 A4 00 00  1747 .db e_type_collision, e_object_ladder, 0x48, 0xA4 , 0, 0, 6, 60
        06 3C
   41BE 00                 1748 .db e_object_none
   41BF 00                 1749 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   41C0 00 01              1750 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   41C2 00 00              1751 .db 0, 0
   41C4 00 00              1752 .db e_ai_st_noAI, e_ai_st_noAI
   41C6 00 00 1D 34        1753 .dw 0x0000, _invisible_sp
                           1754 
   41CA 08 04 1E 68 00 00  1755 .db e_type_collision, e_object_ladder, 0x1E, 0x68 , 0, 0, 6, 40
        06 28
   41D2 00                 1756 .db e_object_none
   41D3 00                 1757 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   41D4 00 01              1758 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   41D6 00 00              1759 .db 0, 0
   41D8 00 00              1760 .db e_ai_st_noAI, e_ai_st_noAI
   41DA 00 00 1D 34        1761 .dw 0x0000, _invisible_sp
                           1762 
                           1763 ;;------------------------------------------------------------------------------------------------------
                           1764 ;;Invisible entities
   41DE 08 10 2F 40 00 00  1765 .db e_type_collision, e_object_invisible, 0x2F, 0x40, 0, 0, 1, 1
        01 01
   41E6 00                 1766 .db e_object_none
   41E7 00                 1767 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   41E8 00 01              1768 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   41EA 00 00              1769 .db 0, 0
   41EC 00 00              1770 .db e_ai_st_noAI, e_ai_st_noAI
   41EE 00 00 1D 34        1771 .dw 0x0000, _invisible_sp
                           1772 
   41F2 08 10 38 A4 00 00  1773 .db e_type_collision, e_object_invisible, 0x38, 0xA4, 0, 0, 1, 1
        01 01
   41FA 00                 1774 .db e_object_none
   41FB 00                 1775 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   41FC 00 01              1776 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   41FE 00 00              1777 .db 0, 0
   4200 00 00              1778 .db e_ai_st_noAI, e_ai_st_noAI
   4202 00 00 1D 34        1779 .dw 0x0000, _invisible_sp
                           1780 
   4206 08 10 31 18 00 00  1781 .db e_type_collision, e_object_invisible, 0x31, 0x18, 0, 0, 1, 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 103.
Hexadecimal [16-Bits]



        01 01
   420E 00                 1782 .db e_object_none
   420F 00                 1783 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4210 00 01              1784 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4212 00 00              1785 .db 0, 0
   4214 00 00              1786 .db e_ai_st_noAI, e_ai_st_noAI
   4216 00 00 1D 34        1787 .dw 0x0000, _invisible_sp
                           1788 
                           1789 ;;------------------------------------------------------------------------------------------------------
                           1790 ;; Hammer
   421A 0C 20 26 40 00 00  1791 .db e_type_render|e_type_collision, e_object_hammer, 0x26, 0x40 , 0, 0, 2, 12
        02 0C
   4222 00                 1792 .db e_object_none
   4223 00                 1793 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4224 00 01              1794 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4226 00 00              1795 .db 0, 0
   4228 00 00              1796 .db e_ai_st_noAI, e_ai_st_noAI
   422A 00 00 45 0C        1797 .dw 0x0000, _hammer_sp
                           1798 
   422E 0C 20 3F 68 00 00  1799 .db e_type_render|e_type_collision, e_object_hammer, 0x3F, 0x68 , 0, 0, 2, 12
        02 0C
   4236 00                 1800 .db e_object_none
   4237 00                 1801 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4238 00 01              1802 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   423A 00 00              1803 .db 0, 0
   423C 00 00              1804 .db e_ai_st_noAI, e_ai_st_noAI
   423E 00 00 45 0C        1805 .dw 0x0000, _hammer_sp
                           1806 ;;------------------------------------------------------------------------------------------------------
                           1807 ;; Hammer (throw)
   4242 0A 20 02 02 00 00  1808 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   424A 00                 1809 .db e_object_none
   424B 00                 1810 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   424C 00 01              1811 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   424E 00 00              1812 .db 0, 0
   4250 00 00              1813 .db e_ai_st_noAI, e_ai_st_noAI
   4252 00 00 05 0C        1814 .dw 0x0000, _hammer_lado_sp_0
                           1815 
                           1816 
                           1817 
                           1818 ;;------------------------------------------------------------------------------------------------------
                           1819 ;;------------------------------------------------------------------------------------------------------
                           1820 ;; Entities level 17
   4256                    1821 entities_level17::
                           1822 ;;------------------------------------------------------------------------------------------------------
                           1823 ;; Hero
   4256 0F 01 10 18 00 00  1824 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x10, 0x18, 0, 0, 6, 16
        06 10
   425E 7E                 1825 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   425F 00                 1826 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4260 00 01              1827 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4262 00 00              1828 .db 0, 0
   4264 00 00              1829 .db e_ai_st_noAI, e_ai_st_noAI
   4266 00 00 ED 0D        1830 .dw 0x0000, _viking_sp_1
                           1831 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 104.
Hexadecimal [16-Bits]



                           1832 ;;------------------------------------------------------------------------------------------------------
                           1833 ;; Enemies	
   426A 1E 02 2A 54 00 00  1834 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2A, 0x54, 0, 0, 6, 16
        06 10
   4272 30                 1835 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4273 00                 1836 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4274 00 FF              1837 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4276 00 00              1838 .db 0, 0
   4278 01 01              1839 .db e_ai_st_stand_by, e_ai_st_stand_by
   427A 0B 59 CD 0C        1840 .dw _patrol_l17_01, _enemy_sp_1
                           1841 
                           1842 
   427E 1E 02 34 7C 00 00  1843 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x34, 0x7C, 0, 0, 6, 16
        06 10
   4286 30                 1844 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4287 00                 1845 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4288 00 01              1846 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   428A 00 00              1847 .db 0, 0
   428C 01 01              1848 .db e_ai_st_stand_by, e_ai_st_stand_by
   428E 2B 59 CD 0C        1849 .dw _patrol_l17_03, _enemy_sp_1
                           1850 
   4292 1E 02 17 A4 00 00  1851 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x17, 0xA4, 0, 0, 6, 16
        06 10
   429A 30                 1852 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   429B 00                 1853 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   429C 00 01              1854 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   429E 00 00              1855 .db 0, 0
   42A0 01 01              1856 .db e_ai_st_stand_by, e_ai_st_stand_by
   42A2 12 59 CD 0C        1857 .dw _patrol_l17_02, _enemy_sp_1
                           1858 
                           1859 ;;------------------------------------------------------------------------------------------------------
                           1860 ;; Door
   42A6 08 08 43 A4 00 00  1861 .db e_type_collision, e_object_door, 0x43, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   42AE 00                 1862 .db e_object_none
   42AF 00                 1863 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   42B0 00 01              1864 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   42B2 00 00              1865 .db 0, 0
   42B4 00 00              1866 .db e_ai_st_noAI, e_ai_st_noAI
   42B6 00 00 1D 34        1867 .dw 0x0000, _invisible_sp
                           1868 
                           1869 ;;------------------------------------------------------------------------------------------------------
                           1870 ;; Key
   42BA 0C 40 21 A4 00 00  1871 .db e_type_render|e_type_collision, e_object_key, 0x21, 0xA4, 0, 0, 2, 8
        02 08
   42C2 00                 1872 .db e_object_none
   42C3 00                 1873 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   42C4 00 01              1874 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   42C6 00 00              1875 .db 0, 0
   42C8 00 00              1876 .db e_ai_st_noAI, e_ai_st_noAI
   42CA 00 00 5D 0C        1877 .dw 0x0000, _key_sp
                           1878 
                           1879 ;;------------------------------------------------------------------------------------------------------
                           1880 ;; Ladders
   42CE 08 04 0A A4 00 00  1881 .db e_type_collision, e_object_ladder, 0x0A, 0xA4 , 0, 0, 6, 40
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 105.
Hexadecimal [16-Bits]



        06 28
   42D6 00                 1882 .db e_object_none
   42D7 00                 1883 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   42D8 00 01              1884 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   42DA 00 00              1885 .db 0, 0
   42DC 00 00              1886 .db e_ai_st_noAI, e_ai_st_noAI
   42DE 00 00 1D 34        1887 .dw 0x0000, _invisible_sp
                           1888 
   42E2 08 04 26 A4 00 00  1889 .db e_type_collision, e_object_ladder, 0x26, 0xA4 , 0, 0, 6, 40
        06 28
   42EA 00                 1890 .db e_object_none
   42EB 00                 1891 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   42EC 00 01              1892 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   42EE 00 00              1893 .db 0, 0
   42F0 00 00              1894 .db e_ai_st_noAI, e_ai_st_noAI
   42F2 00 00 1D 34        1895 .dw 0x0000, _invisible_sp
                           1896 
   42F6 08 04 38 A4 00 00  1897 .db e_type_collision, e_object_ladder, 0x38, 0xA4, 0, 0, 6, 40
        06 28
   42FE 00                 1898 .db e_object_none
   42FF 00                 1899 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4300 00 01              1900 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4302 00 00              1901 .db 0, 0
   4304 00 00              1902 .db e_ai_st_noAI, e_ai_st_noAI
   4306 00 00 1D 34        1903 .dw 0x0000, _invisible_sp
                           1904 
   430A 08 04 1A 7C 00 00  1905 .db e_type_collision, e_object_ladder, 0x1A, 0x7C , 0, 0, 6, 40
        06 28
   4312 00                 1906 .db e_object_none
   4313 00                 1907 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4314 00 01              1908 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4316 00 00              1909 .db 0, 0
   4318 00 00              1910 .db e_ai_st_noAI, e_ai_st_noAI
   431A 00 00 1D 34        1911 .dw 0x0000, _invisible_sp
                           1912 
   431E 08 04 30 7C 00 00  1913 .db e_type_collision, e_object_ladder, 0x30, 0x7C , 0, 0, 6, 40
        06 28
   4326 00                 1914 .db e_object_none
   4327 00                 1915 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4328 00 01              1916 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   432A 00 00              1917 .db 0, 0
   432C 00 00              1918 .db e_ai_st_noAI, e_ai_st_noAI
   432E 00 00 1D 34        1919 .dw 0x0000, _invisible_sp
                           1920 
   4332 08 04 06 54 00 00  1921 .db e_type_collision, e_object_ladder, 0x06, 0x54 , 0, 0, 6, 60
        06 3C
   433A 00                 1922 .db e_object_none
   433B 00                 1923 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   433C 00 01              1924 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   433E 00 00              1925 .db 0, 0
   4340 00 00              1926 .db e_ai_st_noAI, e_ai_st_noAI
   4342 00 00 1D 34        1927 .dw 0x0000, _invisible_sp
                           1928 
                           1929 ;;------------------------------------------------------------------------------------------------------
                           1930 ;;Invisible entities
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 106.
Hexadecimal [16-Bits]



   4346 08 10 23 18 00 00  1931 .db e_type_collision, e_object_invisible, 0x23, 0x18, 0, 0, 1, 1
        01 01
   434E 00                 1932 .db e_object_none
   434F 00                 1933 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4350 00 01              1934 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4352 00 00              1935 .db 0, 0
   4354 00 00              1936 .db e_ai_st_noAI, e_ai_st_noAI
   4356 00 00 1D 34        1937 .dw 0x0000, _invisible_sp
                           1938 
                           1939 ;;.db e_type_collision, e_object_invisible, 0x04, 0x68, 0, 0, 1, 1
                           1940 ;;.db e_object_none
                           1941 ;;.db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
                           1942 ;;.db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
                           1943 ;;.db 0, 0
                           1944 ;;.db e_ai_st_noAI, e_ai_st_noAI
                           1945 ;;.dw 0x0000, _invisible_sp
                           1946 
   435A 08 10 08 7C 00 00  1947 .db e_type_collision, e_object_invisible, 0x08, 0x7C, 0, 0, 1, 1
        01 01
   4362 00                 1948 .db e_object_none
   4363 00                 1949 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4364 00 01              1950 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4366 00 00              1951 .db 0, 0
   4368 00 00              1952 .db e_ai_st_noAI, e_ai_st_noAI
   436A 00 00 1D 34        1953 .dw 0x0000, _invisible_sp
                           1954 
   436E 08 10 21 7C 00 00  1955 .db e_type_collision, e_object_invisible, 0x21, 0x7C, 0, 0, 1, 1
        01 01
   4376 00                 1956 .db e_object_none
   4377 00                 1957 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4378 00 01              1958 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   437A 00 00              1959 .db 0, 0
   437C 00 00              1960 .db e_ai_st_noAI, e_ai_st_noAI
   437E 00 00 1D 34        1961 .dw 0x0000, _invisible_sp
                           1962 
   4382 08 10 24 7C 00 00  1963 .db e_type_collision, e_object_invisible, 0x24, 0x7C, 0, 0, 1, 1
        01 01
   438A 00                 1964 .db e_object_none
   438B 00                 1965 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   438C 00 01              1966 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   438E 00 00              1967 .db 0, 0
   4390 00 00              1968 .db e_ai_st_noAI, e_ai_st_noAI
   4392 00 00 1D 34        1969 .dw 0x0000, _invisible_sp
                           1970 
   4396 08 10 3F 7C 00 00  1971 .db e_type_collision, e_object_invisible, 0x3F, 0x7C, 0, 0, 1, 1
        01 01
   439E 00                 1972 .db e_object_none
   439F 00                 1973 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   43A0 00 01              1974 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   43A2 00 00              1975 .db 0, 0
   43A4 00 00              1976 .db e_ai_st_noAI, e_ai_st_noAI
   43A6 00 00 1D 34        1977 .dw 0x0000, _invisible_sp
                           1978 
   43AA 08 10 08 A4 00 00  1979 .db e_type_collision, e_object_invisible, 0x08, 0xA4, 0, 0, 1, 1
        01 01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 107.
Hexadecimal [16-Bits]



   43B2 00                 1980 .db e_object_none
   43B3 00                 1981 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   43B4 00 01              1982 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   43B6 00 00              1983 .db 0, 0
   43B8 00 00              1984 .db e_ai_st_noAI, e_ai_st_noAI
   43BA 00 00 1D 34        1985 .dw 0x0000, _invisible_sp
                           1986 
   43BE 08 10 2D A4 00 00  1987 .db e_type_collision, e_object_invisible, 0x2D, 0xA4, 0, 0, 1, 1
        01 01
   43C6 00                 1988 .db e_object_none
   43C7 00                 1989 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   43C8 00 01              1990 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   43CA 00 00              1991 .db 0, 0
   43CC 00 00              1992 .db e_ai_st_noAI, e_ai_st_noAI
   43CE 00 00 1D 34        1993 .dw 0x0000, _invisible_sp
                           1994 
   43D2 08 10 36 A4 00 00  1995 .db e_type_collision, e_object_invisible, 0x36, 0xA4, 0, 0, 1, 1
        01 01
   43DA 00                 1996 .db e_object_none
   43DB 00                 1997 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   43DC 00 01              1998 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   43DE 00 00              1999 .db 0, 0
   43E0 00 00              2000 .db e_ai_st_noAI, e_ai_st_noAI
   43E2 00 00 1D 34        2001 .dw 0x0000, _invisible_sp
                           2002 
                           2003 ;;------------------------------------------------------------------------------------------------------
                           2004 ;; Hammer
   43E6 0C 20 11 54 00 00  2005 .db e_type_render|e_type_collision, e_object_hammer, 0x11, 0x54 , 0, 0, 2, 12
        02 0C
   43EE 00                 2006 .db e_object_none
   43EF 00                 2007 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   43F0 00 01              2008 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   43F2 00 00              2009 .db 0, 0
   43F4 00 00              2010 .db e_ai_st_noAI, e_ai_st_noAI
   43F6 00 00 45 0C        2011 .dw 0x0000, _hammer_sp
                           2012 
                           2013 
                           2014 ;;------------------------------------------------------------------------------------------------------
                           2015 ;; Hammer (throw)
   43FA 0A 20 02 02 00 00  2016 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   4402 00                 2017 .db e_object_none
   4403 00                 2018 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4404 00 01              2019 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4406 00 00              2020 .db 0, 0
   4408 00 00              2021 .db e_ai_st_noAI, e_ai_st_noAI
   440A 00 00 05 0C        2022 .dw 0x0000, _hammer_lado_sp_0
                           2023 
                           2024 
                           2025 ;;------------------------------------------------------------------------------------------------------
                           2026 ;;------------------------------------------------------------------------------------------------------
                           2027 ;; Entities level 18
   440E                    2028 entities_level18::
                           2029 ;;------------------------------------------------------------------------------------------------------
                           2030 ;; Hero
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 108.
Hexadecimal [16-Bits]



   440E 0F 01 36 2C 00 00  2031 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x36, 0x2C, 0, 0, 6, 16
        06 10
   4416 7E                 2032 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   4417 00                 2033 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4418 00 01              2034 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   441A 00 00              2035 .db 0, 0
   441C 00 00              2036 .db e_ai_st_noAI, e_ai_st_noAI
   441E 00 00 ED 0D        2037 .dw 0x0000, _viking_sp_1
                           2038 
                           2039 ;;------------------------------------------------------------------------------------------------------
                           2040 ;; Enemies	
   4422 1E 02 17 2C 00 00  2041 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x17, 0x2C, 0, 0, 6, 16
        06 10
   442A 30                 2042 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   442B 00                 2043 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   442C 00 01              2044 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   442E 00 00              2045 .db 0, 0
   4430 01 01              2046 .db e_ai_st_stand_by, e_ai_st_stand_by
   4432 44 59 CD 0C        2047 .dw _patrol_l18_01, _enemy_sp_1
                           2048 
   4436 1E 02 14 54 00 00  2049 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x14, 0x54, 0, 0, 6, 16
        06 10
   443E 30                 2050 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   443F 00                 2051 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4440 00 01              2052 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4442 00 00              2053 .db 0, 0
   4444 01 01              2054 .db e_ai_st_stand_by, e_ai_st_stand_by
   4446 4B 59 CD 0C        2055 .dw _patrol_l18_02, _enemy_sp_1
                           2056 
   444A 1E 02 2C A4 00 00  2057 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2C, 0xA4, 0, 0, 6, 16
        06 10
   4452 30                 2058 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4453 00                 2059 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4454 00 FF              2060 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4456 00 00              2061 .db 0, 0
   4458 01 01              2062 .db e_ai_st_stand_by, e_ai_st_stand_by
   445A 64 59 CD 0C        2063 .dw _patrol_l18_03, _enemy_sp_1
                           2064 ;;------------------------------------------------------------------------------------------------------
                           2065 ;; Door
   445E 08 08 26 A4 00 00  2066 .db e_type_collision, e_object_door, 0x26, 0xA4, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   4466 00                 2067 .db e_object_none
   4467 00                 2068 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4468 00 01              2069 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   446A 00 00              2070 .db 0, 0
   446C 00 00              2071 .db e_ai_st_noAI, e_ai_st_noAI
   446E 00 00 1D 34        2072 .dw 0x0000, _invisible_sp
                           2073 
                           2074 ;;------------------------------------------------------------------------------------------------------
                           2075 ;; Key
   4472 0C 40 3D 7C 00 00  2076 .db e_type_render|e_type_collision, e_object_key, 0x3D, 0x7C, 0, 0, 2, 8
        02 08
   447A 00                 2077 .db e_object_none
   447B 00                 2078 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   447C 00 01              2079 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 109.
Hexadecimal [16-Bits]



   447E 00 00              2080 .db 0, 0
   4480 00 00              2081 .db e_ai_st_noAI, e_ai_st_noAI
   4482 00 00 5D 0C        2082 .dw 0x0000, _key_sp
                           2083 
                           2084 ;;------------------------------------------------------------------------------------------------------
                           2085 ;; Ladders
   4486 08 04 16 A4 00 00  2086 .db e_type_collision, e_object_ladder, 0x16, 0xA4 , 0, 0, 6, 40
        06 28
   448E 00                 2087 .db e_object_none
   448F 00                 2088 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4490 00 01              2089 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4492 00 00              2090 .db 0, 0
   4494 00 00              2091 .db e_ai_st_noAI, e_ai_st_noAI
   4496 00 00 1D 34        2092 .dw 0x0000, _invisible_sp
                           2093 
   449A 08 04 34 A4 00 00  2094 .db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 40
        06 28
   44A2 00                 2095 .db e_object_none
   44A3 00                 2096 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   44A4 00 01              2097 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   44A6 00 00              2098 .db 0, 0
   44A8 00 00              2099 .db e_ai_st_noAI, e_ai_st_noAI
   44AA 00 00 1D 34        2100 .dw 0x0000, _invisible_sp
                           2101 
   44AE 08 04 02 7C 00 00  2102 .db e_type_collision, e_object_ladder, 0x02, 0x7C , 0, 0, 6, 40
        06 28
   44B6 00                 2103 .db e_object_none
   44B7 00                 2104 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   44B8 00 01              2105 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   44BA 00 00              2106 .db 0, 0
   44BC 00 00              2107 .db e_ai_st_noAI, e_ai_st_noAI
   44BE 00 00 1D 34        2108 .dw 0x0000, _invisible_sp
                           2109 
   44C2 08 04 24 54 00 00  2110 .db e_type_collision, e_object_ladder, 0x24, 0x54, 0, 0, 6, 40
        06 28
   44CA 00                 2111 .db e_object_none
   44CB 00                 2112 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   44CC 00 01              2113 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   44CE 00 00              2114 .db 0, 0
   44D0 00 00              2115 .db e_ai_st_noAI, e_ai_st_noAI
   44D2 00 00 1D 34        2116 .dw 0x0000, _invisible_sp
                           2117 ;;------------------------------------------------------------------------------------------------------
                           2118 ;;Invisible entities
   44D6 08 10 0E A4 00 00  2119 .db e_type_collision, e_object_invisible, 0x0E, 0xA4, 0, 0, 1, 1
        01 01
   44DE 00                 2120 .db e_object_none
   44DF 00                 2121 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   44E0 00 01              2122 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   44E2 00 00              2123 .db 0, 0
   44E4 00 00              2124 .db e_ai_st_noAI, e_ai_st_noAI
   44E6 00 00 1D 34        2125 .dw 0x0000, _invisible_sp
                           2126 
   44EA 08 10 41 A4 00 00  2127 .db e_type_collision, e_object_invisible, 0x41, 0xA4, 0, 0, 1, 1
        01 01
   44F2 00                 2128 .db e_object_none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 110.
Hexadecimal [16-Bits]



   44F3 00                 2129 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   44F4 00 01              2130 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   44F6 00 00              2131 .db 0, 0
   44F8 00 00              2132 .db e_ai_st_noAI, e_ai_st_noAI
   44FA 00 00 1D 34        2133 .dw 0x0000, _invisible_sp
                           2134 
   44FE 08 10 1D 7C 00 00  2135 .db e_type_collision, e_object_invisible, 0x1D, 0x7C, 0, 0, 1, 1
        01 01
   4506 00                 2136 .db e_object_none
   4507 00                 2137 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4508 00 01              2138 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   450A 00 00              2139 .db 0, 0
   450C 00 00              2140 .db e_ai_st_noAI, e_ai_st_noAI
   450E 00 00 1D 34        2141 .dw 0x0000, _invisible_sp
                           2142 
   4512 08 10 32 7C 00 00  2143 .db e_type_collision, e_object_invisible, 0x32, 0x7C, 0, 0, 1, 1
        01 01
   451A 00                 2144 .db e_object_none
   451B 00                 2145 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   451C 00 01              2146 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   451E 00 00              2147 .db 0, 0
   4520 00 00              2148 .db e_ai_st_noAI, e_ai_st_noAI
   4522 00 00 1D 34        2149 .dw 0x0000, _invisible_sp
                           2150 
   4526 08 10 47 54 00 00  2151 .db e_type_collision, e_object_invisible, 0x47, 0x54, 0, 0, 1, 1
        01 01
   452E 00                 2152 .db e_object_none
   452F 00                 2153 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4530 00 01              2154 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4532 00 00              2155 .db 0, 0
   4534 00 00              2156 .db e_ai_st_noAI, e_ai_st_noAI
   4536 00 00 1D 34        2157 .dw 0x0000, _invisible_sp
                           2158 
   453A 08 10 39 54 00 00  2159 .db e_type_collision, e_object_invisible, 0x39, 0x54, 0, 0, 1, 1
        01 01
   4542 00                 2160 .db e_object_none
   4543 00                 2161 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4544 00 01              2162 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4546 00 00              2163 .db 0, 0
   4548 00 00              2164 .db e_ai_st_noAI, e_ai_st_noAI
   454A 00 00 1D 34        2165 .dw 0x0000, _invisible_sp
                           2166 
   454E 08 10 0C 2C 00 00  2167 .db e_type_collision, e_object_invisible, 0x0C, 0x2C, 0, 0, 1, 1
        01 01
   4556 00                 2168 .db e_object_none
   4557 00                 2169 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4558 00 01              2170 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   455A 00 00              2171 .db 0, 0
   455C 00 00              2172 .db e_ai_st_noAI, e_ai_st_noAI
   455E 00 00 1D 34        2173 .dw 0x0000, _invisible_sp
                           2174 
   4562 08 10 41 2C 00 00  2175 .db e_type_collision, e_object_invisible, 0x41, 0x2C, 0, 0, 1, 1
        01 01
   456A 00                 2176 .db e_object_none
   456B 00                 2177 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 111.
Hexadecimal [16-Bits]



   456C 00 01              2178 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   456E 00 00              2179 .db 0, 0
   4570 00 00              2180 .db e_ai_st_noAI, e_ai_st_noAI
   4572 00 00 1D 34        2181 .dw 0x0000, _invisible_sp
                           2182 ;;------------------------------------------------------------------------------------------------------
                           2183 ;; Hammer
   4576 0C 20 11 7C 00 00  2184 .db e_type_render|e_type_collision, e_object_hammer, 0x11, 0x7C , 0, 0, 2, 12
        02 0C
   457E 00                 2185 .db e_object_none
   457F 00                 2186 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4580 00 01              2187 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4582 00 00              2188 .db 0, 0
   4584 00 00              2189 .db e_ai_st_noAI, e_ai_st_noAI
   4586 00 00 45 0C        2190 .dw 0x0000, _hammer_sp
                           2191 
   458A 0C 20 31 54 00 00  2192 .db e_type_render|e_type_collision, e_object_hammer, 0x31, 0x54 , 0, 0, 2, 12
        02 0C
   4592 00                 2193 .db e_object_none
   4593 00                 2194 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4594 00 01              2195 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4596 00 00              2196 .db 0, 0
   4598 00 00              2197 .db e_ai_st_noAI, e_ai_st_noAI
   459A 00 00 45 0C        2198 .dw 0x0000, _hammer_sp
                           2199 ;;------------------------------------------------------------------------------------------------------
                           2200 ;; Hammer (throw)
   459E 0A 20 02 02 00 00  2201 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   45A6 00                 2202 .db e_object_none
   45A7 00                 2203 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   45A8 00 01              2204 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   45AA 00 00              2205 .db 0, 0
   45AC 00 00              2206 .db e_ai_st_noAI, e_ai_st_noAI
   45AE 00 00 05 0C        2207 .dw 0x0000, _hammer_lado_sp_0
                           2208 
                           2209 
                           2210 ;;------------------------------------------------------------------------------------------------------
                           2211 ;;------------------------------------------------------------------------------------------------------
                           2212 ;; Entities level 19
   45B2                    2213 entities_level19::
                           2214 ;;------------------------------------------------------------------------------------------------------
                           2215 ;; Hero
   45B2 0F 01 1E A4 00 00  2216 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x1E, 0xA4, 0, 0, 6, 16
        06 10
   45BA 7E                 2217 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   45BB 00                 2218 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   45BC 00 01              2219 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   45BE 00 00              2220 .db 0, 0
   45C0 00 00              2221 .db e_ai_st_noAI, e_ai_st_noAI
   45C2 00 00 8D 0D        2222 .dw 0x0000, _viking_sp_0
                           2223 
                           2224 ;;------------------------------------------------------------------------------------------------------
                           2225 ;; Enemies	
                           2226 
   45C6 1E 02 10 54 00 00  2227 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x010, 0x54, 0, 0, 6, 16
        06 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 112.
Hexadecimal [16-Bits]



   45CE 30                 2228 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   45CF 00                 2229 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   45D0 00 01              2230 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   45D2 00 00              2231 .db 0, 0
   45D4 01 01              2232 .db e_ai_st_stand_by, e_ai_st_stand_by
   45D6 7F 59 CD 0C        2233 .dw _patrol_l19_01, _enemy_sp_1
                           2234 
   45DA 1E 02 1E 7C 00 00  2235 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x1E, 0x7C, 0, 0, 6, 16
        06 10
   45E2 30                 2236 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   45E3 00                 2237 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   45E4 00 01              2238 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   45E6 00 00              2239 .db 0, 0
   45E8 01 01              2240 .db e_ai_st_stand_by, e_ai_st_stand_by
   45EA 91 59 CD 0C        2241 .dw _patrol_l19_02, _enemy_sp_1
                           2242 
   45EE 1E 02 45 A4 00 00  2243 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x45, 0xA4, 0, 0, 6, 16
        06 10
   45F6 30                 2244 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   45F7 00                 2245 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   45F8 00 FF              2246 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   45FA 00 00              2247 .db 0, 0
   45FC 01 01              2248 .db e_ai_st_stand_by, e_ai_st_stand_by
   45FE A9 59 CD 0C        2249 .dw _patrol_l19_03, _enemy_sp_1
                           2250 
                           2251 ;;------------------------------------------------------------------------------------------------------
                           2252 ;; Door
   4602 08 08 35 2C 00 00  2253 .db e_type_collision, e_object_door, 0x35, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   460A 00                 2254 .db e_object_none
   460B 00                 2255 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   460C 00 01              2256 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   460E 00 00              2257 .db 0, 0
   4610 00 00              2258 .db e_ai_st_noAI, e_ai_st_noAI
   4612 00 00 1D 34        2259 .dw 0x0000, _invisible_sp
                           2260 
                           2261 ;;------------------------------------------------------------------------------------------------------
                           2262 ;; Key
   4616 0C 40 06 54 00 00  2263 .db e_type_render|e_type_collision, e_object_key, 0x06, 0x54, 0, 0, 2, 8
        02 08
   461E 00                 2264 .db e_object_none
   461F 00                 2265 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4620 00 01              2266 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4622 00 00              2267 .db 0, 0
   4624 00 00              2268 .db e_ai_st_noAI, e_ai_st_noAI
   4626 00 00 5D 0C        2269 .dw 0x0000, _key_sp
                           2270 
                           2271 ;;------------------------------------------------------------------------------------------------------
                           2272 ;; Ladders
   462A 08 04 34 A4 00 00  2273 .db e_type_collision, e_object_ladder, 0x34, 0xA4 , 0, 0, 6, 40
        06 28
   4632 00                 2274 .db e_object_none
   4633 00                 2275 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4634 00 01              2276 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4636 00 00              2277 .db 0, 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 113.
Hexadecimal [16-Bits]



   4638 00 00              2278 .db e_ai_st_noAI, e_ai_st_noAI
   463A 00 00 1D 34        2279 .dw 0x0000, _invisible_sp
                           2280 
   463E 08 04 2C 7C 00 00  2281 .db e_type_collision, e_object_ladder, 0x2C, 0x7C , 0, 0, 6, 40
        06 28
   4646 00                 2282 .db e_object_none
   4647 00                 2283 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4648 00 01              2284 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   464A 00 00              2285 .db 0, 0
   464C 00 00              2286 .db e_ai_st_noAI, e_ai_st_noAI
   464E 00 00 1D 34        2287 .dw 0x0000, _invisible_sp
                           2288 
   4652 08 04 1E 54 00 00  2289 .db e_type_collision, e_object_ladder, 0x1E, 0x54 , 0, 0, 6, 40
        06 28
   465A 00                 2290 .db e_object_none
   465B 00                 2291 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   465C 00 01              2292 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   465E 00 00              2293 .db 0, 0
   4660 00 00              2294 .db e_ai_st_noAI, e_ai_st_noAI
   4662 00 00 1D 34        2295 .dw 0x0000, _invisible_sp
                           2296 
                           2297 ;;------------------------------------------------------------------------------------------------------
                           2298 ;;Invisible entities
   4666 08 10 18 A4 00 00  2299 .db e_type_collision, e_object_invisible, 0x18, 0xA4, 0, 0, 1, 1
        01 01
   466E 00                 2300 .db e_object_none
   466F 00                 2301 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4670 00 01              2302 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4672 00 00              2303 .db 0, 0
   4674 00 00              2304 .db e_ai_st_noAI, e_ai_st_noAI
   4676 00 00 1D 34        2305 .dw 0x0000, _invisible_sp
                           2306 
   467A 08 10 0E 7C 00 00  2307 .db e_type_collision, e_object_invisible, 0x0E, 0x7C, 0, 0, 1, 1
        01 01
   4682 00                 2308 .db e_object_none
   4683 00                 2309 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4684 00 01              2310 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4686 00 00              2311 .db 0, 0
   4688 00 00              2312 .db e_ai_st_noAI, e_ai_st_noAI
   468A 00 00 1D 34        2313 .dw 0x0000, _invisible_sp
                           2314 
   468E 08 10 3F 54 00 00  2315 .db e_type_collision, e_object_invisible, 0x3F, 0x54, 0, 0, 1, 1
        01 01
   4696 00                 2316 .db e_object_none
   4697 00                 2317 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4698 00 01              2318 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   469A 00 00              2319 .db 0, 0
   469C 00 00              2320 .db e_ai_st_noAI, e_ai_st_noAI
   469E 00 00 1D 34        2321 .dw 0x0000, _invisible_sp
                           2322 
   46A2 08 10 0A 2C 00 00  2323 .db e_type_collision, e_object_invisible, 0x0A, 0x2C, 0, 0, 1, 1
        01 01
   46AA 00                 2324 .db e_object_none
   46AB 00                 2325 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   46AC 00 01              2326 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 114.
Hexadecimal [16-Bits]



   46AE 00 00              2327 .db 0, 0
   46B0 00 00              2328 .db e_ai_st_noAI, e_ai_st_noAI
   46B2 00 00 1D 34        2329 .dw 0x0000, _invisible_sp
                           2330 
   46B6 08 10 45 2C 00 00  2331 .db e_type_collision, e_object_invisible, 0x45, 0x2C, 0, 0, 1, 1
        01 01
   46BE 00                 2332 .db e_object_none
   46BF 00                 2333 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   46C0 00 01              2334 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   46C2 00 00              2335 .db 0, 0
   46C4 00 00              2336 .db e_ai_st_noAI, e_ai_st_noAI
   46C6 00 00 1D 34        2337 .dw 0x0000, _invisible_sp
                           2338 
                           2339 ;;------------------------------------------------------------------------------------------------------
                           2340 ;; Hammer
   46CA 0C 20 3C 54 00 00  2341 .db e_type_render|e_type_collision, e_object_hammer, 0x3C, 0x54 , 0, 0, 2, 12
        02 0C
   46D2 00                 2342 .db e_object_none
   46D3 00                 2343 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   46D4 00 01              2344 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   46D6 00 00              2345 .db 0, 0
   46D8 00 00              2346 .db e_ai_st_noAI, e_ai_st_noAI
   46DA 00 00 45 0C        2347 .dw 0x0000, _hammer_sp
                           2348 
                           2349 ;;------------------------------------------------------------------------------------------------------
                           2350 ;; Hammer (throw)
   46DE 0A 20 02 02 00 00  2351 .db e_type_physics|e_type_collision, e_object_hammer, 0x02, 0x02 , 0, 0, 4, 8
        04 08
   46E6 00                 2352 .db e_object_none
   46E7 00                 2353 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   46E8 00 01              2354 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   46EA 00 00              2355 .db 0, 0
   46EC 00 00              2356 .db e_ai_st_noAI, e_ai_st_noAI
   46EE 00 00 05 0C        2357 .dw 0x0000, _hammer_lado_sp_0
                           2358 
                           2359 
                           2360 ;;------------------------------------------------------------------------------------------------------
                           2361 ;;------------------------------------------------------------------------------------------------------
                           2362 ;; Entities level 20
   46F2                    2363 entities_level20::
                           2364 ;;------------------------------------------------------------------------------------------------------
                           2365 ;; Hero
   46F2 0F 01 38 A4 00 00  2366 .db e_type_input|e_type_physics|e_type_render|e_type_collision, e_object_hero, 0x38, 0xA4, 0, 0, 6, 16
        06 10
   46FA 7E                 2367 .db e_object_enemy|e_object_ladder|e_object_door|e_object_invisible|e_object_hammer|e_object_key	;; Objetos con los que puede colisionar
   46FB 00                 2368 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   46FC 00 01              2369 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   46FE 00 00              2370 .db 0, 0
   4700 00 00              2371 .db e_ai_st_noAI, e_ai_st_noAI
   4702 00 00 ED 0D        2372 .dw 0x0000, _viking_sp_1
                           2373 
                           2374 ;;------------------------------------------------------------------------------------------------------
                           2375 ;; Enemies	
   4706 1E 02 21 7C 00 00  2376 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x21, 0x7C, 0, 0, 6, 16
        06 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 115.
Hexadecimal [16-Bits]



   470E 30                 2377 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   470F 00                 2378 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4710 00 01              2379 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4712 00 00              2380 .db 0, 0
   4714 01 01              2381 .db e_ai_st_stand_by, e_ai_st_stand_by
   4716 BF 59 CD 0C        2382 .dw _patrol_l20_01, _enemy_sp_1
                           2383 
   471A 1E 02 2E 7C 00 00  2384 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x2E, 0x7C, 0, 0, 6, 16
        06 10
   4722 30                 2385 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4723 00                 2386 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4724 00 FF              2387 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4726 00 00              2388 .db 0, 0
   4728 01 01              2389 .db e_ai_st_stand_by, e_ai_st_stand_by
   472A D8 59 CD 0C        2390 .dw _patrol_l20_02, _enemy_sp_1
                           2391 
   472E 1E 02 12 A4 00 00  2392 .db e_type_physics|e_type_render|e_type_collision|e_type_ai, e_object_enemy, 0x12, 0xA4, 0, 0, 6, 16
        06 10
   4736 30                 2393 .db e_object_invisible|e_object_hammer	;; Objetos con los que puede colisionar
   4737 00                 2394 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar (el enemigo la utiliza para el estado de ia anterior)
   4738 00 FF              2395 .db e_invisible_nothing, e_frame_activo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   473A 00 00              2396 .db 0, 0
   473C 01 01              2397 .db e_ai_st_stand_by, e_ai_st_stand_by
   473E F1 59 CD 0C        2398 .dw _patrol_l20_03, _enemy_sp_1
                           2399 ;;------------------------------------------------------------------------------------------------------
                           2400 ;; Door
   4742 08 08 39 2C 00 00  2401 .db e_type_collision, e_object_door, 0x39, 0x2C, 0, 0, 8, 28     ;; 0x2C es la y en la que se encuentra el hero cuando está arriba
        08 1C
   474A 00                 2402 .db e_object_none
   474B 00                 2403 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   474C 00 01              2404 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   474E 00 00              2405 .db 0, 0
   4750 00 00              2406 .db e_ai_st_noAI, e_ai_st_noAI
   4752 00 00 1D 34        2407 .dw 0x0000, _invisible_sp
                           2408 
                           2409 ;;------------------------------------------------------------------------------------------------------
                           2410 ;; Key
   4756 0C 40 1F 2C 00 00  2411 .db e_type_render|e_type_collision, e_object_key, 0x1F, 0x2C, 0, 0, 2, 8
        02 08
   475E 00                 2412 .db e_object_none
   475F 00                 2413 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4760 00 01              2414 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4762 00 00              2415 .db 0, 0
   4764 00 00              2416 .db e_ai_st_noAI, e_ai_st_noAI
   4766 00 00 5D 0C        2417 .dw 0x0000, _key_sp
                           2418 
                           2419 ;;------------------------------------------------------------------------------------------------------
                           2420 ;; Ladders
   476A 08 04 26 A4 00 00  2421 .db e_type_collision, e_object_ladder, 0x26, 0xA4 , 0, 0, 6, 40
        06 28
   4772 00                 2422 .db e_object_none
   4773 00                 2423 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4774 00 01              2424 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4776 00 00              2425 .db 0, 0
   4778 00 00              2426 .db e_ai_st_noAI, e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 116.
Hexadecimal [16-Bits]



   477A 00 00 1D 34        2427 .dw 0x0000, _invisible_sp
                           2428 
   477E 08 04 18 7C 00 00  2429 .db e_type_collision, e_object_ladder, 0x18, 0x7C , 0, 0, 6, 40
        06 28
   4786 00                 2430 .db e_object_none
   4787 00                 2431 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4788 00 01              2432 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   478A 00 00              2433 .db 0, 0
   478C 00 00              2434 .db e_ai_st_noAI, e_ai_st_noAI
   478E 00 00 1D 34        2435 .dw 0x0000, _invisible_sp
                           2436 
   4792 08 04 3C 7C 00 00  2437 .db e_type_collision, e_object_ladder, 0x3C, 0x7C , 0, 0, 6, 40
        06 28
   479A 00                 2438 .db e_object_none
   479B 00                 2439 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   479C 00 01              2440 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   479E 00 00              2441 .db 0, 0
   47A0 00 00              2442 .db e_ai_st_noAI, e_ai_st_noAI
   47A2 00 00 1D 34        2443 .dw 0x0000, _invisible_sp
                           2444 
   47A6 08 04 28 54 00 00  2445 .db e_type_collision, e_object_ladder, 0x28, 0x54, 0, 0, 6, 40
        06 28
   47AE 00                 2446 .db e_object_none
   47AF 00                 2447 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   47B0 00 01              2448 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   47B2 00 00              2449 .db 0, 0
   47B4 00 00              2450 .db e_ai_st_noAI, e_ai_st_noAI
   47B6 00 00 1D 34        2451 .dw 0x0000, _invisible_sp
                           2452 ;;------------------------------------------------------------------------------------------------------
                           2453 ;;Invisible entities
   47BA 08 10 0C A4 00 00  2454 .db e_type_collision, e_object_invisible, 0x0C, 0xA4, 0, 0, 1, 1
        01 01
   47C2 00                 2455 .db e_object_none
   47C3 00                 2456 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   47C4 00 01              2457 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   47C6 00 00              2458 .db 0, 0
   47C8 00 00              2459 .db e_ai_st_noAI, e_ai_st_noAI
   47CA 00 00 1D 34        2460 .dw 0x0000, _invisible_sp
                           2461 
   47CE 08 10 45 A4 00 00  2462 .db e_type_collision, e_object_invisible, 0x45, 0xA4, 0, 0, 1, 1
        01 01
   47D6 00                 2463 .db e_object_none
   47D7 00                 2464 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   47D8 00 01              2465 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   47DA 00 00              2466 .db 0, 0
   47DC 00 00              2467 .db e_ai_st_noAI, e_ai_st_noAI
   47DE 00 00 1D 34        2468 .dw 0x0000, _invisible_sp
                           2469 
   47E2 08 10 0C 7C 00 00  2470 .db e_type_collision, e_object_invisible, 0x0C, 0x7C, 0, 0, 1, 1
        01 01
   47EA 00                 2471 .db e_object_none
   47EB 00                 2472 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   47EC 00 01              2473 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   47EE 00 00              2474 .db 0, 0
   47F0 00 00              2475 .db e_ai_st_noAI, e_ai_st_noAI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 117.
Hexadecimal [16-Bits]



   47F2 00 00 1D 34        2476 .dw 0x0000, _invisible_sp
                           2477 
   47F6 08 10 45 7C 00 00  2478 .db e_type_collision, e_object_invisible, 0x45, 0x7C, 0, 0, 1, 1
        01 01
   47FE 00                 2479 .db e_object_none
   47FF 00                 2480 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4800 00 01              2481 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4802 00 00              2482 .db 0, 0
   4804 00 00              2483 .db e_ai_st_noAI, e_ai_st_noAI
   4806 00 00 1D 34        2484 .dw 0x0000, _invisible_sp
                           2485 
   480A 08 10 0C 54 00 00  2486 .db e_type_collision, e_object_invisible, 0x0C, 0x54, 0, 0, 1, 1
        01 01
   4812 00                 2487 .db e_object_none
   4813 00                 2488 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4814 00 01              2489 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4816 00 00              2490 .db 0, 0
   4818 00 00              2491 .db e_ai_st_noAI, e_ai_st_noAI
   481A 00 00 1D 34        2492 .dw 0x0000, _invisible_sp
                           2493 
   481E 08 10 45 54 00 00  2494 .db e_type_collision, e_object_invisible, 0x45, 0x54, 0, 0, 1, 1
        01 01
   4826 00                 2495 .db e_object_none
   4827 00                 2496 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4828 00 01              2497 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   482A 00 00              2498 .db 0, 0
   482C 00 00              2499 .db e_ai_st_noAI, e_ai_st_noAI
   482E 00 00 1D 34        2500 .dw 0x0000, _invisible_sp
                           2501 
   4832 08 10 1C 2C 00 00  2502 .db e_type_collision, e_object_invisible, 0x1C, 0x2C, 0, 0, 1, 1
        01 01
   483A 00                 2503 .db e_object_none
   483B 00                 2504 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   483C 00 01              2505 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   483E 00 00              2506 .db 0, 0
   4840 00 00              2507 .db e_ai_st_noAI, e_ai_st_noAI
   4842 00 00 1D 34        2508 .dw 0x0000, _invisible_sp
                           2509 
   4846 08 10 45 2C 00 00  2510 .db e_type_collision, e_object_invisible, 0x45, 0x2C, 0, 0, 1, 1
        01 01
   484E 00                 2511 .db e_object_none
   484F 00                 2512 .db e_ladder_nothing	;; Máscara para comprobar si está en la escalera y puede subir y bajar
   4850 00 01              2513 .db e_invisible_nothing, e_frame_inactivo	;; Máscara para comprobar si choca con una entidad invisible / Máscara para comprobar que se pinta en el frame
   4852 00 00              2514 .db 0, 0
   4854 00 00              2515 .db e_ai_st_noAI, e_ai_st_noAI
   4856 00 00 1D 34        2516 .dw 0x0000, _invisible_sp
                           2517 
   485A 00 00 05 0C        2518 .dw 0x0000, _hammer_lado_sp_0
                           2519 ;;------------------------------------------------------------------------------------------------------
                           2520 ;; ----------------------INIT2-------------------------------
                           2521 ;;------------------------------------------------------------------------------------------------------
   485E                    2522 reset::
                           2523 
   485E CD 68 33      [17] 2524 	call 	man_entity_destroy
   4861 CD 37 54      [17] 2525 	call 	man_menu_init
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 118.
Hexadecimal [16-Bits]



                           2526 
   4864 C9            [10] 2527 ret
                           2528 
   4865                    2529 man_game_init2::
                           2530 
   4865 CD 3B 32      [17] 2531 	call    man_entity_init
   4868 CD 31 32      [17] 2532     call    man_entity_getEntityVector_IX
   486B CD D4 2F      [17] 2533 	call    sys_render_init
   486E CD B5 52      [17] 2534 	call    man_level_init
                           2535 
   4871 CD D9 53      [17] 2536     call  man_level_render
                           2537 
   4874 3A A5 52      [13] 2538     ld      a, (num_level)
   4877 FE 02         [ 7] 2539     cp      #2
   4879 28 5B         [12] 2540     jr      z, create_entities_l2
                           2541 
   487B FE 03         [ 7] 2542     cp      #3
   487D 28 60         [12] 2543     jr      z, create_entities_l3
                           2544 
   487F FE 04         [ 7] 2545     cp      #4
   4881 28 65         [12] 2546     jr      z, create_entities_l4
                           2547 
   4883 FE 05         [ 7] 2548     cp      #5
   4885 28 6A         [12] 2549     jr      z, create_entities_l5
                           2550 
   4887 FE 06         [ 7] 2551     cp      #6
   4889 28 6E         [12] 2552     jr      z, create_entities_l6
                           2553 
   488B FE 07         [ 7] 2554     cp      #7
   488D 28 72         [12] 2555     jr      z, create_entities_l7
                           2556 
   488F FE 08         [ 7] 2557     cp      #8
   4891 28 76         [12] 2558     jr      z, create_entities_l8
                           2559 
   4893 FE 09         [ 7] 2560     cp      #9
   4895 28 7A         [12] 2561     jr      z, create_entities_l9
                           2562 
   4897 FE 0A         [ 7] 2563     cp      #10
   4899 28 7E         [12] 2564     jr      z, create_entities_l10
                           2565 
   489B FE 0B         [ 7] 2566     cp      #11
   489D CA 21 49      [10] 2567     jp      z, create_entities_l11
                           2568 
   48A0 FE 0C         [ 7] 2569     cp      #12
   48A2 CA 29 49      [10] 2570     jp      z, create_entities_l12
                           2571 
   48A5 FE 0D         [ 7] 2572     cp      #13
   48A7 CA 31 49      [10] 2573     jp      z, create_entities_l13
                           2574 
   48AA FE 0E         [ 7] 2575     cp      #14
   48AC CA 39 49      [10] 2576     jp      z, create_entities_l14
                           2577 
   48AF FE 0F         [ 7] 2578     cp      #15
   48B1 CA 41 49      [10] 2579     jp      z, create_entities_l15
                           2580 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 119.
Hexadecimal [16-Bits]



   48B4 FE 10         [ 7] 2581     cp      #16
   48B6 CA 49 49      [10] 2582     jp      z, create_entities_l16
                           2583 
   48B9 FE 11         [ 7] 2584     cp      #17
   48BB CA 51 49      [10] 2585     jp      z, create_entities_l17
                           2586 
   48BE FE 12         [ 7] 2587     cp      #18
   48C0 CA 59 49      [10] 2588     jp      z, create_entities_l18
                           2589 
   48C3 FE 13         [ 7] 2590     cp      #19
   48C5 CA 61 49      [10] 2591     jp      z, create_entities_l19
                           2592 
   48C8 FE 14         [ 7] 2593     cp      #20
   48CA CA 69 49      [10] 2594     jp      z, create_entities_l20
                           2595 
   48CD                    2596 create_entities_l1:
   48CD 21 1E 34      [10] 2597     ld      hl, #entities_level1
   48D0 CD 44 32      [17] 2598     call    man_entity_create
   48D3 C3 71 49      [10] 2599     jp      man_game_update
                           2600 
   48D6                    2601 create_entities_l2:
   48D6 21 5A 34      [10] 2602     ld      hl, #entities_level2
   48D9 CD 44 32      [17] 2603     call    man_entity_create
   48DC C3 71 49      [10] 2604     jp      man_game_update
                           2605 
   48DF                    2606 create_entities_l3:
   48DF 21 E6 34      [10] 2607     ld      hl, #entities_level3
   48E2 CD 44 32      [17] 2608     call    man_entity_create
   48E5 C3 71 49      [10] 2609     jp      man_game_update
                           2610 
   48E8                    2611 create_entities_l4:
   48E8 21 AE 35      [10] 2612     ld      hl, #entities_level4
   48EB CD 44 32      [17] 2613     call    man_entity_create
   48EE C3 71 49      [10] 2614     jp      man_game_update
                           2615 
   48F1                    2616 create_entities_l5:
   48F1 21 4E 36      [10] 2617     ld      hl, #entities_level5
   48F4 CD 44 32      [17] 2618     call    man_entity_create
   48F7 18 78         [12] 2619     jr      man_game_update
                           2620 
   48F9                    2621 create_entities_l6:
   48F9 21 3E 37      [10] 2622     ld      hl, #entities_level6
   48FC CD 44 32      [17] 2623     call    man_entity_create
   48FF 18 70         [12] 2624     jr      man_game_update
                           2625 
   4901                    2626 create_entities_l7:
   4901 21 DE 37      [10] 2627     ld      hl, #entities_level7
   4904 CD 44 32      [17] 2628     call    man_entity_create
   4907 18 68         [12] 2629     jr      man_game_update
                           2630 
   4909                    2631 create_entities_l8:
   4909 21 CE 38      [10] 2632     ld      hl, #entities_level8
   490C CD 44 32      [17] 2633     call    man_entity_create
   490F 18 60         [12] 2634     jr      man_game_update
                           2635 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 120.
Hexadecimal [16-Bits]



   4911                    2636 create_entities_l9:
   4911 21 BE 39      [10] 2637     ld      hl, #entities_level9
   4914 CD 44 32      [17] 2638     call    man_entity_create
   4917 18 58         [12] 2639     jr      man_game_update
                           2640 
   4919                    2641 create_entities_l10:
   4919 21 AE 3A      [10] 2642     ld      hl, #entities_level10
   491C CD 44 32      [17] 2643     call    man_entity_create
   491F 18 50         [12] 2644     jr      man_game_update
                           2645 
   4921                    2646 create_entities_l11:
   4921 21 02 3C      [10] 2647     ld      hl, #entities_level11
   4924 CD 44 32      [17] 2648     call    man_entity_create
   4927 18 48         [12] 2649     jr      man_game_update
                           2650 
   4929                    2651 create_entities_l12:
   4929 21 DE 3C      [10] 2652     ld      hl, #entities_level12
   492C CD 44 32      [17] 2653     call    man_entity_create
   492F 18 40         [12] 2654     jr      man_game_update
                           2655 
   4931                    2656 create_entities_l13:
   4931 21 CE 3D      [10] 2657     ld      hl, #entities_level13
   4934 CD 44 32      [17] 2658     call    man_entity_create
   4937 18 38         [12] 2659     jr      man_game_update
                           2660 
   4939                    2661 create_entities_l14:
   4939 21 AA 3E      [10] 2662     ld      hl, #entities_level14
   493C CD 44 32      [17] 2663     call    man_entity_create
   493F 18 30         [12] 2664     jr      man_game_update
                           2665 
   4941                    2666 create_entities_l15:
   4941 21 EA 3F      [10] 2667     ld      hl, #entities_level15
   4944 CD 44 32      [17] 2668     call    man_entity_create
   4947 18 28         [12] 2669     jr      man_game_update
                           2670 
   4949                    2671 create_entities_l16:
   4949 21 3E 41      [10] 2672     ld      hl, #entities_level16
   494C CD 44 32      [17] 2673     call    man_entity_create
   494F 18 20         [12] 2674     jr      man_game_update
                           2675 
   4951                    2676 create_entities_l17:
   4951 21 56 42      [10] 2677     ld      hl, #entities_level17
   4954 CD 44 32      [17] 2678     call    man_entity_create
   4957 18 18         [12] 2679     jr      man_game_update
                           2680 
   4959                    2681 create_entities_l18:
   4959 21 0E 44      [10] 2682     ld      hl, #entities_level18
   495C CD 44 32      [17] 2683     call    man_entity_create
   495F 18 10         [12] 2684     jr      man_game_update
                           2685 
   4961                    2686 create_entities_l19:
   4961 21 B2 45      [10] 2687     ld      hl, #entities_level19
   4964 CD 44 32      [17] 2688     call    man_entity_create
   4967 18 08         [12] 2689     jr      man_game_update
                           2690 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 121.
Hexadecimal [16-Bits]



   4969                    2691 create_entities_l20:
   4969 21 F2 46      [10] 2692     ld      hl, #entities_level20
   496C CD 44 32      [17] 2693     call    man_entity_create
   496F 18 00         [12] 2694     jr      man_game_update
                           2695 
   4971                    2696 man_game_update::
                           2697 
   4971                    2698 loop:
                           2699 
   4971                    2700 find_interrupt1:
   4971 3A AA 49      [13] 2701     ld    a, (man_ir_num_interrupt)
   4974 FE 01         [ 7] 2702     cp    #1
   4976 20 F9         [12] 2703     jr    nz, find_interrupt1
                           2704 
   4978 21 E9 29      [10] 2705 	ld    	hl, #sys_ai_control_update
   497B 3E 10         [ 7] 2706 	ld		 a, #e_type_ai			;; Se envía en A el tipo que queramos usar
   497D CD 8C 33      [17] 2707 	call  	man_entity_forall_matching
                           2708 
   4980 21 80 2A      [10] 2709     ld 		hl, #sys_collision_update
   4983 3E 08         [ 7] 2710 	ld		 a, #e_type_collision	;; Se envía en A el tipo que queramos usar
   4985 CD B0 33      [17] 2711 	call  	man_entity_forall_pairs_matching
                           2712 	
                           2713 
   4988                    2714 find_interrupt2:
   4988 3A AA 49      [13] 2715     ld    a, (man_ir_num_interrupt)
   498B FE 06         [ 7] 2716     cp    #6
   498D 20 F9         [12] 2717     jr    nz, find_interrupt2
                           2718 
   498F 21 47 2D      [10] 2719     ld    	hl, #sys_physics_update
   4992 3E 02         [ 7] 2720 	ld		 a, #e_type_physics		;; Se envía en A el tipo que queramos usar
   4994 CD 8C 33      [17] 2721 	call  	man_entity_forall_matching
                           2722 
   4997 21 FF 2F      [10] 2723 	ld    	hl, #sys_render_update  ;;y se los mando al render
   499A 3E 04         [ 7] 2724 	ld		 a, #e_type_render		;; Se envía en A el tipo que queramos usar
   499C CD 8C 33      [17] 2725 	call  	man_entity_forall_matching
                           2726 	
                           2727 
                           2728     ;;call    cpct_scanKeyboard_f_asm
   499F 21 08 04      [10] 2729     ld      hl, #Key_Esc
   49A2 CD 35 5B      [17] 2730     call    cpct_isKeyPressed_asm
   49A5 C2 5E 48      [10] 2731     jp      nz, reset
                           2732 
   49A8 18 C7         [12] 2733 jr  loop
