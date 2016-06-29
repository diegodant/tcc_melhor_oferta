<%-- 
    Document   : CADASTRO_EMPRESA.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<style type="text/css">
    .mensagem {
        color: #CC0000;
        text-align: left;
        font-weight: bold;
        font-family: "Trebuchet MS";
    }
</style>
<title>Melhor Oferta - Cadastro Empresa</title>
<script type="text/javascript">
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}

function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}

function leech(v){
    v=v.replace(/o/gi,"0")
    v=v.replace(/i/gi,"1")
    v=v.replace(/z/gi,"2")
    v=v.replace(/e/gi,"3")
    v=v.replace(/a/gi,"4")
    v=v.replace(/s/gi,"5")
    v=v.replace(/t/gi,"7")
    return v
}

function soNumeros(v){
    return v.replace(/\D/g,"")
}

function cpf(v){
    v=v.replace(/\D/g,"")                    //Remove tudo o que não é dígito
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
                                             //de novo (para o segundo bloco de números)
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v
}
function cep(v){
    v=v.replace(/\D/g,"")                //Remove tudo o que não é dígito
    v=v.replace(/^(\d{5})(\d)/,"$1-$2") //Esse é tão fácil que não merece explicações
    return v
}    
function cnpj(v)
{
                v=v.replace(/\D/g,"")                              
                v=v.replace(/^(\d{2})(\d)/,"$1.$2")      
                v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3") 
                v=v.replace(/\.(\d{3})(\d)/,".$1/$2")              
                v=v.replace(/(\d{4})(\d)/,"$1-$2")                        
                return v
}
function telefone(v){
    v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
    v=v.replace(/(\d{4})(\d)/,"$1-$2")    //Coloca hífen entre o quarto e o quinto dígitos
    return v
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
			
			Form.endereco.value = loDados[1];
			Form.cidade.value = loDados[2];
			Form.bairro.value = loDados[3];
			
		
		//for(loCt=0; loCt<Form.Estado.length; loCt++)
		//if(Form.Estado.options[loCt].value == loDados[4])
		//{
		//	Form.Estado.selectedIndex = loCt;
		//	break;
		//}

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
        
	var url = "verifica_cep.jsp?CEP=" + loCep + "&sid=" + Math.random();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = ProcessaRetorno;
	xmlHttp.send(null);
}
function pf(){
/*document.Formulario.RazaoSocial.style.visibility='hidden';
document.Formulario.CNPJ.style.visibility='hidden';
document.Formulario.RazaoSocial.disabled = true;
document.Formulario.CNPJ.disabled = true;*/

//document.getElementById('pjr').style.display= '';
//document.getElementById('cpf').style.display= 'none';
//document.getElementById('rsp').style.display= 'none';
//if (document.getElementById('cpf').){
document.getElementById('cpf').style.display= '';
document.getElementById('cnpj').style.display= 'none';
//}
}

function valor(tipo) {
if(tipo=="cpf") {
document.form.cpf.style.display="block";
document.form.cnpj.style.display="none";
}
if(tipo=="cnpj") {
document.form.getElementById('cpf').style.display="none";
document.form.getElementById('cnpj').style.display="block";
}
}

