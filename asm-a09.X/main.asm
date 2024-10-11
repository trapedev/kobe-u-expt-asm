


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; 定数定義
START_ADDR EQU 0x10
END_ADDR   EQU 0x14

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x04
    ; 割り込みハンドラ（必要な場合）

START:
    ; FSRレジスタに開始アドレスを設定
    MOVLW START_ADDR
    MOVWF FSR

    ; 1をWレジスタにロード
    MOVLW 0x01

    ; 0x10番地に1を格納
    MOVWF INDF
    
    ; FSRをインクリメント（0x11に移動）
    INCF FSR, F
    
    ; 0x11番地に1を格納
    MOVWF INDF
    
    ; FSRをインクリメント（0x12に移動）
    INCF FSR, F
    
    ; 0x12番地に1を格納
    MOVWF INDF
    
    ; FSRをインクリメント（0x13に移動）
    INCF FSR, F
    
    ; 0x13番地に1を格納
    MOVWF INDF
    
    ; FSRをインクリメント（0x14に移動）
    INCF FSR, F
    
    ; 0x14番地に1を格納
    MOVWF INDF

END