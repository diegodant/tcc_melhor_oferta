<%-- 
    Document   : quero_melhor_oferta
    Created on : 16/11/2012, 08:30:34
    Author     : DTRafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("vendedor") != null){
        response.sendRedirect("nova_solicitacao.jsp");
    }else{            
        if(session.getAttribute("usuario") != null){
             response.sendRedirect("nova_solicitacao.jsp");
        }else{
            if(session.getAttribute("usuario") == null){
                response.sendRedirect("identificacao.jsp");
            }
        }
    }
%>
