ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



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
                             18 .module cpct_strings
                             19 
                             20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             21 ;;
                             22 ;; Function: cpct_drawStringM0
                             23 ;;
                             24 ;;    Draws a null-terminated string with ROM characters to video memory or 
                             25 ;; to a hardware backbuffer in Mode 0 (160x200, 16 colours).
                             26 ;;
                             27 ;; C Definition:
                             28 ;;    void <cpct_drawStringM0> ( void* *string*, void* *video_memory*) __z88dk_callee
                             29 ;;
                             30 ;; Input Parameters (4 Bytes):
                             31 ;;  (2B IY) string       - Pointer to the null terminated string being drawn
                             32 ;;  (2B HL) video_memory - Video memory location where the string will be drawn
                             33 ;;
                             34 ;; Assembly call (Input parameters on registers):
                             35 ;;    > call cpct_drawStringM0_asm
                             36 ;;
                             37 ;; Parameter Restrictions:
                             38 ;;  * *string* must be a null terminated string. It could contain any 8-bit value as 
                             39 ;; characters except 0, which will signal the end of the string. Be careful to provide
                             40 ;; strings with a 0 (null) at the end of the string. Otherwise, unexpected results may
                             41 ;; happen (Typically, rubbish characters printed on screen and, occasionally, memory 
                             42 ;; overwrite and even hangs or crashes).
                             43 ;;  * *video_memory* could theoretically be any 16-bit memory location. It will work
                             44 ;; outside current screen memory boundaries, which is useful if you use any kind of
                             45 ;; double buffer. However, be careful where you use it, as it does no kind of check
                             46 ;; or clipping, and it could overwrite data if you select a wrong place to draw.
                             47 ;;
                             48 ;; Requirements and limitations:
                             49 ;;  * *Do not put this function's code below 0x4000 in memory*. In order to read
                             50 ;; characters from ROM, this function enables Lower ROM (which is located 0x0000-0x3FFF),
                             51 ;; so CPU would read code from ROM instead of RAM in first bank, effectively shadowing
                             52 ;; this piece of code. This would lead to undefined results (typically program would
                             53 ;; hang or crash).
                             54 ;;  * This routine does not check for boundaries. If you draw too long strings or out 
                             55 ;; of the screen, unpredictable results will happen.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 ;;  * Screen must be configured in Mode 0 (160x200 px, 16 colours)
                             57 ;;  * This function *disables interrupts* during main loop (character printing), and
                             58 ;; re-enables them at the end.
                             59 ;;  * This function *will not work from ROM*, as it uses self-modifying code.
                             60 ;;
                             61 ;; Details:
                             62 ;;    This function receives a null-terminated string and draws it to the screen in 
                             63 ;; Mode 0 (160x200, 16 colours). To do so, it repeatedly calls <cpct_drawCharM0_inner_asm>,
                             64 ;; for every character to be drawn. As foreground and background colours it uses the
                             65 ;; ones previously set up by the latest call to <cpct_setDrawCharM0>.
                             66 ;;
                             67 ;;   *video_memory* parameter points to the byte where the string will be
                             68 ;; drawn. The first pixel of that byte will be the upper-left corner of the string.
                             69 ;; As this function uses a byte-pointer to refer to the upper-left corner of the 
                             70 ;; string, it can only draw string on even-pixel columns (0, 2, 4, 6...), as 
                             71 ;; every byte contains 2 pixels in Mode 0.
                             72 ;;
                             73 ;;    Usage of this function is quite straight-forward, as you can see in the 
                             74 ;; following example,
                             75 ;; (start code)
                             76 ;;    // Just print some strings for testing
                             77 ;;    void main () {
                             78 ;;       u8* pvmem;  // Pointer to video memory
                             79 ;;
                             80 ;;       // Set video mode 0
                             81 ;;       cpct_disableFirmware();
                             82 ;;       cpct_setVideoMode(0);
                             83 ;;
                             84 ;;       // Draw some testing strings with curious colours, more or less centered
                             85 ;;       pvmem = cpctm_screenPtr(CPCT_VMEM_START, 16, 88);  // Calculate video memory address
                             86 ;;       cpct_setDrawCharM0(3, 5);                          // Red over black
                             87 ;;       cpct_drawStringM0("Hello there!", pvmem);          // Draw the string
                             88 ;;
                             89 ;;       pvmem = cpctm_screenPtr(CPCT_VMEM_START, 20, 108); // Calculate new video memory address
                             90 ;;       cpct_setDrawCharM0(1, 9);                          // Bright yellow over yellow
                             91 ;;       cpct_drawStringM0("Great man!",   pvmem);          // Draw the string
                             92 ;;
                             93 ;;       // And loop forever
                             94 ;;       while(1);
                             95 ;;    }
                             96 ;; (end code)
                             97 ;;
                             98 ;; Destroyed Register values: 
                             99 ;;    C bindings  - AF, BC, DE, HL
                            100 ;;  ASM bindings  - AF, BC, DE, HL, IX, IY
                            101 ;;
                            102 ;; Required memory: 
                            103 ;;    C bindings  - 58 (+100 cpct_drawCharM0_inner_asm = 158 bytes)
                            104 ;;  ASM bindings  - 38 (+100 cpct_drawCharM0_inner_asm = 138 bytes)
                            105 ;;
                            106 ;; Time Measures:
                            107 ;; (start code)
                            108 ;;   Case     | microSecs (us) | CPU Cycles
                            109 ;; ----------------------------------------------
                            110 ;;   Best     |    74 + 854*L  |  296 + 3416*L  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            111 ;;   Worst    |    74 + 862*L  |  296 + 3448*L
                            112 ;; ----------------------------------------------
                            113 ;; Asm saving |      -38       |     -152
                            114 ;; ----------------------------------------------
                            115 ;; (end code)
                            116 ;;    L = Length of the string (excluding null-terminator character)
                            117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            118 
                            119 .globl _myDrawCharInner
                            120 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                            121 .include "strings/strings.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2014-2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
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
                             18 ;#####################################################################
                             19 ;### MODULE: Strings                                               ###
                             20 ;#####################################################################
                             21 ;### Routines to print and manage characters and strings           ###
                             22 ;#####################################################################
                             23 ;
                             24 .module cpct_strings
                             25 
                             26 ;;
                             27 ;; Compilation control directives
                             28 ;;
                             29 ;; If true, interrupts can be disabled to get function parameters faster
                     0000    30 .equ let_disable_interrupts_for_function_parameters, 0  
                             31 
                             32 ;;
                             33 ;; Constant values
                             34 ;;
                     3800    35 .equ char0_ROM_address, 0x3800   ;; Address where definition of character 0 starts in ROM
                     007F    36 .equ GA_port_byte,      0x7F     ;; 8-bit Port of the Gate Array
                             37 
                             38 ;;
                             39 ;; External values
                             40 ;;
                             41 .globl _cpct_mode_rom_status       ;; defined in firmware_ed.s
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                            122 
   5A82                     123 _myDrawStringM0::
                            124 
   5A82 18 0B         [12]  125    jr    firstChar                  ;; [3] Jump to first char (Saves 1 jr back every iteration)
                            126 
   5A84                     127 nextChar:
                            128    ;; Draw next character
   5A84 E5            [11]  129    push  hl                         ;; [4] Save HL
   5A85 CD 19 5A      [17]  130    call  _myDrawCharInner  ;; [5 + 824/832] Draws the next character
   5A88 E1            [10]  131    pop   hl                         ;; [3] Recover HL 
                            132 
                            133    ;; Increment Pointers
   5A89 11 04 00      [10]  134    ld    de, #4                     ;; [3] /
   5A8C 19            [11]  135    add   hl, de                     ;; [3] | HL += 4 (point to next position in video memory, 8 pixels to the right)
   5A8D FD 23         [10]  136    inc   iy                         ;; [3] IX += 1 (point to next character in the string)
                            137 
   5A8F                     138 firstChar:
   5A8F FD 7E 00      [19]  139    ld     a, (iy)                   ;; [5] A = next character from the string
   5A92 B7            [ 4]  140    or     a                         ;; [1] Check if A = 0
   5A93 20 EF         [12]  141    jr    nz, nextChar               ;; [2/3] if A != 0, A is next character, draw it, else end
                            142 
   5A95                     143 endstring:
   5A95 C9            [10]  144    ret      ;; [3] Return to caller
                            145 
                            146 ;; IX/IY Restore and Return provided by bindings
