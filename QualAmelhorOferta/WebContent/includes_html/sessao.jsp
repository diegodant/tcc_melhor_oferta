<%-- 
    Document   : sessao
    Created on : 14/11/2012, 14:47:52
    Author     : DTRafael
--%>

<%
    if(session.getAttribute("vendedor") != null){
    }else{            
        if(session.getAttribute("usuario") != null){
        }else{
            if(session.getAttribute("usuario") == null){
                response.sendRedirect("identificacao.jsp");
            }
        }
    }
%>