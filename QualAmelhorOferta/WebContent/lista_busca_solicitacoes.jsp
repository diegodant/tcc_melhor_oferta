<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.melhoroferta.entidades.Solicitacao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- #include file="lib\lib.jsp"-->
<%
//loCondicoes = " WHERE Status = 1 "
//If Request("Produto") <> "" Then
//
//	If loCondicoes <> "" Then
//		loCondicoes = loCondicoes & " AND LCase(Produto) REGEXP '" & Acentos(Request("Produto")) & "'"
//	Else
//		loCondicoes = " WHERE LCase(Produto) REGEXP '" & Acentos(Request("Produto")) & "'"
//	End If
//
//End If
//If Request("Categoria") <> "" And Request("Categoria") <> "Selecione" Then
//
//	If loCondicoes <> "" Then
//		loCondicoes = loCondicoes & " AND (SS.NCategoria) = " & Request("Categoria")
//	Else
//		loCondicoes = " WHERE (SS.NCategoria) = " & Request("Categoria")
//	End If
//
//End If
//If Request("SubCategoria") <> "" And Request("SubCategoria") <> "Selecione" Then
//
//	If loCondicoes <> "" Then
//		loCondicoes = loCondicoes & " AND (SS.NSubCategoria) = " & Request("SubCategoria")
//	Else
//		loCondicoes = " WHERE (SS.NSubCategoria) = " & Request("SubCategoria")
//	End If
//
//End If
//
//If Request("Cidade") <> "" Then
//
//	If loCondicoes <> "" Then
//		loCondicoes = loCondicoes & " AND LCase(U.Cidade) REGEXP '" & Acentos(Request("Cidade")) & "'"
//	Else
//		loCondicoes = " WHERE LCase(U.Cidade) REGEXP '" & Acentos(Request("Cidade")) & "'"
//	End If
//
//End If
//
//If Request("Estado") <> "" And Request("Estado") <> "Selecione" Then
//
//	If loCondicoes <> "" Then
//		loCondicoes = loCondicoes & " AND LCase(U.Estado) REGEXP '" & Acentos(Request("Estado")) & "'"
//	Else
//		loCondicoes = " WHERE LCase(U.Estado) REGEXP '" & Acentos(Request("Estado")) & "'"
//	End If
//
//End If
//
//'If Session("Condicoes") <> "" Then
//'	loCondicoes = Session("Condicoes")
//'End If
//
//'Session("Condicoes") = loCondicoes

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
    <td>&nbsp;</td>
  </tr>

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
                                <td width="175" valign="top"><img src="imagens/busca_solicitacoes/titu_solicitacoes_geral.jpg" width="165" height="20" alt="Solicitações" title="Solicitações" border="0" /></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="10"><img src="imagens/usuarios/pt_cima_minha-conta2.jpg" width="10" height="26" alt="Minha Conta" /></td>
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
                    <td width="747"><img src="imagens/busca_solicitacoes/titu_lista_busca.jpg" width="747" height="30" alt="Buscar Solicita&ccedil;&otilde;es" /></td>
                  </tr>
                  <!-- inicio linha produtos -->

   
               <tr>

<td class="bd_linha_lados detalhes_int "><!--Tabela de conteudo-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <%
                                                     
                            Solicitacao s = (Solicitacao) session.getAttribute("solicitacao");
                            
                          SolitacaoDAO sd = new SolitacaoDAO();
                          List<Solicitacao>lista = sd.buscarSolicitacoes(s);
                            for(Solicitacao so : lista){
                                                              
                          %>
                        <tr>
                          
                          <td width="9">&nbsp;</td>
                          <td class="caracteristicas_p" width="75%"><!--Inicio Linha de Caracteristicas-->
                            <ul>
                            <li>Solicitação Cadastrada em: <% out.print(so.getDataCriacao()); %></li>
                              <li>
                                <h1><a href="detalhes_solicitacoes.jsp?NSolicitacao=<% out.print(so.getNsolicitacao()); %>"><% out.print(so.getProduto()); %></a></h1>
                              </li>
                              <li>
                                <p><% out.print(so.getDescricao()); %></p>
                              </li>
                            </ul>
                            <!--Fim Linha de Caracteristicas--></td>
                          
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                          <td align="center" class="logo_po"><a href="detalhes_solicitacoes.jsp?NSolicitacao=<% out.print(so.getNsolicitacao()); %>"><img src="imagens/bt_detalhes.jpg" alt="Detalhes" width="64" height="22" border="0" title="Detalhes" /></a></td>
                      
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
                  <td align="right">
				<form action="lista_busca_solicitacoes.jsp" name="Paginador" method="post">
<%
//	For loCont = 1 To loUltima
//		If loCont = loPagina Then
		
%>
		                    <a href="javascript:Paginacao('<%//=loCont%>');">
						<font style="font-weight: bold; color: #314D97; font-size: large"><%//=loCont%></font></a> |
<%
//		Else
%>
		            	  <a href="javascript:Paginacao('<%//=loCont%>');"><%//=loCont%></a> |
<%
//		End If
//	Next
%>
		                    <a href="javascript:Paginacao('Todas');">Todas +</a>
			                  <input name="paPagina" type="hidden" value="1" />
						<input type="hidden" name="Produto" value='<%//=Request("Produto")%>'/>
						<input type="hidden" name="Cidade" value='<%//=Request("Cidade")%>'/>
						<input type="hidden" name="Estado" value='<%//=Request("Estado")%>'/>
						<input type="hidden" name="Categoria" value='<%//=Request("Categoria")%>'/>
						<input type="hidden" name="SubCategoria" value='<%//=Request("SubCategoria")%>'/>
				</form>
			</td>
                  </tr>
                </table>
              </td>
				

                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="12">&nbsp;</td>
            <td width="215" valign="top">
              <%@include file="includes_html/cadastrese.inc" %>  
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
