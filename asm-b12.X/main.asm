


; ----------------------------------------------------
; 4bit整数の積計算 (N,M ∈ {5,7,11,13})
; 結果は0x30番地から16バイトの領域に格納
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
N       EQU 0x0C  ; 乗数N
M       EQU 0x0D  ; 乗数M
RESULT  EQU 0x0E  ; 計算結果
COUNTER EQU 0x0F  ; ループカウンタ
TEMP    EQU 0x10  ; 一時的な計算用

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ (この例では使用しない)

    ORG 0x05
START:
    ; 初期化
    MOVLW   0x30    ; 結果格納開始アドレス
    MOVWF   FSR

    ; N,Mの値のリスト
    MOVLW   D'5'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'7'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'11'
    MOVWF   TEMP
    CALL    CALC_AND_STORE
    
    MOVLW   D'13'
    MOVWF   TEMP
    CALL    CALC_AND_STORE

    GOTO    $       ; 終了、無限ループ

; ----------------------------------------------------
; 各Nに対して全てのMとの積を計算し格納する関数
CALC_AND_STORE:
    MOVWF   N
    
    MOVLW   D'5'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'7'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'11'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    MOVLW   D'13'
    MOVWF   M
    CALL    MULTIPLY
    MOVF    RESULT, W
    MOVWF   INDF
    INCF    FSR, F

    RETURN

; ----------------------------------------------------
; N*Mの積を計算する関数
MULTIPLY:
    CLRF    RESULT
    MOVF    M, W
    MOVWF   COUNTER

MULT_LOOP:
    MOVF    N, W
    ADDWF   RESULT, F
    DECFSZ  COUNTER, F
    GOTO    MULT_LOOP

    RETURN

END