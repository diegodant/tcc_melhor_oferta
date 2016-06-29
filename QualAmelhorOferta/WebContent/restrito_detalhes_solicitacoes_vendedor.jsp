<%-- 
    Document   : restrito_comprador_avaliacao_edita
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- #include file="lib\lib.asp"-->
<% /* 
If Request("paNSolicitacao") = "" Or Not IsNumeric(Request("paNSolicitacao")) Then
	Response.Redirect "lista_busca_solicitacoes.jsp"
End If

loCondicoes = " WHERE NSolicitacao = " & Request("paNSolicitacao")
If Session("Empresa-Logado") = "OK" Then
	loCondicoes = loCondicoes & " AND NEmpresaVencedora = " & Session("Empresa-NEmpresa")

ElseIf Session("Usuario-Logado") = "OK" Then
	loCondicoes = loCondicoes & " AND NUsuario = " & Session("Usuario-NUsuario")

Else
	Response.Redirect "lista_busca_solicitacoes.jsp"

End If

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")
Set loRS3 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loRS.Open "SELECT NSolicitacao, NUsuario, NEmpresaVencedora, Produto, Descricao, Status, UA FROM Solicitacoes" & loCondicoes, loConexao
If loRS.Eof Then

	Response.Redirect "lista_busca_solicitacoes.jsp"

Else
	
	If loRS("Status") <> 2 Then
		Response.Redirect "detalhes_solicitacoes.jsp?paNSolicitacao=" & Request("paNSolicitacao")
	End If
 */ %>
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
  <tr>
    <td height="61" class="back_busca">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            <form action="nova_solicitacao.jsp" method="post">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="titu_eu"><img src="imagens/busca/titu_eu-quero.jpg" width="89" height="14" alt="Eu quero" title="Eu quero" border="0" /></td>
                          </tr>
                          <tr>
                            <td>
							<input name="Produto" type="text" class="form_bu"  /></td>
                          </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="titu_ca"><img src="imagens/busca/titu_categoria.jpg" width="116" height="15" alt="Eu quero" title="Eu quero" border="0" /></td>
                          </tr>
                          <tr>
                            <td><select name="Categoria" class="form_bu2" >
									 <option>Selecione</option>
									 
<% /* 
	loRS2.Open "SELECT NCategoria, Nome FROM Categorias WHERE Ativa=1 ORDER BY Nome" , loConexao
	While Not loRS2.Eof
 */ %>

						<option value="<% /* =loRS2("NCategoria") */ %>"><% /* =loRS2("Nome") */ %></option>

<% /* 
	       loRS2.MoveNext
	WEnd
	loRS2.Close
 */ %>
                              
                              </select>
                          </td>
                          </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          
                      <tr>
                            <td valign="top">
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <!--<td class="titu_ca"><img src="imagens/usuarios/titu_regiao.jpg" width="73" height="15" alt="Eu quero" title="Eu quero" border="0" /></td>
                          </tr>
                          <tr>
                            <td>
                                                                     <select size="1" name="Estado" class="">
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
                                                                        </select>
                                                                    </td>-->
                          </tr>
                        </table>
                            </td>
                        </tr>
                      </table>
                    </td>
                    <td>&nbsp;</td>
                    <td valign="bottom">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          
                          <tr>
                           <td width="248" valign="bottom" class="ok_usu"><input name="" type="image" src="imagens/usuarios/bt_ok.jpg" /></td>                          </tr>
                      </table>
                    </td>
                  </tr>
                </table>
            </form>
            </td>
            
          </tr>
        </table>
    </td>
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
                        <% /* 
                        If Session("Usuario-NUsuario") <> "" Then
                         */ %>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="160" valign="top"><img src="imagens/usuarios/titu_solicitacoes.jpg" width="151" height="20" alt="Solicitações" title="Solicitações" border="0" /></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
                          <% /* 
                          Else
                           */ %>
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="175" valign="top"><img src="imagens/busca_solicitacoes/titu_solicitacoes_geral.jpg" width="165" height="20" alt="Solicitações" title="Solicitações" border="0" /></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="10"><img src="imagens/usuarios/pt_cima_minha-conta2.jpg" width="10" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
						<% /* 
						End If
						 */ %>
                        </td>
                      </tr>
                      <tr>
                      	<td><h1><% /* =Request("paMsg") */ %></h1></td>
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
                    <td width="747"><img src="imagens/busca_solicitacoes/titu_lista_int.jpg" width="747" height="30" alt="Intera&ccedil;&otilde;es" /></td>
                  </tr>
                  <tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        
                        <!--fim tabela-->
                        
                        <td width="450" class="caracteristicas2"><!--Inicio Linha de Caracteristicas-->
				<ul>
                
                			 <li>Solicitação Nº: <% /* =loRS("NSolicitacao") */ %></li>
                            <li>Solicitação cadastrada em: <% /* =loRS("UA") */ %></li>
                            <li>
                              <h1 style="font-weight: bold; color: #FF0000; font-size: large"><% /* =loRS("Produto") */ %></h1>
                            </li>
                            <li>
                              <p><% /* =loRS("Descricao") */ %></p>
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
                    <h2>Dados do Comprador</h2></td>
                  </tr>
