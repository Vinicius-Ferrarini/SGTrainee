//Vinicius Reginaldo Ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)
lSair := .f.
dHoje := Date()

do while !lSair

   cNome        := Space(30)
   dNascimento  := CToD('')
   cCurso       := Space(30)
   nSerie       := 0
   nAnoLetivo   := 0
   nMensalidade := 0
//cabecalho
   clear
   nLinha := 0
   @ nLinha++,30 say 'Unicesumar'
   @ nLinha,  01 say 'Nome......:'
   @ nLinha++,45 say 'Data de nascimento:'
   @ nLinha,  01 say 'Curso:....:'
   @ nLinha++,45 say 'Serie.............:'
   @ nLinha,  01 say 'Ano letivo:'
   @ nLinha  ,45 say 'Mensalidade.......:'

   nLinha := 1
   @ nLinha  ,13 get cNome        valid !Empty(AllTrim(cNome))
   @ nLinha++,65 get dNascimento  valid !Empty(dNascimento) .and. dNascimento <= dHoje
   @ nLinha  ,13 get cCurso       valid !Empty(AllTrim(cCurso))
   @ nLinha++,65 get nSerie       valid nSerie > 0 .and. nSerie < 8                   picture '9'
   @ nLinha  ,13 get nAnoLetivo   valid nAnoLetivo > 0                                picture '9999'
   @ nLinha  ,65 get nMensalidade valid nMensalidade > 0                              picture '@E 999,999.99'
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif
//====================================================================
   do while !lSair
      cMateriaA := Space(10)
      cMateriaB := Space(10)
      cMateriaC := Space(10)
      cMateriaD := Space(10)
      cMotivoA  := 'Aprovado'
      cMotivoB  := 'Aprovado'
      cMotivoC  := 'Aprovado'
      cMotivoD  := 'Aprovado'

      nNotaA1 := 0
      nNotaA2 := 0
      nNotaA3 := 0
      nNotaA4 := 0
      nNotaB1 := 0
      nNotaB2 := 0
      nNotaB3 := 0
      nNotaB4 := 0
      nNotaC1 := 0
      nNotaC2 := 0
      nNotaC3 := 0
      nNotaC4 := 0
      nNotaD1 := 0
      nNotaD2 := 0
      nNotaD3 := 0
      nNotaD4 := 0

      nFaltaA1 := 0
      nFaltaA2 := 0
      nFaltaA3 := 0
      nFaltaA4 := 0
      nFaltaB1 := 0
      nFaltaB2 := 0
      nFaltaB3 := 0
      nFaltaB4 := 0
      nFaltaC1 := 0
      nFaltaC2 := 0
      nFaltaC3 := 0
      nFaltaC4 := 0
      nFaltaD1 := 0
      nFaltaD2 := 0
      nFaltaD3 := 0
      nFaltaD4 := 0

      nLinha := 4
      @ nLinha++,10 say '| Materias |  1 B  |  2 B  |  3 B  |  4 B  | Media |'
      @ nLinha++,10 say '|          | N  |F | N  |F | N  |F | N  |F | N  |F | '
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'

      nLinha := 6
      @ nLinha++,11 get cMateriaA valid !Empty(AllTrim(cMateriaA))
      @ nLinha++,11 get cMateriaB valid !Empty(AllTrim(cMateriaB))
      @ nLinha++,11 get cMateriaC valid !Empty(AllTrim(cMateriaC))
      @ nLinha++,11 get cMateriaD valid !Empty(AllTrim(cMateriaD))

      nLinha := 6
      @ nLinha  ,22 get nNotaA1  valid nNotaA1 >= 0 .and. nNotaA1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaA1 valid nFaltaA1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaB1  valid nNotaB1 >= 0 .and. nNotaB1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaB1 valid nFaltaB1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaC1  valid nNotaC1 >= 0 .and. nNotaC1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaC1 valid nFaltaC1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaD1  valid nNotaD1 >= 0 .and. nNotaD1 <= 10  picture '@E 99.9'
      @ nLinha  ,27 get nFaltaD1 valid nFaltaD1 >= 0                     picture '99'

      nLinha := 6
      @ nLinha  ,30 get nNotaA2  valid nNotaA2 >= 0 .and. nNotaA2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaA2 valid nFaltaA2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaB2  valid nNotaB2 >= 0 .and. nNotaB2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaB2 valid nFaltaB2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaC2  valid nNotaC2 >= 0 .and. nNotaC2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaC2 valid nFaltaC2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaD2  valid nNotaD2 >= 0 .and. nNotaD2 <= 10  picture '@E 99.9'
      @ nLinha  ,35 get nFaltaD2 valid nFaltaD2 >= 0                     picture '99'

      nLinha := 6
      @ nLinha  ,38 get nNotaA3  valid nNotaA3 >= 0 .and. nNotaA3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaA3 valid nFaltaA3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaB3  valid nNotaB3 >= 0 .and. nNotaB3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaB3 valid nFaltaB3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaC3  valid nNotaC3 >= 0 .and. nNotaC3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaC3 valid nFaltaC3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaD3  valid nNotaD3 >= 0 .and. nNotaD3 <= 10  picture '@E 99.9'
      @ nLinha  ,43 get nFaltaD3 valid nFaltaD3 >= 0                     picture '99'

      nLinha := 6
      @ nLinha  ,46 get nNotaA4  valid nNotaA4 >= 0 .and. nNotaA4 <= 10  picture '@E 99.9'
      @ nLinha++,51 get nFaltaA4 valid nFaltaA4 >= 0                     picture '99'
      @ nLinha  ,46 get nNotaB4  valid nNotaB4 >= 0 .and. nNotaB4 <= 10  picture '@E 99.9'
      @ nLinha++,51 get nFaltaB4 valid nFaltaB4 >= 0                     picture '99'
      @ nLinha  ,46 get nNotaC4  valid nNotaC4 >= 0 .and. nNotaC4 <= 10  picture '@E 99.9'
      @ nLinha++,51 get nFaltaC4 valid nFaltaC4 >= 0                     picture '99'
      @ nLinha  ,46 get nNotaD4  valid nNotaD4 >= 0 .and. nNotaD4 <= 10  picture '@E 99.9'
      @ nLinha  ,51 get nFaltaD4 valid nFaltaD4 >= 0                     picture '99'

      read
      if LastKey() == 27
         nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Digitar outro Aluno' ,'Continuar digitando' })
         if nOpcao = 1
            lSair := .t.
            exit
         elseif nOpcao = 2  //comeco
            exit
         else
            loop
         endif
      endif
   //Soma
      nMediaNotaA :=(nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4) /4
      nMediaNotaB :=(nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4) /4
      nMediaNotaC :=(nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4) /4
      nMediaNotaD :=(nNotaD1 + nNotaD2 + nNotaD3 + nNotaD4) /4

      nTotalFaltaA := nFaltaA1 + nFaltaA2 + nFaltaA3 + nFaltaA4
      nTotalFaltaB := nFaltaB1 + nFaltaB2 + nFaltaB3 + nFaltaB4
      nTotalFaltaC := nFaltaC1 + nFaltaC2 + nFaltaC3 + nFaltaC4
      nTotalFaltaD := nFaltaD1 + nFaltaD2 + nFaltaD3 + nFaltaD4
      nDp          := 0
      cMateriasDP  := Space(1)
      
      //Aprovado ou reprovado
      if nMediaNotaA < 6 .or. nTotalFaltaA > 48
         //reprova
         nDp++
         cMateriasDP += ' ' + AllTrim(cMateriaA)
         cMotivoA    := 'Reprova por'
         
         if nMediaNotaA < 6
            cMotivoA += ' Nota'
         endif
         if nTotalFaltaA > 48
            cMotivoA += ' Falta'
         endif
      endif
