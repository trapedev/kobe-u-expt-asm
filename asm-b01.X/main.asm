


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �萔��`
START_ADDR  EQU 0x20   ; �J�n�A�h���X
MEM_SIZE    EQU 0x0A   ; �N���A���郁�����T�C�Y�i10�o�C�g�j

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h���i�K�v�ȏꍇ�j

START:
    ; FSR���W�X�^�ɊJ�n�A�h���X��ݒ�
    MOVLW   START_ADDR
    MOVWF   FSR

    ; �N���A����񐔂��J�E���g���郌�W�X�^��������
    MOVLW   MEM_SIZE
    MOVWF   0x0C    ; �ėp���W�X�^0x0C���J�E���^�Ƃ��Ďg�p

CLEAR_LOOP:
    ; ���������N���A�i0���������ށj
    CLRF    INDF

    ; FSR���C���N�������g
    INCF    FSR, F

    ; �J�E���^���f�N�������g
    DECFSZ  0x0C, F
    GOTO    CLEAR_LOOP

END