<tr>
                    <td class="bd_linha_lados bd_linha_bx_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="16">&nbsp;</td>
                        <td width="15">&nbsp;</td>
                        <td class="caracteristicas2">
                        <!--Inicio Linha de Caracteristicas-->
                          <ul>
<% /* 
	loVencedor = False
	
	If loRS("NEmpresaVencedora") <> "" And IsNumeric(loRS("NEmpresaVencedora")) Then

		loRS2.Open "SELECT * FROM Usuarios WHERE NUsuario = " & loRS("NUsuario"), loConexao
		If Not loRS2.Eof Then
	
			For Each loCampo In loRS2.Fields
				Execute "lo" & loCampo.Name & " = loRS2(""" & loCampo.Name & """)"
			Next
					
			loVencedor = True
	
		End If
		loRS2.Close

	End If

If loVencedor Then
 */ %>
                            <li>
                              <h1><% /* =loApelido */ %></h1>
                            </li>
                           
                            <li>
                              <h2>Dados do Comprador</h2></li>
                            <% /* 
                            If loNome <> "" Then
                             */ %>
                            <li><b>Nome: <% /* =loNome */ %></b></li>
                            <% /* 
                            End IF
                             */ %>
							<li><b>
							 <% /* 
								 If loEmail <> "" Then
								 */ %>
							E-mail: <% /* =loEmail */ %>
							</b></li>
							<% /* 
							End If
							 */ %>
                            <li><b>Endereço: <% /* =loEndereco */ %>&nbsp;&nbsp;&nbsp; 
							CEP: <% /* =loCEP */ %></b></li>
																<li><b>Bairro:
																<% /* =loBairro */ %>&nbsp;&nbsp; 
																Cidade: <% /* =loCidade */ %>
																</b></li>
																<li><b>E-mail:
																<% /* =loEmail */ %></b>
																</li>
																<li><b>Telefone:
																<% /* =loTelefone */ %>
																</b></li>
																<li>&nbsp;</li>
																<li><!--<a href="#"><img src="imagens/usuarios/bt_quero_oferta.jpg" width="155" height="34" alt="Quero essa oferta" title="Quero essa oferta" border="0" /></a>-->
																</li>
<% /* 
	Else
 */ %>
							<li><h1>Nenhuma proposta escolhida.</h1></li>
<% /* 
	End If
 */ %>
                          </ul>
                          <!--Fim Linha de Caracteristicas--></td>
                        
                        <td width="15" valign="bottom" class="bt_reportar"m>&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                   <td class="interacoes bd_linha_lados"><h2>Interações da Solicitação</h2></td>
                  </tr>
                  <!--inicio linha produtos--->
<% /* 
	If Request("paPagina") <> "Todas" Then

		loNRegistros = 30
		
		If Request("paPagina") <> "" And IsNumeric(Request("paPagina")) Then
			loPagina = CInt(Request("paPagina"))
		Else
			loPagina = 1
		End If

		loPosicao = (loPagina - 1) * loNRegistros
		loLimite = " LIMIT " & loPosicao & ", " & loNRegistros

		loRS2.Open "SELECT COUNT(NInteracao) AS Total FROM Interacoes WHERE NSolicitacao = " & Request("paNSolicitacao"), loConexao
		loTotal = CLng(loRS2("Total"))
		loRS2.Close
		
		loUltima = loTotal / loNRegistros
		
		If loUltima > Fix(loUltima) Then
			loUltima = Fix(loUltima) + 1
		End If

	Else
	
		loPagina = 1
		loUltima = 1

	End If

	loRS2.Open "SELECT NInteracao, Apelido, NomeFantasia, I.NEmpresa, I.NUsuario, Texto FROM (Interacoes I LEFT JOIN Empresas E ON I.NEmpresa = E.NEmpresa) LEFT JOIN Usuarios U ON I.NUsuario = U.NUsuario WHERE NSolicitacao = " & Request("paNSolicitacao") & " ORDER BY I.UA DESC" & loLimite, loConexao
	While Not loRS2.Eof 
		
		loMediaGeral = 0
		If loRS2("NUsuario") <> "" Then
			loNome = loRS2("Apelido")
			loNEmpresa = loRS2("NEmpresa")

			loRS3.Open "SELECT IFNULL(AVG(Comunicacao), 0) AS MediaComunicacao, IFNULL(AVG(UConfiabilidade), 0) AS MediaConfiabilidade FROM Avaliacoes WHERE Ativo = 1 AND Avaliado = 1 AND NUsuario = " & loRS2("NUsuario"), loConexao
				If loRS3("MediaComunicacao") <> "" Then
					loMediaGeral = (CDbl(loRS3("MediaComunicacao")) + CDbl(loRS3("MediaConfiabilidade"))) / 2
					loMediaGeral = Fix(loMediaGeral)
				End If
			loRS3.Close
		End If
		
		If loRS2("NEmpresa") <> "" Then
			loNome = loRS2("NomeFantasia")
			loNEmpresa = loRS2("NEmpresa")

			loRS3.Open "SELECT IFNULL(AVG(Atendimento), 0) AS MediaAtendimento, IFNULL(AVG(Qualidade), 0) AS MediaQualidade, IFNULL(AVG(EConfiabilidade), 0) AS MediaConfiabilidade FROM Avaliacoes WHERE Ativo = 1 AND Avaliado = 1 AND NEmpresa = " & loRS2("NEmpresa"), loConexao
				If loRS3("MediaAtendimento") <> "" Then
					loMediaGeral = (CDbl(loRS3("MediaAtendimento")) + CDbl(loRS3("MediaQualidade")) + CDbl(loRS3("MediaConfiabilidade"))) / 3
					loMediaGeral = Fix(loMediaGeral)
				End If
			loRS3.Close

		End If
 */ %>
			<tr>
                    <td class="bd_linha_lados detalhes_int "><!--Tabela de conteudo-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="16">&nbsp;</td>
                          <td>&nbsp;</td>
                          <td class="caracteristicas_p"><!--Inicio Linha de Caracteristicas-->
                            <ul>
					<li>
                               
                                
