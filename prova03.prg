
//vinicius reginaldo ferrarini
SetColor ('0/W')
set date to british
set epoch to 1940
set scoreboard off

dDataHoje    := date()
nDiaAtual    := Day(dDataHoje)
nMesAtual    := Month(dDataHoje)
nAnoAtual    := Year(dDataHoje)
nSemanaAtual := DoW(dDataHoje)

do while .t.
   clear
   cNome           := Space(20)
   dDataNascimento := CToD(' ')

   @ 01,00 say 'Nome....................:'
   @ 02,00 say 'Data de nascimento......:'
   @ 03,00 say 'Nascido em..............:'
   @ 04,00 say 'No dia..................:' //domingo
   @ 05,00 say 'Idade...................:'
   @ 06,00 say 'Signo...................:'
   @ 07,00 say 'Prox. Aniversario em....:'
   @ 08,00 say 'Prox. Aniversario em uma:'

   @ 01,26 get cNome           valid !Empty(cNome)                 picture '@!'
   @ 02,26 get dDataNascimento valid dDataNascimento <= dDataHoje
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

//Nascimento Extenso

   //mes nascimento
   if nMesNascimento == 1
      cMesNascimento     := 'Janeiro'
      nDiasMesNascimento := 31 
   
   elseif nMesNascimento == 2
      cMesNascimento     := 'Fevereiro'
      nDiasMesNascimento := 28  
      if nAnoNascimento % 4 == 0
         nDiasMesNascimento++
      endif
   
   elseif nMesNascimento == 3
      cMesNascimento     := 'Mar�o'
      nDiasMesNascimento := 31
   
   elseif nMesNascimento == 4
      cMesNascimento     := 'Abril'
      nDiasMesNascimento := 30
   
   elseif nMesNascimento == 5
      cMesNascimento     := 'Maio'
      nDiasMesNascimento := 31

   elseif nMesNascimento == 6
      cMesNascimento     := 'Junho'
      nDiasMesNascimento := 30

   elseif nMesNascimento == 7
      cMesNascimento     := 'Julho'
      nDiasMesNascimento := 31
   elseif nMesNascimento == 8
      cMesNascimento     := 'Agosto'
      nDiasMesNascimento := 31

   elseif nMesNascimento == 9
      cMesNascimento     := 'Setembro'
      nDiasMesNascimento := 30

   elseif nMesNascimento == 10
      cMesNascimento     := 'Outubro'
      nDiasMesNascimento := 31

   elseif nMesNascimento == 11
      cMesNascimento     := 'Novembro'
      nDiasMesNascimento :=  30

   else
      cMesNascimento     := 'Dezembro'
      nDiasMesNascimento := 31 
   endif

   cNascimentoEscrito := Alltrim(Str(nDiaNascimento)) + ' de ' + cMesNascimento + ' de ' + Transform(nAnoNascimento,'9999')
//--------------------------------------------------

//dia semana nascimento
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
//-------------------------

//Calcula idade
   lFezAniversario := .t.
   nAnoIdade := nAnoAtual - nAnoNascimento
   nMesIdade := nMesAtual - nMesNascimento
   if nMesAtual < nMesNascimento .or. nMesAtual == nMesNascimento .and. nDiaAtual < nDiaNascimento
      nAnoIdade--
      nMesIdade += 12
      lFezAniversario := .t.
   endif
  
   nDiaIdade := nDiaAtual - nDiaNascimento
   if nDiaIdade < 0
      nMesIdade--

      //mes atual
      if nMesAtual == 1
         nDiasMesAnterior := 31  // Dezembro
      elseif nMesAtual == 2
         nDiasMesAnterior := 31  // Janeiro
      elseif nMesAtual == 3
         nDiasMesAnterior := 28  // Fevereiro
         if nAnoAtual % 4 ==  0
            nDiasMesAnterior++
         endif
      elseif nMesAtual == 4
         nDiasMesAnterior := 31  // Mar�o
      elseif nMesAtual == 5
         nDiasMesAnterior := 30  // Abril
      elseif nMesAtual == 6
         nDiasMesAnterior := 31  // Maio
      elseif nMesAtual == 7
         nDiasMesAnterior := 30  // Junho
      elseif nMesAtual == 8
         nDiasMesAnterior := 31  // Julho
      elseif nMesAtual == 9
         nDiasMesAnterior := 31  // Agosto
      elseif nMesAtual == 10
         nDiasMesAnterior := 30  // Setembro
      elseif nMesAtual == 11
         nDiasMesAnterior := 31  // Outubro
      else
         nDiasMesAnterior := 30  // Novembro
      endif
      nDiaIdade := nDiaAtual - nDiaNascimento + nDiasMesAnterior 
   endif

   cIdade := ''
   if nAnoIdade != 0
      cIdade += AllTrim(Str(nAnoIdade)) + ' anos '
   endif
   if nMesIdade != 0
      cIdade += AllTrim(Str(nMesIdade)) + ' meses '
   endif
   if nDiaIdade != 0
      cIdade += AllTrim(Str(nDiaIdade)) + ' Dias '
   endif
//----------------------------------------


