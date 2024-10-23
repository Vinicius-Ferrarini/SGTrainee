//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dDataHoje    := date()
nDiaAtual    := Day(dDataHoje)
nMesAtual    := Month(dDataHoje)
nAnoAtual    := Year(dDataHoje)

do while .t.
   clear
   nValorTotal             := 0
   nQuantidadeFuncionarios := 0
   nQuantidadeAposentados  := 0
   nAposentadosHomem       := 0
   nQuantidadeHomem        := 0
   nHomemMais82            := 0
   nAposentadosMulher      := 0
   nQuantidadeMulher       := 0
   nMulherAntes2002        := 0
   nMulherIRRF             := 0
   nContador               := 1
   lProcessar              := .t.
   
   @ 00,40 say 'INSS'
   @ 01,15 say 'Quantidade funcionarios para analise:'
   
   @ 01,52 get nQuantidadeFuncionarios  valid nQuantidadeFuncionarios > 0  picture '9999' 
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif
   
   
   do while nContador <= nQuantidadeFuncionarios
      @ 02,00 clear to 24,79
      cFuncionarioNome                   := Space(25)
      cFuncionarioSexo                   := Space(1)
      dFuncionarioNascimento             := CToD('')
      dFuncionarioAdmissao               := CToD('')
      dFuncionarioDemissao               := CToD('')
      nFuncionarioSalarioBase            := 0
      nFuncionarioLimiteIRRF             := 0
      nFuncionarioAdicionalNoturno       := 0
      nFuncionarioAdicionalInsalubridade := 0
      nLinha                             := 2
      lFuncionarioAPosentado             := .f.

      @ nLinha++,60 say 'Contador:' + AllTrim(Str(nContador))
      @ nLinha,01   say 'Nome......:'
      @ nLinha++,40 say 'Sexo [ ] [M]asculino [F]eminino'
      @ nLinha,01   say 'Nascimento:'
      @ nLinha,40   say 'Admissao:'
      @ nLinha++,60 say 'Demissao:'
      @ nLinha,01   say 'Salario...:'
      @ nLinha++,40 say 'Limite IRRF:'
      @ nLinha,01   say 'Adicional Noturno:  %'
      @ nLinha,40   say 'Adicional Insalubridade:  %'
      
      nLinha-=3
      @ nLinha,12   get cFuncionarioNome                   valid !Empty(cFuncionarioNome)                picture '@!'
      @ nLinha++,46 get cFuncionarioSexo                   valid cFuncionarioSexo $ 'MF'                 picture '@!'
      @ nLinha,12   get dFuncionarioNascimento             valid dFuncionarioNascimento < dDataHoje .and. !Empty(dFuncionarioNascimento)
      @ nLinha,49   get dFuncionarioAdmissao               valid dFuncionarioAdmissao   > dFuncionarioNascimento .and. dFuncionarioAdmissao < dDataHoje
      @ nLinha++,69 get dFuncionarioDemissao               valid dFuncionarioDemissao   > dFuncionarioAdmissao   .and. dFuncionarioDemissao < dDataHoje  
      @ nLinha,12   get nFuncionarioSalarioBase            valid nFuncionarioSalarioBase > 0             picture '@E 999,999.99'
      @ nLinha++,53 get nFuncionarioLimiteIRRF             valid nFuncionarioLimiteIRRF  > 0             picture '@E 999,999.99'
      @ nLinha,19   get nFuncionarioAdicionalNoturno       valid nFuncionarioAdicionalNoturno       >= 0 picture '99'
      @ nLinha,64   get nFuncionarioAdicionalInsalubridade valid nFuncionarioAdicionalInsalubridade >= 0 picture '99'  
      read
      if LastKey() == 27
         nOpcao := Alert('Oque deseja fazer?' , { 'Cancelar' , 'Retomar', 'Processar' })
         if nOpcao == 1
            lProcessar := .f.
            exit
         elseif nOpcao == 2
            loop
         else
            exit
         endif
      endif

      //Idade
      nFuncionarioDiaNascimento    := Day(dFuncionarioNascimento)
      nFuncionarioMesNascimento    := Month(dFuncionarioNascimento)
      nFuncionarioAnoNascimento    := Year(dFuncionarioNascimento)
      
      nFuncionarioIdade  := nAnoAtual - nFuncionarioAnoNascimento   
      if nMesAtual < nFuncionarioMesNascimento .or. (nMesAtual == nFuncionarioMesNascimento .and. nDiaAtual < nFuncionarioDiaNascimento)
         nFuncionarioIdade--
      endif
      //-----------------
      
      //Anos de contribuicao      
      nFuncionarioDiaAdmissao    := Day(dFuncionarioAdmissao)
      nFuncionarioMesAdmissao    := Month(dFuncionarioAdmissao)
      nFuncionarioAnoAdmissao    := Year(dFuncionarioAdmissao) 
      nFuncionarioDiaDemissao    := Day(dFuncionarioDemissao)
      nFuncionarioMesDemissao    := Month(dFuncionarioDemissao)
      nFuncionarioAnoDemissao    := Year(dFuncionarioDemissao) 

      nFuncionarioTempoContribuicao := nFuncionarioAnoDemissao - nFuncionarioAnoAdmissao
      if nFuncionarioMesDemissao < nFuncionarioMesAdmissao .or. (nFuncionarioMesDemissao == nFuncionarioMesAdmissao .and. nFuncionarioDiaDemissao < nFuncionarioAnoDemissao)
         nFuncionarioTempoContribuicao--
      endif
      //-----------------

      //Tem direito aposentadoria
      if cFuncionarioSexo == 'M'
         nQuantidadeHomem++  
         if nFuncionarioIdade > 82
            nHomemMais82++
         endif
         if nFuncionarioIdade >= 61 .and. nFuncionarioTempoContribuicao >= 29
            lFuncionarioAPosentado := .t.
            nAposentadosHomem++
         endif
      
      else
         nQuantidadeMulher++
         if nFuncionarioIdade >= 58 .and. nFuncionarioTempoContribuicao >= 22
            lFuncionarioAPosentado := .t.
            nAposentadosMulher++
         endif
         if nFuncionarioAnoAdmissao < 2002
            nMulherAntes2002++
         endif
      endif
      //-----------------

      //Calcula valor Aposentadoria
      if lFuncionarioAPosentado
         nFuncionarioAposentadoria := nFuncionarioSalarioBase * (nFuncionarioAdicionalNoturno /100 + 1) 
         nFuncionarioAposentadoria += nFuncionarioSalarioBase * (nFuncionarioAdicionalInsalubridade /100 )
         if nFuncionarioAnoAdmissao <= 2009 .and. nFuncionarioAnoDemissao >= 2012
             nFuncionarioAposentadoria += nFuncionarioSalarioBase * 0.09
         endif
         if nFuncionarioAnoAdmissao <= 2015 .and. nFuncionarioAnoDemissao >= 2018
            nFuncionarioAposentadoria -= nFuncionarioSalarioBase * 0.03
         endif
         if nFuncionarioSalarioBase > nFuncionarioLimiteIRRF
            nFuncionarioAposentadoria -= nFuncionarioSalarioBase * 0.07
            if cFuncionarioSexo == 'F'
               nMulherIRRF++
            endif
         endif
         nValorTotal += nFuncionarioAposentadoria
      endif
      //-----------------
      nContador++
      InKey(0)
   enddo
   
   //printa
   if lProcessar
      nPorcentagemHomemAposentado  := nAposentadosHomem  / nQuantidadeHomem  * 100
      nPorcentagemMulherAposentado := nAposentadosMulher / nQuantidadeMulher * 100
      nPorcentagemMulherIRRF       := nMulherIRRF        / nQuantidadeMulher * 100
      nPorcentagemAposentados      := (nAposentadosHomem + nAposentadosMulher) / (nQuantidadeHomem + nQuantidadeMulher) * 100
      @ 08,35 say 'Relatorio'
      @ 10,20 say 'Quantidade Digitado...........: ' + AllTrim(Str(nQuantidadeHomem + nQuantidadeMulher))
      @ 11,20 say 'Valor total de remuneracao....: R$' + AllTrim(Transform(nValorTotal,'@E 99,999,999.99'))
      @ 12,20 say 'Quantidade de Homem...........: ' + AllTrim(Str(nQuantidadeHomem))
      @ 13,20 say 'Quantidade de Mulher..........: ' + AllTrim(Str(nQuantidadeMulher))
      @ 14,20 say 'Porcentagem de aposentados....: ' + AllTrim(Str(nPorcentagemAposentados)) + '%'
      @ 15,20 say 'Homens Aposentados............: ' + AllTrim(Str(nPorcentagemHomemAposentado))  + '%'
      @ 16,20 say 'Mulheres Aposentados..........: ' + AllTrim(Str(nPorcentagemMulherAposentado)) + '%'
      @ 17,20 say 'Homens com mais de 82 anos....: ' + AllTrim(Str(nHomemMais82))
      @ 18,20 say 'Mulheres adimitidas antes 2002: ' + AllTrim(Str(nMulherAntes2002))
      @ 19,20 say 'Mulheres que pagam IRRF.......: ' + AllTrim(Str(nPorcentagemMulherIRRF)) + '%'
      InKey(0)
   endif
enddo