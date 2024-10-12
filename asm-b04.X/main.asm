
    
    
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"
; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
mem10 EQU 0x10
mem11 EQU 0x11
mem20 EQU 0x20
mem21 EQU 0x21
mem25 EQU 0x25
mem29 EQU 0x29
mem0C EQU 0x0C
; ----------------------------------------------------
; --> ���߂�4��� (�󔒕��� 4 ���͂���) ����L�q
ORG 0x00 ; �v���O������������ 0x00 �Ԓn�Ɉȉ��̃R�[�h��z�u
RESET_VECTOR:
GOTO START ; START ���x���փW�����v
ORG 0x40 ; �v���O�����������̐擪�ɔz�u�����
; ���荞�݃x�N�^�p�̗̈�� 0x40byte ���m��.

START: ; ���x����1��ڂ���L�q
    ; �����l�̐ݒ�
    MOVLW 0x20
    MOVWF mem20
    MOVLW 0x21
    MOVWF mem21
    MOVLW 0x25
    MOVWF mem25
    MOVLW 0x29
    MOVWF mem29

    MOVLW 0x20        ; �R�s�[���̃A�h���X
    MOVWF mem0C
    MOVLW 0x30        ; �R�s�[��̃A�h���X
    MOVWF FSR
    MOVLW 0x00
    MOVWF INDF        ; 0x30 �Ԓn�� 0x00 ���i�[
    MOVLW D'10'       ; �J��Ԃ��� 10 �� (10 �i��)
    MOVWF mem10       ; mem10 �Ԓn�Ɋi�[

LOOP:
    MOVF mem0C, 0     ; mem0C �Ɋi�[����Ă���l
                      ; (0x21,0x22,0x23,..) �� W reg �Ɋi�[
    MOVWF FSR         ; ���̒l���A�h���X�Ƃ��ă��[�h
    MOVF INDF, 0      ; FSR �Ɋi�[����Ă���l�� W reg ��
                      ; �i�[
    MOVWF mem11       ; �R�s�[���̒l�� mem11 �Ԓn�Ɋi�[
    MOVLW 0x10
    ADDWF FSR, 1      ; FSR �̃A�h���X���R�s�[������R�s�[
                      ; ��֕ϊ� (10 �i��)
    MOVF mem11, 0     ; 0x11 �Ԓn�ɒu���Ă����l�� W reg �Ɋi�[
    MOVWF INDF        ; W reg �̒l�� FSR �Ɋi�[
    INCF FSR          ; FSR (�R�s�[��) �̃A�h���X���C���N�������g
    INCF mem0C        ; �R�s�[���A�h���X���C���N�������g
    DECFSZ mem10, 1   ; mem10 �̒l���f�N�������g���A���ʂ�
                      ; 0 �Ȃ�X�L�b�v
    GOTO LOOP         ; ���[�v�čs

END ; �v���O�����̏I��