function pj(){
/*document.Formulario.RazaoSocial.style.visibility='visible';
document.Formulario.CNPJ.style.visibility='visible';
document.Formulario.RazaoSocial.disabled = false;
document.Formulario.CNPJ.disabled = false;*/

//document.getElementById('pjr').style.display='';
//document.Formulario.cpf.style.display = "none";
//document.Formulario.cnpj.style.display = "";
document.getElementById('cpf').style.display='none';
document.getElementById('cnpj').style.display='';

}
function ValidadorWLD(Form)
{	
	if (Form.NomeFantasia.value == "")
	{
		alert("Por favor, preencha o campo \"NomeFantasia\".");
		Form.NomeFantasia.focus();
		return (false);
	}
	if (Form.CPF.value.length < 13)
	{
		alert("O campo \"CPF\" requer no mínimo 13 caracteres.");
		Form.CPF.focus();
		return (false);
	}

	if (Form.CPF.value.length > 14)
	{
		alert("O campo \"CPF\" suporta no máximo 14 caracteres.");
		Form.CPF.focus();
		return (false);
	}

	if (Form.CPF.value == "")
	{
		alert("Por favor, preencha o campo \"CPF\".");
		Form.CPF.focus();
		return (false);
	}

	var CharsCPF = new RegExp("(([1-9])([0-9]|[0-9]{2}))\.([0-9]{3})\.([0-9]{3})-([0-9]{2})");
	if (CharsCPF.test(Form.CPF.value) != true)
	{
		alert("O CPF digitado não é válido.\nPor favor, digite-o novamente.");
		Form.CPF.focus();
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
	if (Form.Login.value == "")
	{
		alert("Por favor, preencha o campo \"Login\".");
		Form.Login.focus();
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
	if (Form.ConfirmaSenha.value.length < 6)
	{
		alert("O campo \"Confirma Senha\" requer no mínimo 6 caracteres.");
		Form.ConfirmaSenha.focus();
		return (false);
	}

	if (Form.ConfirmaSenha.value.length > 12)
	{
		alert("O campo \"Confirma Senha\" suporta no máximo 12 caracteres.");
		Form.ConfirmaSenha.focus();
		return (false);
	}

	if (Form.Senha.value != Form.ConfirmaSenha.value)
	{
		alert("A senha e sua confirmação não conferem.");
		Form.ConfirmaSenha.focus();
		return (false);
	}

}
</script>
</head>
<body>
<div id="principal">
&nbsp;&nbsp;&nbsp;
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
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="40">&nbsp;</td>
      <td width="729"><!--<img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" />--></td>
      <td width="15">&nbsp;</td>
      <td width="15"><a href="como_funciona.jsp"><img src="imagens/identificacao/box_como_funciona.jpg" width="216" height="95" alt="Como Funciona" title="Como Funciona" border="0"/></a></td>
      <td>&nbsp;</td>
    </tr>
  </table></td>
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
                <td width="180"><img src="imagens/cadastro_usuario/titu_empresa.jpg" width="174" height="15" alt="Cadastro Comprador" title="Cadastro Comprador" /></td>
           <td class="li">&nbsp;</td>
                    <td width="15"><img src="imagens/bl_h.jpg" width="10" height="33" alt="Melhor Oferta" title="Melhor Oferta" /></td>
                 <td width="250">&nbsp;</td>
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
                        <td width="40">&nbsp;</td>
                        <td >
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td class="titulos_internos">&nbsp;</td>
                              </tr>
                              <tr>
                                <td>
                                 <table width="100%"border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>
                                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td valign="top">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="ct_es_lar">&nbsp;</td>
                                                        <td class="usuarios_cl">&nbsp;</td>
                                                        <td width="24" class="ct_di_lar">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="usuarios_el">&nbsp;</td>
                                                        <td class=" usuarios_gel" valign="top">
                                                            
                                                        <!-- 
                                                            //-----------------------------------------------------------------------------------------------
                                                                                                      FOMULÁRIO!!!
                                                            -----------------------------------------------------------------------------------------------//
                                                         -->
                                                         
                                                        <form name="Formulario" method="post" action="ControleVendedor?cmd=gravar_empresa" onsubmit="return ValidadorWLD(this)"> 
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td>
                                                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td class="mensagem" align="center">${mensagem}</td>
                                                                </tr>
                                                                  <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td width="190" align="right" class="txt_soli">
									Tipo Pessoa*:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                     <td class="txt_soli">&nbsp;&nbsp;
                                                                        <input name="tipo" type="radio" value="cpf" onclick="valor('cpf')" /> Pessoa Física&nbsp; 
                                                                        <input name="tipo" type="radio" value="cnpj" onclick="pf()" /> Pessoa Jurídica</td>
                                                                  </tr>
                                                                </table></td>
                                                           			</tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>                                                                                                                      
                                                            
                                                              
                                                              <tr>
                                                                <td align="right" class="txt_soli" valign="top">Vendedor*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
									<input name="vendedor" type="text" class=" form_sol" value="" size="65" maxlength="300"/></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                                  
                                                                   <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>   
                                                              
                                                             <!-- <tr>
                                                                <td align="right" valign="top" class="txt_soli">CPF*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100"><input type="text" name="email" size="20" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex:99999999999 (não é necessário pontuação)</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>-->
                                                              <tr id="cpf">
                                                                <td align="right" valign="top" class="txt_soli">CNPJ*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
								    <input name="cnpj" type="text" class=" form_sol" value="" size="25" maxlength="18" onkeypress="mascara(this,cnpj)" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99.999.999/9999-99</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" valign="top" class="txt_soli">CPF*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
								    <input name="cpf" type="text" class=" form_sol" value="" size="25" maxlength="14" onkeypress="mascara(this,cpf)" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 111.111.111-11</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
								    <input type="text" name="Cep" size="12" class=" form_sol" value="" maxlength="9" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99999-999</td>
                                                                    <td><a href="javascript:Calcula()"><img border="0" alt="image" name="imageField" id="imageField" src="imagens/cadastro_usuario/titu_preencher.jpg" /></a></td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--inicio linha-->
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <!--fim linha-->
                                                             <!--inicio linha-->
                                                              
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
                                                              
                                                              <!--fim linha-->
                                                              <!--inicio linha-->
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
                                                            <td id="LinhaCepValido" style="display: none">
                                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="190" align="right" class="txt_soli">Endere&ccedil;o*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
								   <input name="endereco" type="text" value="" size="60" maxlength="300" class=" form_sol"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="30">
									<input type="text" name="numero" size="5" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
								    <input type="text" name="complemento" size="45" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="80">
																	<input type="text" name="bairro" size="25" value="" class=" form_sol"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                             <select size="1" name="regiao" class="form_sol">
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
                                                                             <select size="1" name="estado" class="form_sol">
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
                                                                                </select>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="80">
																	<input name="cidade" type="text" class=" form_sol" value="" size="50" maxlength="50"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                <td align="right" class="txt_soli">Telefone*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="telefone" size="12" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99 9999-9999</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <!--fim linha-->
                                                          </table>
                                                            </td>
                                                          </tr>
                                                          <!--fim linha-->
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td>
                                                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <!--inicio linha-->
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Email - recebto de solicita&ccedil;&otilde;es*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="email" size="25" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="190" align="right" class="txt_soli">Login*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="30">
																	<input name="login" type="text" class=" form_sol" value="" size="15" maxlength="15"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;<span class="txt_soli">m&iacute;nimo 5 m&aacute;ximo 15 caracteres</span></td>
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

                                                              <!--inicio linha-->
                                                                <tr>
                                                                <td align="right" class="txt_soli">Senha*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="15">
																	<input name="senha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                <td align="right" class="txt_soli">Confirma a senha*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="15">
																	<input name="confirmasenha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                        <td><!--<input type="image" name="imageField" id="imageField" src="imagens/cadastro_usuario/bt_enviar.jpg" />-->
                                                                        
																		<input name="nempresa" type="hidden" value="" />
																		<input type="image" border="0" src="imagens/cadastro_usuario/bt_enviar.jpg" /></td>
                                                                      </tr>
                                                                    </table>
                                                                </td>
                                                              </tr>
                                                          </table>
                                                            </td>
                                                          </tr>
                                                        </table>
                                                        </form>
                                                        
                                                       <!-- 
                                                            //-----------------------------------------------------------------------------------------------
                                                                                                     FECHANDO O FOMULÁRIO!!!
                                                            -----------------------------------------------------------------------------------------------//
                                                        -->
                                                        
                                                        </td>
                                                        <td width="24" class="usuarios_dl">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="ct_es_bx_lar">&nbsp;</td>
                                                        <td class="usuarios_bll">&nbsp;</td>
                                                        <td width="24" class="ct_di_bx_lar">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                          </table>
                                        </td>
                                        <td width="19">&nbsp;</td>
                                      </tr>
                                    </table>
                                </td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
               </td>
                 <td width="239" align="center" valign="top"><%@include file="includes_html/tags.inc" %></td>
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
