//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off


dHoje := date()
lSair := .f.

do while !lSair

//---------------login
   cUsuario := Space(8)
   cSenha   := Space(8)

   clear
   @ 01,29 say 'Login:'
   @ 02,29 say 'Senha:'

   @ 01,35 get cUsuario valid !Empty(AllTrim(cUsuario)) picture '@!'
   @ 02,35 get cSenha   valid !Empty(AllTrim(cSenha))
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif

   if !(AllTrim(cUsuario) $ 'ADMIN') .or. !(AllTrim(cSenha) $ 'teste123')
      Alert('Dados Incorretos!',{'Ok'})
      loop
   endif
   nOpcao:=Alert('Oque deseja fazer?',{'Efetuar pedidos' , 'Sair'})
   if nOpcao != 1
      exit
   endif
//----------------cadastro
   do while !lSair
      cNome    := Space(20)
      nLimie   := 0
      dVenda   := CToD('')
      cEntrega := ' '

      @ 04,01 say 'Nome......:'
      @ 04,40 say 'Limite....:'
      @ 05,01 say 'Data venda:'
      @ 05,40 say 'Entrega [ ] [S] [N]'

      @ 04,12 get cNome    valid !Empty(AllTrim(cNome))
      @ 04,51 get nLimie   valid nLimie > 0              picture '@E 99,999.99'
      @ 05,12 get dVenda   valid dVenda >= dHoje
      @ 05,50 get cEntrega valid cEntrega $ 'SN'         picture '@!'
      read
      if LastKey() == 27
         nOpcao := Alert('Oque deseja fazer?' , { 'Retornar login' , 'Continuar Digitando' })
         if nOpcao != 1
            exit
         else
            loop
         endif
      endif

   enddo
enddo
