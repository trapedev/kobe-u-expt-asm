


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �v���O�����̊J�n
ORG 0x00
GOTO START

; ----------------------------------------------------
; ���C���v���O����
ORG 0x20
START:
    ; 0x10�Ԓn����n�܂�̈�� "Hello" ���i�[
    MOVLW 0x48
    MOVWF 0x10
    MOVLW 0x65
    MOVWF 0x11
    MOVLW 0x6C
    MOVWF 0x12
    MOVLW 0x6C
    MOVWF 0x13
    MOVLW 0x6F
    MOVWF 0x14

    ; 0x20�Ԓn����n�܂�̈�� "World" ���i�[
    MOVLW 0x57
    MOVWF 0x20
    MOVLW 0x6F
    MOVWF 0x21
    MOVLW 0x72
    MOVWF 0x22
    MOVLW 0x6C
    MOVWF 0x23
    MOVLW 0x64
    MOVWF 0x24

    ; �v���O�����̏I��
    END