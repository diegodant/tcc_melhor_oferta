<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Melhor Oferta</title>
</head>

<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="150"><img src="http://www.melhoroferta.net/home/imagens/topo/logo.jpg" width="150" height="126" alt="Melhor Oferta.net" /></td>
                <td width="340" align="center"><img src="http://www.melhoroferta.net/home/imagens/busca_solicitacoes/titu_interacoes.jpg" width="241" height="27" alt="Solicita&ccedil;&otilde;es" /></td>
                <td><img src="http://www.melhoroferta.net/home/imagens/melhor_oferta/sacola_melhor.jpg" width="223" height="222" alt="Melhor Oferta" /></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Olá, ***Nome*** </font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Foi feita uma nova interação na solicitação <% /* If Request("Valor") <> "" Then */ %>com o valor de <% /* =FormatCurrency(Request("Valor"),2) */ %><% /* End If */ %>. Clique no link abaixo e acompanhe.</font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="2"><a href="http://www.melhoroferta.net/home/detalhes_solicitacoes.jsp?paNSolicitacao=<% /* =Request("NSolicitacao") */ %>">http://www.melhoroferta.net/home/detalhes_solicitacoes.jsp?paNSolicitacao=<% /* =Request("NSolicitacao") */ %></a></font></td>
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
