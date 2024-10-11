


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
VAL1    EQU 0x0C   ; 1つ目の値を格納するアドレス
VAL2    EQU 0x0D   ; 2つ目の値を格納するアドレス
RESULT  EQU 0x10   ; 結果を格納する開始アドレス

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ（必要な場合）

START:
    ; 値の初期化
    MOVLW   0x34
    MOVWF   VAL1
    MOVLW   0x56
    MOVWF   VAL2

    ; FSRに結果格納開始アドレスをセット
    MOVLW   RESULT
    MOVWF   FSR

    ; 加算
    MOVF    VAL1, W
    ADDWF   VAL2, W
    MOVWF   INDF
    INCF    FSR, F

    ; 減算
    MOVF    VAL2, W
    SUBWF   VAL1, W
    MOVWF   INDF
    INCF    FSR, F

    ; 論理和
    MOVF    VAL1, W
    IORWF   VAL2, W
    MOVWF   INDF
    INCF    FSR, F

    ; 排他的論理和
    MOVF    VAL1, W
    XORWF   VAL2, W
    MOVWF   INDF

END