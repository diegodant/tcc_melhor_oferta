<%-- 
    Document   : verifica_integracao
    Created on : 22/11/2012, 16:38:56
    Author     : CELTAPHP
--%>

<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<%@page import="br.com.melhoroferta.entidades.Solicitacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>

<% 

String cmd = request.getParameter("cmd");
        if (cmd.equalsIgnoreCase("listarProposta")) {
            int cod = Integer.parseInt(request.getParameter("NSolicitacao"));
            Solicitacao s = (Solicitacao) session.getAttribute("solicitacao");
               SolitacaoDAO sd = new SolitacaoDAO();
            
        }
%>