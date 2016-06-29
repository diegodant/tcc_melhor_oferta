<%@page import="br.com.melhoroferta.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                 <!--Inicio Box Minha conta-->
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><a href="minha_conta.jsp"><img src="imagens/usuarios/titu_minhaconta.jpg" width="215" height="34" alt="Minha Conta" title="Minha Conta" border="0" /></a></td>
                           <%
                               Usuario u4 = (Usuario) session.getAttribute("usuario");
                           %>
                          </tr>
                          <tr>
                            <td class="minha_conta_bordas minha_conta">
                             <h1>Oi, <b><% out.print(u4.getNome()); %></b></h1>
                             <p>você está conectado ao sistema</p>
                            </td1
                          </tr>
<%
//Set loConexaoInc = Server.CreateObject("ADODB.Connection")
//Set loRSInc = Server.CreateObject("ADODB.Recordset")
//Set loRSInc2 = Server.CreateObject("ADODB.Recordset")

//loConexaoInc.Open Application("BD")
//loRSInc.Open "SELECT COUNT(NSolicitacao) AS Total FROM EmpresasSolicitacoes WHERE NEmpresa=" & Session("Empresa-NEmpresa") , loConexaoInc
%>

<tr>
                            <td class="minha_conta_bordas lista_conta">
                             <ul>
                                <li>N de Solicitações:<b><% //loRSInc("Total")%></b></li>
                                <!--<li>N de Propostas em aberto:<b>2</b></li>-->
                                <li>Status Geral:

<!--                                     QUERY Q RECUPERA A AVALIACAÇÃO DO VENDEDOR-->
<%
//loRSInc2.Open "SELECT IFNULL(AVG(Comunicacao), 0) AS MediaComunicacao, IFNULL(AVG(UConfiabilidade), 0) AS MediaConfiabilidade FROM Avaliacoes WHERE Ativo = 1 AND Avaliado = 1 AND NEmpresa = " & Session("Empresa-NEmpresa"), loConexaoInc
//				If loRSInc2("MediaComunicacao") <> "" Then
//					loMediaGeral = (CDbl(loRSInc2("MediaComunicacao")) + CDbl(loRSInc2("MediaConfiabilidade"))) / 2
//					loMediaGeral = Fix(loMediaGeral)
//				End If
//loRSInc2.Close

		//loCont = 0
		//While loCont < loMediaGeral
%>
                                  <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<%
		//	loCont = loCont + 1
		//WEnd
	
		//While loCont < 5
%>
                                  <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliaes" title="Avaliaes" />
<%
		//	loCont = loCont + 1
		//WEnd
%>
</li>
                                <li><a href="restrito_altera_senha_empresa.jsp">
								Alterar Senha</a></li>
                                <li><a href="restrito_acompanhar_solicitacao_comprador.jsp">
								Minhas Solicitações</a></li>
                            </ul>
                            </td>
                          </tr>

<%

//loRSInc.Close
//loConexaoInc.Close

//Set loRSInc2 = Nothing
//Set loRSInc = Nothing
//Set loConexaoInc = Nothing
%>                          
<tr>
            <td align="center" class="minha_conta_bordas">
                <a href="restrito_acompanhar_solicitacao_comprador.jsp">
                    <img src="imagens/usuarios/bt_nova-solicitacao3.jpg" width="176" height="33" alt="Ver Solicitao" title="Ver Solicitao" border="0"/>
                </a>
            </td>
            </tr>
            <tr>
            <td align="center" class="minha_conta_bordas nova">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    <td class="nova"  height="22"><a href="sair.jsp">
                                                        Sair</a></td>
                    <td width="90">&nbsp;</td>
                    <td class="nova">
                        <a href="restrito_altera_dados_comprador.jsp">
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