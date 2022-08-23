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

.include "sys/render.h.s"
.include "cpct_functions.h.s"
.include "man/entity.h.s"
.include "cpctelera.h.s"
.include "sys/physics.h.s"


m_front_buffer:  .db 0xC0
m_back_buffer:   .db 0x80


sys_render_handler::

    ld    	hl, #sys_render_update  ;;y se los mando al render
	ld		 a, #e_type_render		;; Se envía en A el tipo que queramos usar
	call  	man_entity_forall_matching

    ret


;;LIMPIA Y PREPARA UN NUEVO BUFFER
sys_render_newScene:
    call    sys_render_switchBuffers
    ;;call    ren_init_backBuffer
    ret

;;INTERCAMBIA LOS BUFFERS
;;REGISTROS DESTRUIDOS
sys_render_clearBackBuffer::

    ;;ld      a, (m_front_buffer)
    ;;ld      h, a
    ;;ld      de, #0
    ;;ld      bc, #0x4000
    ;;ld      l, e
;;
    ;;call    cpct_memset_f8_asm

    ld      hl, #0xC000
    ld      (hl), #0
    ld      de, #0xC000 + 1
    ld      bc, #0x4000 - 1
    ldir
    
ret

;; INICIALIZAMOS EL BACK BUFFER
;;
ren_init_backBuffer::
    ld      a, (m_back_buffer)
    ld      h, a
    ld      de, #0
    ld      bc, #0x4000
    ld      l, e

    call    cpct_memset_f8_asm

ret

sys_render_init::
    ld      c, #0
    call    cpct_setVideoMode_asm
    cpctm_setBorder_asm HW_BLACK
    ld      hl, #_main_palette
    ld      de, #16
    call    cpct_setPalette_asm

    ret

sys_render_switchBuffers:
    ld      a, (m_back_buffer)
    ld      b, a
    ld      a, (m_front_buffer)
    ld      (m_back_buffer),a
    ld      a,b 
    ld      (m_front_buffer),a

    srl     b        ;;con srl puedo desplazar cualquier registro (bit instructions), desplaza a la derecha
    srl     b
    ld      l,b
    jp      cpct_setVideoMemoryPage_asm


sys_render_update::

render_or:
    ld      de, #0xC000
    ld      c, e_x(ix) ;;eso significa ix + mas la distancia de y      ;;cargo en b la posicion Y de la entidad
    ld      b, e_y(ix)
    call    cpct_getScreenPtr_asm 

    ;; HL = Videoman
    ;;push    hl ; 4 segundos
    ;;poop    de ; 3 s
    ex      de, hl ; 1s los cambia

    ld      l, #0xB6
    call    cpct_setBlendMode_asm
    
    ld      l, e_sprite(ix)
    ld      h, e_sprite+1(ix)
    ;;ld      b, e_h(ix)
    ;;ld      c, e_w(ix)
    ;;call    cpct_drawSprite_asm
    ld      c, e_h(ix)
    ld      b, e_w(ix)
    call    cpct_drawSpriteBlended_asm

    ;; Comprobamos si la entidad tiene e_type_physics, ya que si no tiene solo pintamos
    ;; una vez y eliminamos el e_type_render de la entidad

    ld      a, e_type(ix)
    and     #e_type_physics
    ret     nz

    ld      a, e_type(ix)
    sub     #e_type_render
    ld      e_type(ix), a

    ret


;; UPDATE/DELETE
;;      Pinta con XOR el sprite en la posición anterior por tanto lo elimina
;;
update_XOR_borrar_IX::

    ld      l, #0xAE
    call    cpct_setBlendMode_asm

    ld      de, #0xC000
    ld      c, e_x(ix) ;;eso significa ix + mas la distancia de y      ;;cargo en b la posicion Y de la entidad
    ld      b, e_y(ix)
    call    cpct_getScreenPtr_asm

    ex      de, hl

    ld      l, e_sprite(ix)
    ld      h, e_sprite+1(ix)
    ld      c, e_h(ix)
    ld      b, e_w(ix)
    call    cpct_drawSpriteBlended_asm

    ret

;; UPDATE/DELETE
;;      Pinta con XOR el sprite en la posición en la que está
;;
update_XOR_borrar_IY::

delete_normal:
    ld      l, #0xAE
    call    cpct_setBlendMode_asm

    ld      de, #0xC000
    ld      c, e_x(iy) ;;eso significa ix + mas la distancia de y      ;;cargo en b la posicion Y de la entidad
    ld      b, e_y(iy)
    call    cpct_getScreenPtr_asm

    ex      de, hl

    ld      l, e_sprite(iy)
    ld      h, e_sprite+1(iy)
    ld      c, e_h(iy)
    ld      b, e_w(iy)
    call    cpct_drawSpriteBlended_asm

    ret    
