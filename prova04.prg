//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dDataHoje    := date()
nDiaAtual    := Day(dDataHoje)
nMesAtual    := Month(dDataHoje)
nAnoAtual    := Year(dDataHoje)
nContadorOs  := 1

do while .t.
    clear
    cClienteNome     := Space(50)
    cTecnicoNome     := Space(40)
    cEquipamentoDesc := Space(50)
    dDataCompra      := CToD('')
    dDataOs          := CToD('')
    cSolicitacao     := Space(1)

    @ 00,32 say 'Assistencia tecnica'
    @ 02,01 say 'Cliente...........:'
    @ 01,58 say 'Ordem de servico: ' + AllTrim(Str(nContadorOs))
    @ 03,01 say 'Tecnico...........:'
    @ 04,01 say 'Equipamento.......:'
    @ 05,01 say 'Compra equipamento:'
    @ 05,35 say 'Data ordem Servico:'
    @ 06,01 say 'Oque sera feito...:[ ] [P]roduto [S]ervico'
    nContadorOs++

    @ 02,20 get cClienteNome     valid !Empty(cClienteNome)     picture '@!'
    @ 03,20 get cTecnicoNome     valid !Empty(cTecnicoNome)     picture '@!'
    @ 04,20 get cEquipamentoDesc valid !Empty(cEquipamentoDesc) picture '@!'
    @ 05,20 get dDataCompra      valid dDataCompra <= dDataHoje
    @ 05,54 get dDataOs          valid dDataOs     <= dDataHoje
    @ 06,21 get cSolicitacao     valid cSolicitacao $ 'PS'      picture '@!'
    read
    if LastKey() == 27
        nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
        if nOpcao = 1
           exit
        else
           loop
        endif
     endif
     
     if cSolicitacao == 'P'
        cProdutoDescricao   := Space(30)
        nProdutoQuantidade  := 0
        nProdutoPrecoUn     := 0
        nProdutoDescontoPor := 0
        nValorTotal         := 0
        
     endif

enddo