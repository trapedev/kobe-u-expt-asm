


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; プログラムの開始
    ORG 0x00
    GOTO START

; ----------------------------------------------------
; メインプログラム
    ORG 0x20
START:
    ; 15を8bit精度の符号付き2進数で表し、0x10番地に格納
    MOVLW   D'15'       ; 15 (0000 1111 in binary)
    MOVWF   0x10

    ; -15を8bit精度の符号付き2進数で表し、0x11番地に格納
    MOVLW   D'241'      ; -15 (1111 0001 in binary, 2's complement)
    MOVWF   0x11

    ; プログラムの終了
    END