//Proximo Aniversario
   //Aniversariante
   if lFezAniversario .or. nMesNascimento == nMesAtual .and. nDiaNascimento == nDiaAtual
      dProximoAniversario := CToD(Transform(nDiaNascimento,'99') +'/'+ Transform(nMesNascimento,'99') +'/'+ Transform(nAnoAtual+1,'9999'))
   else 
      dProximoAniversario := CToD(Transform(nDiaNascimento,'99') +'/'+ Transform(nMesNascimento,'99') +'/'+ Transform(nAnoAtual,'9999'))
   endif
   
   nMesProximoAniversario := Month(dProximoAniversario)
   if nMesNascimento == nMesAtual .and. nDiaNascimento == nDiaAtual
      alert('Feliz Aniversario!!!',{'Ok'})
      cTempoProximoAniversario := '1 Ano'
   else

      nDiaProximoAniversario := Day(dProximoAniversario)
         
      //calcula tempo
      nMesTempoAniversario := 0
      if nMesProximoAniversario < nMesAtual .or. nMesProximoAniversario < nMesAtual .and. nDiaAtual < nDiaNascimento
         nMesTempoAniversario += 12 
      endif
      nMesTempoAniversario += nMesProximoAniversario - nMesAtual
      
      nDiaTempoAniversario := nDiaProximoAniversario - nDiaAtual
      if nDiaTempoAniversario < 0 
         nMesTempoAniversario--
         nDiaTempoAniversario += nDiasMesNascimento
      endif

       //escreve tempo para aniversario
      cTempoProximoAniversario := ''
      if nMesTempoAniversario != 0
         cTempoProximoAniversario += Transform(nMesTempoAniversario,'99') + ' Meses '
      endif
      
      if nDiaTempoAniversario != 0
         cTempoProximoAniversario += Transform(nDiaTempoAniversario,'99') + ' Dias '
      endif
      //----------
   endif
   //----------------------------------------------------
 
   //-----------------

  

   //Semana do proximo Aniversario  
   nDiaSemanaProximoAniversario := DoW(dProximoAniversario)
    if nDiaSemanaProximoAniversario == 1
       cDiaProximoAniversario := 'Domingo'
    elseif nDiaSemanaProximoAniversario == 2
       cDiaProximoAniversario := 'Segunda-Feira'
    elseif nDiaSemanaProximoAniversario == 3
       cDiaProximoAniversario := 'Terca-Feira'
    elseif nDiaSemanaProximoAniversario == 4
       cDiaProximoAniversario := 'Quarta-Feira'
    elseif nDiaSemanaProximoAniversario == 5
       cDiaProximoAniversario := 'Quinta-Feira'
    elseif nDiaSemanaProximoAniversario == 6
       cDiaProximoAniversario := 'Sexta-Feira'
    else
       cDiaProximoAniversario := 'Sabado'
    endif
   
    
//--------------------------

//Signo
   if (nMesNascimento == 1 .and. nDiaNascimento >= 21) .or. (nMesNascimento == 2 .and. nDiaNascimento <= 18)
      cSigno := 'Aquario'
   elseif nMesNascimento == 2 .or. (nMesNascimento == 3 .and. nDiaNascimento <= 20)
      cSigno := 'Peixes'
   elseif nMesNascimento == 3 .or. (nMesNascimento == 4 .and. nDiaNascimento <= 20)
      cSigno := 'Aries'
   elseif nMesNascimento == 4 .or. (nMesNascimento == 5 .and. nDiaNascimento <= 20)
      cSigno := 'Touro'
   elseif nMesNascimento == 5 .or. (nMesNascimento == 6 .and. nDiaNascimento <= 20)
      cSigno := 'Gemeos'
   elseif nMesNascimento == 6 .or. (nMesNascimento == 7 .and. nDiaNascimento <= 22)
      cSigno := 'Cancer'
   elseif nMesNascimento == 7 .or. (nMesNascimento == 8 .and. nDiaNascimento <= 22)
      cSigno := 'Leao'
   elseif nMesNascimento == 8 .or. (nMesNascimento == 9 .and. nDiaNascimento <= 22)
      cSigno := 'Virgem'
   elseif nMesNascimento == 9 .or. (nMesNascimento == 10 .and. nDiaNascimento <= 22)
      cSigno := 'Libra'
   elseif nMesNascimento == 10 .or. (nMesNascimento == 11 .and. nDiaNascimento <= 21)
      cSigno := 'Escorpiao'
   elseif nMesNascimento == 11 .or. (nMesNascimento == 12 .and. nDiaNascimento <= 21)
      cSigno := 'Sagitario'
   else 
      cSigno := 'Capricornio'
   endif
   

//------------------




//Mostra dados
   @ 03,26 say cNascimentoEscrito
   @ 04,26 say cDiaNascimento
   @ 05,26 say cIdade
   @ 06,26 say cSigno
   @ 07,26 say cTempoProximoAniversario
   @ 08,26 say cDiaProximoAniversario
   @ 10,28 say cMesNascimento + ' de ' + Transform(nAnoNascimento,'9999')
   
   //calendario
   nPrimeiroDiaMesNascimento := DoW(CToD(Transform(01,'99')+'/'+Transform(nMesNascimento,'99')+'/'+Transform(nAnoNascimento,'9999'))) 
   nContador := 1
   nLinha    := 11
   nColuna   := nPrimeiroDiaMesNascimento * 3 + 20
  
   do while nContador <= nDiasMesNascimento     
      if nColuna >= 44
         nColuna := 23
         nLinha++
      endif
      
      if nContador == nDiaNascimento
         cCor := 'R/w'
      else
         cCor := '0/W'
      endif
      
      @ nLinha,nColuna say Transform(nContador,'99') color(cCor)       
      nColuna += 3
      nContador++
   enddo
   //------------
   InKey(0)
enddo