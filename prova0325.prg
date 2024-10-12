clear
//OPTMOS PRIME
SetMode(25,80)
Set Date to british
Set epoch to 1930

do while .t.

   cNome             := Space(20)
   dNascimento       := cToD('')

   @ 01,00 say 'Nome                    :'
   @ 02,00 say 'Data de nascimento      :'
   @ 03,00 say 'Nascido em              :'
   @ 04,00 say 'idade de                :'
   @ 05,00 say 'Signo                   :'
   @ 06,00 say 'Prox. Aniversario em    :'
   @ 07,00 say 'Prox. Aniversario em uma:'

   @ 01,26 get cNome picture '@!' Valid!Empty(cNome)
   @ 02,26 get dNascimento  Valid!Empty(dNascimento)
   read

   if LastKey()==27
      nOpcao := Alert('Tem certeza que deseja sair',{'Sair','continuar'})
         if nOpcao == 1

            exit
         else

            loop

         endif
   endif

   dHoje             := Date()
   nAnoNascimento    := Year(dNascimento)
   nDiaNascimento    := Day(dNascimento)
   nMesNascimento    := Month(dNascimento)
   nSemanaNascimento := DoW(dNascimento)
   nAnoAtual         := Year(dHoje)
   nMesAtual         := Month(dHoje)
   nDiaAtual         := Day(dHoje)
   cDiaSemana        := ''
   cMes              := ''
   nIdade            := nAnoAtual - nAnoNascimento
   dAniversarioAtual := CtoD(Transform(nDiaNascimento,'99')+'/'+Transform(nMesNascimento,'99')+'/'+Transform(nAnoAtual,'9999'))
   nSemanaProxNiver  := DoW(dAniversarioAtual)+1
   nMesesdeVida      := nMesAtual - nMesNascimento
   nDiasdevida       := nDiaAtual - nDiaNascimento
   nProxAniversario  := 0
   cProxAniversario  := ''
   cSigno            := ''
   nDiasdoMes        := 0



   if nMesAtual == nMesNascimento

      if nDiaAtual < nDiaNascimento

         nIdade--

      endif

   endif



   if nDiaAtual == nDiaNascimento .and. nMesAtual == nMesNascimento

      Alert('Parab�ns feliz aniversario')

   endif



   if nSemanaNascimento == 1

      cDiaSemana := 'Domingo'

   elseif nSemanaNascimento == 2

      cDiaSemana := 'Segunda-feira'

   elseif nSemanaNascimento == 3

      cDiaSemana := 'Ter�a-feira'

   elseif nSemanaNascimento == 4

      cDiaSemana := 'Quarta-feira'

   elseif nSemanaNascimento == 5

      cDiaSemana := 'Quinta-feira'

   elseif nSemanaNascimento == 6

      cDiaSemana := 'Sexta-feira'

   elseif nSemanaNascimento == 7

      cDiaSemana := 'S�bado'

   endif

   if nMesAtual == 1

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 2

      nDiasdomes      := 28
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 3

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 4

      nDiasdomes      := 30
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 5

      nDiasdomes     := 31
      nDiaFalta      := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 6

      nDiasdomes      := 30
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 7

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 8

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 9

      nDiasdomes      := 30
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 10

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 11

      nDiasdomes      := 30
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   elseif nMesAtual == 12

      nDiasdomes      := 31
      nDiaFalta       := nDiasdomes-nDiaAtual+nDiaNascimento

   endif

   //semana Nascimento
   if nSemanaNascimento == 1

      cSemanaNascimento :='Domingo'

   elseif nSemanaNascimento == 2

      cSemanaNascimento := 'Segunda-Feira'

   elseif nSemanaNascimento == 3

      cSemanaNascimento := 'Ter�a-feira'

   elseif nSemanaNascimento == 4

      cSemanaNascimento := 'Quarta-feira'

   elseif nSemanaNascimento == 5

      cSemanaNascimento := 'Quinta-feira'

   elseif nSemanaNascimento == 6

      cSemanaNascimento := 'Sexta feira'

   elseif nSemanaNascimento == 7

      cSemanaNascimento := 'Sabado'

   endif


   if nSemanaProxNiver == 1

      cProxAniversario := 'Domingo '

   elseif nSemanaProxNiver == 2

      cProxAniversario := 'Segunda-Feira'

   elseif nSemanaProxNiver == 3

      cProxAniversario := 'Ter�a-feira'

   elseif nSemanaProxNiver == 4

      cProxAniversario := 'Quarta-feira'

   elseif nSemanaProxNiver == 5

      cProxAniversario := 'Quinta-feira'

   elseif nSemanaProxNiver == 6

      cProxAniversario := 'Sexta-feira'

   elseif nSemanaProxNiver == 7

      cProxAniversario := 'Sabado'

   endif

   if nMesNascimento == 1

      cMesNascimento := 'Janeiro'

   elseif nMesNascimento == 2

      cMesNascimento := 'Fevereiro'

   elseif nMesNascimento == 3

      cMesNascimento := 'Mar�o'

   elseif nMesNascimento == 4

      cMesNascimento := 'Abril'

   elseif nMesNascimento == 5

      cMesNascimento := 'Maio'

   elseif nMesNascimento == 6

      cMesNascimento := 'Junho'

   elseif nMesNascimento == 7

      cMesNascimento := 'Julho'

   elseif nMesNascimento == 8

      cMesNascimento := 'Agosto'

   elseif nMesNascimento == 9

      cMesNascimento := 'Setembro'

   elseif nMesNascimento == 10

      cMesNascimento := 'Outubro'

   elseif nMesnascimento == 11

      cMesNascimento := 'Novembro'

   elseif nMesNascimento == 12

       cMesNascimento := 'Dezembro'

   endif

   //Meses dias que faltam para o proximo aniversario



   if nMesAtual < nMesNascimento

      nProxAniversario   := nMesNascimento - nMesAtual

   elseif nMesAtual > nMesNascimento

      nProxMesNascimento := nMesNascimento+12
      nProxAniversario   := nProxMesNascimento - nMesAtual

   endif

   if nDiaAtual + nDiaNascimento < nDiasdomes

      nProxAniversario--

   endif



   //Signos


   if nMesNascimento == 3 .and. nDiaNascimento >= 21 .or. nMesNascimento == 4 .and. nDiaNascimento <=20

      cSigno := 'Aries'

   elseif nMesNascimento == 4 .and. nDiaNascimento >= 20 .or. nMesNascimento == 5 .and. nDiaNascimento <=20

      cSigno := 'Touro'

   elseif nMesNascimento  == 5 .and. nDiaNascimento > 21 .or. nMesNascimento == 6 .and. nDiaNascimento <=20

      cSigno := 'Gemeos'

   elseif nMesNascimento == 6 .and. nDiaNascimento >= 21 .or. nMesNascimento == 7 .and. nDiaNascimento <=22

      cSigno := 'Cancer'

   elseif nMesNascimento == 7 .and. nDiaNascimento > 22 .or. nMesNascimento == 8 .and. nDiaNascimento <= 22

      cSigno := 'Leao'

   elseif nMesNascimento == 8 .and. nDiaNascimento > 22 .or.  nMesNascimento == 9 .and. nDiaNascimento <= 22

      cSigno := 'Virgem'

   elseif nMesNascimento == 9 .and. nDiaNascimento > 22 .or. nMesNascimento == 10 .and. nDiaNascimento <=22

      cSigno := 'Libra'

   elseif nMesNascimento == 10 .and. nDiaNascimento >22 .or. nMesNascimento == 11 .and. nDiaNascimento <=21

      cSigno := 'Escorpiao'

   elseif nMesNascimento == 11 .and. nDiaNascimento >=22 .or.  nMesNascimento == 12 .and. nDiaNascimento  <=21

      cSigno := 'Sagitario'

   elseif nMesNascimento == 12 .and. nDiaNascimento >21 .or. nMesNascimento == 1 .and. nDiaNascimento <=20

      cSigno := 'Capricornio'

   elseif nMesNascimento == 1 .and. nDiaNascimento >21 .or. nMesNascimento == 2 .and. nDiaNascimento <=19

     cSigno := 'Aquario'

   elseif nMesNascimento == 2 .and. nDiaNascimento >19 .or.  nMesNascimento == 3 .and. nDiaNascimento <=20

     cSigno := 'Peixes'

   endif


   @ 02,40 say Alltrim(Str(nDiaNascimento))+' de '+ cMesNascimento+' de '+Alltrim(Str(nAnoNascimento))
   @ 03,40 say cSemanaNascimento
   @ 04,40 say Alltrim(str(nIdade))+' anos '+Alltrim(str(nMesesdeVida))+' meses '+Alltrim(str(nDiasdeVida))+' dias.'
   @ 05,40 say cSigno
   @ 06,40 say Alltrim(Str(nProxAniversario))+' Meses '+Alltrim(str(nDiaFalta))+' Dias '
   @ 07,40 say cProxAniversario

Enddo

























