<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="br.com.melhoroferta.persistencia.VendedorDAO"%>
<%@page import="br.com.melhoroferta.entidades.Vendedor"%>
<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   Usuario u = (Usuario) session.getAttribute("usuario");
   Vendedor v = (Vendedor) session.getAttribute("vendedor");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta - Minhas Solicitações</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

    $(document).ready(function() {

	$('#search_category_id').change(function(){
		$.post("getSubCategoria.jsp?cmd=buscarSolicitacao", {
			parent_id: $('#search_category_id').val()
                    }, function(response){
			
			setTimeout("'#show_sub_categories', '"+response+"", 400);
                        $("#sub_category_id").html(response);
		});
		return false;
	});
    });
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
  <td>
      <%@include file="includes_html/ola_vendedor.inc" %>
  </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
           <td height="15"></td>
          </tr>
             <tr>
           <td>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="160" valign="top"><img src="imagens/painel_empresa/tit_painel_empresa.jpg" width="267" height="19" alt="Painel de Controle Empresa" title="Painel de Controle Empresa"/></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
           </td>
          </tr>
             <tr>
           <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
                  <td valign="top"><br /><%@include file="includes_html/menu_geral.jsp" %></td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
               <td valign="top">
                   
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                  <td height="30"></td>
                  </tr>
                      <td class="menu" valign="top">
                    <!--inicio menu-->
                        <ul>
                            <li><a href="Planos.jsp"><img src="imagens/topo/bt_comprarlances.JPG" width="109" height="42" alt="Comprar Lances" title="Comprar Lances" border="0" /></a></li>
                        </ul>
                    </td>
                     
                 <!-- busca solicitacoes -->

                 <tr>
                 <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_es_laranja.jpg" width="12" height="14" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                    <td bgcolor="#F29400">&nbsp;</td>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_di_laranja.jpg" alt="Solicitações" width="12" height="14" vspace="24"  border="0" title="Solicitações"/></td>
                                  </tr>
                     </table>
                 </td>
                 </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="12" bgcolor="#F29400">&nbsp;</td>
                                    <td valign="top" class="soli_geralz"><form action="ControleSolicitacao?cmd=buscarAcompanhaSolicitacao" method="post">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F29400">
                                                    <tr>
                                                        <td class="mensagem" align="center" colspan="3">
                                                            <p class="mensagem">${mensagem}</p><br />
                                                        </td>
                                                     </tr>    
                                                <tr>
                                                    <th colspan="2" class="txt_soli">
                                                        Não é necessário preencher todos os campos para se efetuar uma busca.
                                                    </th>
                                                </tr>   
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                </tr> 
                                                <tr>
                                                  <td width="180" align="right" class="txt_soli">Produto/Serviço desejado:</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="10">&nbsp;</td>
                                                        <td width="12" align="right"><img src="imagens/busca_solicitacoes/ct_form_e_laranja.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                        <td width="100"><input type="text" name="produto" size="60" class=" form_sol" value=''></td>
                                                        <td width="11"><img src="imagens/busca_solicitacoes/ct_form_d_laranja.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                        <td>&nbsp;</td>
                                                      </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" bgcolor="#F29400" style="color:#FFF;">Categorias:</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="10" height="22">&nbsp;</td>
                                                        <td>
                                                            <select size="1" name="categoria" id="search_category_id" class="form_sol" style="width: 300px;">
                                                                <option value="" selected>Escolha</option>
                                                                <%
                                                                    Generico g = new Generico();
                                                                    List<Categorias>lista = g.listarCategoriasAll();
                                                                        for(Categorias c : lista){

                                                                %>                                                                                                                                                                 

                                                                <option value="<% out.print(c.getNcategoria()); %>"><% out.print(c.getNome()); %></option>
                                                                <% } %> 	
                                                            </select> 
                                                        </td>
                                                      </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" class="txt_soli">Subcategoria</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="12" align="right"></td>
                                                        <td width="100">
                                                            <select size="1" name="nsubcategoria" id="sub_category_id" class="form_sol" style="width: 200px;">
                                                                <option value="" selected>Escolha</option>  

                                                            </select>
                                                        </td>
                                                        <td width="11"></td>
                                                        <td>&nbsp;</td>
                                                      </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" class="txt_soli" valign="top"> Estado:</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="10">&nbsp;</td>
                                                        <td width="100"><select size="1" name="Estado" class="">
                                                            <option value="Selecione" selected>Escolha</option>
                                                            <option value="AC">AC</option>
                                                            <option value="AL">AL</option>
                                                            <option value="AM">AM</option>
                                                            <option value="AP">AP</option>
                                                            <option value="BA">BA</option>
                                                            <option value="CE">CE</option>
                                                            <option value="DF">DF</option>
                                                            <option value="ES">ES</option>
                                                            <option value="GO">GO</option>
                                                            <option value="MA">MA</option>
                                                            <option value="MG">MG</option>
                                                            <option value="MS">MS</option>
                                                            <option value="MT">MT</option>
                                                            <option value="PA">PA</option>
                                                            <option value="PB">PB</option>
                                                            <option value="PE">PE</option>
                                                            <option value="PI">PI</option>
                                                            <option value="PR">PR</option>
                                                            <option value="RJ">RJ</option>
                                                            <option value="RO">RO</option>
                                                            <option value="RN">RN</option>
                                                            <option value="RR">RR</option>
                                                            <option value="RS">RS</option>
                                                            <option value="SE">SE</option>
                                                            <option value="SC">SC</option>
                                                            <option value="SP">SP</option>
                                                            <option value="TO">TO</option>
                                                          </select></td>
                                                        <td>&nbsp;</td>
                                                      </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td>
                                                    <input alt="" border="0" src="imagens/busca_solicitacoes/bt_buscar.jpg" type="image" />
                                                  </td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                          <tr>
                                            <td></td>
                                          </tr>
                                        </table>
                                      </form></td>
                                    <td width="12" bgcolor="#F29400"></td>
                                  </tr>
                                </table></td>
                            </tr>

                          
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_es_laranja.jpg" width="12" height="14" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                    <td bgcolor="#F29400">&nbsp;</td>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_di_laranja.jpg" alt="Solicitações" width="12" height="14" vspace="24"  border="0" title="Solicitações"/></td>
                                  </tr>
                                </table>
                              </td>
                                <!-- fim busca solicitacoes -->
                 
                            </tr>
                  <tr>
                     <td height="30">&nbsp;</td>
                  </tr>
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                           <%//@include file="includes_html/menu_geral.jsp" %>
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

