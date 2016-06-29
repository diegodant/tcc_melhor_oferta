<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%  /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <%
   Usuario u = (Usuario) session.getAttribute("usuario");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">
function ValidadorWLD(Form)
{
if (Form.NovaSenha.value.length < 6)
	{
		alert("O campo \"Senha\" requer no mínimo 6 caracteres.");
		Form.NovaSenha.focus();
		return (false);
	}

	if (Form.NovaSenha.value.length > 12)
	{
		alert("O campo \"Senha\" suporta no máximo 12 caracteres.");
		Form.NovaSenha.focus();
		return (false);
	}

	var CharsSenha = new RegExp("([^a-zA-Z0-9])");
	if (CharsSenha.test(Form.NovaSenha.value) == true)
	{
		alert("A senha digitada não é válida.\nPor favor, digite apenas letras e números.");
		Form.NovaSenha.focus();
		return (false);
	}
	if (Form.ConfirmaNovaSenha.value.length < 6)
	{
		alert("O campo \"Confirma Senha\" requer no mínimo 6 caracteres.");
		Form.ConfirmaNovaSenha.focus();
		return (false);
	}

	if (Form.ConfirmaNovaSenha.value.length > 12)
	{
		alert("O campo \"Confirma Senha\" suporta no máximo 12 caracteres.");
		Form.ConfirmaSenha.focus();
		return (false);
	}

	if (Form.NovaSenha.value != Form.ConfirmaNovaSenha.value)
	{
		alert("A senha e sua confirmação não conferem.");
		Form.ConfirmaNovaSenha.focus();
		return (false);
	}
}
</script>
<style type="text/css">
.mensagem {
	color: #CC0000;
	text-align: center;
	font-weight: bold;
	font-family: "Trebuchet MS";
}
</style>
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
      <td><%@include file="includes_html/ola_comprador.inc"%>
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
                  <td height="30">&nbsp;</td>
                  </tr>
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                             <%@include file="includes_html/menu_restrito_comprador.inc"%>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td>
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_cima_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                        <td class="usuarios_c">&nbsp;</td>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_cima_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="usuarios_e">&nbsp;</td>
                                                        <td class=" usuarios_ge">
                                                        <form action="ControleAlterarSenhaUsuario?cmd=alterar_senha" method="post" onsubmit="return ValidadorWLD(this)">
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <!--inicio linha-->
                                                            <tr>
									<td class="mensagem">${msg}</td>
															</tr>
                                                          <tr>
                                                            <td>&nbsp;</td>
                                                          </tr>                                                       
                                                          <tr>
                                                            <td>
                                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="175" align="right" class="txt_soli">Seu login*</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    
                                                                    
                                                                    
                                                                    <td class="txt_soli"><% out.print(u.getLogin()); %></td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Digite sua senha atual:*</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="15">
																	<input name="Senha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Digite sua nova senha:*</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="15">
                                                                        <input name="NovaSenha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Digite sua nova senha novamente: *</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="15">
									<input name="ConfirmaNovaSenha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              
                                                              <!--fim linha-->

                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                      <tr>
                                                                        <td width="10">&nbsp;</td>
                                                                        <td><input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_alterar_senha.png" /></td>
                                                                      </tr>
                                                                    </table>
                                                                </td>
                                                              </tr>
                                                          </table>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        </form>
                                                        </td>
                                                        <td width="24" class="usuarios_d">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_es.jpg" width="24" height="27" alt="Solicitações" title="Solicitações"  border="0"/></td>
                                                        <td class="usuarios_bl">&nbsp;</td>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                          </table>
                             </td>
                             <td width="15">&nbsp;</td>
                           </tr>
                         </table></td>
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
                    <td><%@include file="includes_html/minha_conta.inc"%></td>
                    
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
           <%@include file="includes_html/rodape.inc"%>
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
