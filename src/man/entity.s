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

.include "man/entity.h.s"
.include "cpctelera.h.s"
.include "man/menu.h.s"
.include "man/levels.h.s"
.include "cpct_functions.h.s"
.include "sys/render.h.s"

;;entity_vector:
;;DefineNEntities entity_vector, max_entities


;;m_num_entities::        .db 0
type_match::            .db 0
type_pairs::            .db 0
type_ladder_invisble::  .db 0

;;m_entities::
m_first_entity_free:: .dw m_entity_array
m_entity_array:: .ds max_entities * sizeof_e
m_end_array:: .db 0     ;; Ponemos un byte a 0 al final de nuestro array de entidades y así comprobamos que es el final


man_entity_getEntityVector_IX::
    ld      ix, #m_entity_array
    ret

;; GET ENTITY HERO
;;      Devuelve en IY la dirección de memoria de la entidad hero 
man_entity_getEntity_hero_IY::
    ;; La entidad hero siempre es la primera
    ld      iy, #m_entity_array
    ret


man_entity_init::
;;1st free entity at the start od entities storage
    ld      hl, #m_entity_array
    ld      (m_first_entity_free), hl
    ;; 1st free entity with a 0 as first byte (no-entity.......)
    ld      (hl), #0
    ret

;; CREATE ALL ENTITIES OF THE LEVEL
;;      HL: Pointer to the entities level
;;       A: Number of entities
man_entity_create::

    ;;cp      #1
    ;;jr      z, create_entities_l1

    ld      a, (num_level)
    cp      #2
    jr      z, create_entities_l2
 
    cp      #3
    jr      z, create_entities_l3

    cp      #4
    jr      z, create_entities_l4

    cp      #5
    jr      z, create_entities_l5

    cp      #6
    jr      z, create_entities_l6

    cp      #7
    jr      z, create_entities_l7

    cp      #8
    jp      z, create_entities_l8

    cp      #9
    jp      z, create_entities_l9

    cp      #10
    jp      z, create_entities_l10

    cp      #11
    jp      z, create_entities_l11

    cp      #12
    jp      z, create_entities_l12

    cp      #13
    jp      z, create_entities_l13

    cp      #14
    jp      z, create_entities_l14

    cp      #15
    jp      z, create_entities_l15

    cp      #16
    jp      z, create_entities_l16

    cp      #17
    jp      z, create_entities_l17

    cp      #18
    jp      z, create_entities_l18

    cp      #19
    jp      z, create_entities_l19

    cp      #20
    jp      z, create_entities_l20

create_entities_l1:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l1
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l2:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l2
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l3:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l3
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l4:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l4
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l5:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l5
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l6:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l6
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l7:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l7
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l8:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l8
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l9:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l9
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l10:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l10
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l11:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l11
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l12:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l12
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l13:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l13
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l14:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l14
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l15:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l15
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l16:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l16
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l17:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l17
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l18:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l18
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l19:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l19
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

create_entities_l20:
    ld      de, (m_first_entity_free)
    ld      bc, #sizeof_e * num_entities_l20
    ldir    ;;coge lo que hay en hl, lo copia de uno a uno en de, el numero de veces que tenga bc  -->esto lo hace memcpy
    ret

;;DESTROY ALL ENTITIES
;;
man_entity_destroy::

    ld      hl, #m_entity_array
    ld      (hl), #0
    ld      de, #m_entity_array + 1
    ld      bc, #max_entities * sizeof_e - 1
    ldir

ret

;;CALL A FUNCTION FOR ALL ENTITIES
;;      HL: Pointer to the function to be called
;;      IMPORTANT: Function at HL must preserve IX

man_entity_forall::
    ld      (update_call), hl      ;; set function to be.....
    ld      ix, #m_entity_array   ;; IX points to first

    ;;check if entity is valid
    ;; if this first byte = 0, its not a valid entity
