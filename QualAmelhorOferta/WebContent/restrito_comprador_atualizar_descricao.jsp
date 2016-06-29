<%-- 
    Document   : restrito_comprador_atualizar_descricao
    Created on : 29/09/2012, 16:25:28
    Author     : CELTAPHP
--%>

<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<style type="text/css">
.style1 {
	color: #999;
	font-size: 13px;
	border: 1px solid #FFF;
}
</style>
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
  <td><%@include file="includes_html/ola_comprador.inc" %>
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
                <td width="275"><img src="imagens/painel_comprador/tit_painel_comprador.jpg" width="267" height="19" alt="Painel de Controle Comprador" title="Painel de Controle Comprador" /></td>
           <td class="li">&nbsp;</td>
                    <td width="15"><img src="imagens/bl_h.jpg" width="10" height="33" alt="Melhor Oferta" title="Melhor Oferta" /></td>
                 <td width="250">&nbsp;</td>
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
                  <td height="30">&nbsp;</td>
                  </tr>
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                           <%@include file="includes_html/menu_restrito_comprador.inc" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr><td class="mensagem" align="center" style="font-size: medium; font-weight: bold; color: #FF0000"><% /* =Request("paMsg") */ %></td></tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                       </tr>
                                       <tr>
                                         <td>Alterar a sua descrição que aparece na página de detalhes da empresa</td>
                                       </tr>
                                       <tr>
                                         <td><form id="form1" name="form1" method="post" action="gravar_atualizar_descricao.jsp">
                                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                             <tr>
                                               <td>&nbsp;</td>
                                             </tr>
                                             <tr>
                                               <td><label>
                                                 <textarea name="Descricao" id="textarea" cols="45" rows="5"></textarea>
                                               </label></td>
                                             </tr>
                                             <tr>
                                               <td height="40"><label>
                                                 <input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_altera_descricao.jpg" />
                                               </label></td>
                                             </tr>
                                         </table>
                                       </form> </td>
                                       </tr>
                                                                                    <% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NEmpresa, Descricao FROM Empresas WHERE NEmpresa=" & Session("Empresa-NEmpresa") , loConexao

 */ %>

<tr>
                                               <td>
                                               <h1>Sua descrição</h1><br />
                                               <p><% /* =loRS("Descricao") */ %></p></td>
                                             </tr>

<% /* 
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>  
                                     </table></td>
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
               <%@include file="includes_html/nuvem_tags.jsp" %>
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
