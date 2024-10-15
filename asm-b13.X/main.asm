


; ----------------------------------------------------
; 4bit���x�̐����l�̐ς��v�Z���A0x30-0x3F�Ɋi�[����v���O����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; �t�@�C�����W�X�^�}�b�v�̒�`
N       EQU 0x0C  ; �搔N
M       EQU 0x0D  ; �搔M
RESULT  EQU 0x0E  ; ���ʂ̉��ʃo�C�g
RESULT_H EQU 0x0F ; ���ʂ̏�ʃo�C�g
COUNTER EQU 0x10  ; �J�E���^�[

ORG 0x00
GOTO START

ORG 0x20

START:
    ; ������
    CLRF RESULT
    CLRF RESULT_H
    MOVLW D'4'    ; 4�r�b�g���x�Ȃ̂�4�񃋁[�v
    MOVWF COUNTER
    
    ; N��5, 7, 11, 13�̂����ꂩ��ݒ�
    MOVLW D'5'    ; ��Ƃ���5���g�p
    MOVWF N
    
    ; M��5, 7, 11, 13�̂����ꂩ��ݒ�
    MOVLW D'7'    ; ��Ƃ���7���g�p
    MOVWF M

MULTIPLY:
    RRF M, F      ; M�̍ŉ��ʃr�b�g���L�����[��
    BTFSS STATUS, C
    GOTO SKIP_ADD
    
    ; �L�����[��1�̏ꍇ�AN�����ʂɉ��Z
    MOVF N, W
    ADDWF RESULT, F
    BTFSC STATUS, C
    INCF RESULT_H, F

SKIP_ADD:
    RLF N, F      ; N�����V�t�g
    BTFSC STATUS, C
    INCF RESULT_H, F
    
    DECFSZ COUNTER, F
    GOTO MULTIPLY

    ; ���ʂ�0x30-0x3F�Ɋi�[
    MOVLW 0x30
    MOVWF FSR
    MOVF RESULT, W
    MOVWF INDF
    INCF FSR, F
    MOVF RESULT_H, W
    MOVWF INDF

    ; �c���14�o�C�g���N���A
    MOVLW D'14'
    MOVWF COUNTER
CLEAR_LOOP:
    INCF FSR, F
    CLRF INDF
    DECFSZ COUNTER, F
    GOTO CLEAR_LOOP

END