//==========================
      if nMediaNotaB < 6 .or. nTotalFaltaB > 48
         nDp++
         cMateriasDP += ' ' + AllTrim(cMateriaB)
         cMotivoB    := 'Reprova por'
         
         if nMediaNotaB < 6
            cMotivoB += ' Nota'
         endif
         if nTotalFaltaB > 48
            cMotivoB += ' Falta'
         endif
      endif


      if nMediaNotaC < 6 .or. nTotalFaltaC > 48
         nDp++
         cMateriasDP += ' ' + AllTrim(cMateriaC)
         cMotivoC    := 'Reprova por'
         
         if nMediaNotaC < 6
            cMotivoC += ' Nota'
         endif
         if nTotalFaltaC > 48
            cMotivoC += ' Falta'
         endif
      endif


      if nMediaNotaD < 6 .or. nTotalFaltaD > 48
         nDp++
         cMateriasDP += ' ' + AllTrim(cMateriaD)
         cMotivoD    := 'Reprova por'
         
         if nMediaNotaD < 6
            cMotivoD += ' Nota |'
         endif
         if nTotalFaltaD > 48
            cMotivoD += ' Falta |'
         endif
      endif

//----------------------------------
      cResultado   := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO em todas as materias!'
      cMensalidade := 'Mensalidade continua a mesma R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99'))
      if nDp > 0
         if nDp < 3
            nMensalidadeNova := nMensalidade * (nDp * 0.15 + 1)
            cMensalidade     := 'A mensalidade era de R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99')) + ',para R$'+ AllTrim(Transform(nMensalidadeNova,'@E 999,999.99'))
            cResultado       := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO com '+ Transform(nDp,'9') + ' DEPENDENCIAS em ' + cMateriasDP
         else
            cResultado       := 'O aluno ' + AllTrim(cNome) + ' foi REPROVADO com '+ Transform(nDp,'9') + ' DEPENDENCIAS em ' + cMateriasDP
         endif
      endif

     //print Media
      nLinha := 6
      @ nLinha++,54 say Transform(nMediaNotaA,'@E 99.9') + '|' + Transform(nTotalFaltaA,'99')
      @ nLinha++,54 say Transform(nMediaNotaB,'@E 99.9') + '|' + Transform(nTotalFaltaB,'99') 
      @ nLinha++,54 say Transform(nMediaNotaC,'@E 99.9') + '|' + Transform(nTotalFaltaC,'99') 
      @ nLinha++,54 say Transform(nMediaNotaD,'@E 99.9') + '|' + Transform(nTotalFaltaD,'99') 
      
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaA) + ' ' + AllTrim(cMotivoA)
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaB) + ' ' + AllTrim(cMotivoB)
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaC) + ' ' + AllTrim(cMotivoC)
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaD) + ' ' + AllTrim(cMotivoD)
      @ ++nLinha,10 say cResultado
      @ ++nLinha,10 say cMensalidade

      InKey(0)
      exit
   enddo
enddo
@ 23,01 say ''

