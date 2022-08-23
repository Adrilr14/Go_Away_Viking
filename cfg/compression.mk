##-----------------------------LICENSE NOTICE------------------------------------
##  This file is part of CPCtelera: An Amstrad CPC Game Engine 
##  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU Lesser General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##------------------------------------------------------------------------------
############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic compression utilities                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate the generation of          ##
## compressed files and their inclusion in users' projects.               ##
############################################################################

## COMPRESSION EXAMPLE (Uncomment lines to use)
##

## First 3 calls to ADD2PACK add enemy, hero and background
## graphics (previously converted to binary data) into the 
## compressed group 'mygraphics'. After that, call to PACKZX7B
## compresses all the data and generates an array with the result
## that is placed in src/mygraphics.c & src/mygraphics.h, ready
## to be included and used by other modules.
##
#$(eval $(call ADD2PACK,mygraphics,gfx/enemy.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/hero.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/background.bin))
#$(eval $(call PACKZX7B,mygraphics,src/))

$(eval $(call ADD2PACK,screenmenu_c,src/assets/screen/menu.bin))
$(eval $(call PACKZX7B,screenmenu_c,src/assets/screen/))

#$(eval $(call ADD2PACK,level0,src/assets/tilemaps/level0.bin))
#$(eval $(call PACKZX7B,level0,src/assets/levels/))

$(eval $(call ADD2PACK,level1,src/assets/tilemaps/level1.bin))
$(eval $(call PACKZX7B,level1,src/assets/levels/))

$(eval $(call ADD2PACK,level2,src/assets/tilemaps/level2.bin))
$(eval $(call PACKZX7B,level2,src/assets/levels/))

$(eval $(call ADD2PACK,level3,src/assets/tilemaps/level3.bin))
$(eval $(call PACKZX7B,level3,src/assets/levels/))

$(eval $(call ADD2PACK,level4,src/assets/tilemaps/level4.bin))
$(eval $(call PACKZX7B,level4,src/assets/levels/))

$(eval $(call ADD2PACK,level5,src/assets/tilemaps/level5.bin))
$(eval $(call PACKZX7B,level5,src/assets/levels/))

$(eval $(call ADD2PACK,level6,src/assets/tilemaps/level6.bin))
$(eval $(call PACKZX7B,level6,src/assets/levels/))

$(eval $(call ADD2PACK,level7,src/assets/tilemaps/level7.bin))
$(eval $(call PACKZX7B,level7,src/assets/levels/))

$(eval $(call ADD2PACK,level8,src/assets/tilemaps/level8.bin))
$(eval $(call PACKZX7B,level8,src/assets/levels/))

$(eval $(call ADD2PACK,level9,src/assets/tilemaps/level9.bin))
$(eval $(call PACKZX7B,level9,src/assets/levels/))

$(eval $(call ADD2PACK,level10,src/assets/tilemaps/level10.bin))
$(eval $(call PACKZX7B,level10,src/assets/levels/))

$(eval $(call ADD2PACK,level11,src/assets/tilemaps/level11.bin))
$(eval $(call PACKZX7B,level11,src/assets/levels/))

$(eval $(call ADD2PACK,level12,src/assets/tilemaps/level12.bin))
$(eval $(call PACKZX7B,level12,src/assets/levels/))

$(eval $(call ADD2PACK,level13,src/assets/tilemaps/level13.bin))
$(eval $(call PACKZX7B,level13,src/assets/levels/))

$(eval $(call ADD2PACK,level14,src/assets/tilemaps/level14.bin))
$(eval $(call PACKZX7B,level14,src/assets/levels/))

$(eval $(call ADD2PACK,level15,src/assets/tilemaps/level15.bin))
$(eval $(call PACKZX7B,level15,src/assets/levels/))

$(eval $(call ADD2PACK,level16,src/assets/tilemaps/level16.bin))
$(eval $(call PACKZX7B,level16,src/assets/levels/))

$(eval $(call ADD2PACK,level17,src/assets/tilemaps/level17.bin))
$(eval $(call PACKZX7B,level17,src/assets/levels/))

$(eval $(call ADD2PACK,level18,src/assets/tilemaps/level18.bin))
$(eval $(call PACKZX7B,level18,src/assets/levels/))

$(eval $(call ADD2PACK,level19,src/assets/tilemaps/level19.bin))
$(eval $(call PACKZX7B,level19,src/assets/levels/))

$(eval $(call ADD2PACK,level20,src/assets/tilemaps/level20.bin))
$(eval $(call PACKZX7B,level20,src/assets/levels/))
############################################################################
##              DETAILED INSTRUCTIONS AND PARAMETERS                      ##
##------------------------------------------------------------------------##
##                                                                        ##
## Macros used for compression are ADD2PACK and PACKZX7B:                 ##
##                                                                        ##
##	ADD2PACK: Adds files to packed (compressed) groups. Each call to this ##
##  		  macro will add a file to a named compressed group.          ##
##  PACKZX7B: Compresses all files in a group into a single binary and    ##
##            generates a C-array and a header to comfortably use it from ##
##            inside your code.                                           ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call ADD2PACK,<packname>,<file>))                            ##
##                                                                        ##
##		Sequentially adds <file> to compressed group <packname>. Each     ##
## call to this macro adds a new <file> after the latest one added.       ##
## packname could be any valid C identifier.                              ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname): Name of the compressed group where the file will be added ##
##  (file)    : File to be added at the end of the compressed group       ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call PACKZX7B,<packname>,<dest_path>))                       ##
##                                                                        ##
##		Compresses all files in the <packname> group using ZX7B algorithm ##
## and generates 2 files: <packname>.c and <packname>.h that contain a    ##
## C-array with the compressed data and a header file for declarations.   ##
## Generated files are moved to the folder <dest_path>.                   ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname) : Name of the compressed group to use for packing          ##
##  (dest_path): Destination path for generated output files              ##
##                                                                        ##
############################################################################
##                                                                        ##
## Important:                                                             ##
##  * Do NOT separate macro parameters with spaces, blanks or other chars.##
##    ANY character you put into a macro parameter will be passed to the  ##
##    macro. Therefore ...,src/sprites,... will represent "src/sprites"   ##
##    folder, whereas ...,  src/sprites,... means "  src/sprites" folder. ##
##  * You can omit parameters by leaving them empty.                      ##
##  * Parameters (4) and (5) are optional and generally not required.     ##
############################################################################
