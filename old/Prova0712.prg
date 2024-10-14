setmode (25,80)
set date to british
set epoch to 1930
set century off
set message to 24 center
clear
dAtual     := Date()
nDiaSemana := DoW(dAtual)
nAnoAtual  := Year(dAtual)
nMes       := Month(dAtual)
nDiaAtual  := Day(dAtual)

if nMes = 1
   cMes    := 'Janeiro'
   nDiaMes := 31
elseif nMes  := 2
   cMes    := 'Fevereiro'
   nDiaMes := 28
elseif nMes := 3
   cMes := 'Marco'
   nDiaMes   := 31
elseif nMes := 4
   cMes := 'Abril'
   nDiaMes   := 30
elseif nMes := 5
   cMes := 'Maio'
   nDiaMes   := 31
elseif nMes = 6
   cMes := 'Junho'
   nDiaMes   := 30
elseif nMes = 7
   cMes := 'Julho'
   nDiaMes   := 31
elseif nMes = 8
   cMes := 'Agosto'
   nDiaMes   := 31
elseif nMes = 9
   cMes := 'Setembro'
   nDiaMes   := 30
elseif nMes = 10
   cMes := 'Outubro'
   nDiaMes   := 31
elseif nMes = 11
   cMes := 'Novembro'
   nDiaMes   := 30
elseif nMes = 12
   cMes := 'Dezembro'
   nDiaMes   := 31
endif

