<%
    if(session.getAttribute("vendedor") != null){ %>
    <%@include file="minha_conta_vendedor.inc"%>
<%     }else{  %>
        <%@include file="minha_conta.inc"%>
<%      }%>