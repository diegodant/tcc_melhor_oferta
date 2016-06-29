<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- #include file="lib\lib.asp"-->
<% /* 
LoginUsuario()

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

loNUsuario = 0

	loRS.Open "SELECT NUsuario, Nome, Apelido, Email, DataNascimento, Sexo, Telefone, Celular, Cep, Endereco, Numero, Complemento, Bairro, Estado, Cidade FROM Usuarios WHERE NUsuario = " & Session("Usuario-NUsuario"), loConexao

	If Not loRS.Eof Then

		For Each loCampo In loRS.Fields
			Execute "lo" & loCampo.Name & " = loRS(""" & loCampo.Name & """)"
		Next
		
	End If
	
	If loSexo = "Masculino" Then
		loSexoM = "checked=""checked"""
	Else
		loSexoM = ""
	End If
		
	If loSexo = "Feminino" Then
		loSexoF = "checked=""checked"""
	Else
		loSexoF = ""
	End If


loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>
 <%
   Usuario u = (Usuario) session.getAttribute("usuario");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">

function Inicio()
{
	Form = document.Formulario;
	
	for(loCt=0; loCt<Form.Estado.length; loCt++)
		if(Form.Estado.options[loCt].value == '<% /* =loEstado */ %>')
		{
			Form.Estado.selectedIndex = loCt;
			break;
		}
}
var loCEPValido = "";

function GetXmlHttpObject()
{
	var xmlHttp = null;
	try
	{
		// Firefox, Opera 8.0+, Safari
		xmlHttp = new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer
		try
		{
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}
function ProcessaRetorno(paTipo)
{
	if (xmlHttp.readyState == 4 )
	{
		loRetorno = xmlHttp.responseText;
		Form = document.Formulario;

			loDados = loRetorno.split("#");			
			
			Form.Endereco.value = loDados[1];
			Form.Cidade.value = loDados[2];
			Form.Bairro.value = loDados[4];
			
		
		for(loCt=0; loCt<Form.Estado.length; loCt++)
		if(Form.Estado.options[loCt].value == loDados[3])
		{
			Form.Estado.selectedIndex = loCt;
			break;
		}

	}
	document.getElementById('LinhaCepValido').style.display = '';

}
function Calcula()
{
	Form = document.Formulario;

	xmlHttp = GetXmlHttpObject();
	if (xmlHttp == null)
	{
		alert ("Seu navegador não suporta AJAX!");
		return;
	}
	var loCep = Form.Cep.value;
	if (loCep.indexOf('-') > -1){
		loCep = loCep.replace('-','');
	}
	var url = "verifica_cep.asp?CEP=" + loCep + "&sid=" + Math.random();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = ProcessaRetorno;
	xmlHttp.send(null);
}

function Verifica()
{
	Form = document.Formulario;
	var loApelido = Form.Apelido.value;
	
	xmlHttp = GetXmlHttpObject();
	if (xmlHttp == null)
	{
		alert ("Seu navegador não suporta AJAX!");
		return;
	}
	
	var url = "verifica_apelido.asp?Apelido=" + loApelido + "&sid=" + Math.random();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = LinkCarregado;
	xmlHttp.send(null);
}

function LinkCarregado()
{
	if (xmlHttp.readyState == 4)
	{
		loRetorno1 = xmlHttp.responseText;
			if (xmlHttp.responseText == "ok")
			{
				loImagem = "ok.png"
			}
			if (xmlHttp.responseText == "nao")
			{
				loImagem = "nao.png"
			}
	}
	document.getElementById("imagem").src="imagens/" + loImagem
}

function dateMask(inputData, e){
	if(document.all) // Internet Explorer
		var tecla = event.keyCode;
	else //Outros Browsers
		var tecla = e.which;

	if(tecla >= 47 && tecla < 58){ // numeros de 0 a 9 e "/"
		var data = inputData.value;
		if (data.length == 2 || data.length == 5){
			data += '/';
			inputData.value = data;
		}
	}else if(tecla == 8 || tecla == 0) // Backspace, Delete e setas direcionais(para mover o cursor, apenas para FF)
		return true;
	else
		return false;
}

function ValidadorWLD(Form)
{
	if (Form.Nome.value == "")
	{
		alert("Por favor, preencha o campo \"Nome\".");
		Form.Nome.focus();
		return (false);
	}
	if (Form.Apelido.value == "")
	{
		alert("Por favor, preencha o campo \"Apelido\".");
		Form.Apelido.focus();
		return (false);
	}
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
	if (Form.DataNascimento.value.length < 8)
	{
		alert("O campo \"Data\" requer no mínimo 8 caracteres.");
		Form.DataNascimento.focus();
		return (false);
	}

	if (Form.DataNascimento.value.length > 10)
	{
		alert("O campo \"Data\" suporta no máximo 10 caracteres.");
		Form.DataNascimento.focus();
		return (false);
	}

	if (Form.DataNascimento.value == "")
	{
		alert("Por favor, preencha o campo \"Data\".");
		Form.DataNascimento.focus();
		return (false);
	}

	var CharsData = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012]|[1-9])/[12][0-9]{3}");
	if (CharsData.test(Form.DataNascimento.value) != true)
	{
		alert("A data digitada não é válida.\nPor favor, digite-a novamente.");
		Form.DataNascimento.focus();
		return (false);
	}
	if (Form.Telefone.value.length < 10)
	{
		alert("O campo \"Telefone\" requer no mínimo 10 caracteres.");
		Form.Telefone.focus();
		return (false);
	}

	if (Form.Telefone.value.length > 12)
	{
		alert("O campo \"Telefone\" suporta no máximo 12 caracteres.");
		Form.Telefone.focus();
		return (false);
	}

	var CharsTelefone = new RegExp("(([1-9]{2})(([0-9]{8})|([0-9]{4}\-[0-9]{4}))|([1-9]{2}) (([0-9]{8})|([0-9]{4}\-[0-9]{4})))");
	if (CharsTelefone.test(Form.Telefone.value) != true)
	{
		alert("O Telefone não foi digitado corretamente.\nPor favor, digite-o novamente obedecendo o formato especificado.");
		Form.Telefone.focus();
		return (false);
	}
	if (Form.Cep.value == "")
	{
		alert("Por favor, preencha o campo \"Cep\".");
		Form.Cep.focus();
		return (false);
	}
	if (Form.Endereco.value == "")
	{
		alert("Por favor, preencha o campo \"Endereco\".");
		Form.Endereco.focus();
		return (false);
	}

	if (Form.Numero.value == "")
	{
		alert("Por favor, preencha o campo \"Numero\".");
		Form.Numero.focus();
		return (false);
	}
}

