// LILIAN AYUMI YAMADA HAKUTAKE
set color to ''
clear
setmode(25,80)
set scoreboard off
set message to 24 center
set wrap on
set date to british
set epoch to 1940

do while .t.
   nAlerta := 0
   cLogin := space(7)
   cSenha := space(8)
   nOpcao := 0

   clear
   @ 00,00 to 24,79 double
   @ 01,01 say padc('ASSITENCIA TECNICA',78)
   @ 02,01 to 02,78 double
   @ 03,01 say padc('TELA DE INICIALIZACAO DO SISTEMA',78)
   @ 04,01 to 04,78 double
   @ 05,01 say 'LOGIN:' get cLogin picture '@!' valid 'ADMIN'  $ cLogin
   @ 06,01 say 'SENHA:' get cSenha picture '@!' valid '123MUDAR' $ cSenha
   @ 07,01 to 07,78 double

   read
   if lastkey() == 27
      nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'})
      if nAlerta == 2
         loop
      else
         exit
      endif
   endif

   inkey(0)
   @ 03,01 clear to 23,78
   @ 03,01 say padc('MENU PRINCIPAL',78)
   @ 04,01 to 04,78 double
   @ 05,01 prompt padc('EFETUAR VENDAS', 78) message 'EFETUAR VENDAS'
   @ 06,01 prompt padc('SAIR', 78)           message 'SAIR'
   @ 07,01 to 07,78 double
   menu to nOpcao

   if nOpcao == 1
      nOrdemServico := 1

      do while .t.
         cCliente := space(40)
         dOrdemServico := ctod('')
         cTecnico := space(30)
         cEquipamento := space(40)
         dCompra := ctod('')
         cEntregaDomicilio := space(1)
         nLimiteCredito := 0
         nTotalOrdemServico := 0
         nLinhaProduto := 7
         nLinhaServico := 15
         nAnoCompra := 0
         nMesCompra := 0
         nDiaCompra := 0
         nAnoOrdServ:= 0
         nMesOrdServ:= 0
         nDiaOrdServ := 0
         nAnoGarantia:= 0
         nMesGarantia:= 0
         nDiaGarantia:= 0
         lGarantia   := .f.
         cEndereco := space(30)
         cBairro := space(30)
         cReferencia := space(30)
         cTelefone := space(14)
         nEntrega := 0
         nTaxaEntrega := 0
         nComissaoTecnico := 0

         clear
         @ 00,00 to 24,79 double
         @ 01,01 say padc('ASSISTENCIA TECNICA - DADOS DA ORDEM DE SERVICO ' + alltrim(str(nOrdemServico)),78)
         @ 02,01 to 02,78 double
         @ 03,01 say 'NOME DO CLIENTE..............:   ' get cCliente          picture '@!'                valid !empty(cCliente)
         @ 04,01 say 'DATA DA ORDEM DE SERVICO.....:   ' get dOrdemServico                                 valid !empty(dOrdemServico)
         @ 05,01 say 'NOME DO TECNICO..............:   ' get cTecnico          picture '@!'                valid !empty(cTecnico)
         @ 06,01 say 'DESCRICAO DO EQUIPAMENTO.....:   ' get cEquipamento      picture '@!'                valid !empty(cEquipamento)
         @ 07,01 say 'DATA DA COMPRA...............:   ' get dCompra                                       valid !empty(dCompra) .and. dCompra <= dOrdemServico
         @ 08,01 say 'ENTREGA DOMICILIO [S]IM/[N]AO:   ' get cEntregaDomicilio picture '@!'                valid cEntregaDomicilio $ 'SN'
         @ 09,01 say 'LIMITE DE CREDITO DO CLIENTE.: R$' get nLimiteCredito    picture '@E 999,999,999.99' valid nLimiteCredito > 0
         @ 10,01 to 10,78 double

         read
         if lastkey() == 27
            nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'})
            if nAlerta == 2
               loop
            else
               exit
            endif
         endif

         //confere garantia
         nAnoOrdServ := year(dOrdemServico)
         nMesOrdServ := month(dOrdemServico)
         nDiaOrdServ := day(dOrdemServico)
         nAnoCompra := year(dCompra)
         nMesCompra := month(dCompra)
         nDiaCompra := day(dCompra)

         nAnoGarantia := nAnoOrdServ - nAnoCompra
         nMesGarantia := nMesOrdServ - nMesCompra
         nDiaGarantia := nDiaOrdServ - nDiaCompra

         if nMesGarantia < 0
            nAnoGarantia--
            nMesGarantia+=12
         endif
         if nDiaGarantia < 0
            nMesGarantia--
         endif

         //caso tenha entrega
         if cEntregaDomicilio $ 'S'
            nTaxaEntrega := 0.3

            @ 11,01 say 'ENDERECO..................:' get cEndereco   picture '@!'          valid !empty(cEndereco)
            @ 12,01 say 'BAIRRO....................:' get cBairro     picture '@!'          valid !empty(cBairro)
            @ 13,01 say 'REFERENCIA................:' get cReferencia picture '@!'          valid !empty(cReferencia)
            @ 14,01 say 'TELEFONE..................:' get cTelefone   picture '99999999999' valid !empty(cTelefone)

            read
            if lastkey() == 27
               nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'})
               if nAlerta == 2
                  loop
               else
                  exit
               endif
            endif
         endif

         //ordem de servico
         @ 03,01 clear to 23,78
         do while .t.
            cProdutoServico := space(1)

            @ 03,01 say '[P]RODUTO/[S]ERVICO:' get cProdutoServico picture '@!' valid cProdutoServico $ 'PS'
            @ 04,01 to 04,78 double
            read
            if lastkey() == 27
               nAlerta := alert('DESEJA FINALIZAR A ORDEM DE SERVICO?', {'SIM', 'NAO'})
               if nAlerta == 2
                  loop
               else
                  exit
               endif
            endif
            @ 05,01 say 'DESCRICAO DO PRODUTO'
            @ 05,32 say 'QTDE'
            @ 05,37 say 'PRECO UNIT (R$)'
            @ 05,55 say '% DESC'
            @ 05,62 say 'VALOR TOTAL (R$)'
            @ 06,01 to 06,78 double
            @ 12,01 to 12,78 double
            @ 13,01 say 'DESCRICAO DO SERVICO'
            @ 13,32 say '% DESC'
            @ 13,44 say '% COM'
            @ 13,56 say 'VALOR TOTAL (R$)'
            @ 14,01 to 14,78 double
            @ 19,01 to 19,78 double

            do while .t.

               cProduto := space(30)
               nQte  := 0
               nPrecoUnit := 0
               nDescProduto := 0
               nTotalProduto := 0
               cServico := space(25)
               nDescServico := 0
               nComissao := 0
               nTotalServico := 0
               cSupervisor := space(15)
               cSenhaSupervisor := space(9)
               cLiberaSupervisor := space(1)

               //recebe dados da ordem de servico
               if cProdutoServico $ 'P'
                  @ nLinhaProduto,01 get cProduto      picture '@!'                   valid !empty(cProduto)
                  @ nLinhaProduto,32 get nQte          picture '9999'                 valid nQte > 0
                  @ nLinhaProduto,37 get nPrecoUnit    picture '@E 99,999,999,999.99' valid nPrecoUnit > 0
                  @ nLinhaProduto,55 get nDescProduto  picture '999.99'               valid nDescProduto >= 0 .and. nDescProduto <= 100
               else
                  @ nLinhaServico,01 get cServico      picture '@!'                   valid !empty(cServico)
                  @ nLinhaServico,32 get nDescServico  picture '999.99'               valid nDescServico >= 0 .and. nDescProduto <= 100
                  @ nLinhaServico,44 get nComissao     picture '999.99'               valid nComissao >= 0
                  @ nLinhaServico,56 get nTotalServico picture '@E 999,999,999,999.99'valid nTotalServico > 0
               endif
               read
               if lastkey() == 27
                  nAlerta := alert('DESEJA TROCAR PARA PRODUTO/SERVICO?',{'SIM', 'NAO'})
                  if nAlerta == 2
                     loop
                  else
                     exit
                  endif
               endif

               //calcula e confere total com a garantia do produto ou servico
               if cProdutoServico $ 'P'
                  nTotalProduto := nQte * nPrecoUnit * (1-nDescProduto/100)
                  if nAnoGarantia <= 2
                     lGarantia := .t.
                     nTotalProduto := 0
                  endif
                  @ nLinhaProduto,62 say alltrim(transform(nTotalProduto,'@E 99,999,999,999.99'))
                  nLinhaProduto++
               else
                  if nAnoGarantia <= 1
                     lGarantia := .t.
                     nTotalServico := 0
                     @ nLinhaServico,56 say alltrim(transform(nTotalOrdemServico, '@E 999,999,999,999.99'))
                  endif
                  if nComissao > 0
                     nComissaoTecnico += (nComissao/100 * nTotalOrdemServico)
                  endif

                  nLinhaServico++
               endif

               //confere limite de credito
               nLimiteCredito -= nTotalProduto + nTotalServico

               //confere supervisor
               if nLimiteCredito < 0
                  alert('LIMITE DE CREDITO ULTRAPASSADO')
                  @ 22,01 say 'USUARIO SUPERVISOR:' get cSupervisor      picture '@!' valid !empty(cSupervisor)
                  @ 23,01 say 'SENHA:'              get cSenhaSupervisor picture '@!' valid cSenhaSupervisor $ '123LIBERA'
                  @ 23,30 say 'LIBERA LIMITE DE CREDITO [S]IM/[N]AO:' get cLiberaSupervisor picture '@!' valid cLiberaSupervisor $ 'SN'
                  read
                  if lastkey() == 27
                     if cProdutoServico $ 'P'
                        nLinhaProduto--
                     else
                        nLinhaServico--
                     endif
                     loop
                  endif
                  if cLiberaSupervisor $ 'N'
                     if cProdutoServico $ 'P'
                        nLinhaProduto--
                     else
                        nLinhaServico--
                     endif
                     loop
                  endif
               endif

               //soma no total da ordem de servico
               nTotalOrdemServico += nTotalProduto + nTotalServico
               @ 20,01 say 'VALOR TOTAL DA ORDEM DE SERVICO: R$ ' + alltrim(transform(nTotalOrdemServico, '@E 999,999,999,999,999.99'))
               @ 21,01 say 'LIMITE DE CREDITO RESTANTE: R$ '      + alltrim(transform(nLimiteCredito, '@E 999,999,999,999,999.99'))

               //controle de linhas
               if nLinhaProduto == 12
                  inkey(0)
                  nLinhaProduto:= 7
                  @ 07,01 clear to 11,78
                  loop
               endif
               if nLinhaServico == 19
                  inkey(0)
                  nLinhaServico := 15
                  @ 15,01 clear to 18,78
                  loop
               endif
            enddo
         enddo
         if nTotalOrdemServico > 0 .or. (nTotalOrdemServico == 0 .and. lGarantia)
            do while .t.
               nCnpj := 0
               nNota := 0
               dNota := ctod('')
               nValorRecebido := 0
               lPagamentoDinheiro := .t.
               lPagamentoCartao := .t.
               lPagamentoCheque := .t.
               lPagou := .t.

               @ 03,01 clear to 23,78
               @ 03,01 say padc('AREA DE PAGAMENTO',78)
               @ 04,01 to 04,78 double

               //total com entrega
               @ 05,01 say 'VALOR TOTAL DA ORDEM DE SERVICO.......: R$ ' + alltrim(transform(nTotalOrdemServico, '@E 999,999,999,999,999.99'))
               nEntrega := nTotalOrdemServico * nTaxaEntrega
               @ 06,01 say 'VALOR DA TAXA DE ENTREGA..............: R$ ' + alltrim(transform(nEntrega,'@E 999,999.99'))
               nTotalOrdemServico += nEntrega
               @ 07,01 say 'VALOR DA ORDEM DE SERVICO COM ENTREGA.: R$ ' + alltrim(transform(nTotalOrdemServico,'@E 999,999,999,999,999.99'))
               @ 08,01 to 08,78 double

               //pagamento
               do while .t.
               cFormaPagamento := space(1)

                  if nTotalOrdemServico > 0
                     @ 09,01 say 'FORMA DE PAGAMENTO [D]INHEIRO/CHE[Q]UE/[C]ARTAO:' get cFormaPagamento picture '@!' valid cFormaPagamento $ 'DQC'
                     read
                     if lastkey() == 27
                        loop
                     endif

                     if cFormaPagamento $ 'D' .and. lPagamentoDinheiro
                        @ 10,01 say 'VALOR RECEBIDO: R$'get nValorRecebido picture '@E 999,999,999,999,999.99' valid nValorRecebido > 0
                        lPagamentoDinheiro := .f.
                     elseif cFormaPagamento $ 'Q' .and. lPagamentoCheque
                        @ 11,01 say 'VALOR RECEBIDO: R$'get nValorRecebido picture '@E 999,999,999,999,999.99' valid nValorRecebido > 0
                        lPagamentoCheque := .f.
                     elseif cFormaPagamento $ 'C' .and. lPagamentoCartao
                        @ 12,01 say 'VALOR RECEBIDO: R$'get nValorRecebido picture '@E 999,999,999,999,999.99' valid nValorRecebido > 0
                        lPagamentoCartao := .f.
                     endif

                     read
                     if lastkey()==27
                        loop
                     endif

                     nTotalOrdemServico -= nValorRecebido
                     if nTotalOrdemServico > 0
                        loop
                     endif
                     if nTotalOrdemServico > 0 .and. !lPagamentoCartao .and. !lPagamentoCheque .and. !lPagamentoDinheiro
                        lPagou := .f.
                        exit
                     endif

                  endif
               enddo
               if !lPagou
                  alert('NAO PAGOU O VALOR INTEGRAL, REINICIA O PAGAMENTO')
                  loop
               endif

               //caso o total seja zero
               if nTotalOrdemServico == 0
                  @ 09,01 say padc('DADOS DA NOTA FISCAL',78)
                  @ 10,01 to 10,78 double
                  @ 11,01 say 'CNPJ DA EMPRESA:' get nCnpj picture '99999999999999' valid !empty(nCnpj)
                  @ 12,01 say 'NUMERO DA NOTA.:' get nNota picture '9999999999' valid !empty(nNota)
                  @ 13,01 say 'DATA DA NOTA...:' get dNota valid !empty(dNota)
                  read
                  if lastkey() == 27
                     loop
                  endif
               endif
            enddo
            @ 14,01 say 'R$ ' +  alltrim(transform(nComissaoTecnico,'@E 999,999,999,999.99'))
            nOrdemServico++
         endif
         inkey(0)
      enddo
   elseif nOpcao == 2
      exit
   else
      nOpcao := 1
   endif
   if nAlerta == 2
      exit
   endif
enddo
