//set color to '0/B' //letra /fundo
clear              //pintei fundo

set date to british
set epoch to 1940
set scoreboard off

//cCor :=  '5,2'
//set color to 'R,G'      //cor quadrado
//@ 10,60 clear to 11,70
//set color to 'G/N'      //cor padrao

//set color to '0/B'

dHoje      := date()
nAno       := year(dHoje)
nMes       := month(dHoje)
nDia       := day(dHoje)
nDiaSemana := DoW(dHoje)



@ 10,03 say 'Precione uma tecla...'

inkey(0)

cDia := '04'
cMes := '07'
cAno := '24'

cDias := cDia
cDias += cMes
cDias += cAno
dDias := CtoD(cDias)


nLinha := 1

dHoje       := date()//data pc
dBranco     := CToD('')   //caracter para data
dDiasAtras  := date() - 7 //menos 7 dias
dDiasDepois := date() + 7 //mais  7 dias

@ nLinha++,03 say "Data atual   :"
@ nLinha++,03 say "Data vazia   :" //color "R/W" //este campo
@ nLinha++,03 say "Data anterior:"
@ nLinha++,03 say "Data depois  :"// color "w/R" //este campo
@ nLinha++,03 say "Data qualquer:"
@ nLinha++,03 say "Data dia     :"

nLinha := 1

@ nLinha++,20 get dHoje       valid dHoje = date() // color "w/R" //este campo
@ nLinha++,20 get dBranco     valid empty(dBranco)
@ nLinha++,20 get dDiasAtras  valid !empty(dDiasAtras)  .and. dDiasAtras   < dHoje
@ nLinha++,20 get dDiasDepois valid !empty(dDiasDepois) .and.  dDiasDepois > dHoje
@ nLinha++,20 get dDias       valid !empty(dDias)
read


@ 23,01 say ''

