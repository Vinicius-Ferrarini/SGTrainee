set date to british
set epoch to 1940
set scoreboard off

clear


cTexto   := space (30)
nTam     := len(cTexto)
nLinha   := 1

@ nLinha,01 say "Digite o seu Nome: "
@ nLinha,18 get cTexto
read



nTam   := len(alltrim(cTexto))//quantidade de caracteres

@ ++nLinha,18 say nTam
@ ++nLinha,18 say cTexto





@ 23,01 say ''
