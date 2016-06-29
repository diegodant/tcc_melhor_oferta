<%-- 
    Document   : restrito_comprador_avaliacao_edita
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- #include file="lib\lib.asp"-->
<% /* 
LoginUsuario()

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")

If Request("paNSolicitacao") <> "" And IsNumeric(Request("paNSolicitacao")) Then

	loRS.Open "SELECT NSolicitacao, Status FROM Solicitacoes WHERE NSolicitacao = " & Request("paNSolicitacao"), loConexao

	If Not loRS.Eof Then

		loEdita = True
		If loRS("Status") = 2 Then
		
			loRS2.Open "SELECT Atendimento, EConfiabilidade, Qualidade, Comentario FROM Avaliacoes WHERE NUsuario = " & Session("Usuario-NUsuario") & " AND Ativo = 1 AND NSolicitacao = " & loRS("NSolicitacao") & " AND Avaliado = 2", loConexao
			If Not loRS2.Eof Then
				
				loEdita = False
				For Each loCampo In loRS2.Fields
					Execute "lo" & loCampo.Name & " = loRS2(""" & loCampo.Name & """)"
				Next
				
			
			End If
			loRS2.Close

		End If

	Else
		Response.Redirect "restrito_minha_solicitacao_comprador.jsp"

	End If

	loRS.Close

Else
	Response.Redirect "restrito_minha_solicitacao_comprador.jsp"

End If

loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing

 */ %>

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
      <td> <%@include file="includes_html/ola_comprador.inc" %>
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
                  <td height="30">&nbsp;</td>
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
					<form action="avaliacao_comprador_grava.jsp" method="post" name="FormularioWLD" >
                             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                               <tr>
                                 <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td align="center"><h1 style="color:#39B449;"><% /* =request("paMsg") */ %></h1></td>
                                   </tr>
                                   <tr>
                                     <td>&nbsp;</td>
                                   </tr>
                                   <tr>
                                     <td>
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td><h1>Incluir Avaliações</h1></td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                               <tr>
                                            <td>Notas Importantes: 1- P&eacute;ssimo,  2- Regular, 3- Bom, 4- Muito Bom, 5- Excelente</td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td><table style="width: 100%">
<% /* 
If loEdita = True Then
 */ %>
													<tr>
														<td style="width: 167px">
														Atendimento:</td>
														<td>
														<input name="Atendimento" type="text" value="" size="1" style="width: 10px" /> 
														Nota de 1 a 5</td>
													</tr>
													<tr>
														<td style="width: 167px">
														Qualidade:</td>
														<td>
														<input name="Qualidade" type="text" value="" size="1" style="width: 10px; height: 20px" /> 
														Nota de 1 a 5</td>
													</tr>
													<tr>
														<td style="width: 167px">
														Confiabilidade:</td>
														<td>
														<input name="EConfiabilidade" type="text" value="" size="1" /> 
														Nota de 1 a 5</td>
													</tr>
													<tr>
														<td style="width: 167px">&nbsp;
														</td>
														<td>&nbsp;</td>
													</tr>
                                                    <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    </tr>
<% /* 
Else
 */ %>
													<tr>
														<td style="width: 167px">
														Atendimento:</td>
														<td><% /* =loAtendimento */ %></td>
													</tr>
													<tr>
														<td style="width: 167px">
														Qualidade:</td>
														<td><% /* =loQualidade */ %></td>
													</tr>
												<tr>
														<td style="width: 167px">
														Confiabilidade:</td>
														<td><% /* =loEConfiabilidade */ %></td>
													</tr>
                                                    <tr>
                                                      <td>&nbsp;</td>
                                                      <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                    <td style="width: 167px">
														Comentário:</td>
                                                    <td>&nbsp;</td>
                                                    </tr>
<% /* 
End If
 */ %>
	
													</table></td>
                                          </tr>
                                        </table>

                                     </td>
                                   </tr>
                                 </table>
                                 
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  
                                  <% /* 
If loEdita = True Then
 */ %>
                                          <tr>
                                            <td><textarea name="Comentario" style="width: 485px; height: 135px" cols="20" rows="1"></textarea></td>
                                          </tr>
                                                                    <tr>
         								<td><input type="image" name="imageField" id="imageField" src="imagens/bt_enviar.jpg" /><input name="NSolicitacao" type="hidden" value='<% /* =Request("paNSolicitacao") */ %>' /></td>
         							</tr>
         
<% /* 
Else
 */ %>
                                  
                                   <tr>
                                     <td>&nbsp;</td>
                                   </tr>
                              
                                      <tr>
                                            <td><% /* =loComentario */ %></td>
                                          </tr>
                                                <tr>
                                     <td>&nbsp;</td>
                                   </tr>
                                          
                                                                                
<% /* 
End If
 */ %>
         
                                          
                                          
                                 </table>
                                 
                                 
                                 </td>
                               </tr>
                             </table>
                             </form>
                             </td>
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
               <td width="239" align="center" valign="top">
			   <%@include file="includes_html/nuvem_tags.jsp" %>
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
