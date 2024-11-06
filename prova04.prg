//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dHoje    := date()
nDiaAtual    := Day(dHoje)
nMesAtual    := Month(dHoje)
nAnoAtual    := Year(dHoje)
nContadorOs  := 1

do while .t.
   clear
   cClienteNome     := Space(50)
   cTecnicoNome     := Space(40)
   cEquipamentoDesc := Space(50)
   dCompra          := CToD('')
   dOrdemServico    := CToD('')
   cSolicitacao     := Space(1)
   lGarantia        := .f.
   nLinha           := 0
   
   @ nLinha++,00 to 24,79 double
   @ nLinha++,32 say 'Assistencia tecnica'
   @ nLinha++,58 say 'Ordem de servico: ' + AllTrim(Str(nContadorOs))
   @ nLinha++,01 say 'Cliente...........:'
   @ nLinha++,01 say 'Tecnico...........:'
   @ nLinha++,01 say 'Equipamento.......:'
   @ nLinha  ,01 say 'Compra equipamento:'
   @ nLinha++,35 say 'Data ordem Servico:'
   @ nLinha,01 say 'Oque sera feito...:[ ] [P]roduto [S]ervico'
   nContadorOs++


   nLinha -= 4
   @ nLinha++,20 get cClienteNome     valid !Empty(cClienteNome)     picture '@!'
   @ nLinha++,20 get cTecnicoNome     valid !Empty(cTecnicoNome)     picture '@!'
   @ nLinha++,20 get cEquipamentoDesc valid !Empty(cEquipamentoDesc) picture '@!'
   @ nLinha,20   get dCompra          valid dCompra   <= dHoje
   @ nLinha++,54 get dOrdemServico    valid dOrdemServico <= dHoje
   @ nLinha++,21   get cSolicitacao     valid cSolicitacao $ 'PS'      picture '@!'
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif
   @ nLinha,01 to nLinha++,78 double

   //Calcula tempo
   nDiaCompra          := Day(dCompra)
   nMesCompra          := Month(dCompra)
   nAnoCompra          := Year(dCompra)
   nDiaOrdemSerivco    := Day(dOrdemServico)
   nMesOrdemSerivco    := Month(dOrdemServico)
   nAnoOrdemSerivco    := Year(dOrdemServico)

   nAnoTemEquipamento := nAnoOrdemSerivco - nAnoCompra
   if nMesOrdemSerivco < nMesCompra .or. (nMesOrdemSerivco == nMesCompra .and. nDiaOrdemSerivco < nDiaCompra)
      nAnoTemEquipamento--
   endif
   //------------------
   if cSolicitacao == 'P'
      nLinha := 8
      @ nLinha++,02 say 'Descricao produto             | QTD |  Preco Un  | Comissao | Total        |   ' 

      if nAnoTemEquipamento <= 2
         lGarantia := .t.
      endif
//                              | QTD |  Preco Un  | Comissao | Total        |                   

      do while .t.
         cProdutoDescricao  := Space(30)
         nProdutoQuantidade := 0
         nProdutoPrecoUn    := 0
         nProdutoDesconto   := 0
         nValorTotal        := 0     
         



      enddo
      
   else
      cServicoDescricao := Space(30)
      nServicoDesconto  := 0
      nServicoComissao  := 0
      nServicoTotal     := 0
   endif

enddo