next_entity:
    ld      a, e_type(ix)
    or      a 
    ret     z

    ;;Entity is valid, call the function
update_call = .+1
    call    update_call

    ;;Point to next entity and repeat
    ld      bc, #sizeof_e
    add     ix, bc
    jr      next_entity


;;CALL A FUNCTION FOR ALL ENTITIES WITH A SPECIFIC TYPE
;;      HL: Pointer to the function to be called
;;       A: Type to match
;;      IMPORTANT: Function at HL must preserve IX
man_entity_forall_matching::

    ld      (type_match), a
    ld      (update_call_match), hl      ;; set function to be.....
    ld      ix, #m_entity_array   ;; IX points to first
    
    ;;check if entity is valid
    ;; if this first byte = 0, its not a valid entity
next_entity_match:
    ld      a, e_type(ix)
    or      #e_type_invalid        ;; También se puede comprobar con a
    ret     z

    ld      a, (type_match)
    ld      b, a
    ld      a, e_type(ix)
    and     b
    jr      z, next_one

    ;;Entity is valid, call the function
update_call_match = .+1
    call    update_call_match

next_one:
    ;;Point to next entity and repeat
    ld      bc, #sizeof_e
    add     ix, bc
    jr      next_entity_match

;CALL A FUNCTION FOR A PAIR OF ENTITIES
;;      HL: Pointer to the function to be called
;;       A: Type to match
;;      IMPORTANT: Function at HL must preserve IX and IY
man_entity_forall_pairs_matching::

    ld      (type_pairs), a
    ld      (update_call_pairs), hl      ;; set function to be.....
    ld      ix, #m_entity_array   ;; IX points to first
    
    ;;check if entity is valid
    ;; if this first byte = 0, its not a valid entity
next_first_entity:
    ld      a, e_type(ix)
    or      #e_type_invalid        ;; También se puede comprobar con a
    ret     z

    ld      a, (type_pairs)
    ld      b, a
    ld      a, e_type(ix)
    and     b
    jr      z, next_first_one

    ld__e_ixl
    ld__d_ixh
    ld__iyl_e
    ld__iyh_d
    ld      bc, #sizeof_e
    add     iy, bc

next_second_entity:
    ld      a, e_type(iy)
    or      #e_type_invalid        ;; También se puede comprobar con a
    jr      z, next_first_one

    ld      a, (type_pairs)
    ld      b, a
    ld      a, e_type(ix)
    and     b
    
    jr      z, next_second_one
    ;;Entity is valid, call the function
    
update_call_pairs = .+1
    call    update_call_pairs

next_second_one:
    ;;Point to next entity and repeat
    ld      bc, #sizeof_e
    add     iy, bc
    jr      next_second_entity

next_first_one:
    ;;Point to next entity and repeat
    ld      bc, #sizeof_e
    add     ix, bc
    jr      next_first_entity


;;CALL A FUNCTION FOR ALL ENTITIES LADDERS
;;      HL: Pointer to the function to be called
;;       A: Type to match
;;      IMPORTANT: Function at HL must preserve IX
;;
man_entity_ladder_invisible_matching::
    ld      (type_ladder_invisble), a
    ld      (comprobar_x), hl      ;; set function to be.....
    ld      iy, #m_entity_array   ;; IX points to first
    
    ;;check if entity is valid
    ;; if this first byte = 0, its not a valid entity
next_ladder_invisible_match:
    ld      a, e_type(iy)
    or      #e_type_invalid        ;; También se puede comprobar con a
    ret     z

    ld      a, (type_ladder_invisble)
    ld      b, a
    ld      a, e_object(iy)
    and     b
    jr      z, next_ladder_invisible

    ;;Entity is valid, call the function
comprobar_x = .+1
    call    comprobar_x

next_ladder_invisible:
    ;;Point to next entity and repeat
    ld      bc, #sizeof_e
    add     iy, bc
    jr      next_ladder_invisible_match
