clear

nInteiro            := 0
nFloat              := 0
nPositivo           := 0
nNegativo           := 0
nMaior1000Menor5000 := 0
nNaoZero            := 0

@ 01,01 say "Numero inteiro               : "
@ 02,01 say "Numero float                 : "
@ 03,01 say "Numero positivo              : "
@ 04,01 say "Numero negativo              : "
@ 05,01 say "Numero maior 1000 menor 5000 : "
@ 06,01 say "Numero nao zero              : "

@ 01,32 get nInteiro             picture "99999"
@ 02,32 get nFloat               picture "@E 99.99"
@ 03,32 get nPositivo            picture "@E 99.99" valid nPositivo >= 0
@ 04,32 get nNegativo            picture "@E 99.99" valid nNegativo <  0
@ 05,32 get nMaior1000Menor5000  picture "@E 99999" valid nMaior1000Menor5000 >=1000 .and. nMaior1000Menor5000 <= 5000
@ 06,32 get nNaoZero             picture "@E 99999" valid !empty(nNaoZero)

read

@ 07,01 say "--------------------------------------------------------------------------------"


