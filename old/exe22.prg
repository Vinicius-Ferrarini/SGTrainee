//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off




//set color to ("N/W")
//@ 03,09 clear to 21,70



lFecha   := .f.

do while !lFecha   //coleta nome e limite

   lCupom        := .f.
   cNome         := Space(30)
   nLimite       := 0
   nLinha        := 1
   nTotalParcial := 0
   nTotal        := 0
   clear
   @ 00,01 to 02,78 double
   @ nLinha,11 say "Nome:"
   @ nLinha,50 say "Limite:"

   @ nLinha,16   get cNome    valid !Empty(cNome) picture '@!'
   @ nLinha++,56 get nLimite  valid nLimite > 0   picture "@E 999,999.99"
   read
   nLimiteTotal := nLimite
   if LastKey() == 27
      nOpcao := alert("Deseja fechar programa?" , { 'Sim' , 'Nao' })
      if nOpcao = 1  //sai tudo
         exit
      else
         loop
      endif
   endif
//------------------------------------------
   //cabecalho
   nLinha++
   @ nLinha++,10 say '|     Produto     | QTD |    Valor    |     Total     |'
   @ 21,10 say       '                       Total compra R$|               |'
   @ 22,10 say       '                    Limite Restante R$|               |'
   @ nLinha,10 to 20,10
   @ nLinha,28 to 20,28
   @ nLinha,34 to 20,34
   @ nLinha,48 to 20,48
   @ nLinha,64 to 20,64

   //------------------------------------------
   do while .t.      //Compra
      cProduto := Space(15)
      nQuant   := 0
      nValor   := 0

      //recebe dados
      @ nLinha,11 get cProduto valid !Empty(cProduto)
      @ nLinha,30 get nQuant   valid nQuant > 0       picture '999'
      @ nLinha,36 get nValor   valid nValor > 0       picture '@E 99,999.99'
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
     //-------------------------------------------
      nTotalParcial := nQuant * nValor
      if nLimite - nTotalParcial < 0
         alert('Valor digitado maior que limite!')
         loop
      endif

      nTotal  += nTotalParcial
      nLimite -= nTotalParcial

      //--------------------------------Valores Totais
      @ nLinha++,50 say nTotalParcial   picture '@E 999,999.99'
      @ 21,50       say nTotal          picture '@E 999,999.99'
      @ 22,50       say nLimite         picture '@E 999,999.99'


      if nLinha > 20  //chega ultima linha
         nLinha := 3
         @ nLinha,00 clear to 20,79
         @ nLinha,10 to 20,10
         @ nLinha,28 to 20,28
         @ nLinha,34 to 20,34
         @ nLinha,48 to 20,48
         @ nLinha,64 to 20,64
      endif
   enddo
   //----------------------------------------------
   do while lCupom //mostra cupom
      cFormaPag := ' '
      nLinha    := 5
      @ 03,01 clear to 24,79
      @ 04,01 to 08,79

      @ nLinha++,20 say 'Forma de pagamento: [ ] [A]vista [P]razo'
      @ nLinha++,20 say 'Valor Recebido....:' + transform( nTotal , '@E 999,999.99')
      @ nLinha++,20 say 'Valor Troco.......:' + transform( nLimiteTotal - nTotal, '@E 999,999.99')

      @ nLinha-3,41 get cFormaPag valid cFormaPag $ 'AP' picture '@!'
      read
      if LastKey() == 27
         nOpcao := alert('Deseja cancelar compra?', {'Nao' , 'Sim' })
         if nOpcao = 2 //cancela
            exit
         else          //cupom de novo
            loop
         endif
      endif
      @ nLinha,01 say "Precione um tecla para finalizar..."
      inkey(0)
      exit
   enddo
enddo








