<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page import="br.com.melhoroferta.persistencia.PropostaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.melhoroferta.entidades.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 

    int nproposta = Integer.parseInt(request.getParameter("nproposta"));
    int nsolicitacao = Integer.parseInt(request.getParameter("nsolicitacao"));
  
    PropostaDAO pdao = new PropostaDAO();
    Proposta proposta = pdao.getPropostaBySolicitacao(nsolicitacao,nproposta);
 

 %>
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
    <td>&nbsp;</td>
  </tr><!--  <tr>
    <td height="61" class="back_busca">
     <include file="includes/busca_eu_quero.jsp">
    </td>
  </tr>
	-->
<tr><td height="10"></td></tr>
  <tr>
  
    <td>
     <!--conteudo-->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                 <td width="24">&nbsp;</td>
                <td>
                 <!--conteudo interno-->
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="177" valign="top"><img src="imagens/usuarios/titu_detalhes.jpg" width="173" height="20" alt="Solicitações" title="Solicitações" border="0" /></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
            <td width="747" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="24">&nbsp;</td>
                <td width="747"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="747"><img src="imagens/usuarios/titu_sua_oferta.jpg" width="747" height="30" alt="Melhor Oferta" title="Melhor Oferta" border="0" /></td>
                  </tr>
                  <!--inicio linha-->
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        <td width="189" valign="middle" class="logos" align="center">
                        	
                            	<h2>Imagem</h2>
					
                        </td>
                        <td width="15">&nbsp;</td>
                        <td class="caracteristicas2">
                        <!--Inicio Linha de Caracteristicas-->
                          <ul>
                            <li>
                              <h1><% out.print(proposta.getSolicitacao().getProduto()); %></h1>
                            </li>
                            <li>
                              <p><% out.print(proposta.getSolicitacao().getDescricao()); %></p>
                            </li>
                            
                            <li><!--<a href="#"><img src="imagens/usuarios/bt_quero_oferta.jpg" width="155" height="34" alt="Quero essa oferta" title="Quero essa oferta" border="0" /></a>--></li>
                          </ul>
                          <!--Fim Linha de Caracteristicas--></td>
                        
                        <td width="15" valign="bottom" class="bt_reportar"m>&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <!--fim linha-->
                  <!--inicio linha-->
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        <td width="189" valign="middle">
                         <!--inicio tabela-->
                          <table width="189" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="20"></td>
                              <td width="189" valign="middle" class="logos" align="center">
                        	
                            	<h2>Logo do Vendedor</h2>
					
                        	  </td>
                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td>
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                    </tr>
                                  </table>
                                 </td>
                                </tr>
                                <tr>
                                  <td><!--tabela da imagem principal-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>                                        
                                        <td width="189"></td>                                   
                                      </tr>
                                      <!--fim da tabela principal-->
                                    </table>
                                  </td>
                                </tr>
                                <tr>
                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                       </tr>
                                  </table></td>
                                </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                          </table></td>
                        <!--fim tabela-->
                        <td width="15"></td>
                        <td width="450" class="caracteristicas2"><!--Inicio Linha de Caracteristicas-->
                            <br>
                         <ul>
                            <li>
                              <h2><% out.print(proposta.getObservacao()); %></h2>
                            </li>
                            <li>
                                <p>Prazo de entrega : <% out.print((proposta.getPrazoEntrega() == null ? "Não informado." : proposta.getPrazoEntrega())); %></p>

                               <p>Valor proposto: <% out.print(proposta.getValor()); %></p>
                              </li>
                            <li><a href="solicitacao_oferta_grava.jsp?nproposta=<%=nproposta%>&nsolicitacao=<% out.print(proposta.getSolicitacao().getNsolicitacao()); %>"><img src="imagens/usuarios/bt_confirmar.jpg" width="178" height="33" alt="Quero essa oferta" title="Quero essa oferta" border="0" /></a></li>
                          </ul>
                          <!--Fim Linha de Caracteristicas--></td>
                         
                        <td width="15" valign="bottom" class="bt_reportar"m>&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <!--fim linha-->

                </table>
                </td>
              </tr>
            </table></td>
            <td width="12">&nbsp;</td>
            <td width="215" valign="top">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                 <!--Inicio Box Minha conta-->
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="30">&nbsp;</td>
                    <td><%@include file="includes_html/minha_conta_geral.jsp" %></td>
                    
                  </tr>
                </table>
                 <!--fim minha conta-->
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="213" class="publicidade_home">
                  <!-- <ul>
                       <li><a href="#"><img src="imagens/banner_publi_home.jpg" width="213" height="54" alt="banner publicidade" title="banner publicidade" border="0" /></a></li>
                       <li><a href="#"><img src="imagens/banner_publi_home.jpg" width="213" height="54" alt="banner publicidade" title="banner publicidade" border="0" /></a></li>
                    </ul>-->
                  </td>
              </tr>
              <tr>
                <td>
                 <!--ultimas solicitações-->
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="imagens/usuarios/titu_ultimas_solicitacoes.jpg" width="215" height="30" alt="Ultimas Solicitações" title="Ultimas Solicitações" border="0" /></td>
                          </tr>
                            <tr>
                                <td class="ulti_soli">
                                  <%
									Generico g = new Generico();
									ResultSet rs = g.ultimaSolicitacoes();
									while(rs.next()){
									%>
									<ul>
								 	 <li> 
                                   
                                         <a href="detalhes_solicitacoes.jsp?paNSolicitacao=<%=rs.getInt("NSolicitacao")%>">
                                        
                                        <h1><%=rs.getString("produto")%> </h1>                                        
                                        <p> <%=rs.getString("descricao") %></p>
                                    </a> 
                                    
                                  </li>
                                </ul>
							<%
                            }
                            g.closeDataBase();
                            %>      
                   		 </td>
                              </tr>
                              <tr>
                               <td class="ulti_soli2" height="20" align="right"><a href="restrito_minha_solicitacao_comprador.jsp">Todas +</a></td>
                              </tr>

                        </table>
                 <!--fim ultimas solicitações-->
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
                 <!--interno-->
                </td>
                <td width="22">&nbsp;</td>
              </tr>
            </table>
     <!--fim conteudo-->
    </td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>
     <!--inicio rodape-->
     <%@include file="includes_html/rodape.inc" %>
     <!--fim rodape-->
    </td>
  </tr>
</table>
</div>
</body>
</html>
