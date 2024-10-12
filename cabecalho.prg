clear
set color to ("B/W")

dHoje      := date()
nAno       := year(dHoje)
nMes       := month(dHoje)
nDiaSemana := DoW(dHoje)
nDia       := day(dHoje)
nLinha     := 0


if nMes = 1
   cMes := "Janeiro"

elseif nMes = 2
   cMes := "Fevereiro"

elseif nMes = 3
   cMes := "Mar‡o"

elseif nMes = 4
   cMes := "Abril"

elseif nMes = 5
   cMes := "Maio"

elseif nMes = 6
   cMes := "Junho"

elseif nMes = 7
   cMes := "Julho"

elseif nMes = 8
   cMes := "Agosto"

elseif nMes = 9
   cMes := "Setembro"

elseif nMes = 10
   cMes := "Outubro"

elseif nMes = 11
   cMes := "Novembro"

else
   cMes := "Dezembro"
endif


if nDiaSemana = 1
   cDia := "Domingo"

elseif nDiaSemana = 2
   cDia := "Segunda-feira"

elseif nDiaSemana = 3
   cDia := "Ter‡a-feira"

elseif nDiaSemana = 4
   cDia := "Quarta-feira"

elseif nDiaSemana = 5
   cDia := "Quinta-feira"

elseif nDiaSemana = 6
   cDia := "Sexta-feira"

else
   cDia := "Sabado"
endif

@ ++nLinha,15 say 'Maring  '+ alltrim(str(nDia)) + " de " + cMes + " de " +alltrim(str(nAno)) +" " + '(' + cDia + ')'

inkey(0)
@ 22,01 say ''
