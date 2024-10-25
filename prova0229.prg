// LILIAN AYUMI YAMADA HAKUTAKE

Set color to N/W
clear
SetMode(25,80)
Set scoreboard off
Set date to british
Set epoch to 1940
Set century on

//analise data do sistema
dAtual    := Date()
nAnoAtual := Year(dAtual)
nMesAtual := Month(dAtual)
nDiaAtual := Day(dAtual)


do while .t.
   nEmpregados                 := 0
   cAlerta                     := 'DESEJA SAIR?'
   nAlerta                     := 0
   cCorAlerta                  := 'W/N'
   nAnalisados                 := 0
   nAposentou                  := 0
   nHomemAposentado            := 0
   nPercentualHomemAposentado  := 0
   nMulherAposentada           := 0
   nPercentualMulherAposentada := 0
   nTotalRemuneracao           := 0
   nHomemSuperior80            := 0
   nMulherAdmitidaAntes2003    := 0
   nHomemDemitido2015          := 0

   clear
   @ 00,00 to 24,79 double
   @ 01,01 say 'PROGRAMA: CONTROLE_INSS'
   @ 02,01 to 02,78 double
   @ 04,01 to 04,78

   //solicitacao do numero de empregados a serem analisados
   @ 03,01 say 'NUMERO DE EMPREGADOS A SEREM ANALISADOS:' get nEmpregados picture '999' valid nEmpregados > 0

   read
   if LastKey() == 27
      nAlerta := alert(cAlerta, {'SIM', 'NAO'}, cCorAlerta)
      if nAlerta == 1
         exit
      elseif nAlerta == 2
         loop
      endif
   endif

   do while nAnalisados < nEmpregados
      nLinha                  := 05
      cNome                   := Space (30)
      cSexo                   := Space(1)
      dNascimento             := CToD('')
      dAdmissao               := CToD('')
      dDemissao               := CToD('')
      nSalarioBase            := 0
      nAdicionalNoturno       := 0
      nAdicionalInsalubridade := 0
      nAnoNascimento          := 0
      nMesNascimento          := 0
      nDiaNascimento          := 0
      nAnoAdmissao            := 0
      nMesAdmissao            := 0
      nDiaAdmissao            := 0
      nAnoDemissao            := 0
      nMesDemissao            := 0
      nDiaDemissao            := 0
      nAnoIdade               := 0
      nAnoTrabalho            := 0
      lAposentou              := .f.
      nRemuneracao            := 0
      nAdicaoOito             := 0
      nReducaoTres            := 0
      nAdicaoNoturno          := 0
      nAdicaoInsalubridade    := 0

      @ 05,01 clear to 15,78
      @ 13,01 to 13,78
      @ 15,01 to 15,78 double

      //solicitacao de dados do colaborador
      @ nLinha++,01 say 'NOME DO COLABORADOR........:' get cNome                     picture '@!'            valid !empty(cNome)
      @ nLinha++,01 say 'SEXO.......................:' get cSexo                     picture '@!'            valid cSexo $ 'MF'
      @ nLinha++,01 say 'DATA DE NASCIMENTO.........:' get dNascimento                                       valid !empty(dNascimento) .and. dNascimento < dAtual
      @ nLinha++,01 say 'DATA DE ADMISSAO...........:' get dAdmissao                                         valid !empty(dAdmissao)   .and. dAdmissao   > dNascimento
      @ nLinha++,01 say 'DATA DE DEMISSAO...........:' get dDemissao                                         valid !empty(dDemissao)   .and. dDemissao   > dAdmissao
      @ nLinha++,01 say 'SALARIO BASE (R$)..........:' get nSalarioBase              picture '@E 999,999.99' valid nSalarioBase > 0
      @ nLinha++,01 say 'ADICIONAL NOTURNO (%)......:' get nAdicionalNoturno         picture '999.99'        valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno <= 100.00
      @ nLinha++,01 say 'ADICIONAL INSALUBRIDADE (%):' get nAdicionalInsalubridade   picture '999.99'        valid nAdicionalInsalubridade >= 0 .and. nAdicionalInsalubridade <= 100.00

      read
      if LastKey() == 27
         nAlerta := alert(cAlerta, {'CANCELAR', 'RETORNAR', 'PROCESSAR'}, cCorAlerta)
         if nAlerta == 2
            loop
         else
            exit
         endif
      endif

      //analise de data
      nAnoNascimento := Year(dNascimento)
      nMesNascimento := Month(dNascimento)
      nDiaNascimento := Day(dNascimento)

      nAnoAdmissao   := Year(dAdmissao)
      nMesAdmissao   := Month(dAdmissao)
      nDiaAdmissao   := Day(dAdmissao)

      nAnoDemissao   := Year (dDemissao)
      nMesDemissao   := Month(dDemissao)
      nDiaDemissao   := Day(dDemissao)

      nAnoIdade      := nAnoAtual - nAnoNascimento
      nAnoTrabalho   := nAnoDemissao - nAnoAdmissao


      //adicionais

      if nAdicionalNoturno > 0
         nAdicaoNoturno := nSalarioBase * (nAdicionalNoturno/100)
      endif
      if nAdicionalInsalubridade > 0
         nAdicaoInsalubridade := nSalarioBase * (nAdicionalInsalubridade/100)
      endif

      //calculo idade e anos trabalhados
      if nMesAtual < nMesNascimento .or. (nMesNascimento == nMesAtual .and. nDiaAtual < nDiaNascimento)
         nAnoIdade--
      endif
      if nMesDemissao < nMesAdmissao .or. (nMesDemissao == nMesAdmissao .and. nDiaDemissao < nDiaAdmissao)
         nAnoTrabalho--
      endif

      //verifica aposentadoria
      if cSexo == 'M'
         if nAnoIdade >= 65 .and. nAnoTrabalho >= 30
            lAposentou := .t.
            nHomemAposentado++
         endif
         if nAnoIdade > 80
            nHomemSuperior80++
         endif
         if nAnoDemissao == 2015
            nHomemDemitido2015++
         endif
      endif

      if cSexo == 'F'
         if nAnoIdade >= 60 .and. nAnoTrabalho >= 25
            lAposentou := .t.
            nMulherAposentada++
         endif
         if nAnoAdmissao < 2003
            nMulherAdmitidaAntes2003++
         endif
      endif

      //calculo remuneracao se for aposentado
      if lAposentou

         if nAnoDemissao >= 2009
            nAdicaoOito := nSalarioBase * 0.08
         endif
         if nAnoDemissao >= 2013
            nReducaoTres := nSalarioBase * 0.03
         endif

         nRemuneracao := nSalarioBase + nAdicaoOito - nReducaoTres + nAdicaoNoturno + nAdicaoInsalubridade
         @ 14,01 say Alltrim(cNome) + ' ESTA APTO(A) A RECEBER APOSENTADORIA DE R$ ' + Alltrim(Transform(nRemuneracao, '@E 999,999,999.99')) color('G/W')
         nTotalRemuneracao += nRemuneracao

      //calculo remuneracao se nao for aposentado
      else

         nRemuneracao := nSalarioBase + nAdicaoNoturno + nAdicaoInsalubridade
         @ 14,01 say Alltrim(cNome) + ' NAO ESTA APTO(A) A RECEBER APOSENTADORIA, SALARIO ATUAL DE RS ' + Alltrim(Transform(nRemuneracao, '@E 999,999,999.99')) color('R/W')

      endif

      InKey(0)
      nAnalisados++
   enddo

   if nAlerta == 1
      loop
   endif

   //quadro final
   @ 16,01 say 'PROCESSANDO INFORMACOES...'
   InKey(0.5)
   @ 16,01 clear to 16,78
   @ 16,01 say 'QUADRO DE INFORMACOES'
   @ 17,01 to 17,78
   nLinha := 18

   nPercentualHomemAposentado := 100 * nHomemAposentado  / nAnalisados
   nPercentualMulherAposentada:= 100 * nMulherAposentada / nAnalisados

   @ nLinha++,01 say 'PERCENTUAL DE HOMENS APOSENTADOS.....................: '    + Alltrim(Str(nPercentualHomemAposentado))  + '%'
   @ nLinha++,01 say 'PERCENTUAL DE MULHERES APOSENTADAS...................: '    + Alltrim(Str(nPercentualMulherAposentada)) + '%'
   @ nLinha++,01 say 'VALOR TOTAL DA REMUNERACAO DOS APOSENTADOS...........: R$ ' + Alltrim(Transform(nTotalRemuneracao, '@E 999,999,999,999.99'))
   @ nLinha++,01 say 'QUANTIDADE DE HOMENS COM IDADE SUPERIOR A 80 ANOS....: '    + Alltrim(Str(nHomemSuperior80))
   @ nLinha++,01 say 'QUANTIDADE DE MULHERES ADMITIDAS ANTES DO ANO DE 2003: '    + Alltrim(Str(nMulherAdmitidaAntes2003))
   @ nLinha++,01 say 'QUANTIDADE DE HOMENS DEMITIDOS NO ANO DE 2015........: '    + Alltrim(Str(nHomemDemitido2015))
   InKey(0)
enddo
InKey(0)
