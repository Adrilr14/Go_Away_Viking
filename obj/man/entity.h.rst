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
                     0011    55 num_entities_l15 = 17
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



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
                     0040   110 e_object_key                            = 0x40
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



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
