//vinicius reginaldo ferrarini

set date to british
set epoch to 1940
set scoreboard off

set color to ("N/W")
clear

nCodigo    := 0

@ 01,05 say 'Digite o codigo do produto(1 a 15)'

@ 02,05 get nCodigo picture "99"   valid nCodigo > 0 .and. nCodigo < 16
read

if nCodigo = 1
   cCategoria := 'Alemento nao-perec¡vel'

elseif nCodigo < 5
   cCategoria := 'Alemento perec¡vel'

elseif nCodigo < 7
   cCategoria := 'Vestu rio'

elseif nCodigo = 7
   cCategoria := 'Higiene pessoal'

else
   cCategoria := 'Limpeza e utensilios dom‚sticos'
endif

@ 03,10 say cCategoria
