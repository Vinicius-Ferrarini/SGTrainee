//idade maior que 21

clear

nIdade := 0

@ 00,00 to 05,79 //borda



@ 02,30 say "Idade maior que 21?"
@ 03,01 say "Digite sua idade : "

@ 03,20 get nIdade picture "999" valid nIdade >= 0

read

@ 02,35 clear to 02,40 //limpa entre o espaco

if nIdade > 21
   @ 04,05 say "Idade MAIOR que 21!"
else
   @ 04,05 say "Idade MENOR que 21!"
endif
