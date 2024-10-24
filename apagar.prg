set epoch to 1940
set date brit

clear

//Informações

@ 01,20 say "IEM - Instituto Educacional Maringaense"
@ 03,05 say "Nome.:"
@ 03,48 say "Data Nascimento:"
@ 04,05 say "Curso: "
@ 04,28 say "Ano: "
@ 04,36 say "Turma: "
@ 04,46 say "Valor Mensalidade: "

cNomeAluno   := Space(37)
dNascimento  := CToD("")
cCurso       := Space(15)
nAnoCurso    := 0
cTurmaCurso  := Space(1)
nValorMensal := 0
dAtual       := Date()

@ 03,11 get cNomeAluno   picture "@!"       valid !empty (cNomeAluno)
@ 03,65 get dNascimento                     valid dNascimento <= dAtual -6000
@ 04,11 get cCurso       picture "@!"       valid !empty (cCurso)
@ 04,33 get nAnoCurso    picture "99"       valid nAnoCurso > 0 .and. nAnoCurso < 6
@ 04,43 get cTurmaCurso  picture "@!"       valid !empty (cTurmaCurso)
@ 04,65 get nValorMensal picture "99999.99" valid nValorMensal > 0 .and. nValorMensal < 9999
read

cMateria1 := Space(18)
cMateria2 := Space(18)
cMateria3 := Space(18)
cMateria4 := Space(18)
nNotaAB1  := 0
nNotaAB2  := 0
nNotaAB3  := 0
nNotaAB4  := 0
nNotaBB1  := 0
nNotaBB2  := 0
nNotaBB3  := 0
nNotaBB4  := 0
nNotaCB1  := 0
nNotaCB2  := 0
nNotaCB3  := 0
nNotaCB4  := 0
nNotaDB1  := 0
nNotaDB2  := 0
nNotaDB3  := 0
nNotaDB4  := 0
nFaltaAB1 := 0
nFaltaAB2 := 0
nFaltaAB3 := 0
nFaltaAB4 := 0
nFaltaBB1 := 0
nFaltaBB2 := 0
nFaltaBB3 := 0
nFaltaBB4 := 0
nFaltaCB1 := 0
nFaltaCB2 := 0
nFaltaCB3 := 0
nFaltaCB4 := 0
nFaltaDB1 := 0
nFaltaDB2 := 0
nFaltaDB3 := 0
nFaltaDB4 := 0

//cabeçalho disciplinas

@ 06,32 say "DISCIPLINAS"
@ 08,02 say "DISCIPLINA"
@ 08,23 say "1 BIMESTRE"
@ 08,38 say "2 BIMESTRE"
@ 08,53 say "3 BIMESTRE"
@ 08,68 say "4 BIMESTRE"

//Primeira Disciplina

@ 09,02 say "1:"
@ 09,23 say "N"
@ 09,28 say "F"
@ 09,38 say "N"
@ 09,43 say "F"
@ 09,53 say "N"
@ 09,58 say "F"
@ 09,68 say "N"
@ 09,73 say "F"

//Segunda Disciplina

@ 11,02 say "2:"
@ 11,23 say "N"
@ 11,28 say "F"
@ 11,38 say "N"
@ 11,43 say "F"
@ 11,53 say "N"
@ 11,58 say "F"
@ 11,68 say "N"
@ 11,73 say "F"

//Terceira Disciplina

@ 13,02 say "3:"
@ 13,23 say "N"
@ 13,28 say "F"
@ 13,38 say "N"
@ 13,43 say "F"
@ 13,53 say "N"
@ 13,58 say "F"
@ 13,68 say "N"
@ 13,73 say "F"

//Quarta Disciplina

@ 15,02 say "4:"
@ 15,23 say "N"
@ 15,28 say "F"
@ 15,38 say "N"
@ 15,43 say "F"
@ 15,53 say "N"
@ 15,58 say "F"
@ 15,68 say "N"
@ 15,73 say "F"

@ 09,04 get cMateria1 valid !empty(cMateria1)                    picture "@!"
@ 09,25 get nNotaAB1  valid nNotaAB1  >= 0 .and. nNotaAB1  <= 10 picture "99.9"
@ 09,30 get nFaltaAB1 valid nFaltaAB1 >= 0 .and. nFaltaAB1 < 500 picture "999"
@ 09,40 get nNotaAB2  valid nNotaAB2  >= 0 .and. nNotaAB2  <= 10 picture "99.9"
@ 09,45 get nFaltaAB2 valid nFaltaAB2 >= 0 .and. nFaltaAB2 < 500 picture "999"
@ 09,55 get nNotaAB3  valid nNotaAB3  >= 0 .and. nNotaAB3  <= 10 picture "99.9"
@ 09,60 get nFaltaAB3 valid nFaltaAB3 >= 0 .and. nFaltaAB3 < 500 picture "999"
@ 09,70 get nNotaAB4  valid nNotaAB4  >= 0 .and. nNotaAB4  <= 10 picture "99.9"
@ 09,75 get nFaltaAB4 valid nFaltaAB4 >= 0 .and. nFaltaAB4 < 500 picture "999"
read

