
//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

dDataHoje    := date()
nDiaAtual    := Day(dHoje)
nMesAtual    := Month(dHoje)
nAnoAtual    := Year(dHoje)
nSemanaAtual := DoW(dHoje)

do while .t.

   cNome           := Space(20)
   dDataNascimento := CToD(' ')

   @ 01,00 say 'Nome....................:'
   @ 02,00 say 'Data de nascimento......:'
   @ 03,00 say 'Nascido em..............:' //domingo
   @ 04,00 say 'Idade...................:'
   @ 05,00 say 'Signo...................:'
   @ 06,00 say 'Prox. Aniversario em....:'
   @ 07,00 say 'Prox. Aniversario em uma:'

   @ 01,26 get cNome       picture '@!'  valid !Empty(cNome)
   @ 02,26 get dDataNascimento           valid dDataNascimento < dHoje
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif

   nDiaNascimento    := Day(dDataNascimento)
   nMesNascimento    := Month(dDataNascimento)
   nAnoNascimento    := Year(dDataNascimento)
   nSemanaNascimento := DoW(dDataNascimento)

   //dia semana
   if nSemanaNascimento == 1
      cDiaNascimento := 'Domingo'
   elseif nSemanaNascimento == 2
      cDiaNascimento := 'Segunda-Feira'
   elseif nSemanaNascimento == 3
      cDiaNascimento := 'Terca-Feira'
   elseif nSemanaNascimento == 4
      cDiaNascimento := 'Quarta-Feira'
   elseif nSemanaNascimento == 5
      cDiaNascimento := 'Quinta-Feira'
   elseif nSemanaNascimento == 6
      cDiaNascimento := 'Sexta-Feira'
   else
      cDiaNascimento := 'Sabado'
   endif



   @ 03,26 say cDiaNascimento
   @ 04,26 say ''
   @ 05,26 say ''
   @ 06,26 say ''
   @ 07,26 say ''
   InKey(0)
enddo
