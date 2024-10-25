//LILIAN AYUMI YAMADA HAKUTAKE
set color to W/B
clear
setmode(25,80)
set message to 24 center
set wrap on

cUsuario1 := ''
cUsuario2 := ''
cUsuario3 := ''
cUsuario4 := ''
cUsuario5 := ''
cLivro1   := ''
cLivro2   := ''
cLivro3   := ''
cLivro4   := ''
cLivro5   := ''
cLivro6   := ''
cLivro7   := ''
cLivro8   := ''
cLivro9   := ''
cLivro10  := ''
cMovimentacaoTotal := ''
nMovimentacao := 0

do while .t.
   nOpcao := 0
   nAlerta := 0

   clear
   @ 00,00 to 24,79 double
   @ 01,01 say 'SISTEMA BIBLIOTECA'
   @ 02,01 to 02,78 double
   @ 03,01 prompt padc('MANUTENCAO DE USUARIOS',78)      message 'MANUTENCAO DE USUARIOS'
   @ 04,01 prompt padc('MANUTENCAO DE LIVROS',78)        message 'MANUTENCAO DE LIVROS'
   @ 05,01 prompt padc('EMPRESTIMO DE LIVROS',78)        message 'EMPRESTIMO DE LIVROS'
   @ 06,01 prompt padc('DEVOLUCAO DE LIVROS',78)         message 'DEVOLUCAO DE LIVROS'
   @ 07,01 prompt padc('RELATORIO DE MOVIMENTCOES',78)   message 'RELATORIO DE MOVIMENTACOES'
   @ 08,01 prompt padc('SAIR',78)                        message 'SAIR'
   @ 09,01 to 09,78 double
   menu to nOpcao

   if nOpcao == 1

      do while .t.
         nCodigo := 0
         cNome := space(30)
         nIdade := 0
         cEndereco := space(30)
         cUsuario := ''
         nLinha := 10
         lNovoUsuario := .f.

         @ 10,01 clear to 23,78
         @ nLinha++,01 say 'CODIGO..:' get nCodigo   picture '999' valid !empty(nCodigo)
         read
         if lastkey() == 27
            exit
         endif

         //verifica se numero do usuario eh existente
         if nCodigo == val(substr(cUsuario1,1,3))
            cUsuario := cUsuario1
         elseif nCodigo == val(substr(cUsuario2,1,3))
            cUsuario := cUsuario2
         elseif nCodigo == val(substr(cUsuario3,1,3))
            cUsuario := cUsuario3
         elseif nCodigo == val(substr(cUsuario4,1,3))
            cUsuario := cUsuario4
         elseif nCodigo == val(substr(cUsuario5,1,3))
            cUsuario := cUsuario5
         else
            lNovoUsuario := .t.
         endif

         if !empty(cUsuario)
            cNome     := substr(cUsuario,04,30)
            nIdade    := val(substr(cUsuario,34,3))
            cEndereco := right(cUsuario,30)
         endif

         //verifica se ha mais espacos para novos cadastros
         if !empty(cUsuario1) .and. ;
            !empty(cUsuario2) .and. ;
            !empty(cUsuario3) .and. ;
            !empty(cUsuario4) .and. ;
            !empty(cUsuario5) .and. ;
            lNovoUsuario
            alert('NAO EXISTE MAIS ESPACO PARA NOVOS CADRASTROS')
            loop
         endif

         //recebe dados
         @ nLinha++,01 say 'NOME....:' get cNome     picture '@!'  valid !empty(cNome)
         @ nLinha++,01 say 'IDADE...:' get nIdade    picture '999' valid !empty(nIdade)
         @ nLinha++,01 say 'ENDERECO:' get cEndereco picture '@!'  valid !empty(cEndereco)

         read
         if lastkey() == 27
            exit
         endif

         //concatena dados
         cUsuario := ''
         cUsuario := str(nCodigo) + cNome + str(nIdade) + cEndereco

         //armazena dados do usuario
         if empty(cUsuario1) .or. nCodigo == val(substr(cUsuario1,1,3))
            cUsuario1 := ''
            cUsuario1 := cUsuario
         elseif empty(cUsuario2) .or. nCodigo == val(substr(cUsuario1,1,3))
            cUsuario2 := ''
            cUsuario2 := cUsuario
         elseif empty(cUsuario3) .or. nCodigo == val(substr(cUsuario1,1,3))
            cUsuario3 := ''
            cUsuario3 := cUsuario
         elseif empty(cUsuario4) .or. nCodigo == val(substr(cUsuario1,1,3))
            cUsuario4 := ''
            cUsuario4 := cUsuario
         elseif empty(cUsuario5) .or. nCodigo == val(substr(cUsuario1,1,3))
            cUsuario5 := ''
            cUsuario5 := cUsuario
         endif

         @ 10,01 clear to 23,78

      enddo

   elseif nOpcao == 2

      do while .t.
         nCodigo := 0
         cNome := space(60)
         cEscritor := space(60)
         cEditora := space(20)
         nAno := 0
         cStatus := ''
         cLivro := ''
         nLinha := 10
         lNovoLivro := .f.

         @ 10,01 clear to 23,78
         @ nLinha++,01 say 'CODIGO..:' get nCodigo   picture '999' valid !empty(nCodigo)
         read
         if lastkey() == 27
            exit
         endif

         //verifica se numero do Livro eh existente
         if nCodigo == val(substr(cLivro1,1,3))
            cLivro  := cLivro1
            cLivro1 := ''
         elseif nCodigo == val(substr(cLivro2,1,3))
            cLivro  := cLivro2
            cLivro2 := ''
         elseif nCodigo == val(substr(cLivro3,1,3))
            cLivro  := cLivro3
            cLivro3 := ''
         elseif nCodigo == val(substr(cLivro4,1,3))
            cLivro  := cLivro4
            cLivro4 := ''
         elseif nCodigo == val(substr(cLivro5,1,3))
            cLivro  := cLivro5
            cLivro5 := ''
         elseif nCodigo == val(substr(cLivro6,1,3))
            cLivro  := cLivro6
            cLivro6 := ''
         elseif nCodigo == val(substr(cLivro7,1,3))
            cLivro  := cLivro7
            cLivro7 := ''
         elseif nCodigo == val(substr(cLivro8,1,3))
            cLivro  := cLivro8
            cLivro8 := ''
         elseif nCodigo == val(substr(cLivro9,1,3))
            cLivro  := cLivro9
            cLivro9 := ''
         elseif nCodigo == val(substr(cLivro10,1,3))
            cLivro  := cLivro10
            cLivro10 := ''
         endif

         if !empty(cLivro)
            cNome     := substr(cLivro,04,60)
            cEscritor := substr(cLivro,64,60)
            cEditora  := substr(cLivro,124,20)
            nAno      := val(substr(cLivro,144,4))
            cStatus   := substr(cLivro,148,12)
         endif

         //verifica se ha mais espacos para novos cadastros
         if !empty(cLivro1) .and. ;
            !empty(cLivro2) .and. ;
            !empty(cLivro3) .and. ;
            !empty(cLivro4) .and. ;
            !empty(cLivro5) .and. ;
            !empty(cLivro6) .and. ;
            !empty(cLivro7) .and. ;
            !empty(cLivro8) .and. ;
            !empty(cLivro9) .and. ;
            !empty(cLivro10)
            alert('NAO EXISTE MAIS ESPACO PARA NOVOS CADRASTROS')
            loop
         endif

         //verifica status
         if empty(cStatus)
            cStatus := 'DISPONIVEL'
         endif
         if cStatus == 'DISPONIVEL'
            cCor := 'W/G'
         else
            cCor := 'W/R'
         endif
         @ nLinha++,01 say 'STATUS........: ' + cStatus color(cCor)

         //recebe dados
         @ nLinha++,01 say 'NOME..........:' get cNome     picture '@!'   valid !empty(cNome)
         @ nLinha++,01 say 'ESCRITOR......:' get cEscritor picture '@!'   valid !empty(cEscritor)
         @ nLinha++,01 say 'EDITORA.......:' get cEditora  picture '@!'   valid !empty(cEditora)
         @ nLinha++,01 say 'ANO LANCAMENTO:' get nAno      picture '9999' valid !empty(nAno)

         read
         if lastkey() == 27
            exit
         endif

         //concatena dados
         cLivro := str(nCodigo) + cNome + cEscritor + cEditora + str(nAno) + cStatus

         //armazena dados do livro
         if empty(cLivro1)
            cLivro1 := cLivro
         elseif empty(cLivro2)
            cLivro2 := cLivro
         elseif empty(cLivro3)
            cLivro3 := cLivro
         elseif empty(cLivro4)
            cLivro4 := cLivro
         elseif empty(cLivro5)
            cLivro5 := cLivro
         elseif empty(cLivro6)
            cLivro6 := cLivro
         elseif empty(cLivro7)
            cLivro7 := cLivro
         elseif empty(cLivro8)
            cLivro8 := cLivro
         elseif empty(cLivro9)
            cLivro9 := cLivro
         elseif empty(cLivro10)
            cLivro10 := cLivro
         endif
         @ 10,01 clear to 23,78

      enddo

   elseif nOpcao == 3
      do while .t.
         nCodigoUsuario := 0
         nCodigoLivro := 0
         cLivro := ''
         nLinha := 10
         cStatus := ''
         nAlerta := 0
         cMovimentacao := ''

         @ 10,01 clear to 23,78
         @ nLinha++,01 say 'CODIGO DO LIVRO..:' get nCodigoLivro   picture '999' valid !empty(nCodigoLivro)
         @ nLinha++,01 say 'CODIGO DO USUARIO:' get nCodigoUsuario picture '999' valid !empty(nCodigoUsuario)
         read
         if lastkey() == 27
            exit
         endif

         if nCodigoUsuario == val(substr(cUsuario1,1,3))
            nCodigoUsuario := val(substr(cUsuario1,1,3))
         else
            nCodigoUsuario := 0
         endif

         if nCodigoLivro == val(substr(cLivro1,1,3))
            nCodigoLivro := val(substr(cLivro1,1,3))
            cLivro := cLivro1
         else
            nCodigoUsuario := 0
         endif

         cStatus := substr(cLivro,148,12)
         if 'INDISPONIVEL' $ cStatus
            alert('LIVRO INDISPONIVEL')
            loop
         endif
         if nCodigoLivro == 0 .or. nCodigoUsuario == 0
            loop
         endif

            nAlerta := alert('CONFIRMAR EMPRESTIMO?', {'SIM', 'NAO'})
            if nAlerta == 1
               cStatus := 'INDISPONIVEL'
               cMovimentacao := 'EMPRESTIMO: ' + alltrim(str(nCodigoLivro)) + ' USUARIO: ' + alltrim(str(nCodigoUsuario))
               if len(cMovimentacao) < 78
                  nReplicate := 78 - len(cMovimentacao)
                  cMovimentacao += replicate(' ', nReplicate)
               endif
               cMovimentacaoTotal += cMovimentacao
               nMovimentacao++
            else
               loop
            endif

         if nCodigoLivro == val(substr(cLivro1,1,3))
            cLivro1 := ''
            cLivro1 := left(cLivro,147) + cStatus
         endif
         @ 10,01 clear to 23,78

      enddo

   elseif nOpcao == 4

      do while .t.
         nCodigoLivro := 0
         cLivro := ''
         nLinha := 10
         cStatus := ''
         nAlerta := 0
         cMovimentacao := ''

         @ 10,01 clear to 23,78
         @ nLinha++,01 say 'CODIGO DO LIVRO..:' get nCodigoLivro   picture '999' valid !empty(nCodigoLivro)
         read
         if lastkey() == 27
            exit
         endif

         if nCodigoLivro == val(substr(cLivro1,1,3))
            cLivro := cLivro1
         else
            alert('LIVRO NAO CADASTRADO')
         endif

         cStatus := substr(cLivro,148,12)
         if 'INDISPONIVEL' $ cStatus
            nAlerta := alert('CONFIRMAR DEVOLUCAO?', {'SIM', 'NAO'})
            if nAlerta == 1
               cStatus := 'DISPONIVEL'
               cMovimentacao := 'DEVOLUCAO: ' + alltrim(str(nCodigoLivro))
               if len(cMovimentacao) < 78
                  nReplicate := 78 - len(cMovimentacao)
                  cMovimentacao += replicate(' ', nReplicate)
               endif
               cMovimentacaoTotal += cMovimentacao
               nMovimentacao++
            endif
         endif

         if nCodigoLivro == val(substr(cLivro1,1,3))
            cLivro1 := ''
            cLivro1 := left(cLivro,147) + cStatus
         endif
      enddo
   elseif nOpcao == 5
      nLinha := 10
      @ 10,01 clear to 23,78
      nLinha := 10
      nMovimentacaoTela := nMovimentacao - 7
      nInicio := len(cMovimentacaoTotal) - 78
      nMovimentacaoRelatorio := nMovimentacao
      do while nMovimentacaoRelatorio > nMovimentacaoTela .and. nMovimentacaoRelatorio > 0
         @ nLinha,01 say 'MOVIMENTACAO: ' + alltrim(str(nMovimentacaoRelatorio))
         nLinha++
         @ nLinha,01 say substr(cMovimentacaoTotal,nInicio,78)
         inkey(0)
         nInicio -= 78
         nMovimentacaoRelatorio --
         nLinha++
      enddo
      inkey(0)
      @ 10,01 clear to 23,78
   elseif nOpcao == 6
      nAlerta := alert('DESEJA SAIR?', {'SIM', 'NAO'})
      if nAlerta == 2
         loop
      else
         exit
      endif
   else
      nOpcao := 1
   endif
enddo
inkey(0)
