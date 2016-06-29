<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- #include file="lib\lib.asp"-->
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
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
</head>
<body onload="MM_preloadImages('imagens/painel_empresa/btn_acompanhar_solicitacao2.jpg','imagens/painel_comprador/btn_alterar_descricao2.jpg','imagens/painel_comprador/btn_atualizar_logotipo2.jpg','imagens/painel_comprador/btn_atualizar_fotos2.jpg','imagens/painel_comprador/btn_alterar_plano2.jpg','imagens/painel_comprador/btn_avaliacao2.jpg','imagens/painel_comprador/btn_limite_plano2.jpg','imagens/painel_comprador/btn_acompanhar_solicitacao2.jpg','imagens/painel_comprador/btn_sair2.jpg')">
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
  <td>&nbsp;</td>
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
                                <td width="109" valign="top"><img src="imagens/titul_avaliacoes.jpg" width="98" height="19" alt="Avalia&ccedil;&otilde;es" /></td>
                                <td width="914" class="linha_solicitacoes">&nbsp;</td>
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
                         <td width="15">&nbsp;</td>
                         <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                             <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<% /* 
Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")


loConexao.Open Application("BD")
loRS.Open "SELECT NomeFantasia, Comentario, A.NSolicitacao, Comunicacao, UConfiabilidade FROM Avaliacoes A INNER JOIN Empresas E ON A.NEmpresa = E.NEmpresa WHERE A.Ativo = 1 AND Avaliado = 1 AND A.NUsuario = " & Request("paNUsuario") & " ORDER BY NAvaliacao DESC", loConexao

While Not loRS.Eof
'If Not loRS.Eof Then

	loMedia = Fix((CInt(loRS("Comunicacao")) + CInt(loRS("UConfiabilidade"))) / 2)

	loRS2.Open "Select Produto FROM Solicitacoes WHERE NSolicitacao=" & loRS("NSolicitacao"), loConexao
		loProduto = loRS2("Produto")
	loRS2.Close

 */ %>
					<tr>
                                 <td class="vz_avaliacoes">
                                 <ul>
                                 <li>
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td><% /* =loProduto */ %></td>
                                   </tr>
                                   <tr>
                                     <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                       <tr>
                                         <td width="11%" align="center" class="avali">
                                 <ul>
                                  <li>
<% /* 
	loCont = 0
	While loCont < loMedia
 */ %>
                                  <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
<% /* 
		loCont = loCont + 1
	WEnd

	While loCont < 5
 */ %>
                                  <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
<% /* 
		loCont = loCont + 1
	WEnd
 */ %>
                                  </li>
                                 </ul>
                                </td>
                                         <td width="89%"><h1><% /* =loRS("NomeFantasia") */ %></h1>
																			</td>
                                       </tr>
                                       <tr>
                                         <td align="center" class="avali">&nbsp;</td>
                                       </tr>
                                     </table></td>
                                   </tr>
                                   <tr>
                                     <td>
                                     <p><% /* =loRS("Comentario") */ %> </p></td>
                                   </tr>
                                   <tr>
                                     <td>&nbsp;</td>
                                   </tr>
                                 </table>
                                 
                                 </li>
                                 
                                 
                                 </ul>
                                 
                                 </td>
                               </tr>
<% /* 
	loRS.MoveNext
WEnd

loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>
                             </table></td>
                             <td width="15">&nbsp;</td>
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
