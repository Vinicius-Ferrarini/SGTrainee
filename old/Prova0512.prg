//Luis Carlos Bussolin Filho
set message to 23 center
set date to british
set epoch to 1930
setmode (25,80)
clear
nMesa                          := 0
cCorMesa1                      := '/G'
cCorMesa2                      := '/G'
cCorMesa3                      := '/G'
nTaxServico                    := 0.1
nOpcaoPagamento                := 0
nOpcaoMesaOcupada              := 0

nValorTotal                    := 0

nTotalMesa1                    := 0
nTotalMesa2                    := 0
nTotalMesa3                    := 0

lMesaOcupada1                  := .f.
lMesaOcupada2                  := .f.
lMesaOcupada3                  := .f.

nQtdeAtendimento1              := 0
nQtdeAtendimento2              := 0
nQtdeAtendimento3              := 0

nQtdeAtendimentoCancelado1     := 0
nQtdeAtendimentoCancelado2     := 0
nQtdeAtendimentoCancelado3     := 0

nTotalTaxServico1              := 0
nTotalTaxServico2              := 0
nTotalTaxServico3              := 0

nRelatorioValorTotal1          := 0
nRelatorioValorTotal2          := 0
nRelatorioValorTotal3          := 0

nRelatorioValorTotalCancelado1 := 0
nRelatorioValorTotalCancelado2 := 0
nRelatorioValorTotalCancelado3 := 0



@ 00,00 to 24,79 double

