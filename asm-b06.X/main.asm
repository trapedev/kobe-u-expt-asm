; 学籍番号 氏名
; 0x20-0x2Fの最大値と最小値を求めるプログラム

LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; メモリ領域の定義
START_ADDR  EQU 0x20   ; 開始アドレス
END_ADDR    EQU 0x2F   ; 終了アドレス
MAX_ADDR    EQU 0x4E   ; 最大値格納アドレス
MIN_ADDR    EQU 0x4F   ; 最小値格納アドレス

    ORG 0x00
    GOTO MAIN

    ORG 0x04
    RETFIE  ; 割り込み処理（使用しない）

MAIN
    ; メモリ領域の初期化（簡単な値を設定）
    MOVLW START_ADDR
    MOVWF FSR
    MOVLW 0x01
INIT_LOOP
    MOVWF INDF
    INCF FSR, F
    ADDLW 0x01
    MOVLW END_ADDR + 1
    XORWF FSR, W
    BTFSS STATUS, Z
    GOTO INIT_LOOP

    ; 最大値と最小値の初期化
    MOVLW START_ADDR
    MOVWF FSR
    MOVF INDF, W
    MOVWF MAX_ADDR
    MOVWF MIN_ADDR

    ; 最大値と最小値の検索
    INCF FSR, F
FIND_LOOP
    MOVF INDF, W
    ; 最大値の比較
    SUBWF MAX_ADDR, W
    BTFSC STATUS, C
    GOTO CHECK_MIN
    MOVF INDF, W
    MOVWF MAX_ADDR
CHECK_MIN
    ; 最小値の比較
    MOVF MIN_ADDR, W
    SUBWF INDF, W
    BTFSC STATUS, C
    GOTO NEXT
    MOVF INDF, W
    MOVWF MIN_ADDR
NEXT
    INCF FSR, F
    MOVLW END_ADDR + 1
    XORWF FSR, W
    BTFSS STATUS, Z
    GOTO FIND_LOOP

END_LOOP
    GOTO END_LOOP  ; 無限ループ

    END