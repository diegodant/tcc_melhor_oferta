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
</head>

<body>
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="150"><img src="http://www.melhoroferta.net/home/imagens/topo/logo.jpg" width="150" height="126" alt="Melhor Oferta.net" /></td>
                <td width="340" align="center">&nbsp;</td>
                <td><img src="http://www.melhoroferta.net/home/imagens/melhor_oferta/sacola_melhor.jpg" width="223" height="222" alt="Melhor Oferta" /></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">&nbsp;</font></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td><font face="Arial, Helvetica, sans-serif" color="#999999" size="2"style="margin-left:40px;"><b>Prezado:</b>&nbsp;<% /* =Request("NomeFantasia") */ %></font></td>
                                   </tr>
                                     <tr>
                                     <td height="40"><font face="Arial, Helvetica, sans-serif" color="#999999" size="2"style="margin-left:40px;"><b>Informamos que foi feita uma avaliação no site Melhor Oferta, segue abaixo a descrição e o nome de quem avaliou.</b></font></td>
              </tr>
                                   <tr>
                                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>
                                         <td width="22%" align="center" class="avali">
                                 <ul style=" list-style:none; display:inline; float:left;">
<% /* 
loCont = 0
		While loCont < CINT(Request("Avaliacao"))
 */ %>
                                  <img src="http://www.melhoroferta.net/home/imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<% /* 
			loCont = loCont + 1
		WEnd
	
		While loCont < 5
 */ %>
                                  <img src="http://www.melhoroferta.net/home/imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<% /* 
			loCont = loCont + 1
		WEnd
 */ %> 
                                </ul>
                                </td>
                                         <td width="78%"><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2"><% /* =Request("Nome") */ %></font>
																			</td>
                                       </tr>
                                       <tr>
                                         <td align="center" class="avali">&nbsp;</td>
                                       </tr>
                                     </table></td>
                                   </tr>
                                   <tr>
                                     <td>
                                     <font face="Arial, Helvetica, sans-serif" color="#999999" size="2"style="margin-left:40px;">
                                     <% /* =Request("Comentario") */ %>
                                     </font></td>
                                   </tr>
                                   <tr>
                                   <td>&nbsp;</td>
                                   </tr>
                                   <tr>
                                     <td height="40"><font face="Arial, Helvetica, sans-serif" color="#999999"  size="2">Clique no link abaixo e acompanhe:</font></td>
                                   </tr>
            </table>
    </td>
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="2"><a href="http://www.melhoroferta.net/home/restrito_vendedor_avaliacao.jsp">http://www.melhoroferta.net/home/restrito_vendedor_avaliacao.jsp</a></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
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
