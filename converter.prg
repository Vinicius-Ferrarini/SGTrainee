clear


nNum  := 5

cTexto := '6'
cNum  := alltrim(str(nNum))

dData :=  date()
cData :=  DToC(dData)


nlinha :=1

@ nlinha++,01 say "O num eh:" + cTexto +' '+ cNum +' '+ cData
