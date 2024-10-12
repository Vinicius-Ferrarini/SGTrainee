//vinicius reginaldo ferrarini
//Prova 02

set date to british
set epoch to 1940
set scoreboard off


//set color to ("N/W")
//@ 03,09 clear to 21,70

lFinaliza := .f.
nLinha    := 7
nPedido   := 1
lCupom    := .f.



cProduto1 := 'Banana Prata'
cProduto2 := 'Pera Argentina'
cProduto3 := 'Batata Peruana'

nCod1   := 1500
nCod2   := 2501
nCod3   := 3001

nDesconto1 := 20
nDesconto2 := 15
nDesconto3 := 10

nEstoque1 := 155
nEstoque2 := 117.5
nEstoque3 := 859

nPreco1 := 1.50
nPreco2 := 9.00
nPreco3 := 5.00

do while !lFinaliza
   //login
   cLogin := Space(8)
   cSenha := Space(8)
   lLogin    := .f.

   clear
   @ 00,40 say "Frutaria SG"
   @ 01,00 to 04,79 double
   @ 02,30 say 'Login:'
   @ 03,30 say 'Senha:'

   @ 02,36 get cLogin valid AllTrim(cLogin) $ 'ADMIN' picture '@!'
   @ 03,36 get cSenha valid AllTrim(cSenha) $ 'teste123'
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         lFinaliza := .t.
         exit
      else
         loop
      endif
   endif


//--------------------------------------------------------

   do while !lLogin

      nLinha := 6
      nOpcao := 0
      //menu
      @ 05,40 say '[ ]-  [1]Efetuar vendas  [2] Sair'
      @ 05,41 get nOpcao valid nOpcao = 1 .or. nOpcao = 2 picture "9"
      read
      if LastKey() == 27
         nOpcao := alert('Deslogar do programa?' , { 'Sim' , 'Nao' })
         if nOpcao = 1   //volta login
            lLogin := .t.
            exit
         else
            loop
         endif
      endif

      if nOpcao = 2 //Volta login
         lLogin :=.t.
         exit
      endif

      cNome    := Space(30)        //coleta dados
      nLimite  := 0
      dVenda   := CToD(' ')
      lEntrega := .f.
      cEntrega := ' '
       nTotal  := 0

      @ nLinha  ,10 say 'Nome:'
      @ nLinha++,50 say "Pedido: " + alltrim(str(nPedido))
      @ nLinha++,10 say 'Limite:'
      @ nLinha++,10 say 'Data Venda:'
      @ nLinha++,10 say 'Entrega: [ ]  [S]im [N]Æo'

      nLinha -= 4
      @ nLinha++,22 get cNome    valid !Empty(cNome)
      @ nLinha++,22 get nLimite  valid nLimite > 0     picture "@E 99,999.99"
      @ nLinha++,22 get dVenda   valid !Empty(dVenda)
      @ nLinha++,20 get cEntrega valid cEntrega $ 'SN' picture '@!'
      read
      if LastKey() == 27
         loop
      endif

      if cEntrega = 'S'  //entrega

         cEndereco   := Space(30)
         cBairro     := Space(30)
         cReferencia := Space(30)
         nTelefone   := 0

         @ nLinha++,10 say 'Endereco..:'
         @ nLinha++,10 say 'Bairro....:'
         @ nLinha++,10 say 'Referencia:'
         @ nLinha++,10 say 'Telefone..:'

         nLinha -= 4
         @ nLinha++,22 get cEndereco   valid !Empty(cEndereco)
         @ nLinha++,22 get cBairro     valid !Empty(cBairro)
         @ nLinha++,22 get cReferencia valid !Empty(cReferencia)
         @ nLinha++,23 get nTelefone   valid nTelefone > 11111111111 picture "99999999999"
         read
         if LastKey() == 27
            loop
         endif
         nTotal += 5
      endif

      //Venda
      clear
      nLimiteTemp := nLimite
      @ 01,00 to 01,79
      @ 02,01 say " Codigo    Descri‡Æo     Estoque   Pre‡o Unit   QTD   % Desconto.     Valor   "
      @ 21,60 say 'Limite ' + transform(nLimiteTemp,"@E 99,999.99")
      @ 22,60 say 'Total  ' + transform(nTotal,     "@E 99,999.99")
      nLinha := 4
      lVendas := .t.

