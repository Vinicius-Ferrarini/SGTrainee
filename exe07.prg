clear

nN1 := 0
nN2 := 0

do while .t.
   @ 01,01 say "--------------------------------------------------------------------------------"
   @ 02,01 say "Digite o numero A: "
   @ 03,01 say "Digite o numero B: "
   @ 09,01 say "--------------------------------------------------------------------------------"
   @ 02,20 get nN1 picture "@E 99.99"
   @ 03,20 get nN2 picture "@E 99.99"
   read

   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?', { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif


   @ 05,01 say "A soma :"
   @ 05,19 say (nN1+nN2) picture "@E 9,999.99"
   @ 06,01 say "A subtracao :"
   @ 06,19 say (nN1-nN2) picture "@E 9,999.99"
   @ 07,01 say "A multiplicacao :"
   @ 07,19 say (nN1*nN2) picture "@E 9,999.99"
   @ 08,01 say "A divisao :"
   @ 08,19 say (nN1/nN2) picture "@E 9,999.99"
   @ 09,01 say "--------------------------------------------------------------------------------"
enddo
