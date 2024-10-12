//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

clear

nCont  := 1
nLinha := 0

do while nCont <= 10
   @ nLinha++,01 say nCont++
enddo

do while nCont > 1
   @ ++nLinha,01 say --nCont
enddo

