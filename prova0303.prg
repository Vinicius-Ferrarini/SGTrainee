// LILIAN AYUMI YAMADA HAKUTAKE

set color to 'N/W'
clear
SetMode (25,80)
set date to british
set epoch to 1930

cNome       := Space(30)
dNascimento := CToD('')
dAtual      := Date()-10
nAnoAtual   := Year(dAtual)
nMesAtual   := Month(dAtual)
nDiaAtual   := Day(dAtual)
nAnoNascimento       := 0
nMesNascimento       := 0
nDiaNascimento       := 0
nDiaSemanaNascimento := 0
cMesNascimento       := ''
cDiaSemanaNascimento := ''
nAnoIdade            := 0
nMesIdade            := 0
nDiaIdade            := 0
cSigno               := ''
nDiasMes             := 0
nAnoAniversario      := 0
nMesAniversario      := 0
nDiaAniversario      := 0
cDiaSemanaAniversario:= ''
cAniversario         := ''
nMesProximoAniversario:= 0
nDiaProximoAniversario:=0
nDiaCalendario := 01
nDiaSemanaCalendario := 0
nLinha := 17
cCor := 'N/W'

@ 01,01 to 24,79 double
@ 03,02 to 03,78 double
@ 07,02 to 07,78

@ 02,02 say "DESAFIO DO ANIVERSARIO"
@ 04,02 say "COLETA DE DADOS"
@ 05,02 say "NOME: "
@ 06,02 say "DATA DE NASCIMENTO: "

@ 05,25 get cNome       picture '@!' valid !Empty(cNome)
@ 06,25 get dNascimento              valid !Empty(dNascimento) .and. dNascimento < dAtual
read

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

if nMesAtual < nMesNascimento .or. (nMesAtual == nMesNascimento .and. nDiaAtual < nDiaNascimento)
   nAnoIdade--
   nMesIdade := nMesAtual + (12 - nMesNascimento)
endif

if nDiaAtual < nDiaNascimento
   nDiaIdade := nDiaAtual + (nDiasMes - nDiaNascimento)
   nMesIdade--
endif

if nMesAtual == nMesNascimento .and. nDiaAtual == nDiaNascimento
   cAniversario := 'FELIZ ANIVERSARIO!'
endif

dAniversario := CToD (Transform(nDiaNascimento, '99') + '/' + Transform(nMesNascimento, '99') + '/' + Transform(nAnoAtual + 1,'9999'))

if nMesAtual < nMesNascimento .or. (nMesNascimento == nMesAtual .and. nDiaAtual < nDiaNascimento)
   dAniversario := CToD (Transform(nDiaNascimento, '99') + '/' + Transform(nMesNascimento, '99') + '/' + Transform(nAnoAtual,'9999'))
endif

nAnoAniversario       := Year(dAniversario)
nMesAniversario       := Month(dAniversario)
nDiaAniversario       := Day(dAniversario)
nDiaSemanaAniversario := DoW(dAniversario)

nDiaProximoAniversario := nDiasMes - nDiaAtual + nDiaAniversario
nMesProximoAniversario := 11 - nMesAtual + nMesAniversario

if nMesAtual < nMesAniversario .or. (nMesAniversario == nMesAtual .and. nDiaAtual < nDiaAniversario)
   nMesProximoAniversario := nMesAniversario - nMesAtual
   nDiaProximoAniversario := nDiaAniversario - nDiaAtual
endif

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

do while nDiaCalendario <= nDiasMes

   dCalendario := CToD (Transform(nDiaCalendario, '99') + '/' + Transform(nMesNascimento, '99') + '/' + Transform(nAnoAtual + 1,'9999'))

   if nMesAtual < nMesNascimento .or. (nMesNascimento == nMesAtual .and. nDiaAtual < nDiaNascimento)
      dCalendario := CToD (Transform(nDiaCalendario, '99') + '/' + Transform(nMesNascimento, '99') + '/' + Transform(nAnoAtual,'9999'))
   endif

   nDiaSemanaCalendario := DoW(dCalendario)
   cDiaCalendario := Transform(nDiaCalendario,'99')

   if nDiaCalendario == nDiaAniversario
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
   else
      @ nLinha,47 say cDiaCalendario color cCor
   endif

   if nDiaSemanaCalendario == 7 .and. nDiaCalendario > 1
      nLinha++
   endif
   nDiaCalendario++

enddo

@ 08,02 say 'DATA DE NASCIMENTO: ' + Transform(nDiaNascimento, '99') + ' DE ' + cMesNascimento + ' DE ' + Transform (nAnoNascimento, '9999') + cAniversario
@ 09,02 say 'DIA DA SEMANA DE NASCIMENTO: ' + cDiaSemanaNascimento
@ 10,02 say 'IDADE: ' + Transform(nAnoIdade, '999') + ' ANOS ' + Transform(nMesIdade, '99') + ' MES(ES) ' + Transform (nDiaIdade, '999') + ' DIA(S) '
@ 11,02 say 'SIGNO: ' + cSigno
@ 12,02 say 'PROXIMO ANIVERSARIO: ' + Transform(nMesProximoAniversario, '99') + ' MES(ES) ' + Transform (nDiaProximoAniversario, '999') + ' DIA(S)'
@ 13,02 say 'DIA SEMANA DO ANIVERSARIO: ' + cDiaSemanaAniversario
@ 14,02 say 'CALENDARIO: ' + cMesNascimento + ' DE ' + Transform(nAnoAniversario, '9999')
@ 15,02 say cAniversario
@ 15,28 to 23,49
@ 16,30 say 'D'
@ 16,33 say 'S'
@ 16,36 say 'T'
@ 16,39 say 'Q'
@ 16,42 say 'Q'
@ 16,45 say 'S'
@ 16,48 say 'S'
InKey(0)
