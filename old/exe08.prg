//Vinicius Reginaldo Ferrarini
//cadastro nome,valor e quantidade de 3 produtos,apresente o total de cada
//produto na frente e atualize o total real

clear

set date to british
set epoch to  1940
set scoreboard off

cNome       := Space(9)
dNascimento := CToD(' ')
dHoje       := date()

cMascaraProd  := "@!"             //Deixa Maiusculo
cMascaraQuant := "@E 99.999"
cMascaraValor := "@E 999.99"
cMascaraTot   := "@E 999,999.99"

lContinua := .t.

@ 00,02 say "Digite seu Nome: "
@ 00,28 say "Nascimento.....:"

@ 00,18 get cNome       valid !Empty(cNome)
@ 00,39 get dNascimento valid !Empty(dNascimento)
read

if LastKey() == 27
   nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
   if nOpcao = 1
      lContinua := .f.
   endif
endif


@ 02,10 to 08,10  double
@ 02,23 to 08,23  double
@ 02,35 to 08,35  double
@ 03,02 say "Produto | Quantidade |   Valor   |      Total " //cabecalho

nLinha           := 5
nQuantidadeTotal := 0
nTotReal         := 0

do while lContinua
   cProdutoA   := Space(9)
   nPreAbacaxi := 0
   nQAbacaxi   := 0
   nTotAbacaxi := 0

   @ nLinha,01 get cProdutoA    picture cMascaraProd     valid !Empty(cProdutoA)
   @ nLinha,15 get nQAbacaxi    picture cMascaraQuant    valid nQAbacaxi   > 0
   @ nLinha,27 get nPreAbacaxi  picture cMascaraValor    valid nPreAbacaxi > 0
   read
   if LastKey() == 27
      nOpcao := alert('Deseja finalizar venda?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif

   nTotAbacaxi := nQAbacaxi*nPreAbacaxi
   nTotReal    += nTotAbacaxi

   @ nLinha,36 say nTotAbacaxi picture cMascaraTot
   @ 23,36     say nTotReal    picture cMascaraTot
   nQuantidadeTotal++
   nLinha++
   if nLinha > 22
      @ 04,00 clear to 22,79
      nLinha := 5
   endif
enddo


/*
   @ ++nLinha,01 get cProdutoB      picture cMascaraProd   valid !Empty(cProdutoB)
   @ nLinha,15 get nQBanana       picture cMascaraQuant
   @ nLinha,27 get nPreBanana     picture cMascaraValor
   read

   nTotBanana := nQBanana*nPreBanana
   nTotReal   += nTotBanana
   @ 06,36 say nTotBanana  picture cMascaraTot
   @ 08,36 say nTotReal    picture cMascaraTot


   @ 07,01 get cProdutoC   picture cMascaraProd      valid !Empty(cProdutoC)
   @ 07,15 get nQCaju      picture cMascaraQuant
   @ 07,27 get nPreCaju    picture cMascaraValor
   read

   nTotCaju := nQCaju*nPreCaju
   nTotReal += nTotCaju

   @ 07,36 say nTotCaju    picture "@E 999,999.99"
   @ 08,36 say nTotReal    picture "@E 999,999.99"
*/
//-----------------------------------------------------------------------------
//finalizar compra
   @ 10,01 say "Preciona um tecla para emitir cupom..."

   Inkey(0)

   clear
   set color to ("B/W")
   @ 03,09 clear to 21,70

   nLinha := 3

   @ nLinha++,09 say replicate ("-",62)
   @ nLinha++,10 say "Cliente:" + alltrim(cNome) + "      Nascimento:" + DToC(dNascimento) + "      Data:" + DToc(dHoje)
   nlinha++
   @ nLinha++,10 say  "Produto   Quantidade     Valor          Total "
   nlinha++
/* @ nLinha++,10 say cProdutoA+ " " + str(nQAbacaxi)+ "       "+ Str(nPreAbacaxi)+ " "  + str(nTotAbacaxi)
   @ nLinha++,10 say cProdutoB+ " " + str(nQBanana)+  "       "+ Str(nPreBanana) + " "  + str(nTotBanana)
   @ nLinha++,10 say cProdutoC+ " " + str(nQCaju)+    "       "+ Str(nPreCaju)   + " "  + str(nTotCaju)
   @ nLinha++,10 say replicate (" ",27)+"R$ " + str(nTotReal) + "   TOTAL"
   @ nLinha++,09 say replicate ("-",62)
*/

   dEntrega := CToD('')
   @ nLinha,15 say "Digite a data de entrega:"
   @ nLinha,40 get dEntrega valid dEntrega >= dHoje
   read

   nAno       := year(dEntrega)
   nMes       := month(dEntrega)
   nDiaSemana := DoW(dEntrega)
   nDia       := day(dEntrega)


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

   //tranform(nValor,"@E 9,999.99")
   @ ++nLinha,15 say 'Maring  '+ alltrim(str(nDia)) + " de " + cMes + " de " +alltrim(str(nAno)) +" " + '(' + cDia + ')'



@ 22,01 say ''
