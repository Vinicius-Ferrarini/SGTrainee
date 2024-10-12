

clear

nVertical   := 0
nHorizontal := 0



@ 01,01 say "Digite a LINHA  que deseja escrever : "
@ 02,01 say "Digite a COLUNA que deseja escrever : "

@ 01,40 get nHorizontal picture "99" valid nHorizontal >= 0 .and. nHorizontal < 25
@ 02,40 get nVertical   picture "99" valid nVertical   >= 0 .and. nVertical   < 80
read

clear

@ nHorizontal,nVertical say "Teste"

//InKey (0) //pausa pelo tempo determinado ou usuario precionar tecla

