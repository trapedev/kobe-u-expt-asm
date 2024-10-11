


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
VAL1    EQU 0x0C   ; 1�ڂ̒l���i�[����A�h���X
VAL2    EQU 0x0D   ; 2�ڂ̒l���i�[����A�h���X
RESULT  EQU 0x10   ; ���ʂ��i�[����J�n�A�h���X

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h���i�K�v�ȏꍇ�j

START:
    ; �l�̏�����
    MOVLW   0x34
    MOVWF   VAL1
    MOVLW   0x56
    MOVWF   VAL2

    ; FSR�Ɍ��ʊi�[�J�n�A�h���X���Z�b�g
    MOVLW   RESULT
    MOVWF   FSR

    ; ���Z
    MOVF    VAL1, W
    ADDWF   VAL2, W
    MOVWF   INDF
    INCF    FSR, F

    ; ���Z
    MOVF    VAL2, W
    SUBWF   VAL1, W
    MOVWF   INDF
    INCF    FSR, F

    ; �_���a
    MOVF    VAL1, W
    IORWF   VAL2, W
    MOVWF   INDF
    INCF    FSR, F

    ; �r���I�_���a
    MOVF    VAL1, W
    XORWF   VAL2, W
    MOVWF   INDF

END