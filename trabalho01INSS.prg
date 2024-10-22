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

do while .t.
   clear
   nQuantidadeFuncionarios := 0
   lProcessar              := .f.
   
   @ 00,40 say 'INSS'
   @ 01,15 say 'Quantidade funcionarios para analise:'
   
   @ 01,52 get nQuantidadeFuncionarios  valid nQuantidadeFuncionarios > 0  picture '9999' 
   read
   if LastKey() == 27
      nOpcao := alert('Deseja sair do programa?' , { 'Sim' , 'Nao' })
      if nOpcao = 1
         exit
      else
         loop
      endif
   endif
   
   nContador := 1
   nLinha    := 3
   do while nContador <= nQuantidadeFuncionarios
      cFuncionarioNome                   := Space(25)
      cFuncionarioSexo                   := Space(1)
      dFuncionarioNascimento             := CToD('')
      dFuncionarioAdmissao               := CToD('')
      dFuncionarioDemissao               := CToD('')
      nFuncionarioSalarioBase            := 0
      nFuncionarioLimiteIRRF             := 0
      nFuncionarioAdicionalNoturno       := 0
      nFuncionarioAdicionalInsalubridade := 0

      @ nLinha,01   say 'Nome......:'
      @ nLinha++,40 say 'Sexo [ ] [M]asculino [F]eminino'
      @ nLinha,01   say 'Nascimento:'
      @ nLinha,40   say 'Admissao:'
      @ nLinha++,60 say 'Demissao:'
      @ nLinha,01   say 'Salario...:'
      @ nLinha++,40 say 'Limite IRRF:'
      @ nLinha,01   say 'Adicional Noturno:  %'
      @ nLinha,40   say 'Adicional Insalubridade:  %'
      
      nLinha-=3
      @ nLinha,12   get cFuncionarioNome                   valid !Empty(cFuncionarioNome)                picture '@!'
      @ nLinha++,46 get cFuncionarioSexo                   valid cFuncionarioSexo $ 'MF'                 picture '@!'
      @ nLinha,12   get dFuncionarioNascimento             valid dFuncionarioNascimento < dDataHoje      
      @ nLinha,49   get dFuncionarioAdmissao               valid dFuncionarioAdmissao   < dDataHoje
      @ nLinha++,69 get dFuncionarioDemissao               valid dFuncionarioDemissao   < dDataHoje
      @ nLinha,12   get nFuncionarioSalarioBase            valid nFuncionarioSalarioBase > 0             picture '999,999.99'
      @ nLinha++,53 get nFuncionarioLimiteIRRF             valid nFuncionarioLimiteIRRF  > 0             picture '999,999.99'
      @ nLinha,19   get nFuncionarioAdicionalNoturno       valid nFuncionarioAdicionalNoturno       >= 0 picture '99'
      @ nLinha,64   get nFuncionarioAdicionalInsalubridade valid nFuncionarioAdicionalInsalubridade >= 0 picture '99'  
      read
      if LastKey() == 27
         nOpcao := Alert('Oque deseja fazer?' , { 'Cancelar' , 'Retomar', 'Processar' })
         if nOpcao == 1
            exit
         elseif nOpcao == 2
            loop
         else
            exit
            lProcessar := .t.
         endif
      endif

      
      InKey(0)
   enddo

enddo