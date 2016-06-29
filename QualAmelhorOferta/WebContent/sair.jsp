<%-- 
    Document   : sair.jsp
    Created on : 12/09/2012, 17:00:18
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
session.invalidate();        
%>
<script type="text/javascript">
    window.location = "index.jsp";
</script>