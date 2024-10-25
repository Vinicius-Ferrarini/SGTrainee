// LILIAN AYUMI YAMADA HAKUTAKE

set color to N/W
clear
setmode (25,80)
set date to british
set epoch to 1940
set scoreboard off
set century on

do while .t.
   @ 00,00 to 24,79 double
   @ 02,01 to 02,78 double
   @ 07,01 to 07,78 double
   @ 14,01 to 14,78 double

   @ 01,01 say 'INSTITUICAO DE ENSINO SG SISTEMAS - RUA SAO JOAO, NUMERO 123'
   @ 03,01 say 'BOLETIM ESCOLAR'

   //variaveis para dados iniciais
   cAluno              := space(30)
   dNascimento         := ctod('')
   dAtual              := date()
   cCurso              := space(30)
   nSerie              := 0
   nAnoLetivo          := 0
   nMensalidade        := 0

   //variaveis para tabela
   nColunaNota1        := 22
   nColunaFalta1       := 27
   nColunaNota2        := 33
   nColunaFalta2       := 38
   nColunaNota3        := 44
   nColunaFalta3       := 49
   nColunaNota4        := 55
   nColunaFalta4       := 60
   nColunaMedia        := 66
   nColunaFaltas       := 71
   nLinhaMateria1      := 10
   nLinhaMateria2      := 11
   nLinhaMateria3      := 12
   nLinhaMateria4      := 13

   // variaveis materia1
   cMateria1           := space(20)
   nMateria1Nota1      := 0
   nMateria1Falta1     := 0
   nMateria1Nota2      := 0
   nMateria1Falta2     := 0
   nMateria1Nota3      := 0
   nMateria1Falta3     := 0
   nMateria1Nota4      := 0
   nMateria1Falta4     := 0
   nMateria1Media      := 0
   nMateria1Faltas     := 0

   //variaveis materia2
   cMateria2           := space(20)
   nMateria2Nota1      := 0
   nMateria2Falta1     := 0
   nMateria2Nota2      := 0
   nMateria2Falta2     := 0
   nMateria2Nota3      := 0
   nMateria2Falta3     := 0
   nMateria2Nota4      := 0
   nMateria2Falta4     := 0
   nMateria2Media      := 0
   nMateria2Faltas     := 0

   //variaveis materia3
   cMateria3           := space(20)
   nMateria3Nota1      := 0
   nMateria3Falta1     := 0
   nMateria3Nota2      := 0
   nMateria3Falta2     := 0
   nMateria3Nota3      := 0
   nMateria3Falta3     := 0
   nMateria3Nota4      := 0
   nMateria3Falta4     := 0
   nMateria3Media      := 0
   nMateria3Faltas     := 0

   //variaveis materia4
   cMateria4           := space(20)
   nMateria4Nota1      := 0
   nMateria4Falta1     := 0
   nMateria4Nota2      := 0
   nMateria4Falta2     := 0
   nMateria4Nota3      := 0
   nMateria4Falta3     := 0
   nMateria4Nota4      := 0
   nMateria4Falta4     := 0
   nMateria4Media      := 0
   nMateria4Faltas     := 0

   //variaveis valid materias
   cMascaraMensalidade := '@E 9,999.99'
   cNota               := '99.9'
   cFalta              := '99'
   nNotaMinima         := 0
   nNotaMaxima         := 10.0
   nFaltaMinima        := 0
   nFaltaMaxima        := 99

   //variaveis reprovacao
   nReprovaMedia       := 6.0
   nReprovaFaltas      := 56
   nReprova            := 0
   cMateriaReprova     := ''

   //variaveis conselho
   nConselhoFaltas    := 48
   nConselhoAprova    := 2
   cMateria1Conselho1 := space(1)
   cMateria1Conselho2 := space(1)
   cMateria1Conselho3 := space(1)
   nMateria1Conselho  := 0
   cMateria2Conselho1 := space(1)
   cMateria2Conselho2 := space(1)
   cMateria2Conselho3 := space(1)
   nMateria2Conselho  := 0
   cMateria3Conselho1 := space(1)
   cMateria3Conselho2 := space(1)
   cMateria3Conselho3 := space(1)
   nMateria3Conselho  := 0
   cMateria4Conselho1 := space(1)
   cMateria4Conselho2 := space(1)
   cMateria4Conselho3 := space(1)
   nMateria4Conselho  := 0

   //variaveis resultado final
   nNovaMensalidade    := 0
   nLinhaFinal         := 0
   cCorVermelho        := 'R/W'
   cCorVerde           := 'G/W'

   //variaveis alerta
   nAlerta             := 0
   cAlerta             := 'SAIR?'
   aOpcoes             := {'SIM', 'NAO'}
   cCorAlerta          := 'W/N'

   //dados iniciais

   @ 04,01 say 'ALUNO: '
   @ 04,45 say 'DATA DE NASCIMENTO: '
   @ 05,01 say 'CURSO: '
   @ 05,45 say 'SERIE: '
   @ 06,01 say 'ANO LETIVO: '
   @ 06,45 say 'MENSALIDADE: RS'

   @ 04,13 get cAluno         picture '@!'                  valid !empty(cAluno)
   @ 04,65 get dNascimento                                  valid !empty(dNascimento) .and. dNascimento < dAtual
   @ 05,13 get cCurso         picture '@!'                  valid !empty(cCurso)
   @ 05,65 get nSerie         picture '9'                   valid nSerie > 0 .and. nSerie < 10
   @ 06,13 get nAnoLetivo     picture ''                valid nAnoLetivo > 1940 .and. nAnoLetivo <= 2023
   @ 06,65 get nMensalidade   picture cMascaraMensalidade   valid nMensalidade > 0 .and. nMensalidade <= 9999.99

   read
   if lastkey() == 27
      nAlerta := alert(cAlerta, aOpcoes, cCorAlerta)
      if nAlerta == 1
         exit
      elseif nAlerta == 2
         loop
      endif
   endif

   //dados tabela boletim

   @ 08,01 say 'MATERIAS'
   @ 08,nColunaNota1 say '1 BIMESTRE'
   @ 08,nColunaNota2 say '2 BIMESTRE'
   @ 08,nColunaNota3 say '3 BIMESTRE'
   @ 08,nColunaNota4 say '4 BIMESTRE'
   @ 08,nColunaMedia say 'RESULTADOS'

   @ 09,nColunaNota1  say 'NOTA'
   @ 09,nColunaFalta1 say 'FALTA'
   @ 09,nColunaNota2  say 'NOTA'
   @ 09,nColunaFalta2 say 'FALTA'
   @ 09,nColunaNota3  say 'NOTA'
   @ 09,nColunaFalta3 say 'FALTA'
   @ 09,nColunaNota4  say 'NOTA'
   @ 09,nColunaFalta4 say 'FALTA'
   @ 09,nColunaMedia  say 'NOTA'
   @ 09,nColunaFaltas say 'FALTA'

   do while .t.
      //notas e faltas

      @ nLinhaMateria1,01            get cMateria1       picture '@!'   valid !empty(cMateria1)
      @ nLinhaMateria1,nColunaNota1  get nMateria1Nota1  picture cNota  valid nMateria1Nota1  >= nNotaMinima  .and. nMateria1Nota1  <= nNotaMaxima
      @ nLinhaMateria1,nColunaFalta1 get nMateria1Falta1 picture cFalta valid nMateria1Falta1 >= nFaltaMinima .and. nMateria1Falta1 <= nFaltaMaxima
      @ nLinhaMateria1,nColunaNota2  get nMateria1Nota2  picture cNota  valid nMateria1Nota2  >= nNotaMinima  .and. nMateria1Nota2  <= nNotaMaxima
      @ nLinhaMateria1,nColunaFalta2 get nMateria1Falta2 picture cFalta valid nMateria1Falta2 >= nFaltaMinima .and. nMateria1Falta2 <= nFaltaMaxima
      @ nLinhaMateria1,nColunaNota3  get nMateria1Nota3  picture cNota  valid nMateria1Nota3  >= nNotaMinima  .and. nMateria1Nota3  <= nNotaMaxima
      @ nLinhaMateria1,nColunaFalta3 get nMateria1Falta3 picture cFalta valid nMateria1Falta3 >= nFaltaMinima .and. nMateria1Falta3 <= nFaltaMaxima
      @ nLinhaMateria1,nColunaNota4  get nMateria1Nota4  picture cNota  valid nMateria1Nota4  >= nNotaMinima  .and. nMateria1Nota4  <= nNotaMaxima
      @ nLinhaMateria1,nColunaFalta4 get nMateria1Falta4 picture cFalta valid nMateria1Falta4 >= nFaltaMinima .and. nMateria1Falta4 <= nFaltaMaxima

      @ nLinhaMateria2,01            get cMateria2       picture '@!'   valid !empty(cMateria2)
      @ nLinhaMateria2,nColunaNota1  get nMateria2Nota1  picture cNota  valid nMateria2Nota1  >= nNotaMinima  .and. nMateria2Nota1  <= nNotaMaxima
      @ nLinhaMateria2,nColunaFalta1 get nMateria2Falta1 picture cFalta valid nMateria2Falta1 >= nFaltaMinima .and. nMateria2Falta1 <= nFaltaMaxima
      @ nLinhaMateria2,nColunaNota2  get nMateria2Nota2  picture cNota  valid nMateria2Nota2  >= nNotaMinima  .and. nMateria2Nota2  <= nNotaMaxima
      @ nLinhaMateria2,nColunaFalta2 get nMateria2Falta2 picture cFalta valid nMateria2Falta2 >= nFaltaMinima .and. nMateria2Falta2 <= nFaltaMaxima
      @ nLinhaMateria2,nColunaNota3  get nMateria2Nota3  picture cNota  valid nMateria2Nota3  >= nNotaMinima  .and. nMateria2Nota3  <= nNotaMaxima
      @ nLinhaMateria2,nColunaFalta3 get nMateria2Falta3 picture cFalta valid nMateria2Falta3 >= nFaltaMinima .and. nMateria2Falta3 <= nFaltaMaxima
      @ nLinhaMateria2,nColunaNota4  get nMateria2Nota4  picture cNota  valid nMateria2Nota4  >= nNotaMinima  .and. nMateria2Nota4  <= nNotaMaxima
      @ nLinhaMateria2,nColunaFalta4 get nMateria2Falta4 picture cFalta valid nMateria2Falta4 >= nFaltaMinima .and. nMateria2Falta4 <= nFaltaMaxima

      @ nLinhaMateria3,01            get cMateria3       picture '@!'   valid !empty(cMateria3)
      @ nLinhaMateria3,nColunaNota1  get nMateria3Nota1  picture cNota  valid nMateria3Nota1  >= nNotaMinima  .and. nMateria3Nota1  <= nNotaMaxima
      @ nLinhaMateria3,nColunaFalta1 get nMateria3Falta1 picture cFalta valid nMateria3Falta1 >= nFaltaMinima .and. nMateria3Falta1 <= nFaltaMaxima
      @ nLinhaMateria3,nColunaNota2  get nMateria3Nota2  picture cNota  valid nMateria3Nota2  >= nNotaMinima  .and. nMateria3Nota2  <= nNotaMaxima
      @ nLinhaMateria3,nColunaFalta2 get nMateria3Falta2 picture cFalta valid nMateria3Falta2 >= nFaltaMinima .and. nMateria3Falta2 <= nFaltaMaxima
      @ nLinhaMateria3,nColunaNota3  get nMateria3Nota3  picture cNota  valid nMateria3Nota3  >= nNotaMinima  .and. nMateria3Nota3  <= nNotaMaxima
      @ nLinhaMateria3,nColunaFalta3 get nMateria3Falta3 picture cFalta valid nMateria3Falta3 >= nFaltaMinima .and. nMateria3Falta3 <= nFaltaMaxima
      @ nLinhaMateria3,nColunaNota4  get nMateria3Nota4  picture cNota  valid nMateria3Nota4  >= nNotaMinima  .and. nMateria3Nota4  <= nNotaMaxima
      @ nLinhaMateria3,nColunaFalta4 get nMateria3Falta4 picture cFalta valid nMateria3Falta4 >= nFaltaMinima .and. nMateria3Falta4 <= nFaltaMaxima

      @ nLinhaMateria4,01            get cMateria4       picture '@!'   valid !empty(cMateria4)
      @ nLinhaMateria4,nColunaNota1  get nMateria4Nota1  picture cNota  valid nMateria4Nota1  >= nNotaMinima  .and. nMateria4Nota1  <= nNotaMaxima
      @ nLinhaMateria4,nColunaFalta1 get nMateria4Falta1 picture cFalta valid nMateria4Falta1 >= nFaltaMinima .and. nMateria4Falta1 <= nFaltaMaxima
      @ nLinhaMateria4,nColunaNota2  get nMateria4Nota2  picture cNota  valid nMateria4Nota2  >= nNotaMinima  .and. nMateria4Nota2  <= nNotaMaxima
      @ nLinhaMateria4,nColunaFalta2 get nMateria4Falta2 picture cFalta valid nMateria4Falta2 >= nFaltaMinima .and. nMateria4Falta2 <= nFaltaMaxima
      @ nLinhaMateria4,nColunaNota3  get nMateria4Nota3  picture cNota  valid nMateria4Nota3  >= nNotaMinima  .and. nMateria4Nota3  <= nNotaMaxima
      @ nLinhaMateria4,nColunaFalta3 get nMateria4Falta3 picture cFalta valid nMateria4Falta3 >= nFaltaMinima .and. nMateria4Falta3 <= nFaltaMaxima
      @ nLinhaMateria4,nColunaNota4  get nMateria4Nota4  picture cNota  valid nMateria4Nota4  >= nNotaMinima  .and. nMateria4Nota4  <= nNotaMaxima
      @ nLinhaMateria4,nColunaFalta4 get nMateria4Falta4 picture cFalta valid nMateria4Falta4 >= nFaltaMinima .and. nMateria4Falta4 <= nFaltaMaxima

      read
      if lastkey() == 27
         nAlerta := alert(cAlerta, aOpcoes, cCorAlerta)
         if nAlerta == 1
            exit
         elseif nAlerta == 2
            loop
         endif
      endif

      //calculos medias e faltas

      nMateria1Media  := (nMateria1Nota1 + nMateria1Nota2 + nMateria1Nota3 + nMateria1Nota4) / 4
      nMateria1Faltas := nMateria1Falta1 + nMateria1Falta2 + nMateria1Falta3 + nMateria1Falta4

      nMateria2Media  := (nMateria2Nota1 + nMateria2Nota2 + nMateria2Nota3 + nMateria2Nota4) / 4
      nMateria2Faltas := nMateria2Falta1 + nMateria2Falta2 + nMateria2Falta3 + nMateria2Falta4

      nMateria3Media  := (nMateria3Nota1 + nMateria3Nota2 + nMateria3Nota3 + nMateria3Nota4) / 4
      nMateria3Faltas := nMateria3Falta1 + nMateria3Falta2 + nMateria3Falta3 + nMateria3Falta4

      nMateria4Media  := (nMateria4Nota1 + nMateria4Nota2 + nMateria4Nota3 + nMateria4Nota4) / 4
      nMateria4Faltas := nMateria4Falta1 + nMateria4Falta2 + nMateria4Falta3 + nMateria4Falta4

      //print medias e faltas

      @ nLinhaMateria1,nColunaMedia say alltrim(transform(nMateria1Media, cNota)) color(cCorVerde)
      @ nLinhaMateria1,nColunaFaltas say alltrim(str(nMateria1Faltas)) color (cCorVerde)
      if nMateria1Media < nReprovaMedia
         @ nLinhaMateria1,nColunaMedia say alltrim(transform(nMateria1Media, cNota)) color(cCorVermelho)
      endif
      if nMateria1Faltas > nConselhoFaltas
         @ nLinhaMateria1,nColunaFaltas say alltrim(str(nMateria1Faltas)) color (cCorVermelho)
      endif

      @ nLinhaMateria2,nColunaMedia say alltrim(transform(nMateria2Media, cNota)) color(cCorVerde)
      @ nLinhaMateria2,nColunaFaltas say alltrim(str(nMateria2Faltas)) color (cCorVerde)
      if nMateria2Media < nReprovaMedia
         @ nLinhaMateria2,nColunaMedia say alltrim(transform(nMateria2Media, cNota)) color(cCorVermelho)
      endif
      if nMateria2Faltas > nConselhoFaltas
         @ nLinhaMateria2,nColunaFaltas say alltrim(str(nMateria2Faltas)) color (cCorVermelho)
      endif

      @ nLinhaMateria3,nColunaMedia say alltrim(transform(nMateria3Media, cNota)) color(cCorVerde)
      @ nLinhaMateria3,nColunaFaltas say alltrim(str(nMateria3Faltas)) color (cCorVerde)
      if nMateria3Media < nReprovaMedia
         @ nLinhaMateria3,nColunaMedia say alltrim(transform(nMateria3Media, cNota)) color(cCorVermelho)
      endif
      if nMateria3Faltas > nConselhoFaltas
         @ nLinhaMateria3,nColunaFaltas say alltrim(str(nMateria3Faltas)) color (cCorVermelho)
      endif

      @ nLinhaMateria4,nColunaMedia say alltrim(transform(nMateria4Media, cNota)) color(cCorVerde)
      @ nLinhaMateria4,nColunaFaltas say alltrim(str(nMateria4Faltas)) color (cCorVerde)
      if nMateria4Media < nReprovaMedia
         @ nLinhaMateria4,nColunaMedia say alltrim(transform(nMateria4Media, cNota)) color(cCorVermelho)
      endif
      if nMateria4Faltas > nConselhoFaltas
         @ nLinhaMateria4,nColunaFaltas say alltrim(str(nMateria4Faltas)) color (cCorVermelho)
      endif

      //conselho

      nLinhaFinal := 15

      if (nMateria1Faltas > nConselhoFaltas .and. nMateria1Faltas < nReprovaFaltas) .or. (nMateria2Faltas > nConselhoFaltas .and. nMateria2Faltas < nReprovaFaltas) .or. (nMateria3Faltas > nConselhoFaltas .and. nMateria3Faltas < nReprovaFaltas) .or. (nMateria4Faltas > nConselhoFaltas .and. nMateria4Faltas < nReprovaFaltas)
         @ nLinhaFinal,01 say 'CONFIRMACAO DO CONSELHO: SIM [S] / NAO [N]'
      endif

      if nMateria1Faltas > nConselhoFaltas .and. nMateria1Faltas < nReprovaFaltas
         nLinhaFinal++
         @ nLinhaFinal,01 say cMateria1
         @ nLinhaFinal,20 say 'CONSELHO 1 - ' get cMateria1Conselho1 picture '@!' valid cMateria1Conselho1 $ 'SN'
         @ nLinhaFinal,40 say 'CONSELHO 2 - ' get cMateria1Conselho2 picture '@!' valid cMateria1Conselho2 $ 'SN'
         @ nLinhaFinal,60 say 'CONSELHO 3 - ' get cMateria1Conselho3 picture '@!' valid cMateria1Conselho3 $ 'SN'
      endif

      if nMateria2Faltas > nConselhoFaltas .and. nMateria2Faltas < nReprovaFaltas
         nLinhaFinal++
         @ nLinhaFinal,01 say cMateria2
         @ nLinhaFinal,20 say 'CONSELHO 1 - ' get cMateria2Conselho1 picture '@!' valid cMateria2Conselho1 $ 'SN'
         @ nLinhaFinal,40 say 'CONSELHO 2 - ' get cMateria2Conselho2 picture '@!' valid cMateria2Conselho2 $ 'SN'
         @ nLinhaFinal,60 say 'CONSELHO 3 - ' get cMateria2Conselho3 picture '@!' valid cMateria2Conselho3 $ 'SN'
      endif

      if nMateria3Faltas > nConselhoFaltas .and. nMateria3Faltas < nReprovaFaltas
         nLinhaFinal++
         @ nLinhaFinal,01 say cMateria3
         @ nLinhaFinal,20 say 'CONSELHO 1 - ' get cMateria3Conselho1 picture '@!' valid cMateria3Conselho1 $ 'SN'
         @ nLinhaFinal,40 say 'CONSELHO 2 - ' get cMateria3Conselho2 picture '@!' valid cMateria3Conselho2 $ 'SN'
         @ nLinhaFinal,60 say 'CONSELHO 3 - ' get cMateria3Conselho3 picture '@!' valid cMateria3Conselho3 $ 'SN'
      endif

      if nMateria4Faltas > nConselhoFaltas .and. nMateria4Faltas < nReprovaFaltas
         nLinhaFinal++
         @ nLinhaFinal,01 say cMateria4
         @ nLinhaFinal,20 say 'CONSELHO 1 - ' get cMateria4Conselho1 picture '@!' valid cMateria4Conselho1 $ 'SN'
         @ nLinhaFinal,40 say 'CONSELHO 2 - ' get cMateria4Conselho2 picture '@!' valid cMateria4Conselho2 $ 'SN'
         @ nLinhaFinal,60 say 'CONSELHO 3 - ' get cMateria4Conselho3 picture '@!' valid cMateria4Conselho3 $ 'SN'
      endif

      read
      if lastkey() == 27
         nAlerta := alert(cAlerta, aOpcoes, cCorAlerta)
         if nAlerta == 1
            exit
         elseif nAlerta == 2
            loop
         endif
      endif

      if cMateria1Conselho1 $ 'S'
         nMateria1Conselho++
      endif
      if cMateria1Conselho2 $ 'S'
         nMateria1Conselho++
      endif
      if cMateria1Conselho3 $ 'S'
         nMateria1Conselho++
      endif
      if nMateria1Conselho >= nConselhoAprova
         @ nLinhaMateria1,nColunaFaltas say alltrim(str(nMateria1Faltas)) color (cCorVerde)
      endif

      if cMateria2Conselho1 $ 'S'
         nMateria2Conselho++
      endif
      if cMateria2Conselho2 $ 'S'
         nMateria2Conselho++
      endif
      if cMateria2Conselho3 $ 'S'
         nMateria2Conselho++
      endif
      if nMateria2Conselho >= nConselhoAprova
         @ nLinhaMateria2,nColunaFaltas say alltrim(str(nMateria2Faltas)) color (cCorVerde)
      endif

      if cMateria3Conselho1 $ 'S'
         nMateria3Conselho++
      endif
      if cMateria3Conselho2 $ 'S'
         nMateria3Conselho++
      endif
      if cMateria3Conselho3 $ 'S'
         nMateria3Conselho++
      endif
      if nMateria3Conselho >= nConselhoAprova
         @ nLinhaMateria3,nColunaFaltas say alltrim(str(nMateria3Faltas)) color (cCorVerde)
      endif

      if cMateria4Conselho1 $ 'S'
         nMateria4Conselho++
      endif
      if cMateria4Conselho2 $ 'S'
         nMateria4Conselho++
      endif
      if cMateria4Conselho3 $ 'S'
         nMateria4Conselho++
      endif
      if nMateria4Conselho >= nConselhoAprova
         @ nLinhaMateria4,nColunaFaltas say alltrim(str(nMateria4Faltas)) color (cCorVerde)
      endif

      //verifica reprovacao

      if nMateria1Media < nReprovaMedia .or. nMateria1Faltas > nReprovaFaltas .or. nMateria1Conselho < nConselhoAprova
         nReprova++
         cMateriaReprova += '|' + alltrim(cMateria1) + '|'
      endif

      if nMateria2Media < nReprovaMedia .or. nMateria2Faltas > nReprovaFaltas .or. nMateria2Conselho < nConselhoAprova
         nReprova++
         cMateriaReprova += '|' + alltrim(cMateria2) + '|'
      endif

      if nMateria3Media < nReprovaMedia .or. nMateria3Faltas > nReprovaFaltas .or. nMateria3Conselho < nConselhoAprova
         nReprova++
         cMateriaReprova += '|' + alltrim(cMateria3) + '|'
      endif

      if nMateria4Media < nReprovaMedia .or. nMateria4Faltas > nReprovaFaltas .or. nMateria4Conselho < nConselhoAprova
         nReprova++
         cMateriaReprova += '|' + alltrim(cMateria4) + '|'
      endif

      //bolsista

      cBolsa := space(1)

      nLinhaFinal++

      @ nLinhaFinal,01 say 'BOLSISTA INTEGRAL [I] / BOLSISTA PARCIAL [P] / NAO BOLSISTA [N]: ' get cBolsa picture '@!' valid cBolsa $ 'IPN'
      read

      //tabela final - apresentacao do resultado

      nLinhaFinal++

      if nReprova == 0
         @ nLinhaFinal,01 say 'ALUNO APROVADO' color(cCorVerde)
      endif

      if cBolsa $ 'I'
         nNovaMensalidade := nMensalidade * 0.02
         if nReprova > 0
            @ nLinhaFinal,01 say 'ALUNO REPROVADO COM ' + alltrim(str(nReprova)) + ' DEPENDENCIAS' color(cCorVermelho)
         endif
      endif

      if cBolsa $ 'P'
         nNovaMensalidade := nMensalidade * 0.5
         if nReprova == 1
            @ nLinhaFinal,01 say 'ALUNO APROVADO COM 1 DEPENDENCIA'
         endif
         if nReprova > 1
            @ nLinhaFinal,01 say 'ALUNO REPROVADO COM ' + alltrim(str(nReprova)) + ' DEPENDENCIA(S)' color(cCorVermelho)
         endif
      endif

      if cBolsa $ 'N'
         nNovaMensalidade := nMensalidade
         if nReprova > 0 .and. nReprova <= 2
            nNovaMensalidade := nMensalidade + (0.15 * nReprova * nMensalidade)
            @ nLinhaFinal,01 say 'ALUNO APROVADO COM ' + alltrim(str(nReprova)) + ' DEPENDENCIA(S)'
         endif
         if nReprova > 2
            @ nLinhaFinal,01 say 'ALUNO REPROVADO COM ' + alltrim(str(nReprova)) + ' DEPENDENCIAS(S)' color(cCorVermelho)
         endif
      endif

      if nReprova > 0
         nLinhaFinal++
         @ nLinhaFinal,01 say alltrim(cMateriaReprova)
      endif

      nLinhaFinal++
      @ nLinhaFinal,01 say 'NOVA MENSALIDADE: RS ' + alltrim(transform(nNovaMensalidade, cMascaraMensalidade))
   enddo
enddo
inkey(0)
