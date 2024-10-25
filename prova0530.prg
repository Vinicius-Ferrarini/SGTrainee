//LILIAN AYUMI YAMADA HAKUTAKE
set color to ''
clear
setmode(25,80)
set scoreboard off
set message to 24 center
set wrap on

nAtendimentosMesa1         := 0
nAtendimentosMesa2         := 0
nAtendimentoCanceladoMesa1 := 0
nAtendimentoCanceladoMesa2 := 0
nValorTotalMesa1           := 0
nValorTotalMesa2           := 0
nValorTotalCanceladoMesa1  := 0
nValorTotalCanceladoMesa2  := 0
nTicketMesa1               := 0
nTicketMesa2               := 0
nRecebeAtendente1          := 0
nRecebeAtendente2          := 0

do while .t.
   lMesa1Livre := .t.
   lMesa2Livre := .t.
   nMesa1Total := 0
   nMesa2Total := 0
   cCorAlerta  := 'N/W'
   cCor1       := ''
   cCor2       := ''

   clear
   @ 00,00 to 24,79 double
   @ 01,01 say padc('RESTAURANTE SG', 78)
   @ 02,01 to 02,78 double

   @ 03,01 say padc('MENU PRINCIPAL', 78)
   @ 04,01 to 04,78 double
   @ 05,01 prompt padc('MESAS', 78)     message 'MODULO DA MESA'
   @ 06,01 prompt padc('RELATORIO', 78) message 'RELATORIO'
   @ 07,01 prompt padc('SAIR', 78)      message 'SAIR DO PROGRAMA'
   @ 08,01 to 08,78 double
   menu to nOpcao

   if nOpcao == 1
      do while .t.
         nMesa := 0
         nAtendente := 0
         nAlerta := 0
         lMesaLivre := .t.

         @ 03,01 clear to 23,78

         if lMesa1Livre
            cCor1 := 'N/G'
         else
            cCor1 := 'N/R'
         endif
         if lMesa2Livre
            cCor2 := 'N/G'
         else
            cCor2 := 'N/R'
         endif

         @ 05,15 say ' 01 ' color (cCor1)
         @ 05,20 say ' 02 ' color (cCor2)


         @ 03,01 say padc('ATENDIMENTO', 78)
         @ 04,01 to 04,78 double
         @ 05,01 say 'MESA.....:' get nMesa      picture '9' valid nMesa == 1      .or. nMesa == 2
         @ 06,01 say 'ATENDENTE:' get nAtendente picture '9' valid nAtendente == 1 .or. nAtendente == 2
         @ 07,01 to 07,78 double

         read
         if lastkey() == 27
            nAlerta := alert('DESEJA VOLTAR PARA O MENU PRINCIPAL?', {'SIM','NAO'}, cCorAlerta)
            if nAlerta == 2
               loop
            else
               exit
            endif
         endif

         if nMesa == 1
            lMesaLivre := lMesa1Livre
         elseif nMesa == 2
            lMesaLivre := lMesa2Livre
         endif

         if lMesaLivre
            nLinha := 11
            nTotal := 0

            @ 08,01 clear to 23,78
            @ 08,01 say padc('PEDIDO', 78)
            @ 09,01 to 09,78 double
            @ 10,01 say padc('PRODUTO', 30)
            @ 10,31 say padc('QUANTIDADE', 15)
            @ 10,46 say padc('PRECO UNITARIO', 15)
            @ 10,61 say padc('VALOR', 15)

            do while .t.
               nValor := 0
               cProduto := space(30)
               nPrecoUnitario := 0
               nQuantidade := 0
               nOpcao := 0

               @ nLinha,01 get cProduto         picture '@!'            valid !empty(cProduto)
               @ nLinha,40 get nQuantidade      picture '99'            valid nQuantidade > 0
               @ nLinha,46 get nPrecoUnitario   picture '@E 999,999.99' valid nPrecoUnitario > 0

               read
               if lastkey() == 27
                  nAlerta := alert('DESEJA?', {'ENVIAR O PEDIDO PARA A PRODUCAO', 'CONTINUAR DIGITANDO','ABANDONAR DIGITACAO'}, cCorAlerta)
                  if nAlerta == 1 .and. nTotal > 0
                     if nMesa == 1
                        nMesa1Total := nTotal
                        lMesa1Livre := .f.
                     elseif nMesa == 2
                        nMesa2Total := nTotal
                        lMesa2Livre := .f.
                     endif
                     alert('PEDIDO ENVIADO PARA A PRODUCAO',,cCorAlerta)
                     exit
                  elseif nAlerta == 1 .and. nTotal == 0
                     alert('PRECISA TER PELO MENOS 1 PRODUTO VENDIDO')
                     loop
                  elseif nAlerta == 2
                     loop
                  elseif nAlerta == 3
                     exit
                  else
                     loop
                  endif
               endif

               nValor := nQuantidade * nPrecoUnitario
               nTotal += nValor
               @ nLinha,65 say 'R$ '+ alltrim(transform(nValor, '@E 99,999,999.99'))
               @ 21,01 say 'VALOR TOTAL DA COMPRA: R$ ' + alltrim(transform(nTotal,'@E 99,999,999.99'))
               @ 20,01 to 20,78 double

               if nLinha == 19
                  inkey(0)
                  @ 11,01 clear to 19,78
                  nLinha := 11
               endif
               nLinha++
            enddo
         endif

         if !lMesaLivre
            nAlerta := alert('DESEJA?', {'DIGITAR OUTRA MESA', 'FATURAR ATENDIMENTO','CANCELAR ATENDIMENTO'}, cCorAlerta)
            if nAlerta == 1
               loop
            elseif nAlerta == 2

               do while .t.
                  cTaxaServico := space(1)
                  cFormaPagamento := space(1)
                  nTotalPagamento := 0
                  nTaxaServico := 0

                  @ 08,01 clear to 23,78
                  @ 08,01 say padc('PAGAMENTO', 78)
                  @ 09,01 to 09,78 double
                  @ 10,01 say 'ACEITA TAXA DE SERVICO?'                              get cTaxaServico    picture '@!' valid cTaxaServico $ 'SN'
                  @ 11,01 say 'FORMA DE PAGAMENTO [D]INHEIRO / [C]ARTAO / CHE[Q]UE:' get cFormaPagamento picture '@!' valid cFormaPagamento $ 'DCQ'

                  read
                  if lastkey() == 27
                     nAlerta := alert('DESEJA?', {'CANCELAR PAGAMENTO', 'RECOMECAR PAGAMENTO'}, cCorAlerta)
                     if nAlerta == 1
                        exit
                     elseif nAlerta == 2
                        loop
                     endif
                  endif

                  if nMesa == 1
                     nTotalPagamento := nMesa1Total
                  elseif nMesa == 2
                     nTotalPagamento := nMesa2Total
                  endif

                  if cTaxaServico $ 'S'
                     nTaxaServico = nTotalPagamento * 0.1
                     if nAtendente == 1
                        nRecebeAtendente1 += nTaxaServico
                     elseif nAtendente == 2
                        nRecebeAtendente2 += nTaxaServico
                     endif
                  endif

                  nTotalPagamento := nTaxaServico + nTotalPagamento
                  @ 12,01 to 12,78 double
                  @ 13,01 say 'TOTAL A PAGAR: R$ ' + alltrim(transform(nTotalPagamento,'@E 99,999,999.99'))
                  inkey(0)

                  if cFormaPagamento $ 'D'
                     nDinheiroRecebido := 0
                     nTroco := 0

                     @ 14,01 say 'VALOR RECEBIDO: R$ ' get nDinheiroRecebido picture '@E 99,999,999.99' valid nDinheiroRecebido >= nTotalPagamento

                     read
                     if lastkey() == 27
                        alert('ANTES DE SAIR, EFETUE O PAGAMENTO')
                        loop
                     endif
                     if nDinheiroRecebido > nTotalPagamento
                        nTroco := nDinheiroRecebido - nTotalPagamento
                        @ 15,01 say 'O SEU TROCO EH: R$ ' + alltrim(transform(nTroco,'@E 99,999,999.99'))
                        inkey(0)
                     endif

                  endif
                  if nMesa == 1
                     nMesa1Total := 0
                     lMesa1Livre := .t.
                     nAtendimentosMesa1++
                     nValorTotalMesa1 += nTotalPagamento
                  elseif nMesa == 2
                     nMesa2Total := 0
                     lMesa2Livre := .t.
                     nAtendimentosMesa2++
                     nValorTotalMesa2 += nTotalPagamento
                  endif
                  alert('PAGAMENTO EFETUADO!', , cCorAlerta)
                  exit
               enddo
            elseif nAlerta == 3
               if nMesa == 1
                  lMesa1Livre := .t.
                  nValorTotalCanceladoMesa1 += nMesa1Total
                  nMesa1Total := 0
                  nAtendimentoCanceladoMesa1++
               elseif nMesa == 2
                  lMesa2Livre := .t.
                  nValorTotalCanceladoMesa2 += nMesa2Total
                  nMesa2Total := 0
                  nAtendimentoCanceladoMesa2++
               endif
               alert('ATENDIMENTO CANCELADO COM SUCESSO', ,cCorAlerta)
               loop
            endif
         endif
      enddo
   elseif nOpcao == 2
      @ 03,01 clear to 23,78

      do while .t.
         nTicketMesa1 := nValorTotalMesa1 / nAtendimentosMesa1
         nTicketMesa2 := nValorTotalMesa2 / nAtendimentosMesa2

         @ 03,01 say padc('RELATORIO', 78)
         @ 04,01 to 04,78 double
         @ 05,01 say padc('RELATORIO DE MESAS', 29)
         @ 05,30 say padc('MESA 1',17)
         @ 05,47 say padc('MESA 2',17)
         @ 06,01 to 06,78 double
         @ 12,01 to 12,78 double
         @ 13,01 say padc('RELATORIO DE ATENDENTES',29)
         @ 13,30 say padc('ATENDENTE 1',17)
         @ 13,47 say padc('ATENDENTE 2',17)
         @ 14,01 to 14,78 double
         @ 07,01 say 'QUANTIDADE ATENDIMENTOS.: '
         @ 08,01 say 'QUANTIDADE CANCELADOS...: '
         @ 09,01 say 'VALOR TOTAL ATENDIMENTOS: '
         @ 10,01 say 'VALOR TOTAL CANCELADOS..: '
         @ 11,01 say 'TICKET MEDIO............: '
         @ 15,01 say 'TOTAL A RECEBER ........: '
         @ 07,30 say         alltrim(str(nAtendimentosMesa1))
         @ 07,47 say         alltrim(str(nAtendimentosMesa2))
         @ 08,30 say         alltrim(str(nAtendimentoCanceladoMesa1))
         @ 08,47 say         alltrim(str(nAtendimentoCanceladoMesa2))
         @ 09,30 say 'R$ ' + alltrim(transform(nValorTotalMesa1, '@E 999,999,999,999.99'))
         @ 09,47 say 'R$ ' + alltrim(transform(nValorTotalMesa2, '@E 999,999,999,999.99'))
         @ 10,30 say 'R$ ' + alltrim(transform(nValorTotalCanceladoMesa1, '@E 999,999,999,999.99'))
         @ 10,47 say 'R$ ' + alltrim(transform(nValorTotalCanceladoMesa2, '@E 999,999,999,999.99'))
         @ 11,30 say 'R$ ' + alltrim(transform(nTicketMesa1, '@E 999,999,999,999.99'))
         @ 11,47 say 'R$ ' + alltrim(transform(nTicketMesa2, '@E 999,999,999,999.99'))
         @ 15,30 say 'R$ ' + alltrim(transform(nRecebeAtendente1, '@E 999,999,999,999.99'))
         @ 15,47 say 'R$ ' + alltrim(transform(nRecebeAtendente2, '@E 999,999,999,999.99'))
         inkey(0)
         exit
      enddo
   elseif nOpcao == 3
      nAlerta := alert('DESEJA SAIR DO PROGRAMA?', {'SIM', 'NAO'}, cCorAlerta)
      if nAlerta == 2
         loop
      else
         exit
      endif
   else
      nOpcao := 3
   endif
enddo
