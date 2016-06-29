<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
   Vendedor v = (Vendedor) session.getAttribute("vendedor");
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
                                <td width="250" valign="top"><img src="imagens/painel_empresa/tit_painel_empresa.jpg" width="252" height="17" alt="Painel de Controle Empresa" title="Painel de Controle Empresa"/></td>
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
                         <td valign="top">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      
                                      <tr>
                                             <td align="center" class="bac_la tabela_in">Plano Atual</td>
                                        </tr>
                                      <tr>
                                            <td>&nbsp;</td>
                                      </tr>
                                      
                                      <tr>
                                      
                                      
                                        
                                        <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="70" align="center" class="bac_la tabela_in">Data</td>
                                        <td align="center" class="bac_la tabela_in">Plano</td>
                                        <td align="center" class="bac_la tabela_in">Forma</td>
                                        <td align="center" class="bac_la tabela_in">Status</td>
                                        <!--<td align="center" class="bac_la tabela_in" width="70">Validade</td>-->
                                        <td align="center" class="bac_la tabela_in" width="100">Negocia&ccedil;&otilde;es</td>
                                        <td align="center" class="bac_la tabela_in" width="50">A&ccedil;&otilde;es</td>
                                      </tr>
<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NAssinatura, A.NEmpresa, A.NPlano, Data, FormaPagamento, Nome, IF(Status=1, 'Pago', 'Não Pago') AS Status, DataValidade, P.Negociacoes FROM Assinaturas A INNER JOIN Planos P ON A.NPlano = P.NPlano WHERE NEmpresa=" & Session("Empresa-NEmpresa") & " ORDER BY Data DESC" , loConexao

While NOT loRS.Eof
If loRS("FormaPagamento") = "Mastercard" Then
	loFoto = "bd_master.jpg"
ElseIF loRS("FormaPagamento") = "Visa" Then
	loFoto = "bd_visa.jpg"
ElseIf loRS("FormaPagamento") = "boleto" Then
	loFoto = "bd_boletos.jpg"
Else
	loFoto = "bd_gratuito.jpg"
End If

 */ %>

                                      <tr class="bac_cza">
                                        <td align="center" class="linha_d deta_tabela"><% /* =loRS("Data") */ %></td>
                                        <td height="40" align="center" class="linha_d"><% /* =loRS("Nome") */ %></td>
                                        
                                        <td class="linha_d deta_tabela"><img src="imagens/lista/<% /* =loFoto */ %>" width="42" height="25" alt="Boletos" /></td>
                                        <td class="linha_d deta_tabela"><% /* =loRS("Status") */ %></td>
                                        <!--<td class="linha_d deta_tabela"><% /* '=loRS("DataValidade") */ %></td>-->
                                        <td class="linha_d deta_tabela"><% /* =loRS("Negociacoes") */ %></td>
                                        <td class="linha_d deta_tabela" align="center"><a href="restrito_vendedor_atualizar_limite.jsp?paNAssinatura=<% /* =loRS("NAssinatura") */ %>">Detalhes</a></td>
                                      </tr>
<% /* 
	loRS.MoveNext
WEnd
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>                                       
                                         </table>
                                        </td>
                                      </tr>
                                      <tr>
                                      <td>&nbsp;</td>
                                      </tr>
                                     
                                      <tr>
                                        <td align="center" class="bac_cinz tabela_in">Planos Antigos</td>
                                      </tr>
                                      <tr>
                                      <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td>



<!--Inicio Planos Antigos-->

<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NAssinatura, A.NEmpresa, A.NPlano, Data, FormaPagamento, Nome, IF(Status=1, 'Pago', 'Não Pago') AS Status, DataValidade, P.Negociacoes FROM Assinaturas_Antigas A INNER JOIN Planos P ON A.NPlano = P.NPlano WHERE NEmpresa=" & Session("Empresa-NEmpresa") & " ORDER BY Data DESC" , loConexao
 */ %> 

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<% /* 
If Not loRS.eof Then
 */ %>
                                      <tr>
                                        <td width="70" align="center" class="bac_cinz tabela_in">Data</td>
                                        <td align="center" class="bac_cinz tabela_in">Plano</td>
                                        <td align="center" class="bac_cinz tabela_in">Forma</td>
                                        <td align="center" class="bac_cinz tabela_in">Status</td>
                                        <!--<td align="center" class="bac_cinz tabela_in" width="70">Validade</td>-->
                                        <td align="center" class="bac_cinz tabela_in" width="100">Negocia&ccedil;&otilde;es</td>
                                        <td align="center" class="bac_cinz tabela_in" width="50">A&ccedil;&otilde;es</td>
                                      </tr>
