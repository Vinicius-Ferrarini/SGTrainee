//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off
setmode(25,80)


dDataHoje    := date()
nDiaAtual    := Day(dDataHoje)
nMesAtual    := Month(dDataHoje)
nAnoAtual    := Year(dDataHoje)
nSemanaAtual := DoW(dDataHoje)
cCorVermelho := 'W/R'
cCorVerde    := 'W/G'

//cabecalho
cVendedorNome  := Space(30)
dDataCotacao   := dDataHoje

//pessoais
cClienteNome   := Space(30)
nClienteIdade  := 0
cClienteSexo   := Space(1)
nClienteAnoCNH := 0 

//dados veiculos
cVeiculoMarca         := Space(20)
nVeiculoAnoFabricacao := 0
cVeiculoTipo          := Space(1)
nVeiculoMotor         := 0
nVeiculoValorFipe     := 0
cVeiculoUso           := Space(1)

//inserir dados

nLinha := 1
Clear
@ 00,00 to 24,79 double
@ nLinha,05   say 'Nome vendedor:' 
@ nLinha++,50 say 'Data cotacao....:'

@ nLinha,01 to nLinha++,78 double
@ nLinha,05   say 'Nome Cliente.:'
@ nLinha++,50 say 'Idade...........:'
@ nLinha,05   say 'Sexo [ ] [M]Masculino [F]Feminimno'
@ nLinha++,50 say 'Ano Primeira CNH:'

@ nLinha,01 to nLinha++,78 double
@ nLinha,05   say 'Marca........:'
@ nLinha++,50 say 'Ano Fabricacao..:'
@ nLinha,05   say 'Tipo [ ] [P]Passeio [E]Esportivo [L]Luxo'
@ nLinha++,50 say 'Motor...........:'
@ nLinha,05   say 'Uso  [ ] [P]Particular [O]Profissional'
@ nLinha,50   say 'Tabela Fipe.....:'

nLinha -= 7
@ nLinha,19   get cVendedorNome  valid !Empty(cVendedorNome) picture '@!'
@ nLinha++,67 get dDataCotacao   valid !Empty(dDataCotacao)

nLinha++
@ nLinha,19   get cClienteNome   valid !Empty(cClienteNome)                             picture '@!'
@ nLinha++,67 get nClienteIdade  valid nClienteIdade >= 18                              picture '999'
@ nLinha,11   get cClienteSexo   valid cClienteSexo $ 'MF'                              picture '@!'
@ nLinha++,67 get nClienteAnoCNH valid nClienteIdade - 18 >= nAnoAtual - nClienteAnoCNH .and. nClienteAnoCNH <= nAnoAtual picture '9999'

nLinha++
@ nLinha,19   get cVeiculoMarca          valid !Empty(cVeiculoMarca)               picture '@!'
@ nLinha++,67 get nVeiculoAnoFabricacao  valid nVeiculoAnoFabricacao <= nAnoAtual  picture '9999'
@ nLinha,11   get cVeiculoTipo           valid cVeiculoTipo $ 'PEL'                picture '@!'
@ nLinha++,67 get nVeiculoMotor          valid nVeiculoMotor > 0                   picture '9.9'
@ nLinha,11   get cVeiculoUso            valid cVeiculoUso $ 'PO'                  picture '@!'
@ nLinha++,67 get nVeiculoValorFipe      valid nVeiculoValorFipe > 0               picture '@E 9,999,999.99'
read

nVeiculoIdade         := nAnoAtual - nVeiculoAnoFabricacao
nClienteAnoHabilitado := nAnoAtual - nClienteAnoCNH
nMesCotacao           := Month(dDataCotacao)
nAnoCotacao           := Year(dDataCotacao)

nValorBase1 := nVeiculoValorFipe * 0.06
nValorBase2 := nVeiculoValorFipe * 0.07


//valor seguro fipe
nValorSeguradora1 := nValorBase1
nValorSeguradora2 := nValorBase2

//idade
if nClienteIdade < 25 .and. nClienteIdade > 65
   nValorSeguradora1 += nValorBase1 * 0.10
endif

if nClienteIdade < 23 .and. nClienteIdade > 60
   nValorSeguradora2 += nValorBase2 * 0.15
endif
if nClienteIdade >= 30 .and. nClienteIdade <= 50
   nValorSeguradora2 -= nValorBase2 * 0.08
endif

//sexo

if cClienteSexo == 'M'
   nValorSeguradora1 += nValorBase1 * 0.10
   nValorSeguradora2 -= nValorBase2 * 0.06
else
   nValorSeguradora1 -= nValorBase1 * 0.05
   nValorSeguradora2 += nValorBase2 * 0.12
endif

//tempo habilitado
if nClienteAnoHabilitado <= 3
   nValorSeguradora1 += nValorBase1 * 0.15
endif
if nClienteAnoHabilitado > 8
   nValorSeguradora1 -= nValorBase1 * 0.10
endif

if nClienteAnoHabilitado <= 2
   nValorSeguradora2 += nValorBase2 * 0.20
