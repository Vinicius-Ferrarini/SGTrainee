//vinicius reginaldo ferrarini
//leia um palavra e escreva ao contrario

set date to british
set epoch to 1940
set scoreboard off

clear

//set color to ("N/W")
//@ 03,09 clear to 21,70

nCont      := 0
cNome      := Space(10)
cInvertido := ''
cInvertidoSemEspaco := ''

@ 01,01 say "Nome:"
@ 01,06 get cNome
read

cNome := alltrim(cNome)
nTam  := len(cNome)

do while !Empty(nTam)
   cInvertido += substr(cNome, nTam-- ,1)
enddo

@ 04,00 say cInvertido

//do while
//   if substr()

//alert (cInvertido)
