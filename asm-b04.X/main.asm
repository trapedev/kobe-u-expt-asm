
    
    
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"
; ----------------------------------------------------
; ファイルレジスタマップの定義
mem10 EQU 0x10
mem11 EQU 0x11
mem20 EQU 0x20
mem21 EQU 0x21
mem25 EQU 0x25
mem29 EQU 0x29
mem0C EQU 0x0C
; ----------------------------------------------------
; --> 命令は4列目 (空白文字 4 つ入力して) から記述
ORG 0x00 ; プログラムメモリの 0x00 番地に以下のコードを配置
RESET_VECTOR:
GOTO START ; START ラベルへジャンプ
ORG 0x40 ; プログラムメモリの先頭に配置される
; 割り込みベクタ用の領域を 0x40byte 分確保.

START: ; ラベルは1列目から記述
    ; 初期値の設定
    MOVLW 0x20
    MOVWF mem20
    MOVLW 0x21
    MOVWF mem21
    MOVLW 0x25
    MOVWF mem25
    MOVLW 0x29
    MOVWF mem29

    MOVLW 0x20        ; コピー元のアドレス
    MOVWF mem0C
    MOVLW 0x30        ; コピー先のアドレス
    MOVWF FSR
    MOVLW 0x00
    MOVWF INDF        ; 0x30 番地に 0x00 を格納
    MOVLW D'10'       ; 繰り返し回数 10 回 (10 進数)
    MOVWF mem10       ; mem10 番地に格納

LOOP:
    MOVF mem0C, 0     ; mem0C に格納されている値
                      ; (0x21,0x22,0x23,..) を W reg に格納
    MOVWF FSR         ; その値をアドレスとしてロード
    MOVF INDF, 0      ; FSR に格納されている値を W reg に
                      ; 格納
    MOVWF mem11       ; コピー元の値を mem11 番地に格納
    MOVLW 0x10
    ADDWF FSR, 1      ; FSR のアドレスをコピー元からコピー
                      ; 先へ変換 (10 進数)
    MOVF mem11, 0     ; 0x11 番地に置いていた値を W reg に格納
    MOVWF INDF        ; W reg の値を FSR に格納
    INCF FSR          ; FSR (コピー先) のアドレスをインクリメント
    INCF mem0C        ; コピー元アドレスをインクリメント
    DECFSZ mem10, 1   ; mem10 の値をデクリメントし、結果が
                      ; 0 ならスキップ
    GOTO LOOP         ; ループ再行

END ; プログラムの終了