


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; プログラムの開始
ORG 0x00
GOTO START

; ----------------------------------------------------
; メインプログラム
ORG 0x20
START:
    ; 0x0C番地に0xF5を書き込む
    MOVLW 0xF5
    MOVWF 0x0C

    ; 1の補数を計算し、0x10番地に格納
    MOVLW 0xFF      ; すべてのビットが1の値をWレジスタにロード
    XORWF 0x0C, W   ; 0x0C番地の内容とXOR演算を行い、結果をWレジスタに格納
    MOVWF 0x10      ; Wレジスタの内容（1の補数）を0x10番地に格納

    ; 2の補数を計算し、0x11番地に格納
    MOVLW 0xFF      ; すべてのビットが1の値をWレジスタにロード
    XORWF 0x0C, W   ; 0x0C番地の内容とXOR演算を行い、結果をWレジスタに格納
    ADDLW 0x01      ; 1を加算して2の補数を得る
    MOVWF 0x11      ; 結果を0x11番地に格納

    ; プログラムの終了
    END