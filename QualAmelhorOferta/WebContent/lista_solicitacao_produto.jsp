<!-- #include file="lib\lib.jsp"-->
<table style="width: 100%">
<tr>

<% /* 
loColunas = 3

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

If Request("paNCategoria") <> "" Then

loRS.Open "SELECT NSubCategoria, Nome, NCategoria FROM SubCategorias WHERE NCategoria IN (" & Request("paNCategoria") & ") ORDER BY Nome", loConexao

loContador = 0
While Not loRS.Eof

 */ %>

	<td class="lista_soli">&nbsp;&nbsp;<input name="ChkSub_<% /* =loRS("NCategoria") */ %>_<% /* =loRS("NSubCategoria") */ %>" type="checkbox" value="chk<% /* =loRS("NSubCategoria") */ %>"/>&nbsp;<% /* =loRS("Nome") */ %></td>

<% /* 
		loContador = loContador + 1
		
		If loContador Mod loColunas = 0 Then
			Response.Write "</tr><tr>"
		End If
       loRS.MoveNext
WEnd

loRS.Close
loConexao.Close
End If
Set loRS = Nothing
Set loConexao = Nothing
 */ %>
</tr>	
</table>                                