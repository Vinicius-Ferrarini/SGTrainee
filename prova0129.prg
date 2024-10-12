// Jo�o Pedro Ricardo
//
//

setmode (25,80)
set date British
set epoch to 1940
set scoreboard off
set century on

clear

//Variaveis
//============================================================================\\
// Utilitarios
cPictureTextos      := "@!"
cPictureNotasFaltas := "99"

//Resultado da nota e faltas do aluno
cCorResultado       := "G/D"
cResultado          := "Aprovado"
cResultadoFinal     := "O Aluno Foi Aprovado sem Dependencias"
cMensalidade        := "A mensalidade Continua a mesma"

nReprovado          := 0
nValorMensalidadeNovo := 0

cReprovadoMateria1  := ""
cReprovadoMateria2  := ""
cReprovadoMateria3  := ""
cReprovadoMateria4  := ""

//Dados institui��o
cNomeInstituicao     := "UniSG - Universidade unida da SG."
cEnderecoInstituicao := "Aquela Rua Numero 560"

cDataAtual           := DToC(Date())

//Dados Aluno
cNomeAluno           := Space(52)
cCursoAluno          := Space(20)

nSerie                := 0
nAnoLetivo            := 0
nValorMensalidade     := 0

dDataNascimentoAluno := CToD("")

//Dados Disciplinas Aluno
cDisciplina     := Space(15)

//Nota Diciplina
nNotaDisciplinaBimestre1 := 0
nNotaDisciplinaBimestre2 := 0
nNotaDisciplinaBimestre3 := 0
nNotaDisciplinaBimestre4 := 0

nNotaTotalDisciplinaUm := 0

//Faltas Diciplina
nFaltasDisciplinaBimestre1 := 0
nFaltasDisciplinaBimestre2 := 0
nFaltasDisciplinaBimestre3 := 0
nFaltasDisciplinaBimestre4 := 0

nFaltasTotaisDisciplina := 0
//============================================================================\\
//=====================================================================================================================================================================\\

@ 00,01 to 03,79
@ 04,01 to 08,79

@ 01,02 say cNomeInstituicao + " Endereco: " + cEnderecoInstituicao
@ 02,02 say "Data: " + cDataAtual

@ 05,02 say "Dados do Aluno"
@ 05,18 say "Nome: "
@ 06,02 say "Mensalidade: "
@ 06,49 say "Curso: "
@ 07,02 say "Data de Nascimento: "
@ 07,49 say "serie: "
@ 07,60 say "Ano Letivo: "


@ 05,24 get cNomeAluno           picture cPictureTextos  valid !Empty(cNomeAluno)
@ 06,15 get nValorMensalidade    picture "@e 999,999.99" valid nValorMensalidade > 0
@ 06,56 get cCursoAluno          picture cPictureTextos  Valid !Empty(cCursoAluno)
@ 07,22 get dDataNascimentoAluno                         Valid !Empty(dDataNascimentoAluno) .and. dDataNascimentoAluno < Date()
@ 07,56 get nSerie               picture "99"            valid nSerie > 0
@ 07,72 get nAnoLetivo           picture "9999"          valid nAnoLetivo > 2000 .and. nAnoLetivo > Year(dDataNascimentoAluno)
read

@ 09,01 to 21,79

@ 11,02 to 11,78
@ 13,02 to 13,78
@ 15,02 to 15,78
@ 17,02 to 17,78
@ 19,02 to 19,78


@ 10,17 to 20,17
@ 10,29 to 20,29
@ 10,41 to 20,41
@ 10,53 to 20,53
@ 10,65 to 20,65



@ 10,18 say "1 Bimestre"
@ 10,30 say "2 Bimestre"
@ 10,42 say "3 Bimestre"
@ 10,54 say "4 Bimestre"
@ 10,66 say "Resultado"
@ 12,02 say " Materia "
@ 12,18 say "Nota/Faltas"
@ 12,30 say "Nota/Faltas"
@ 12,42 say "Nota/Faltas"
@ 12,54 say "Nota/Faltas"

//=====================================================================================================================================================================\\
//Disciplina 1

