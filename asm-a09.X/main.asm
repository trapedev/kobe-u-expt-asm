


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �萔��`
START_ADDR EQU 0x10
END_ADDR   EQU 0x14

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h���i�K�v�ȏꍇ�j

START:
    ; FSR���W�X�^�ɊJ�n�A�h���X��ݒ�
    MOVLW START_ADDR
    MOVWF FSR

    ; 1��W���W�X�^�Ƀ��[�h
    MOVLW 0x01

    ; 0x10�Ԓn��1���i�[
    MOVWF INDF
    
    ; FSR���C���N�������g�i0x11�Ɉړ��j
    INCF FSR, F
    
    ; 0x11�Ԓn��1���i�[
    MOVWF INDF
    
    ; FSR���C���N�������g�i0x12�Ɉړ��j
    INCF FSR, F
    
    ; 0x12�Ԓn��1���i�[
    MOVWF INDF
    
    ; FSR���C���N�������g�i0x13�Ɉړ��j
    INCF FSR, F
    
    ; 0x13�Ԓn��1���i�[
    MOVWF INDF
    
    ; FSR���C���N�������g�i0x14�Ɉړ��j
    INCF FSR, F
    
    ; 0x14�Ԓn��1���i�[
    MOVWF INDF

END