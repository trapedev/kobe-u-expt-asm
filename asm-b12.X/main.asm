


; ----------------------------------------------------
; 4bit�����̐όv�Z (N,M �� {5,7,11,13})
; ���ʂ�0x30�Ԓn����16�o�C�g�̗̈�Ɋi�[
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
N       EQU 0x0C  ; �搔N
M       EQU 0x0D  ; �搔M
RESULT  EQU 0x0E  ; �v�Z����
COUNTER EQU 0x0F  ; ���[�v�J�E���^
TEMP    EQU 0x10  ; �ꎞ�I�Ȍv�Z�p

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h�� (���̗�ł͎g�p���Ȃ�)

    ORG 0x05
START:
    ; ������
    MOVLW   0x30    ; ���ʊi�[�J�n�A�h���X
    MOVWF   FSR

    ; N,M�̒l�̃��X�g
    MOVLW   D'5'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'7'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'11'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'13'
    MOVWF   TEMP
    CALL    CALC_AND_STORE

    GOTO    $       ; �I���A�������[�v

; ----------------------------------------------------
; �eN�ɑ΂��đS�Ă�M�Ƃ̐ς��v�Z���i�[����֐�
CALC_AND_STORE:
    MOVWF   N
    
    MOVLW   D'5'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'7'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'11'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'13'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    RETURN

; ----------------------------------------------------
; N*M�̐ς��v�Z����֐�
MULTIPLY:
    CLRF    RESULT
    MOVF    M, W
    MOVWF   COUNTER

MULT_LOOP:
    MOVF    N, W
    ADDWF   RESULT, F
    DECFSZ  COUNTER, F
    GOTO    MULT_LOOP

    RETURN

END