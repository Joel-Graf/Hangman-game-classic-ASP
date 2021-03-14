<!-- #include file = "functions/utils.asp" -->
<!-- #include file = "functions/session.asp" -->
<!-- #include file = "functions/game.asp" -->
<%
	if isEmpty(Session("start")) then
		resetGame()
		response.write "Novo Jogo"
	else
		game(UCase(request.form("input")))
		response.write "Jogo em andamento"
	end if
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="iso885915">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<title>ASP - Jogo da forca</title>
</head>
<body>
	<main class='main'>
		<div class='game'>
			<h1>Jogo da Forca</h1>
			<p>Você chutou <%=Session("attempts").count%> letras diferentes.</p>
			<p>Lista de chutes: <% renderAttempts() %></p>
			<p>Você tem <%=Session("lifes")%> vidas</p>
			<p>Palavra com <%=UBound(Session("word"))+1%> letras.</p>
			<h2 class='game-display'>
				<% renderWordDisplay() %>
			</h2>
		</div>
		<form class='form' action="default.asp" method="post" autocomplete="off">
			<input type="text" id="input" name="input" maxlength="1" placeholder="Insira uma Letra:" required />
			<input type="submit" onclick="validateInput(event)" value="Chutar!" />
		</form>
		<ul class='error-messages'>
			<% renderErrors() %>
		<ul>
		<button class='reset' onclick='resetGame()'>Resetar Jogo!</button>
	</main>
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>