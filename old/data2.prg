set color 'N,W'

clear



set date to british
set epoch to 1940
set scoreboard off

set color to "R/B"
@ 01,70 say date()

set color to "G/0"


dHoje   := date()
nAno    := year(dHoje)
nMes    := month(dHoje)
nDiaNum := day(dHoje)
nDiaSem := DoW(dHoje)

nLinha = 0

@ ++nLinha,03 say "Maringa:"
@   nLinha,11 say dHoje


/*
@   nLinha,11 say nDiaNum
@   nLinha,14 say nMes
@   nLinha,17 say nAno
@   nLinha,14 say "/"
@   nLinha,17 say "/"
*/



@ 23,01 say ""
