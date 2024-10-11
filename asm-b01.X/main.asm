


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; 定数定義
START_ADDR  EQU 0x20   ; 開始アドレス
MEM_SIZE    EQU 0x0A   ; クリアするメモリサイズ（10バイト）

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ（必要な場合）

START:
    ; FSRレジスタに開始アドレスを設定
    MOVLW   START_ADDR
    MOVWF   FSR

    ; クリアする回数をカウントするレジスタを初期化
    MOVLW   MEM_SIZE
    MOVWF   0x0C    ; 汎用レジスタ0x0Cをカウンタとして使用

CLEAR_LOOP:
    ; メモリをクリア（0を書き込む）
    CLRF    INDF

    ; FSRをインクリメント
    INCF    FSR, F

    ; カウンタをデクリメント
    DECFSZ  0x0C, F
    GOTO    CLEAR_LOOP

END