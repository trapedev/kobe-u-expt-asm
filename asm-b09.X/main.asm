


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
num1_high EQU 0x0C  ; 1つ目の数の上位バイト
num1_low  EQU 0x0D  ; 1つ目の数の下位バイト
num2_high EQU 0x0E  ; 2つ目の数の上位バイト
num2_low  EQU 0x0F  ; 2つ目の数の下位バイト
result_high EQU 0x10 ; 結果の上位バイト
result_low  EQU 0x11 ; 結果の下位バイト

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x20

START:
    ; 初期値の設定
    MOVLW 0x12
    MOVWF num1_high
    MOVLW 0x34
    MOVWF num1_low

    MOVLW 0xAB
    MOVWF num2_high
    MOVLW 0xCD
    MOVWF num2_low

    ; 16ビット加算
    ; まず下位バイトを加算
    MOVF num1_low, W
    ADDWF num2_low, W
    MOVWF result_low

    ; 次に上位バイトを加算（キャリーを考慮）
    MOVF num1_high, W
    BTFSC STATUS, C  ; キャリーフラグがセットされていれば、1を加算
    INCF num1_high, W
    ADDWF num2_high, W
    MOVWF result_high

    END