


; ----------------------------------------------------
; 学籍番号 氏名
; ----------------------------------------------------
LIST P=PIC16F84A
INCLUDE "P16F84A.INC"

; ----------------------------------------------------
; ファイルレジスタマップの定義
result  EQU 0x4F  ; 結果を格納するアドレス (0x4F)
counter EQU 0x0C  ; カウンタ用
temp    EQU 0x0D  ; 一時的な値を保存

; ----------------------------------------------------
    ORG 0x00
    GOTO START

    ORG 0x20
    ; テストデータの初期化 (16バイト)
    DB 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
    DB 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10

START:
    CLRF result   ; 結果を0で初期化 (0x4F番地)
    MOVLW 0x20    ; 開始アドレス
    MOVWF FSR     ; FSRに開始アドレスをセット
    MOVLW 16      ; ループ回数
    MOVWF counter ; カウンタを16に設定

LOOP:
    MOVF INDF, W  ; INDFから値を読み取り
    MOVWF temp    ; 一時的に保存
    BTFSS temp, 0 ; 最下位ビットが1（奇数）かチェック
    GOTO NEXT     ; 偶数ならスキップ
    
    ADDWF result, F ; 奇数なら結果に加算 (0x4F番地に直接加算)

NEXT:
    INCF FSR, F   ; 次のアドレスへ
    DECFSZ counter, F ; カウンタをデクリメント、0になったら終了
    GOTO LOOP     ; カウンタが0でなければループ続行

END