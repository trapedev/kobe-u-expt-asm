


; ----------------------------------------------------
; �t�B�{�i�b�`����v�Z (N=1�`10)
; ���ʂ�0x20�Ԓn����10�o�C�g�̗̈�Ɋi�[
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
COUNT   EQU 0x0C  ; �J�E���^
FIB1    EQU 0x0D  ; �t�B�{�i�b�`�� N-1
FIB2    EQU 0x0E  ; �t�B�{�i�b�`�� N-2
TEMP    EQU 0x0F  ; �ꎞ�I�Ȍv�Z�p

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h�� (���̗�ł͎g�p���Ȃ�)

    ORG 0x05
START:
    ; ������
    MOVLW   D'1'        ; �ŏ��̃t�B�{�i�b�`��
    MOVWF   FIB1
    CLRF    FIB2        ; 2�Ԗڂ̃t�B�{�i�b�`�� (0)
    MOVLW   D'1'        ; �J�E���^��1�ɐݒ�
    MOVWF   COUNT

    ; ���ʊi�[�J�n�A�h���X��ݒ�
    MOVLW   0x20
    MOVWF   FSR

LOOP:
    ; ���݂̃t�B�{�i�b�`�����i�[
    MOVF    FIB1, W
    MOVWF   INDF
    INCF    FSR, F      ; ���̃A�h���X�Ɉړ�

    ; ���̃t�B�{�i�b�`�����v�Z
    MOVF    FIB1, W
    ADDWF   FIB2, W
    MOVWF   TEMP        ; TEMP = FIB1 + FIB2
    
    ; FIB2 = FIB1, FIB1 = TEMP
    MOVF    FIB1, W
    MOVWF   FIB2
    MOVF    TEMP, W
    MOVWF   FIB1

    ; �J�E���^���C���N�������g
    INCF    COUNT, F
    MOVLW   D'11'       ; 11�ɂȂ�����I��
    SUBWF   COUNT, W
    BTFSS   STATUS, Z
    GOTO    LOOP

END