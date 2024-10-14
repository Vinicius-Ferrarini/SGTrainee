//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

clear

cNome := space(10)
cChar := ' '
nCont := 0

@ 01,01 say "Nome:"
@ 01,06 get cNome
read

// substr(cTexto,nPosicaoInicial,nTamanho)

cChar :=substr(cNome,2,4)
@ 03,01 say cChar

// alert(xMensagem,aOpcoes,cCor) => nOpcao
alert('teste')
alert (4)
