//vinicius reginaldo ferrarini
//prova 06
set date to british
set epoch to 1940
set scoreboard off
clear

lSistema := .t.
cPosicaoCerta := '1.1/1.5/3.6/4.2/5.5/6.3'

@ 00,00 to 24,79 double
@ 01,30 say 'DESCOBERTA NAVAL'
@ 02,01 to 02,78 double
@ 03,16 to 23,16 double
@ 04,01 to 04,15 double
@ 07,01 to 07,15 double
@ 09,01 to 09,15 double
@ 03,01 say '    JOGADA'
@ 04,29 say '1        2        3        4        5        6'
@ 05,01 say 'LINHA.....: '
@ 06,01 say 'COLUNA....: '
@ 08,01 say '    JOGADAS'
@ 10,01 say 'RESTANTE..:'
@ 11,01 say 'REALIZADAS:'
@ 12,01 say 'ACERTOS...:'
@ 13,01 say 'ERROS.....:'

@ 07,20 say '1'
@ 10,20 say '2'
@ 13,20 say '3'
@ 16,20 say '4'
@ 19,20 say '5'
@ 22,20 say '6'

do while  lSistema
   nCont      := 20
   nAcerto    := 0
   nErro      := 0
   cPosJogada := ''
   SetColor("B/B")
   @ 06,25 clear to 23,78
   SetColor("W/N")
   do while nCont > 0 .and. nAcerto < 6 .and. nCont > 5 - nAcerto
      nJogadaLinha  := 0
      nJogadaColuna := 0
      @ 10,13 clear to 13,15
      @ 10,13 say alltrim(str(nCont))
      @ 11,13 say alltrim(str(20-nCont))
      @ 12,13 say alltrim(str(nAcerto))
      @ 13,13 say alltrim(str(nErro))

      @ 05,13 get nJogadaLinha   picture '9' valid nJogadaLinha  > 0 .and. nJogadaLinha  < 7
      @ 06,13 get nJogadaColuna  picture '9' valid nJogadaColuna > 0 .and. nJogadaColuna < 7
      read
      if LastKey() == 27
         nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
         if nOpcao = 1
            lSistema := .f.
            exit
         else
            loop
         endif
      endif

      cPosicaoTemp := alltrim(Str(nJogadaLinha + (nJogadaColuna*0.1)))

      if cPosicaoTemp $ cPosJogada
         alert('Posicao ja jogada',{'ok'})
         loop
      elseif cPosicaoTemp $ cPosicaoCerta
         nAcerto++
         cCor := 'R/R'
         alert('Acertou!',{'Ok'})
      else
         nErro++
         cCor := 'W/W'
         alert('Errou!',{'Ok'})
      endif
      cPosJogada += '/' + cPosicaoTemp

      nEscreveLinha  := 3  +  (nJogadaLinha  * 3)
      nEscreveColuna := 16 +  (nJogadaColuna * 9)
      Setcolor(cCor)
      @ nEscreveLinha,nEscreveColuna clear to nEscreveLinha+2,nEscreveColuna+8
      setcolor('W/N')
      nCont--
   enddo

   if lSistema
      if nAcerto  > 5
         Alert('Voce ganhou Parabens!',{'ok'})
      else
         alert('Voce perdeu! tentativas restantes nao sao suficientes',{'ok'})
      endif
      nOpcao := Alert('Jogar novamente?',{'Sim' , 'Nao'})
      if nOpcao = 2
         lSistema := .f.
      endif
   endif
enddo
