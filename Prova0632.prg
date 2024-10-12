//Joao Vitor Rodrigues Thomaz

Clear

Do While .t.
	Clear

	//Variaveis
	cNomeJogador 	:= Space(30)
	cPalavra		 	:= Space(46)
	cCategoria	 	:= Space(10)
	cDica1		 	:= Space(50)
	cDica2		   := Space(50)
	cDica3		   := Space(50)
	cLetraDigitada := ""
	nTamanhoPalavra:= 0
	nColuna			:= 35
	cLetraDaPalavra:= ""

	//Alerts
	nFinalizar   := 0
	nLetraErrada := 0
	nFimDeJogo	 := 0

	//Datas
   dAtual      := Date()
   nMes        := Month(dAtual)
   nAno        := Year (dAtual)
   nDiaSemana  := DoW  (dAtual)
   cMesExtenso := ""
   cSemanaExt  := ""

   //If para data cabecalho
   If nMes     == 1
      cMesExtenso := "Janeiro"

   Elseif nMes == 2
      cMesExtenso := "Fevereiro"

   Elseif nMes == 3
      cMesExtenso := "Marco"

   Elseif nMes == 4
      cMesExtenso := "Abril"

   Elseif nMes == 5
      cMesExtenso := "Maio"

   Elseif nMes == 6
      cMesExtenso := "Junho"

   Elseif nMes == 7
      cMesExtenso := "Julho"

   Elseif nMes == 8
      cMesExtenso := "Agosto"

   Elseif nMes == 9
      cMesExtenso := "Setembro"

   Elseif nMes == 10
      cMesExtenso := "Outubro"

   Elseif nMes == 11
      cMesExtenso := "Novembro"

   Elseif nMes == 12
      cMesExtenso := "Dezembro"

   Endif

   If nDiaSemana == 1
      cSemanaExt := "Domingo"

   Elseif nDiaSemana == 2
      cSemanaExt := "Segunda-Feira"

   Elseif nDiaSemana == 3
      cSemanaExt := "Terca-Feira"

   Elseif nDiaSemana == 4
      cSemanaExt := "Quarta-Feira"

   Elseif nDiaSemana == 5
      cSemanaExt := "Quinta-Feira"

   Elseif nDiaSemana == 6
      cSemanaExt := "Sexta-Feira"

   Elseif nDiaSemana == 7
      cSemanaExt := "Sabado"

   Endif

   @ 01,02 say "Joao Vitor Rodrigues Thomaz"
   @ 02,02 to 24,79 double
   @ 03,04 to 06,77
	@ 09,03 to 09,78 double
	@ 11,03 to 11,78 double
	@ 13,03 to 13,78 double

   @ 04,26 say Alltrim( cSemanaExt ) + "   " + Alltrim( cMesExtenso ) + " / " + Transform( nAno, '9999' )
	@ 08,34 say "JOGO DA FORCA"
	@ 10,05 say "NOME...............: "
	@ 12,35 say "DIFICULDADE"

	@ 10,26 get cNomeJogador picture '@!' valid !Empty( cNomeJogador )
	Read

	Set message to 23 center

   @ 15,38 prompt "Facil"   message "Jogo com ate 3 Dicas a cada 2 erros!"
   @ 17,38 prompt "Medio"   message "Jogo em uma dificuldade mais elevada e sem dicas!"
   @ 19,38 prompt "Dificil" message "Jogo para veteranos em Forca!"

	Menu to nOpcao
   
	@ 22,58 say "Para sair aperte ESC."

   Inkey(0.3)

   If lastkey() == 27
		nFinalizar := Alert( "Deseja Sair do Jogo? ", { "Sim", "Nao" }, 'N/W' )
      
		If nFinalizar == 1
          Exit
      Else
          Loop
      Endif
   Endif

	@ 12,35 clear to 12,78
	@ 15,03 clear to 19,78

	@ 12,37 say "PALAVRA"
	@ 15,05 say "Palavra....: "
	@ 20,05 say "Categoria..: "

   If nOpcao == 1
		@ 17,05 say "Dica 1.....: "
		@ 18,05 say "Dica 2.....: "
		@ 19,05 say "Dica 3.....: "

		@ 15,18 get cPalavra   picture '@!' valid !Empty( cPalavra )		
		@ 17,18 get cDica1     picture '@!' valid !Empty( cDica1 )
		@ 18,18 get cDica2     picture '@!' valid !Empty( cDica2 )
		@ 19,18 get cDica3     picture '@!' valid !Empty( cDica3 )
		@ 20,18 get cCategoria picture '@!' valid !Empty( cCategoria )
		Read
		
	   Inkey(0.3)

	   If lastkey() == 27
			nFinalizar := Alert( "Deseja Sair do Jogo? ", { "Sim", "Nao" }, 'N/W' )
	
			If nFinalizar == 1
	          Exit
	      Else
	          Loop
	      Endif
	   Endif

	Elseif nOpcao == 2
		@ 15,18 get cPalavra   picture '@!' valid !Empty( cPalavra )
		@ 20,18 get cCategoria picture '@!' valid !Empty( cCategoria )
		Read

	Elseif nOpcao == 3
		@ 15,18 get cPalavra   picture '@!' valid !Empty( cPalavra )
		@ 20,18 get cCategoria picture '@!' valid !Empty( cCategoria )
		Read

	Endif

	nTamanhoPalavra := Len( Alltrim( cPalavra ) )
	
	Clear
	Do While .t.

	   @ 01,02 say "Joao Vitor Rodrigues Thomaz"
   	@ 02,02 to 24,79 double	
		
		//Variaveis
		cLetra := Space(1)

		@ 04,03 to 04,78 double

		@ 03,34 say "JOGO DA FORCA"
		@ 06,05 say "Palavra....: " + Alltrim( cPalavra )
		@ 07,05 say "Categoria..: " + Alltrim( cCategoria )
		@ 06,55 say "A" + "B" + "C" + "D" + "E" + "F" + "G" + "H" + "I" + "J" + "K" + "L" + "M"
		@ 07,55 say "N" + "O" + "P" + "Q" + "R" + "S" + "T" + "U" + "V" + "W" + "X" + "Y" + "Z"
		@ 09,05 say "Letra......: "
		@ 09,45 say "*Palavra com " + Alltrim( Transform( nTamanhoPalavra, '99' ) ) + " Letras."

		@ 09,18 get cLetra picture '@!' valid !Empty( cLetra )
		Read

		If cLetraDigitada $cLetra
			nLetraErrada := Alert( "Letra ja digitada", { "Ok" }, 'N/R' )
			Loop
		Endif

		If cLetra $cPalavra
			nContagem := 1
			Do While nContagem < nTamanhoPalavra
			
				cLetraDaPalavra := SubStr( cPalavra, nContagem++, 1 )
				If cLetra = cLetraDaPalavra
					@ 15,nColuna say cLetraDaPalavra
				Else 
					nColuna++
				Endif
				
				Inkey(0)
			Enddo
		Endif

		cLetraDigitada += cLetra
	
	   If lastkey() == 27
			nFinalizar := Alert( "Deseja Sair do Jogo? ", { "Sim", "Nao" }, 'N/W' )
	
			If nFinalizar == 1
	          Exit
	      Else
	          Loop
	      Endif
	   Endif

		Inkey(0)
	Enddo	

	If nFinalizar == 1
	   Exit
	Endif

	nFimDeJogo :=Alert( "Deseja Jogar novamente? ", { "Sim", "Nao" }, 'N/W' )

	If nFimDeJogo == 1
	   Loop
	Else
	   Exit
	Endif
Enddo