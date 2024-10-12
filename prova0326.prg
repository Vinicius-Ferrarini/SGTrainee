//vinicius reginaldo ferrarini
//prova 03
set date to british
set epoch to 1940
set scoreboard off

lSistema := .t.
clear

do while .t.

    cNome       := Space(20)
    dNascimento := CToD(' ')
    dHoje       := date()
    nLinha      := 1

    @ 01,00 say 'Nome....................:'
    @ 02,00 say 'Data de nascimento......:'
    @ 03,00 say 'Nascido em..............:' //domingo
    @ 04,00 say 'Idade...................:'
    @ 05,00 say 'Signo...................:'
    @ 06,00 say 'Prox. Aniversario em....:'
    @ 07,00 say 'Prox. Aniversario em uma:'

    @ 01,26 get cNome       picture '@!'  valid !Empit(cNome)
    @ 02,26 get dNascimento               valid dNascimento < dHoje
    read
    if LastKey() == 27
        nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
        if nOpcao = 1
           exit
        else
           loop
        endif
     endif

     nNascimentoAno  := Year(dNascimento)
     nNascimentoDia  := day(dNascimento)
     nNascimentoMes  := Month(dNascimento)
     nNascimentoSem  := DoW(dNascimento)
     nHojeAno        := Year(dHoje)
     nHojeDia        := day(dHoje)
     nHojeMes        := Month(dHoje)
     nHojeSem        := DoW(dHoje)
     nIdade          := nNascimentoAno - nHojeAno


enddo
