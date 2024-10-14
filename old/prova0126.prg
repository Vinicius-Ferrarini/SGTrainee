//Vinicius Reginaldo Ferrarini
//Prova 10/07/24

set date to british
set epoch to 1940
set scoreboard off

do while .t.
   clear
   lSair := .t.
   cMateria1 := Space(10)
   cMateria2 := Space(10)
   cMateria3 := Space(10)
   cMateria4 := Space(10)
   nLinha := 2

   @ nLinha++,11 say 'Materia 1:'
   @ nLinha++,11 say 'Materia 2:'
   @ nLinha++,11 say 'Materia 3:'
   @ nLinha++,11 say 'Materia 4:'
   nLinha = 2

   @ nLinha++,21 get cMateria1
   @ nLinha++,21 get cMateria2
   @ nLinha++,21 get cMateria3
   @ nLinha++,21 get cMateria4
   read

   if LastKey() == 27
      nOpcao := alert('Deseja fechar sistema?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         lSair := .f.
         exit
      else
         loop
      endif
   endif
   exit
enddo

do while  lSair

   dHoje        := date()
   cNome        := Space(30)
   dNascimento  := CToD('')
   cCurso       := Space(30)
   nSerie       := 0
   nAno         := 0
   nMensalidade := 0
   nLinha       := 2

   nPassou   := 0
   cEscolha1 := ' '
   cEscolha2 := ' '
   cEscolha3 := ' '

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

   nDp              := 0
   cBolsa           := ' '
   nNovaMensalidade := 0

   cColorA := 'W/G'
   cColorB := 'W/G'
   cColorC := 'W/G'
   cColorD := 'W/G'

   cStatusFinal := "Aluno passou sem NENHUMA DP!"
   cMensalidade := "Mensalidade continua mesma!"

   cMateriasDp := Space(45)

//----------------------------------------------------------------
   clear

   @ 01,20 say 'Unicesumar'

   @ nLinha,01   say "Nome.............:"
   @ nLinha++,52 say "Data de nascimento:"
   @ nLinha++,01 say "Curso............:"
   @ nLinha++,01 say "Serie............:"
   @ nLinha++,01 say "Ano letivo.......:"
   @ nLinha++,01 say "Valor mensalidade:"
   @ nLinha++,01 say "Bolsista(I/P/N)..:"

   nLinha := 2

   @ nLinha  ,20 get cNome        valid !Empty(alltrim(cNome))
   @ nLinha++,72 get dNascimento  valid dNascimento <= dHoje
   @ nLinha++,20 get cCurso       valid !Empty(alltrim(cCurso))
   @ nLinha++,20 get nSerie       valid nSerie > 0
   @ nLinha++,20 get nAno         valid nAno   > 0                 picture "9999"
   @ nLinha++,20 get nMensalidade valid nMensalidade > 0           picture "@E 99,999.99"
   @ nLinha++,23 get cBolsa       valid cBolsa $ 'INP'             picture "@! a"
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif




   //teste

   //cTeste := if(cBolsa== 'n','nao','sim')
   //@nLinha,01 say cTeste

   //fim teste

   nLinha++

   @ nLinha++,10 say "|materia   |  1§B  |  2§B  |  3§B  |  4§B  | Media |"
   @ nLinha++,10 say "|          |N   |F |N   |F |N   |F |N   |F |N   |F | "
   @ nLinha++,10 say "|"+ cMateria1 + "|    |  |    |  |    |  |    |  |    |  |"
   @ nLinha++,10 say "|"+ cMateria2 + "|    |  |    |  |    |  |    |  |    |  |"
   @ nLinha++,10 say "|"+ cMateria3 + "|    |  |    |  |    |  |    |  |    |  |"
   @ nLinha++,10 say "|"+ cMateria4 + "|    |  |    |  |    |  |    |  |    |  |"

   nLinha := 11
   @ nLinha,22   get nNotaA1  picture "99,9" valid 10 >= nNotaA1 .and. nNotaA1 >= 0
   @ nLinha++,27 get nFaltaA1 picture "99"   valid 25 > nFaltaA1 .and. nFaltaA1 >= 0
   @ nLinha,22   get nNotaB1  picture "99.9" valid 10 >= nNotaB1 .and. nNotaB1 >= 0
   @ nLinha++,27 get nFaltaB1 picture "99"   valid 25 > nFaltaB1 .and. nFaltaB1 >= 0
   @ nLinha,22   get nNotaC1  picture "99.9" valid 10 >= nNotaC1 .and. nNotaC1 >= 0
   @ nLinha++,27 get nFaltaC1 picture "99"   valid 25 > nFaltaC1 .and. nFaltaC1 >= 0
   @ nLinha,22   get nNotaD1  picture "99.9" valid 10 >= nNotaD1 .and. nNotaD1 >= 0
   @ nLinha++,27 get nFaltaD1 picture "99"   valid 25 > nFaltaD1 .and. nFaltaD1 >= 0


   nLinha := 11
   @ nLinha,30   get nNotaA2  picture "99.9" valid 10 >= nNotaA2 .and. nNotaA2 >= 0
   @ nLinha++,35 get nFaltaA2 picture "99"   valid 25 > nFaltaA2 .and. nFaltaA2 >= 0
   @ nLinha,30   get nNotaB2  picture "99.9" valid 10 >= nNotaB2 .and. nNotaB2 >= 0
   @ nLinha++,35 get nFaltaB2 picture "99"   valid 25 > nFaltaB2 .and. nFaltaB2 >= 0
   @ nLinha,30   get nNotaC2  picture "99.9" valid 10 >= nNotaC2 .and. nNotaC2 >= 0
   @ nLinha++,35 get nFaltaC2 picture "99"   valid 25 > nFaltaC2 .and. nFaltaC2 >= 0
   @ nLinha,30   get nNotaD2  picture "99.9" valid 10 >= nNotaD2 .and. nNotaD2 >= 0
   @ nLinha++,35 get nFaltaD2 picture "99"   valid 25 > nFaltaD2 .and. nFaltaD2 >= 0


   nLinha := 11
   @ nLinha,38   get nNotaA3  picture "99.9" valid 10 >= nNotaA3 .and. nNotaA3 >= 0
   @ nLinha++,43 get nFaltaA3 picture "99"   valid 25 > nFaltaA3 .and. nFaltaA3 >= 0
   @ nLinha,38   get nNotaB3  picture "99.9" valid 10 >= nNotaB3 .and. nNotaB3 >= 0
   @ nLinha++,43 get nFaltaB3 picture "99"   valid 25 > nFaltaB3 .and. nFaltaB3 >= 0
   @ nLinha,38   get nNotaC3  picture "99.9" valid 10 >= nNotaC3 .and. nNotaC3 >= 0
   @ nLinha++,43 get nFaltaC3 picture "99"   valid 25 > nFaltaC3 .and. nFaltaC3 >= 0
   @ nLinha,38   get nNotaD3  picture "99.9" valid 10 >= nNotaD3 .and. nNotaD3 >= 0
   @ nLinha++,43 get nFaltaD3 picture "99"   valid 25 > nFaltaD3 .and. nFaltaD3 >= 0


   nLinha := 11
   @ nLinha,46   get nNotaA4  picture "99.9" valid 10 >= nNotaA4 .and. nNotaA4 >= 0
   @ nLinha++,51 get nFaltaA4 picture "99"   valid 25 > nFaltaA4 .and. nFaltaA4 >= 0
   @ nLinha,46   get nNotaB4  picture "99.9" valid 10 >= nNotaB4 .and. nNotaB4 >= 0
   @ nLinha++,51 get nFaltaB4 picture "99"   valid 25 > nFaltaB4 .and. nFaltaB4 >= 0
   @ nLinha,46   get nNotaC4  picture "99.9" valid 10 >= nNotaC4 .and. nNotaC4 >= 0
   @ nLinha++,51 get nFaltaC4 picture "99"   valid 25 > nFaltaC4 .and. nFaltaC4 >= 0
   @ nLinha,46   get nNotaD4  picture "99.9" valid 10 >= nNotaD4 .and. nNotaD4 >= 0
   @ nLinha++,51 get nFaltaD4 picture "99"   valid 25 > nFaltaD4 .and. nFaltaD4 >= 0
   read
   if LastKey() == 27
      loop
   endif


   nFinalA := (nNotaA1 + nNotaA2 + nNotaA3 + nNotaA4)/4
   nFinalB := (nNotaB1 + nNotaB2 + nNotaB3 + nNotaB4)/4
   nFinalC := (nNotaC1 + nNotaC2 + nNotaC3 + nNotaC4)/4
   nFinalD := (nNotaD1 + nNotaD2 + nNotaD3 + nNotaD4)/4

   nFaltasTotA :=(nFaltaA1 +nFaltaA2 +nFaltaA3 +nFaltaA4)
   nFaltasTotB :=(nFaltaB1 +nFaltaB2 +nFaltaB3 +nFaltaB4)
   nFaltasTotC :=(nFaltaC1 +nFaltaC2 +nFaltaC3 +nFaltaC4)
   nFaltasTotD :=(nFaltaD1 +nFaltaD2 +nFaltaD3 +nFaltaD4)


   //---------------------------------------------Materia1
   if nFinalA < 6 .or. nFaltasTotA > 56
      //reprova
      cColorA := 'W/R'
      cMateriasDp := " " + alltrim(cMateria1)
      nDp++

   elseif nFaltasTotA > 47
      //conselho
      @ 16,01 say "Deseja passar aluno em "+ cMateria1 +'(S/N)'
      @ 17,01 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
      @ 18,01 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
      @ 19,01 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
      read
      if LastKey() == 27
         loop
      endif

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
         //reprovado
         cColorA := 'W/R'
         cMateriasDp := alltrim(cMateria1)
         nDp++
      endif
   endif
   nPassou := 0


   //---------------------------------------------Materia2
   if nFinalB < 6 .or. nFaltasTotB > 56
      //reprova
      cColorB := 'W/R'
      cMateriasDp += " " + alltrim(cMateria2)
      nDp++

   elseif nFaltasTotB > 47
      //conselho
      @ 16,01 say "Deseja passar aluno em "+ cMateria2 +'(S/N)'
      @ 17,20 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
      @ 18,20 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
      @ 19,20 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
      read
      if LastKey() == 27
         loop
      endif


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
         //reprovado
         cColorB := 'W/R'
         cMateriasDp += " " + alltrim(cMateria2)
         nDp++
      endif
   endif
   nPassou := 0



   //---------------------------------------------Materia3
   if nFinalC < 6 .or. nFaltasTotC > 56
      //reprova
      cColorC := 'W/R'
      cMateriasDp += " " + alltrim(cMateria3)
      nDp++

   elseif nFaltasTotC > 47
      //conselho
      @ 16,01 say "Deseja passar aluno em "+ cMateria3 +'(1-Sim / 2-Nao)'
      @ 17,40 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
      @ 18,40 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
      @ 19,40 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
      read
      if LastKey() == 27
         loop
      endif


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
         //reprovado
         cColorC := 'W/R'
         cMateriasDp += " " + alltrim(cMateria3)
         nDp++
      endif
   endif
   nPassou := 0


   //---------------------------------------------Materia4
   if nFinalD < 6 .or. nFaltasTotD > 56
      //reprova
      cColorD := 'W/R'
      cMateriasDp += " " + alltrim(cMateria4)
      nDp++

   elseif nFaltasTotD > 47
      //conselho
      @ 16,01 say "Deseja passar aluno em "+ cMateria4 +'(S/N)'
      @ 17,60 get cEscolha1 valid cEscolha1 $ 'SN' picture '@!'
      @ 18,60 get cEscolha2 valid cEscolha2 $ 'SN' picture '@!'
      @ 19,60 get cEscolha3 valid cEscolha3 $ 'SN' picture '@!'
      read
      if LastKey() == 27
         loop
      endif


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
         //reprovado
         cColorD := 'W/R'
         cMateriasDp += " " + alltrim(cMateria4)
         nDp++
      endif
   endif



   //---------------------------------------------

   if cBolsa $ 'i'     //bolsa char para Numerico
      nBolsa := 1
   elseif cBolsa $ 'p'
      nBolsa := 2
   else
      nBolsa := 3
   endif


   if nBolsa = 1      //Integral
      if nDp > 0
         nNovaMensalidade := nMensalidade * (0.15 * nDp +1) * 0.02
         nMensalidade     := nMensalidade * 0.02
         cStatusFinal := "Aluno REPROVADO com DP em " + alltrim(cMateriasDp) + "!"
         cMensalidade := "A mensalidade era R$"+ alltrim(transform(nMensalidade,"@E 99,999.99")) + " e ser  R$" + alltrim(transform(nNovaMensalidade,"@E 99,999.99"))
      endif


   elseif nBolsa = 2 //Parcial
      nNovaMensalidade := nMensalidade * (0.15 * nDp +1) * 0.50
      nMensalidade     := nMensalidade * 0.50
      if nDp > 1
         cStatusFinal := "Aluno REPROVADO com DP em " + alltrim(cMateriasDp) + "!"
         cMensalidade := "A mensalidade era R$"+ alltrim(transform(nMensalidade,"@E 99,999.99")) + " e ser  R$" + alltrim(transform(nNovaMensalidade,"@E 99,999.99"))

      elseif nDP = 1
         cStatusFinal := "Aluno APROVADO,com DP em " + alltrim(cMateriasDp) +'!'
         cMensalidade := "A mensalidade era R$"+ alltrim(transform(nMensalidade,"@E 99,999.99")) + " e ser  R$" + alltrim(transform(nNovaMensalidade,"@E 99,999.99"))
      endif


   elseif nDp > 0              //Sem bolsa
      nNovaMensalidade := nMensalidade * (0.15 * nDp +1)
      if nDp > 2
      cStatusFinal := "Aluno REPROVADO,com DP em " + alltrim(cMateriasDp) + "!"
      cMensalidade := "A mensalidade era R$"+ alltrim(transform(nMensalidade,"@E 99,999.99")) + " e ser  R$" + alltrim(transform(nNovaMensalidade,"@E 99,999.99"))

      else
      cStatusFinal := "Aluno APROVADO,com DP em " +alltrim(cMateriasDp) +"!"
      cMensalidade := "A mensalidade era R$"+ alltrim(transform(nMensalidade,"@E 99,999.99")) + " e ser  R$" + alltrim(transform(nNovaMensalidade,"@E 99,999.99"))

      endif

   endif

   //----------------------------------------------------------------------------------------
   nLinha := 11
   @ nLinha++,54 say transform(nFinalA,"99.9") + " " + transform(nFaltasTotA,"99") color(cColorA)
   @ nLinha++,54 say transform(nFinalB,"99.9") + " " + transform(nFaltasTotB,"99") color(cColorB)
   @ nLinha++,54 say transform(nFinalC,"99.9") + " " + transform(nFaltasTotC,"99") color(cColorC)
   @ nLinha++,54 say transform(nFinalD,"99.9") + " " + transform(nFaltasTotD,"99") color(cColorD)

   nLinha += 4

   @ ++nLinha,05 say cStatusFinal
   @ ++nLinha,01 say cMensalidade
   inkey(0)
enddo
@ 23,01 say ''