//----------------------------
      do while lVendas//vendas
         nCodDig        := 0
         nQuantidadeDig := 0
         nDescontoDig   := 0
         nPrecoDig      := 0

         @ nLinha,04 get nCodDig valid nCodDig = nCod1 .or.  nCodDig = nCod2 .or. nCodDig = nCod3 picture "9999"

         read
         if LastKey() == 27
            nOpcao := alert('Oque deseja fazer?', { 'Fechar compra' , ' Abandonar comprar ' , 'Continuar Digitando'})
            if nOpcao = 1     //fecha compra
               lCupom := .t.
               exit
            elseif nOpcao = 2 //volta inicio
               exit
            else              //Continua digitando
               loop
            endif
         endif


         if nCodDig = nCod1
            cDescricao       := cProduto1
            nEstoquePro      := nEstoque1
            nDescontoProduto := nDesconto1
            nPrecoDig        := nPreco1

         elseif  nCodDig = nCod2
            cDescricao       := cProduto2
            nEstoquePro      := nEstoque2
            nDescontoProduto := nDesconto2
            nPrecoDig        := nPreco2

         else
            cDescricao       := cProduto3
            nEstoquePro      := nEstoque3
            nDescontoProduto := nDesconto3
            nPrecoDig        := nPreco3
         endif

//codigo   Descri‡Æo    Estoque   Pre‡o Unit   QTD    %Desconto      Valor   "
         @ nLinha,10 say cDescricao
         @ nLinha,27 say nEstoquePro   picture '999'
         @ nLinha,38 say nPrecoDig     picture '@E 9.99'



         @ nLinha,47 get nQuantidadeDig valid nQuantidadeDig <= nEstoquePro      .and. nQuantidadeDig >= 0 picture '999.99'
         @ nLinha,58 get nDescontoDig   valid nDescontoDig   <= nDescontoProduto .and. nDescontoDig   >= 0 picture '99'
         read
         if LastKey() == 27
            nOpcao := alert('Oque deseja fazer?', { 'Fechar compra' , ' Abandonar comprar ' , 'Continuar Digitando'})
            if nOpcao = 1     //fecha compra
               lCupom := .t.
               exit
            elseif nOpcao = 2 //volta inicio
               exit
            else              //Continua digitando
               loop
            endif
         endif

         nValorProduto := nQuantidadeDig * nPrecoDig * 0.01 *(100 - nDescontoDig)

         if nValorProduto > nLimite   //gastou mais que limite
            alert('Valor do Produto maior que limite!')
            loop
         endif


//Compra aprovada

         if nCodDig = nCod1       //baixa estoque
            nEstoque1 -= nQuantidadeDig
         elseif nCodDig = nCod2
            nEstoque2 -= nQuantidadeDig
         else
            nEstoque3 -= nQuantidadeDig
         endif

         nTotal      += nValorProduto
         nLimiteTemp -= nValorProduto

         @ nLinha,65 say nValorProduto
         @ 21,68 say Transform(nLimiteTemp,"@E 99,999.99")
         @ 22,68 say Transform(nTotal,     "@E 99,999.99")

         nLinha++
         if nLinha > 21
            @ 04,00 clear to 21,79
            nLinha := 4
         endif
      enddo
      if lCupom
         clear
         @ 05,05 say 'O Valor da Compra foi R$ ' +str(nTotal)
         @ 06,05 say 'O Valor do Limite era R$ ' +str(nLimite)
         @ 07,05 say 'O Limite restante foi R$ ' +str(nLimiteTemp)
         nPedido++
         lCupom := .f.
      else //cancela cupom
      endif
   enddo

enddo

