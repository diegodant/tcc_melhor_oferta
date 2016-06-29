<%-- 
    Document   : restrito_interagir_vendedor
    Created on : 20/11/2012, 23:41:44
    Author     : CELTAPHP
--%>

<%@page import="br.com.melhoroferta.entidades.Solicitacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.melhoroferta.persistencia.VendedorDAO"%>
<%@page import="br.com.melhoroferta.entidades.Vendedor"%>
<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%
   Usuario u = (Usuario) session.getAttribute("usuario");
   Solicitacao s = (Solicitacao) session.getAttribute("solicitacao");
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
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
    v=v.replace(/\D/g,"")                    //Remove tudo o que n�o � d�gito
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto d�gitos
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto d�gitos
                                             //de novo (para o segundo bloco de n�meros)
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um h�fen entre o terceiro e o quarto d�gitos
    return v
}
function cep(v){
    v=v.replace(/\D/g,"")                //Remove tudo o que n�o � d�gito
    v=v.replace(/^(\d{5})(\d)/,"$1-$2") //Esse � t�o f�cil que n�o merece explica��es
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
    v=v.replace(/\D/g,"")                 //Remove tudo o que n�o � d�gito
    v=v.replace(/(\d{4})(\d)/,"$1-$2")    //Coloca h�fen entre o quarto e o quinto d�gitos
    return v
}

var loContSC = <% /* =loTotalSubCategorias */ %>;
loTipos = '<% /* =loTipo */ %>'
function Inicio()
{
	Form = document.Formulario;
	
	for(loCt=0; loCt<Form.Estado.length; loCt++)
		if(Form.Estado.options[loCt].value == '<% /* =loEstado */ %>')
		{
			Form.Estado.selectedIndex = loCt;
			break;
		}

	 if(loTipos == 'Juridica')
 	{
 		window.onload = pj();
 	}
	if(loTipos == 'Fisica')
 	{
 		window.onload = pf();
 	}

	CarregaLink()
	
}
var loCEPValido = "";

function pf(){
	/*document.Formulario.RazaoSocial.style.visibility='hidden';
	document.Formulario.CNPJ.style.visibility='hidden';
	document.Formulario.RazaoSocial.disabled = true;
	document.Formulario.CNPJ.disabled = true;*/
	
	document.getElementById('pjr').style.display= 'none';
	document.getElementById('cpf').style.display= 'none';
	document.getElementById('rsp').style.display= 'none';
	}
	
	function pj(){
	/*document.Formulario.RazaoSocial.style.visibility='visible';
	document.Formulario.CNPJ.style.visibility='visible';
	document.Formulario.RazaoSocial.disabled = false;
	document.Formulario.CNPJ.disabled = false;*/
	
	document.getElementById('pjr').style.display='';
	document.getElementById('cpf').style.display='';
	document.getElementById('rsp').style.display='';
	
	}

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
		alert ("Seu navegador n�o suporta AJAX!");
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

function CarregaLink()
{
	loAjax = GetXmlHttpObject();
	Form = document.FormularioWLD;
	loNCategoria = "";

	if (loAjax == null)
	{
		alert ("Seu navegador n�o suporta AJAX!");
		return (false);
	}

	loCampos = Form.getElementsByTagName("input")
	for(loCont=1; loCont<loCampos.length; loCont++)
	{	
		if(loCampos[loCont].name.substr(0, 6) == "ChkCat")	
		{
			loCheck = eval("Form." + loCampos[loCont].name);
			if(loCheck.checked)
			{
				if(loNCategoria != "")
				{
					loNCategoria += "," + loCheck.value;
				}
				else
				{
					loNCategoria = loCheck.value;
				}
			}
		}
	}

	//document.getElementById("ConteudoAjax").innerHTML = "<img src=\"images/loading.gif\">";
	var url = "lista_produto.asp?paNCategoria=" + loNCategoria + "&sid=" + Math.random();

	loAjax.onreadystatechange = LinkCarregado;
	loAjax.open("GET", url, true);
	loAjax.send(null);
}