endif
if nClienteAnoHabilitado > 5
   nValorSeguradora2 -= nValorBase2 * 0.08
endif

//tipo veiculo
if cVeiculoTipo == 'E'
   nValorSeguradora1 += nValorBase1 * 0.10
   nValorSeguradora2 += nValorBase2 * 0.15
elseif cVeiculoTipo == 'L'
   nValorSeguradora1 += nValorBase1 * 0.15
   nValorSeguradora2 += nValorBase2 * 0.18
endif

//tamanho motor
if nVeiculoMotor > 2
   nValorSeguradora1 += nValorBase1 * 0.15
   nValorSeguradora2 += nValorBase2 * 0.10
elseif nVeiculoMotor > 1.5
   nValorSeguradora2 += nValorBase1 * 0.10
endif

//idade veiculo
if nVeiculoIdade >= 10
   nValorSeguradora1 += nValorBase1 * 0.10
   nValorSeguradora2 += nValorBase2 * 0.08
elseif nVeiculoAnoFabricacao > 0 
   nValorSeguradora1 += nValorBase1 * 0.005 * nVeiculoIdade
   nValorSeguradora2 += nValorBase2 * 0.008 * nVeiculoIdade
endif

//veiculo uso
if cVeiculoUso == 'O'
   nValorSeguradora1 += nValorBase1 * 0.10
   nValorSeguradora2 += nValorBase2 * 0.12
endif

//mes cotacao
if nMesCotacao == 1
   cMesCotacao := 'Janeiro'
elseif nMesCotacao == 2
   cMesCotacao := 'Fevereiro'
elseif nMesCotacao == 3
   cMesCotacao := 'Marco'
   nValorSeguradora1 -= nValorBase1 * 0.10
elseif nMesCotacao == 4
   cMesCotacao := 'Abril'
elseif nMesCotacao == 5
   cMesCotacao := 'Maio'
elseif nMesCotacao == 6
   cMesCotacao := 'Junho'
elseif nMesCotacao == 7
   cMesCotacao := 'Julho'
elseif nMesCotacao == 8
   cMesCotacao := 'Agosto'
elseif nMesCotacao == 9
   cMesCotacao := 'Setembro'
   nValorSeguradora2 -= nValorBase2 * 0.08
elseif nMesCotacao == 10
   cMesCotacao := 'Outubro'
elseif nMesCotacao == 11
   cMesCotacao := 'Novembro'
else
   cMesCotacao := 'Dezembro'
endif


if nMesCotacao == 12
   nDiasMesCotacao := 31
else
   dDataCotacaoProximoMes := CToD('01/' + Transform(nMesCotacao+1,'99') + '/' + Str(nAnoCotacao))
   nDiasMesCotacao        := Day(dDataCotacaoProximoMes-1)
endif

cCotacaoValida := 'Cotacao valida ate ' + Str(nDiasMesCotacao) + ' de ' + cMesCotacao + ' de ' + Str(nAnoCotacao)

//valor
if nValorSeguradora1 > nValorSeguradora2
   cCorSeguradora1 := cCorVermelho
   cCorSeguradora2 := cCorVerde
else
   cCorSeguradora1 := cCorVerde
   cCorSeguradora2 := cCorVermelho
endif

nValorAnual1     := nValorSeguradora1
nValorTrimestre1 := nValorAnual1     / 4
nValorMensal1    := nValorTrimestre1 / 3

nValorAnual2     := nValorSeguradora2
nValorTrimestre2 := nValorAnual2     / 4
nValorMensal2    := nValorTrimestre2 / 3

//mostra dados
@ nLinha,01 to nLinha++,78 double
@ nLinha,01 to nLinha+6,39 double
@ nLinha,40 to nLinha+6,78 double

nLinha++


set color to (cCorSeguradora1)

@ nLinha,02 clear to nLinha+4,38
@ nLinha++,02 say 'Seguradora James Bond' 
@ nLinha,02 to nLinha++,38 double         
@ nLinha++,02 say 'Mensal.....:' + Transform(nValorMensal1   ,'@E 9,999,999.99') 
@ nLinha++,02 say 'Trimestral.:' + Transform(nValorTrimestre1,'@E 9,999,999.99') 
@ nLinha  ,02 say 'Anual......:' + Transform(nValorAnual1    ,'@E 9,999,999.99') 

nLinha -= 4
set color to (cCorSeguradora2)
@ nLinha,41 clear to nLinha+4,77
@ nLinha++,41 say 'Seguradora Magaiver' 
@ nLinha,41 to nLinha++,77 double      
@ nLinha++,41 say 'Mensal.....:' + Transform(nValorMensal2   ,'@E 9,999,999.99')
@ nLinha++,41 say 'Trimestral.:' + Transform(nValorTrimestre2,'@E 9,999,999.99') 
@ nLinha++,41 say 'Anual......:' + Transform(nValorAnual2    ,'@E 9,999,999.99')

set color to w/0

@ ++nLinha,01 say cCotacaoValida

InKey(0)





