<% /* 
While NOT loRS.Eof
If loRS("FormaPagamento") = "Mastercard" Then
	loFoto2 = "bd_master.jpg"
ElseIF loRS("FormaPagamento") = "Visa" Then
	loFoto2 = "bd_visa.jpg"
ElseIf loRS("FormaPagamento") = "boleto" Then
	loFoto2 = "bd_boletos.jpg"
Else
	loFoto2 = "bd_gratuito.jpg"
End If

 */ %>

                                      <tr class="bac_cza">
                                        <td align="center" class="linha_d deta_tabela"><% /* =loRS("Data") */ %></td>
                                        <td height="40" align="center" class="linha_d"><% /* =loRS("Nome") */ %></td>
                                        <td class="linha_d deta_tabela"><img src="imagens/lista/<% /* =loFoto2 */ %>" width="42" height="25" alt="Boletos" /></td>
                                        <td class="linha_d deta_tabela"><% /* =loRS("Status") */ %></td>
                                        <!--<td class="linha_d deta_tabela"><% /* '=loRS("DataValidade") */ %></td>-->
                                        <td class="linha_d deta_tabela"><% /* =loRS("Negociacoes") */ %></td>
                                        <td class="linha_d deta_tabela" align="center"><a href="restrito_vendedor_atualizar_limite.jsp?paNAssinatura_Antiga=<% /* =loRS("NAssinatura") */ %>">Detalhes</a></td>
                                      </tr>
<% /* 
	loRS.MoveNext
WEnd
End if
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>                                       
                                         </table>

<!--Fim Planos Antigos-->                                                                                  

                                       </td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                </td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                               <td valign="top">
<% /* 
If Request("paNAssinatura") <> "" And IsNumeric(Request("paNAssinatura")) Then

	Set loConexao = Server.CreateObject("ADODB.Connection")
	Set loRS = Server.CreateObject("ADODB.Recordset")
	Set loRS2 = Server.CreateObject("ADODB.Recordset")
	
	loConexao.Open Application("BD")
	loRS.Open "SELECT P.Nome, P.Descricao, P.NPalavrasChave, A.Negociacoes AS NegociacoesRestantes, P.Negociacoes, P.QtCategoria, P.QtSubCategoria, NImagem, IF(Logotipo=1, 'Sim', 'Não') AS Logotipo, IF(Ativo=1, 'Sim', 'Não') AS Ativo FROM Assinaturas A INNER JOIN Planos P ON A.NPlano = P.NPlano WHERE NEmpresa = " & Session("Empresa-NEmpresa") & " AND NAssinatura = " & Request("paNAssinatura"), loConexao
	If Not loRS.Eof Then
 */ %>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><form id="form1" name="form1" method="post" action="">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td width="28%"><p>Nome do Plano:</p></td>
                                   <td width="72%" height="60"><h1><% /* =loRS("Nome") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Descrição:</p></td>
                                   <td><h1><% /* =loRS("Descricao") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Limite de Negociações:</p></td>
                                   <td height="60"><% /* =loRS("NegociacoesRestantes") */ %>
								   <strong> &nbsp;</strong>/ <% /* =loRS("Negociacoes") */ %></td>
                                 </tr>
                                 <tr>
                                   <td><p>Quantidade de Palavra Chave:</p></td>
                                   <td height="30"><h1><% /* =loRS("NPalavrasChave") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Sub-categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtSubCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Imagens:</p></td>
                                   <td height="30"><strong><% /* =loRS("NImagem") */ %></strong></td>
                                 </tr>
                                 <tr>
                                   <td><p>Logotipo:</p></td>
                                   <td height="30"><h1><% /* =loRS("Logotipo") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td>Ativo:</td>
                                   <td height="30"><h1><% /* =loRS("Ativo") */ %></h1>
                                   </td>
                                 </tr>
                                 <tr>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td>&nbsp;</td>
                                   <td height="60"><a href="lista_planos.jsp"><img src="imagens/painel_comprador/btn_contratar_plano.jpg" width="182" height="23" alt="Contratar Plano" title="Contratar Plano" border="0" /></a></td>
                                 </tr>
                               </table>
                             </form></td>
                             <td width="15">&nbsp;</td>
                           </tr>
                         </table>