</script>
<style type="text/css">
.style1 {
	color: #999;
	font-size: 13px;
	border: 1px solid #FFF;
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
  <td><%@include file="includes_html/ola_comprador.inc" %>
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
                <td width="275"><img src="imagens/painel_comprador/tit_painel_comprador.jpg" width="267" height="19" alt="Painel de Controle Comprador" title="Painel de Controle Comprador" /></td>
           <td class="li">&nbsp;</td>
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
                  </tr>
                    <tr>
                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <td width="230" valign="top" class="list_restrita_comprador">
                           <%@include file="includes_html/menu_restrito_comprador.inc" %>
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
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_cima_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                        <td class="usuarios_c">
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
									<td class="mensagem" align="center">${mensagem}</td>
															</tr>
                                                        </table>
                                                          </td>
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
                                                        <td class="usuarios_ge">
                                                        <form name="Formulario" method="post" action="ControleUsuario?cmd=alterar_dados" onsubmit="return ValidadorWLD(this)"> 
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td>
                                                              <table width="104%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td width="175" align="right" class="txt_soli">Nome*:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
							   <input type="text" name="nome" size="60" class=" form_sol" value="<% out.print(u.getNome()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table></td>
                                                           </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                        
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli" valign="top">Email*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
									<input type="text" name="email" size="45" class=" form_sol" value="<% out.print(u.getEmail()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                             <!-- <tr>
                                                                <td align="right" valign="top" class="txt_soli">CPF*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100"><input type="text" name="Email" size="20" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex:99999999999 (não é necessário pontuação)</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>-->
                                                              <tr>
                                                                <td align="right" valign="top" class="txt_soli">Data de Nascimento*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
                                                                        <input type="text" name="dtnascimento" size="13" class=" form_sol" onkeypress="return dateMask(this, event);" value="<% out.print(u.getDtnascimento()); %>" maxlength="10"></input></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;DD/MM/AAAA</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Sexo*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td class="txt_soli" width="100">
									<input type="radio" name="sexo" <% if(u.getSexo().equalsIgnoreCase("M")) out.print("checked"); else out.print("unchecked"); %>  value="M" style="height: 20px" />&nbsp;Masculino</td>
                                                                    <td class="txt_soli">
                                                                        <input type="radio" name="sexo"  <% if(u.getSexo().equalsIgnoreCase("F")) out.print("checked"); else out.print("unchecked"); %> value="F" />&nbsp;Feminino</td>
                                                                    <td>&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Telefone*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="telefone" size="12" class=" form_sol" value="<% out.print(u.getTelefone()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99 9999-9999</td>
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
                                                                <td align="right" class="txt_soli">Celular:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="Celular" size="12" class=" form_sol" value="<% //out.print(u.getcelular()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99 9999-9999</td>
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
                                                                <td align="right" class="txt_soli">CEP*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
											<input type="text" name="cep" size="12" class="form_sol" value="<% out.print(u.getCep()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99999-999</td>
                                                                    <td><a href="javascript:Calcula()"><img border="0" alt="image" name="imageField" id="imageField" src="imagens/cadastro_usuario/titu_preencher.jpg" /></a></td>
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
                                                                <td align="right" class="txt_soli"></td>
                                                                <td class="txt_soli">* Campos com preenchimento obrigatório.</td>
                                                              </tr>
                                                              <!--fim linha-->
                                                              
                                                          </table>
                                                            </td>
                                                          </tr>
                                                          <!--fim linha-->
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td id="LinhaCepValido">
                                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="175" align="right" class="txt_soli">Endere&ccedil;o*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
													<input type="text" name="rua" size="45" class=" form_sol" value="<% out.print(u.getRua()); %>"></td>
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
                                                                <td align="right" class="txt_soli">N&uacute;mero*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="30">
																	<input type="text" name="numero" size="5" class=" form_sol" value="<% out.print(u.getNumero()); %>"></td>
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
                                                                <td align="right" class="txt_soli">Complemento*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="complemento" size="45" class=" form_sol" value="<% out.print(u.getComplemento()); %>"></td>
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
                                                                <td align="right" class="txt_soli">Bairro*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="80">
																	<input type="text" name="bairro" size="25" class=" form_sol" value="<% out.print(u.getBairro()); %>"></td>
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
                                                             <!-- <tr>
                                                                <td align="right" class="txt_soli">Regi&atilde;o*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="100">
                                                                             <select size="1" name="Regiao" class="form_sol">
                                                                                        <option value="0" selected>Escolha</option>
                                                                                        <option value="NO">Norte</option>
                                                                                        <option value="SUL">Sul</option>
                                                                                        <option value="LE">Leste</option>
                                                                                        <option value="OE">Oeste</option>
                                                                                        <option value="CE">Centro</option>
                                                                                </select>
                                                                                </td>
                                                                    <td width="11"></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>-->
                                                              <tr>
                                                                <td align="right" class="txt_soli">Estado*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    
                                                                    <td width="100">
                                                                             <select size="1" name="estado" class="style1">
                                                                                        <option value="0" selected>Escolha</option>
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
                                                                                </select><script type="text/javascript">window.onload=Inicio</script>
                                                                                </td>
                                                                    <td width="11"></td>
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
                                                                <td align="right" class="txt_soli">Cidade*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="80">
																	<input name="cidade" type="text" class=" form_sol" value="<% out.print(u.getCidade()); %>" size="30" maxlength="50"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                              <!--fim linha-->
                                                          </table>
                                                            </td>
                                                          </tr>
                                                          <!--fim linha-->
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td>
                                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10">&nbsp;
																</td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10">&nbsp;
																</td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli"></td>
                                                                <td class="txt_soli">* Campos com preenchimento obrigatório.</td>
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
                                                                        <td>
                                        								<input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_alterar_dados.png" /></td>
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
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                        <td class="usuarios_bl">&nbsp;</td>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
                                                   </tr>
                                                  </table>
                                                </td>
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
                                 <tr>
                                <td>&nbsp;</td>
                              </tr>
                                 <tr>
                                <td>&nbsp;</td>
                              </tr>
                            </table>
                             </td>
                             <td width="15">&nbsp;</td>
                             <td valign="top"><%@include file="includes_html/minha_conta_geral.jsp" %> </td>                                       

                           </tr>
                         </table></td>
                       </tr>
                     </table>
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