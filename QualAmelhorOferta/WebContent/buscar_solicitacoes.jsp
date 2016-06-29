<%-- 
    Document   : buscar_solicitacao
    Created on : 05/05/2012, 02:37:29
    Author     : Rafael
--%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta - Busca Solicitações</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

    $(document).ready(function() {

	$('#search_category_id').change(function(){
		$.post("getSubCategoria.jsp?cmd=buscarSolicitacao", {
			parent_id: $('#search_category_id').val()
                    }, function(response){
			
			setTimeout("'#show_sub_categories', '"+response+"", 400);
                        $("#sub_category_id").html(response);
		});
		return false;
	});
    });
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
  <td>
<!--      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="40">&nbsp;</td>
            <td width="729"><img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" /></td>
            <td width="15">&nbsp;</td>
            <td width="15"><a href="como_funciona.jsp"><img src="imagens/identificacao/box_como_funciona.jpg" width="216" height="95" alt="Como Funciona" title="Como Funciona" border="0"/></a></td>
            <td>&nbsp;</td>
        </tr>
    </table>-->
      
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
                <td width="195"><img src="imagens/busca_solicitacoes/titu_buscar.jpg" width="186" height="20" alt="Quero a Melhor Oferta" title="Quero a Melhor Oferta" border="0" /></td>
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
                                <td>
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>
                                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="SolicitaÃ§Ãµes"  border="0"/></td>
                                                        <td class="soli_cimaz">&nbsp;</td>
                                                        <td width="24" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_di.jpg" alt="SolicitaÃ§Ãµes" width="24" height="27" vspace="24"  border="0" title="SolicitaÃ§Ãµes"/></td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" class="soli_esz"></td>
                                                        <td valign="top" class="soli_geralz">
                                                        <form action="ControleSolicitacao?cmd=buscarSolicitacaoVendedor" method="post"> 
                        								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                     <tr><td class="mensagem" colspan="3"><p class="mensagem">${mensagem}</p><br /></td></tr>
                                                              <tr>
                                                                <td>&nbsp;</td>
                                                                <td class="txt_soli">Não é necessário preencher todos os campos para se efetuar uma busca.</td>
                                                               <tr>
                                                                <td>&nbsp;</td>
                                                                <td></td>
                                                                 
                                                                <tr>
                                                                <td width="180" align="right" class="txt_soli">Produto/Serviço desejado:</td>
                                                                <td>
                                                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="12" align="right"><img src="imagens/busca_solicitacoes/ct_form_e.jpg" width="11" height="21" alt="Melhor Ofeta" /></td>
                                                                    <td width="100">
									<input type="text" name="produto" size="60" class=" form_sol" /></td>
                                                                    <td width="11"><img src="imagens/busca_solicitacoes/ct_form_d.jpg" width="11" height="21" alt="Mlehor Oferta" /></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table></td>
                                                           </tr>
                                                              <tr>
                                                                <td height="7"></td>
                                                                <td></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Categorias:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10" height="22">&nbsp;</td>
                                                                    <td>
                                                                     <select size="1" name="categoria" class="" style="height: 20px" id="search_category_id">
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
                                                                <td height="7"></td>
                                                                <td></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli">Subcategoria</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="12" align="right"></td>
                                                                    <td width="100">
									<select size="1" name="nsubcategoria" id="sub_category_id" class="form_sol" style="width: 200px;">
                                                                            <option value="" selected>Escolha</option>  
                                                                            
                                                                        </select>
                                                                    </td>
                                                                    <td width="11"></td>
                                                                    <td>&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td height="7"></td>
                                                                <td></td>
                                                              </tr>
                                                              <tr>
                                                                <td align="right" class="txt_soli" valign="top">Estado:</td>
                                                                <td>
                                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td width="10">&nbsp;</td>
                                                                    <td width="100">
                                                                     <select size="1" name="Estado" class="">
                                                                                <option value="Selecione" selected>Escolha</option>
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
                                                                <td>&nbsp;</td>
                                                                <td><!--<input type="image" name="imageField" id="imageField" src="imagens/busca_solicitacoes/bt_buscar.jpg" />-->
                                                                    <input name="paPagina" type="hidden" />
								<input alt="" border="0" src="imagens/busca_solicitacoes/bt_buscar.jpg" type="image" /></td>
                                                              </tr>
                                                               </tr>
                                                              </tr>
                                                                                    
                                                          </table>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td></td>
                                                              </tr>
                                                            </table>
                                                        </form>

                                                        </td>
                                                        <td width="24" class="soli_diz">&nbsp;</td>
                                                   </tr>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>
                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="24" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_es.jpg" width="24" height="27" alt="Solicita&ccedil;&otilde;es" title="SolicitaÃ§Ãµes"  border="0"/></td>
                                                        <td class=" soli_bxz">&nbsp;</td>
                                                        <td width="24" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_di.jpg" alt="SolicitaÃ§Ãµes" width="24" height="27" vspace="24"  border="0" title="SolicitaÃ§Ãµes"/></td>
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
               <td width="239" align="center" valign="top">                   
                   <%@include file="includes_html/cadastrese.inc" %>                   
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