//vinicius reginaldo ferrarini  exe11
//leia nome,idade classifique:
//Infantil A: 5-7
//Infantil B: 8-10
//Juvenil  A: 11-13
//Juvenil  B: 14-17
//Senior    : 18 mais

set scoreboard off

cNome  := space(10)
nIdade := 0
cTexto := space(30)
nLinha := 0

clear
set color to ("N/W")
@ nLinha,01 clear to 14,77

@ nLinha++,00 to 15,78 double //deixa a borda dobrada

@ nLinha++,01 say "Digite seu nome  : "
@ nLinha--,01 say "Digite sua idade : "

@ nLinha++,20 get cNome                valid !Empty(alltrim(cNome))
@ nLinha++,20 get nIdade picture "999" valid nIdade >= 0
read

@ nLinha++,01 say alltrim(cNome) + "..." picture "@!"


if nIdade < 5
   cTexto := "muito NOVO para natacao!"

elseif nIdade < 8
   cTexto := "INFATIL A!"

elseif nIdade < 11
   cTexto := "INFATIL B!"

elseif nIdade < 14
   cTexto := "JUVENIL A!"

elseif nIdade < 18
   cTexto := "JUVENIL B!"

else
   cTexto := "SENIOR!"

endif


@ nLinha,01 say "Voce e " + cTexto

inkey(0)

@ 22,00 say ""
