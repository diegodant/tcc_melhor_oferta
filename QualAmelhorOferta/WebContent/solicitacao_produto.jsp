<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% /* @LANGUAGE="VBSCRIPT" CODEPAGE="1252" */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">
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

function CarregaLink()
{
	loAjax = GetXmlHttpObject();
	Form = document.Formulario;
	loNCategoria = "";

	if (loAjax == null)
	{
		alert ("Seu navegador não suporta AJAX!");
		return (false);
	}

	for(loCampo in Form)
	{
		if(loCampo.substr(0, 6) == "ChkCat")
		{
			loCheck = eval("Form." + loCampo);
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
	var url = "lista_solicitacao_produto.jsp?paNCategoria=" + loNCategoria + "&sid=" + Math.random();

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
                <td width="205"><img src="imagens/melhor_oferta/titu_melhor_oferta.jpg" width="200" height="17" alt="Quero a Melhor Oferta" title="Quero a Melhor Oferta" border="0" /></td>
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
                                <td class="titulos_internos"><img src="imagens/melhor_oferta/titu_solicitacoes.jpg" width="150" height="14" alt="Solicitações" title="Solicitações" border="0" />&nbsp;</td>
                              </tr>
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
                                                        <td width="24"><img src="imagens/melhor_oferta/ct_cima_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                        <td class="soli_cima">&nbsp;</td>
                                                        <td width="24"><img src="imagens/melhor_oferta/ct_cima_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="soli_es">&nbsp;</td>
                                                        <td class="soli_geral">
                                                        <form name="Formulario" action="envia_nova_solicitacao.jsp" method="post"> 
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td width="180" align="right" class="txt_soli">Produto/Servi&ccedil;o:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/melhor_oferta/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="Produto" size="60" class=" form_sol" value=""></td>
                                                                    <td width="11"><img src="imagens/melhor_oferta/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table></td>
                                                           </tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
<!--                                                               <tr>
                                                                <td align="right" class="txt_soli">Prazo:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10" height="22">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/melhor_oferta/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
																	<input type="text" name="Prazo" size="20" value="" class=" form_sol"></td>
                                                                    <td width="11"><img src="imagens/melhor_oferta/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
 -->
                                                               <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli" valign="top">Descri&ccedil;&atilde;o:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="100">
																	<textarea name="Descricao" cols="55" rows="7" class="box_soli" id="textarea"></textarea></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              
                                                          </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              
                                                              <tr>
                                                                <td width="180" align="right" valign="top" class="txt_soli">Categorias Relacionadas:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
<% /* 
loColunas = 4

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NCategoria, Nome From Categorias Where Ativa=1 ", loConexao

loContador = 0
While Not loRS.Eof
 */ %>

 
                                                                      <td class="lista_soli">&nbsp;&nbsp;<input name="ChkCat<% /* =loRS("NCategoria") */ %>" <% /* =loNCategoria */ %> type="checkbox" value="<% /* =loRS("NCategoria") */ %>" onclick="CarregaLink(this)" />&nbsp;<% /* =loRS("Nome") */ %></td>

<% /* 
	loContador = loContador + 1	

	If loContador Mod loColunas = 0 Then
		Response.Write "</tr><tr>"
	End If

	loRS.MoveNext
WEnd

loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */ %>                                                                        
                                                                   </tr>
                                                                 </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" valign="top" class="txt_soli">Subcategorias Relacionadas:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                 

 
                                                                      <td id="ColSubCategorias"></td>

                                        </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
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
                                                                        <td><input type="image" name="imageField" id="imageField" src="imagens/melhor_oferta/bt_enviar.jpg" /></td>
                                                                      </tr>
                                                                    </table>
                                                                </td>
                                                              </tr>
                                                          </table></td>
                                                              </tr>
                                                            </table>
                                                        </form>

                                                        </td>
                                                        <td width="24" class="soli_di">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24"><img src="imagens/melhor_oferta/ct_baixo_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                        <td class=" soli_bx">&nbsp;</td>
                                                        <td width="24"><img src="imagens/melhor_oferta/ct_baixo_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
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
               <td width="239" align="center" valign="top"><%@include file="includes_html/nuvem_tags.jsp" %>
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
