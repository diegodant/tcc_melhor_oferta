<%-- 
    Document   : restrito_minha_solicitacao_comprador
    Created on : 12/05/2012, 18:28:24
    Author     : Diego
--%>


<%@page import="br.com.melhoroferta.persistencia.PropostaDAO"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
//
//    $(document).ready(function() {
//        var id = <% //out.print(s.getNsolicitacao()); %>;
//       $.post("verifica_interacao.jsp?listarProposta",{
//           parent_id : id 
//       }, function(response){
//           $("#interacao").html(response);
//       }
//    );
//  });
</script>
<script type="text/javascript">
function Paginacao(paPagina)
{
 Form = document.Paginador
 Form.paPagina.value = paPagina;
 Form.submit();
}
/*function ValidadorWLD(Form)
{
 if (isNaN(Form.Valor.value) == true)
 {
  alert("O Pre�o digitado n�o � v�lido.Por favor, digite apenas n�meros.");
  Form.Valor.focus();
  return (false);
 }
 
}*/
</script>

<script>

var backspaceKey = 8;

var deleteKey = 46;

var pasteKey = 86;

var cutKey = 88;

var k1 = 37;

var k2 = 38;

var k3 = 39;

var k4 = 40;

function isValidKey(keyCode)

{

if (keyCode==backspaceKey || keyCode==deleteKey || keyCode==k1 || keyCode==k2 || keyCode==k3 || keyCode==k4)

return true;

return false;

}

function MascaraMoeda(objTextBox, SeparadorMilesimo, SeparadorDecimal, e){

//alert(abobrinha);

var sep = 0;

var key = '';

var i = j = 0;

var len = len2 = 0;

var strCheck = '0123456789\37';

var aux = aux2 = '';

if (!e) e = window.event;

var whichCode = e.which || e.keyCode;

if (isValidKey(whichCode)) return true;

key = String.fromCharCode(whichCode); // Valor para o c�digo da Chave

if (strCheck.indexOf(key) == -1) return false; // Chave inv lida

len = objTextBox.value.length;

for(i = 0; i < len; i++)

if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorDecimal)) break;

aux = '';

for(; i < len; i++)

if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);

aux += key;

len = aux.length;

if (len == 0) objTextBox.value = '';

if (len == 1) objTextBox.value = '0'+ SeparadorDecimal + '0' + aux;

if (len == 2) objTextBox.value = '0'+ SeparadorDecimal + aux;

if (len > 2) {

aux2 = '';

for (j = 0, i = len - 3; i >= 0; i--) {

if (j == 3) {

aux2 += SeparadorMilesimo;

j = 0;

}

aux2 += aux.charAt(i);

j++;

}

objTextBox.value = '';

len2 = aux2.length;

for (i = len2 - 1; i >= 0; i--)

objTextBox.value += aux2.charAt(i);

objTextBox.value += SeparadorDecimal + aux.substr(len - 2, len);

}

return false;

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
                     <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     	<td colspan="3">&nbsp;
                       <tr>
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                             <%@include file="includes_html/menu_restrito_comprador.inc" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td>
                             
                             
                             
                             
  <table width="523" border="0" cellspacing="0" cellpadding="0">
                
                  <tr>
                      <td class="mensagem" align="center">
                          <p class="mensagem">${mensagem}</p>
                      </td>
                   </tr>
                  <tr>
                    <td width="523">
                    	<img src="imagens/busca_solicitacoes/titu_lista_busca_restrito.jpg" width="523" height="30" alt="Intera&ccedil;&otilde;es" />
                    </td>
                  </tr>
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2 soli_geral">
                        
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                          <td class="img_deta" width="16">


<!--                            <img src="imagens/membros2.jpg" width="80" /> -->
                 
                       </td>
                        
                        <!--fim tabela-->

                        
