<%--  
    Document   : restrito_minha_solicitacao_comprador
    Created on : 12/05/2012, 18:28:24
    Author     : Diego
--%>


<%@page import="java.util.Date"%>
<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%@page import="br.com.melhoroferta.entidades.Proposta"%>
<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% 
int nsolicitacao = Integer.parseInt(request.getParameter("nsolicitacao"));
String msg = request.getParameter("msg");
Proposta proposta = new SolitacaoDAO().exibeSolicitacao(nsolicitacao);      
%>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">
function Paginacao(paPagina)
{
	Form = document.Paginador
	Form.paPagina.value = paPagina;
	Form.submit();
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
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                             <%@include file="includes_html/menu_geral.jsp" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td width="613">
                             
                             
                             
                        
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
            <td width="520" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="24">&nbsp;</td>
                <td width="520"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="570"><img src="imagens/busca_solicitacoes/titu_lista_int.jpg" width="570" height="30" alt="Intera&ccedil;&otilde;es" /></td>
                  </tr>
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        
                        <!--fim tabela-->
                        
                        <td width="450" class="caracteristicas2"><!--Inicio Linha de Caracteristicas-->
				<ul>
                
                			 <li>Solicitação Nº: <% out.print(proposta.getSolicitacao().getNsolicitacao()); %></li>
                            <li>Solicitação cadastrada em: <% out.print(proposta.getSolicitacao().getDataCriacao() == null ? new Date().toString() : proposta.getSolicitacao().getDataCriacao()); %></li>
                            <li>Data da finalização: <% out.print(proposta.getSolicitacao().getDataFinalizacao() == null ? new Date().toString() : proposta.getSolicitacao().getDataFinalizacao()); %></li>
                            <li>
                              <h1 style="font-weight: bold; color: #FF0000; font-size: large">
                                  Produto: <% out.print(proposta.getSolicitacao().getProduto()); %></h1>
                            </li>
                            <li>
                              <p>Descrição: <% out.print(proposta.getSolicitacao().getDescricao()); %></p>
                            </li>
                            <li></li>
                          </ul>
                        <!--Fim Linha de Caracteristicas--></td>
                        
                        <td width="15" valign="bottom" class="bt_reportar"m>&nbsp;</td>
                        </tr>
                    </table>
                   </td>
                  </tr>
<tr>
                    <td class="bd_linha_lados bd_linha_bx_2 interacoes bd_linha_lados">
                    <h2>Proposta Escolhida</h2></td>
                  </tr>
<tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        <td width="123" valign="top" class="logos">

				</td>
                        <td width="34">&nbsp;</td>
                        <td width="460" class="caracteristicas2">
                        <!--Inicio Linha de Caracteristicas-->
                          <ul>

                            <li>
                              <h1><%=proposta.getObservacao() %></h1>
                            </li>
                            <li>
                              <p>Valor proposto: <% out.print(proposta.getValor()); %></p>
                            </li>
                            <li><h2>Dados do Vendedor</h2></li>
                            
                            <li><b>Nome <% out.print(proposta.getVendedor().getUsuario().getNome()); %></b></li>
                            
			    <li><b>Email <% out.print(proposta.getVendedor().getUsuario().getEmail()); %> </b></li>
                            
                            <li><b>Contato <% out.print(proposta.getVendedor().getUsuario().getTelefone()); %> </b></li>
					
                            <%
                            Usuario vendedor = proposta.getVendedor().getUsuario();
                            String endereco = vendedor.getRua()+","+vendedor.getNumero()+" - "+vendedor.getBairro()+" - "+ vendedor.getCidade()+ " - "+vendedor.getEstado();
                            %>
                            <li><br/><b>Endereço: <%=endereco %> &nbsp;&nbsp;&nbsp;  CEP: <%=vendedor.getCep() %></b></li>
                            <li><b>Bairro: <%=vendedor.getBairro() %></b></li>
                          </ul>
                          <br />
                           <!--Fim Linha de Caracteristicas--></td>
                        
                        <td width="15" valign="bottom" class="bt_reportar">&nbsp;</td>
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
            <td width="363" align="center" valign="top">
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
           <td colspan="3">
           <!--inicio rodape-->
	  		 <%@include file="includes_html/rodape.inc" %>
           <!--fim rodape-->
           </td>
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
