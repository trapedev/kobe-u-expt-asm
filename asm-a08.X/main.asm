


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
REG_MEM EQU 0x0C   ; REG_MEMを0x0C番地と定義
N       EQU 3      ; 設定したいビット位置（例：3番目のビット）

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ（必要な場合）

START:
    ; REG_MEMを初期化（例：0xFF）
    MOVLW 0xFF
    MOVWF REG_MEM

    ; N番目のビットのみを1に、他を0にするマスクを作成
    MOVLW (1 << N)
    ANDWF REG_MEM, F  ; REG_MEMとAND演算し、結果をREG_MEMに格納

END