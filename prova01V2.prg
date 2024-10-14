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
   cBolsa       := ' '
//cabecalho
   clear
   nLinha := 0
   @ nLinha++,30 say 'Unicesumar'
   @ nLinha,  01 say 'Nome......:'
   @ nLinha++,45 say 'Data de nascimento:'
   @ nLinha,  01 say 'Curso:....:'
   @ nLinha++,45 say 'Serie.............:'
   @ nLinha,  01 say 'Ano letivo:'
   @ nLinha++,45 say 'Mensalidade.......:'
   @ nLinha  ,01 say 'Bolsista [ ] [I]ntegral [P]arcial [N]ao'

   nLinha := 1
   @ nLinha  ,13 get cNome        valid !Empty(AllTrim(cNome))
   @ nLinha++,65 get dNascimento  valid !Empty(dNascimento) .and. dNascimento <= dHoje
   @ nLinha  ,13 get cCurso       valid !Empty(AllTrim(cCurso))
   @ nLinha++,65 get nSerie       valid nSerie > 0                                    picture '99'
   @ nLinha  ,13 get nAnoLetivo   valid nAnoLetivo > 0                                picture '9999'
   @ nLinha++,65 get nMensalidade valid nMensalidade > 0                              picture '@E 999,999.99'
   @ nLinha  ,11 get cBolsa       valid cBolsa $ 'IPN'                                picture '@!'
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

      cColorA := 'W/G'
      cColorB := 'W/G'
      cColorC := 'W/G'
      cColorD := 'W/G'

      nLinha := 5
      @ nLinha++,10 say '| Materias |  1øB  |  2øB  |  3øB  |  4øB  | Media |'
      @ nLinha++,10 say '|          | N  |F | N  |F | N  |F | N  |F | N  |F | '
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'
      @ nLinha++,10 say '|          |    |  |    |  |    |  |    |  |    |  |'

      nLinha := 7
      @ nLinha++,11 get cMateriaA valid !Empty(AllTrim(cMateriaA))
      @ nLinha++,11 get cMateriaB valid !Empty(AllTrim(cMateriaB))
      @ nLinha++,11 get cMateriaC valid !Empty(AllTrim(cMateriaC))
      @ nLinha++,11 get cMateriaD valid !Empty(AllTrim(cMateriaD))

      nLinha := 7
      @ nLinha  ,22 get nNotaA1  valid nNotaA1 >= 0 .and. nNotaA1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaA1 valid nFaltaA1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaB1  valid nNotaB1 >= 0 .and. nNotaB1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaB1 valid nFaltaB1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaC1  valid nNotaC1 >= 0 .and. nNotaC1 <= 10  picture '@E 99.9'
      @ nLinha++,27 get nFaltaC1 valid nFaltaC1 >= 0                     picture '99'
      @ nLinha  ,22 get nNotaD1  valid nNotaD1 >= 0 .and. nNotaD1 <= 10  picture '@E 99.9'
      @ nLinha  ,27 get nFaltaD1 valid nFaltaD1 >= 0                     picture '99'

      nLinha := 7
      @ nLinha  ,30 get nNotaA2  valid nNotaA2 >= 0 .and. nNotaA2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaA2 valid nFaltaA2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaB2  valid nNotaB2 >= 0 .and. nNotaB2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaB2 valid nFaltaB2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaC2  valid nNotaC2 >= 0 .and. nNotaC2 <= 10  picture '@E 99.9'
      @ nLinha++,35 get nFaltaC2 valid nFaltaC2 >= 0                     picture '99'
      @ nLinha  ,30 get nNotaD2  valid nNotaD2 >= 0 .and. nNotaD2 <= 10  picture '@E 99.9'
      @ nLinha  ,35 get nFaltaD2 valid nFaltaD2 >= 0                     picture '99'

      nLinha := 7
      @ nLinha  ,38 get nNotaA3  valid nNotaA3 >= 0 .and. nNotaA3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaA3 valid nFaltaA3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaB3  valid nNotaB3 >= 0 .and. nNotaB3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaB3 valid nFaltaB3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaC3  valid nNotaC3 >= 0 .and. nNotaC3 <= 10  picture '@E 99.9'
      @ nLinha++,43 get nFaltaC3 valid nFaltaC3 >= 0                     picture '99'
      @ nLinha  ,38 get nNotaD3  valid nNotaD3 >= 0 .and. nNotaD3 <= 10  picture '@E 99.9'
      @ nLinha  ,43 get nFaltaD3 valid nFaltaD3 >= 0                     picture '99'

      nLinha := 7
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
         nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao come‡o' ,'Continuar digitando' })
         if nOpcao = 1
            lSair := .t.
            exit
         elseif nOpcao = 2  //come‡o
            exit
         else
            loop
         endif
      endif
      //Soma
      nFinalNotaA := (nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4) /4
      nFinalNotaB := (nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4) /4
      nFinalNotaC := (nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4) /4
      nFinalNotaD := (nNotaD1 + nNotaD2 + nNotaD3 + nNotaD4) /4

      nTotalFaltaA := nFaltaA1 + nFaltaA2 + nFaltaA3 + nFaltaA4
      nTotalFaltaB := nFaltaB1 + nFaltaB2 + nFaltaB3 + nFaltaB4
      nTotalFaltaC := nFaltaC1 + nFaltaC2 + nFaltaC3 + nFaltaC4
      nTotalFaltaD := nFaltaD1 + nFaltaD2 + nFaltaD3 + nFaltaD4
      nDp := 0
      cMateriasDP := ''

      //A
      if nFinalNotaA < 6 .or. nTotalFaltaA > 56
         //reprova
         nDp++
         cColorA := 'W/R'
         cMateriasDP += ' ' + AllTrim(cMateriaA)

      elseif nTotalFaltaA > 47
         //conselho
         cEscolha1 := ' '
         cEscolha2 := ' '
         cEscolha3 := ' '
         @ 13,01 say 'Deseja passar ' + AllTrim(cNome) + ' em ' + AllTrim(cMateriaA) +'?(S/N)'
         @ 14,01 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
         @ 15,01 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
         @ 16,01 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
         read
         if LastKey() == 27
            nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao come‡o' ,'Continuar digitando' })
            if nOpcao = 1
               lSair := .t.
               exit
            elseif nOpcao = 2
               exit
            else
               loop
            endif
         endif

         nPassou := 0
         if cEscolha1 = 'S'
            nPassou++
         endif
         if cEscolha2 = 'S'
            nPassou++
         endif
         if cEscolha3 = 'S'
            nPassou++
         endif

         if nPassou < 2
            //reprova
            nDp++
            cColorA := 'W/R'
            cMateriasDP += ' ' + AllTrim(cMateriaA)
         endif

      endif

      //B
      if nFinalNotaB < 6 .or. nTotalFaltaB > 56
         //reprova
         nDp++
         cColorB := 'W/R'
         cMateriasDP += ' ' + AllTrim(cMateriaB)

      elseif nTotalFaltaB > 47
         //conselho
         cEscolha1 := ' '
         cEscolha2 := ' '
         cEscolha3 := ' '
         @ 13,01 say 'Deseja passar ' + AllTrim(cNome) + ' em ' + AllTrim(cMateriaB) +'?(S/N)'
         @ 14,20 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
         @ 15,20 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
         @ 16,20 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
         read
         if LastKey() == 27
            nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao come‡o' ,'Continuar digitando' })
            if nOpcao = 1
               lSair := .t.
               exit
            elseif nOpcao = 2
               exit
            else
               loop
            endif
         endif

         nPassou := 0
         if cEscolha1 = 'S'
            nPassou++
         endif
         if cEscolha2 = 'S'
            nPassou++
         endif
         if cEscolha3 = 'S'
            nPassou++
         endif

         if nPassou < 2
            //reprova
            nDp++
            cColorB := 'W/R'
            cMateriasDP += ' ' + AllTrim(cMateriaB)
         endif

      endif

      //C
      if nFinalNotaC < 6 .or. nTotalFaltaC > 56
         //reprova
         nDp++
         cColorC := 'W/R'
         cMateriasDP += ' ' + AllTrim(cMateriaC)

      elseif nTotalFaltaC > 47
         //conselho
         cEscolha1 := ' '
         cEscolha2 := ' '
         cEscolha3 := ' '
         @ 13,01 say 'Deseja passar ' + AllTrim(cNome) + ' em ' + AllTrim(cMateriaC) +'?(S/N)'
         @ 14,40 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
         @ 15,40 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
         @ 16,40 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
         read
         if LastKey() == 27
            nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao come‡o' ,'Continuar digitando' })
            if nOpcao = 1
               lSair := .t.
               exit
            elseif nOpcao = 2
               exit
            else
               loop
            endif
         endif

         nPassou := 0
         if cEscolha1 = 'S'
            nPassou++
         endif
         if cEscolha2 = 'S'
            nPassou++
         endif
         if cEscolha3 = 'S'
            nPassou++
         endif

         if nPassou < 2
            //reprova
            nDp++
            cColorC := 'W/R'
            cMateriasDP += ' ' + AllTrim(cMateriaC)
         endif

      endif
