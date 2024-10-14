//vinicius reginaldo ferrarini
//recebe 2 valores apresente e inverta os valores

clear

nNumero1:= 0
nNumero2:= 0

@ 01,01 say "--------------------------------------------------------------------------------"
@ 18,01 say "--------------------------------------------------------------------------------"
@ 04,01 say "Digite o Numero A: "
@ 05,01 say "Digite o numero B: "

@ 04,20 get nNumero1
@ 05,20 get nNumero2

read

@ 08,30 say "Original"
@ 10,05 say "Numero A: "
@ 10,20 say nNumero1 //picture "@e 9,999.99" //mascara para apresentar o numero `@E` serve para deixar no padrao britanico
@ 11,05 say "Numero B: "
@ 11,20 say nNumero2

nTemp      :=nNumero2
nNumero2   :=nNumero1
nNumero1   :=nTemp


@ 14,30 say "Alterado"
@ 16,05 say "Numero A: "
@ 16,20 say nNumero1
@ 17,05 say "Numero B: "
@ 17,20 say nNumero2
@ 18,01 say "--------------------------------------------------------------------------------"