do while .t.
   cLogin := "SISTEMA"
   cSenha := "mudar123"

   cLoginSupervisor := 'SUPERVISOR'
   cSenhaSupervisor := 'LIBERE123'

   @ 05,10 say "Login: "
   @ 06,10 say "Senha: "

   @ 05,16 get cLogin
   @ 06,16 get cSenha
   read
   if lastkey() == 27
      nOpcaoSair := ALERT('Deseja Sair do programa?',{'Sim','Continuar'})
      if nOpcaoSair == 1
         exit
      else
         loop
      endif
   endif
   clear

   @ 05,20 prompt '1. Efetuar vendas' message 'Efetua as vendas'

   @ 06,20 prompt '2. Sair'           message 'Volta para a tela de login'
   menu to nOpcaoEntrar
   if nOpcaoEntrar = 1
      do while .t.

         clear
         nOrdemServico         := 0
         nLimiteCredito        := 0
         nTelefoneCliente      := 0
         nTaxEntrega           := 0.04
         nValorTaxaEntrega     := 0
         nAnoServico           := 0

         dOrdemServico         := dAtual
         dCompra               := CtoD('')

         cNomeCliente          := Space(40)
         cNomeTecnico          := Space(30)
         cDescricaoEquipamento := Space(40)
         cEntrega              := Space(1)
         cEnderecoEntrega      := Space(30)
         cBairroEntrega        := Space(15)
         cReferenciaEntrega    := Space(25)

         lEntrega              := .f.
         //Dados do cliente e tecnico
         @ 00,04 to 08,75
         @ 01,05 say "Data Ordem de Servi‡o...: "
         @ 02,05 say "Nome do Cliente.........: "
         @ 03,05 say "Limite de credito.......: "
         @ 04,05 say "Nome do T‚cnico.........: "
         @ 05,05 say "Descri‡ao do equipamento: "
         @ 06,05 say "Data da compra..........: "
         @ 07,05 say "Entrega em dom¡cilio?.... "

         nOpcaoDataServico := ALERT('Data de Servico diferente do dia de hoje?',{'Sim','Nao'})
         if nOpcaoDataServico == 1
            @ 01,30 get dOrdemServico
         else
            @ 01,05 say "Data Ordem de Servi‡o: " + DToC(dAtual)
         endif
         @ 02,30 get cNomeCliente          picture '@!'          valid !Empty(cNomeCliente)
         @ 03,30 get nLimiteCredito        picture '@E 99999.99' valid nLimiteCredito > 0
         @ 04,30 get cNomeTecnico          picture '@!'          valid !Empty(cNomeTecnico)
         @ 05,30 get cDescricaoEquipamento picture '@!'          valid !Empty(cDescricaoEquipamento)
         @ 06,30 get dCompra                                     valid !Empty(dCompra)
         @ 07,30 get cEntrega              picture '@!'          valid cEntrega $ 'SN'
         read

         nAnoServico := Year(dOrdemServico)
         nMesServico := Month(dOrdemServico)
         nDiaServico := Day(dOrdemServico)

         nAnoCompra  := Year(dCompra)
         nMesCompra  := Month(dCompra)
         nDiaCompra  := Day(dCompra)


         nGarantiaAno := nAnoServico - nAnoCompra
         nGarantiaMes := nMesServico - nMesCompra
         nGarantiaDia := nDiaServico - nDiaCompra

         if nGarantiaDia < 0
            nGarantiaDia := nGarantiaDia + nDiaMes
            nGarantiaMes--
         endif

         if nGarantiaMes < 0
            nGarantiaMes := nGarantiaMesMes + 12
            nGarantiaAno--
         endif

         if cEntrega == 'S'
            lEntrega := .t.
            @ 09,29 to 15,71
            @ 10,40 say "Dados Entrega"
            @ 11,30 say "Endere‡o: "
            @ 12,30 say "Bairro: "
            @ 13,30 say "Referˆncia: "
            @ 14,30 say "Telefone para contato: "

            @ 11,40 get cEnderecoEntrega   picture '@!'        valid !Empty(cEnderecoEntrega)
            @ 12,40 get cBairroEntrega     picture '@!'        valid !Empty(cBairroEntrega)
            @ 13,40 get cReferenciaEntrega picture '@!'        valid !Empty(cReferenciaEntrega)
            @ 14,40 get nTelefoneCliente   picture '999999999' valid nTelefoneCliente > 0
            read
         endif
         //Fim(Dados cliente e tecnico)
         clear

         //µrea de Compra do cliente
         nPrecoCompra          := 0
         nProdutos             := 0
         nServicos             := 0
         nComissaoTecnicoValor := 0

         do while .t.

            @ 04,24 to 08,35 double
            @ 05,25 prompt "Produtos" message "Faz pedido de um produto"

            @ 07,25 prompt "Servicos" message "Faz pedido de um servico"
            menu to nOpcaoServico
            if lastkey () == 27
               nOpcaoPagamento := ALERT('Deseja?',{'Finalizar ordem de servi‡o','Cancelar ordem de servico'})
               if nOpcaoPagamento == 1
                  clear
                  if nProdutos == 0 .and. nServicos == 0
                     ALERT('Voce nao tem produtos nem servicos na ordem de servico. Fa‡a alguma compra antes de realizar o pagamento!',{'OK'})
                     loop
                  endif
                  //Pagamento

                  if lEntrega
                     nValorTaxaEntrega := nPrecoCompra * nTaxEntrega
                     nPrecoCompra += + nValorTaxaEntrega
                  endif

                  if nPrecoCompra == 0
                     nCPNJ       := 0
                     nNumeroNota := 0
                     dNota       := CtoD('')
                     @ 01,01 to 05,40

                     @ 02,20 say "Nota Fiscal"
                     @ 03,02 say "CNPJ da empresa: "
                     @ 04,02 say "Numero da nota.: "
                     @ 05,02 say "Data da nota...: "

                     @ 03,16 get nCPNJ       picture '99999999999999' valid nCPNJ > 0
                     @ 04,16 get nNumeroNota picture '9999999999'     valid nNumeroNota > 0
                     @ 05,16 get dNota                                valid !Empty(dNota)
                     if nComissaoTecnicoValor != 0
                        @ 08,02 say "Comissao do tecnico: R$" + Transform(nComissaoTecnicoValor,'@E 9999.99')
                     endif
                     @ 24,15 say "Pressione qualquer tecla para encerrar o processo!"
                     nOrdemServico++
                     INKEY(0)
                  endif
                  nValorCompra   := nPrecoCompra


                  do while nPrecoCompra != 0
                  cTipoPagamento := Space(1)
                  nValorRecebido := 0

                  @ 01,01 to 07,50
                  @ 02,30 say "Pagamento"
                  @ 03,02 say "[D]inheiro|[C]artao|Che[Q]ue: "
                  @ 04,02 say "Preco da compra.............: R$" + Transform(nPrecoCompra,'@E 99999999999.99')
                  @ 05,02 say "Valor restante a pagar......: " + Transform(nValorCompra,'@E 99999999999.99')
                  @ 06,02 say "Valor a receber.............: "

                  @ 03,29 get cTipoPagamento picture '@!'                valid cTipoPagamento $ "DCQ"
                  @ 06,29 get nValorRecebido picture '@E 99999999999.99' valid nValorRecebido > 0
                  read

                  nValorCompra += - nValorRecebido
                  if nPrecoCompra <= 0
                     nValorCompra := 0
                     @09,02 say "Compra concluida com sucesso"
                     if nComissaoTecnicoValor != 0
                        @ 08,02 say "Comissao do tecnico: R$" + Transform(nComissaoTecnicoValor,'@E 9999.99')
                     endif

                     @ 24,15 say "Pressione qualquer tecla para encerrar o processo!"
                     nOrdemServico++
                     INKEY(0)
                  endif

                  enddo
               elseif nOpcaoPagamento == 2
                  exit
               endif
            endif

            if nOpcaoServico == 1
               //Produtos
               do while .t.
                  clear
                  cDescricaoProduto := Space(30)
                  nQtdeProduto      := 0
                  nPrecoUnitProduto := 0
                  nDescontoProduto  := 0
                  nValorTotal       := 0
                  lGarantiaProduto  := .f.

                  @ 01,01 to 06,60 double

                  @ 02,02 say "Descricao do produto: "
                  @ 03,02 say "Preco do produto....: "
                  @ 04,02 say "Quantidade..........: "
                  @ 05,02 say "Desconto do produto.: "
                  @ 05,30 say "%"

                  @ 02,24 get cDescricaoProduto picture '@!'              valid !Empty(cDescricaoProduto)
                  @ 03,24 get nPrecoUnitProduto picture '@E 99999999.99'  valid nPrecoUnitProduto > 0
                  @ 04,24 get nQtdeProduto      picture '99'              valid nQtdeProduto > 0
                  @ 05,24 get nDescontoProduto  picture '@E 999.99'       valid nDescontoProduto >= 0 .and. nDescontoProduto <= 100
                  read
                  if lastkey() == 27
                     nOpcaoSairProduto := ALERT('Deseja cancelar essa compra?',{'Sim','Continuar Comprando'})
                     if nOpcaoSairProduto == 2
                        exit
                     endif
                  endif

                  nValorTotalProduto := nPrecoUnitProduto * nQtdeProduto

                  if nGarantiaAno <= 2
                     lGarantiaProduto   := .t.
                     nValorTotalProduto := 0
                  endif

                  if nDescontoProduto != 0
                     nDescontoProduto := nDescontoProduto /100
                     nValorTotalProduto += - (nValorTotalProduto * nDescontoProduto)
                  endif

                  nPrecoCompra += + nValorTotalProduto

                  @ 07,02 say "Pre‡o total produto: " + Transform(nValorTotalProduto,'@E 99999999.99')

                  if lGarantiaProduto
                     @ 08,02 say "Pre‡o total produto(Com garantia): " + Transform(nPrecoCompra,'@E 999999999.99')
                  endif

                  if nPrecoCompra > nLimiteCredito
                     cTentativaSupervisorLogin := Space(10)
                     cTentativaSupervisorSenha := Space(10)

                     @ 15,02 say "Limite de credito estourado, aguardando permicao do supervisor..."
                     @ 17,02 say "Usu rio:"
                     @ 18,02 say "Senha..:"

                     @ 17,11 get cTentativaSupervisorLogin valid !Empty(cTentativaSupervisorLogin)
                     @ 18,11 get cTentativaSupervisorSenha valid !Empty(cTentativaSupervisorSenha)
                     read
                     if !(cTentativaSupervisorLogin = cLoginSupervisor .and. cTentativaSupervisorSenha = cSenhaSupervisor)
                        nPrecoCompra += - nValorTotalProduto
                     endif
                  endif

                  @ 24,15 say "Pressione qualquer tecla para continuar"
                  INKEY(0)
                  nProdutos++
                  enddo
            elseif nOpcaoServico == 2
               //Servicos
               do while .t.
                  clear
                  cDescricaoServico := Space(25)
                  nValorServico     := 0
                  nDescontoServico  := 0
                  nComissaoTecnico  := 0
                  nPrecoTotal       := 0

                  lGarantiaServico  := .f.

                  @ 01,01 to 06,60 double

                  @ 02,02 say "Descricao do Servico: "
                  @ 03,02 say "Valor do servico....: "
                  @ 04,02 say "Comissao do tecnico.: "
                  @ 04,30 say "%"
                  @ 05,02 say "Desconto do servico.: "
                  @ 05,30 say "%"

                  @ 02,24 get cDescricaoServico picture '@!'             valid !Empty(cDescricaoServico)
                  @ 03,24 get nValorServico     picture '@E 99999999.99' valid nValorServico >= 0
                  @ 04,24 get nComissaoTecnico  picture '@E 999.99'      valid nComissaoTecnico >= 0 .and. nComissaoTecnico <= 100
                  @ 05,24 get nDescontoServico  picture '@E 999.99'      valid nDescontoServico >= 0 .and. nDescontoServico <= 100
                  read
                  if lastkey() == 27
                     nOpcaoSairServico := ALERT('Deseja cancelar esse servico?',{'Sim','Continuar'})
                     if nOpcaoSairServico == 2
                        exit
                     endif
                  endif

                  if nComissaoTecnico != 0
                     nComissaoTecnicoValor += + (nValorServico * (nComissaoTecnico/100))
                  endif

                  if nGarantiaAno <= 1
                     nValorServico    := 0
                     lGarantiaServico := .t.
                  endif

                  if nDescontoServico != 0
                     nValorServico += - (nValorServico * (nDescontoServico/100))
                  endif

                  nPrecoCompra += + nValorServico

                  @ 07,02 say "Pre‡o total do servico: " + Transform(nValorServico,'@E 99999999.99')

                  if lGarantiaServico
                     @ 08,02 say "Pre‡o total servico(Com garantia): " + Transform(nPrecoCompra,'@E 999999999.99')
                  endif

                  if nPrecoCompra > nLimiteCredito
                     cTentativaSupervisorLogin := Space(10)
                     cTentativaSupervisorSenha := Space(10)

                     @ 15,02 say "Limite de credito estourado, aguardando permicao do supervisor..."
                     @ 17,02 say "Usu rio:"
                     @ 18,02 say "Senha..:"

                     @ 17,11 get cTentativaSupervisorLogin
                     @ 18,11 get cTentativaSupervisorSenha
                     read
                     if !(cTentativaSupervisorLogin = cLoginSupervisor .and. cTentativaSupervisorSenha = cSenhaSupervisor)
                        nPrecoCompra += - nValorServico
                     endif
                  endif


                  @ 24,15 say "Pressione qualquer tecla para continuar"
                  INKEY(0)
                  nServicos++
               enddo
            endif
            //Fim(µrea de compra do clinte)
         enddo
      enddo
   endif
enddo
