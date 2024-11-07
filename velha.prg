//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dHoje    := date()
nAtual   := Day(dHoje)
nAtual   := Month(dHoje)
nAtual   := Year(dHoje)

cPosicoesjogadas  := '' 
cPosicoesjogadar1 := '' 
cPosicoesjogadas2 := '' 
nVez := 1
nVezJogador1 := 0
nVezJogador2 := 0

clear
@ 05,20 say '   |   |   '
@ 06,20 say '   |   |   '
@ 07,20 say '   |   |   '

do while .t.
    nJogadaLinha  := 0
    nJogadaColuna := 0
    
    @ 01,01 say 'Posicao.:'
    @ 01,01 say 'Coluna.:'
      
    @ 01,16 get nJogadaLinha  picture '9' valid nJogadaLinha  > 0 .and. nJogadaLinha  <= 3
    @ 02,16 get nJogadaColuna picture '9' valid nJogadaColuna > 0 .and. nJogadaColuna <= 3
    Read
        
    cPosicaoTemp := Str((nJogadaLinha-1) * 3 + nJogadaColuna)
    if  cPosicaoTemp $ cPosicoesjogadas
        alert('posicao ja jogada')
        loop
    endif

    nteste := nJogadaLinha * 3 + 10 
    @ 05+ nJogadaLinha,21 + nJogadaColuna*3 say  'x'
    cPosicoesjogadas  += '|' + cPosicaoTemp
    cPosicoesjogadar1 += '|' + cPosicaoTemp
    nVezJogador1++
   // if nVezJogador1 >= 3
        if '5' $ cPosicoesjogadar1
            if '2' $ cPosicoesjogadar1
                if '8' $ cPosicoesjogadar1
                    alert('Ganhou',{'ok'})
                endif
            elseif '4' $ cPosicoesjogadar1
                if '6' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            elseif '1' $ cPosicoesjogadar1
                if '9' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            elseif '2' $ cPosicoesjogadar1
                if '7' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            endif
        elseif '1' $ cPosicoesjogadar1
            if '2' $ cPosicoesjogadar1
                if '3' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            elseif '4' $ cPosicoesjogadar1
                if '7' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            endif
        elseif '9' $ cPosicoesjogadar1
            if '6' $ cPosicoesjogadar1
                if '3' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            elseif '8' $ cPosicoesjogadar1
                if '7' $ cPosicoesjogadar1
                    alert('Ganhou')
                endif
            endif
        endif
    //endif

enddo