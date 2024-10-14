//vinicius reginaldo ferrarini
//tabuada


set date to british
set epoch to 1940
set scoreboard off

clear

//set color to ("N/W")
//@ 03,09 clear to 21,70

nNumero := 0
nCont   := 1
nLinha  := 2
nColuna := 0

@ 01,01 say 'Numero:'
@ 01,08 get nNumero valid nNumero > 0 picture '9'
read


do while nCont <= 10
   @ nLinha++,nColuna say transform(nNumero,'99') + ' * ' + transform(nCont,'99') + ' = ' + alltrim(str(nNumero*nCont))
   nCont++
enddo

