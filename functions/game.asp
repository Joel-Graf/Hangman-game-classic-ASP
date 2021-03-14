<%
'________________________________________________________
' Novo Jogo
'--------------------------------------------------------
Sub resetGame()
	Session("words") = Array("PALAVRA", "SAPO", "COMPUTADOR", "TESTES", "CARRO", "LIVRO", "BANANA", "ASP")
	selectedWord = stringToArray(getRandomWord())
	Session("word") = selectedWord
	Session("wordDisplay") = hideWord(selectedWord)
	Session("lifes") = 5
	Set Session("attempts") = Server.createObject("Scripting.Dictionary")
	resetErrors()
	Session("start") = now()
End Sub

Function getRandomWord()
	arrSize = UBound(Session("words"))
	wordPosition = generateRandomNumber(arrSize)
	getRandomWord = Session("words")(wordPosition)
End Function

Function hideWord(charArray)
	copyArray = charArray
	For i = LBound(charArray) To UBound(charArray)
		copyArray(i) = "_"
	Next
	hideWord = copyArray
End Function

'________________________________________________________
' Jogo em Andamento
'--------------------------------------------------------
Sub game(input)
	checkGameStatus()
	resetErrors()
	If Not isValidInput(input) Then
		Exit Sub
	End If
	addAttempt(input)
	letterPositions = getCharPosInArray(input, Session("word"))
	letterExists = (Ubound(letterPositions) <> -1)
	If letterExists Then
		Call showLetterInPositions(input, letterPositions)
	Else
		removeLife()
	End If
End Sub

Sub checkGameStatus()
	If Session("lifes") <= 0 Then
		response.redirect "defeat.asp"
	elseIf wordIsComplete() Then
		response.redirect "victory.asp"
	End If
End Sub

Function wordIsComplete()
	tmpWordDisplay = Session("wordDisplay")
	wordIsComplete = Not itemExistsInArray("_", tmpWordDisplay)
End Function

Function isValidInput(input)
	If input = "" Or isRepeatedAttempt(input) Then
		isValidInput = false
	Else
		isValidInput = true
	End If
End Function

Function isRepeatedAttempt(attempt)
	If itemExistsInArray(attempt, Session("attempts").items) Then
		Call addError("Letra " & attempt & " já foi inserida!")
		isRepeatedAttempt = true
	Else
		isRepeatedAttempt = false
	End If
End Function

Sub showLetterInPositions(letter, posArr)
	tmpWordDisplay = Session("wordDisplay")
	For i = LBound(posArr) To UBound(posArr)
		position = posArr(i)
		tmpWordDisplay(position) = letter
	Next
	Session("wordDisplay") = tmpWordDisplay
End Sub

%>