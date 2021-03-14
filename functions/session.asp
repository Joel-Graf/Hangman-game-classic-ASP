<%
'________________________________________________________
' Errors - Session("errors")
'--------------------------------------------------------
Sub addError(message)
	Call addItemToDictionary(message, Session("errors"))
End Sub

Sub resetErrors()
	Set Session("errors") = Server.createObject("Scripting.Dictionary")
End Sub

Sub renderErrors()
	For Each error In Session("errors").items
		response.write("<li class='error'>" & error &"</li>")
	Next
End Sub

'________________________________________________________
' Attempts - Session("attempts")
'--------------------------------------------------------
Sub addAttempt(letter)
	Call addItemToDictionary(letter, Session("attempts"))
End Sub

Sub renderAttempts()
	For Each letter In Session("attempts").items
		response.write letter & "  "
	Next
End Sub

'________________________________________________________
' Word Display - Session("wordDisplay")
'--------------------------------------------------------
Sub renderWordDisplay()
	tmpWordDisplay = Session("wordDisplay")
	For i = LBound(tmpWordDisplay) To UBound(tmpWordDisplay)
		response.write " " & tmpWordDisplay(i) & " "
	Next
End Sub

'________________________________________________________
' Lifes - Session("lifes")
'--------------------------------------------------------
Sub removeLife()
	Session("lifes") = (Session("lifes") - 1)
End Sub

%>