//D
      if nFinalNotaD < 6 .or. nTotalFaltaD > 56
         //reprova
         nDp++
         cColorD := 'W/R'
         cMateriasDP += ' ' + AllTrim(cMateriaD)

      elseif nTotalFaltaD > 47
         //conselho
         cEscolha1 := ' '
         cEscolha2 := ' '
         cEscolha3 := ' '
         @ 13,01 say 'Deseja passar ' + AllTrim(cNome) + ' em ' + AllTrim(cMateriaD) +'?(S/N)'
         @ 14,60 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
         @ 15,60 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
         @ 16,60 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
         read
         if LastKey() == 27
            nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Voltar ao come‡o' ,'Continuar digitando' })
            if nOpcao = 1
               lSair := .t.
               exit
            elseif nOpcao = 2
               exit
            else
               loop
            endif
         endif

         nPassou := 0
         if cEscolha1 = 'S'
            nPassou++
         endif
         if cEscolha2 = 'S'
            nPassou++
         endif
         if cEscolha3 = 'S'
            nPassou++
         endif

         if nPassou < 2
            //reprova
            nDp++
            cColorD := 'W/R'
            cMateriasDP += ' ' + AllTrim(cMateriaD)
         endif

      endif


//================================ Resultado
      cResultado := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO em todas as materias!'
      //Integral
      if cBolsa = 'I'
         nMensalidade := nMensalidade * 0.02

         if nDp > 0  //tem DP
            nMensalidadeNova := nMensalidade * (nDp * 0.15 + 1)
            cMensalidade     := 'A mensalidade era de R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99')) + ',para R$'+ AllTrim(Transform(nMensalidadeNova,'@E 999,999.99'))
            cResultado       := 'O aluno ' + AllTrim(cNome) + ' foi REPROVADO,pois teve ' + Transform(nDp,'9') +' Dependencias em' + cMateriasDP

         else        //Sem Dp
            cMensalidade := 'Mensalidade continua a mesma R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99'))
         endif

      //Parcial
      elseif cBolsa = 'P'
         nMensalidade := nMensalidade * 0.5

         if nDp > 0  //tem DP
            nMensalidadeNova := nMensalidade * (nDp * 0.15 + 1)
            cMensalidade     := 'A mensalidade era de R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99')) + ',para R$'+ AllTrim(Transform(nMensalidadeNova,'@E 999,999.99'))

            if nDp < 2  //quantas
               cResultado := 'O aluno ' + AllTrim(cNome) + ' foi APROVADO com '+ Transform(nDp,'9') +' DEPENDENCIA em ' + cMateriasDP
            else
               cResultado := 'O aluno ' + AllTrim(cNome) + ' foi REPROVADO,pois ficou com '+ AllTrim(Transform(nDp,'9')) +' DEPENDENCIAS em ' + cMateriasDP
            endif

         else        //Sem DP
            cMensalidade := 'Mensalidade continua a mesma R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99'))
         endif

      //Sem Bolsa
      else
         if nDp > 0  //tem DP
            nMensalidadeNova := nMensalidade * (nDp * 0.15 + 1)
            cMensalidade     := 'A mensalidade era de R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99')) + ',para R$'+ AllTrim(Transform(nMensalidadeNova,'@E 999,999.99'))
            if nDp < 3  //quantas
               cResultado += 'O aluno ' + AllTrim(cNome) + ' foi APROVADO com '+ Transform(nDp,'9') +' DEPENDENCIA em ' + cMateriasDP
            else
               cResultado += 'O aluno ' + AllTrim(cNome) + ' foi REPROVADO,pois ficou com '+ AllTrim(Transform(nDp,'9')) +' DEPENDENCIAS em ' + cMateriasDP
            endif
         else        //Sem DP
            cMensalidade := 'Mensalidade continua a mesma R$'+ AllTrim(Transform(nMensalidade,'@E 999,999.99'))
         endif
      endif

     //Print Final
      nLinha := 7
      @ nLinha++,54 say Transform(nFinalNotaA,'@E 99.9') + '|' + Transform(nTotalFaltaA,'99') color(cColorA)
      @ nLinha++,54 say Transform(nFinalNotaB,'@E 99.9') + '|' + Transform(nTotalFaltaB,'99') color(cColorB)
      @ nLinha++,54 say Transform(nFinalNotaC,'@E 99.9') + '|' + Transform(nTotalFaltaC,'99') color(cColorC)
      @ nLinha++,54 say Transform(nFinalNotaD,'@E 99.9') + '|' + Transform(nTotalFaltaD,'99') color(cColorD)
      @ 20,01 say cResultado
      @ 21,01 say cMensalidade

      InKey(0)
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         lSair := .t.
         exit
      else
         exit
      endif
   enddo
enddo
@ 23,01 say ''