do while .t.

   lGerente   := .f.

   lAtendente := .f.

   @ 15,35 prompt 'Login'    message 'Realiza o login para executar pedidos'
   menu to nOpcaoLogin
   if lastkey () == 27
      nOpcao := ALERT('Deseja mesmo sair?',{'SAIR','Continuar'})
      if nOpcao = 1 .or. nOpcao = 0
         exit
      else
         loop
      endif
   endif

   if nOpcaoLogin = 1
      clear
      cTentativaLogin := Space(20)
      cTentativaSenha := Space(18)

      cLoginGerente   := "Sup123"
      cSenhaGerente   := "Sup123"

      cLoginAtendente := "Gar123"
      cSenhaAtendente := "Gar123"


      @ 06,30 say "Login: "
      @ 07,30 say "Senha: "

      @ 06,36 get cTentativaLogin valid Len(cTentativaLogin) > 0
      @ 07,36 get cTentativaSenha valid Len(cTentativaSenha) > 0
      read

      if AllTrim(cTentativaLogin) == cLoginGerente .and. Alltrim(cTentativaSenha) == cSenhaGerente
         ALERT('Logado como Gerente!',{'OK'})
         lGerente := .t.
      elseif AllTrim(cTentativaLogin) == cLoginAtendente .and. Alltrim(cTentativaSenha) == cSenhaAtendente
         ALERT('Logado como Atendente!',{'OK'})
         lAtendente := .t.
      else
         ALERT('Senha ou Login inv lidos',{'Retornar'})
         clear
         loop
      endif
   endif
      clear

   do while .t.

      @ 04,01 to 23,78 double
      @ 01,25 say "RESTAURANTE SG"
      @ 02,25 say "ATENDIMENTO"
      @ 03,04 say "Mesa: "
      @ 03,13 say "01" color cCorMesa1
      @ 03,16 say "02" color cCorMesa2
      @ 03,19 say "03" color cCorMesa3

      @ 03,10 get nMesa picture '9' valid nMesa > 0 .and. nMesa <= 3
      read
      if lastkey() == 27
         nOpcaoRelatorio := ALERT("Deseja sair do programa?",{'Sair','Continuar'})
         if nOpcaoRelatorio == 1
            exit
         else
            loop
         endif
      endif

      //Mesa Ocupada/Faturar Atendimento
      if nMesa = 1 .and. lMesaOcupada1 = .t.
         nOpcaoMesaOcupada := ALERT('Mesa Ocupada',{'Digitar Outra mesa','Faturar o atendimento','Cancelar Atendimento'})

      elseif nMesa = 2 .and. lMesaOcupada2 = .t.
         nOpcaoMesaOcupada := ALERT('Mesa Ocupada',{'Digitar Outra mesa','Faturar o atendimento','Cancelar Atendimento'})

      elseif nMesa = 3 .and. lMesaOcupada3 = .t.
         nOpcaoMesaOcupada := ALERT('Mesa Ocupada',{'Digitar Outra mesa','Faturar o atendimento','Cancelar Atendimento'})
      endif

      if nOpcaoMesaOcupada == 1
         loop
      elseif nOpcaoMesaOcupada == 2
         //pagamento mesa
         if lAtendente = .t.
            ALERT('Atendente nao tem permissao para faturar atendimentos',{'OK'})
            nOpcaoMesaOcupada := 0
            loop
         endif
         do while .t.

            if nMesa = 1
               nValorPagar := nTotalMesa1
            elseif nMesa = 2
               nValorPagar := nTotalMesa2
            elseif nMesa = 3
               nValorPagar := nTotalMesa3
            endif

            nValorRecebido  := 0
            cTipoPagamento  := Space(1)

            @ 05,25 say "PAGAMENTO"
            @ 06,03 say "[D]inheiro | [C]artao | Che[Q]ue: "
            @ 07,03 say "Total a pagar.: R$"
            @ 08,03 say "Valor Recebido: R$"

            nOpcaoTaxServico := ALERT('Aceita Taxa de servico?',{'Sim','Nao'})
            if nOpcaoTaxServico == 1

               nValorPagar := nValorPagar + (nValorPagar * nTaxServico)

               if nMesa = 1
                 nTotalTaxServico1 += + (nTotalMesa1 * nTaxServico)
               elseif nMesa = 2
                 nTotalTaxServico2 += + (nTotalMesa2 * nTaxServico)
               elseif nMesa = 3
                 nTotalTaxServico3 += + (nTotalMesa3 * nTaxServico)
               endif

            endif

            @ 07,21 say Transform(nValorPagar,'@E 99999.99')
            @ 06,36 get cTipoPagamento picture '@!'           valid cTipoPagamento $ "DCQ"
            @ 08,21 get nValorRecebido picture '@E 999999.99' valid nValorRecebido > 0
            read

            if lastkey() == 27
               nOpcaoPagamento := ALERT('Deseja?',{'Cancelar pagamento','Recome‡ar pagamento'})
               if nOpcaoPagamento == 1
                  @ 05,02 clear to 23,77
                  exit
               else

                  if nOpcaoTaxServico = 1
                     nValorPagar += + (nValorPagar * nTaxServico)
                  endif
                  clear
                  loop

               endif
            endif

            nTrocoPagamento := nValorRecebido - nValorPagar

            if nTrocoPagamento < 0
               ALERT('Valor insuficiente para pagar sua conta. Porfavor, tente novamente!',{'OK'})
               if nOpcaoTaxServico = 1
                  nValorPagar += - (nValorPagar * nTaxServico)
                  clear
               endif
               loop
            endif

            @ 09,03 say "Valor Troco: R$" + Transform(nTrocoPagamento,'@E 999999.99')

            @ 11,03 say "Pagamento realizado com sucesso!"
            @ 12,03 say "Obrigado e volte sempre!"
            @ 13,03 say "Pressione alguma tecla para continuar."
            INKEY(0)
            if nMesa = 1
               cCorMesa1     := '/G'
               lMesaOcupada1 := .f.
               nRelatorioValorTotal1 += + nValorPagar
               nQtdeAtendimento1++

            elseif nMesa = 2
               cCorMesa2     := '/G'
               lMesaOcupada2 := .f.
               nRelatorioValorTotal2 += + nValorPagar
               nQtdeAtendimento2++
            elseif nMesa = 3
               cCorMesa3     := '/G'
               lMesaOcupada3 := .f.
               nRelatorioValorTotal3 += + nValorPagar
               nQtdeAtendimento3++
            endif
            nOpcaoMesaOcupada := 0
            clear
            exit
         enddo
         loop

      elseif nOpcaoMesaOcupada == 3
         nOpcaoMesaOcupada := 0
         if lAtendente = .t.
            ALERT('Atendente nao tem permissao para Cancelar pedidos',{'OK'})
            loop
         endif

         if nMesa = 1
            nTotalMesa1   := 0
            cCorMesa1     := '/G'
            lMesaOcupada1 := .f.
            nQtdeAtendimentoCancelado1++
            nRelatorioValorTotalCancelado1 += + nTotalMesa1
            loop

         elseif nMesa = 2
            nTotalMesa2   := 0
            cCorMesa2     := '/G'
            lMesaOcupada2 := .f.
            nQtdeAtendimentoCancelado2++
            nRelatorioValorTotalCancelado2 += + nTotalMesa2
            loop

         elseif nMesa = 3
            nTotalMesa3   := 0
            cCorMesa3     := '/G'
            lMesaOcupada3 := .f.
            nQtdeAtendimentoCancelado3++
            nRelatorioValorTotalCancelado3 += + nTotalMesa3
            loop

         endif
      endif

      if nOpcaoPagamento == 1
         loop
      endif

      nValorTotal         := 0
      nLinha              := 7

      do while .t.

         nColuna := 4
         cDescricaoProduto   := Space(30)
         nQuantidadeProduto  := 0
         nPrecoProduto       := 0
         nSubTotal           := 0

         @ 05,25 say "PEDIDO"
         @ 06,04 say "Produto"
         @ 06,33 say "|  Quantidade|"
         @ 06,49 say "Preco Unit.|"
         @ 06,61 say "Total"

         @ nLinha,nColuna get cDescricaoProduto  picture '@!'         valid !Empty(cDescricaoProduto)
         nColuna += 32
         @ nLinha,nColuna get nQuantidadeProduto picture '99'         valid nQuantidadeProduto > 0
         nColuna += 12
         @ nLinha,nColuna get nPrecoProduto      picture '@E 9999.99' valid nPrecoProduto > 0
         read

         if lastkey() == 27
            nOpcaoPedido := ALERT('Deseja?',{'Enviar pedido para produ‡Æo','Continuar digitando','Abandonar digitacao'})
            if nOpcaoPedido == 1

               if nMesa = 1
                  cCorMesa1     := '/R'
                  lMesaOcupada1 := .t.
                  nTotalMesa1   := nValorTotal
               elseif nMesa = 2
                  cCorMesa2     := '/R'
                  lMesaOcupada2 := .t.
                  nTotalMesa2   := nValorTotal
               elseif nMesa = 3
                  cCorMesa3     := '/R'
                  lMesaOcupada3 := .t.
                  nTotalMesa3   := nValorTotal
               endif
               clear
               exit

            elseif nOpcaoPedido == 2
               loop
            else
               nValorTotal := 0
               exit
            endif
         endif
         nSubTotal   := nQuantidadeProduto * nPrecoProduto
         nValorTotal += nSubTotal
         @nLinha +1,nColuna clear to nLinha+2,nColuna + 20
         @nLinha   ,nColuna +12  say Transform(nSubTotal,'@E 9999.99')     color '/W'
         @nLinha +2,nColuna +12  say Transform(nValorTotal,'@E 999999.99') color '/W'
         if nLinha > 20
            nLinha := 6
            @ 06,02 clear to 24,79
         endif
         nLinha++
      enddo
   enddo
   clear
   if lGerente = .t.
      @ 00,00 to 24,79

      nTicketMedio1 := nRelatorioValorTotal1 / nQtdeAtendimento1
      nTicketMedio2 := nRelatorioValorTotal2 / nQtdeAtendimento2
      nTicketMedio3 := nRelatorioValorTotal3 / nQtdeAtendimento3

      @ 01,30 say "Mesa 1"
      @ 01,40 say "Mesa 2"
      @ 01,50 say "Mesa 3"
      @ 01,60 say "Total Geral"

      @ 02,01 say "Atendimento..........:"
      @ 03,01 say "Atendimento cancelado:"
      @ 04,01 say "Valor Total..........:"
      @ 05,01 say "Valor Total cancelado:"
      @ 06,01 say "Ticket medio.........:"
      @ 07,01 say "Taxa de servi‡o......:"

      @ 02,30 say Transform(nQtdeAtendimento1,'9999')
      @ 03,30 say Transform(nQtdeAtendimentoCancelado1,'9999')
      @ 04,30 say Transform(nRelatorioValorTotal1,'@E 9999.99')
      @ 05,30 say Transform(nRelatorioValorTotalCancelado1,'@E 9999.99')
      @ 06,30 say Transform(nTicketMedio1,'@E 9999.99')
      @ 07,30 say Transform(nTotalTaxServico1,'@E 9999.99')

      @ 02,40 say Transform(nQtdeAtendimento2,'9999')
      @ 03,40 say Transform(nQtdeAtendimentoCancelado2,'9999')
      @ 04,40 say Transform(nRelatorioValorTotal2,'@E 9999.99')
      @ 05,40 say Transform(nRelatorioValorTotalCancelado2,'@E 9999.99')
      @ 06,40 say Transform(nTicketMedio2,'@E 9999.99')
      @ 07,40 say Transform(nTotalTaxServico2,'@E 999.99')


      @ 02,50 say Transform(nQtdeAtendimento3,'9999')
      @ 03,50 say Transform(nQtdeAtendimentoCancelado3,'9999')
      @ 04,50 say Transform(nRelatorioValorTotal3,'@E 9999.99')
      @ 05,50 say Transform(nRelatorioValorTotalCancelado3,'@E 9999.99')
      @ 06,50 say Transform(nTicketMedio3,'@E 9999.99')
      @ 07,50 say Transform(nTotalTaxServico3,'@E 999.99')



      nQtdeAtendimentoTotal          := nQtdeAtendimento1 + nQtdeAtendimento2 + nQtdeAtendimento3
      nQtdeAtendimentoCanceladoTotal := nQtdeAtendimentoCancelado1 + nQtdeAtendimentoCancelado2 + nQtdeAtendimentoCancelado3
      nRelatorioValorTotal           := nRelatorioValorTotal1 + nRelatorioValorTotal2 + nRelatorioValorTotal3
      nRelatorioValorTotalCancelado  := nRelatorioValorTotalCancelado1 + nRelatorioValorTotalCancelado2 + nRelatorioValorTotalCancelado3
      nTicketMedioTotal              := nTicketMedio1 + nTicketMedio2 + nTicketMedio3
      nTotalTaxServico               := nTotalTaxServico1 + nTotalTaxServico2 + nTotalTaxServico3


      @ 02,60 say Transform(nQtdeAtendimentoTotal,'9999')
      @ 03,60 say Transform(nQtdeAtendimentoCanceladoTotal,'9999')
      @ 04,60 say Transform(nRelatorioValorTotal,'@E 9999.99')
      @ 05,60 say Transform(nRelatorioValorTotalCancelado,'@E 9999.99')
      @ 06,60 say Transform(nTicketMedioTotal,'@E 9999.99')
      @ 07,60 say Transform(nTotalTaxServico,'@E 999.99')

      @ 09,10 say "Boa noite!"
      @ 10,10 say "Pressione qualquer teclar para finalizar"
      INKEY(0)
      clear
   endif
enddo
