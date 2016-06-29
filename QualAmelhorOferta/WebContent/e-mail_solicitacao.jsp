<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Melhor Oferta</title>
<style type="text/css">
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-small;
	color: #999999;
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
                <td width="340" align="center"><img src="http://www.melhoroferta.net/home/imagens/melhor_oferta/titu_solicitacoes_g.jpg" width="290" height="32" alt="Solicita&ccedil;&otilde;es" /></td>
                <td><img src="http://www.melhoroferta.net/home/imagens/melhor_oferta/sacola_melhor.jpg" width="223" height="222" alt="Melhor Oferta" /></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Olá, </font>
	<span class="style1">***NomeFantasia***</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Houve uma solicitação com o seu perfil.</font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><strong style="color:#00C;">Produto: </strong> <strong><% /* =Request("Produto") */ %></strong></font></td>
  </tr>
   <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><strong style="color:#00C;">Descrição: </strong> <strong><% /* =Request("Descricao") */ %></strong></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Clique no link abaixo e acompanhe</font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="2"><a href="<% /* =Application("Site-URL") */ %>detalhes_solicitacoes.jsp?paNSolicitacao=<% /* =Request("NSolicitacao") */ %>">Detalhes 
	da Solicitação</a></font></td>
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
