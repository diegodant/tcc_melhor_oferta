<%-- 
    Document   : minha_conta
    Created on : 05/05/2012, 02:39:21
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("vendedor") != null){
        response.sendRedirect("restrito_empresa.jsp");
    }else{            
        if(session.getAttribute("usuario") != null){
            response.sendRedirect("restrito_minha_solicitacao_comprador.jsp");
        }else{
            if(session.getAttribute("vendedor") == null){
                response.sendRedirect("identificacao.jsp");
            }
        }
    }
%>