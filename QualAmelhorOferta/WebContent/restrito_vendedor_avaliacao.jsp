<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="br.com.melhoroferta.entidades.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Inicia Sessão -->
<%
   Vendedor v = (Vendedor) session.getAttribute("vendedor");
%>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
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
                  <td width="160" valign="top"><img src="imagens/painel_empresa/tit_painel_empresa.jpg" width="252" height="17" alt="Painel de Controle Comprador" title="Painel de Controle Comprador" /></td>
                  <td class="linha_solicitacoes">&nbsp;</td>
                  <td width="60"><img src="imagens/usuarios/pt_cima_minha-conta.jpg" width="60" height="26" alt="Minha Conta" /></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><br /><%@include file="includes_html/menu_geral.jsp" %></td>
                  <td>&nbsp;&nbsp;&nbsp;</td>  
                    
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr><td>&nbsp;</td></tr>
                            <tr>
                              <td>
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_es_laranja.jpg" width="12" height="14" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                        <td bgcolor="#F29400">&nbsp;</td>
                                        <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_cima_di_laranja.jpg" alt="Solicitações" width="12" height="14" vspace="24"  border="0" title="Solicitações"/></td>
                                    </tr>
                                  </table>
                              </td>
                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="12" bgcolor="#F29400"></td>
                                    <td valign="top" class="soli_geralz"><form action="restrito_vendedor_avaliacao.jsp" method="post">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F29400">
                                                <tr>
                                                    <td class="txt_soli" colspan="2" align="center">Não é necessário preencher todos os campos para se efetuar uma busca.
                                                    </th>
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" bgcolor="#F29400" style="color:#FFF;">Categorias:</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="10" height="22">&nbsp;</td>
                                                        <td>
                                                            <select size="1" name="categoria" id="search_category_id" class="form_sol" style="width: 300px;">
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
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" class="txt_soli">Subcategoria</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td height="7"></td>
                                                  <td></td>
                                                </tr>
                                                <tr>
                                                  <td align="right" class="txt_soli" valign="top"> Estado:</td>
                                                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td width="10">&nbsp;</td>
                                                        <td width="100"><select size="1" name="Estado" class="">
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
                                                          </select></td>
                                                        <td>&nbsp;</td>
                                                      </tr>
                                                    </table></td>
                                                </tr>
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                  <td>&nbsp;</td>
                                                  <td><!--<input type="image" name="imageField" id="imageField" src="imagens/busca_solicitacoes/bt_buscar.jpg" />-->
                                                    
                                                    <input name="paPagina" type="hidden" value="<%//=loPagina%>" />
                                                    <input alt="" border="0" src="imagens/busca_solicitacoes/bt_buscar.jpg" type="image" /></td>
                                                </tr>
                                              </table></td>
                                          </tr>
                                          <tr>
                                            <td></td>
                                          </tr>
                                        </table>
                                      </form></td>
                                    <td width="12" bgcolor="#F29400">&nbsp;</td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr>
                              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_es_laranja.jpg" width="12" height="14" alt="Solicita&ccedil;&otilde;es" title="Solicitações"  border="0"/></td>
                                    <td bgcolor="#F29400">&nbsp;</td>
                                    <td width="12" valign="top"><img src="imagens/busca_solicitacoes/ct_baixo_di_laranja.jpg" alt="Solicitações" width="12" height="14" vspace="24"  border="0" title="Solicitações"/></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table></td>
                      </tr>
                  <tr>
                  <td height="30">&nbsp;</td>
                  </tr>
                    <tr>
                     <td>
                         <table width="100%" border="0" cellspacing="0" cellpadding="0">
                       <tr>
                         <% 
//Set loConexao = Server.CreateObject("ADODB.Connection")
//Set loRS = Server.CreateObject("ADODB.Recordset")
//Set loRS2 = Server.CreateObject("ADODB.Recordset")

//loConexao.Open Application("BD")
//loRS.Open "SELECT Nome, Comentario, A.NSolicitacao, Atendimento, Qualidade, EConfiabilidade, A.UA FROM Avaliacoes A INNER JOIN Usuarios U ON A.NUsuario = U.NUsuario WHERE A.Ativo = 1 AND Avaliado = 2 AND NEmpresa = " & Session("Empresa-NEmpresa") & " ORDER BY NAvaliacao DESC", loConexao
//If Not loRS.Eof Then
	
//	While Not loRS.Eof
	
//		loMedia = Fix((CInt(loRS("Atendimento")) + CInt(loRS("Qualidade")) + CInt(loRS("EConfiabilidade"))) / 3)
	
//		loRS2.Open "Select Produto FROM Solicitacoes WHERE NSolicitacao=" & loRS("NSolicitacao"), loConexao
//			If Not loRS2.Eof Then
//				loProduto = loRS2("Produto")
//			Else
//				loProduto = ""	
//			End if
//		loRS2.Close
  %>
                         <td align="center">
                             <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px solid;border-top: #666 1px solid;border-left:#666 1px solid;border-right:#666 1px solid;">
                                  <tr>
                                    <td width="50%" align="center" bgcolor="#F29400" height="25" style="border-bottom:#666 1px solid;" >
                                        <strong>
                                            <h2 style="color:#333;">Avaliações Recebidas</h2>
                                      </strong>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td ><!-- Tabela Recebidas -->
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                                        <tr>
                                          <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td width="74%"><h1><%//=loRS("Nome") %></h1></td>
                                        </tr>
                                        <tr>
                                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="43%" align="center" class="avali">
                                                
                                                </td>
                                              <td width="57%">
                                                </td>
                                              </tr>
                                            <tr>
                                              <td align="center" class="avali" style="text-align: left;"><p>Data: <%//=LEFT(loRS("UA"),10) %></p></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                        <tr>
                                          <td><ul>
                                                  <li><% 
//	loCont = 0
//	While loCont < loMedia
 %>
                                                    <img src="imagens/usuarios/estrela_dou.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
  <%
//		loCont = loCont + 1
//	WEnd

//	While loCont < 5
 %>
                                                    <img src="imagens/usuarios/estrela_cza.jpg" width="15" height="13" alt="Avaliações" title="Avaliações" />
  <%
//		loCont = loCont + 1
//	WEnd
%>
                                                  </li>
                                                  </ul>
                                          
                                         </td>
                                        </tr>
                                        <tr>
                                          <td> <p><%//=loRS("Comentario")%></p></td>
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
                                  <% 
//		loRS.MoveNext
//	WEnd
//Else
  %>
                                </table>
                                <table width="100%" border="0" cellpadding="0" cellspacing="3">
                                    <tr>
                                        <td align="center">Você não avaliou nenhuma Solicitação até o momento.</td>
                                    </tr>
<%
//End if
//loRS.Close
//loConexao.Close

//Set loRS = Nothing
//Set loConexao = Nothing
 %>
                                </table>
                         </td>
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
                    <td>
                        <%@include file="includes_html/minha_conta_vendedor.inc" %>
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
