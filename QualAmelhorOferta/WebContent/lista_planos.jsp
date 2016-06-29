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
function abre(paNPlano)
{
 paPagina = "detalhes_planos.jsp?paNPlano=" + paNPlano //aqui vai o nome da sua p�gina
 winwidth = 605; // Largura dajanela 
 winheight = 400; // Altura da janela
 winleft   = 350; // Posi��o na tela com rela��o a esquerda
 wintop    = 200; // Posi��o na tela com rela��o ao topo
 
 window.open(paPagina, '_blank', 'top=' + wintop + ',left=' + winleft + ',height=' + winheight + ',width=' + winwidth + ',scrollbars=yes');  
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
                                     
                                     
                                     
                                     
                                     
                                     
                                     <form action="grava_planos.asp" name="Formulario" method="post">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="lista_planos" align="center"><h1> ${mensagem} </h1></td>
                              </tr>
                              <!--inicio linha-->
                              <tr>
                                <td>
<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NPlano, Nome, Descricao, Valor FROM Planos WHERE Ativo = 1 ORDER BY Valor" , loConexao

While Not loRS.Eof
	loNPlano = loRS("NPlano")
 */ %>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="25">
                                    <input type="radio" name="NPlano" id="radio" value="<% /* =loRS("NPlano") */ %>" />
                                    </td>
                        <td>
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="65" valign="top"><img src="imagens/lista/sacola_li.jpg" width="65" height="87" alt="Melhor Oferta" title="Melhor Oferta" border="0" /></td>
                                    <td valign="top">
                                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td height="68" class="bg_lista">
                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                  <tr>
                                                    <td class="lista_planos">
                                                     <h1>Plano Padr&atilde;o
                                                       <% /* =loRS("Nome") */ %></h1>
                                                     <p><% /* =left(loRS("Descricao"),200) */ %>
                                                     Descri&ccedil;&atilde;o para o plano padr&atilde;o</p>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td width="135" align="left"><a href="javascript:abre('<% /* =loNPlano */ %>')"><img src="imagens/lista/bt_detalhes.jpg" width="125" height="33" alt="Ver Detalhes" title="Ver Detalhes" border="0" /></a></td>
                                                  </tr>
                                                </table>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                      </table>
                                    </td>
                                  </tr>
                                </table>
                                </td>                                  
                                </tr>
                                </table>
                                  
                               
                             

<% /* 
       loRS.MoveNext
WEnd

loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>   
						   </td>
                              </tr>
							<tr>
                                <td>&nbsp;</td>                        
							 </tr>
                              <!--fim linha-->                              
                            </table>
                        </td>
                      </tr>
                    </table>
                        </td>
                      </tr>
                      <tr>
                        <td>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="40">&nbsp;</td>
                                <td><input type="image" src="imagens/lista/bt_pgto.jpg" alt="Escolher Pagamento" title="Escolher Pagamento"  border="0"/></td>
                              </tr>
                            </table>
                        </td>
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
