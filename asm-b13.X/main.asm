


; ----------------------------------------------------
; 4bit精度の整数値の積を計算し、0x30-0x3Fに格納するプログラム
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ファイルレジスタマップの定義
N       EQU 0x0C  ; 乗数N
M       EQU 0x0D  ; 乗数M
RESULT  EQU 0x0E  ; 結果の下位バイト
RESULT_H EQU 0x0F ; 結果の上位バイト
COUNTER EQU 0x10  ; カウンター

ORG 0x00
GOTO START

ORG 0x20

START:
    ; 初期化
    CLRF RESULT
    CLRF RESULT_H
    MOVLW D'4'    ; 4ビット精度なので4回ループ
    MOVWF COUNTER
    
    ; Nに5, 7, 11, 13のいずれかを設定
    MOVLW D'5'    ; 例として5を使用
    MOVWF N
    
    ; Mに5, 7, 11, 13のいずれかを設定
    MOVLW D'7'    ; 例として7を使用
    MOVWF M

MULTIPLY:
    RRF M, F      ; Mの最下位ビットをキャリーに
    BTFSS STATUS, C
    GOTO SKIP_ADD
    
    ; キャリーが1の場合、Nを結果に加算
    MOVF N, W
    ADDWF RESULT, F
    BTFSC STATUS, C
    INCF RESULT_H, F

SKIP_ADD:
    RLF N, F      ; Nを左シフト
    BTFSC STATUS, C
    INCF RESULT_H, F
    
    DECFSZ COUNTER, F
    GOTO MULTIPLY

    ; 結果を0x30-0x3Fに格納
    MOVLW 0x30
    MOVWF FSR
    MOVF RESULT, W
    MOVWF INDF
    INCF FSR, F
    MOVF RESULT_H, W
    MOVWF INDF

    ; 残りの14バイトをクリア
    MOVLW D'14'
    MOVWF COUNTER
CLEAR_LOOP:
    INCF FSR, F
    CLRF INDF
    DECFSZ COUNTER, F
    GOTO CLEAR_LOOP

END