<% /* 
loNPlano = "Usuario"
If Session("Empresa-NEmpresa") <> "" Then
	loRS3.Open "SELECT NPlano FROM Assinaturas Where NEmpresa =" & Session("Empresa-NEmpresa"), loConexao
		If loRS3("NPlano") <> 1 Then 
			loNPlano = loRS3("NPlano")
		Else
			loNPlano = 1	
		End if	
	loRS3.close	
End if		
	
	If loNPlano = "Usuario"  Then				
		loFoto = Application("DirEmpresas") & "Logo" & loNEmpresa & ".jpg"
	
		If ExisteArq(loFoto) Then
	 */ %>
				 <h3>Responsável pela interação:</h3><img src="foto.jsp?paTipo=Logo&paFoto=Logo<% /* =loNEmpresa */ %>.jpg&paPorcent=40" alt="<% /* =loNomeFantasia */ %>" />
	<% /* 
		End if
	Else
	 */ %>	

                                <h3>Responsável pela interação: <b> <% /* =loNome */ %></b> </h3>

<% /* 
	End if

 */ %>                               
                              </li>

					<li>
                                <p><% /* =loRS2("Texto") */ %></p>
                              </li>
                            </ul>
                            <!--Fim Linha de Caracteristicas--></td>
                            <td width="10">&nbsp;</td>
                          <td width="110">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="avali" align="center">
                                 <ul>
                                  <li><h1>Avaliação Geral</h1></li>
                                  <li>
<% /* 
		loCont = 0
		While loCont < loMediaGeral
 */ %>
                                  <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
<% /* 
			loCont = loCont + 1
		WEnd
	
		While loCont < 5
 */ %>
                                  <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
<% /* 
			loCont = loCont + 1
		WEnd
 */ %>
                        
                                  </li>
                                 </ul>
                                </td>
                              </tr>
<% /* 
		'Apenas quem fez a proposta, pode aceitá-la
		If Session("Usuario-Logado") = "OK" And CStr(loRS2("NUsuario") & "") <> CStr(loRS("NUsuario") & "") And Session("Usuario-NUsuario") = loRS("NUsuario") Then
 */ %>
<% /* 
		End If
 */ %>
                            </table>
                          </td> 
                          <td width="1"><img src="imagens/usuarios/linha_divisoria.jpg" width="1" height="93" alt="Divisoria" title="Divisoria" border="0" /></td>
                        </tr>
                      </table>
                      <!--Fim conteudo--></td>
                  </tr>

<% /* 
	       loRS2.MoveNext
	WEnd

	loRS2.Close
 */ %>                  <!--fim linha produtos-->
                                 
                  <tr>
                    <td class="bd_linha_lados bt_aceitar" width="150" align="left" height="25"></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr>
                  </table></td>
              </tr>
            </table></td>
            <td width="12">&nbsp;</td>
            <td width="215" valign="top">
<% /* 
If Session("Usuario-NUsuario") <> "" Then
 */ %>
             <!--#include file="includes/minha_conta.jsp"-->
<% /* 
Else
 */ %>
             <%@include file="includes_html/nuvem_tags.jsp" %>
<% /* 
End If
 */ %>
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
<% /* 
End If

loRS.Close
loConexao.Close

Set loRS3 = Nothing
Set loRS2 = Nothing
Set loRS = Nothing
Set loConexao = Nothing
 */ %>