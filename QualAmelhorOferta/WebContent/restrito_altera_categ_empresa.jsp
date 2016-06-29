<%@page import="br.com.melhoroferta.persistencia.SubCategoriasDAO"%>
<%@page import="br.com.melhoroferta.persistencia.CategoriasDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.melhoroferta.entidades.*"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Inicia Sessão -->
<%
   Vendedor vendedor = (Vendedor) session.getAttribute("vendedor");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
<script type="text/javascript">
var loContSC = <% /* =loTotalSubCategorias */ %>;

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
	Form = document.FormularioWLD;
	loNCategoria = "";

	if (loAjax == null)
	{
		alert ("Seu navegador não suporta AJAX!");
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
		alert('Você só pode selecionar <% /* =loQtCategoria */ %>  opções de Categorias.')
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
		alert('Você só pode selecionar <% /* =loQtSubCategoria */ %>  opções de SubCategorias.')
		paCampo.checked = false;
		loContSC -= 1;
	}
}
</script>
</head>
<body onload="CarregaLink();">
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
    <%@include file="includes_html/ola_vendedor.inc" %>
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
                <td width="255"><img src="imagens/painel_empresa/tit_painel_empresa.jpg" width="252" height="17" alt="Painel de Controle Empresa" title="Painel de Controle Empresa"/></td>
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
                         <td width="230" valign="top">
                            <%@include file="includes_html/menu_restrito_vendedor.inc" %>
                         </td>
                         <td width="15">&nbsp;</td>
                         <td valign="top">
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                  <td valign="top">
                                <form action="ControleVendedor?cmd=gravar_empresa_categoria" method="post" name="FormularioWLD">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td>
                                    <!--
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="165"><img src="imagens/painel_comprador/tit_dados_adicionais.jpg" width="153" height="17" alt="Dados Adicionais" title="Dados Adicionais"/></td>
                                       <td class="li">&nbsp;</td>
                                        <td width="15"><img src="imagens/bl_h.jpg" width="10" height="33" alt="Melhor Oferta" title="Melhor Oferta" /></td>
                                     <td width="10">&nbsp;</td>
                                    </tr>
                                  </table>
                                    -->
                                  </td>
                                  </tr>
                                  <tr>
                                      <td valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                                     <tr>
                                         <td colspan="2"><img src="imagens/titu_sub.jpg" width="100%" height="30" /></td>
                                    </tr> 


    <% 
        CategoriasDAO daoCategoria = new CategoriasDAO();
        
        SubCategoriasDAO subDAO = new SubCategoriasDAO();
        
        int count = 0;
        List<Categorias>lista = daoCategoria.listarCategoriasByVendedor(vendedor.getNvendedor());
            for(Categorias c : lista){
                
    %>                                            
  
                                            
                                            
                                           
                                    <tr>
                                        <td height="30" valign="middle" class="bd_linha_bx ulti_soli2">
                                        <h1>Categoria: </h1>
                                        </td>
                                        <td  class="campo_categorias bd_linha_bx ulti_soli2">
                                            &nbsp;&nbsp;<input name="ncategoria" type="checkbox" value="<% out.print(""+c.getNcategoria()); %>" onclick="CheckC(this)" <% if(c.getVendedorcategorias() != null) out.print("checked='checked'"); %> /> 
                                            <% out.print(c.getNome()); %>
                                        </td>
                                    </tr>
                                        <tr>
                                            <td height="30" valign="middle" class="bd_linha_bx ulti_soli2">

                                            <h1>Subcategorias:</h1>
                                            </td>
                                            <td id="ColSubCategorias" valign="top" class="campo_categorias bd_linha_bx ulti_soli2">&nbsp;
                                        <%
                                            int i=0;
                                            int cod = c.getNcategoria();
                                            List <Subcategorias> listaSub = subDAO.listarSubCategoriasByCod(cod);
                                            for(Subcategorias su : listaSub){
                                        %>                                                    
                                        <div>&nbsp;&nbsp;&nbsp;&nbsp;<% out.print(su.getNome());%></div>
                                        <%
                                        // Fecha  o For da Sub-categoria	
                                                } 
                                        %>
                                            <br /></td> 
                                      </tr>
                                                
  <% } %>
                                 
                                      <tr>
                                          <td height="50" class="bd_linha_bx ulti_soli2" colspan="2">
                                            <input type="image" name="imageField" id="imageField" src="imagens/painel_comprador/btn_alterar_dados.png" />
                                        </td>
                                       
                                      </tr>
                                      <tr>
                                          <td height="50" class="bd_linha_bx ulti_soli2" colspan="2">
                                            <p><a href="mailto:contato@melhoroferta.net"><img src="imagens/painel_comprador/btn_nao_encontrei.jpg" alt="N&atilde;o Encontrei" width="101" height="21" border="0" /></a>
                                        
                                            &lt;&lt; &nbsp;Aqui você pode solicitar a inclusão da categoria ao administrador do sistema.</p>
                                        </td>
                                      </tr>
                                    </table>
                                      </td>
                                  </tr>
                                </table>
                                </form>
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
                            </table>
                         </td>
                       </tr>
                     </table>
                     </td>
                        <td width="239" align="center" valign="top">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="30">&nbsp;</td>
                            <td><%@include file="includes_html/minha_conta_vendedor.inc" %></td>
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
