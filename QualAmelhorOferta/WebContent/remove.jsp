<!-- #include file="lib\lib.jsp" -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

Select Case Request("paTipo")

		
	Case "Assinatura"
		
		loDiretorio = Application("DirEmpresas")
		loFoto = loDiretorio & Session("Empresa-NEmpresa") & "\" & Request("paFoto")
		
		DeletaArq(loFoto)

		loRedir = "restrito_vendedor_atualizar_fotos.jsp?paMsg=Imagem removida com sucesso.&paNEmpresa=" & Session("Empresa-NEmpresa")
		
	Case "Logo"

		loDiretorio = Application("DirEmpresas")
		loLogotipo = loDiretorio & "logo" & Session("Empresa-NEmpresa") & ".jpg"

		DeletaArq(loLogotipo)

		loRedir = "restrito_vendedor_atualizar_logo.jsp?paMsg=Logo removido com sucesso.&paNEmpresa=" & Session("Empresa-NEmpresa")
	


End Select

loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing

Response.Redirect loRedir
 */ %>