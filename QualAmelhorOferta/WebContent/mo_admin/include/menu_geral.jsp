<%
    if(session.getAttribute("vendedor") != null){ %>
        <%@include file="menu_restrito_vendedor.inc"%>
<%       }else{             %>
            <%@include file="menu_restrito_comprador.inc" %>
<%        } %>


