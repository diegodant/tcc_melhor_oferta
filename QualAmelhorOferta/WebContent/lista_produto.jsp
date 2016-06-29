<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- #include file="lib\lib.asp"-->
<table style="width: 100%">
<tr>
<% /* 
loColunas = 3

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

If Request("paNCategoria") <> "" Then

loRS.Open "SELECT NSubCategoria, Nome, NCategoria FROM SubCategorias WHERE NCategoria IN (" & Request("paNCategoria") & ")", loConexao

loContador = 0
loContSC = 0
While Not loRS.Eof

loCheck = ""
		loRS2.Open "SELECT NCategoria, NSubCategoria FROM EmpresaCategorias WHERE NSubCategoria=" & loRS("NSubCategoria") & " AND NEmpresa=" & Session("Empresa-NEmpresa"), loConexao
		
		If NOT loRS2.EOF Then
			loContSC = loContSC + 1
			loCheck = "checked=""checked"""
		End IF
		loRS2.Close


 */ %>

	<td>&nbsp;&nbsp;<input name="ChkSub_<% /* =loRS("NCategoria") */ %>_<% /* =loRS("NSubCategoria") */ %>" <% /* =loCheck */ %> type="checkbox" value="chk<% /* =loRS("NSubCategoria") */ %>" onclick="CheckSC(this)"/>&nbsp;<% /* =loRS("Nome") */ %></td>

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
Set loRS2 = Nothing
Set loRS = Nothing
Set loConexao = Nothing
 */ %>
</tr>	
</table>
