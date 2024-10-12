//Vinicius Reginaldo Ferrarini
//leia 3 numeros e apresente o maior

clear

set date to british
set epoch to 1940
set scoreboard off

nLinha := 0
nN1    := 0
nN2    := 0
nN3    := 0

@ nLinha++,10 to 20,70 double
@ nLinha++,35 say 'Maior numero!'
@ nLinha++,11 say 'Digite o 1ø numero:'
@ nLinha++,11 say 'Digite o 2ø numero:'
@ nLinha++,11 say 'Digite o 3ø numero:'

nLinha := 2

@ nLinha++,30 get nN1 picture "@E 999,999"
@ nLinha++,30 get nN2 picture "@E 999,999"
@ nLinha++,30 get nN3 picture "@E 999,999"
read

nMaior := nN1

if nMaior < nN2
   nMaior := nN2
endif

if nMaior < nN3
   nMaior := nN3
endif

/*
if nN1 > nN2 .and. nN1 > nN3
   nMaior := nN1

elseif nN2 > nN3
   nMaior := nN2

else
   nMaior := nN3
endif
*/

@ nLinha,30 say "O maior:"+ alltrim(transform(nMaior,"@E 999,999"))
@ 23,00 say ''
