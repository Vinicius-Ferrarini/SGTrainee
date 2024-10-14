//vinicius reginaldo ferrarini
//Prova 03

set date to british
set epoch to 1940
set scoreboard off


lSistema := .t.
nLinha    := 1
lCupom    := .f.




do while lSistema
   
   lLogin    := .f.
   
   clear
   @ 00,40 say "Frutaria SG"
   @ 01,00 to 04,79 double
   @ 02,30 say 'Login:'
   @ 03,30 say 'Senha:'

   @ 02,36 get var1 valid AllTrim(var1) $ 'ADMIN' picture '@!'
   @ 03,36 get var2 valid AllTrim(var2) $ 'teste123'
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif


//--------------------------------------------------------

   do while !lLogin  //ja logado

      nLinha := 6
      nOpcao := 0
      //menu
      @ 05,40 say 
      @ 05,41 get 
      read
      if LastKey() == 27
         nOpcao := alert('Deslogar do programa?' , { 'Sim' , 'Nao' })
         if nOpcao = 1   //volta login
            lLogin := .t.
            exit
         else            //nao desloga
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
      @ nLinha++,10 say 'Entrega: [ ]  [S]im [N]�o'

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
      @ 02,01 say " Codigo    Descri��o     Estoque   Pre�o Unit   QTD   % Desconto.     Valor   "
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

//codigo   Descri��o    Estoque   Pre�o Unit   QTD    %Desconto      Valor   "
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

