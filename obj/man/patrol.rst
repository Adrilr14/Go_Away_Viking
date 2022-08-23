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



                             24 .include "man/patrol.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             25 ;;
                             26 ;;PATROL MANAGER
                             27 ;;
   5795                      28 _patrol_l2_01::
   5795 20 A4                29     .db     0x20, 0xA4
   5797 42 A4                30     .db     0x42, 0xA4
   5799 FF                   31     .db     patrol_invalid_move_x
   579A 95 57                32     .dw     _patrol_l2_01
                             33 
   579C                      34 _patrol_l3_01::
   579C 0F A4                35     .db     0x0F, 0xA4
   579E 40 A4                36     .db     0x40, 0xA4
   57A0 FF                   37     .db     patrol_invalid_move_x
   57A1 9C 57                38     .dw     _patrol_l3_01
                             39 
   57A3                      40 _patrol_l3_02::
   57A3 0F 68                41     .db     0x0F, 0x68
   57A5 33 68                42     .db     0x33, 0x68
   57A7 FF                   43     .db     patrol_invalid_move_x
   57A8 A3 57                44     .dw     _patrol_l3_02
                             45 
   57AA                      46 _patrol_l4_01::
   57AA 45 68                47     .db     0x45, 0x68
   57AC 0F 68                48     .db     0x0F,0x68
   57AE FF                   49     .db     patrol_invalid_move_x
   57AF AA 57                50     .dw     _patrol_l4_01  
                             51 
   57B1                      52 _patrol_l5_01::
   57B1 1A 68                53     .db     0x1A, 0x68
   57B3 0A 68                54     .db     0x0A, 0x68
   57B5 FF                   55     .db     patrol_invalid_move_x
   57B6 B1 57                56     .dw     _patrol_l5_01 
                             57 
   57B8                      58 _patrol_l5_02::
   57B8 20 68                59     .db     0x20, 0x68
   57BA 39 68                60     .db     0x39, 0x68
   57BC FF                   61     .db     patrol_invalid_move_x
   57BD B8 57                62     .dw     _patrol_l5_02
                             63 
   57BF                      64 _patrol_l7_01::
   57BF 3E A4                65     .db     0x3E, 0xA4
   57C1 1E A4                66     .db     0x1E, 0xA4
   57C3 FF                   67     .db     patrol_invalid_move_x
   57C4 BF 57                68     .dw     _patrol_l7_01
                             69 
   57C6                      70 _patrol_l7_02::
   57C6 27 7C                71     .db     0x27,0x7C
   57C8 49 7C                72     .db     0x49, 0x7C
   57CA FF                   73     .db     patrol_invalid_move_x
   57CB C6 57                74     .dw     _patrol_l7_02 
                             75 
   57CD                      76 _patrol_l8_01::
   57CD 0A A4                77     .db     0x0A, 0xA4
   57CF 2F A4                78     .db     0x2F, 0xA4
   57D1 FF                   79     .db     patrol_invalid_move_x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



   57D2 CD 57                80     .dw     _patrol_l8_01
                             81 
   57D4                      82 _patrol_l8_02::
   57D4 34 68                83     .db     0x34, 0x68
   57D6 03 68                84     .db     0x03, 0x68
   57D8 FF                   85     .db     patrol_invalid_move_x
   57D9 D4 57                86     .dw     _patrol_l8_02
                             87 
   57DB                      88 _patrol_l9_01::
   57DB 1A A4                89     .db     0x1A, 0xA4
   57DD 04 A4                90     .db     0x04, 0xA4
   57DF FF                   91     .db     patrol_invalid_move_x
   57E0 DB 57                92     .dw     _patrol_l9_01
                             93 
   57E2                      94 _patrol_l9_02::
   57E2 03 68                95     .db     0x03, 0x68
   57E4 39 68                96     .db     0x39, 0x68
   57E6 FF                   97     .db     patrol_invalid_move_x
   57E7 E2 57                98     .dw     _patrol_l9_02
                             99 
   57E9                     100 _patrol_l10_01::
   57E9 2C A4               101     .db     0x2C, 0xA4
   57EB 49 A4               102     .db     0x49, 0xA4
   57ED FF                  103     .db     patrol_invalid_move_x
   57EE E9 57               104     .dw     _patrol_l10_01
                            105 
   57F0                     106 _patrol_l10_02::
   57F0 16 68               107     .db     0x16, 0x68
   57F2 39 68               108     .db     0x39, 0x68
   57F4 FF                  109     .db     patrol_invalid_move_x
   57F5 F0 57               110     .dw     _patrol_l10_02
                            111 
   57F7                     112 _patrol_l10_03::
   57F7 09 2C               113     .db     0x09, 0x2C
   57F9 2A 2C               114     .db     0x2A, 0x2C
   57FB FF                  115     .db     patrol_invalid_move_x
   57FC F7 57               116     .dw     _patrol_l10_03
                            117 
   57FE                     118 _patrol_l11_01::
   57FE 3A A4               119     .db     0x3A, 0xA4
   5800 29 A4               120     .db     0x29, 0xA4
   5802 FF                  121     .db     patrol_invalid_move_x
   5803 FE 57               122     .dw     _patrol_l11_01
                            123 
   5805                     124 _patrol_l11_02::
   5805 14 A4               125     .db     0x14, 0xA4
   5807 14 68               126     .db     0x14, 0x68
   5809 10 68               127     .db     0x10, 0x68
   580B 14 68               128     .db     0x14, 0x68
   580D 14 A4               129     .db     0x14, 0xA4
   580F 20 A4               130     .db     0x20, 0xA4
   5811 FF                  131     .db     patrol_invalid_move_x
   5812 05 58               132     .dw     _patrol_l11_02
                            133 
   5814                     134 _patrol_l12_01::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   5814 28 A4               135     .db     0x28, 0xA4
   5816 1A A4               136     .db     0x1A, 0xA4
   5818 1A 68               137     .db     0x1A, 0x68
   581A 21 68               138     .db     0x21, 0x68
   581C 1A 68               139     .db     0x1A, 0x68
   581E 1A A4               140     .db     0x1A, 0xA4
   5820 28 A4               141     .db     0x28, 0xA4
   5822 FF                  142     .db     patrol_invalid_move_x
   5823 14 58               143     .dw     _patrol_l12_01
                            144 
   5825                     145 _patrol_l12_02::
   5825 2D 68               146     .db     0x2D, 0x68
   5827 32 68               147     .db     0x32, 0x68
   5829 32 2C               148     .db     0x32, 0x2C
   582B 3E 2C               149     .db     0x3E, 0x2C
   582D 32 2C               150     .db     0x32, 0x2C
   582F 32 68               151     .db     0x32, 0x68
   5831 FF                  152     .db     patrol_invalid_move_x
   5832 34 58               153     .dw     _patrol_l12_02_1
   5834                     154 _patrol_l12_02_1:
   5834 32 68               155     .db     0x32, 0x68
   5836 2D 68               156     .db     0x2D, 0x68
   5838 FF                  157     .db     patrol_invalid_move_x
   5839 25 58               158     .dw     _patrol_l12_02
                            159 
   583B                     160 _patrol_l13_01::
   583B 2F 2C               161     .db     0x2F, 0x2C
   583D 48 2C               162     .db     0x48, 0x2C
   583F 48 68               163     .db     0x48, 0x68
   5841 30 68               164     .db     0x30, 0x68
   5843 FF                  165     .db     patrol_invalid_move_x
   5844 46 58               166     .dw     _patrol_l13_01_1
   5846                     167 _patrol_l13_01_1:
   5846 30 68               168     .db     0x30, 0x68
   5848 3A 68               169     .db     0x3A, 0x68
   584A 3A A4               170     .db     0x3A, 0xA4
   584C 40 A4               171     .db     0x40, 0xA4
   584E FF                  172     .db     patrol_invalid_move_x
   584F 51 58               173     .dw     _patrol_l13_01_2
   5851                     174 _patrol_l13_01_2:
   5851 40 A4               175     .db     0x40, 0xA4
   5853 2F A4               176     .db     0x2F, 0xA4
   5855 3A A4               177     .db     0x3A, 0xA4
   5857 3A 68               178     .db     0x3A, 0x68
   5859 48 68               179     .db     0x48, 0x68
   585B 48 2C               180     .db     0x48, 0x2C
   585D 2F 2C               181     .db     0x2F, 0x2C
   585F FF                  182     .db     patrol_invalid_move_x
   5860 3B 58               183     .dw     _patrol_l13_01
                            184 
   5862                     185 _patrol_l13_02::
   5862 1D A4               186     .db     0x1D, 0xA4
   5864 10 A4               187     .db     0x10, 0xA4
   5866 10 68               188     .db     0x10, 0x68
   5868 1A 68               189     .db     0x1A, 0x68
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   586A 02 68               190     .db     0x02, 0x68
   586C 02 2C               191     .db     0x02, 0x2C
   586E 1D 2C               192     .db     0x1D, 0x2C
   5870 02 2C               193     .db     0x02, 0x2C
   5872 02 68               194     .db     0x02, 0x68
   5874 10 68               195     .db     0x10, 0x68
   5876 FF                  196     .db     patrol_invalid_move_x
   5877 79 58               197     .dw     _patrol_l13_02_1
   5879                     198 _patrol_l13_02_1:
   5879 10 68               199     .db     0x10, 0x68    
   587B 10 A4               200     .db     0x10, 0xA4
   587D 1D A4               201     .db     0x1D, 0xA4
   587F FF                  202     .db     patrol_invalid_move_x
   5880 62 58               203     .dw     _patrol_l13_02
                            204 
   5882                     205 _patrol_l14_02::
   5882 3A 40               206     .db     0x3A, 0x40
   5884 3A 68               207     .db     0x3A, 0x68
   5886 30 68               208     .db     0x30, 0x68
   5888 FF                  209     .db     patrol_invalid_move_x
   5889 8B 58               210     .dw     _patrol_l14_02_5
   588B                     211 _patrol_l14_02_5:
   588B 30 68               212     .db     0x30, 0x68
   588D 48 68               213     .db     0x48, 0x68
   588F 48 A4               214     .db     0x48, 0xA4
   5891 FF                  215     .db     patrol_invalid_move_x
   5892 94 58               216     .dw     _patrol_l14_02_1
   5894                     217 _patrol_l14_02_1:
   5894 48 A4               218     .db     0x48, 0xA4
   5896 40 A4               219     .db     0x40, 0xA4
   5898 48 A4               220     .db     0x48, 0xA4
   589A FF                  221     .db     patrol_invalid_move_x
   589B 9D 58               222     .dw     _patrol_l14_02_2
   589D                     223 _patrol_l14_02_2:
   589D 48 A4               224     .db     0x48, 0xA4
   589F 48 68               225     .db     0x48, 0x68
   58A1 48 68               226     .db     0x48, 0x68
   58A3 3A 68               227     .db     0x3A, 0x68
   58A5 3A 40               228     .db     0x3A, 0x40
   58A7 FF                  229     .db     patrol_invalid_move_x
   58A8 AA 58               230     .dw     _patrol_l14_02_03
   58AA                     231 _patrol_l14_02_03:
   58AA 3A 40               232     .db     0x3A, 0x40
   58AC 2E 40               233     .db     0x2E, 0x40
   58AE FF                  234     .db     patrol_invalid_move_x
   58AF 82 58               235     .dw     _patrol_l14_02
   58B1                     236 _patrol_l14_01::
   58B1 1E 68               237     .db     0x1E, 0x68
   58B3 1E 40               238     .db     0x1E, 0x40
   58B5 2A 40               239     .db     0x2A, 0x40
   58B7 1E 40               240     .db     0x1E, 0x40
   58B9 1E 68               241     .db     0x1E, 0x68
   58BB FF                  242     .db     patrol_invalid_move_x
   58BC BE 58               243     .dw     _patrol_l14_01_1
   58BE                     244 _patrol_l14_01_1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   58BE 1E 68               245     .db     0x1E, 0x68
   58C0 28 68               246     .db     0x28, 0x68
   58C2 11 68               247     .db     0x11, 0x68
   58C4 1E 68               248     .db     0x1E, 0x68
   58C6 FF                  249     .db     patrol_invalid_move_x
   58C7 B1 58               250     .dw     _patrol_l14_01
                            251 
   58C9                     252 _patrol_l15_01::
   58C9 36 40               253     .db     0x36, 0x40
   58CB 36 68               254     .db     0x36, 0x68
   58CD 48 68               255     .db     0x48, 0x68
   58CF FF                  256     .db     patrol_invalid_move_x
   58D0 D2 58               257     .dw     _patrol_l15_01_1
   58D2                     258 _patrol_l15_01_1:
   58D2 48 68               259     .db     0x48, 0x68
   58D4 48 A4               260     .db     0x48, 0xA4
   58D6 FF                  261     .db     patrol_invalid_move_x
   58D7 D9 58               262     .dw     _patrol_l15_01_2
   58D9                     263 _patrol_l15_01_2:
   58D9 48 A4               264     .db     0x48, 0xA4
   58DB 3E A4               265     .db     0x3E, 0xA4
   58DD 48 A4               266     .db     0x48, 0xA4
   58DF FF                  267     .db     patrol_invalid_move_x
   58E0 E2 58               268     .dw     _patrol_l15_01_3
   58E2                     269 _patrol_l15_01_3:
   58E2 48 A4               270     .db     0x48, 0xA4
   58E4 48 68               271     .db     0x48, 0x68
   58E6 36 68               272     .db     0x36, 0x68
   58E8 36 40               273     .db     0x36, 0x40
   58EA FF                  274     .db     patrol_invalid_move_x
   58EB ED 58               275     .dw     _patrol_l15_01_4
   58ED                     276 _patrol_l15_01_4:
   58ED 36 40               277     .db     0x36, 0x40
   58EF 2E 40               278     .db     0x2E, 0x40
   58F1 36 40               279     .db     0x36, 0x40
   58F3 FF                  280     .db     patrol_invalid_move_x
   58F4 C9 58               281     .dw     _patrol_l15_01
                            282 
   58F6                     283 _patrol_l15_02::
   58F6 15 A4               284     .db     0x15, 0xA4
   58F8 33 A4               285     .db     0x33, 0xA4
   58FA FF                  286     .db     patrol_invalid_move_x
   58FB F6 58               287     .dw     _patrol_l15_02
                            288 
   58FD                     289 _patrol_l16_01::
   58FD 09 68               290     .db     0x09, 0x68
   58FF 36 68               291     .db     0x36, 0x68
   5901 FF                  292     .db     patrol_invalid_move_x
   5902 FD 58               293     .dw     _patrol_l16_01
                            294 
   5904                     295 _patrol_l16_02::
   5904 10 40               296     .db     0x10, 0x40
   5906 1E 40               297     .db     0x1E, 0x40
   5908 FF                  298     .db     patrol_invalid_move_x
   5909 04 59               299     .dw     _patrol_l16_02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            300 
   590B                     301 _patrol_l17_01::
   590B 45 54               302     .db     0x45, 0x54
   590D 15 54               303     .db     0x15, 0x54
   590F FF                  304     .db     patrol_invalid_move_x
   5910 0B 59               305     .dw     _patrol_l17_01
                            306 
   5912                     307 _patrol_l17_02::
   5912 0A A4               308     .db     0x0A, 0xA4
   5914 0A 7C               309     .db     0x0A, 0x7C
   5916 FF                  310     .db     patrol_invalid_move_x
   5917 19 59               311     .dw     _patrol_l17_02_01
   5919                     312 _patrol_l17_02_01:
   5919 0A 7C               313     .db     0x0A, 0x7C
   591B 18 7C               314     .db     0x18, 0x7C
   591D 0A 7C               315     .db     0x0A, 0x7C
   591F 0A A4               316     .db     0x0A, 0xA4
   5921 FF                  317     .db     patrol_invalid_move_x
   5922 24 59               318     .dw     _patrol_l17_02_02
   5924                     319 _patrol_l17_02_02:
   5924 0A A4               320     .db     0x0A, 0xA4
   5926 17 A4               321     .db     0x17, 0xA4
   5928 FF                  322     .db     patrol_invalid_move_x
   5929 12 59               323     .dw     _patrol_l17_02
                            324 
   592B                     325 _patrol_l17_03::
   592B 38 7C               326     .db     0x38, 0x7C
   592D 38 A4               327     .db     0x38, 0xA4
   592F FF                  328     .db     patrol_invalid_move_x
   5930 32 59               329     .dw     _patrol_l17_03_01
   5932                     330 _patrol_l17_03_01:
   5932 38 A4               331     .db     0x38, 0xA4
   5934 42 A4               332     .db     0x42, 0xA4
   5936 38 A4               333     .db     0x38, 0xA4
   5938 38 A4               334     .db     0x38, 0xA4
   593A FF                  335     .db     patrol_invalid_move_x
   593B 3D 59               336     .dw     _patrol_l17_03_02
   593D                     337 _patrol_l17_03_02:
   593D 38 7C               338     .db     0x38, 0x7C
   593F 34 7C               339     .db     0x34, 0x7C
   5941 FF                  340     .db     patrol_invalid_move_x
   5942 2B 59               341     .dw     _patrol_l17_03
                            342 
   5944                     343 _patrol_l18_01::
   5944 2B 2C               344     .db     0x2B, 0x2C
   5946 17 2C               345     .db     0x17, 0x2C
   5948 FF                  346     .db     patrol_invalid_move_x
   5949 44 59               347     .dw     _patrol_l18_01
                            348 
   594B                     349 _patrol_l18_02::
   594B 02 54               350     .db     0x02, 0x54
   594D 02 7C               351     .db     0x02, 0x7C
   594F FF                  352     .db     patrol_invalid_move_x
   5950 52 59               353     .dw     _patrol_l18_02_01
   5952                     354 _patrol_l18_02_01:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   5952 02 7C               355     .db     0x02, 0x7C
   5954 09 7C               356     .db     0x09, 0x7C
   5956 02 7C               357     .db     0x02, 0x7C
   5958 02 54               358     .db     0x02, 0x54
   595A FF                  359     .db     patrol_invalid_move_x
   595B 5D 59               360     .dw     _patrol_l18_02_02
   595D                     361 _patrol_l18_02_02:
   595D 02 54               362     .db     0x02, 0x54
   595F 14 54               363     .db     0x14, 0x54
   5961 FF                  364     .db     patrol_invalid_move_x
   5962 4B 59               365     .dw     _patrol_l18_02
                            366 
   5964                     367 _patrol_l18_03::
   5964 37 A4               368     .db     0x37, 0xA4
   5966 16 A4               369     .db     0x16, 0xA4
   5968 16 7C               370     .db     0x16, 0x7C
   596A FF                  371     .db     patrol_invalid_move_x
   596B 6D 59               372     .dw     _patrol_l18_03_01
   596D                     373 _patrol_l18_03_01:
   596D 16 7C               374     .db     0x16, 0x7C
   596F 14 7C               375     .db     0x14, 0x7C
   5971 16 7C               376     .db     0x16, 0x7C
   5973 16 A4               377     .db     0x16, 0xA4
   5975 FF                  378     .db     patrol_invalid_move_x
   5976 78 59               379     .dw     _patrol_l18_03_02
   5978                     380 _patrol_l18_03_02:
   5978 16 A4               381     .db     0x16, 0xA4
   597A 2C A4               382     .db     0x2C, 0xA4
   597C FF                  383     .db     patrol_invalid_move_x
   597D 64 59               384     .dw     _patrol_l18_03
                            385 
   597F                     386 _patrol_l19_01::
   597F 10 54               387     .db     0x10, 0x54
   5981 1E 54               388     .db     0x1E, 0x54
   5983 1E 40               389     .db     0x1E, 0x40
   5985 1E 54               390     .db     0x1E, 0x54
   5987 FF                  391     .db     patrol_invalid_move_x
   5988 8A 59               392     .dw     _patrol_l19_01_1
   598A                     393 _patrol_l19_01_1:
   598A 1E 54               394     .db     0x1E, 0x54
   598C 10 54               395     .db     0x10, 0x54
   598E FF                  396     .db     patrol_invalid_move_x
   598F 7F 59               397     .dw     _patrol_l19_01
                            398 
   5991                     399 _patrol_l19_02::
   5991 1E 7C               400     .db     0x1E, 0x7C
   5993 2C 7C               401     .db     0x2C, 0x7C
   5995 2C 54               402     .db     0x2C, 0x54
   5997 24 54               403     .db     0x24, 0x54
   5999 32 54               404     .db     0x32, 0x54
   599B 2C 54               405     .db     0x2C, 0x54
   599D 2C 7C               406     .db     0x2C, 0x7C
   599F FF                  407     .db     patrol_invalid_move_x
   59A0 A2 59               408     .dw     _patrol_l19_02_1
   59A2                     409 _patrol_l19_02_1:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   59A2 2C 7C               410     .db     0x2C, 0x7C
   59A4 1E 7C               411     .db     0x1E, 0x7C
   59A6 FF                  412     .db     patrol_invalid_move_x
   59A7 91 59               413     .dw     _patrol_l19_02
                            414 
   59A9                     415 _patrol_l19_03::
   59A9 45 A4               416     .db     0x45, 0xA4
   59AB 34 A4               417     .db     0x34, 0xA4
   59AD 34 7C               418     .db     0x34, 0x7C
   59AF 42 7C               419     .db     0x42, 0x7C
   59B1 34 7C               420     .db     0x34, 0x7C
   59B3 34 A4               421     .db     0x34, 0xA4
   59B5 FF                  422     .db     patrol_invalid_move_x
   59B6 B8 59               423     .dw     _patrol_l19_03_1
   59B8                     424 _patrol_l19_03_1:
   59B8 34 A4               425     .db     0x34, 0xA4
   59BA 45 A4               426     .db     0x45, 0xA4
   59BC FF                  427     .db     patrol_invalid_move_x
   59BD A9 59               428     .dw     _patrol_l19_03
                            429 
                            430 
   59BF                     431 _patrol_l20_01::
   59BF 18 7C               432     .db     0x18, 0x7C
   59C1 18 54               433     .db     0x18, 0x54
   59C3 FF                  434     .db     patrol_invalid_move_x
   59C4 C6 59               435     .dw     _patrol_l20_01_01
   59C6                     436 _patrol_l20_01_01:
   59C6 18 54               437     .db     0x18, 0x54
   59C8 23 54               438     .db     0x23, 0x54
   59CA 18 54               439     .db     0x18, 0x54
   59CC 18 7C               440     .db     0x18, 0x7C
   59CE FF                  441     .db     patrol_invalid_move_x
   59CF D1 59               442     .dw     _patrol_l20_01_02
   59D1                     443 _patrol_l20_01_02:
   59D1 18 7C               444     .db     0x18, 0x7C
   59D3 21 7C               445     .db     0x21, 0x7C
   59D5 FF                  446     .db     patrol_invalid_move_x
   59D6 BF 59               447     .dw     _patrol_l20_01
                            448 
   59D8                     449 _patrol_l20_02::
   59D8 3C 7C               450     .db     0x3C, 0x7C
   59DA 3C 54               451     .db     0x3C, 0x54
   59DC FF                  452     .db     patrol_invalid_move_x
   59DD DF 59               453     .dw     _patrol_l20_02_01
   59DF                     454 _patrol_l20_02_01:
   59DF 3C 54               455     .db     0x3C, 0x54
   59E1 2A 54               456     .db     0x2A, 0x54 ;; 0x38, 0x54
   59E3 3C 54               457     .db     0x3C, 0x54
   59E5 3C 7C               458     .db     0x3C, 0x7C
   59E7 FF                  459     .db     patrol_invalid_move_x
   59E8 EA 59               460     .dw     _patrol_l20_02_02
   59EA                     461 _patrol_l20_02_02:
   59EA 3C 7C               462     .db     0x3C, 0x7C
   59EC 2E 7C               463     .db     0x2E, 0x7C
   59EE FF                  464     .db     patrol_invalid_move_x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   59EF D8 59               465     .dw     _patrol_l20_02
                            466 
                            467 
   59F1                     468 _patrol_l20_03::
   59F1 26 A4               469     .db     0x26, 0xA4
   59F3 26 90               470     .db     0x26, 0x90
   59F5 FF                  471     .db     patrol_invalid_move_x
   59F6 F8 59               472     .dw     _patrol_l20_03_01
   59F8                     473 _patrol_l20_03_01:
   59F8 26 90               474     .db     0x26, 0x90
   59FA 26 A4               475     .db     0x26, 0xA4
   59FC FF                  476     .db     patrol_invalid_move_x
   59FD FF 59               477     .dw     _patrol_l20_03_02
   59FF                     478 _patrol_l20_03_02:
   59FF 26 A4               479     .db     0x26, 0xA4
   5A01 2B A4               480     .db     0x2B, 0xA4
   5A03 26 A4               481     .db     0x26, 0xA4
   5A05 FF                  482     .db     patrol_invalid_move_x
   5A06 08 5A               483     .dw     _patrol_l20_03_03
   5A08                     484 _patrol_l20_03_03:
   5A08 26 A4               485     .db     0x26, 0xA4
   5A0A 26 90               486     .db     0x26, 0x90
   5A0C 26 A4               487     .db     0x26, 0xA4
   5A0E FF                  488     .db     patrol_invalid_move_x
   5A0F 11 5A               489     .dw     _patrol_l20_03_04
   5A11                     490 _patrol_l20_03_04:
   5A11 26 A4               491     .db     0x26, 0xA4
   5A13 12 A4               492     .db     0x12, 0xA4
   5A15 FF                  493     .db     patrol_invalid_move_x
   5A16 F1 59               494     .dw     _patrol_l20_03
                            495 
   5A18                     496 man_patrol_init::
   5A18 C9            [10]  497 ret
