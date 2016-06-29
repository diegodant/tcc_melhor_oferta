<%-- 
    Document   : identificacao
    Created on : 20/06/2012, 16:37:51
    Author     : Marcio
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
/*Response.Charset = "iso-8859-1"

If Session("Usuario-Logado") = "OK" Then
	Response.Redirect "restrito_minha_solicitacao_comprador.asp"
End If

If Session("Empresa-Logado") = "OK" Then
	Response.Redirect "restrito_empresa.asp"
End If*/
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta - Minha Conta</title>
<script language="JavaScript">
function Limpa(loValor)
{
	loValorF = '';
	i = 0;

	while(i <= loValor.length)
	{
		if((loValor.substring(i, i+1) != ' ') && (loValor.substring(i, i+1) != '.') && (loValor.substring(i, i+1) != '-') && (loValor.substring(i, i+1) != '/'))
			loValorF = loValorF + loValor.substring(i, i+1);
		i += 1;
	}
	return loValorF;
}

function ValidaCNPJ(paCNPJ)
{
	Form = document.FormularioWLD;
	loCNPJ = Limpa(paCNPJ);

	var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
	digitos_iguais = 1;

	if (loCNPJ.length < 14 && loCNPJ.length < 15)
	{
		alert("O CNPJ digitado não é válido.\nPor favor, digite-o novamente.");
		Form.CNPJ.focus();
		return false;
	}

	for (i = 0; i < loCNPJ.length - 1; i++)

		if (loCNPJ.charAt(i) != loCNPJ.charAt(i + 1))
		{
			digitos_iguais = 0;
			break;
		}

	if (!digitos_iguais)
	{
		tamanho = loCNPJ.length - 2
		numeros = loCNPJ.substring(0, tamanho);
		digitos = loCNPJ.substring(tamanho);
		soma = 0;
		pos = tamanho - 7;

		for (i = tamanho; i >= 1; i--)
		{
			soma += numeros.charAt(tamanho - i) * pos--;
			if (pos < 2)
			    pos = 9;
		}

		resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;

		if (resultado != digitos.charAt(0))
		{
			alert("O CNPJ digitado não é válido.\nPor favor, digite-o novamente.");
			Form.CNPJ.focus();
			return false;
		}

		tamanho = tamanho + 1;
		numeros = loCNPJ.substring(0,tamanho);
		soma = 0;
		pos = tamanho - 7;

		for (i = tamanho; i >= 1; i--)
		{
			soma += numeros.charAt(tamanho - i) * pos--;
			if (pos < 2)
			    pos = 9;
		}

		resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;

		if (resultado != digitos.charAt(1))
		{
			alert("O CNPJ digitado não é válido.\nPor favor, digite-o novamente.");
			Form.CNPJ.focus();        
			return false;
		}
		return true;
	}
	else
		return false;
}

function ValidaCPF(paCPF)
{
	Form = document.FormularioWLD;
	loCPF = Limpa(paCPF);

	var numeros, digitos, soma, i, resultado, digitos_iguais;
	digitos_iguais = 1;    
	
	if (loCPF.length < 11)
	{
		alert("O CPF digitado não é válido.\nPor favor, digite-o novamente.");
		Form.CPF.focus();
		return false;
	}

	for (i = 0; i < loCPF.length - 1; i++)
		if (loCPF.charAt(i) != loCPF.charAt(i + 1))
		  {
		      digitos_iguais = 0;
		      break;
		  }
	
	if (!digitos_iguais)
	{
		numeros = loCPF.substring(0,9);
		digitos = loCPF.substring(9);
		soma = 0;

		for (i = 10; i > 1; i--)
		      soma += numeros.charAt(10 - i) * i;

		resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;

		if (resultado != digitos.charAt(0))
		{
			alert("O CPF digitado não é válido.\nPor favor, digite-o novamente.");
			Form.CPF.focus();
			return false;
		}

		numeros = loCPF.substring(0,10);
		soma = 0;

		for (i = 11; i > 1; i--)
		      soma += numeros.charAt(11 - i) * i;

		resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;

		if (resultado != digitos.charAt(1))
		{
			alert("O CPF digitado não é válido.\nPor favor, digite-o novamente."); 
			Form.CPF.focus();
			return false;
		}

		return (true);
	}
}

