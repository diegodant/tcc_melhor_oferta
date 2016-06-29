<!-- #include file="lib\lib.asp"-->
<% /* 

Select Case Request("paTipo")

	Case "Assinatura"
		loFoto = Application("DirEmpresas") & Session("Empresa-NEmpresa") & "\" & Request("paFoto")
	
	Case "Logo"
		loFoto = Application("DirEmpresas") & Request("paFoto")

	Case "Solicitacao"
		loFoto = Application("DirSolicitacao") & Request("paFoto")
		
'Response.Write loFoto
'Response.End
End Select

Set Image = Server.CreateObject("csImageFile.Manage") 
If ExisteArq(loFoto) Then
	Image.ReadFile loFoto
End If


If Request("paPorcent") <> "" And IsNumeric(Request("paPorcent")) Then
	loPorcent = CInt(Request("paPorcent"))
Else
	loPorcent = 100
End If

Image.Scale loPorcent
Response.ContentType = "image/jpeg" 
Response.BinaryWrite Image.JPGData 

Set Image = Nothing
 */ %>