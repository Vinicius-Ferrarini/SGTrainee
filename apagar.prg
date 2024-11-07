//CESAR GIORI RODRIGUES LOPES
setmode (25,80)
set epoch to 1940
set date brit
set message to 23 center
set wrap on

clear

lSair        := .f.
nCodigo      := 1
cGuardaSenha := ' '
cGuardaData  := ' '
cEspeciais   := '!|@|#|$|%|¨|&|*|(|)|_'
cMaisculo    := 'Q|W|E|R|T|Y|U|I|O|P|A|S|D|F|G|H|J|K|L|Z|X|C|V|B|N|M'
cMinusculo   := 'q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m'
cNumerico    := '7|8|9|4|5|6|1|2|3|0'
nTentiva     := 0
nOpcao       := 0

do while !lSair
    
    clear
    
    nModulo := 0
    nDiaCalendario := 1

    @ 00,00 to 24,79 double
    @ 02,01 to 02,78 double
    @ 22,01 to 22,78 double

    @ 01,29 say "GERENCIADOR DE SENHAS"
    @ 03,34 prompt "Cadastrar" message 'Cadastrar Senhas'
    @ 04,34 prompt "Consultar" message 'Consulta Senhas'
    @ 05,34 prompt "Sair     " message 'Sair do Programa'
    menu to nOpcao

    if nOpcao = 0
        nOpcao := 3
    endif
    
    do while nOpcao = 1 .and. nCodigo < 100

        clear

        @ 01,32 say "CADASTRA SENHAS"
        @ 00,00 to 24,79 double
        @ 02,01 to 02,78 double
        @ 22,01 to 22,78 double

        nValidSeguraca := 0
        cSenhas       := Space(12)
        dCadastro     := CToD('')

        @ 03,02 say "Codigo.........: " + AllTrim(Str(nCodigo))
        @ 04,02 say "Senha..........: "
        @ 05,02 say "Data Cadastro..: "

        @ 04,19 get cSenhas   valid !Empty(cSenhas)
        @ 05,19 get dCadastro valid !Empty(dCadastro)
        read
        
        if LastKey() == 27
            nOpcao := Alert('Voltar para o menu?', {'Sim', 'Nao'})
            if nOpcao = 1
                exit
            endif
            loop
        endif

        cSenhas  := AllTrim(cSenhas)
        nTamanho := Len(cSenhas)

        nContador := 1
        do while nContador <= nTamanho 
            cTemp := SubStr(cSenhas,nContador,1)
            if cTemp $ cMaisculo
                nValidSeguraca++
                exit
            endif
            nContador++
        enddo

        nContador := 1
        do while nContador <= nTamanho 
            cTemp := SubStr(cSenhas,nContador,1)
            if cTemp $ cMinusculo
                nValidSeguraca++
                exit
            endif
            nContador++
        enddo

        nContador := 1
        do while nContador <= nTamanho 
            cTemp := SubStr(cSenhas,nContador,1)
            if cTemp $ cNumerico
                nValidSeguraca++
                exit
            endif
            nContador++
        enddo

        nContador := 1
        do while nContador <= nTamanho 
            cTemp := SubStr(cSenhas,nContador,1)
            if cTemp $ cEspeciais
                nValidSeguraca++
                exit
            endif
            nContador++
        enddo

        if nTamanho < 7
            Alert('Senha deve conter no minimo 8 caracteres')
            loop
        endif 

        if nValidSeguraca < 4
            Alert('Senha FRACA')
            nTentiva++
            if nTentiva > 1
                Alert('A senha deve conter pelo menos, 1 caracter: Numeral, Especial, Minusculo e Maiusculo.')
            endif
            loop
        else
            cSenhas := PadR(cSenhas, 12)
            cDatas := DToC(dCadastro)
            cGuardaSenha += cSenhas
            cGuardaData  += PadR(cDatas, 9)
            nCodigo++
        endif
    enddo

    do while nOpcao = 2

        nCodigoConsulta := 0
        nLinha          := 8
        nDiaCadastro    := 0
        nDiaCalendario  := 0

        clear

        @ 01,32 say "CONSULTA SENHAS"
        @ 00,00 to 24,79 double
        @ 02,01 to 02,78 double
        @ 22,01 to 22,78 double

        if nCodigo == 1
            Alert('Sem senhas cadastradas')
            exit
        endif

        @ 03,02 say "Codigo.........: "
        @ 03,20 get nCodigoConsulta picture "999" valid nCodigoConsulta > 0
        read

        if LastKey() == 27
            nOpcao := Alert('Voltar para o menu?', {'Sim', 'Nao'})
            if nOpcao = 1
                exit
            endif
            loop
        endif

        if nCodigoConsulta >= nCodigo
            Alert('Codigo invalido')
            loop
        endif

        nLocalSenha     := ((nCodigoConsulta*12)-11)
        nLocalData      := ((nCodigoConsulta*9)-8)
        cSenha          := SubStr(cGuardaSenha, nLocalSenha, 12)
        cData           := SubStr(cGuardaData, nLocalData, 9)
        cSenha          := AllTrim(cSenha)
        cData           := AllTrim(cData)
        dCadastro       := CToD(cData)
        nAnoCadastro    := Year(dCadastro)
        nMesCadastro    := Month(dCadastro)
        nDiaCadastro    := Day(dCadastro)
        dProximoMes     := CToD(Str(01) + '/' + Transform(nMesCadastro+1,'99') + '/' + Str(nAnoCadastro))
        nUltimoDiaMes   := Day(dProximoMes-1)
        if nMesCadastro == 12
            nUltimoDiaMes := 31
        endif

        @ 04,02 say "Senha..........: " + cSenha
        @ 05,02 say "Data Cadastro..: " + cData
        @ 07,29 say " D  S  T  Q  Q  S  S "
        nColuna := 26
        nEspacamento := 3
        nDiaCalendario := 1
        //Alert(cData)
        //Alert(cSenha)
        do while nDiaCalendario <= nUltimoDiaMes
            //Alert('entrou no while')

            @ 06,27 to 14,50 double
            
            cCalendario    := Alltrim(Str(nDiaCalendario)) + '/' + Alltrim(Str(nMesCadastro)) + '/' + Alltrim(Str(nAnoCadastro))
            dCalendario    := CToD (cCalendario)
            nDiaSemana     := DoW(dCalendario)
            cDiaCalendario := Transform(nDiaCalendario, '99')
            
            if nDiaCalendario == nDiaCadastro
               cCor := 'N/W'
            else
               cCor := 'W/N'
            endif

            if nDiaSemana <= 6
                @ nLinha, nColuna + (nEspacamento * nDiaSemana) say cDiaCalendario color cCor
                nDiaCalendario++
            elseif nDiaSemana == 7
                @ nLinha, nColuna + (nEspacamento * nDiaSemana) say cDiaCalendario color cCor
                nDiaCalendario++
                nLinha++
            endif
            /*
            if nDiaSemana == 1
               @ nLinha,29 say cDiaCalendario color cCor
            elseif nDiaSemana == 2
               @ nLinha,32 say cDiaCalendario color cCor
            elseif nDiaSemana == 3
               @ nLinha,35 say cDiaCalendario color cCor
            elseif nDiaSemana == 4
               @ nLinha,38 say cDiaCalendario color cCor
            elseif nDiaSemana == 5
               @ nLinha,41 say cDiaCalendario color cCor
            elseif nDiaSemana == 6
               @ nLinha,44 say cDiaCalendario color cCor
            elseif nDiaSemana == 7
               @ nLinha,47 say cDiaCalendario color cCor
            endif
            if nDiaSemana == 7
               nLinha++
            endif       
              nDiaCalendario++
                          */
        enddo


        @ 23,02 say "Tecle qualquer tecla para finalizar!"
        inkey(0)
        //exit

    enddo

    do while nOpcao = 3
            nOpcao := Alert("Sair do programa?", {"Sim", "Nao"})
            if nOpcao == 1                    
                lSair := .t.
                clear
                exit
            endif
            nOpcao := 1
            loop
    enddo
enddo