@ 14,02 get cDisciplina                picture cPictureTextos      valid !Empty(cDisciplina)
@ 14,19 get nNotaDisciplinaBimestre1   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre1 >= 0 .and. nNotaDisciplinaBimestre1 <= 10
@ 14,24 get nFaltasDisciplinaBimestre1 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre1 >= 0 .and. nFaltasDisciplinaBimestre1 <= 61
@ 14,31 get nNotaDisciplinaBimestre2   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre2 >= 0 .and. nNotaDisciplinaBimestre2 <= 10
@ 14,36 get nFaltasDisciplinaBimestre2 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre2 >= 0 .and. nFaltasDisciplinaBimestre2 <= 61
@ 14,43 get nNotaDisciplinaBimestre3   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre3 >= 0 .and. nNotaDisciplinaBimestre3 <= 10
@ 14,48 get nFaltasDisciplinaBimestre3 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre3 >= 0 .and. nFaltasDisciplinaBimestre3 <= 61
@ 14,55 get nNotaDisciplinaBimestre4   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre4 >= 0 .and. nNotaDisciplinaBimestre4 <= 10
@ 14,60 get nFaltasDisciplinaBimestre4 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre4 >= 0 .and. nFaltasDisciplinaBimestre4 <= 61
read

nFaltasTotaisDisciplina := nFaltasDisciplinaBimestre1 + nFaltasDisciplinaBimestre2 + nFaltasDisciplinaBimestre3 + nFaltasDisciplinaBimestre4
nNotaTotalDisciplina    := (nNotaDisciplinaBimestre1 + nNotaDisciplinaBimestre2 + nNotaDisciplinaBimestre3 + nNotaDisciplinaBimestre4) / 4

if nFaltasTotaisDisciplina >= 48
   cResultado         := "Reprovado"
   cCorResultado      := "R/D"
   cReprovadoMateria1 := cDisciplina
   nReprovado++
elseif nNotaTotalDisciplina < 6
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria1 := cDisciplina
   nReprovado++
endif

@ 14,67 say cResultado color cCorResultado

//Resetando as variaveis ( preparando para um do while )
cCorResultado     := "W/G"
cResultado        := "P"

cDisciplina := Space(15)

//Notas Diciplina
nNotaDisciplinaBimestre1 := 0
nNotaDisciplinaBimestre2 := 0
nNotaDisciplinaBimestre3 := 0
nNotaDisciplinaBimestre4 := 0

nNotaTotalDisciplinaUm := 0

//Faltas Diciplina
nFaltasDisciplinaBimestre1 := 0
nFaltasDisciplinaBimestre2 := 0
nFaltasDisciplinaBimestre3 := 0
nFaltasDisciplinaBimestre4 := 0

nFaltasTotaisDisciplina := 0

//=====================================================================================================================================================================\\
//Disciplina 2

@ 16,02 get cDisciplina                picture cPictureTextos      valid !Empty(cDisciplina)
@ 16,19 get nNotaDisciplinaBimestre1   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre1 >= 0 .and. nNotaDisciplinaBimestre1 <= 10
@ 16,24 get nFaltasDisciplinaBimestre1 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre1 >= 0 .and. nFaltasDisciplinaBimestre1 <= 61
@ 16,31 get nNotaDisciplinaBimestre2   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre2 >= 0 .and. nNotaDisciplinaBimestre2 <= 10
@ 16,36 get nFaltasDisciplinaBimestre2 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre2 >= 0 .and. nFaltasDisciplinaBimestre2 <= 61
@ 16,43 get nNotaDisciplinaBimestre3   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre3 >= 0 .and. nNotaDisciplinaBimestre3 <= 10
@ 16,48 get nFaltasDisciplinaBimestre3 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre3 >= 0 .and. nFaltasDisciplinaBimestre3 <= 61
@ 16,55 get nNotaDisciplinaBimestre4   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre4 >= 0 .and. nNotaDisciplinaBimestre4 <= 10
@ 16,60 get nFaltasDisciplinaBimestre4 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre4 >= 0 .and. nFaltasDisciplinaBimestre4 <= 61
read

nFaltasTotaisDisciplina := nFaltasDisciplinaBimestre1 + nFaltasDisciplinaBimestre2 + nFaltasDisciplinaBimestre3 + nFaltasDisciplinaBimestre4
nNotaTotalDisciplina    := (nNotaDisciplinaBimestre1 + nNotaDisciplinaBimestre2 + nNotaDisciplinaBimestre3 + nNotaDisciplinaBimestre4) / 4

