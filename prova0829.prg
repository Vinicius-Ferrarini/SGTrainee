//LILIAN AYUMI YAMADA HAKUTAKE
set color to ''
clear
setmode(25,80)
set scoreboard off


do while .t.
   nRestante    := 20
   nRealizadas  := 0
   nAcertos     := 0
   nErros       := 0
   nAlerta      := 0
   cJogadas     := ''
   cEmbarcacao1 := '1x1'
   cEmbarcacao2 := '1x5'
   cEmbarcacao3 := '3x6'
   cEmbarcacao4 := '4x2'
   cEmbarcacao5 := '5x5'
   cEmbarcacao6 := '6x3'

   do while .t.
      nLinha := 0
      nColuna := 0
      cCorEmbarcacao := ''
      cJogada := ''
      nLinhaInicio  := 0
      nLinhaFinal  := 0
      nColunaInicio := 0
      nColunaFinal  := 0

      @ 00,00 to 24,79 double
      @ 01,01 say padc('DESCOBERTA NAVAL',78)
      @ 02,01 to 02,78 double
      @ 03,20 to 23,20 double

      //tabuleiro
      set color to ('W/B')
      @ 05,27 clear to 23,68
      set color to ('')

      @ 04,30 say '1'
      @ 04,37 say '2'
      @ 04,44 say '3'
      @ 04,51 say '4'
      @ 04,58 say '5'
      @ 04,65 say '6'
      @ 07,25 say '1'
      @ 10,25 say '2'
      @ 13,25 say '3'
      @ 16,25 say '4'
      @ 19,25 say '5'
      @ 22,25 say '6'

      //jogadas
      @ 03,01 say padc('JOGADA',18)
      @ 04,01 to 04,19 double
      @ 05,01 say 'LINHA.....:' get nLinha picture '9'  valid nLinha > 0 .and. nLinha <= 6
      @ 06,01 say 'COLUNA....:' get nColuna picture '9' valid nColuna > 0 .and. nColuna <= 6
      @ 07,01 to 07,18 double

      read
      if lastkey() == 27
         nAlerta := alert('ABANDONAR JOGO?', {'SIM','NAO'})
         if nAlerta == 2
            loop
         else
            exit
         endif
      endif

      cJogada := alltrim(str(nLinha)) + 'x' + alltrim(str(nColuna))
      if cJogada $ cJogadas
         alert('JOGADA REALIZADA ANTERIORMENTE, TENTE DE NOVO')
         loop
      endif
      cJogadas += cJogada

      //jogo
      nRestante--
      nRealizadas++
      if cEmbarcacao1 $ cJogada .or.;
         cEmbarcacao2 $ cJogada .or.;
         cEmbarcacao3 $ cJogada .or.;
         cEmbarcacao4 $ cJogada .or.;
         cEmbarcacao5 $ cJogada .or.;
         cEmbarcacao6 $ cJogada
         alert('ACERTOU',,'N/G')
         cCorEmbarcacao := 'R/R'
         nAcertos++
      else
         alert('ERROU',,'N/R')
         cCorEmbarcacao := 'W/W'
         nErros++
      endif
      nPosicaoLinha := 1
      nPosicaoColuna := 3
      nTamanhoJogadas := len(cJogadas)
      nLoop := 1
      do while .t.
         cLinha := substr(cJogadas,nPosicaoLinha,1)
         cColuna := substr(cJogadas,nPosicaoColuna,1)
         //tabuleiro jogadas
         if cColuna $ '1'
            nColunaInicio  := 28
            nColunaFinal   := 32
         elseif cColuna $ '2'
            nColunaInicio := 35
            nColunaFinal  := 39
         elseif cColuna $ '3'
            nColunaInicio := 42
            nColunaFinal  := 46
         elseif cColuna $ '4'
            nColunaInicio := 49
            nColunaFinal  := 53
         elseif cColuna $ '5'
            nColunaInicio := 56
            nColunaFinal  := 60
         elseif cColuna $ '6'
            nColunaInicio := 63
            nColunaFinal  := 67
         endif

         if cLinha $ '1'
            nLinhaInicio := 06
            nLinhaFinal  := 08
         elseif cLinha $ '2'
            nLinhaInicio := 09
            nLinhaFinal  := 11
         elseif cLinha $ '3'
            nLinhaInicio := 12
            nLinhaFinal  := 14
         elseif cLinha $ '4'
            nLinhaInicio := 15
            nLinhaFinal  := 17
         elseif cLinha $ '5'
            nLinhaInicio := 18
            nLinhaFinal  := 20
         elseif cLinha $ '6'
            nLinhaInicio := 21
            nLinhaFinal  := 22
         endif

         if cEmbarcacao1 $ cJogada .or.;
            cEmbarcacao2 $ cJogada .or.;
            cEmbarcacao3 $ cJogada .or.;
            cEmbarcacao4 $ cJogada .or.;
            cEmbarcacao5 $ cJogada .or.;
            cEmbarcacao6 $ cJogada
            cCorEmbarcacao := 'R/R'
         else
            cCorEmbarcacao := 'W/W'
         endif

         set color to (cCorEmbarcacao)
         @ nLinhaInicio,nColunaInicio clear to nLinhaFinal,nColunaFinal
         set color to ('')
         nPosicaoLinha := nPosicaoLinha + 3
         nPosicaoColuna := nPosicaoColuna + 3
         nLoop++
         inkey(0)
         if nLoop > (nTamanhoJogadas/3)
            exit
         endif
      enddo
      @ 08,01 say padc('JOGADAS',18)
      @ 09,01 say 'RESTANTE..: ' + alltrim(str(nRestante))
      @ 10,01 say 'REALIZADAS: ' + alltrim(str(nRealizadas))
      @ 11,01 say 'ACERTOS...: ' + alltrim(str(nAcertos))
      @ 12,01 say 'ERROS.....: ' + alltrim(str(nErros))


      if nAcertos == 6
         alert('VOCE GANHOU. PARABENS!')
      endif
      if nErros == 15
         alert('VOCE PERDEU! TENTATIVAS RESTANTES NAO SAO SUFUCIENTES PARA DESVENDAR TODAS AS EMBARCACOES.')
         exit
      endif
   enddo
   if nAlerta == 1
      exit
   endif
   if nRestante == 0
      exit
   endif
   inkey(0)
enddo
inkey(0)
