// LILIAN AYUMI YAMADA  HAKUTAKE
set color to N/W
clear
setmode(25,80)
set scoreboard off
set date to british
set epoch to 1940

dAtual    := Date()
nAnoAtual := Year(dAtual)
nMesAtual := Month(dAtual)
nDiaAtual := Day(dAtual)

do while .t.

   cNome                 := Space(30)
   dNascimento           := CToD('')
   nAnoNascimento        := 0
   nMesNascimento        := 0
   nDiaNascimento        := 0
   nDiaSemanaNascimento  := 0
   cMesNascimento        := ''
   cDiaSemanaNascimento  := ''
   nAnoIdade             := 0
   nMesIdade             := 0
   nDiaIdade             := 0
   cSigno                := ''
   nDiasMes              := 0
   cFelizAniversario     := ''
   cAniversario          := ''
   dAniversario          := CToD('')
   nAnoAniversario       := 0
   nMesAniversario       := 0
   nDiaAniversario       := 0
   cDiaSemanaAniversario := ''
   cCalendario           := ''
   dCalendario           := CToD('')
   nDiaCalendario        := 01
   nDiaSemanaCalendario  := 0
   cCor                  := 'W/N'
   nLinha                := 0

   clear
   @ nLinha,00 to 24,79 double
   @ ++nLinha,01 say 'DESAFIO DO ANIVERSARIO'
   @ ++nLinha,01 to nLinha,78
   @ ++nLinha,01 say 'DIGITE SEU NOME...: ' get cNome       picture '@!' valid !Empty(cNome)
   @ ++nLinha,01 say 'DATA DE NASCIMENTO: ' get dNascimento              valid !Empty(dNascimento) .and. dNascimento < dAtual

   read
   if LastKey() == 27
      nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'}, cCor)
      if nAlerta == 1
         exit
      else
         loop
      endif
   endif

   nAnoNascimento       := Year(dNascimento)
   nMesNascimento       := Month(dNascimento)
   nDiaNascimento       := Day(dNascimento)
   nDiaSemanaNascimento := DoW(dNascimento)

   if nMesNascimento == 1
      cMesNascimento := 'JANEIRO'
      nDiasMes := 31
      if nDiaNascimento >= 21
         cSigno := 'AQUARIO'
      else
         cSigno := 'CAPRICORNIO'
      endif
   elseif nMesNascimento == 2
      cMesNascimento := 'FEVEREIRO'
      nDiasMes := 28
      if nDiaNascimento >= 19
         cSigno := 'PEIXES'
      else
         cSigno := 'AQUARIO'
      endif
   elseif nMesNascimento == 3
      cMesNascimento := 'MARCO'
      nDiasMes := 31
      if nDiaNascimento >= 21
         cSigno := 'ARIES'
      else
         cSigno := 'PEIXES'
      endif
   elseif nMesNascimento == 4
      cMesNascimento := 'ABRIL'
      nDiasMes := 30
      if nDiaNascimento >= 21
         cSigno := 'TOURO'
      else
         cSigno := 'ARIES'
      endif
   elseif nMesNascimento == 5
      cMesNascimento := 'MAIO'
      nDiasMes := 31
      if nDiaNascimento >= 21
         cSigno := 'GEMEOS'
      else
         cSigno := 'TOURO'
      endif
   elseif nMesNascimento == 6
      cMesNascimento := 'JUNHO'
      nDiasMes := 30
      if nDiaNascimento >= 21
         cSigno := 'CANCER'
      else
         cSigno := 'GEMEOS'
      endif
   elseif nMesNascimento == 7
      cMesNascimento := 'JULHO'
      nDiasMes := 31
      if nDiaNascimento >= 23
         cSigno := 'LEAO'
      else
         cSigno := 'CANCER'
      endif
   elseif nMesNascimento == 8
      cMesNascimento := 'AGOSTO'
      nDiasMes := 31
      if nDiaNascimento >= 23
         cSigno := 'VIRGEM'
      else
         cSigno := 'LEAO'
      endif
   elseif nMesNascimento == 9
      cMesNascimento := 'SETEMBRO'
      nDiasMes := 30
      if nDiaNascimento >= 23
         cSigno := 'LIBRA'
      else
         cSigno := 'VIRGEM'
      endif
   elseif nMesNascimento == 10
      cMesNascimento := 'OUTUBRO'
      nDiasMes := 31
      if nDiaNascimento >= 23
         cSigno := 'ESCORPIAO'
      else
         cSigno := 'LIBRA'
      endif
   elseif nMesNascimento == 11
      cMesNascimento := 'NOVEMBRO'
      nDiasMes := 30
      if nDiaNascimento >= 22
         cSigno := 'SAGITARIO'
      else
         cSigno := 'ESCORPIAO'
      endif
   elseif nMesNascimento == 12
      cMesNascimento := 'DEZEMBRO'
      nDiasMes := 31
      if nDiaNascimento >= 22
         cSigno := 'CAPRICORNIO'
      else
         cSigno := 'SAGITARIO'
      endif
   endif

   if nDiaSemanaNascimento == 1
      cDiaSemanaNascimento := 'DOMINGO'
   elseif nDiaSemanaNascimento == 2
      cDiaSemanaNascimento := 'SEGUNDA - FEIRA'
   elseif nDiaSemanaNascimento == 3
      cDiaSemanaNascimento := 'TERCA - FEIRA'
   elseif nDiaSemanaNascimento == 4
      cDiaSemanaNascimento := 'QUARTA - FEIRA'
   elseif nDiaSemanaNascimento == 5
      cDiaSemanaNascimento := 'QUINTA - FEIRA'
   elseif nDiaSemanaNascimento == 6
      cDiaSemanaNascimento := 'SEXTA - FEIRA'
   elseif nDiaSemanaNascimento == 7
      cDiaSemanaNascimento := 'SABADO'
   endif

   nAnoIdade := nAnoAtual - nAnoNascimento
   nMesIdade := nMesAtual - nMesNascimento
   nDiaIdade := nDiaAtual - nDiaNascimento

   if nMesIdade == 0 .and. nDiaIdade == 0
      cFelizAniversario := 'FELIZ ANIVERSARIO!'
   endif

   if nMesIdade < 0 .or. (nMesIdade == 0 .and. nDiaIdade < 0)
      nAnoIdade--
      nMesIdade += 12
   endif

   if nDiaIdade < 0
      nDiaIdade += nDiasMes
      nMesIdade--
   endif

   cAniversario := Str(nDiaNascimento) + '/' + Str(nMesNascimento) + '/' + Str(nAnoAtual + 1)
   nMesAniversario := 11 - nMesIdade
   nDiaAniversario := nDiasMes - nDiaIdade

   if nMesAtual < nMesNascimento
      cAniversario := Str(nDiaNascimento) + '/' + Str(nMesNascimento) + '/' + Str(nAnoAtual)
   endif

   dAniversario          := CToD (cAniversario)
   nAnoAniversario       := Year(dAniversario)
   nDiaSemanaAniversario := DoW(dAniversario)

   if nDiaSemanaAniversario == 1
      cDiaSemanaAniversario := 'DOMINGO'
   elseif nDiaSemanaAniversario == 2
      cDiaSemanaAniversario := 'SEGUNDA - FEIRA'
   elseif nDiaSemanaAniversario == 3
      cDiaSemanaAniversario := 'TERCA - FEIRA'
   elseif nDiaSemanaAniversario == 4
      cDiaSemanaAniversario := 'QUARTA - FEIRA'
   elseif nDiaSemanaAniversario == 5
      cDiaSemanaAniversario := 'QUINTA - FEIRA'
   elseif nDiaSemanaAniversario == 6
      cDiaSemanaAniversario := 'SEXTA - FEIRA'
   elseif nDiaSemanaAniversario == 7
      cDiaSemanaAniversario := 'SABADO'
   endif

   @ ++nLinha,01 say 'NASCIDO(A) EM...............: ' + Alltrim(Str(nDiaNascimento)) + ' DE ' + cMesNascimento + ' DE ' + Alltrim(Str(nAnoNascimento))
   @ ++nLinha,01 say 'NASCIDO(A) EM UM(A).........: ' + cDiaSemanaNascimento
   @ ++nLinha,01 say 'IDADE.......................: ' + Alltrim(Str(nAnoIdade)) + ' ANO(S) ' + Alltrim(Str(nMesIdade)) + ' MES(ES) ' + Alltrim(Str(nDiaIdade)) + ' DIA(S) '
   @ ++nLinha,01 say 'SIGNO.......................: ' + cSigno
   @ ++nLinha,01 say 'PROXIMO ANIVERSARIO EM......: ' + Alltrim(Str(nMesAniversario)) + ' MES(ES) ' + Alltrim(Str(nDiaAniversario)) + ' DIA(S)'
   @ ++nLinha,01 say 'PROXIMO ANIVERSARIO EM UM(A): ' + cDiaSemanaAniversario
   @ ++nLinha,01 say 'CALENDARIO..................: ' + cMesNascimento + ' DE ' + Alltrim(Str(nAnoAniversario))
   @ ++nLinha,01 say cFelizAniversario


   @ ++nLinha,28 to 23,49
   @ ++nLinha,29 say cMesNascimento + ' DE ' + Alltrim(Str(nAnoAniversario))
   @ ++nLinha,29 to nLinha,48

   @ ++nLinha,30 say 'D  S  T  Q  Q  S  S'
   nLinha++

   do while nDiaCalendario <= nDiasMes

      cCalendario := Alltrim(Str(nDiaCalendario)) + '/' + Alltrim(Str(nMesNascimento)) + '/' + Alltrim(Str(nAnoAniversario))
      dCalendario := CToD (cCalendario)

      nDiaSemanaCalendario := DoW(dCalendario)
      cDiaCalendario       := Transform(nDiaCalendario, '99')

      if nDiaCalendario == nDiaNascimento
         cCor := 'W/N'
      else
         cCor := 'N/W'
      endif

      if nDiaSemanaCalendario == 1
         @ nLinha,29 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 2
         @ nLinha,32 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 3
         @ nLinha,35 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 4
         @ nLinha,38 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 5
         @ nLinha,41 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 6
         @ nLinha,44 say cDiaCalendario color cCor
      elseif nDiaSemanaCalendario == 7
         @ nLinha,47 say cDiaCalendario color cCor
      endif

      if nDiaSemanaCalendario == 7
         nLinha++
      endif
      nDiaCalendario++

   enddo


   inkey(0)
enddo
inkey(0)
