<%@page import="br.com.melhoroferta.persistencia.Generico"%>
<%
String cep = request.getParameter("CEP");

    Generico g = new Generico();
    out.print(g.consultarEndereco(cep));
%>