<td class="bd_linha_lados detalhes_int "><!--Tabela de conteudo-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <%
                                                     
                            Solicitacao s = (Solicitacao) session.getAttribute("solicitacao");
                            
                          SolitacaoDAO sd = new SolitacaoDAO();
                          List<Solicitacao>lista2 = sd.buscarSolicitacoes(s);
                            for(Solicitacao so : lista2){
                                                              
                          %>
					 <tr>
                          
                          <td width="9">&nbsp;</td>
                          <td class="caracteristicas_p" width="80%"><!--Inicio Linha de Caracteristicas-->
                            <ul>
	                            <li>Solicitação Nº: <% out.print(so.getNsolicitacao()); %> &nbsp; cadastrada em: <% out.print(so.getDataCriacao().toString()); %></li>
                              <li>

                              
                             
<!--                               <p> <img src="foto.jsp?paTipo=Solicitacao&paFoto=.jpg&paPorcent=100" width="60" height="70" align="left"/> </p>-->
                             

                                <h1><% out.print(so.getProduto()); %></h1>
                              </li>
                              <li>
                                <p><% out.print(so.getDescricao()); %></p>
                              </li>
                            </ul>
                           </td>
                          
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                          <td align="center" class="logo_po">
                              <a href="restrito_interagir_vendedor.jsp?nsolicitacao=<% out.print(so.getNsolicitacao()); %>">
                                  <img src="imagens/bt_detalhes.jpg" alt="Detalhes" width="64" height="22" border="0" title="Detalhes" /></a>
                         </td>
                      
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                        </tr> 
                        <tr>
                            <td class="bd_linha_bx ulti_soli2" colspan="4"></td>
                        </tr> 
			  <% } %>
                      </table>
                      <!--Fim conteudo--></td>

                 </tr>
	
                  <!--fim linha produtos-->
                  <!--inicio linha produtos--->
                  <!--fim linha produtos-->
                  <tr>
                  <td class="bd_linha_bx ulti_soli2">
                   <table>
                    <tr>
<%

%>                  
                    <td align="right" height="25"><a href="restrito_acompanhar_solicitacao_comprador.jsp?paPagina=<%//=loPagina%>"> <%//=loPagina%></a>|</td>
<%/*
*/
%> 
                  </tr>
                </table>
              </td>
				

                  </tr>
                </table>
                             </td>
                             <td width="15"></td>
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
    <td><%@include file="includes_html/minha_conta_geral.jsp" %></td>
    
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

  <tr>
    <td>&nbsp;</td>
  </tr>
</div>
</body>