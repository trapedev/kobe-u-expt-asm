


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; 定数定義
START_ADDR  EQU 0x20   ; 開始アドレス
MEM_SIZE    EQU 0x0A   ; 格納するメモリサイズ（10バイト）

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ（必要な場合）

START:
    ; FSRレジスタに開始アドレスを設定
    MOVLW   START_ADDR
    MOVWF   FSR

    ; 格納する値を初期化（1から開始）
    MOVLW   0x01
    MOVWF   0x0C    ; 0x0Cを現在の値として使用

    ; 格納する回数をカウントするレジスタを初期化
    MOVLW   MEM_SIZE
    MOVWF   0x0D    ; 0x0Dをカウンタとして使用

STORE_LOOP:
    ; 現在の値をメモリに格納
    MOVF    0x0C, W
    MOVWF   INDF

    ; FSRをインクリメント
    INCF    FSR, F

    ; 格納する値をインクリメント
    INCF    0x0C, F

    ; カウンタをデクリメント
    DECFSZ  0x0D, F
    GOTO    STORE_LOOP

END