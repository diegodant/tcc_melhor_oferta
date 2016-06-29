<%--
    Document   : planos
    Created on : 27/07/2012, 14:33:27
    Author     : Marcio
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
    <title>Melhor Oferta - Meus lances</title>
</head>
<body>
    <div id="principal">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
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
                <td height="15">&nbsp;</td>
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
                <tr>
                    <td height="30">&nbsp;</td>
                </tr>


            </tr>
            <tr>
                <td height="30">&nbsp;</td>
            </tr>
            <td width="230" valign="top" class="list_restrita_comprador">

            </td>
            <td width="15">&nbsp;</td>
            <!-- Tabela de pacotes -->
            <table width="100%" align="center">
                <tr>
                    <td class="tabela-produtos" align="center" style="width: 40%">
                     Nome Plano</td>
                    <td class="tabela-produtos" align="center" style="width: 21%">
                     Valor</td>
                    <td width="10%" class="tabela-produtos" align="center">
                     Ações</td>
                </tr>
                <tr>

                    <td class="back2 campos2" align="center" style="width: 40%">
                     Pacote 10 Lances
                    </td>

                    <td class="back2 campos2" align="center" style="width: 21%">
                    R$ 10,00
                    </td>

                     <td width="" align="center" class="back2">
                        <table width="60%" align="center">
                            <tr>
                                <td width="16" align="left">
                                    <a href="PagMoip?paNPlano=10">
                                        <img alt="Comprar" height="16" src="images/icones/editar.png" style="border-width: 0px" width="16" title="Editar" /></a></td>
                                <!-- <td width="16">
                                    <a href="javascript:Remover('');">
                                        <img alt="Remover" height="16" src="images/icones/remover.png" width="16" border="0" title="Remover" />
                                    </a>
                                </td>
                                -->
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

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
