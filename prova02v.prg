//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

dHoje     := date()
lSair     := .f.
nContador := 0

//Banana
nCodigoBanana          := 1500
nMaximoDescontoBanana  := 20
cDescricaoBanana       := 'Banana Prata'
nPrecoBanana           := 1.50
nEstoqueBanana         := 155.00

//Pera
nCodigoPera            := 2501
nMaximoDescontoPera    := 15
cDescricaoPera         := 'Pera Argentina'
nPrecoPera             := 9.00
nEstoquePera           := 117.50

//Batata
nCodigoBatata          := 3001
nMaximoDescontoBatata  := 10
cDescricaoBatata       := 'Batata Peruana'
nPrecoBatata           := 5.00
nEstoqueBatata         := 859.00

do while !lSair

//---------------login
   cUsuario := Space(8)
   cSenha   := Space(8)

   clear
   @ 01,29 say 'Login:'
   @ 02,29 say 'Senha:'

   @ 01,35 get cUsuario valid !Empty(AllTrim(cUsuario)) picture '@!'
   @ 02,35 get cSenha   valid !Empty(AllTrim(cSenha))
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif

   if !(AllTrim(cUsuario) $ 'ADMIN') .or. !(AllTrim(cSenha) $ 'teste123')
      Alert('Dados Incorretos!',{'Ok'})
      loop
   endif

   nOpcao := 0
   @ 04,01 prompt 'Efetuar pedidos'
   @ 05,01 prompt 'Deslogar'
   menu to nOpcao
   if nOpcao = 2
      loop
   endif
//----------------cadastro
   do while !lSair
      @ 04,00 clear to 24,79

      cNome    := Space(20)
      nLimie   := 0
      dVenda   := CToD('')
      cEntrega := ' '

      @ 04,65 say 'Pedido:'+ AllTrim(Str(nContador))
      @ 04,01 say 'Nome......:'
      @ 04,40 say 'Limite....:'
      @ 05,01 say 'Data venda:'
      @ 05,40 say 'Entrega [ ] [S] [N]'

      @ 04,12 get cNome    valid !Empty(AllTrim(cNome))
      @ 04,51 get nLimie   valid nLimie > 0              picture '@E 99,999.99'
      @ 05,12 get dVenda   valid dVenda >= dHoje
      @ 05,49 get cEntrega valid cEntrega $ 'SN'         picture '@!'
      read
      if LastKey() == 27
         nOpcao := Alert('Oque deseja fazer?' , { 'Retornar login' , 'Continuar Digitando' })
         if nOpcao = 2
            loop
         else
            exit
         endif
      endif
      nLinhaPadrao := 6
      nEntrega     := 0
      if cEntrega == 'S'
         cEndereco    := Space(30)
         cBairro      := Space(30)
         cReferencia  := Space(20)
         cTelefone    := Space(14)
         nEntrega     += 5
         nLinhaPadrao += 2

         @ 06,01 say 'Endereco..:'
         @ 06,44 say 'Bairro..:'
         @ 07,01 say 'Referencia:'
         @ 07,44 say 'Telefone:'

         @ 06,12 get cEndereco   valid !Empty(AllTrim(cEndereco))
         @ 06,53 get cBairro     valid !Empty(AllTrim(cBairro))
         @ 07,12 get cReferencia valid !Empty(AllTrim(cReferencia))
         @ 07,53 get cTelefone   valid !Empty(AllTrim(cTelefone))
         read
         if LastKey() == 27
            nOpcao := Alert('Oque deseja fazer?' , { 'Retornar login' , 'Continuar Digitando' })
            if nOpcao = 2
               loop
            else
               exit
            endif
         endif
      endif
//Codigo | Descricao Prod | QTD | Estoque | Desconto | Preco Un | Total Item '
      @ nLinhaPadrao++,02 say 'Codigo | Descricao Prod | QTD | Estoque | Desconto | Preco Un | Total Item '
      nLinha := nLinhaPadrao
      nTempEstoqueBanana := nEstoqueBanana
      nTempEstoquePera   := nEstoquePera
      nTempEstoqueBatata := nEstoqueBatata
      nTotalCompra       := 0
      nTotalParcial      := 0
      //Vendas
      do while .t.
         nCodigoDigitado := 0
         @ nLinha,03 get nCodigoDigitado valid nCodigoDigitado > 0 picture '9999'
         read
         if LastKey() == 27
            nOpcao := Alert('Oque deseja fazer?' , { 'Faturar venda' , 'Continuar Digitando', 'Cancelar Venda' })
            if nOpcao = 2
               loop
            else
               exit
            endif
         endif

         if nCodigoDigitado == nCodigoBanana
            cTempDescricao   := cDescricaoBanana
            nTempMaxDesconto := nMaximoDescontoBanana
            nTempPreco       := nPrecoBanana
            nTempEstoque    := nTempEstoqueBanana

         elseif nCodigoDigitado == nCodigoPera
            cTempDescricao   := cDescricaoPera
            nTempMaxDesconto := nMaximoDescontoPera
            nTempPreco       := nPrecoPera
            nTempEstoque    := nTempEstoquePera

         elseif nCodigoDigitado == nCodigoBatata
            cTempDescricao   := cDescricaoBatata
            nTempMaxDesconto := nMaximoDescontoBatata
            nTempPreco       := nPrecoBatata
            nTempEstoque     := nTempEstoqueBatata
         else
            alert('Codigo Invalido', {'ok'})
            loop
         endif

         nDigitadoQuantidade := 0
         nDigitadoDesconto   := 0
         @ nLinha,11 say AllTrim(cTempDescricao)
         @ nLinha,34 say AllTrim(Str(nTempEstoque))
         @ nLinha,49 say '%'
         @ nLinha,57 say AllTrim(Transform(nTempPreco,'@E9.99'))


         @ nLinha,28 get nDigitadoQuantidade valid nDigitadoQuantidade > 0 .and. nDigitadoQuantidade <= nTempEstoque     picture '999'
         @ nLinha,47 get nDigitadoDesconto   valid nDigitadoDesconto  >= 0 .and. nDigitadoDesconto   <= nTempMaxDesconto picture '99'
         read
         if LastKey() == 27
            loop
         endif
         nTotalParcial := nTempPreco * nDigitadoQuantidade * (100 - nDigitadoDesconto * 0.01)
         nTotalCompra  += nTotalParcial

         @ nLinha,69 say Transform(nTotalParcial ,'@E 99.999,99')
         @ 23    ,69 say Transform(nTotalCompra , '@E 99.999,99')

         nLinha++
         if nLinha = 22
            @ nLinhaPadrao,00 clear to 21,79
            nLinha := nLinhaPadrao
         endif
         InKey(0)
      enddo
   enddo
enddo

