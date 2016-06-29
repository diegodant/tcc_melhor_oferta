<%-- 
    Document   : restrito_comprador_avaliacao_edita
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<head>
<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type">
</head>

<!-- #include file="lib\lib.asp"-->
<% /* 
LoginUsuario()

If Request("Email") <> "" Then
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loRS.Open "SELECT * FROM Usuarios WHERE NUsuario <>" & Session("Usuario-NUsuario") & " AND Email='" & Request("Email") & "'", loConexao
	
	If loRS.Eof Then
	Else
	Response.Redirect "restrito_altera_dados_comprador.jsp?paMsg=Email já Existe"
	End If
	
loRS.Close
Set loRS = Nothing
Set loConexao = Nothing
End If
 */ %>
<% /* 
If Request("Login") <> "" Then
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loRS.Open "SELECT * FROM Usuarios WHERE NUsuario <>" & Session("Usuario-NUsuario") & " AND Login='" & Request("Login") & "'", loConexao
	
	If loRS.Eof Then
	Else
	Response.Redirect "restrito_altera_dados_comprador.jsp?paMsg=Login já Existe"
	End If
	
loRS.Close
Set loRS = Nothing
Set loConexao = Nothing
End If
 */ %>
<% /* 
If Request("Apelido") <> "" Then
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loRS.Open "SELECT * FROM Usuarios WHERE NUsuario <>" & Session("Usuario-NUsuario") & " AND Apelido='" & Request("Apelido") & "'", loConexao
	
	If loRS.Eof Then
	Else
	Response.Redirect "restrito_altera_dados_comprador.jsp?paMsg=Apelido já Existe"
	End If
	
loRS.Close
loConexao.Close
End If
 */ %>

<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NUsuario, Nome, Apelido, Email, DataNascimento, Sexo, Telefone, Celular, Cep, Endereco, Numero, Complemento, Bairro, Estado, Cidade, Ativo, UA FROM Usuarios WHERE NUsuario = " & Session("Usuario-NUsuario"), loConexao, 3, 3

If loRS.Eof Then

	loRS.AddNew

Else

	loNumero = loRS("NUsuario")

End If

For Each loCampo In loRS.Fields
	If loCampo.Name <> "NUsuario" Then
		If Request.Form(loCampo.Name) <> "" Then
			loRS(loCampo.Name) = Request.Form(loCampo.Name)
		Else
			loRS(loCampo.Name) = Null
		End If
	End If
Next

loRS("Ativo") = 1
loRS("UA") = Now
loRS.Update
loRS.Close

If Request.Form("NUsuario") = "0" Then
	loRS.Open "SELECT LAST_INSERT_ID() AS Numero FROM Usuarios", loConexao
	loNumero = loRS("Numero")
	loRS.Close
End If

loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing

Response.Redirect "restrito_altera_dados_comprador.jsp?paMsg=Usuario gravado com sucesso.&paNUsuario=" & loNumero

 */ %>