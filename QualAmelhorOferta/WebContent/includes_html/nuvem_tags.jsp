<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cat" class="br.com.melhoroferta.persistencia.Generico" scope="session" />
<%
    String[] estilo = new String[6];
    for(int i=0; i<6;i++){
        estilo[i] = "t"+(i+1);
    }
    List<Categorias> categoria = cat.listarTagsCategorias();
 
    for(Categorias c : categoria){
 
        out.print("<span class="+estilo[(int) (Math.random()*6)]+">");
        out.print("<a href='lista_busca_solicitacoes.jsp?Categoria="+c.getNcategoria()+"'>");
        out.print(c.getNome()+"</a></span>"); 
  
}
%>