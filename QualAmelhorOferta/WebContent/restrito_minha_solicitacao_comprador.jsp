<%-- 
    Document   : restrito_minha_solicitacao_comprador
    Created on : 12/05/2012, 18:28:24
    Author     : Diego
--%>


<%@page import="br.com.melhoroferta.persistencia.PropostaDAO"%>
<%@page import="br.com.melhoroferta.persistencia.VendedorDAO"%>
<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<%@page import="br.com.melhoroferta.persistencia.UsuariosDAO"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
      <td> <%@include file="includes_html/ola_geral.jsp" %>
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
                                <td width="160" valign="top"><img src="imagens/painel_comprador/tit_painel_comprador.jpg" width="267" height="19" alt="Painel de Controle Comprador" title="Painel de Controle Comprador" /></td>
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
                         <td width="230" valign="top" class="list_restrita_comprador">
                             <%@include file="includes_html/menu_restrito_comprador.inc" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td>
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="747"><img src="imagens/busca_solicitacoes/titu_lista_busca_restrito.jpg" width="524" height="30" /></td>
                  </tr>
                  <!--inicio linha produtos--->
                   <tr>

		     <td class="bd_linha_lados detalhes_int ">${mensagem}
                       <!--Tabela de conteudo-->
    <% 
    SolitacaoDAO s = new SolitacaoDAO();
    List<Solicitacao>lista = s.listarSolicitacoes(request, response);
    for(Solicitacao so : lista){
    
    %>                    
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       
                            <tr>
                                <td width="9">&nbsp;</td>
                                <td class="caracteristicas_p" width="75%"><!--Inicio Linha de Caracteristicas-->
                                    <ul>
			                <li>
                                            <h1>Produto: <% out.print(so.getProduto()); %></h1>
                                        </li>
                                        <li>
                                            <p>Descricao: <% out.print(so.getDescricao()); %></p>
                                        </li>
                                        <li>
                                            Solicitação Nº: <% out.print(so.getNsolicitacao()); %> &nbsp; Cadastrada em: <% out.print(so.getDataCriacao()); %>
                                        </li>
                                    </ul>
                            <!--Fim Linha de Caracteristicas-->
                                </td>
                          
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                          <td align="center" class="logo_po">
                          
                          <table cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td style="color: #FF0000; font-weight: bold" align="center"> 
                                            <% 
                                            if(so.getStatus() == 0) out.print("Solicitação Aberta");
                                               else if(so.getStatus() == 1) out.print("Solicitação Inativa/Cancelada"); 
                                                       else out.print("Solicitação Fechada");%> 
                                        </td>
                                    </tr>
                                        
    
<!--                                        <tr>
                                            <td style="color: #FF0000; font-weight: bold" align="center">
                                                <br /> Oferta(S)
                                            </td>
                                        </tr>-->
                                        <tr>
                                            <td align="center"><br />
                                                <%
                                                if(so.getStatus() == 0){
                                                %>
                                                <a href="restrito_interagir_comprador.jsp?nsolicitacao=<% out.print(so.getNsolicitacao()); %>&ncategoria=<% out.print(so.getNcategoria()); %>&nsubcategoria=<% out.print(so.getNsubcategoria()); %>"><img src="imagens/bt_detalhes.jpg" alt="Detalhes" width="64" height="22" border="0" title="Detalhes" /></a>
                                                <%
                                                }
                                                    else if(so.getStatus() == 1){
                                                %>
                                                        <a href="restrito_detalhes_solicitacoes.jsp?msg='Solicitacao Cancelada'&nsolicitacao=<% out.print(so.getNsolicitacao()); %>"><img src="imagens/bt_detalhes.jpg" alt="Detalhes" width="64" height="22" border="0" title="Detalhes" /></a>

                                                <%
                                                    }
                                                        else if(so.getStatus() == 2){
                                                %>

                                                <a href="restrito_detalhes_solicitacoes.jsp?msg='Solicitacao Fechada'&nsolicitacao=<% out.print(so.getNsolicitacao()); %>"><img src="imagens/bt_detalhes.jpg" width="66" height="23" alt="Detalhes da Melhor Oferta" title="Avaliar" border="0" class="avaliar" /></a>
                                                <%
                                                        }
                                                %>


                                          </td>
                                        </tr>                              
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
<!--                <td style="font-weight:bold; float:right; margin:0 60px 0 0 "> Dias</td>                                        -->
                                        
                 
                          </table>
                          </td>
			</tr>
                        
                        <tr>
                            <td class="bd_linha_bx ulti_soli2" colspan="4"></td>
                        </tr>
                      </table>
<%
    
  HttpSession sessao = request.getSession();
  sessao.setAttribute("solicitacao",so);
  
   }
%>
                      <!--Fim conteudo-->
                     
                     </td>
                 </tr>
                      
                      <!-- Inicio da tabela de interação -->
  <%
  /*  PropostaDAO pd = new PropostaDAO();
    List<Proposta>listavs = pd.listarProposta(request, response);
    
    for(Proposta p : listavs){
   */ 
                
    %>                    

<%
   //}
%>
	

                  
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
