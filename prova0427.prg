//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)

dHoje    := date()
nAtual   := Day(dHoje)
nAtual   := Month(dHoje)
nAtual   := Year(dHoje)

cNumeros        := "0123456789"
cMaiusculas     := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cMinusculas     := "abcdefghijklmnopqrstuvwxyz"
cEspeciais      := ".*[!\#$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~].*" + '"'
cSenhasPosicoes := ''
cSenhasTotais   := ''
cDatasTotais    := ''

nCodigo         := 1
do while .t.
    nLinha := 0
    nOpcao := 0
    clear
    @ nLinha++,00 to 24,79 double
    @ nLinha++,35 prompt 'Cadastrar'
    @ nLinha++,35 prompt 'Consultar'
    @ nLinha++,35 prompt 'Sair'
    menu to nOpcao
    if LastKey() == 27
        nOpcao := alert('Voltar?' , { 'Sim' , 'Nao' })
        if nOpcao == 1
            exit
        else
            loop
        endif
    endif
    if nOpcao == 1
        do while .t.
            lMaiusculas := .f.
            lMaiusculas := .f.
            lEspeciais  := .f.
            
            nLinha    := 4     
            cSenha    := Space(12)
            dCadastro := CToD('')

            @ nLinha,01 to nLinha++,78 double 
            @ nLinha++,30 say "Codigo..........: " + AllTrim(Str(nCodigo))
            @ nLinha++,30 say "Senha...........:" 
            @ nLinha  ,30 say "Data Cadastrado.:" 
            nLinha -= 1

            @ nLinha++,48 get cSenha    valid !Empty(cSenha)
            @ nLinha  ,48 get dCadastro valid !Empty(dCadastro) .and. dCadastro <= dHoje
            Read     
            if LastKey() == 27
                exit
            endif

            //verifica senha
            cSenhaSemEspaco := AllTrim(cSenha)
            nTamanhoSenha   := Len(cSenhaSemEspaco)
            
            //maiusculas
            nContador := 1
            do while nContador <= nTamanhoSenha 
                cTemp := SubStr(cSenhaSemEspaco,nContador,1)
                if cTemp $ cMaiusculas
                    lMaiusculas := .t.
                    exit
                endif
                nContador++
            enddo

            //minusculas
            nContador := 1
            do while nContador <= nTamanhoSenha 
                cTemp := SubStr(cSenhaSemEspaco,nContador,1)
                if cTemp $ cMinusculas
                    lMinusculas := .t.
                    exit
                endif
                nContador++
            enddo


            
            //Especiais
            nContador := 1
            do while nContador <= nTamanhoSenha 
                cTemp := SubStr(cSenhaSemEspaco,nContador,1)
                if cTemp $ cEspeciais
                    lEspeciais := .t.
                    exit
                endif
                nContador++
            enddo

            //valida senha
            if nTamanhoSenha < 8 .or. !lMaiusculas .or. !lMinusculas .or. !lEspeciais
                alert('Senha FRACA!')
                loop
            endif

            //--------------------
       

            //calendario
            //--------------
            cSenhasTotais += ',' + cSenha
            cDatasTotais  += ',' + DToC(dCadastro)
            nCodigo++    
        enddo
    
    elseif nOpcao == 2 //consulta
        do while .t.
            if nCodigo < 2
                alert('Nenhum codigo digitado!')
                exit
            endif

            nCodigoSolicitado := 0
            nLinha            := 4
            @ nlinha,01 clear to 23,78
            @ nLinha,01 to nLinha++,78 double 
            @ nLinha,20 say 'Codigo:'
            @ nLinha,28 get nCodigoSolicitado picture '999'
            Read
            if LastKey() == 27
                exit
            endif
            //volta comeco
            if nCodigoSolicitado >= nCodigo .or. nCodigoSolicitado < 1
                alert('O codigo '+ AllTrim(Str(nCodigoSolicitado)) + ' nao foi digitado!')
                loop
            endif
            //pega data e senha
            nPosicaoSenha := (nCodigoSolicitado-1) * 13 + 2
            nPosicaoData  := (nCodigoSolicitado-1) * 9 + 2
            cTempSenha := AllTrim(SubStr(cSenhasTotais,nPosicaoSenha,12))
            cTempData  := AllTrim(SubStr(cDatasTotais ,nPosicaoData,8))


            @ 07,20 say 'Senha.:' + cTempSenha 
            @ 08,20 say 'Data..:' + cTempData 

            //calendario
            dTemp    := CToD(cTempData)
            nTempDia := Day(dTemp)
            nTempMes := Month(dTemp)
            nTempAno := Year(dTemp)

            nContador := 1
            nLinha    := 10
            nPrimeiroDiaMeTemp := DoW(CToD('01/'+ Transform(nTempMes,'99')+'/'+Transform(nTempAno,'9999')))
            if nTempMes == 1
                nDiasMesConsulta := 31
            else     
                nDiasMesConsulta := Day(CToD('01/'+ Transform(nTempMes-1,'99') + '/' + Transform(nTempAno,'9999')) - 1)
            endif
            nColuna  := nPrimeiroDiaMeTemp * 3 + 20
            @ nLinha++,23 say ' D  S  T  Q  Q  S  S'

            do while nContador <= nDiasMesConsulta     
                if nColuna >= 44
                    nColuna := 23
                    nLinha++
                endif
                
                @ nLinha,nColuna say Transform(nContador,'99') 
                nColuna += 3
                nContador++
            enddo            
            InKey(0)
        enddo 
    else
        exit
    endif

enddo