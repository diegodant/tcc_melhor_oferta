<%-- 
    document   : POLITICA.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
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
     <%@include file="includes_html/topo.inc"  %>
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
                <td width="115"><img src="imagens/titu_politica.jpg" width="214" height="15" alt="Quero a Melhor Oferta" title="Quero a Melhor Oferta" border="0" /></td>
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
                                <td class="titulos_internos">&nbsp;</td>
                              </tr>
                              <tr>
                                <td class="empresa">
                                 <p>Esta política de privacidade descreve como é o tratamento que a Swiss Vision,
                                    empresa criadora e detentora dos direitos da MelhorOferta.net, dá às informações
                                    fornecidas pelo USUÁRIO e Empresas no ato do seu cadastramento ou durante o uso do
                                    site MelhorOferta.net.</p>
                                 
                                 <h1>Cadastro</h1>
                                 <p>Para usufruir dos SERVIÇOS relacionados a MelhorOferta.net, o USUÁRIO ou Empresa
                                precisa se cadastrar no site da MelhorOferta.net. Este cadastro é armazenado em
                                um banco de dados protegido e sigiloso. Qualquer comunicação enviada para
                                seu email será através do servidor da MelhorOferta.net. Seu e-mail como seus dados não será
                                divulgados.</p>
                                 
                                 <h1>Informações do USUÁRIO</h1>
                                 <p>O USUÁRIO, ao se cadastrar no site da MelhorOferta.net, deverá informar o seu
                                    nome e e-mail para que possa ser identificado dentro do ambiente MelhorOferta.net
                                    e associado a um login de acesso, bem como receber os e-mails enviados pelo
                                    próprio sistema decorrentes de seu uso efetivo.</p>
                                  <h1>Coleta e uso das informações</h1>  
                                  <p>Nossa política de privacidade visa assegurar a garantia de que, quaisquer
                                    informações relativas aos USUÁRIOS ou Empresa coletadas pelo sistema, não serão
                                    fornecidas, publicadas ou comercializadas em quaisquer circunstâncias,
                                    ressalvadas as hipóteses de ordem judicial. Tais informações destinam-se
                                    exclusivamente à avaliação dos requisitos técnicos indispensáveis ao uso do
                                    Site.</p>
                                    <h1>Cookies</h1>
                                    <p>A MelhorOferta.net coleta informações através de cookies (informações enviadas
                                        pelo servidor do KOLABORE ao computador do USUÁRIO, para identificá-lo).
                                        Os cookies servem para autenticar o acesso do USUÁRIO e para controle
                                        interno de audiência e de navegação, jamais para controlar, identificar ou
                                        rastrear preferências do internauta, exceto quando este desrespeitar alguma
                                        regra de segurança ou exercer alguma atividade prejudicial ao bom
                                        funcionamento do site, como por exemplo, tentativas de &#8220;hackear&#8221; o serviço.</p>
                                    
                                    <h1>Segurança das Informações</h1>
                                    <p>Todos os dados pessoais informados por meio do site da MelhorOferta.net são
                                    armazenados em um banco de dados reservado e com acesso restrito a alguns
                                    funcionários habilitados, que são obrigados, por contrato, a manter a
                                    confidencialidade das informações e não utilizá-las inadequadamente.</p>
                                    
                                    <h1>Dúvidas</h1>
                                    <p>Qualquer dúvida relativa às diretrizes que compõem a política de privacidade
                                    ora estabelecida poderão ser solucionadas pelo USUÁRIO junto à MelhorOferta.net,
                                    utilizando-se, para tanto, do contato disponibilizado no site da empresa.</p>
                                    
                                </td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
               </td>
               <td width="239" align="center" valign="top"><%@include file="includes_html/tags.inc" %>
            </td>
             </tr>
           </table>
           </td>
          </tr>
         <tr>
           <td>
           <!--inicio rodape-->
           <%@include file="includes_html/rodape.inc"  %>
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
