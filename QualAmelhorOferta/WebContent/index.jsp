<%-- 
    Document   : INDEX.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.melhoroferta.entidades.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Diga o que voc� procura e receba as melhores ofertas!" />   
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="google-site-verification" content="YF4scqLrVHXRw2ngVh6cyTX3xPnGLMjR7RAFbdFV8Tg" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta - Home</title>
<script type="text/javascript">
function ValidadorWLD(Form)
{
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

	if (Form.Senha.value.length < 6)
	{
		alert("O campo \"Senha\" requer no m�nimo 6 caracteres.");
		Form.Senha.focus();
		return (false);
	}

	if (Form.Senha.value.length > 12)
	{
		alert("O campo \"Senha\" suporta no m�ximo 12 caracteres.");
		Form.Senha.focus();
		return (false);
	}

	var CharsSenha = new RegExp("([^a-zA-Z0-9])");
	if (CharsSenha.test(Form.Senha.value) == true)
	{
		alert("A senha digitada n�o � v�lida.\nPor favor, digite apenas letras e n�meros.");
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
      <td><!--Inicio Topo--> 
          <%@include file="includes_html/topo.inc" %> 
        <!--Fim Topo--></td>
    </tr>
    <tr>
      <td class="banner" height="202" valign="top">
                  
          <!--[if !IE]> -->
    <object type="application/x-shockwave-flash" data="load.swf" width="1023" height="201">
    <!-- <![endif]-->

    <!--[if IE]>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100" height="100"
        codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0">
        <param name="movie" value="load.swf" />
    <!--><!--dgx-->
    

    </tr>
  
    
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="195" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><!--Inicio Mais pedidas-->
                          
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="imagens/titu_mais-pedidas.jpg" width="174" height="30" alt="Mais Pedidas" title="Mais Pedidas" border="0" /></td>
                            </tr>
                            <tr>
                              <td class="mais_pe mais_pedi_li"><ul>

                                <%
                                Generico g = new Generico();
                                ResultSet rs = g.maisPedidas();
                                while(rs.next()){                                      
                                %>
                                    <li>
                                        <a href="lista_busca_solicitacoes.jsp?Categoria=<%=rs.getInt("NCategoria")%>"><%=rs.getString("Nome")%> </a> 
                                    </li>
                                <%
                                }
                                g.closeDataBase();
                                %></ul></td>
                            </tr>
                            <tr>
                              <td class="mais_pe2 veja_ma" align="center" height="20"><a href="todas_categorias.jsp">ver todas as categorias</a></td>
                            </tr>
                          </table>
               
                          <!--fim mais            pedidas--></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
            <td width="9">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="354"><img src="imagens/aqui_melhor.jpg" width="354" height="34" alt="Aqui a melhor oferta chega ate voc�" title="Aqui a melhor oferta chega ate voc�" /></td>
                        <td class="li">&nbsp;</td>
                        <td width="15"><img src="imagens/bl_h.jpg" width="10" height="33" alt="Melhor Oferta" title="Melhor Oferta" /></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td height="10"></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="354" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><img src="imagens/titu_ultimas_solicitacoes.jpg" width="354" height="30" alt="Ultimas Solicita&ccedil;&otilde;es" title="Ultimas Solicita��es" /></td>
                            </tr>
                            <tr>
                              <td class="ulti_soli">
                                  <%
rs = g.ultimaSolicitacoes();
while(rs.next()){
%>
      <ul>
                                  <li> 
                                   
                                         <a href="detalhes_solicitacoes.jsp?paNSolicitacao=<%=rs.getInt("NSolicitacao")%>">
                                        
                                        <h1><%=rs.getString("produto")%> </h1>
                                        <h2><%=rs.getString("login")%> </h2>
                                        <p> <%=rs.getString("descricao") %></p>
                                    </a> 
                                    
                                  </li>
                                </ul>
<%
}
g.closeDataBase();
%>      
                                

                    </td>
                            </tr>
                            <tr>
                              <td class="ulti_soli2" height="20" align="right"><a href="lista_busca_solicitacoes.jsp">Veja todas</a></td>
                            </tr>
                          </table></td>
                        <td  width="8"></td>
                        <td width="213" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td>
                                 <!-- <
                                If Session("Empresa-Logado") = "OK" Then
                                %>
                                
                                <!-- #include file="includes\minha_conta_vendedor.jsp" -->
                                
                               <!-- <
                                ElseIf Session("Usuario-Logado") = "OK" Then
                                >
                                
                                <!-- #include file="includes\minha_contajsp" -->
                                
                               <!-- <
                                Else
                                %> -->
                                <form action="LoginController?cmd=consulta_login" method="post" name="Formulario" onsubmit="return ValidadorWLD(this)">
                                 <!--inicio form minha conta-->
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="213" class="minha_conta_h"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td height="78">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="18" align="right"><img src="imagens/minha_conta_campoe.jpg" width="8" height="17" alt="Minha conta" title="minha conta" border="0" /></td>
                                                  <td><input name="login" type="text" class="minha_co_campo" /></td>
                                                  <td width="18"><img src="imagens/minha_conta_campod.jpg" width="8" height="17" alt="minha conta" title="minha conta" /></td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                          <tr>
                                            <td height="17">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="118" align="right"><img src="imagens/minha_conta_campoe.jpg" width="8" height="17" alt="Minha conta" title="minha conta" border="0" /></td>
                                                  <td><input name="senha" type="password" class="minha_co_campo_senha" /></td>
                                                  <td width="18"><img src="imagens/minha_conta_campod.jpg" width="8" height="17" alt="minha conta" title="minha conta" /></td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td><a href="#"><img src="imagens/minha_conta_esqueci.jpg" alt="Minha conta" width="213" height="20" border="0" title="Minha Conta" /></a></td>
                                    </tr>
                                    <tr>
                                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="161"><img src="imagens/minha_conta_sacola.jpg" width="161" height="116" alt="Minha Conta" title="Minha Conta" /></td>
                                            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td><input name="" type="image" src="imagens/minha_conta_bt_ok.jpg" />
                                                    
                                                    <!--<a href="usuarios.jsp"><img src="imagens/minha_conta_bt_ok.jpg" width="52" height="44" border="0" /></a>--></td>
                                                </tr>
                                                <tr>
                                                  <td><img src="imagens/minha_conta.jpg" width="52" height="47" alt="Minha conta" /></td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </table>
                                </form>
                                
                                
                                <!--fim minha conta--></td>

                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="35"><img src="imagens/titu_tags.jpg" width="32" height="9" alt="Tags" title="tags" /></td>
                                          <td class="back_tag">&nbsp;</td>
                                        </tr>
                                      </table></td>
                                  </tr>
                                  <tr>
                                    <td width="213">
                                        <%@include file="includes_html/nuvem_tags.jsp" %>
                                    </td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                        <td width="9">&nbsp;</td>
                        <td valign="top"><!--Coluna direita-->
                          
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="213"><table width="213" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td><img src="imagens/boxcadastre-se/cadastre_cima.jpg" alt="Cadastre-se" width="214" height="94" border="0" title="Cadastre-se" /></td>
                                        </tr>
                                        <tr>
                                          <td><a href="cadastro_usuario.jsp"><img src="imagens/boxcadastre-se/cadastre_bt_cima.jpg" alt="Cadastre-se" width="214" height="39" border="0" title="Cadastre-se" /></a></td>
                                        </tr>
                                        <tr>
                                          <td><img src="imagens/boxcadastre-se/cadastre_baixo.jpg" alt="Cadastre-se" width="214" height="69" border="0" title="Cadastre-se" /></td>
                                        </tr>
                                        <tr>
                                          <td><a href="cadastro_empresa.jsp"><img src="imagens/boxcadastre-se/cadastre_bt_bx.jpg" width="214" height="42" alt="Cadastre-se" title="Cadastre-se" border="0" /></a></td>
                                        </tr>
                                      </table></td>
                                    <td>&nbsp;</td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <!--                                          <tr>
                                            <td width="213" class="publicidade_home">
                                            <ul>
                                                <li><a href="#"><script type="text/javascript">var idReferer = "10404468";var pasta = "872";var pais = "BR";var figura = "200x200";var textoLink = "";</script><script type="text/javascript" src="http://ivitrine.buscape.com.br/bp_na_hora/bp_na_hora_gera_download.js"></script></a></li>
                                                <li></li>
                                            </ul>
                                            </td>
                                            <td>&nbsp;</td>
                                          </tr>
-->
                                  <tr>
                                    <td><a href="como_funciona.jsp"><img src="imagens/como_funciona.jpg" width="173" height="185" alt="Como Funciona" title="Como Funciona"  border="0"/></a></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><!--inicio rodape-->         
        <%@include file="includes_html/rodape.inc" %>
        <!--fim rodape--></td>
    </tr>
  </table>
</div>
</body>
</html>
