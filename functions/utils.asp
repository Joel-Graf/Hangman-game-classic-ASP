<%

Function generateRandomNumber(higherNumber)
	Randomize
	generateRandomNumber = Int(Rnd * (higherNumber + 1))
End Function

Function stringToArray(string)
	size = len(string) - 1
	dim arr() : redim arr(size)
	For i = 0 To size
		arr(i) = Mid(string, i+1, 1)
	Next
	stringToArray = arr
End Function

Function getCharPosInArray (char, arr)
	positionsCSV = ""
	For i = LBound(arr) To UBound(arr)
		If arr(i) = char Then
			positionsCSV = positionsCSV & i & ";"
		End If
	Next
	If positionsCSV <> "" Then
		positionsCSV = Left(positionsCSV, Len(positionsCSV) - 1)
	End If
	getCharPosInArray = split(positionsCSV, ";")
End Function

Function itemExistsInArray (itm, arr)
	For i = LBound(arr) To UBound(arr)
		If arr(i) = itm Then
			itemExistsInArray = true
			Exit Function
		End If
	Next
	itemExistsInArray = false
End Function

Sub addItemToDictionary(itm, dictionary)
	dictionarySize = dictionary.count
	dictionary.add dictionarySize, itm
End Sub

%>