<% /* 
	End If

	loRS.Close
	loConexao.Close
	
	Set loRS = Nothing
	Set loConexao = Nothing


End If
 */ %>                         

<!--Inicio Detalhes Plano Inativo-->

	<% /* 
		If Request("paNAssinatura_Antiga") <> "" And IsNumeric(Request("paNAssinatura_Antiga")) Then

	Set loConexao = Server.CreateObject("ADODB.Connection")
	Set loRS = Server.CreateObject("ADODB.Recordset")
	Set loRS2 = Server.CreateObject("ADODB.Recordset")
	
	loConexao.Open Application("BD")
	loRS.Open "SELECT P.Nome, P.Descricao, P.NPalavrasChave, A.Negociacoes AS NegociacoesRestantes, P.Negociacoes, P.QtCategoria, P.QtSubCategoria, NImagem, IF(Logotipo=1, 'Sim', 'Não') AS Logotipo, IF(Ativo=1, 'Sim', 'Não') AS Ativo FROM Assinaturas_Antigas A INNER JOIN Planos P ON A.NPlano = P.NPlano WHERE NEmpresa = " & Session("Empresa-NEmpresa") & " AND NAssinatura = " & Request("paNAssinatura_Antiga"), loConexao
	If Not loRS.Eof Then
 */ %>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><form id="form1" name="form1" method="post" action="">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td width="28%"><p>Nome do Plano:</p></td>
                                   <td width="72%" height="60"><h1><% /* =loRS("Nome") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Descrição:</p></td>
                                   <td><h1><% /* =loRS("Descricao") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Limite de Negociações:</p></td>
                                   <td height="60"><% /* =loRS("NegociacoesRestantes") */ %>
								   <strong> &nbsp;</strong>/ <% /* =loRS("Negociacoes") */ %></td>
                                 </tr>
                                 <tr>
                                   <td><p>Quantidade de Palavra Chave:</p></td>
                                   <td height="30"><h1><% /* =loRS("NPalavrasChave") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Qt Sub-categorias:</p></td>
                                   <td height="30"><h1><% /* =loRS("QtSubCategoria") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td><p>Imagens:</p></td>
                                   <td height="30"><strong><% /* =loRS("NImagem") */ %></strong></td>
                                 </tr>
                                 <tr>
                                   <td><p>Logotipo:</p></td>
                                   <td height="30"><h1><% /* =loRS("Logotipo") */ %></h1></td>
                                 </tr>
                                 <tr>
                                   <td>Ativo:</td>
                                   <td height="30"><h1><% /* =loRS("Ativo") */ %></h1>
                                   </td>
                                 </tr>
                                 <tr>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                 </tr>
                                
                               </table>
                             </form></td>
                             <td width="15">&nbsp;</td>
                           </tr>
                         </table>

<% /* 
	End If

	loRS.Close
	loConexao.Close
	
	Set loRS = Nothing
	Set loConexao = Nothing



End If
 */ %>   

<!--Fim Detalhes Planos Inativo-->

								
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
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
</body>
</html>
