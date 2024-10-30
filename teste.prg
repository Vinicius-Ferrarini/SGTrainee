//Vinicius Reginaldo Ferrarini

set date  to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dHoje        := Date()
cCorVermelho := 'W/R'
cCorVerde    := 'W/G'

do while .t.
   lSair        := .f.
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
   @ nLinha++,45 say 'Serie(1-8)........:'
   @ nLinha,  01 say 'Ano letivo:'
   @ nLinha++,45 say 'Mensalidade.......:'

   nLinha := 1
   @ nLinha  ,13 get cNome        valid !Empty(AllTrim(cNome))
   @ nLinha++,65 get dNascimento  valid !Empty(dNascimento) .and. dNascimento <= dHoje
   @ nLinha  ,13 get cCurso       valid !Empty(AllTrim(cCurso))
   @ nLinha++,65 get nSerie       valid nSerie > 0 .and.nSerie <= 8                   picture '9'
   @ nLinha  ,13 get nAnoLetivo   valid nAnoLetivo >= 1940 .and. nAnoLetivo <= 2024   picture '9999'
   @ nLinha++,65 get nMensalidade valid nMensalidade > 0                              picture '@E 999,999.99'
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao == 1
         exit
      else
         loop
      endif
   endif
   //Falta e Notas permitidas
   if nSerie <= 4
      nNotaMinima := 60
   else
      nNotaMinima := 70
   endif

   if nSerie <= 3
      nFaltasMaxima := 6
   else
      nFaltasMaxima := 8
   endif
   //====================================================================
   do while !lSair
      cMateriaA := Space(10)
      cMateriaB := Space(10)
      cMateriaC := Space(10)
      cMotivoA  := 'Aprovado'
      cMotivoB  := 'Aprovado'
      cMotivoC  := 'Aprovado'

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

      cColorA := cCorVerde
      cColorB := cCorVerde
      cColorC := cCorVerde

      nDp         := 0
      cMateriasDP := ''

      nLinha := 5
      @ nLinha++,10 say '| Materias |  1 B  |  2 B  |  3 B  |  4 B  | Media |'
      @ nLinha++,10 say '|          | N  |F | N  |F | N  |F | N  |F | N  |F | '
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'


      nLinha := 7
      @ nLinha++,11 get cMateriaA valid !Empty(AllTrim(cMateriaA)) picture '@!'
      @ nLinha++,11 get cMateriaB valid !Empty(AllTrim(cMateriaB)) picture '@!'
      @ nLinha++,11 get cMateriaC valid !Empty(AllTrim(cMateriaC)) picture '@!'


      nLinha := 7
      @ nLinha  ,22 get nNotaA1  valid nNotaA1 >= 0 .and. nNotaA1 <= 100  picture '999'
      @ nLinha++,27 get nFaltaA1 valid nFaltaA1 >= 0                      picture '99'
      @ nLinha  ,22 get nNotaB1  valid nNotaB1 >= 0 .and. nNotaB1 <= 100  picture '999'
      @ nLinha++,27 get nFaltaB1 valid nFaltaB1 >= 0                      picture '99'
      @ nLinha  ,22 get nNotaC1  valid nNotaC1 >= 0 .and. nNotaC1 <= 100  picture '999'
      @ nLinha++,27 get nFaltaC1 valid nFaltaC1 >= 0                      picture '99'

      nLinha := 7
      @ nLinha  ,30 get nNotaA2  valid nNotaA2 >= 0 .and. nNotaA2 <= 100  picture '999'
      @ nLinha++,35 get nFaltaA2 valid nFaltaA2 >= 0                      picture '99'
      @ nLinha  ,30 get nNotaB2  valid nNotaB2 >= 0 .and. nNotaB2 <= 100  picture '999'
      @ nLinha++,35 get nFaltaB2 valid nFaltaB2 >= 0                      picture '99'
      @ nLinha  ,30 get nNotaC2  valid nNotaC2 >= 0 .and. nNotaC2 <= 100  picture '999'
      @ nLinha++,35 get nFaltaC2 valid nFaltaC2 >= 0                      picture '99'

      nLinha := 7
      @ nLinha  ,38 get nNotaA3  valid nNotaA3 >= 0 .and. nNotaA3 <= 100  picture '999'
      @ nLinha++,43 get nFaltaA3 valid nFaltaA3 >= 0                      picture '99'
      @ nLinha  ,38 get nNotaB3  valid nNotaB3 >= 0 .and. nNotaB3 <= 100  picture '999'
      @ nLinha++,43 get nFaltaB3 valid nFaltaB3 >= 0                      picture '99'
      @ nLinha  ,38 get nNotaC3  valid nNotaC3 >= 0 .and. nNotaC3 <= 100  picture '999'
      @ nLinha++,43 get nFaltaC3 valid nFaltaC3 >= 0                      picture '99'

      nLinha := 7
      @ nLinha  ,46 get nNotaA4  valid nNotaA4 >= 0 .and. nNotaA4 <= 100  picture '999'
      @ nLinha++,51 get nFaltaA4 valid nFaltaA4 >= 0                      picture '99'
      @ nLinha  ,46 get nNotaB4  valid nNotaB4 >= 0 .and. nNotaB4 <= 100  picture '999'
      @ nLinha++,51 get nFaltaB4 valid nFaltaB4 >= 0                      picture '99'
      @ nLinha  ,46 get nNotaC4  valid nNotaC4 >= 0 .and. nNotaC4 <= 100  picture '999'
      @ nLinha++,51 get nFaltaC4 valid nFaltaC4 >= 0                      picture '99'
      read
      if LastKey() == 27
         nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao comeco' ,'Continuar digitando' })
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
      nMediaNotaA := (nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4) /4
      nMediaNotaB := (nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4) /4
      nMediaNotaC := (nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4) /4

      nTotalFaltaA := nFaltaA1 + nFaltaA2 + nFaltaA3 + nFaltaA4
      nTotalFaltaB := nFaltaB1 + nFaltaB2 + nFaltaB3 + nFaltaB4
      nTotalFaltaC := nFaltaC1 + nFaltaC2 + nFaltaC3 + nFaltaC4

      //A
      if nMediaNotaA < nNotaMinima .or. nFaltaA1 > nFaltasMaxima .or. nFaltaA2 > nFaltasMaxima .or. nFaltaA3 > nFaltasMaxima
         //reprova
         nDp++
         cColorA     := cCorVermelho
         cMateriasDP += AllTrim(cMateriaA) + Space(1)
         cMotivoA    := 'Reprova por'
         
         //nota | falta
         if nMediaNotaA < nNotaMinima
            cMotivoA += ' Nota'
         endif
         if nFaltaA1 > nFaltasMaxima .or. nFaltaA2 > nFaltasMaxima .or. nFaltaA3 > nFaltasMaxima
            cMotivoA += ' e Falta'        
         endif
      endif

      //B
      if nMediaNotaB < nNotaMinima .or. nFaltaB1 > nFaltasMaxima .or. nFaltaB2 > nFaltasMaxima .or. nFaltaB3 > nFaltasMaxima
         //reprova
         nDp++
         cColorB     := cCorVermelho
         cMateriasDP += AllTrim(cMateriaB) + Space(1)
         cMotivoB    := 'Reprova por'
         
         //nota | falta
         if nMediaNotaB < nNotaMinima
            cMotivoB += ' Nota |'
         endif
         if nFaltaB1 > nFaltasMaxima .or. nFaltaB2 > nFaltasMaxima .or. nFaltaB3 > nFaltasMaxima
            cMotivoB += '  Falta |'
         endif
      endif

      //C
      if nMediaNotaC < nNotaMinima .or. nFaltaC1 > nFaltasMaxima .or. nFaltaC2 > nFaltasMaxima .or. nFaltaC3 > nFaltasMaxima
         //reprova
         nDp++
         cColorC     := cCorVermelho
         cMateriasDP += AllTrim(cMateriaC) + Space(1)
         cMotivoC    := 'Reprova por'
         
         //nota | falta
         if nMediaNotaC < nNotaMinima
            cMotivoC += ' Nota |'
         endif
         if nFaltaC1 > nFaltasMaxima .or. nFaltaC2 > nFaltasMaxima .or. nFaltaC3 > nFaltasMaxima
            cMotivoC += ' Falta |'
         endif

      endif