@ 11,04 get cMateria2 valid !empty(cMateria2)                    picture "@!"
@ 11,25 get nNotaBB1  valid nNotaBB1  >= 0 .and. nNotaBB1  <= 10 picture "99.9"
@ 11,30 get nFaltaBB1 valid nFaltaBB1 >= 0 .and. nFaltaBB1 < 500 picture "999"
@ 11,40 get nNotaBB2  valid nNotaBB2  >= 0 .and. nNotaBB2  <= 10 picture "99.9"
@ 11,45 get nFaltaBB2 valid nFaltaBB2 >= 0 .and. nFaltaBB2 < 500 picture "999"
@ 11,55 get nNotaBB3  valid nNotaBB3  >= 0 .and. nNotaBB3  <= 10 picture "99.9"
@ 11,60 get nFaltaBB3 valid nFaltaBB3 >= 0 .and. nFaltaBB3 < 500 picture "999"
@ 11,70 get nNotaBB4  valid nNotaBB4  >= 0 .and. nNotaAB4  <= 10 picture "99.9"
@ 11,75 get nFaltaBB4 valid nFaltaBB4 >= 0 .and. nFaltaBB4 < 500 picture "999"
read

@ 13,04 get cMateria3 valid !empty(cMateria3)                    picture "@!"
@ 13,25 get nNotaCB1  valid nNotaCB1  >= 0 .and. nNotaCB1  <= 10 picture "99.9"
@ 13,30 get nFaltaCB1 valid nFaltaCB1 >= 0 .and. nFaltaCB1 < 500 picture "999"
@ 13,40 get nNotaCB2  valid nNotaCB2  >= 0 .and. nNotaCB2  <= 10 picture "99.9"
@ 13,45 get nFaltaCB2 valid nFaltaCB2 >= 0 .and. nFaltaCB2 < 500 picture "999"
@ 13,55 get nNotaCB3  valid nNotaCB3  >= 0 .and. nNotaCB3  <= 10 picture "99.9"
@ 13,60 get nFaltaCB3 valid nFaltaCB3 >= 0 .and. nFaltaCB3 < 500 picture "999"
@ 13,70 get nNotaCB4  valid nNotaCB4  >= 0 .and. nNotaCB4  <= 10 picture "99.9"
@ 13,75 get nFaltaCB4 valid nFaltaCB4 >= 0 .and. nFaltaCB4 < 500 picture "999"
read

@ 15,04 get cMateria4 valid !empty(cMateria4)                    picture "@!"
@ 15,25 get nNotaDB1  valid nNotaDB1  >= 0 .and. nNotaDB1  <= 10 picture "99.9"
@ 15,30 get nFaltaDB1 valid nFaltaDB1 >= 0 .and. nFaltaDB1 < 500 picture "999"
@ 15,40 get nNotaDB2  valid nNotaDB2  >= 0 .and. nNotaDB2  <= 10 picture "99.9"
@ 15,45 get nFaltaDB2 valid nFaltaDB2 >= 0 .and. nFaltaDB2 < 500 picture "999"
@ 15,55 get nNotaDB3  valid nNotaDB3  >= 0 .and. nNotaDB3  <= 10 picture "99.9"
@ 15,60 get nFaltaDB3 valid nFaltaDB3 >= 0 .and. nFaltaDB3 < 500 picture "999"
@ 15,70 get nNotaDB4  valid nNotaDB4  >= 0 .and. nNotaDB4  <= 10 picture "99.9"
@ 15,75 get nFaltaDB4 valid nFaltaDB4 >= 0 .and. nFaltaDB4 < 500 picture "999"
read

nMedia1    := (nNotaAB1+nNotaAB2+nNotaAB3+nNotaAB4)/4
nFalta1    := (nFaltaAB1+nFaltaAB2+nFaltaAB3+nFaltaAB4)
nMedia2    := (nNotaBB1+nNotaBB2+nNotaBB3+nNotaBB4)/4
nFalta2    := (nFaltaBB1+nFaltaBB2+nFaltaBB3+nFaltaBB4)
nMedia3    := (nNotaCB1+nNotaCB2+nNotaCB3+nNotaCB4)/4
nFalta3    := (nFaltaCB1+nFaltaCB2+nFaltaCB3+nFaltaCB4)
nMedia4    := (nNotaDB1+nNotaDB2+nNotaDB3+nNotaDB4)/4
nFalta4    := (nFaltaDB1+nFaltaDB2+nFaltaDB3+nFaltaDB4)
nDp        := 0
nMensalDp1 := 0
nMensalDp2 := 0
nMensalDp3 := 0
nMensalDp4 := 0