function ValidadorWLD(Form)
{
	if (Form.Email.value.length < 9)
	{
		alert("O campo \"Email\" requer no mínimo 9 caracteres.");
		Form.Email.focus();
		return (false);
	}

	if (Form.Email.value == "")
	{
		alert("Por favor, preencha o campo \"Email\".");
		Form.Email.focus();
		return (false);
	}

	var CharsEmail = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
	if (CharsEmail.test(Form.Email.value) != true)
	{
		alert("O e-mail digitado não é válido.\nVerifique se você digitou seu e-mail corretamente.");
		Form.Email.focus();
		return (false);
	}

	if (Form.Senha.value.length < 6)
	{
		alert("O campo \"Senha\" requer no mínimo 6 caracteres.");
		Form.Senha.focus();
		return (false);
	}

	if (Form.Senha.value.length > 12)
	{
		alert("O campo \"Senha\" suporta no máximo 12 caracteres.");
		Form.Senha.focus();
		return (false);
	}

	var CharsSenha = new RegExp("([^a-zA-Z0-9])");
	if (CharsSenha.test(Form.Senha.value) == true)
	{
		alert("A senha digitada não é válida.\nPor favor, digite apenas letras e números.");
		Form.Senha.focus();
		return (false);
	}

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
  <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="40">&nbsp;</td>
      <td width="729"><!--<img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" />--></td>
      <td width="15">&nbsp;</td>
      <td width="15"><a href="como_funciona.jsp"><img src="imagens/identificacao/box_como_funciona.jpg" width="216" height="95" alt="Como Funciona" title="Como Funciona" border="0"/></a></td>
      <td>&nbsp;</td>
    </tr>
  </table>
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
                <td width="135"><img src="imagens/identificacao/tit_minha_conta.jpg" alt="Minha Conta" width="127" height="15" border="0" /></td>
                   <td class="li">&nbsp;</td>
                    <td width="15"><img src="imagens/bl_h.jpg" width="10" height="33" alt="Melhor Oferta" title="Melhor Oferta" /></td>
                 <td width="250">&nbsp;</td>
                </tr>
              </table>
           </td>
          </tr>
             <tr>
           <td>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td valign="top">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td>
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                       <td width="60" height="30">&nbsp;</td>
                       <td width="360"><img src="imagens/identificacao/tit_ja_cadastrado.jpg" width="120" height="11" alt="J&aacute; Sou Cadastrado" title="J&aacute; Sou Cadastrado" border="0" /></td>
                       <td><img src="imagens/identificacao/tit_nao_cadastrado.jpg" width="132" height="11" alt="N&atilde;o Sou Cadastrado" title="Não Sou Cadastrado" border="0" /></td>
                     </tr>
                   </table>
                   </td>
                 </tr>
                 <tr>
                   <td>
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                       <td>&nbsp;</td>
                       </tr>
                        <tr>
                            <td class="mensagem" align="center" style="color: red;font: bold">${mensagem}</td>
					</tr>
                     <tr>
                     <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                           <td>&nbsp;</td>
                           <td width="715" class="bg_login_usuario">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                             <tr>
                               <td width="358"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td height="30">&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td class="texto_minha_conta">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <form action="LoginController?cmd=consulta_login" method="post" name="FormularioWLD" onsubmit="return ValidadorWLD(this)" >
                                    <tr>
                                       <td><p>Login</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="23">&nbsp;</td>
                                        <td width="9"><img src="imagens/identificacao/campo_usuario_esquerdo.jpg" width="11" height="21" /></td>
                                        <td width="296">
					<input type="text" name="login" size="20" class="campo_empresa_g" value=""></td>
                                        <td width="12"><img src="imagens/identificacao/campo_usuario_direito.jpg" width="9" height="21" /></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                    </td>
                                     </tr>
                                     <tr>
                                       <td><p>Senha</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="23">&nbsp;</td>
                                            <td width="9"><img src="imagens/identificacao/campo_usuario_esquerdo.jpg" alt="" width="11" height="21" /></td>
                                            <td width="181"><input type="password" name="senha" size="12" class="campo_empresa_p" maxlength="12" value=""></td>
                                            <td width="12"><img src="imagens/identificacao/campo_usuario_direito.jpg" alt="" width="9" height="21" /></td>
                                            <td>&nbsp;</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="45">
                                          <input type="image" name="imageField" id="imageField" src="imagens/identificacao/btn_ok.jpg" />
                                        </td>
                                      </tr>
                                    </table>
                                       </td>
                                     </tr>
                                     <tr>
                                       <td height="20"><a href="#">Esqueci minha senha</a></td>
                                     </tr>
                                    </form>
                                   </table>
                                   </td>
                                 </tr>
                                </table>
                               </td>
                               <td width="358">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td height="35">&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td class="texto_minha_conta">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <form method="post" name="FormularioWLD" action="cadastro_usuario.asp" onsubmit="return ValidadorWLD(this)">
                                    <tr>
                                       <td><p>Email</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="23">&nbsp;</td>
                                        <td width="9"><img src="imagens/identificacao/campo_usuario_esquerdo.jpg" alt="" width="11" height="21" /></td>
                                        <td width="296"><input type="text" name="Email" size="20" class="campo_empresa_g" value=""></td>
                                        <td width="12"><img src="imagens/identificacao/campo_usuario_direito.jpg" alt="" width="9" height="21" /></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                    </td>
                                     </tr>
                                     <tr>
                                       <td>&nbsp;</td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="15">&nbsp;</td>
                                            <td>
                                            <p>Cadastre-se gratuitamente como Comprador para receber as melhores ofertas.</p>
                                            </td>
                                            <td width="15">&nbsp;</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="45">
                                          <input type="image" name="imageField" id="imageField" src="imagens/identificacao/btn_ok.jpg" />
                                        </td>
                                      </tr>
                                    </table>
                                       </td>
                                     </tr>
                                     <tr>
                                       <td height="20">&nbsp;</td>
                                     </tr>
                                    </form>
                                   </table>
                                   </td>
                                 </tr>
                                </table>
                               </td>
                             </tr>
                           </table>
                           
                           </td>
                           <td width="27">&nbsp;</td>
                         </tr>
                       </table>
                     </td>
                     </tr>
                     <tr>
                       <td>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                           <td>&nbsp;</td>
                           <td width="716" class="bg_login_empresa">
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">
                             <tr>
                               <td width="358">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td height="30">&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td class="texto_minha_conta">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <!--inicio form minha conta vendedor-->
                                    <!--<form action="login_empresa.asp" method="POST" name="FormularioWLD" onsubmit="return ValidadorWLD(this)"> -->
                                    <form action="LoginController?cmd=consulta_login" method="post" name="FormularioWLD" onsubmit="return ValidadorWLD(this)">
                                    <tr>
                                       <td><p>Login</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="23">&nbsp;</td>
                                        <td width="9"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                        <td width="296">
					<input type="text" name="login" size="20" class="campo_empresa_g" value=""></td>
                                        <td width="12"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                    </td>
                                     </tr>
                                     <tr>
                                       <td><p>Senha</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="23">&nbsp;</td>
                                            <td width="9"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                            <td width="181"><input type="password" name="senha" size="12" class="campo_empresa_p" maxlength="12" value=""></td>
                                            <td width="12"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                            <td>&nbsp;</td>
                                          </tr>
                                        </table>
                                        
                                        </td>
                                        <td width="45">
                                         <input type="image" name="imageField" id="imageField" src="imagens/identificacao/btn_ok.jpg" />
                                        </td>
                                      </tr>
                                    </table>
                                       </td>
                                     </tr>
                                     <tr>
                                       <td height="20"><a href="#">Esqueci minha senha</a></td>
                                     </tr>
                                    </form>
                                   </table>
                                   </td>
                                 </tr>
                                </table>
                               </td>
                               <td width="358">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td height="35">&nbsp;</td>
                                 </tr>
                                 <tr>
                                   <td class="texto_minha_conta">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <form method="post" name="FormularioWLD" onsubmit="return ValidadorWLD(this)">
                                    <tr>
                                       <td><p>Email</p></td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="23">&nbsp;</td>
                                        <td width="9"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                        <td width="296"><input type="text" name="Email" size="20" class="campo_empresa_g" value=""></td>
                                        <td width="12"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                        <td>&nbsp;</td>
                                      </tr>
                                    </table>
                                    </td>
                                     </tr>
                                     <tr>
                                       <td>&nbsp;</td>
                                     </tr>
                                     <tr>
                                       <td>
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="15">&nbsp;</td>
                                            <td>
                                            <p>Cadastre-se gratuitamente como Vendedor para oferecer as melhores ofertas.</p>
                                            </td>
                                            <td width="15">&nbsp;</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="45">
                                          <input type="image" name="imageField" id="imageField" src="imagens/identificacao/btn_ok.jpg" />
                                        </td>
                                      </tr>
                                    </table>
                                       </td>
                                     </tr>
                                     <tr>
                                       <td height="20">&nbsp;</td>
                                     </tr>
                                    </form>
                                   </table>
                                   </td>
                                 </tr>
                                </table>
                               </td>
                             </tr>
                           </table>
                           </td>
                           <td width="27">&nbsp;</td>
                         </tr>
                       </table>
                       </td>
                     </tr>
                     <tr>
                       <td height="3">
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            
                                                        </table>
                                                          </td>
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
                 <tr>
                   <td>&nbsp;</td>
                 </tr>
               </table>
               </td>
               <td width="239" align="center" valign="top">
                   <!--//@include file="includes_html/tags.inc" %>-->
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

