


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �萔��`
RESULT_ADDR EQU 0x30   ; ���ʂ��i�[����A�h���X
MAX_NUM     EQU 0x0A   ; ���v����ő吔�i10�j

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; ���荞�݃n���h���i�K�v�ȏꍇ�j

START:
    ; ���v��ۑ����郌�W�X�^��������
    CLRF    0x20    ; 0x20�����v�̉��ʃo�C�g�Ƃ��Ďg�p
    CLRF    0x21    ; 0x21�����v�̏�ʃo�C�g�Ƃ��Ďg�p�i�I�[�o�[�t���[�΍�j

    ; �J�E���^���������i1����J�n�j
    MOVLW   0x01
    MOVWF   0x22    ; 0x22���J�E���^�Ƃ��Ďg�p

SUM_LOOP:
    ; ���݂̐������v�ɉ��Z
    MOVF    0x22, W
    ADDWF   0x20, F
    BTFSC   STATUS, C    ; �L�����[�����������ꍇ
    INCF    0x21, F      ; ��ʃo�C�g���C���N�������g

    ; �J�E���^���C���N�������g
    INCF    0x22, F

    ; �J�E���^���ő吔�i10�j�ɒB�������`�F�b�N
    MOVF    0x22, W
    XORLW   MAX_NUM + 1
    BTFSS   STATUS, Z
    GOTO    SUM_LOOP

    ; ���ʂ�0x30�Ԓn�Ɋi�[�i���ʃo�C�g�̂݁j
    MOVF    0x20, W
    MOVWF   RESULT_ADDR

END