function LinkCarregado()
{
	if (loAjax.readyState == 4)
	{
		document.getElementById("ColSubCategorias").innerHTML = loAjax.responseText;
	}
}
function CheckC(paCampo)
{
	if (paCampo.checked == true)
	{
		loContC += 1;
	}
	else
	{
		loContC -= 1;
	}

	if (loContC > <% /* =loQtCategoria */ %>)
	{
		alert('Voc� s� pode selecionar <% /* =loQtCategoria */ %>  op��es de Categorias.')
		paCampo.checked = false;
		loContC -= 1;		
	}
	CarregaLink();
}
	
function CheckSC(paCampo)
{
	if (paCampo.checked == true)
	{
		loContSC += 1;
	}
	else
	{
		loContSC -= 1;
	}

	if (loContSC > <% /* =loQtSubCategoria */ %>)
	{
		alert('Voc� s� pode selecionar <% /* =loQtSubCategoria */ %>  op��es de SubCategorias.')
		paCampo.checked = false;
		loContSC -= 1;
	}
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
		alert("O campo \"CPF\" requer no m�nimo 13 caracteres.");
		Form.CPF.focus();
		return (false);
	}

	if (Form.CPF.value.length > 14)
	{
		alert("O campo \"CPF\" suporta no m�ximo 14 caracteres.");
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
		alert("O CPF digitado n�o � v�lido.\nPor favor, digite-o novamente.");
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
		alert("O campo \"Telefone\" requer no m�nimo 10 caracteres.");
		Form.Telefone.focus();
		return (false);
	}

	if (Form.Telefone.value.length > 12)
	{
		alert("O campo \"Telefone\" suporta no m�ximo 12 caracteres.");
		Form.Telefone.focus();
		return (false);
	}

	var CharsTelefone = new RegExp("(([1-9]{2})(([0-9]{8})|([0-9]{4}\-[0-9]{4}))|([1-9]{2}) (([0-9]{8})|([0-9]{4}\-[0-9]{4})))");
	if (CharsTelefone.test(Form.Telefone.value) != true)
	{
		alert("O Telefone n�o foi digitado corretamente.\nPor favor, digite-o novamente obedecendo o formato especificado.");
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
		alert("O campo \"Email\" requer no m�nimo 9 caracteres.");
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
		alert("O e-mail digitado n�o � v�lido.\nVerifique se voc� digitou seu e-mail corretamente.");
		Form.Email.focus();
		return (false);
	}
}
 window.onload = Inicio;
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
                                <td width="255" valign="top"><img src="imagens/lista/titu_lista.jpg" width="139" height="16" alt="Painel de Controle Empresa" title="Painel de Controle Empresa"/></td>
                                <td class="linha_solicitacoes">&nbsp;</td>
                                <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                           </tr>
                          </table>
           </td>
          </tr>
             <tr>
           <td valign="top">
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td>
                                     
 
 
 
 										<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td valign="top">
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_cima_es_l.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicita��es"  border="0"/></td>
                                                        <td class="usuarios_cl">&nbsp;</td>
                                                        <td width="24">
                                                        <img src="imagens/cadastro_usuario/ct_cima_di_l.jpg" alt="Solicita��es" width="24" height="27" vspace="24"  border="0" title="Solicita��es"/>
                                                        </td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="usuarios_el">&nbsp;</td>
                                                        <td class=" usuarios_gel">
                                                        <form name="Formulario" action="ControleVendedor?cmd=gravar_empresa" method="post" onsubmit="return ValidadorWLD(this)"> 
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                          <!--inicio linha-->
                                                          <tr>
                                                            <td>
                                                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td width="190" align="right" class="txt_soli">
																Tipo Pessoa*:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                     <td class="txt_soli">&nbsp;&nbsp;
																	 <input name="Tipo" type="radio" value="Fisica" onclick="pj()" /> 
																	 Pessoa 
																	 F&iacute;sica&nbsp; 
																	 <input name="Tipo" type="radio" style="width: 20px" onclick="pf()" value="Juridica" checked /> 
																	 Pessoa Jur&iacute;dica</td>
                                                                  </tr>
                                                                </table></td>
                                                           			</tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr> 
                                                              <tr id="pjr">
                                                                <td width="175" align="right" class="txt_soli">
																Raz&atilde;o Social*:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="RazaoSocial" size="40" class=" form_sol" value="<% out.print(u.getNome()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table></td>
                                                           </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">
																Nome Fantasia*
                                                                :</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="NomeFantasia" size="40" class=" form_sol" value="<% out.print(u.getNome()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr id="rsp">
                                                                <td align="right" class="txt_soli">
																Respons&aacute;vel*
                                                                :</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="Responsavel" size="40" class=" form_sol" value="<% out.print(u.getNome()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                <td align="right" class="txt_soli" valign="top">
																Email*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;
																	</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="Email" size="45" class=" form_sol" value="<% out.print(u.getEmail()); %>"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td class="txt_soli">&nbsp;Ex:99999999999 (n�o � necess�rio pontua��o)</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>-->
                                                              <tr id="cpf">
                                                                <td align="right" valign="top" class="txt_soli">
																CNPJ*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="CNPJ" size="18" class=" form_sol" value="<% out.print(u.getDocumento()); %>" maxlength="18" onkeypress="mascara(this,cnpj)" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">
																	&nbsp;11.111.111/1111-11</td>
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
                                                                <td align="right" valign="top" class="txt_soli">
																CPF*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="CPF" size="18" class=" form_sol" value="<% out.print(u.getDocumento()); %>" maxlength="14" onkeypress="mascara(this,cpf)" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">
																	&nbsp;111.111.111-11</td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="Telefone" size="12" class=" form_sol" value="<% out.print(u.getTelefone()); %>" maxlength="12" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="Celular" size="12" class=" form_sol" value="<% out.print(u.getCelular()); %>" maxlength="12"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="70">
																	<input type="text" name="Cep" size="12" class=" form_sol" value="<% out.print(u.getCep()); %>" onkeypress="mascara(this,cep)" maxlength="9" /></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td class="txt_soli">&nbsp;Ex: 99999-999</td>
                                                                    <td><a href="javascript:Calcula()">
																	<img border="0" alt="image" name="imageField0" id="imageField0" src="imagens/cadastro_usuario/titu_preencher.jpg" /></a></td>
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
                                                                <td class="txt_soli">* Campos com preenchimento obrigat&oacute;rio.</td>
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
                                                               <tr>
                                                                <td height="10"></td>
                                                                <td width="367" height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td width="109" align="right" class="txt_soli">Endere&ccedil;o*:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="Endereco" size="45" class=" form_sol" value="<% out.print(u.getRua()); %>"></td>
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
																	<input type="text" name="Numero" size="5" class=" form_sol" value="<% out.print(u.getNumero()); %>"></td>
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
																	<input type="text" name="Complemento" size="45" class=" form_sol" value="<% out.print(u.getComplemento()); %>"></td>
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
																	<input type="text" name="Bairro" size="25" class=" form_sol" value="<% out.print(u.getBairro()); %>"></td>
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
                                                                             <select size="1" name="Estado" class="style1">
                                                                                        <option value="">Selecione</option>
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
                                                                    <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e_l.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="80">
																	<input name="Cidade" type="text" class=" form_sol" value="<% out.print(u.getCidade()); %>" size="30" maxlength="30"></td>
                                                                    <td width="11"><img src="imagens/cadastro_usuario/ct_form_d_l.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
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
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td height="10"></td>
                                                                <td height="10"></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli"></td>
                                                                <td class="txt_soli">* Campos com preenchimento obrigat&oacute;rio.</td>
                                                              </tr>
                                                              <!--fim linha-->

                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                        						<input type="image" name="imageField1" id="imageField1" src="imagens/painel_comprador/btn_alterar_dados.png" /></td>
                                                              </tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                      <tr>
                                                                        <td width="10">&nbsp;</td>
                                                                        <td>&nbsp;</td>
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
                                                        <td width="24" class="usuarios_dl">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_es_l.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicita��es"  border="0"/></td>
                                                        <td class="usuarios_bll"></td>
                                                        <td width="24"><img src="imagens/cadastro_usuario/ct_baixo_di_l.jpg" alt="Solicita��es" width="24" height="27" vspace="24"  border="0" title="Solicita��es"/></td>
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
                             </table></td>
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
                    <td>
                        <%@include file="includes_html/minha_conta_geral.jsp" %>
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
