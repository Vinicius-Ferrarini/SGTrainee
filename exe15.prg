//vinicius reginaldo ferrarini
//repita 10 vezes sua nome

clear

cNome := Space(7)

@ 01,01 say 'Digite seu nome:'
@ 01,18 get cNome
read

cNome := alltrim(cNome)

//for

inkey(0)
@ 23,01 say ''