/*
clear

@ 01,20 say "IEM - Instituto Educacional Maringaense"
@ 03,05 say "Nome: " + (AllTrim(cNomeAluno))
@ 03,48 say "Data Nascimento:" + DToC(dNascimento)
@ 04,05 say "Curso: " + (AllTrim(cCurso))
@ 04,28 say "Ano: " + (AllTrim(Str(nAnoCurso)))
@ 04,36 say "Turma: " + (AllTrim(cTurmaCurso))
@ 04,46 say "Valor Mensalidade: " + AllTrim(Str(nValorMensal))
*/

if nMedia1 >= 6 .and. nFalta1 <= 48
    @ 17,05 say "ALUNO APROVADO NA MATERIA: " + AllTrim(cMateria1)
elseif nMedia1 >= 6 .and. nFalta1 >= 48
    @ 17,05 say "ALUNO REPROVADO POR FALTAS NA MATERIA: " + AllTrim(cMateria1)
    nDp++
    nMensalDp1 := (nValorMensal*0.15)
elseif nMedia1 <= 6 .or. nFalta1 >= 48
    @ 17,05 say "ALUNO REPROVADO NA MATERIA: " + AllTrim(cMateria1)
    nDp++
    nMensalDp1 := (nValorMensal*0.15)
endif

if nMedia2 >= 6 .and. nFalta2 <= 48
    @ 18,05 say "ALUNO APROVADO NA MATERIA: " + AllTrim(cMateria2)
elseif nMedia2 >= 6 .and. nFalta2 >= 48
    @ 18,05 say "ALUNO REPROVADO POR FALTAS NA MATERIA: " + AllTrim(cMateria2)
    nDp++
    nMensalDp2 := (nValorMensal*0.15)
elseif nMedia2 <= 6 .or. nFalta2 >= 48
    @ 18,05 say "ALUNO REPROVADO NA MATERIA: " + AllTrim(cMateria2)
    nDp++
    nMensalDp2 := (nValorMensal*0.15)
endif

if nMedia3 >= 6 .and. nFalta3 <= 48
    @ 19,05 say "ALUNO APROVADO NA MATERIA: " + AllTrim(cMateria3)
elseif nMedia3 >= 6 .and. nFalta3 >= 48
    @ 19,05 say "ALUNO REPROVADO POR FALTAS NA MATERIA: " + AllTrim(cMateria3)
    nDp++
    nMensalDp3 := (nValorMensal*0.15)
elseif nMedia3 <= 6 .or. nFalta3 >= 48
    @ 19,05 say "ALUNO REPROVADO NA MATERIA: " + AllTrim(cMateria3)
    nDp++
    nMensalDp3 := (nValorMensal*0.15)
endif

if nMedia4 >= 6 .and. nFalta4 <= 48
    @ 20,05 say "ALUNO APROVADO NA MATERIA: " + AllTrim(cMateria4)
elseif nMedia4 >= 6 .and. nFalta4 >= 48
    @ 20,05 say "ALUNO REPROVADO POR FALTAS NA MATERIA: " + AllTrim(cMateria4)
    nDp++
    nMensalDp4 := (nValorMensal*0.15)
elseif nMedia4 <= 6 .or. nFalta4 >= 48
    @ 20,05 say "ALUNO REPROVADO NA MATERIA: " + AllTrim(cMateria4)
    nDp++
    nMensalDp4 := (nValorMensal*0.15)
endif

/*
if cStatusR1 .and. cStatusR2 = .t.
    nValorDP := (nValorMensal*0.15)
    @ 11,05 say "ALUNO APROVADO COM PENDENCIAS EM " + AllTrim(cMateria1) + " E " + AllTrim(cMateria2)
    @ 12,05 say "NOVO VALOR MENSALIDADE " + (nValorDP)
endif
*/
nNovoMensal := (nMensalDp1+nMensalDp2+nMensalDp3+nMensalDp4+nValorMensal)

if nDp > 0
    @ 22,05 say "ALUNO APROVADO 1 COM DEPENDENCIA"@ 23,05 say "NOVO VALOR DA MENSALIDADE " + AllTrim(Str(nNovoMensal))
elseif nDp == 2
    @ 22,05 say "ALUNO APROVADO "+nDp+" COM DEPENDENCIAS"
    @ 23,05 say "NOVO VALOR DA MENSALIDADE " + AllTrim(Str(nNovoMensal))
elseif nDp == 3
    @ 22,05 say "ALUNO REPROVADO EM 3 MATERIAS"
elseif nDp == 4
    @ 22,05 say "ALUNO REPROVADO EM TODAS MATERIAS"
else
    @ 22,05 say "ALUNO APROVADO EM TODAS MATERIAS"
endif