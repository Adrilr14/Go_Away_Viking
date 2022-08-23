;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module key
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _key_sp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_key_sp:
	.db #0x11	; 17
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x33	; 51	'3'
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x33	; 51	'3'
	.area _INITIALIZER
	.area _CABS (ABS)
