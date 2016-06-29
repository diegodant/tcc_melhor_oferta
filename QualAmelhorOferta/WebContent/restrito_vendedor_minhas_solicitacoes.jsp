<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<%@page import="br.com.melhoroferta.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Inicia Sessão -->
<%
   Vendedor v = (Vendedor) session.getAttribute("vendedor");
%>
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
      <td>
        <%@include file="includes_html/ola_vendedor.inc" %>
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
                  <td height="30">&nbsp;</td>
                  </tr>
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top">
                             <%@include file="includes_html/menu_geral.jsp" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td>
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="747"><img src="imagens/busca_solicitacoes/titu_lista_busca_restrito.jpg" width="524" height="30" /></td>
                  </tr>
                  <!--inicio linha produtos- -->
<% 
/* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loNRegistros = 4

If Request("paPagina") <> "" And IsNumeric(Request("paPagina")) Then
	loPagina = CInt(Request("paPagina"))
Else
	loPagina = 1
End If

loPosicao = (loPagina - 1) * loNRegistros

loRS.Open "SELECT COUNT(NSolicitacao) AS Total FROM Solicitacoes WHERE Status = 2 AND NEmpresaVencedora = " & Session("Empresa-NEmpresa") , loConexao
loTotal = CLng(loRS("Total"))
loRS.Close

loUltima = loTotal / loNRegistros

If loUltima > Fix(loUltima) Then
	loUltima = Fix(loUltima) + 1
End If

loRS.Open "SELECT NSolicitacao, Produto, Descricao, Status, NEmpresaVencedora FROM Solicitacoes WHERE Status = 2 AND NEmpresaVencedora = " & Session("Empresa-NEmpresa") & " ORDER BY DataFinalizacao DESC LIMIT " & loPosicao & ", " & loNRegistros, loConexao
While Not loRS.Eof
 */  %>

   
               <tr>

<td class="bd_linha_lados detalhes_int "><!--Tabela de conteudo-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       
					 <tr>
                          
                          <td width="9">&nbsp;</td>
                          <td class="caracteristicas_p" width="80%"><!--Inicio Linha de Caracteristicas-->
                            <ul>
                              <li>
<%/* 
loArquivo = Application("DirSolicitacao") & loRS("NSolicitacao") & ".jpg" 
	If ExisteArq(loArquivo) Then

 */ %>
                              
                             
                               <p> <img src="foto.jsp?paTipo=Solicitacao&paFoto=<% /* =loRS("NSolicitacao") */ %>.jpg&paPorcent=100" width="60" height="70" align="left"/> </p>
                             
<% /* 
end if
 */ %>                                           
                                        
                                <h1><% /* =loRS("Produto") */ %></h1>
                              </li>
                              <li>
                                <p><% /* =loRS("Descricao") */ %></p>
                              </li>
                  </ul>
                            <!--Fim Linha de Caracteristicas--></td>
                          
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                          <td align="center" class="logo_po"><a href="restrito_detalhes_solicitacoes_vendedor.jsp?paNSolicitacao=<% /* =loRS("NSolicitacao") */ %>"><img src="imagens/bt_detalhes.jpg" alt="Detalhes" width="64" height="22" border="0" title="Detalhes" /></a>
                          <a href="restrito_vendedor_avaliacao_edita.jsp?paNSolicitacao=<% /* =loRS("NSolicitacao") */ %>"><img src="imagens/bt_avaliar.jpg" width="66" height="23" alt="Avaliar" title="Avaliar" border="0" class="avaliar" /></a>
                          </td>
                      
				  </tr>
			  
                      </table>
                      <!--Fim conteudo--></td>

                 </tr>
<% /* 
       loRS.MoveNext
WEnd
 */ %> 	
                  <!--fim linha produtos-->
                  <!--inicio linha produtos--->
                  <!--fim linha produtos-->
                  <tr>
                  <td class="bd_linha_bx ulti_soli2">
                   <table>
                    <tr>
<% /* 
For loPagina = 1 to loUltima
 */ %>                  
                    <td align="right" height="25"><a href="restrito_acompanhar_solicitacao_comprador.jsp?paPagina=<% /* =loPagina */ %>"> <% /* =loPagina */ %></a>|</td>
<% /* 
Next

loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %> 
                  </tr>
                </table>
              </td>
				

                  </tr>
                </table>
                             </td>
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
			   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td><%@include file="includes_html/minha_conta_vendedor.inc" %></td>
    
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
