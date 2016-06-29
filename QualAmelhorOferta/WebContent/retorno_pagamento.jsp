<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="40">&nbsp;</td>
      <td width="729"><!--<img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" />--></td>
      <td width="15">&nbsp;</td>
      <td width="15"><a href="como_funciona.jsp"><img src="imagens/identificacao/box_como_funciona.jpg" width="216" height="95" alt="Como Funciona" title="Como Funciona" border="0"/></a></td>
      <td>&nbsp;</td>
    </tr>
  </table></td>
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
                       <td class=" confirma2"><h2>Transação Concluída</h2></td>
                    </tr>
                    
                    <tr>
                       <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="40">&nbsp;</td>
                            <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="retorno_pagamento"><table width="80%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="bg_retorno">
            <h1>Dados da Transação</h1>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%"><p>ID da transação: </p></td>
            <td width="62%"><h2><% /* =Request(nodeIdTransacao) */ %></h2></td>
          </tr>
          <tr>
            <td><p>C&oacute;digo da transação: </p></td>
            <td><h2>108894</h2></td>
          </tr>
          <tr>
            <td><p>Data da transação: </p></td>
            <td><h2>26/11/2009 15:46:10</h2></td>
          </tr>
          <tr>
            <td><p>Código de retorno da transação: </p></td>
            <td><h2>15</h2></td>
          </tr>
          <tr>
            <td><p>Mensagem de retorno da transação: </p></td>
            <td><h2>Transação processada.</h2></td>
          </tr>
        </table></td>
      </tr>
      <tr>
       <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="bg_retorno">
            <h1>Dados do comprador no Pagamento Certo</h1>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%"><p>Nome:  </p></td>
            <td width="62%"><h2>chasquazaum</h2></td>
          </tr>
          <tr>
            <td><p>E-mail:  </p></td>
            <td><h2>ale.olinto@ig.com.br</h2></td>
          </tr>
          <tr>
            <td><p>CPF: </p></td>
            <td><h2>32997932840</h2></td>
          </tr>
          <tr>
            <td><p>Tipo de pessoa:  </p></td>
            <td><h2>Fisica</h2></td>
          </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class="bg_retorno">
            <h1>Dados do pagamento</h1>
            </td>
      </tr>
        <tr>
        <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%"><p>Módulo do pagamento:   </p></td>
            <td width="62%"><h2>Boleto</h2></td>
          </tr>
          <tr>
            <td><p>Tipo de pagamento:  </p></td>
            <td><h2>Itau</h2></td>
          </tr>
          <tr>
            <td><p>Processado:  </p></td>
            <td><h2>true</h2></td>
          </tr>
          <tr>
            <td><p>Mensagem de retorno:   </p></td>
            <td><h2>Boleto emitido.</h2></td>
          </tr>
          <tr>
            <td><p>Status do pagamento:  </p></td>
            <td><h2>AguardandoPagto</h2></td>
          </tr>
          </table>
        </td>
      </tr>
        <tr>
       <td class="bg_retorno">
            <h1>Dados do pedido</h1>
            </td>
      </tr>
        <tr>
        <td class="borda_retorno">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%"><p>Número do pedido:</p></td>
            <td width="62%"><h2>2</h2></td>
          </tr>
          <tr>
            <td><p>Total do pedido:</p></td>
            <td><h2>1000</h2></td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

                            </td>
                          </tr>
                        </table>
                       </td>
                    </tr>
                     </table>
               </td>
               <td width="239" align="center" valign="top"><%@include file="includes_html/nuvem_tags.jsp" %>
            </td>
             </tr>
           </table>
           </td>
          </tr>
          <tr>
           <td>&nbsp;</td>
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
