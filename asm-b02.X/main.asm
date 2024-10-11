


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �萔��`
START_ADDR  EQU 0x20   ; �J�n�A�h���X
MEM_SIZE    EQU 0x0A   ; �i�[���郁�����T�C�Y�i10�o�C�g�j

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h���i�K�v�ȏꍇ�j

START:
    ; FSR���W�X�^�ɊJ�n�A�h���X��ݒ�
    MOVLW   START_ADDR
    MOVWF   FSR

    ; �i�[����l���������i1����J�n�j
    MOVLW   0x01
    MOVWF   0x0C    ; 0x0C�����݂̒l�Ƃ��Ďg�p

    ; �i�[����񐔂��J�E���g���郌�W�X�^��������
    MOVLW   MEM_SIZE
    MOVWF   0x0D    ; 0x0D���J�E���^�Ƃ��Ďg�p

STORE_LOOP:
    ; ���݂̒l���������Ɋi�[
    MOVF    0x0C, W
    MOVWF   INDF

    ; FSR���C���N�������g
    INCF    FSR, F

    ; �i�[����l���C���N�������g
    INCF    0x0C, F

    ; �J�E���^���f�N�������g
    DECFSZ  0x0D, F
    GOTO    STORE_LOOP

END