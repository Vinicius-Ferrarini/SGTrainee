clear

do while .t.

   cNome  := Space(15)
   nIdade := 0


   @ 01,01 say 'Nome.:'
   @ 02,01 say 'idade:'

   @ 01,07 get cNome   picture '@!' valid !Empty(cNome)
   @ 02,07 get nIdade  picture '99' valid nIdade >= 0
   read

   if lastkey() == 27
      nOp := alert( "Deseja sair?" , { 'Sim' , 'Nao' } , 'G/B')

      if nOp = 1
         exit
      else
         loop
      endif
   endif


enddo


