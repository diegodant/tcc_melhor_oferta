<%-- 
    Document   : restrito_interagir_vendedor
    Created on : 20/11/2012, 23:41:44
    Author     : CELTAPHP
--%>

<%@page import="br.com.melhoroferta.entidades.Solicitacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.melhoroferta.persistencia.VendedorDAO"%>
<%@page import="br.com.melhoroferta.entidades.Vendedor"%>
<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%
   Usuario u = (Usuario) session.getAttribute("usuario");
   Solicitacao s = (Solicitacao) session.getAttribute("solicitacao");
%>
<!DOCTYPE html>

<% /* 
LoginEmpresa()

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT E.NEmpresa, Logotipo FROM Empresas E INNER JOIN Planos P ON E.NPlano = P.NPlano WHERE E.NEmpresa=" & Session("Empresa-NEmpresa"), loConexao

	If loRS("Logotipo") <> 1 Then
		Response.Redirect "restrito_vendedor_atualizar_limite.jsp?paMsg=Seu Plano N�o Permite Logotipo"
	Else

loRS.Close
 */ %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>

</head>
<body>

<div id="principal">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <!--Inicio Topo-->
        <%@include file="includes_html/topo.inc" %>
     <!--Fim Topo-->
    </td>
  </tr>
    <tr>
    <td height="20" valign="top">&nbsp;</td>
  </tr>
  <tr>
  <td><%@include file="includes_html/ola_geral.jsp" %>
  </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
           <td height="15">&nbsp;</td>
          </tr>
             <tr>
           <td>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="255" valign="top"><img src="imagens/cadastro_usuario/titu_empresa.jpg" width="174" height="15" alt="Cadastro Comprador" title="Cadastro Comprador" /></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
           </td>
          </tr>
             <tr>
           <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" >
                             <%@include file="includes_html/menu_geral.jsp" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td>
                                     
 
                                     
                                     <form action="grava_logo.jsp" method="post" enctype="multipart/form-data">
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                               		<td class="mensagem" align="center">${mensagem}</td>                              
                               </tr>
                               <tr>
                                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td width="10">&nbsp;</td>
                                     <td>
                                       <input type="file" name="Logotipo" id="fileField" />
                                       </td>
                                     <td width="10">&nbsp;</td>
                                   </tr>
                                   <tr>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                     <td>&nbsp;</td>
                                   </tr>
                                     <tr>
                                     <td>&nbsp;</td>
                                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       
<% /* 
	loFoto = Application("DirEmpresas") & "Logo" & Session("Empresa-NEmpresa") & ".jpg"

	If ExisteArq(loFoto) Then
 */ %>
														
                                        <tr>
                                            <td>
                                                <img border="0" src="foto.jsp?paTipo=Logo&paFoto=Logo<% /* =Session("Empresa-NEmpresa") */ %>.jpg&paPorcent=15"/>
                                                <br />
                                                    <a href="remove.jsp?paTipo=Logo&amp;paNEmpresa=<% /* =Session("Empresa-NEmpresa") */ %>">
                                                        <img alt="Remover" height="16" src="images/icones/remover.png" width="16" border="0" title="Remover" style="float: left" /> Remover
                                                    </a>
                                            </td>
                                        </tr>
<% /* 
	End If
 */ %>	
                               	
                                     </table>
                                     </td>
                                     <td>&nbsp;</td>
                                   </tr>
                                 </table>
                                 </td>
                               </tr>
                               <tr>
                                 <td height="60"><label>
                                   <input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_alterar_logotipo.jpg" />
                                 </label></td>
                               </tr>
                             </table>
                             </form>              
                                     

                                     </td>
                                     <td width="15">&nbsp;</td>
                                   </tr>
                                 </table></td>
                               </tr>
                             </table></td>
                           </tr>
                         </table></td>
                       </tr>
                     </table>
                     </td>
                   </tr>
                 </table>
               </td>
               <td width="239" align="center" valign="top">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="30">&nbsp;</td>
                    <td>
                        <%@include file="includes_html/minha_conta_geral.jsp" %>
                    </td>
                  </tr>
                </table>
            </td>
             </tr>
           </table>
           </td>
          </tr>
         <tr>
           <td>
           <!--inicio rodape-->
           <%@include file="includes_html/rodape.inc" %>
           <!--fim rodape-->
           </td>
          </tr>
             <tr>
           <td>&nbsp;</td>
          </tr>
             <tr>
           <td>&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</body>
</html>
