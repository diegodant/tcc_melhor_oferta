<%-- 
    Document   : restrito_comprador_atualizar_limite
    Created on : 29/09/2012, 16:30:50
    Author     : CELTAPHP
--%>

<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                         <td valign="top"><% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT E.NEmpresa, P.Nome, P.Descricao, P.NPalavrasChave, P.Negociacoes, P.QtCategoria, P.QtSubCategoria, NImagem, IF(Logotipo=1, 'Sim', 'Não') AS Logotipo, IF(Ativo=1, 'Sim', 'Não') AS Ativo FROM Empresas E INNER JOIN Planos P ON E.NPlano = P.NPlano WHERE NEmpresa=" & Session("Empresa-NEmpresa"), loConexao

 */ %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><form id="form1" name="form1" method="post" action="">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td width="28%"><p>Nome do Plano:</p></td>
                                   <td width="72%" height="60"><h1><% /* =loRS("Nome") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Descrição:</p></td>
                                   <td><h1><% /* =loRS("Descricao") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Limite de Negociações:</p></td>
                                   <td height="60"><strong> 50 </strong>/ <% /* =loRS("Negociacoes") */ %></td>
                                 </tr>
                                 <tr>
                                   <td><p>Quantidade de Palavra Chave:</p></td>
                                   <td height="30"><h1><% /* =loRS("NPalavrasChave") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Sub-categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtSubCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Imagens:</p></td>
                                   <td height="30"><strong>3</strong>&nbsp;&nbsp;/ <% /* =loRS("NImagem") */ %></td>
                                 </tr>
                                 <tr>
                                   <td><p>Logotipo:</p></td>
                                   <td height="30"><h1><% /* =loRS("Logotipo") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td>Ativo:</td>
                                   <td height="30"><h1><% /* =loRS("Ativo") */ %></h1>
                                   </td>
                                 </tr>
                                 <tr>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td>&nbsp;</td>
                                   <td height="60"><a href="#"><img src="imagens/painel_comprador/btn_contratar_plano.jpg" width="182" height="23" alt="Contratar Plano" title="Contratar Plano" border="0" /></a></td>
                                 </tr>
                               </table>
                             </form></td>
                             <td width="15">&nbsp;</td>
                           </tr>
                         </table>

<% /* 
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>                         </td>
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