<%
int nsolicitacao = Integer.parseInt(request.getParameter("nsolicitacao"));
Solicitacao solicitacao = new Solicitacao();
solicitacao.setNsolicitacao(nsolicitacao);
session.setAttribute("solicitacao", solicitacao);
List<Proposta> listProposta = new PropostaDAO().listarProposta(request, response);
Proposta p = listProposta.get(0);

%>                         
                        <td width="450" class="caracteristicas2"><!--Inicio Linha de Caracteristicas-->
				<ul>
                            <li>
                              <h1 style="font-weight: bold; color: #FF0000; font-size: large"><% out.print(p.getSolicitacao().getProduto()); %></h1>
                            </li>
                            <li>
                            
                            </li>
                            <li class="txt_soli">
                              <% out.print(p.getSolicitacao().getDescricao()); %>
                            </li>
                            
                            <br  />
                            
                            <li class="txt_soli">Solicita&ccedil;&atilde;o N&ordm;: 
                            <% out.print(p.getSolicitacao().getNsolicitacao()); %> &nbsp; cadastrada em: <% out.print(p.getSolicitacao().getDataCriacao()); %>
                            </li>
                          </ul>
                          <br />
                        <!--Fim Linha de Caracteristicas--></td>
                        
                        <td width="15" valign="bottom" class="bt_reportar"m>&nbsp;</td>
                        </tr>
                    </table>
                   </td>
                  </tr>
                  <tr>
                   <td class="interacoes bd_linha_lados"><h2>Intera&ccedil;&otilde;es da Solicita&ccedil;&atilde;o</h2></td>
                  </tr>
                  <!--inicio linha produtos--->
<%
/*
	 */
%>
                   



<%

    for(Proposta p2 : listProposta){
        if( p2.getId().getNproposta() > 0 ){
%>


                   <tr>
                    <td class="bd_linha_lados detalhes_int "><!--Tabela de conteudo-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="16">&nbsp;</td>
                          <td>
                              <%
                                    //loFoto = Application("DirEmpresas") & "Logo" & loRS2("NEmpresa") & ".jpg"
                                    //If ExisteArq(loFoto) Then
                            %>

<!--                        <img src="imagens/membros2.jpg"  width="80" />-->
						
                          </td>
                          <td class="caracteristicas_p"><!--Inicio Linha de Caracteristicas-->
                            <ul>
                                <li>
                               		<br/>
                                   		 Data da Intera&ccedil;&atilde;o: <% out.print(p2.getDataInteracao()); %>
                                    <br/>

                                    <h1>Respons&aacute;vel Pela Intera&ccedil;&atilde;o:<b> 
                                	  <% out.print(p2.getUsuario().getFantasia()); %></b>
                                    </h1>
<!--                                    <h1>Respons&aacute;vel Pela Intera&ccedil;&atilde;o:<b> <a href="vz_avaliacoes_comprador.jsp?nusuario=<% //out.print(p.getUsuario().getNusuario()); %>">
                                	<% //out.print(p.getUsuario().getNome()); %>(<%//=loTotalAvaliacao%>)</a></b>
                                    </h1>-->
                              </li>

					
                              <li>
                                <p>Observa&ccedil;&atilde;o: <% out.print(p2.getObservacao()); %></p>

                               <p>Valor proposto: <% out.print(p2.getValor()); %></p>
                              </li>
                            </ul>
                            <!--Fim Linha de Caracteristicas--></td>
                            <td width="10">&nbsp;</td>
                          <td width="110">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="avali" align="center">
                                 <ul>
                                  <li>
                                    <h1>Avalia&ccedil;&atilde;o </h1></li>
                                  <li>

                                  <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliacoes" title="Avaliacoes" />

                                  <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliacoes" title="Avaliacoes" />

                        
                                  </li>
                                 </ul>
                                </td>
                              </tr>
                              <tr>
                                  <td align="center" valign="bottom" class="logo_abuso"><a href="mailto:contato@melhoroferta.net"><img src="imagens/usuarios/bt_reportar.jpg" width="77" height="15" alt="Reportar" title="Reportar" border="0" /></a></td>
                              </tr>

                              <tr>
                                  <td align="center" valign="bottom" class="logo_abuso"><a href="ControleSolicitacao?cmd=fecharSolicitacao&nproposta=<% out.print(p2.getId().getNproposta()); %>&nempresa=<% out.print(p.getVendedor().getNvendedor()); %>&nsolicitacao=<% out.print(p.getSolicitacao().getNsolicitacao()); %>"><img src="imagens/busca_solicitacoes/bt_aceitar.jpg" alt="Aceitar Proposta" width="115" height="27" border="0" /></a></td>
                              </tr>

                            </table>
                          </td> 
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                        </tr>
                      </table>
                      <!-- Fim conteudo -->
					  </td>
                  </tr>

               <!--fim linha produtos-->



<%
        }
    }