if nFaltasTotaisDisciplina >= 48
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria2 := cDisciplina
   nReprovado++
elseif nNotaTotalDisciplina < 6
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria2 := cDisciplina
   nReprovado++
endif

@ 16,67 say cResultado color cCorResultado

//Resetando as variaveis ( preparando para um do while )
cCorResultado     := "W/G"
cResultado        := "P"

cDisciplina := Space(15)

//Notas Diciplina
nNotaDisciplinaBimestre1 := 0
nNotaDisciplinaBimestre2 := 0
nNotaDisciplinaBimestre3 := 0
nNotaDisciplinaBimestre4 := 0

nNotaTotalDisciplinaUm := 0

//Faltas Diciplina
nFaltasDisciplinaBimestre1 := 0
nFaltasDisciplinaBimestre2 := 0
nFaltasDisciplinaBimestre3 := 0
nFaltasDisciplinaBimestre4 := 0

nFaltasTotaisDisciplina := 0

//=====================================================================================================================================================================\\
//Disciplina 3

@ 18,02 get cDisciplina                picture cPictureTextos      valid !Empty(cDisciplina)
@ 18,19 get nNotaDisciplinaBimestre1   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre1 >= 0 .and. nNotaDisciplinaBimestre1 <= 10
@ 18,24 get nFaltasDisciplinaBimestre1 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre1 >= 0 .and. nFaltasDisciplinaBimestre1 <= 61
@ 18,31 get nNotaDisciplinaBimestre2   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre2 >= 0 .and. nNotaDisciplinaBimestre2 <= 10
@ 18,36 get nFaltasDisciplinaBimestre2 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre2 >= 0 .and. nFaltasDisciplinaBimestre2 <= 61
@ 18,43 get nNotaDisciplinaBimestre3   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre3 >= 0 .and. nNotaDisciplinaBimestre3 <= 10
@ 18,48 get nFaltasDisciplinaBimestre3 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre3 >= 0 .and. nFaltasDisciplinaBimestre3 <= 61
@ 18,55 get nNotaDisciplinaBimestre4   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre4 >= 0 .and. nNotaDisciplinaBimestre4 <= 10
@ 18,60 get nFaltasDisciplinaBimestre4 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre4 >= 0 .and. nFaltasDisciplinaBimestre4 <= 61
read

nFaltasTotaisDisciplina := nFaltasDisciplinaBimestre1 + nFaltasDisciplinaBimestre2 + nFaltasDisciplinaBimestre3 + nFaltasDisciplinaBimestre4
nNotaTotalDisciplina    := (nNotaDisciplinaBimestre1 + nNotaDisciplinaBimestre2 + nNotaDisciplinaBimestre3 + nNotaDisciplinaBimestre4) / 4

if nFaltasTotaisDisciplina >= 48
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria3 := cDisciplina
   nReprovado++
elseif nNotaTotalDisciplina < 6
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria3 := cDisciplina
   nReprovado++
endif

@ 18,67 say cResultado color cCorResultado

//Resetando as variaveis ( preparando para um do while )
cCorResultado     := "W/G"
cResultado        := "P"

cDisciplina := Space(15)

//Notas Diciplina
nNotaDisciplinaBimestre1 := 0
nNotaDisciplinaBimestre2 := 0
nNotaDisciplinaBimestre3 := 0
nNotaDisciplinaBimestre4 := 0

nNotaTotalDisciplinaUm := 0

//Faltas Diciplina
nFaltasDisciplinaBimestre1 := 0
nFaltasDisciplinaBimestre2 := 0
nFaltasDisciplinaBimestre3 := 0
nFaltasDisciplinaBimestre4 := 0

nFaltasTotaisDisciplina := 0

//=====================================================================================================================================================================\\
//Disciplina 4

