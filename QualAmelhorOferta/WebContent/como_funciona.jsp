<%-- 
    Document   : COMO_FUNCIONA.JSP
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
                <td width="150"><img src="imagens/titu_como_funciona.jpg" width="136" height="15" alt="Quero a Melhor Oferta" title="Quero a Melhor Oferta" border="0" /></td>
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
                                 <p>Pare de procurar por vendedores ou compradores, deixe a Tecnologia trabalhar por você! </p>
                                 
                                 <p><strong>Comprador</strong><br />
                                   Cadastre-se na MelhorOferta.net e coloque a sua solicitação de produto ou serviço.
                                   A MelhorOferta.net encontra para você todos os vendedores cadastrados deste produto ou serviço e envia um aviso de que existe uma nova solicitação. (Você comprador fica anônimo).
                                   Ex: Quero comprar o produto X ou, preciso pintar minha sala.
                                  Pronto, agora é só aguardar que as melhores ofertas chegam até você!</p>
<p><strong>Vendedor</strong> <br />
  Imagine que você pode oferecer seu produto ou serviço diretamente para quem realmente quer comprar!
O Vendedor já Cadastrado no Site recebe um email avisando que existe uma nova solicitação para a categoria que atende. Pode também pesquisar no Site na área destinada ao vendedor as solicitações cadastradas pelos compradores que sejam do seu interesse.
O vendedor poderá através da MelhorOferta.net propor sua melhor oferta para a solicitação do comprador tendo assim maior chance de fechar negócio já que o comprador está a procura deste produto ou serviço.</p></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
               </td>
               <td width="239" align="center" valign="top"><!--#include file="includes/tags.asp"-->
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
