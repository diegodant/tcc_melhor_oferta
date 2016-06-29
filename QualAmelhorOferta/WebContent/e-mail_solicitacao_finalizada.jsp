<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% /* 
loCondicoes = " WHERE NSolicitacao = " & Request("NSolicitacao")

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loRS.Open "SELECT Produto, Descricao FROM Solicitacoes WHERE NSolicitacao = " & Request("NSolicitacao"), loConexao
If Not loRS.Eof Then
	loProduto = loRS("Produto")
	loProdutoDescricao = Replace(loRS("Descricao"), vbCrLf, "<br>")
End if
loRS.Close	

loRS.Open "SELECT NSolicitacao, NUsuario, Produto, Descricao, Status FROM Solicitacoes" & loCondicoes, loConexao
If loRS.Eof Then
	Response.Write "Solicitação não encontrada."
Else

	loRS2.Open "SELECT RazaoSocial, CEP, NomeFantasia, Descricao, Endereco, Numero, Complemento, Bairro, Cidade, Estado, Responsavel, Telefone, Email FROM Empresas WHERE NEmpresa = " & Request("NEmpresa"), loConexao
	If loRS2.Eof Then
		loNomeFantasia = "Empresa não encontrada no sistema"
	Else	
		For Each loCampo In loRS2.Fields
			Execute "lo" & loCampo.Name & " = loRS2(""" & loCampo.Name & """)"
		Next			
		If loRS2("Descricao") <> "" Then
			loDescricaoEmpresa = Replace(loRS2("Descricao"), vbCrLf, "<br>")
		End If			
	End If
	loRS2.Close

End If

loRS.Close
'loConexao.Close

'Set loRS2 = Nothing
'Set loRS = Nothing
'Set loConexao = Nothing
 */ %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Melhor Oferta</title>
<style type="text/css">
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #052B80;
}
</style>
</head>

<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="150"><img src="http://www.melhoroferta.net/home/imagens/topo/logo.jpg" width="150" height="126" alt="Melhor Oferta.net" /></td>
                <td width="340" align="center"><img src="http://www.melhoroferta.net/home/imagens/titu_detalhes_email2.jpg" width="312" height="27" /></td>
                <td><img src="http://www.melhoroferta.net/home/imagens/melhor_oferta/sacola_melhor.jpg" width="223" height="222" alt="Melhor Oferta" /></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td>&nbsp;</td>
</tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#FF9900"  size="4"><font style="font-weight:bold">Dados do Produto</font></font></td>
  </tr>
   
  <tr>
    <td>&nbsp;</td>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#FF0000" size="4">
	<font style="font-weight:bold"><% /* =loProduto */ %></font></font></td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =loProdutoDescricao */ %></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#FF9900"  size="4"><font style="font-weight:bold">Interações da Solicitação</font></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  
    <!--Inicio Teste-->
