clear

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 01,01 say "Digite o Numero A: "
@ 02,01 say "Digite o Numero B: "
@ 03,01 say "Digite o Numero C: "

@ 01,30 get nNumero1
@ 02,30 get nNumero2
@ 03,30 get nNumero3

read

nMedia := (nNumero1+nNumero2+nNumero3)/3


@ 06,01 say "A media entre os numeros e:"
@ 06,30 say nMedia



