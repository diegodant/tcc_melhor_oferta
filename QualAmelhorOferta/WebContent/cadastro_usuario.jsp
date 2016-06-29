<%-- 
    Document   : CADASTRO_USUARIO.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<meta name="google-site-verification" content="YF4scqLrVHXRw2ngVh6cyTX3xPnGLMjR7RAFbdFV8Tg" />
        <link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
        <title>Melhor Oferta - Cadastro Usuario</title>
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

            function cep(v){
                v=v.replace(/\D/g,"")                //Remove tudo o que não é dígito
                v=v.replace(/^(\d{5})(\d)/,"$1-$2") //Esse é tão fácil que não merece explicações
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
			
                    Form.rua.value = loDados[1];
                    Form.cidade.value = loDados[2];
                    Form.bairro.value = loDados[4];
			
		
                    for(loCt=0; loCt<Form.estado.length; loCt++)
                        if(Form.estado.options[loCt].value == loDados[3])
                    {
                        Form.estado.selectedIndex = loCt;
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

                        var loCep = Form.cep.value;

                        if (loCep.indexOf('-') > -1){
                                loCep = loCep.replace('-','');

                        }

                        var url = "verifica_cep.jsp?CEP=" + loCep + "&sid=" + Math.random();
                        xmlHttp.open("GET", url, true);
                        xmlHttp.onreadystatechange = ProcessaRetorno;
                        xmlHttp.send(null);
                }

            function Verifica()
            {
                Form = document.Formulario;
                var loApelido = Form.login.value;
	
                xmlHttp = GetXmlHttpObject();
                if (xmlHttp == null)
                {
                    alert ("Seu navegador não suporta AJAX!");
                    return;
                }
	
                var url = "verifica_apelido.jsp?Apelido=" + apelido + "&sid=" + Math.random();
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
                        alert("O Login Já Existe")
                    }
                }
                document.getElementById("imagem").src="imagens/" + loImagem
            }

            function ValidadorWLD(Form)
            {
                if (Form.nome.value == "")
                {
                    alert("Por favor, preencha o campo \"Nome\".");
                    Form.nome.focus();
                    return (false);
                }
                if (Form.login.value == "")
                {
                    alert("Por favor, preencha o campo \"Login\".");
                    Form.login.focus();
                    return (false);
                }
                if (Form.email.value.length < 9)
                {
                    alert("O campo \"Email\" requer no mínimo 9 caracteres.");
                    Form.email.focus();
                    return (false);
                }

                if (Form.email.value == "")
                {
                    alert("Por favor, preencha o campo \"Email\".");
                    Form.email.focus();
                    return (false);
                }

                var CharsEmail = new RegExp("^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$");
                if (CharsEmail.test(Form.email.value) != true)
                {
                    alert("O e-mail digitado não é válido.\nVerifique se você digitou seu e-mail corretamente.");
                    Form.email.focus();
                    return (false);
                }
                if (Form.senha.value.length < 6)
                {
                    alert("O campo \"Senha\" requer no mínimo 6 caracteres.");
                    Form.senha.focus();
                    return (false);
                }

                if (Form.senha.value.length > 12)
                {
                    alert("O campo \"Senha\" suporta no máximo 12 caracteres.");
                    Form.senha.focus();
                    return (false);
                }

                var CharsSenha = new RegExp("([^a-zA-Z0-9])");
                if (CharsSenha.test(Form.senha.value) == true)
                {
                    alert("A senha digitada não é válida.\nPor favor, digite apenas letras e números.");
                    Form.senha.focus();
                    return (false);
                }
                if (Form.confirmasenha.value.length < 6)
                {
                    alert("O campo \"Confirma Senha\" requer no mínimo 6 caracteres.");
                    Form.confirmasenha.focus();
                    return (false);
                }

                if (Form.confirmasenha.value.length > 12)
                {
                    alert("O campo \"Confirma Senha\" suporta no máximo 12 caracteres.");
                    Form.confirmasenha.focus();
                    return (false);
                }

                if (Form.senha.value != Form.confirmasenha.value)
                {
                    alert("A senha e sua confirmação não conferem.");
                    Form.confirmasenha.focus();
                    return (false);
                }
                
                if (Form.dtnascimento.value.length < 8)
                {
                    alert("O campo \"Data\" requer no mínimo 8 caracteres.");
                    Form.dtnascimento.focus();
                    return (false);
                }

                if (Form.dtnascimento.value.length > 10)
                {
                    alert("O campo \"Data\" suporta no máximo 10 caracteres.");
                    Form.dtnascimento.focus();
                    return (false);
                }

                if (Form.dtnascimento.value == "")
                {
                    alert("Por favor, preencha o campo \"Data\".");
                    Form.dtnascimento.focus();
                    return (false);
                }

                var CharsData = new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012]|[1-9])/[12][0-9]{3}");
                if (CharsData.test(Form.dtnascimento.value) != true)
                {
                    alert("A data digitada não é válida.\nPor favor, digite-a novamente.");
                    Form.dtnascimento.focus();
                    return (false);
                }
                
                if (Form.sexo.value == "")
                    {
                        alert("Escolha um sexo");
                        form.sexo.focus();
                        return (false);
                    }
                if (Form.telefone.value.length < 10)
                {
                    alert("O campo \"Telefone\" requer no mínimo 10 caracteres.");
                    Form.telefone.focus();
                    return (false);
                }

                if (Form.telefone.value.length > 12)
                {
                    alert("O campo \"Telefone\" suporta no máximo 12 caracteres.");
                    Form.telefone.focus();
                    return (false);
                }

                var CharsTelefone = new RegExp("(([1-9]{2})(([0-9]{8})|([0-9]{4}\-[0-9]{4}))|([1-9]{2}) (([0-9]{8})|([0-9]{4}\-[0-9]{4})))");
                if (CharsTelefone.test(Form.telefone.value) != true)
                {
                    alert("O Telefone não foi digitado corretamente.\nPor favor, digite-o novamente obedecendo o formato especificado.");
                    Form.telefone.focus();
                    return (false);
                }