//================================ Resultado
      cResultado   := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO em todas as materias!'
      cMensalidade := 'Mensalidade continua a mesma R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99'))
      if nDp > 0
         if nDp < 3
            nMensalidadeNova := nMensalidade * (nDp * 0.20 + 1)
            cMensalidade     := 'A mensalidade era de R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99')) + ',para R$'+ AllTrim(Transform(nMensalidadeNova,'@E 999,999.99'))
            cResultado       := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO com '+ Alltrim(Str(nDp)) + ' DEPENDENCIAS em ' + cMateriasDP
         else
            cResultado       := 'O aluno ' + AllTrim(cNome) + ' foi REPROVADO com '+ Alltrim(Str(nDp)) + ' DEPENDENCIAS em ' + cMateriasDP
         endif
      endif

     //Print Media
      nLinha := 7
      @ nLinha++,54 say Transform(nMediaNotaA,'999') + '|' + Transform(nTotalFaltaA,'99') color(cColorA)
      @ nLinha++,54 say Transform(nMediaNotaB,'999') + '|' + Transform(nTotalFaltaB,'99') color(cColorB)
      @ nLinha++,54 say Transform(nMediaNotaC,'999') + '|' + Transform(nTotalFaltaC,'99') color(cColorC)

      
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaA) + ' ' + AllTrim(cMotivoA)
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaB) + ' ' + AllTrim(cMotivoB)
      @ ++nLinha,10 say 'Materia ' + Alltrim(cMateriaC) + ' ' + AllTrim(cMotivoC)
      @ ++nLinha,10 say cResultado
      @ ++nLinha,10 say cMensalidade

      lSair := .t.
      InKey(0)
   enddo
enddo
@ 23,01 say ''
