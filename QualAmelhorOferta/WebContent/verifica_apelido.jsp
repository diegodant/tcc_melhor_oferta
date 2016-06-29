<% /* 

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

If Request("Apelido") <> "" Then

	loRS.Open "SELECT NUsuario, Apelido FROM Usuarios WHERE Apelido='" & Request("Apelido") & "'", loConexao

	If Not loRS.Eof Then
	
		Response.Write "nao"
	
	
	Else
		
		Response.Write "ok"	
			
	End If

	loRS.Close
End If

loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>
