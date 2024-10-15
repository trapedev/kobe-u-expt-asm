


; ----------------------------------------------------
; �w�Дԍ� ����
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; �t�@�C�����W�X�^�}�b�v�̒�`
result  EQU 0x4F  ; ���ʂ��i�[����A�h���X (0x4F)
counter EQU 0x0C  ; �J�E���^�p
temp    EQU 0x0D  ; �ꎞ�I�Ȓl��ۑ�

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x20
    ; �e�X�g�f�[�^�̏����� (16�o�C�g)
    DB 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
    DB 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10

START:
    CLRF result   ; ���ʂ�0�ŏ����� (0x4F�Ԓn)
    MOVLW 0x20    ; �J�n�A�h���X
    MOVWF FSR     ; FSR�ɊJ�n�A�h���X���Z�b�g
    MOVLW 16      ; ���[�v��
    MOVWF counter ; �J�E���^��16�ɐݒ�

LOOP:
    MOVF INDF, W  ; INDF����l��ǂݎ��
    MOVWF temp    ; �ꎞ�I�ɕۑ�
    BTFSS temp, 0 ; �ŉ��ʃr�b�g��1�i��j���`�F�b�N
    GOTO NEXT     ; �����Ȃ�X�L�b�v
    
    ADDWF result, F ; ��Ȃ猋�ʂɉ��Z (0x4F�Ԓn�ɒ��ډ��Z)

NEXT:
    INCF FSR, F   ; ���̃A�h���X��
    DECFSZ counter, F ; �J�E���^���f�N�������g�A0�ɂȂ�����I��
    GOTO LOOP     ; �J�E���^��0�łȂ���΃��[�v���s

END