<% /*   
loRS2.Open "SELECT NInteracao, Apelido, NomeFantasia, E.NPlano, I.Valor, I.NEmpresa, I.NUsuario, Texto, I.UA FROM (Interacoes I LEFT JOIN Empresas E ON I.NEmpresa = E.NEmpresa) LEFT JOIN Usuarios U ON I.NUsuario = U.NUsuario WHERE NSolicitacao = " & Request("NSolicitacao") & " ORDER BY I.UA DESC" & loLimite, loConexao
	While Not loRS2.Eof 
 */ %>	
 
    <td ><!--Inicio Linha de Caracteristicas-->
                  <ul style="margin-bottom:25px;">
							<li style="list-style:none;">
								<font face="Arial, Helvetica, sans-serif" color="#333"  size="2"><font style="font-weight:bold">Data da Interação: <% /* =loRS2("UA") */ %></font></font> <br/>
								<% /* 
								 If loRS2("NEmpresa") <> "" Then 
								 */ %>
                                	<font face="Arial, Helvetica, sans-serif" color="#052B80"  size="2"><font style="font-weight:bold">Responsável Pela Interação:	<b><% /* =loRS2("NomeFantasia") */ %></b></font></font>
                                <% /* 
                                Else
                                 */ %>
                                	<font face="Arial, Helvetica, sans-serif" color="#052B80"  size="2"><font style="font-weight:bold">Responsável Pela Interação:	<b><% /* =loRS2("NomeFantasia") */ %></b></font></font>
                                <% /* 
                                End If
                                 */ %>
                              </li>

							  <li  style="list-style:none;">
                                <p><font face="Arial, Helvetica, sans-serif" color="#333"  size="2"><font style="font-weight:bold"><% /* =loRS2("Texto") */ %></font></font></p>
                               <% /* 
                               If loRS2("NEmpresa") <> "" AND loRS2("Valor") <> "" Then
                                */ %>
                               <p><font face="Arial, Helvetica, sans-serif" color="#333"  size="2"><font style="font-weight:bold"><% /* =FormatCurrency(loRS2("Valor"),2) */ %></font></font></p>
                               <% /* 
                               End If
                                */ %>
                              </li>
                            </ul>
                            <!--Fim Linha de Caracteristicas--></td>
    
    
    
   <% /* 
	       loRS2.MoveNext
	WEnd

	loRS2.Close
 */ %>   
    

  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#FF9900"  size="4"><font style="font-weight:bold">Proposta Escolhida</font></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="130"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="4"><font style="font-weight:bold">Empresa:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="3">
	<font style="font-weight:bold"><% /* =loNomeFantasia */ %></font></font></td>
  </tr>
  <tr>
    <td width="100">&nbsp;</td>
    <td><font face="Arial, Helvetica, sans-serif" color="#FF0000"  size="4"><font style="font-weight:bold">Dados da Empresa</font></font></td>
  </tr>
  <tr>
    <td width="100" height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td width="100"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">Razão Social:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =loRazaoSocial */ %></font></td>
  </tr>
  <tr>
    <td width="100"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">Responsável:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =loResponsavel */ %></font></td>
  </tr>
  <tr>
    <td width="100"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">
	Endereço:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =loEndereco */ %></font></td>
  </tr>
  	   <tr>
    <td width="100"><span class="style1">CEP</span><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =loCEP */ %></font></td>
  	   </tr>
		 <tr>
    <td width="100"><span class="style1">Bairro</span><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">
	<% /* =loBairro */ %></font></td>
  	   </tr>
  <tr>
    <td width="100">
	<font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3">
	<font style="font-weight:bold">Cidade:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">
	<% /* =loCidade */ %></font></td>
  </tr>
  					  <tr>
    <td width="100" style="height: 19px"><span class="style1">Estado</span><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">:</font></font></td>
    <td style="height: 19px"><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">
	<% /* =loEstado */ %></font></td>
  					  </tr>
  <tr>
    <td width="100"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">E-mail:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">
	<% /* =loEmail */ %></font></td>
  </tr>
  <tr>
    <td width="100"><font face="Arial, Helvetica, sans-serif" color="#052B80"  size="3"><font style="font-weight:bold">Telefone:</font></font></td>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">
	<% /* =loTelefone */ %></font></td>
  </tr>
</table>

    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="3"><font style="font-weight:bold">Link</font></font></td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="2"><a href="http://www.melhoroferta.net/home/restrito_detalhes_solicitacoes.jsp?paNSolicitacao=<% /* =Request("NSolicitacao") */ %>">http://www.melhoroferta.net/home/restrito_detalhes_solicitacoes.jsp?paNSolicitacao=<% /* =Request("NSolicitacao") */ %></a></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#103182" height="15"></td>
  </tr>
  <tr>
    <td bgcolor="#F49304" height="15"></td>
  </tr>
</table>

    </td>
  </tr>
</table>

</body>
</html>
