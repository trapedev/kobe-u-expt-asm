


; ----------------------------------------------------
; フィボナッチ数列計算 (N=1～10)
; 結果は0x20番地から10バイトの領域に格納
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
COUNT   EQU 0x0C  ; カウンタ
FIB1    EQU 0x0D  ; フィボナッチ数 N-1
FIB2    EQU 0x0E  ; フィボナッチ数 N-2
TEMP    EQU 0x0F  ; 一時的な計算用

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ (この例では使用しない)

    ORG 0x05
START:
    ; 初期化
    MOVLW   D'1'        ; 最初のフィボナッチ数
    MOVWF   FIB1
    CLRF    FIB2        ; 2番目のフィボナッチ数 (0)
    MOVLW   D'1'        ; カウンタを1に設定
    MOVWF   COUNT

    ; 結果格納開始アドレスを設定
    MOVLW   0x20
    MOVWF   FSR

LOOP:
    ; 現在のフィボナッチ数を格納
    MOVF    FIB1, W
    MOVWF   INDF
    INCF    FSR, F      ; 次のアドレスに移動

    ; 次のフィボナッチ数を計算
    MOVF    FIB1, W
    ADDWF   FIB2, W
    MOVWF   TEMP        ; TEMP = FIB1 + FIB2
    
    ; FIB2 = FIB1, FIB1 = TEMP
    MOVF    FIB1, W
    MOVWF   FIB2
    MOVF    TEMP, W
    MOVWF   FIB1

    ; カウンタをインクリメント
    INCF    COUNT, F
    MOVLW   D'11'       ; 11になったら終了
    SUBWF   COUNT, W
    BTFSS   STATUS, Z
    GOTO    LOOP

END