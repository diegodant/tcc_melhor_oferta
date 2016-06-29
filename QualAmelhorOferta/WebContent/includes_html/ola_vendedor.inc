<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                                   Usuario u2 = (Usuario) session.getAttribute("usuario");
                                   
                                 %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="729" height="40" class="Restrito_vendedor">
      <h1>Olá, <% out.print(u2.getNome()); %> (se você for outro Vendedor <a href="sair.jsp">
	  Clique Aqui!</a>)</h1>
      </td>
      <td width="15">&nbsp;</td>
      <td width="15">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>