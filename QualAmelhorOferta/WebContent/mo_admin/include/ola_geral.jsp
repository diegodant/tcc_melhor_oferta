<%
    if(session.getAttribute("vendedor") != null){ %>
    <%@include file="ola_vendedor.inc"%>
<%     }else{
        if(session.getAttribute("usuario") != null){  %>
        <%@include file="ola_comprador.inc"%>
<%      }
          else{
               response.sendRedirect("identificacao.jsp");
           }
         }%>