/*                if (Form.celular.value.length < 10)
                {
                    alert("O campo \"Celular\" requer no mínimo 10 caracteres.");
                    Form.celular.focus();
                    return (false);
                }

                if (Form.celular.value.length > 12)
                {
                    alert("O campo \"Celular\" suporta no máximo 12 caracteres.");
                    Form.celular.focus();
                    return (false);
                }

                var CharsCelular= new RegExp("(([1-9]{2})(([0-9]{8})|([0-9]{4}\-[0-9]{4}))|([1-9]{2}) (([0-9]{8})|([0-9]{4}\-[0-9]{4})))");
                if (CharsCelular.test(Form.celular.value) != true)
                {
                    alert("O Celular não foi digitado corretamente.\nPor favor, digite-o novamente obedecendo o formato especificado.");
                    Form.celular.focus();
                    return (false);
                }
             
                if (Form.cep.value == "")
                {
                    alert("Por favor, preencha o campo \"Cep\".");
                    Form.cep.focus();
                    return (false);
                }
                if (Form.rua.value == "")
                {
                    alert("Por favor, preencha o campo \"Endereco\".");
                    Form.rua.focus();
                    return (false);
                }

                if (Form.numero.value == "")
                {
                    alert("Por favor, preencha o campo \"Numero\".");
                    Form.numero.focus();
                    return (false);
                }
*/   
            }

        </script>
        <style type="text/css">
            .mensagem {
                color: #CC0000;
                text-align: left;
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
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="40">&nbsp;</td>
                                <td width="729"><img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" /></td>
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
                                            <td width="200"><img src="imagens/cadastro_usuario/titu_cadastro.jpg" width="189" height="20" alt="Cadastro Comprador" title="Cadastro Comprador" /></td>
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
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td class="titulos_internos"><img src="imagens/cadastro_usuario/sub_titu_cadastro.jpg" width="131" height="14" alt="Cadastro de Usuarios" title="Cadastro de Usuarios" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td valign="top">
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="24" valign="top" class="ct_es_vd">&nbsp;</td>
                                                                                                        <td class="usuarios_c">&nbsp;</td>
                                                                                                        <td width="24" class="ct_di_vd">&nbsp;</td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td valign="top">
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="24" class="usuarios_e">&nbsp;</td>
                                                                                                        <td class=" usuarios_ge">


                                                                                                            <!-- 
                                                                                                            //-----------------------------------------------------------------------------------------------
                                                                                                                                                      FOMULÁRIO!!!
                                                                                                            -----------------------------------------------------------------------------------------------//
                                                                                                            -->

                                                                                                            <form name="Formulario" method="post" action="ControleUsuario?cmd=gravar_usuario" onsubmit="return ValidadorWLD(this)"> 
                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                    <!--inicio linha-->
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td>&nbsp;</td>
                                                                                                                                    <td class="mensagem">${mensagem}</td>
                                                                                                                                </tr>
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
                                                                                                                                                    <input type="text" name="nome" size="60" class=" form_sol"></td>
                                                                                                                                                <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>
                                                                                                                                        </table></td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td height="10"></td>
                                                                                                                                    <td height="10" class="txt_soli">*O nome não sera visível no site somente no cadastro</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td height="10" class="txt_soli"></td>
                                                                                                                                    <td height="10"></td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td align="right" class="txt_soli">Login*: </td>
                                                                                                                                    <td>
                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                            <tr>
                                                                                                                                                <td width="10">&nbsp;</td>
                                                                                                                                                <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                <td width="100">
                                                                                                                                                    <input type="text" name="login" size="40" class=" form_sol" value=""></td>
                                                                                                                                                <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>

                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td><a href="javascript:Verifica()"><img src="imagens/bt_verificar.jpg" width="109" height="22" alt="Verificar Apelido" title="Verificar Apelido" border="0" /></a></td>
                                                                                                                                            </tr>
                                                                                                                                        </table>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td height="10" ></td>
                                                                                                                                    <td height="10" class="txt_soli">*O login será visível com nome no site</td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td height="10"></td>
                                                                                                                                    <td height="10"></td>
                                                                                                                                </tr>
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
                                                                                                                                    <td width="26%" height="10"></td>
                                                                                                                                    <td width="74%" height="10"></td>
                                                                                                                                </tr>
                                                                                                                                <!--fim linha-->
                                                                                                                                <!--inicio linha-->
                                                                                                                                <tr>
                                                                                                                                    <td align="right" class="txt_soli" valign="top">Email*:</td>
                                                                                                                                    <td>
                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                            <tr>
                                                                                                                                                <td width="10">&nbsp;</td>
                                                                                                                                                <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                <td width="100">
                                                                                                                                                    <input type="text" name="email" size="45" class=" form_sol" value=''></td>
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
                                                                                                                                <!--fim linha-->
                                                                                                                                <!--inicio linha-->
                                                                                                                                <tr>
                                                                                                                                    <td height="10"></td>
                                                                                                                                    <td height="10"></td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td align="right" class="txt_soli">Senha*:</td>
                                                                                                                                    <td>
                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                            <tr>
                                                                                                                                                <td width="10">&nbsp;</td>
                                                                                                                                                <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                <td width="15">
                                                                                                                                                    <input name="senha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
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
                                                                                                                                <tr>
                                                                                                                                    <td align="right" class="txt_soli">Digite sua senha novamente*: </td>
                                                                                                                                    <td>
                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                            <tr>
                                                                                                                                                <td width="10">&nbsp;</td>
                                                                                                                                                <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                <td width="15">
                                                                                                                                                    <input name="confirmasenha" type="password" class=" form_sol" value="" size="10" maxlength="12"></td>
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
                                                                                                                                <!--fim linha-->
                                                                                                                                <!--inicio linha-->
                                                                                                                                <tr>
                                                                                                                                    <td height="10"></td>
                                                                                                                                    <td height="10"></td>
                                                                                                                                </tr>
                                                                                                                                <!-- Inserção do Rafael -->
                                                                                                                                 <tr>
                                                                                                                                    <td align="right" valign="top" class="txt_soli">Data de Nascimento*: </td>
                                                                                                                                    <td>
                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                    <tr>
                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                        <td width="70">
                                                                                                                                            <input type="text" name="dtnascimento" size="13" class=" form_sol" onkeypress="return dateMask(this, event);" maxlength="10"></td>
                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                    <td align="right" class="txt_soli">Sexo: </td>
                                                                                                                                    <td>
                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                    <tr>
                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                        <td class="txt_soli" width="100">
                                                                                                                                            <input type="radio" name="sexo" value="M" style="height: 20px" />&nbsp;Masculino</td>
                                                                                                                                        <td class="txt_soli">
                                                                                                                                            <input type="radio" name="sexo" value="F" />&nbsp;Feminino</td>
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
                                                                                                                                              <input type="text" name="telefone" size="12" class=" form_sol"></td>
                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                    <td align="right" class="txt_soli">Celular: </td>
                                                                                                                                    <td>
                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                    <tr>
                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                        <td width="70">
                                                                                                                                           <input type="text" name="celular" size="12" class=" form_sol"></td>
                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                              <input type="text" name="cep" size="12" class="form_sol"></td>
                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                                                                                        <td class="txt_soli">&nbsp;Ex: 99999-999</td>
                                                                                                                                        <td><a href="javascript:Calcula()"><img border="0" alt="image" name="imageField" id="imageField" src="imagens/cadastro_usuario/titu_preencher.jpg" /></a></td>
                                                                                                                                    </tr>
                                                                                                                                    </table>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                
                                                                                                                                
                                                                                                                                <!--inicio linha-->
                                                                                                                                            <tr>
                                                                                                                                                <td id="LinhaCepValido" style="display: none" colspan="3">
                                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                <tr>
                                                                                                                                                    <td height="10"></td>
                                                                                                                                                    <td height="10"></td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td width="175" align="right" class="txt_soli">Endereço*:</td>
                                                                                                                                                    <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                        <td width="100">
                                                                                                                                                             <input type="text" name="rua" size="45" class=" form_sol" value=""></td>
                                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                                    <td align="right" class="txt_soli">Número*:</td>
                                                                                                                                                    <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                        <td width="30">
                                                                                                                                                            <input type="text" name="numero" size="5" class=" form_sol" value=""></td>
                                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                                    <td align="right" class="txt_soli">Complemento: </td>
                                                                                                                                                    <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                        <td width="100">
                                                                                                                                                            <input type="text" name="complemento" size="45" class=" form_sol" value=""></td>
                                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                                    <td align="right" class="txt_soli">Bairro: </td>
                                                                                                                                                    <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                        <td width="80">
                                                                                                                                                            <input type="text" name="bairro" size="25" class=" form_sol" value=""></td>
                                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
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
                                                                                                                                                    <td align="right" class="txt_soli">Estado: </td>
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
                                                                                                                                                    <td align="right" class="txt_soli">Cidade: </td>
                                                                                                                                                    <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                    <tr>
                                                                                                                                                        <td width="10">&nbsp;</td>
                                                                                                                                                        <td width="12" align="right"><img src="imagens/cadastro_usuario/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                        <td width="80">
                                                                                                                                                           <input name="cidade" type="text" class=" form_sol" value="" size="30" maxlength="50"></td>
                                                                                                                                                        <td width="11"><img src="imagens/cadastro_usuario/ct_form_d.jpg" width="11" height="21" alt="Melhor Oferta" /></td>
                                                                                                                                                        <td>&nbsp;</td>
                                                                                                                                                    </tr>
                                                                                                                                                    </table>
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                               
                                                                                                                                            </table>
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                            <!--fim linha-->

                                                                                                                                <!-- Fim inserção Rafael -->
                                                                                                                                
                                                                                                                                
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
                                                                                                                                                <td>
                                                                                                                                                     <input type="image" name="imageField" id="imageField" src="imagens/cadastro_usuario/bt_enviar.jpg">
                                                                                                                                                 
                                                                                                                                                </td>
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
                                                                                                                                                     FIM DO FOMULÁRIO!!!
                                                                                                            -----------------------------------------------------------------------------------------------//
                                                                                                            -->

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
                                                                                                        <td width="24" valign="top" class="ct_es_bx_vd">&nbsp;</td>
                                                                                                        <td class="usuarios_bl">&nbsp;</td>
                                                                                                        <td width="24" valign="top" class="ct_di_bx_vd">&nbsp;</td>
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
