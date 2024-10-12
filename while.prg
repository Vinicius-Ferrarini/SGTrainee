//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

clear

//set color to ("N/W")
//@ 03,09 clear to 21,70

nCont  := 0
cNome  := space(10)
nLinha := 2


@ 01,01 say "Nome:"
@ 01,06 get cNome
read


do while nCont < 10
   @ nLinha++,01 say cNome
   nCont++
enddo

