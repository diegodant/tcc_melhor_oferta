<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- #include file="lib\lib.asp"-->

<head>
<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type">
</head>
<% /* 
Set loUP = Server.CreateObject("SoftArtisans.FileUp")
IF loUP.Form("Descricao") = "(Insira aqui uma descrição detalhada sobre o produto ou serviço que está procurando)" OR loUP.Form("Descricao") = "" Then
	
	Response.Redirect "nova_solicitacao.jsp?paMsg=Campo descrição está vazio!"

End If

If loUP.Form("Produto") = "Coloque aqui como titulo o que você está procurando" OR loUP.Form("Produto") = "" Then

	Response.Redirect "nova_solicitacao.jsp?paMsg=Campo Produto/Serviço está vazio!"

End If

loFlag = "False"
For Each loCampo in loUP.Form
		If Left(loCampo, 6) = "ChkSub" Then	
			If loUP.Form(loCampo) <> "" Then
			
				loDados = Split(loCampo, "_")
				loNCategoria = loDados(1)
				loNSubCategoria = loDados(2)
	
			loFlag = "True"				
			End If
		End If
Next


If loFlag = "False" Then
	Response.Redirect "nova_solicitacao.jsp?paMsg=Insira uma Categoria/SubCategoria!!"
End If

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NSolicitacao, NUsuario, Produto, Prazo, Descricao, Status, UA FROM Solicitacoes WHERE NUsuario = " & Session("Usuario-NUsuario"), loConexao, 3, 3

loRS.AddNew

For Each loCampo In loRS.Fields
	If loCampo.Name <> "NSolicitacao" And loCampo.Name <> "NUsuario" Then		
		If loUP.Form(loCampo.Name) <> "" Then
			loRS(loCampo.Name) = loUP.Form(loCampo.Name)
		Else
			loRS(loCampo.Name) = Null
		End If
	End If
Next

loRS("NUsuario") = Session("Usuario-NUsuario")
loRS("Status") = 1
loRS("UA") = Now
loRS.Update
loRS.Close

loRS.Open "SELECT LAST_INSERT_ID() AS Numero FROM Solicitacoes", loConexao
loNumero = loRS("Numero")
loRS.Close



'loRS.Open "SELECT NSolicitacao, NSubCategoria, UA FROM SolicitacaoSubCategorias WHERE NSolicitacao = " & loNumero, loConexao, 3, 3
'For Each loCampo In loUP.Form
'	If Left(loCampo, 7) = "ChkSub_" Then
'
'		loNSubCategoria = Mid(loCampo, InStrRev(loCampo, "_") + 1)
'		loSubCategorias = loSubCategorias & loNSubCategoria & ","
'
'		loRS.AddNew
'		loRS("NSolicitacao") = loNumero
'		loRS("NSubCategoria") = loNSubCategoria
'		loRS("UA") = Now
'		loRS.Update
'	
'	End If
'Next
'loRS.Close
	
	For Each loCampo in loUP.Form
		If Left(loCampo, 6) = "ChkSub" Then
				
			If loUP.Form(loCampo) <> "" Then
				loDados = Split(loCampo, "_")
				loNCategoria = loDados(1)
				loNSubCategoria = loDados(2)
				
				loConexao.Execute "INSERT INTO SolicitacaoSubCategorias (NSolicitacao, NCategoria, NSubCategoria) VALUES (" & loNumero & ", " & loNCategoria & "," & loNSubCategoria & ")"

			End If
		End If
	Next

loMsg = "Imagem gravada com sucesso."
	
If loUP.Form("Arquivo") <> "" Then	
	
	loExtensao = Right(loUP.Form("Arquivo").ShortFileName, 3)

	If loExtensao = "jpg" then
	
	loUP.Path = Application("DirSolicitacao")
	loUP.Form("Arquivo").SaveAs loNumero & "." & loExtensao
	loMsg = "<br>O arquivo foi enviado com sucesso."
	loDir = Application("DirSolicitacao")
	loArquivo = Application("DirSolicitacao") & loNumero & "." & loExtensao
	
	Set Image = Server.CreateObject("csImageFile.Manage") 
		Image.ReadFile loArquivo

		Width = 150
		Height = 150

		Image.ResizeFit  Width, Height
		'Image.Scale 50
		Image.WriteFile loDir & loNumero & "_med.jpg"
	
	Else
		loMsg = "<br>Upload Imagem não está no formato especificado."
	End If

End If



Set loHTTP = Server.Createobject("Dynu.HTTP")
loHTTP.SetFormData "NSolicitacao", loNumero
loHTTP.SetFormData "Produto", loProduto
loHTTP.SetFormData "Descricao", loDescricao
loHTTP.SetURL Application("Site-URL") & "e-mail_solicitacao.jsp"
loHTML = loHTTP.PostURL()

Set loHTTP = Nothing

Set loMailer = Server.CreateObject("SoftArtisans.SMTPMail")
loMailer.RemoteHost = "localhost"
loMailer.FromName = "MelhorOferta.Net" 
loMailer.FromAddress = "contato@melhoroferta.net"
loMailer.Subject = "Uma nova solicitação foi cadastrada"
loMailer.ContentType = "text/html"
loMailer.CharSet = 2

'Response.Write "SELECT DISTINCT E.NEmpresa, NomeFantasia, Email FROM Empresas E INNER JOIN EmpresaCategorias EC ON E.NEmpresa = EC.NEmpresa WHERE E.Ativa = 1 AND NSubCategoria =" & loNSubCategoria
'Response.End
loRS.Open "SELECT DISTINCT E.NEmpresa, NomeFantasia, Email FROM Empresas E INNER JOIN EmpresaCategorias EC ON E.NEmpresa = EC.NEmpresa WHERE E.Ativa = 1 AND NSubCategoria =" & loNSubCategoria, loConexao
While Not loRS.Eof

	loRS2.Open "SELECT NAssinatura FROM Assinaturas WHERE NEmpresa = " & loRS("NEmpresa") & " AND Status = 1 AND  Negociacoes > 0",  loConexao
	If Not loRS2.Eof Then

		If loRS("Email") <> "" And loRS("NomeFantasia") <> "" Then
	
			loHTMLEmail = loHTML
			For Each loCampo In loRS.Fields
				loHTMLEmail = Replace(loHTMLEmail, "***" & loCampo.Name & "***", loRS(loCampo.Name))
			Next
	
			loMailer.ClearRecipients
			loMailer.AddRecipient loRS("NomeFantasia"), loRS("Email")
			loMailer.HTMLText = loHTMLEmail
			loMailer.SendMail
	
		End If

	End If
	loRS2.Close

	loRS.MoveNext
WEnd
loRS.Close

Set loMailer = Nothing

loConexao.Close

Set loRS2 = Nothing
Set loRS = Nothing
Set loConexao = Nothing

Response.Redirect "restrito_minha_solicitacao_comprador.jsp?paMsg=Solicitação gravada com sucesso.&paNSolicitacao=" & loNumero
 */ %>