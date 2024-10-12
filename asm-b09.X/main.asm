


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
num1_high EQU 0x0C  ; 1�ڂ̐��̏�ʃo�C�g
num1_low  EQU 0x0D  ; 1�ڂ̐��̉��ʃo�C�g
num2_high EQU 0x0E  ; 2�ڂ̐��̏�ʃo�C�g
num2_low  EQU 0x0F  ; 2�ڂ̐��̉��ʃo�C�g
result_high EQU 0x10 ; ���ʂ̏�ʃo�C�g
result_low  EQU 0x11 ; ���ʂ̉��ʃo�C�g

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x20

START:
    ; �����l�̐ݒ�
    MOVLW 0x12
    MOVWF num1_high
    MOVLW 0x34
    MOVWF num1_low

    MOVLW 0xAB
    MOVWF num2_high
    MOVLW 0xCD
    MOVWF num2_low

    ; 16�r�b�g���Z
    ; �܂����ʃo�C�g�����Z
    MOVF num1_low, W
    ADDWF num2_low, W
    MOVWF result_low

    ; ���ɏ�ʃo�C�g�����Z�i�L�����[���l���j
    MOVF num1_high, W
    BTFSC STATUS, C  ; �L�����[�t���O���Z�b�g����Ă���΁A1�����Z
    INCF num1_high, W
    ADDWF num2_high, W
    MOVWF result_high

    END