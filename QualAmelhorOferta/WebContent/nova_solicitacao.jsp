<%-- 
    Document   : nova_solicitacao
    Created on : 05/05/2012, 02:37:16
    Author     : Marcio
--%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
        <title>Melhor Oferta</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
            
            $(document).ready(function() {

	$('#search_category_id').change(function(){
		$.post("getSubCategoria.jsp?cmd=", {
			parent_id: $('#search_category_id').val()
                    }, function(response){
			
			setTimeout("'#show_sub_categories', '"+response+"", 400);
                        $("#sub_category_id").html(response);
		});
		return false;
	});
});


function alert_id()
{
	if($('#sub_category_id').val() == '')
	alert('Please select a sub category.');
	else
	alert($('#sub_category_id').val());
	return false;
}
            
            
            
            
      // teste ========================================================================
            function Limpa(paCampo)
            {
                paCampo.value = '';
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
                //var url = "lista_solicitacao_produto.asp?paNCategoria=" + loNCategoria + "&sid=" + Math.random();

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
                </tr><!--  <tr>
                  <td height="61" class="back_busca">
                   
                  </td>
                </tr>
                --><tr>
                    <td>&nbsp;</td>
                </tr>
                  <tr>
                        <td>
                            <%@include file="includes_html/ola_geral.jsp" %>
                        </td>
                    </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="24">&nbsp;</td>
                                <td>
                                    <!--conteudo interno-->
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="160" valign="top"><img src="imagens/nova_solicitacao/tit_nova_solicitacao.jpg" width="147" height="19" alt="Nova Solicita&ccedil;&atilde;o" /></td>
                                                        <td class="linha_solicitacoes">&nbsp;</td>
                                                        <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="747" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <!-- <tr>
                                                                   <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                     <tr>
                                                                       <td>&nbsp;</td>
                                                                       <td align="right"><img src="imagens/nova_solicitacao/box_publicidade.jpg" width="728" height="90" /></td>
                                                                       <td width="10">&nbsp;</td>
                                                                     </tr>
                                                                   </table></td>
                                                                 </tr> -->
                                                                <tr>
                                                                    <td height="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <!--  <tr>
                                                                                <td class="titulos_internos"><img src="imagens/melhor_oferta/titu_solicitacoes.jpg" width="150" height="14" alt="Solicitações" title="Solicitações" border="0" />&nbsp;</td>
                                                                              </tr> -->
                                                                            <tr>
                                                                                <td width="230" valign="top" class="list_restrita_empresa">

                                                                                    <%@include file="includes_html/menu_geral.jsp" %>
                                                                                </td>
                                                                                <td>&nbsp;&nbsp;</td>
                                                                                <td valign="top">
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td> 
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="24" valign="top"><img src="imagens/melhor_oferta/ct_cima_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                                                                                    <td class="soli_cima">&nbsp;</td>
                                                                                                                    <td width="24" valign="top"><img src="imagens/melhor_oferta/ct_cima_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="24" class="soli_es">&nbsp;</td>
                                                                                                                    <td valign="top" class="soli_geral">
                                                                                                                        <form name="Formulario" action="ControleSolicitacao?cmd=gravar_solicitacao" method="post" onsubmit="return ValidadorWLD(this)"> 
                                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td width="180" align="right" class="txt_soli">Produto/Serviço:</td>
                                                                                                                                                <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                                                                                                        <tr>
                                                                                                                                                            <td width="10">&nbsp;</td>
                                                                                                                                                            <td width="12" align="right"><img src="imagens/melhor_oferta/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                                                                                                            <td width="100">
                                                                                                                                                                <input type="text" name="produto" size="60" class=" form_sol" value='' /></td>
                                                                                                                                                            <td width="11"><img src="imagens/melhor_oferta/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                                                                                                            <td>&nbsp;</td>
                                                                                                                                                        </tr>
                                                                                                                                                    </table></td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>

                                                                                                                                            <tr>
                                                                                                                                                <td align="right" class="txt_soli">Prazo:</td>
                                                                                                                                                <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                        <tr>
                                                                                                                                                            <td width="10"></td>
                                                                                                                                                            <td>
                                                                                                                                                                <select size="1" name="prazo" class="form_sol" style="width: 200px;">
                                                                                                                                                                    <option value="10" selected>Escolha</option>
                                                                                                                                                                    <option value="10">10 dias</option>
                                                                                                                                                                    <option value="20">15 dias</option>
                                                                                                                                                                    <option value="30">20 dias</option>
                                                                                                                                                                    <option value="60">30 dias</option>
                                                                                                                                                                    <option value="90">60 dias</option>
                                                                                                                                                                </select>        
                                                                                                                                                            </td>
                                                                                                                                                        </tr>
                                                                                                                                                    </table>
                                                                                                                                                </td>
                                                                                                                                            </tr>

                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td align="right" class="txt_soli" valign="top">Descrição:</td>
                                                                                                                                                <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                        <tr>
                                                                                                                                                            <td width="10">&nbsp;</td>
                                                                                                                                                            <td width="100">
                                                                                                                                                                <textarea name="descricao" cols="55" rows="7" class="box_soli" id="textarea"></textarea></td>
                                                                                                                                                            <td>&nbsp;</td>
                                                                                                                                                        </tr>
                                                                                                                                                    </table>
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>
                                                                                                                                            
                                                                                                                                            <tr>
                                                                                                                                                <td align="right" class="txt_soli">Categoria</td>
                                                                                                                                                <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                        <tr>
                                                                                                                                                            <td width="10"></td>
                                                                                                                                                            <td>
                                                                                                                                                                <select size="1" name="categoria" id="search_category_id" class="form_sol" style="width: 200px;">
                                                                                                                                                                    <option value="" selected>Escolha</option>
                                                                                                                                                                    <%
                                                                                                                                                                        Generico g = new Generico();
                                                                                                                                                                        List<Categorias>lista = g.listarCategoriasAll();
                                                                                                                                                                            for(Categorias c : lista){

                                                                                                                                                                    %>                                                                                                                                                                 
                                                                                                                                                                    
                                                                                                                                                                    <option value="<% out.print(c.getNcategoria()); %>"><% out.print(c.getNome()); %></option>
                                                                                                                                                                  <% } %> 	
                                                                                                                                                                </select>        
                                                                                                                                                            </td>
                                                                                                                                                        </tr>
                                                                                                                                                    </table>
                                                                                                                                                </td>
                                                                                                                                             </tr>

                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>  
                                                                                                                                            
                                                                                                                                             <tr>
                                                                                                                                                <td align="right" class="txt_soli">SubCategoria</td>
                                                                                                                                                <td>
                                                                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                                        <tr>
                                                                                                                                                            <td width="10"></td>
                                                                                                                                                            <td>
                                                                                                                                                                <select size="1" name="nsubcategoria" id="sub_category_id" class="form_sol" style="width: 200px;">
                                                                                                                                                                  <option value="" selected>Escolha</option>  
                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                        
                                                                                                                                                                       
                                                                                                                                                                </select>
                                                                                                                                                                
                                                                                                                                                            </td>
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
                                                                                                                                            
                                                                                                                                            <tr>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                                <td>&nbsp;</td>
                                                                                                                                            </tr>
                                                                                                                                            
                                                                                                                                        </table>
                                                                                                                                    </td>
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
                                                                                                                    <td width="24" valign="top"><img src="imagens/melhor_oferta/ct_baixo_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                                                                                                    <td class=" soli_bx">&nbsp;</td>
                                                                                                                    <td width="24" valign="top"><img src="imagens/melhor_oferta/ct_baixo_di.jpg" alt="Solicitações" width="24" height="27" vspace="24"  border="0" title="Solicitações"/></td>
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
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="12">&nbsp;</td>
                                                        <td width="215" valign="top">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td>
                                                                        <!--Inicio Box Minha conta-->                                                                                         
                                                                        <%@include file="includes_html/minha_conta_geral.jsp" %>
                                                                        <!--fim minha conta-->
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><!--<img src="imagens/nova_solicitacao/box_publicidade_p.jpg" width="214" height="54" />--></td>
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
                                        </tr>
                                    </table>
                                    <!--interno-->
                                </td>
                                <td width="22">&nbsp;</td>
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
                    <td>
                        <!--inicio rodape-->
                        <%@include file="includes_html/rodape.inc" %>
                        <!--fim rodape-->
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

