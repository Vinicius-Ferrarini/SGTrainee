//LILIAN AYUMI YAMADA HAKUTAKE
set color to ''
clear
setmode(25,80)
set scoreboard off
set wrap on
set message to 24 center
set date to british
set epoch to 1940

dAtual         := date()
nPedido        := 1
nEstoqueBanana := 140.00
nEstoquePera   := 120.50
nEstoqueBatata := 865.00
nEstoqueAbacate:= 250.00
cCorAlerta     := 'N/W'

do while .t.
   cUsuario := space(30)
   cSenha   := space(30)
   nAlerta  := 0
   nOpcao   := 0

   //login
   clear
   @ 00,00 to 24,79 double
   @ 01,01 say padc('FRUTARIA LILIAN',78)
   @ 02,01 to 02,78 double
   @ 03,01 say padc('TELA DE LOGIN',78)
   @ 04,01 to 04,78 double
   @ 05,01 say 'USUARIO:' get cUsuario picture '@!' valid !empty(cUsuario)
   @ 06,01 say 'SENHA..:' get cSenha   picture '@!' valid !empty(cSenha)
   @ 07,01 to 07,78 double
   read
   if lastkey() == 27
      nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'}, cCorAlerta)
      if nAlerta == 2
         loop
      else
         exit
      endif
   endif

   if alltrim(cUsuario) != 'USUARIO123' .or. alltrim(cSenha) != 'SENHA123'
      alert('USUARIO E SENHA INVALIDOS',, cCorAlerta)
      loop
   else
      do while .t.

         //menu
         @ 03,01 clear to 23,78
         @ 03,01 say padc('MENU PRINCIPAL',78)
         @ 04,01 to 04,78 double
         @ 05,01 prompt padc('EFETUAR PEDIDOS',78) message 'EFETUAR PEDIDOS'
         @ 06,01 prompt padc('SAIR',78)            message 'SAIR'
         @ 07,01 to 07,78 double
         menu to nOpcao

         if nOpcao == 2
            nAlerta := alert('CONFIRMAR SAIDA?',{'SIM', 'NAO'}, cCorAlerta)
            if nAlerta == 2
               loop
            else
               exit
            endif

         elseif nOpcao == 1

            do while .t.
               cCliente                := space(30)
               nLimiteCredito          := 0
               dPedido                 := ctod('')
               nLinha                  := 11
               nTotalCompra            := 0
               nEstoqueBananaCompra    := nEstoqueBanana
               nEstoquePeraCompra      := nEstoquePera
               nEstoqueBatataCompra    := nEstoqueBatata
               nEstoqueAbacateCompra   := nEstoqueAbacate

               //recebe dados do cliente
               @ 03,01 clear to 23,78
               @ 03,01 say padc('DADOS DA VENDA - PEDIDO NUMERO - ' + alltrim(str(nPedido)),78)
               @ 04,01 to 04,78 double
               @ 05,01 say 'NOME DO CLIENTE...:   ' get cCliente         picture '@!'            valid !empty(cCliente)
               @ 06,01 say 'LIMITE DE CREDITO : R$' get nLimiteCredito   picture '@E 999,999.99' valid nLimiteCredito > 0
               @ 07,01 say 'DATA DO PEDIDO....:   ' get dPedido                                  valid !empty(dPedido) .and. dPedido <= dAtual
               @ 08,01 to 08,78 double

               read
               if lastkey() == 27
                  nAlerta := alert('VOLTAR PARA O MENU PRINCIPAL?', {'SIM', 'NAO'}, cCorAlerta)
                  if nAlerta == 2
                     loop
                  else
                     exit
                  endif
               endif

               do while .t.
                  nCodigo        := 0
                  nQuantidade    := 0
                  nDesconto      := 0
                  cProduto       := ''
                  nPrecoUnit     := 0
                  nMaxDesconto   := 0
                  nEstoque       := 0
                  nTotalPedido   := 0

                  @ 09,01 say 'CODIGO'
                  @ 09,09 say 'DESCRICAO PRODUTO'
                  @ 09,28 say 'QUANTIDADE'
                  @ 09,40 say 'PRECO UNIT'
                  @ 09,52 say 'DESCONTO (%)'
                  @ 09,66 say 'VALOR TOTAL'
                  @ 10,01 to 10,78 double

                  //recebe dados do produto
                  @ nLinha,01 get nCodigo     picture '9999' valid nCodigo > 0
                  @ nLinha,28 get nQuantidade picture '999' valid nQuantidade > 0
                  @ nLinha,52 get nDesconto   picture '99.99' valid nDesconto >= 0

                  read
                  if lastkey() == 27
                     nAlerta := alert('DESEJA FINALIZAR A COMPRA?', {'CONFIRMAR COMPRA', 'CANCELAR COMPRA', 'CONTINUAR COMPRA'}, cCorAlerta)
                     if nAlerta == 3
                        loop
                     else
                        exit
                     endif
                  endif

                  //recebe dados de acordo com o codigo
                  if nCodigo == 3588
                     cProduto := 'BANANA PRATA'
                     nPrecoUnit := 2.50
                     nMaxDesconto := 16
                     nEstoque := nEstoqueBananaCompra
                  elseif nCodigo == 4577
                     cProduto := 'PERA ARGENTINA'
                     nPrecoUnit := 7.00
                     nMaxDesconto := 12
                     nEstoque := nEstoquePeraCompra
                  elseif nCodigo == 7066
                     cProduto := 'BATATA PERUANA'
                     nPrecoUnit := 11.00
                     nMaxDesconto := 03
                     nEstoque := nEstoqueBatataCompra
                  elseif nCodigo == 6099
                     cProduto := 'ABACATE NEGRO'
                     nPrecoUnit := 10.99
                     nMaxDesconto := 09
                     nEstoque := nEstoqueAbacateCompra
                  else
                     alert('CODIGO INVALIDO',,cCorAlerta)
                     loop
                  endif

                  // verifica desconto, estoque durante a compra
                  if nDesconto > nMaxDesconto
                     alert('DESCONTO NAO PERMITIDO',,cCorAlerta)
                     loop
                  endif
                  if nQuantidade > nEstoque
                     alert('ESTOQUE INDISPONIVEL',,cCorAlerta)
                     loop
                  endif

                  //verifica limite de credito durante a compra
                  nTotalPedido := nQuantidade * nPrecoUnit * (1-(nDesconto/100))
                  if nTotalPedido > nLimiteCredito
                     alert('LIMITE DE CREDITO INDISPONIVEL',,cCorAlerta)
                     loop
                  endif

                  //atualiza estoque previo durante a compra
                  if nCodigo == 3588
                     nEstoqueBananaCompra -= nQuantidade
                  elseif nCodigo == 4577
                     nEstoquePeraCompra -= nQuantidade
                  elseif nCodigo == 7066
                     nEstoqueBatataCompra -= nQuantidade
                  elseif nCodigo == 6099
                     nEstoqueAbacateCompra -= nQuantidade
                  endif

                  //atualiza valor total e limite de credito durante a compra
                  nTotalCompra += nTotalPedido
                  nLimiteCredito -= nTotalPedido

                  //imprime dados da compra
                  @ nLinha,09 say alltrim(cProduto)
                  @ nLinha,40 say 'R$ ' + alltrim(transform(nPrecoUnit, '@E 99.99'))
                  @ nLinha,66 say 'R$ ' + alltrim(transform(nTotalPedido, '@E 999,999.99'))
                  @ 20,01 to 20,78 double
                  @ 21,01 say 'VALOR TOTAL DA COMPRA: R$ ' + alltrim(transform(nTotalCompra, '@E 999,999.99'))
                  @ 22,01 say 'LIMITE DE CREDITO: R$ '     + alltrim(transform(nLimiteCredito, '@E 999,999.99'))

                  //verificacao das linhas
                  nLinha++
                  if nLinha == 20
                     nLinha := 11
                     inkey(0)
                     @ 11,01 clear to 19,78
                     loop
                  endif
               enddo

               //se a compra for confirmada, atualiza estoque geral e incrementa pedido
               if nAlerta == 1 .and. nTotalCompra > 0
                  nEstoqueBanana    := nEstoqueBananaCompra
                  nEstoquePera      := nEstoquePeraCompra
                  nEstoqueBatata    := nEstoqueBatataCompra
                  nEstoqueAbacate   := nEstoqueAbacateCompra
                  alert('COMPRA FINALIZADA EM R$ ' + alltrim(transform(nTotalCompra, '@E 999,999.99')),,cCorAlerta)
                  nPedido++
               else
                  loop
               endif
            enddo
         else
            //prompt marcando opcao 2
            nOpcao := 2
         endif
      enddo

      //sair direto, sem menu principal
      if nAlerta == 1
         exit
      endif
   endif
enddo
