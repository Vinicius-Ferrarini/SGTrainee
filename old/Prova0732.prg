//Joao Vitor Rodrigues Thomaz


Clear

SetMode ( 25,80 )

Set Scoreboard off
Set date to british
set epoch to 1930

nOrdemServico := 1

Do While .t.
   Clear
   
   //Variaveis
   cUsuario          := Space(10)
   cSenha            := Space(10)
   nTaxaEntrega      := 0

   //Alerts 
   nSair             := 0
   nLimite           := 0
   nLimiteEstourado  := 0

   //Datas
   dAtual      := Date()
   nMes        := Month(dAtual)
   nAno        := Year (dAtual)
   nDiaSemana  := DoW  (dAtual)
   cMesExtenso := ""
   cSemanaExt  := ""

   //If para data cabecalho
   If nMes     == 1
      cMesExtenso := "Janeiro"

   Elseif nMes == 2
      cMesExtenso := "Fevereiro"

   Elseif nMes == 3
      cMesExtenso := "Marco"

   Elseif nMes == 4
      cMesExtenso := "Abril"

   Elseif nMes == 5
      cMesExtenso := "Maio"

   Elseif nMes == 6
      cMesExtenso := "Junho"

   Elseif nMes == 7
      cMesExtenso := "Julho"

   Elseif nMes == 8
      cMesExtenso := "Agosto"

   Elseif nMes == 9
      cMesExtenso := "Setembro"

   Elseif nMes == 10
      cMesExtenso := "Outubro"

   Elseif nMes == 11
      cMesExtenso := "Novembro"

   Elseif nMes == 12
      cMesExtenso := "Dezembro"

   Endif

   If nDiaSemana == 1
      cSemanaExt := "Domingo"

   Elseif nDiaSemana == 2
      cSemanaExt := "Segunda-Feira"

   Elseif nDiaSemana == 3
      cSemanaExt := "Terca-Feira"

   Elseif nDiaSemana == 4
      cSemanaExt := "Quarta-Feira"

   Elseif nDiaSemana == 5
      cSemanaExt := "Quinta-Feira"

   Elseif nDiaSemana == 6
      cSemanaExt := "Sexta-Feira"

   Elseif nDiaSemana == 7
      cSemanaExt := "Sabado"

   Endif

   @ 01,02 say "Joao Vitor Rodrigues Thomaz"
   @ 02,01 to 24,79 double
   @ 03,03 to 06,77

   @ 04,26 say Alltrim( cSemanaExt ) + "   " + Alltrim( cMesExtenso ) + " / " + Transform( nAno, '9999' )
   @ 05,30 say "ASSISTENCIA TECNICA - SG"
   @ 11,32 say "Usuario: "
   @ 13,32 say "Senha  : "
   @ 22,10 say "Para sair aperte ESC." color 'N/W'

   @ 11,42 get cUsuario picture '@!' valid !Empty( cUsuario )
   @ 13,42 get cSenha   picture '@!' valid !Empty(  cSenha  )
   Read

   @ 21,03 say "Para continuar aperte qualquer tecla." color 'N/W'

   Inkey(0)

   If lastkey() == 27
      nSair := Alert( "Deseja sair do Programa?", { "Sim", "Nao" }, 'N/W' )
      If nSair == 1
         exit
      Else
         Loop
      Endif
   Endif

   If cUsuario = "SISTEMAS" .and. cSenha = "MUDAR123"
      Clear
      
      Do While .t. //Tela inicial

         @ 02,01 to 24,79 double
         @ 03,02 to 06,77

         Set message to 22 center

         @ 04,26 say Alltrim( cSemanaExt ) + "   " + Alltrim( cMesExtenso ) + " / " + Transform( nAno, '9999' )
         @ 05,30 say "ASSISTENCIA TECNICA - SG"
         @ 11,35 prompt "Efetuar Vendas"  message "Realizar vendas de produtos e/ou servicos!"
         @ 13,35 prompt "Sair"            message "Sair do programa!"

         Menu to nOpcao
         
         If nOpcao == 1
            Clear

            Do While .t. //Tela de Seleção de Mesa            //Variaveis
               cNomeCliente      := Space( 40 )
   
               dServico          := dAtual
               cNomeTecnico      := Space( 30 )
               cEquipamento      := Space( 40 )
               dCompra           := CToD("")
               cEntregaDomicilio := Space(1)
               nLimiteCredito    := 0

               @ 01,03 say "Joao Vitor Rodrigues Thomaz"
   
               @ 02,01 to 24,79 Double 
               @ 04,02 to 04,78 Double
               @ 06,02 to 06,78 Double
   
               @ 03,28 say "ASSISTENCIA TECNICA - SG" 
               @ 05,28 say "DADOS DA ORDEM DE SERVICO"
   
               @ 07,03 say "Ordem de Servico............: " + Alltrim( Transform( nOrdemServico, '99999999' ) )
               @ 09,05 say "Cliente...........: "
               @ 10,06 say "Data da OS........: " + DtoC( dAtual )
               @ 11,05 say "Tecnico...........: "
               @ 12,05 say "Desc. do Equip. ..: " 
               @ 13,05 say "Data da Compra....: "
               @ 14,05 say "Entrega Domicilio.: "
               @ 15,05 say "Limite De Credito.: "
   
               @ 09,26 get cNomeCliente      picture '@!'                valid !Empty( cNomeCliente )
               @ 11,26 get cNomeTecnico      picture '@!'                valid !Empty( cNomeTecnico )
               @ 12,26 get cEquipamento      picture '@!'                valid !Empty( cEquipamento )
               @ 13,26 get dCompra                                       valid !Empty( dCompra )
               @ 14,26 get cEntregaDomicilio picture '@!'                valid cEntregaDomicilio $'SN'
               @ 15,26 get nLimiteCredito    picture '@E 999,999,999.99' valid nLimiteCredito > 0
               Read
   
               If lastkey() == 27
                  nSair := Alert( "Deseja sair do Programa?", { "Sim", "Nao" }, 'N/W' )
                  If nSair == 1
                     exit
                  Else
                     Loop
                  Endif
               Endif
   
               If cEntregaDomicilio = 'S'
                  @ 16,02 to 16,78 Double
                  @ 18,02 to 18,78 Double

                  //variaveis
                  cEndereco      := Space(20)
                  nNumeroCasa    := 0
                  cBairro        := Space(15)
                  cReferecencia  := Space(10)
                  cTelefone      := Space(15)

                  @ 17,28 say "DADOS DA ENTREGA"
                  @ 19,03 say "Endereco..........: "
                  @ 19,45 say "Numero..: "
                  @ 20,03 say "Bairro............: "
                  @ 20,45 say "Telefone: "
                  @ 21,03 say "Referencia........: "
                  @ 22,03 say "Valor da entrega de 4% sobre o valor da OS!"

                  @ 19,23 get cEndereco      picture '@!'   valid !Empty( cEndereco )
                  @ 19,55 get nNumeroCasa    picture '9999' valid nNumeroCasa > 0
                  @ 20,23 get cBairro        picture '@!'   valid !Empty(  cBairro  )
                  @ 20,55 get cTelefone      picture '@!'   valid !Empty( cTelefone )
                  @ 21,23 get cReferecencia  picture '@!'   valid !Empty( cReferecencia )
                  Read         

                  @ 24,35 say "Para continuar aperte qualquer tecla." color 'N/W'      

                  Inkey(0)
               Endif
   
               Do While .t.
   
                  Clear
   
                  @ 01,03 say "Joao Vitor Rodrigues Thomaz"
                  @ 02,01 to 24,79 Double
   
                  @ 04,02 to 04,78 Double
                  @ 06,02 to 06,78 Double
   
                  @ 03,28 say "ASSISTENCIA TECNICA - SG" 
   
                  Set Message to 15 center
   
                  @ 05,05 prompt "Produto" Message "Dados do Produto!"
                  @ 05,15 prompt "Servico" Message "Dados do Servico!"
   
                  Menu to nOpcao1
   
                  nLinha1 := 7
                  nLinha2 := 8
                  nLinha3 := 9
                  nLinha4 := 10
                  nLinha5 := 11
                  nTotal  := 0

                  if nOpcao1 == 1
                     @ 05,03 clear to 23,78
                     Do While .t.
   
                        If nLinha1 > 13
                           nLinha1 := 7
                           nLinha2 := 8
                           nLinha3 := 9
                           nLinha4 := 10
                           nLinha5 := 11
                        Endif                           
                        
                        @ 06,02 to 06,78 Double   
                        @ 21,45 to 23,78 Double   
                        
                        //variaveis
                        cDescProduto := Space(30)
                        nQuantidade  := 0
                        nPrecoUnit   := 0
                        nDesconto    := 0
                        nValorTotal  := 0
                        nSairPedidos := 0
   
                        @ 05,31 say "DADOS DO PRODUTO"
                        @ nLinha1,03 say "Descricao.........: "
                        @ nLinha2,03 say "Quantidade........: "
                        @ nLinha3,03 say "Preco Unit. ......: "
                        @ nLInha4,03 say "Desconto %........: "
                        @ nLinha5,03 say "Valor Total.......: " 
   
                        @ nLinha1,23 get cDescProduto picture '@!'                   valid !Empty( cDescProduto )
                        @ nLinha2,23 get nQuantidade  picture '99'                   valid nQuantidade >  0
                        @ nLinha3,23 get nPrecoUnit   picture '@E 99,999,999,999.99' valid nPrecoUnit  >  0
                        @ nLinha4,23 get nDesconto    picture '@E 99999.99'         valid nDesconto   >= 0
                        Read
   
                        nDesconto   := nDesconto / 100
                        nValortotal := nQuantidade * nPrecoUnit
                        nValorTotal := nValorTotal -( nValorTotal * nDesconto )
                        nTotal      += nValorTotal   
                        
                        @ nLinha5,52 say Alltrim( Transform( nValorTotal, '@E 99,999,999,999.99' ) )
                        @ 22,47      say Transform( nTotal, '@E 99,999,999,999.99' )

                        If lastkey() == 27
                           nSairPedidos := Alert( "Deseja finalizar a OS? ", { "Sim", "Nao" }, 'N/W' )
                           If nSairPedidos == 1
                              Exit
                           Elseif nSairPedidos == 2
                              Loop
                           Endif
                        Endif

                        nLinha1 += 6
                        nLinha2 += 6
                        nLinha3 += 6
                        nLinha4 += 6
                        nLinha5 += 6
                             
                     Enddo
                  Elseif nOpcao1 == 2

                     @ 05,03 clear to 23,78
                     Do While .t.
   
                        If nLinha1 > 13
                           nLinha1 := 7
                           nLinha2 := 8
                           nLinha3 := 9
                           nLinha4 := 10
                           nLinha5 := 11
                        Endif                           
                        
                        //variaveis
                        cDescServico := Space(25)
                        nPrecoServico:= 0
                        nDesconto    := 0
                        nValorTotal  := 0
                        nComissao    := 0
                        
                        @ 06,02 to 06,78 Double   
                        @ 21,45 to 23,78 Double   
                        
   
                        @ 05,28 say "DADOS DO SERVICO"
                        @ nLinha1,03 say "Descricao.........: "
                        @ nLinha2,03 say "Valor Servico.....: "
                        @ nLinha3,03 say "Desconto %........: "
                        @ nLinha4,03 say "Comissao Tec. %...: "
                        @ nLinha5,03 say "Valor Total.......: "    
                     
                        @ nLinha1,23 get cDescServico  picture '@!'                   valid !Empty( cDescServico )
                        @ nLinha2,23 get nPrecoServico picture '@E 99,999,999,999.99' valid nPrecoServico > 0
                        @ nLinha3,23 get nDesconto     picture '@E 99999.99'          valid nDesconto   >= 0
                        @ nLinha4,23 get nComissao     picture '@E 99999.99'          valid nPrecoUnit  >  0
                        Read

                        nDesconto   := nDesconto / 100
                        nValortotal := nPrecoServico -( nPrecoServico * nDesconto )
                        nTotal      += nValorTotal   
                        
                        @ nLinha5,52 say Alltrim( Transform( nValorTotal, '@E 99,999,999,999.99' ) )
                        @ 22,47      say Transform( nTotal, '@E 99,999,999,999.99' )

                        If lastkey() == 27
                           nSairPedidos := Alert( "Deseja finalizar a OS? ", { "Sim", "Nao" }, 'N/W' )
                           If nSairPedidos == 1
                              Exit
                           Elseif nSairPedidos == 2
                              Loop
                           Endif
                        Endif

                        nLinha1 += 6
                        nLinha2 += 6
                        nLinha3 += 6
                        nLinha4 += 6
                        nLinha5 += 6
                     Enddo    
                  Endif
   
                  If nLimiteCredito < nTotal
                     nLimiteEstourado := Alert( "Valor da OS Maior que o Limite" )
                     
                     cUsuario := Space(15)
                     cSenha   := Space(10)
                     
                     Clear
                     
                     Do While .t.
                        
                        @ 02,01 to 24,79 double
                        @ 03,03 to 06,77
                        
                        @ 04,26 say Alltrim( cSemanaExt ) + "   " + Alltrim( cMesExtenso ) + " / " + Transform( nAno, '9999' )
                        @ 05,30 say "ASSISTENCIA TECNICA - SG"
                        @ 11,32 say "Usuario: "
                        @ 13,32 say "Senha  : "

                        @ 11,42 get cUsuario picture '@!' valid !Empty( cUsuario )
                        @ 13,42 get cSenha   picture '@!' valid !Empty(  cSenha  )
                        Read

                        @ 21,03 say "Para continuar aperte qualquer tecla." color 'N/W'

                        Inkey(0)

                        If cUsuario = "SUPERVISOR" .and. cSenha = "LIBERE123"
                           Exit
                        Else
                           nTotal        := 0
                           nOrdemServico --
                           Exit
                        Endif

                     Enddo
                  Endif

                  Do While .t.

                      @ 08,02 clear to 23,78
                      
                      @ 09,02 to 09,78 Double
                      @ 11,02 to 11,78 Double
                      @ 21,45 to 23,78 Double
                      
                      @ 10,37 say "FATURAMENTO"
                      @ 12,03 say "[D]inheiro / [C]artao / Che[Q]ue: "
                      @ 13,03 say "Total a Pagar...................: " + Transform( nTotal, '@E 999,999,999.99' )
                      @ 14,03 say "Valor recebido..................: "
                      
                      @ 12,37 get cOpcaoPagamento picture '@!'          valid cOpcaoPagamento $'DCQ'
                      @ 14,37 get nValorPagamento picture '@E 999,999,999.99' valid nValorPagamento > 0
                      Read
                      
                      If nValorPagamento < nTotal
                          nValorAbaixo := Alert( "Valor recebido menor que o valor total a pagar. Tente Novamente!", {"Ok"}, 'W+/R' )
                          If nValorAbaixo == 1
                              Loop
                          Endif
                      Endif
                      
                      @ 15,03 say "Valor Troco.....................: "
                      @ 17,03 say "Pagamento efetuado com sucesso!"
                      @ 18,03 say "Pressione alguma tecla para continuar."
                      
                      Inkey(0)
                      
                      @ 10,02 clear to 23,78
                  Enddo
                    
               Enddo
            Enddo
         
         Elseif nOpcao == 2
            Exit
         Endif
      Enddo
   Endif   
Enddo