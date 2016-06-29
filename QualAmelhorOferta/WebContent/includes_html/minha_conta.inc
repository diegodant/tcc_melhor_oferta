
<%@page import="br.com.melhoroferta.entidades.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                 <!--Inicio Box Minha conta-->
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                              <td><a href="minha_conta.jsp"><img src="imagens/usuarios/titu_minhaconta.jpg" width="215" height="34" alt="Minha Conta" title="Minha Conta" border="0" /></a></td>
                          </tr>
                          <tr>
                            <td class="minha_conta_bordas minha_conta">
                                 <%
                                   Usuario u3 = (Usuario) session.getAttribute("usuario");
                                   
                                 %>
                             <h1>Oi, <b><% out.print(u3.getNome()); %></b></h1>
                             <p>você está conectado ao sistema</p>
                            </td>
                          </tr>
<!--%
Set loConexaoInc = Server.CreateObject("ADODB.Connection")
Set loRSInc = Server.CreateObject("ADODB.Recordset")
Set loRSInc2 = Server.CreateObject("ADODB.Recordset")

loConexaoInc.Open Application("BD")
loRSInc.Open "SELECT COUNT(NSolicitacao) AS Total FROM Solicitacoes WHERE NUsuario=" & Session("Usuario-NUsuario") , loConexaoInc
%>-->

<tr>
                            <td class="minha_conta_bordas lista_conta">
                             <ul>
                                <li>N de Solicitações:<b>Total de solic</b></li>
                                <!--<li>N de Propostas em aberto:<b>2</b></li>-->
                                <li>Status Geral:
                               
<!--%
loRSInc2.Open "SELECT IFNULL(AVG(Comunicacao), 0) AS MediaComunicacao, IFNULL(AVG(UConfiabilidade), 0) AS MediaConfiabilidade FROM Avaliacoes WHERE Ativo = 1 AND Avaliado = 1 AND NUsuario = " & Session("Usuario-NUsuario"), loConexaoInc
				If loRSInc2("MediaComunicacao") <> "" Then
					loMediaGeral = (CDbl(loRSInc2("MediaComunicacao")) + CDbl(loRSInc2("MediaConfiabilidade"))) / 2
					loMediaGeral = Fix(loMediaGeral)
				End If
loRSInc2.Close

		loCont = 0
		While loCont < loMediaGeral
%>-->
                                  <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<!--%
			loCont = loCont + 1
		WEnd
	
		While loCont < 5
%>-->
                                  <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<!--%
			loCont = loCont + 1
		WEnd
%>-->
</li>
                                <li><a href="restrito_altera_senha_comprador.jsp">
								Alterar Senha</a></li>
                                <li><a href="restrito_minha_solicitacao_comprador.jsp">
								Minhas Solicitações</a></li>
                            </ul>
                            </td>
                          </tr>

<!--%

loRSInc.Close
loConexaoInc.Close

Set loRSInc2 = Nothing
Set loRSInc = Nothing
Set loConexaoInc = Nothing
%> -->                         <tr>
                            <td align="center" class="minha_conta_bordas"><a href="nova_solicitacao.jsp"><img src="imagens/usuarios/bt_nova-solicitacao.jpg" alt="Nova Solicitacao" width="177" height="33" border="0" /></a></td>
                          </tr>
                          <tr>
                            <td align="center" class="minha_conta_bordas nova">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td class="nova"  height="22"><a href="sair.jsp">
									Sair</a></td>
                                    <td width="90">&nbsp;</td>
                                    <td class="nova"><a href="restrito_altera_dados_comprador.jsp">
									Alterar meus dados</a></td>
                                  </tr>
                                </table>
                            </td>
                          </tr>
                          
                          <tr>
                            <td><img src="imagens/usuarios/minha_conta_img-bx.jpg" width="215" height="9" alt="Minha Conta" title="Minha Conta" border="0" /></td>
                          </tr>
                        </table>
                 <!--fim minha conta-->
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>