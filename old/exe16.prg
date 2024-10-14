//vinicius reginaldo ferrarin

clear

cNome   := space(10)
nVezes  := 0
nLinha  := 0
nCont   := 0
nColuna := 0

@ 01,09 to 21,60  double
@ 02,10 say 'Nome :'
@ 03,10 say 'Vezes:'

@ 02,18 get cNome  picture '@!'  valid !Empty(cNome)
@ 03,18 get nVezes picture '999' valid nVezes > 0
read
nTam := len(alltrim(cNome)) + 5

clear

do while nCont < nVezes
   @ nLinha++,nColuna say transform(nCont+1,'999') + '-' + cNome    //printa
   nCont++

   if nLinha > 24  //se chegar ultima linha
      nLinha  := 0
      nColuna += nTam

      if 81 - nColuna < nTam  //se chegar ultima coluna
         nColuna := 0
         inkey(0)
         clear
      endif
   endif
enddo


inkey(0)
@ 23,01 say ''