%>






                  <tr>
                    <td class="bd_linha_lados" width="150" align="right" height="25">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="bd_linha_lados bt_aceitar" width="150" align="left" height="25">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="bd_linha_bx ulti_soli2" width="150" align="right" height="25">
				<form action="detalhes_solicitacoes.jsp" name="Paginador" method="post">
<%
	//For loCont = 1 To loUltima
	//	If loCont = loPagina Then
		
%>
		                    <a href="javascript:Paginacao('<%//=loCont%>');">
						<font style="font-weight: bold; color: #314D97; font-size: large"><%//=loCont%></font></a> |
<%
	//	Else
%>
		            	  <a href="javascript:Paginacao('<%//=loCont%>');"><%//=loCont%></a> |
<%
	//	End If
	//Next
%>
                    <a href="javascript:Paginacao('Todas');">Todas +</a>
	                  <input name="paPagina" type="hidden" value="1" />
                          <input type="hidden" name="NSolicitacao" value='<% out.print(s.getNsolicitacao()); %>'/>
					</form>
				</td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <form method="post" action="ControleSolicitacao?cmd=cadastrarInteracaoComprador" onSubmit="return ValidadorWLD(this)"> 
                    <table style="width: 100%">
                    	<tr>
                    	 <td><h1>Inserir Intera&ccedil;&atilde;o</h1></td>
                    	</tr>
                    	<tr>
                    	 <td></td>
                    	</tr>
<%
/*
'Apenas empresas com validade igual ou superior � data de hoje ou o usu�rio que fez a solicita��o, que pode interagir

loInteracao = False
If Session("Usuario-NUsuario") <> "" And IsNumeric(Session("Usuario-NUsuario")) Then
	If Session("Usuario-NUsuario") = loRS("NUsuario") Then
		loInteracao = True
	End If
End If

If Session("Empresa-NEmpresa") <> "" Then

loRS3.Open "SELECT NPlano, Negociacoes FROM Assinaturas WHERE NEmpresa = " & Session("Empresa-NEmpresa"), loConexao
		
				If loRS3("Negociacoes") > 0 Then
					loInteracao = True
					loEmpresa = True
				End If
	
loRS3.Close
End if
If loInteracao Then*/
%>
						<tr>
							<td>
							<textarea name="texto" style="width: 485px; height: 135px"></textarea></td>
						</tr>
						
						<tr>
							<td>Determine o valor de sua oferta: R$<input name="valor" type="text" onKeyPress="return(MascaraMoeda(this,'.',',',event))"/></td>
						</tr>
		
						<tr>
							<td><input name="NSolicitacaoIntera" type="hidden" value='<% out.print(s.getNsolicitacao()); %>' />
							</td>
						</tr>
						<tr>
							<td><input type="image" name="imageField" id="imageField" src="imagens/bt_enviar.jpg" /><input name="NInteracao" type="hidden" value="<%//=loNInteracao%>" /></td>
						</tr>
<%
//Else
%>
                    	
<%
//End If
%>
					</table>
				</form>
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
