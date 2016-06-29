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

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">
function Remover(paFoto)
{
	if(confirm("Voc� tem certeza que deseja remover esta foto?"))
		self.location = "remove.jsp?paTipo=Assinatura&paNEmpresa=<% /* =Session("Empresa-NEmpresa") */ %>&paFoto=" + paFoto;
}
</script>
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
                                <td width="255" valign="top"><img src="imagens/painel_empresa/tit_painel_empresa.jpg" width="252" height="17" alt="Painel de Controle Empresa" title="Painel de Controle Empresa"/></td>
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
                         <td width="230" valign="top">
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
                                     
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                               		<td class="mensagem" align="center">${mensagem}</td>
                               </tr>
                               <tr>
                                 <td><form action="grava_foto.jsp" method="post" enctype="multipart/form-data">
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
<% /* 

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NEmpresa, P.Nome, E.NPlano, P.NImagem, P.Logotipo FROM Empresas E INNER JOIN Planos P ON E.NPlano = P.NPlano WHERE NEmpresa = " & Session("Empresa-NEmpresa"), loConexao                              
 */ %>
                                    <td>
                                      <input type="file" name="Foto" id="fileField" />
                                      &nbsp;&nbsp;Limite m&aacute;ximo para upload  ( 
                                      <% /* =loRS("NImagem") */ %> ) fotos
                                    </td>
<% /* 
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing

 */ %>									
									
                                  </tr>
                                  <tr>
                                  <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
<% /* 
loPasta = Application("DirEmpresas") & Session("Empresa-NEmpresa") & "\" 

Set loFso = CreateObject("Scripting.FileSystemObject")

If loFso.FolderExists(loPasta) Then

	Set loDir = loFso.GetFolder(loPasta)
	Set loArquivos = loDir.Files

	For Each loFoto In loArquivos
 */ %>

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>

												
													<td style="width: 100px; height: 100px">
													<img border="0" src="foto.jsp?paTipo=Assinatura&paNEmpresa=<% /* =Session("Empresa-NEmpresa") */ %>&paFoto=<% /* =loFoto.Name */ %>&paPorcent=15"/><br />
													<a href="javascript:Remover('<% /* =loFoto.Name */ %>');">
													<img alt="Remover" height="16" src="images/icones/remover.png" width="16" border="0" title="Remover" style="float: left" /> Remover
                                                    </a>
                                                    </td>
													
	                                         </tr>
                                       </table>                                     
<% /* 
		loCont = loCont + 1
		
	Next
	
	Set loArquivos = Nothing
	Set loDir = Nothing

End If

Set loFso = Nothing
 */ %>                                     
                                     </td>
                                  </tr>
                                  <tr>
                                    <td height="60"><label>
                                      <input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_alterar_fotos.jpg" />
                                    </label></td>
                                  </tr>
                                </table>
                                                                 
                                 </form>
                                 </td>
                               </tr>
                               <tr>
                                 <td>&nbsp;</td>
                               </tr>
                             </table>
 
 
 
 
                                     

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
