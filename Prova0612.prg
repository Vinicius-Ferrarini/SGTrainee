//Luis Carlos Bussolin Filho

set date to british
set epoch to 1930
set message to 24 center
setmode(25,80)
clear

nOpcaoLose = 0
nOpcaoWin  = 0

do while .t.
    cNome             := Space(30)
    cPalavra          := Space(12)
    cPalavraAcertada  := ''
    cAcerto           := ''
    cLetrasAnteriores := ''
    cDica             := Space(10)
    cDica2            := Space(10)
    cDica3            := Space(10)

    nDificuldade      := 0
    nErro             := 0
    nAcerto           := 0
    nContador         := 0
    nVerificador      := 0
    nColuna           := 10
    nLinha            := 12
    nLinha2           := 3

    @ 01,01 say "Escreva seu nome: "
    @ 02,01 say "Escreva uma palavra para iniciar o jogo: "


    @ 01,18 get cNome picture '@!' valid !Empty(cNome)
    @ 02,41 get cPalavra picture '@!' valid !(cPalavra $ "1234567890!@#$%ªù&*()=+-_{[]}:;.,<>\|^ï`'") .and. !Empty(cPalavra)
    read

    @ 13,31 prompt 'F cil' message   '3 dicas dispon¡veis'

    @ 15,31 prompt 'M‚dio' message   '1 dicas dispon¡vel'

    @ 17,31 prompt 'Dif¡cil' message 'Nenhuma dicas dispon¡vel'
    menu to nDificuldade
    clear
    if nDificuldade != 3
       @ 01,01 say "Escolha a 1§ dica: "

       @ 01,18 get cDica picture '@!' valid !Empty(cDica)
       read
       if nDificuldade = 1
          @ 02,01 say "Escolha a 2§ dica: "
          @ 03,01 say "Escolha a 3§ dica: "

          @ 02,18 get cDica2 picture '@!' valid !Empty(cDica2)
          @ 03,18 get cDica3 picture '@!' valid !Empty(cDica3)
          read
       endif
    endif

    if lastkey() == 27
       nOpcaoSair := ALERT('Deseja sair do jogo?',{'Continuar','Sair'})
       if nOpcaoSair == 2
          exit
       endif
    endif
    clear
    nTamanhoPalavra         := Len(Alltrim(cPalavra))

    //estrutura forca
    @ nLinha2-1,01 say Replicate ("_",9)
    @ nLinha2,10   say "|"
    @ nLinha2,01   say "|"
    @ nLinha2+1,01 say "|"
    @ nLinha2+2,01 say "|"
    @ nLinha2+3,01 say "|"
    @ nLinha2+4,01 say "|"
    @ nLinha2+5,01 say "|"
    @ nLinha2+6,01 say "|"
    @ nLinha2+7,01 say "|"
    @ nLinha2+8,01 say "|"

    do while nContador < nTamanhoPalavra
       nContador++

       @ nLinha,nColuna say "_"


       nColuna += 2
       nLinha2++
    enddo


    nColuna2  := 40
    nContador := 0
    //Tentativas Usu rio
    do while .t.
       nContador++
       cTentativa := Space(1)

       if nAcerto = nTamanhoPalavra
          nOpcaoWin := ALERT('Voce ganhou! Deseja?',{'Jogar Novamente','Sair'})
          exit
       endif

       @ 01,01 say Transform(nContador,'99') + "§ tentativa:"
       @ 01,15 get cTentativa picture '@!' valid !(cTentativa $ "1234567890!@#$%ªù&*()=+-_{[]}:;.,<>\|^ï`'")
       read
       if lastkey() == 27
          nOpcaoSair := ALERT('Deseja sair do jogo?',{'Continuar','Sair'})
          if nOpcaoSair == 2
             exit
          endif
       endif

       @ 01,18 say "Letras Digitadas: "
       @ 01,nColuna2 say cTentativa

       //Verificacao (Repeticao de letras)
       if cTentativa $ cLetrasAnteriores
          ALERT('Houvera tentativa dessa letra antes. Tente outra',{'OK'})
          loop
       endif
       nColuna2 += 2
       cLetrasAnteriores := cLetrasAnteriores + cTentativa


       //Verifica‡Æo (Acerto)
       nColuna := 9
       if cTentativa $ cPalavra


          do while nVerificador < nTamanhoPalavra
          nVerificador++
          cAcerto := SubStr(cPalavra,nVerificador,1)

          if cAcerto == cTentativa

             @nLinha,nColuna + nVerificador  say cTentativa
             nAcerto++

          endif
          enddo

          nVerificador := 0
       else
         nErro++
       endif

       if nErro = 1
          @ 04,10 say "O"
       elseif nErro = 2
          @ 05,10 say "|"
       elseif nErro = 3
          @ 05,09 say "/"
       elseif nErro = 4
          @ 05,11 say "\"
       elseif nErro = 5
          @ 06,09 say "/"
       elseif nErro = 6
          @ 06,11 say "\"
          nOpcaoLose := ALERT('Voce Perdeu! Deseja?',{'Tentar Novamente','Sair'})
          exit
       endif

       if nDificuldade != 3 .and. nErro = 2
             ALERT(cDica)
       endif
       if nDificuldade = 1 .and. nErro = 4
             ALERT(cDica2)
       endif
       if nDificuldade = 1 .and. nErro = 5
             ALERT(cDica3)
       endif


   enddo
   if nOpcaoLose = 2 .or. nOpcaoWin = 2
      exit
   endif
   clear
enddo
