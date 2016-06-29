<%-- 
    Document   : restrito_comprador_atualizar_fotos
    Created on : 29/09/2012, 16:29:01
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- #include file="lib\lib.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
      <td> <%@include file="includes_html/ola_comprador.inc" %>
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
                                 <td>&nbsp;</td>
                               </tr>
                               <tr>
                                 <td><form action="grava_foto.jsp" method="post" enctype="multipart/form-data">
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td>
                                      <input type="file" name="Foto" id="fileField" />&nbsp;&nbsp;Limite máximo para upload  ( 5 )
                                    </td>
                                  </tr>
                                  <tr>
                                  <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>
                                         <td><img src="logo-aw.jpg" width="254" height="70" />
                                         <h1><a href="#">Exluir</a></h1>
                                         </td>
                                         </tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                       </tr>
                                     </table>
                                     
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>
                                         <td><img src="logo-aw.jpg" width="254" height="70" />
                                         <h1><a href="#">Exluir</a></h1>
                                         </td>
                                         </tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                       </tr>
                                     </table>
                                     
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>
                                         <td><img src="logo-aw.jpg" width="254" height="70" />
                                         <h1><a href="#">Exluir</a></h1>
                                         </td>
                                         </tr>
                                       <tr>
                                         <td>&nbsp;</td>
                                       </tr>
                                     </table>
                                     
                                     
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
                             </table></td>
                             <td width="15">&nbsp;</td>
                           </tr>
                         </table>
                         </td>
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

