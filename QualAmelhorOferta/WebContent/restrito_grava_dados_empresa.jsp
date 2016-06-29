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
LoginEmpresa()

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NEmpresa, RazaoSocial, NomeFantasia, Responsavel, Tipo, CNPJ, CPF, CEP, Endereco, Numero, Complemento, Bairro, Estado, Cidade, Telefone, Email, Ativa, UA FROM Empresas WHERE NEmpresa = " & Session("Empresa-NEmpresa"), loConexao, 3, 3

If loRS.Eof Then

	loRS.AddNew

Else

	loNumero = loRS("NEmpresa")

End If

For Each loCampo In loRS.Fields
	If loCampo.Name <> "NEmpresa" Then
		If Request.Form(loCampo.Name) <> "" Then
			loRS(loCampo.Name) = Request.Form(loCampo.Name)
		Else
			loRS(loCampo.Name) = Null
		End If
	End If
Next

loRS("Ativa") = 1
loRS("UA") = Now
loRS.Update
loRS.Close

If Request.Form("NEmpresa") = "0" Then
	loRS.Open "SELECT LAST_INSERT_ID() AS Numero FROM Empresas", loConexao
	loNumero = loRS("Numero")
	loRS.Close
End If

loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing

Response.Redirect "restrito_altera_dados_empresa.jsp?paMsg=Empresa gravada com sucesso."

 */ %>