@ 20,02 get cDisciplina                picture cPictureTextos      valid !Empty(cDisciplina)
@ 20,19 get nNotaDisciplinaBimestre1   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre1 >= 0 .and. nNotaDisciplinaBimestre1 <= 10
@ 20,24 get nFaltasDisciplinaBimestre1 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre1 >= 0 .and. nFaltasDisciplinaBimestre1 <= 61
@ 20,31 get nNotaDisciplinaBimestre2   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre2 >= 0 .and. nNotaDisciplinaBimestre2 <= 10
@ 20,36 get nFaltasDisciplinaBimestre2 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre2 >= 0 .and. nFaltasDisciplinaBimestre2 <= 61
@ 20,43 get nNotaDisciplinaBimestre3   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre3 >= 0 .and. nNotaDisciplinaBimestre3 <= 10
@ 20,48 get nFaltasDisciplinaBimestre3 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre3 >= 0 .and. nFaltasDisciplinaBimestre3 <= 61
@ 20,55 get nNotaDisciplinaBimestre4   picture cPictureNotasFaltas valid nNotaDisciplinaBimestre4 >= 0 .and. nNotaDisciplinaBimestre4 <= 10
@ 20,60 get nFaltasDisciplinaBimestre4 picture cPictureNotasFaltas valid nFaltasDisciplinaBimestre4 >= 0 .and. nFaltasDisciplinaBimestre4 <= 61
read

nFaltasTotaisDisciplina := nFaltasDisciplinaBimestre1 + nFaltasDisciplinaBimestre2 + nFaltasDisciplinaBimestre3 + nFaltasDisciplinaBimestre4
nNotaTotalDisciplina    := (nNotaDisciplinaBimestre1 + nNotaDisciplinaBimestre2 + nNotaDisciplinaBimestre3 + nNotaDisciplinaBimestre4) / 4

if nFaltasTotaisDisciplina >= 48
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria4 := cDisciplina
   nReprovado++
elseif nNotaTotalDisciplina < 6
   cResultado    := "Reprovado"
   cCorResultado := "R/D"
   cReprovadoMateria4 := cDisciplina
   nReprovado++
endif

@ 20,67 say cResultado color cCorResultado

//If para ver se ele reprovou ou ficou de dependencia
if nReprovado = 1
   cResultadoFinal       := "Aluno Aprovado com Uma Dependencia em " + Alltrim(cReprovadoMateria1) + Alltrim(cReprovadoMateria2) + Alltrim(cReprovadoMateria3) + Alltrim(cReprovadoMateria4)
   nValorMensalidadeNovo := nValorMensalidade + ( ( nValorMensalidade * 15 ) / 100 )
   cMensalidade          := "A nova mensalidade e de " + Alltrim(Str(nValorMensalidadeNovo))

elseif nReprovado = 2
   nValorMensalidadeNovo := nValorMensalidade + ( ( nValorMensalidade * 15 ) / 100 ) + ( ( nValorMensalidade * 15 ) / 100 )
   cMensalidade          := "A nova mensalidade e de " + Alltrim(Str(nValorMensalidadeNovo))

   if !Empty(cReprovadoMateria1) .and. !Empty(cReprovadoMateria2)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria1) + " e em " + Alltrim(cReprovadoMateria2)

   elseif !Empty(cReprovadoMateria1) .and. !Empty(cReprovadoMateria3)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria1) + " e em " + Alltrim(cReprovadoMateria3)

   elseif !Empty(cReprovadoMateria1) .and. !Empty(cReprovadoMateria4)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria1) + " e em " + Alltrim(cReprovadoMateria4)

   elseif !Empty(cReprovadoMateria2) .and. !Empty(cReprovadoMateria3)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria2) + " e em " + Alltrim(cReprovadoMateria3)

   elseif !Empty(cReprovadoMateria2) .and. !Empty(cReprovadoMateria4)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria2) + " e em " + Alltrim(cReprovadoMateria4)

   elseif !Empty(cReprovadoMateria3) .and. !Empty(cReprovadoMateria4)
      cResultadoFinal := "Aluno Aprovado com Duas Dependencia sendo elas " + Alltrim(cReprovadoMateria3) + " e em " + Alltrim(cReprovadoMateria4)

   endif

elseif nReprovado > 3
   cResultadoFinal := "Aluno esta Reprovado por ter 3 ou mais disciplina de depencia"
   cMensalidade    := "Mesalidade nao calculado por que o aluno esta reprovado"

endif

@ 21,01 to 24,79

@ 22,02 say cResultadoFinal
@ 23,02 say cMensalidade

Inkey(0)
