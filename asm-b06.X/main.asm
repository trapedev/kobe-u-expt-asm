; �w�Дԍ� ����
; 0x20-0x2F�̍ő�l�ƍŏ��l�����߂�v���O����

LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; �������̈�̒�`
START_ADDR  EQU 0x20   ; �J�n�A�h���X
END_ADDR    EQU 0x2F   ; �I���A�h���X
MAX_ADDR    EQU 0x4E   ; �ő�l�i�[�A�h���X
MIN_ADDR    EQU 0x4F   ; �ŏ��l�i�[�A�h���X

    ORG 0x00
    GOTO MAIN

    ORG 0x04
    RETFIE  ; ���荞�ݏ����i�g�p���Ȃ��j

MAIN
    ; �������̈�̏������i�ȒP�Ȓl��ݒ�j
    MOVLW START_ADDR
    MOVWF FSR
    MOVLW 0x01
INIT_LOOP
    MOVWF INDF
    INCF FSR, F
    ADDLW 0x01
    MOVLW END_ADDR + 1
    XORWF FSR, W
    BTFSS STATUS, Z
    GOTO INIT_LOOP

    ; �ő�l�ƍŏ��l�̏�����
    MOVLW START_ADDR
    MOVWF FSR
    MOVF INDF, W
    MOVWF MAX_ADDR
    MOVWF MIN_ADDR

    ; �ő�l�ƍŏ��l�̌���
    INCF FSR, F
FIND_LOOP
    MOVF INDF, W
    ; �ő�l�̔�r
    SUBWF MAX_ADDR, W
    BTFSC STATUS, C
    GOTO CHECK_MIN
    MOVF INDF, W
    MOVWF MAX_ADDR
CHECK_MIN
    ; �ŏ��l�̔�r
    MOVF MIN_ADDR, W
    SUBWF INDF, W
    BTFSC STATUS, C
    GOTO NEXT
    MOVF INDF, W
    MOVWF MIN_ADDR
NEXT
    INCF FSR, F
    MOVLW END_ADDR + 1
    XORWF FSR, W
    BTFSS STATUS, Z
    GOTO FIND_LOOP

END_LOOP
    GOTO END_LOOP  ; �������[�v

    END