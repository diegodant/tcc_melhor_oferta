<%@page import="br.com.melhoroferta.persistencia.VendedorDAO"%>
<%@page import="br.com.melhoroferta.entidades.Vendedor"%>
<%@page import="br.com.melhoroferta.entidades.Usuario"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="pt-br" http-equiv="Content-Language" />
<link rel="stylesheet" type="text/css" href="css/admin.css"/>
<!-- #BeginEditable "doctitle" -->
<title>melhorOferta.net</title>
<script type="text/javascript">
function Limpa(paCampo)
{
	paCampo.value = '';
}

function Remover(paNEmpresa)
{
	if(confirm("Você tem certeza que deseja remover este Empresa"))
	{
		self.location = "remove.jsp?paTipo=Empresa&paNEmpresa=" + paNEmpresa;
	}
}
/* function RemoverFiltro()
{
	Form = document.Filtro;
	Form.Tipo.value = '';
	Form.RazaoSocial.value = '';
	Form.NomeFantasia.value = '';
	Form.Responsavel.value = '';
	Form.CNPJ.value = '';
	Form.CPF.value = '';
	Form.Email.value = '';
	Form.TipoPlano.value = '';
	Form.Login.value = '';
	Form.submit();
}
*/
</script>
<!-- #EndEditable -->

<%
   Usuario u = (Usuario) session.getAttribute("usuario");
%>
</head>


    
<body>
<table width="100%">
	<tr>
		<td><%@include file="include/topo.html" %> </td>
	</tr>
	<tr>
		<td>
		<table width="100%">
			<tr>
				<td class="linha2"></td>
				</tr>
			<tr>
				<td>
				   <table width="100%">
						<tr>
							<td align="left" valign="top" width="179"> <%@include file="include/menu.html" %></td>
							<td class="linha1"></td>
							<td valign="top">
							<!-- #BeginEditable "conteudo" -->
							<table width="100%">
								<tr>
									<td class="titulos">Lista Empresa</td>
								</tr>
								<tr>
									<td class="links"> <a href="empresa_edita.jsp">
									Inserir Nova Empresa</a></td>
								</tr>
								<tr>
									<td>
									  
									<table width="100%">
										<tr>
											<td class="busca">Busca Rápida por:</td>
											<td class="busca">&nbsp;</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<td class="mensagem">${mensagem}</td>
								</tr>
								<tr>
									<td>
									
    <table border="0" cellpadding="0" cellspacing="1">
        <form method="post"  action="..\ControleUsuario?cmd=lista_empresa" name="Filtro">
                <tr>
                        <td class="tabela-produtos" align="center">
                        Tipo de Pessoa</td>
                        <td class="tabela-produtos" align="center">
                        Razão Social</td>
                        <td class="tabela-produtos" align="center">
                        Nome Fantasia</td>
                        <td class="tabela-produtos" align="center">
                        Responsável</td>
                        <td class="tabela-produtos" align="center">
                        CNPJ</td>
                        <td class="tabela-produtos" align="center">
                        CPF</td>
                        <td class="tabela-produtos" align="center">
                        Email</td>
                        <td class="tabela-produtos" align="center">
                        Tipo de Plano</td>
                        <td class="tabela-produtos" align="center">
                        Login</td>
                        <td class="textos-tabela">&nbsp;
                        </td>
                </tr>
            
    <% 
    
    VendedorDAO vd = new VendedorDAO();
    List<Vendedor>lista = vd.listarVendedorAll();
        for(Vendedor v : lista){
    
    %>            
            
                <tr>
                <td class="texto-tabela">
                    <input type="text" name="Tipo" size="20" class="Form" value='<% out.print(v.getUsuario().getTipo()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="RazaoSocial" size="20" class="Form" value='<% out.print(v.getUsuario().getNome()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="NomeFantasia" size="20" class="Form" value='<% out.print(v.getUsuario().getNome()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="Responsavel" size="22" class="Form" style="height: 18px" value='<% out.print(v.getUsuario().getNome()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="CNPJ" size="20" class="Form" value='<% out.print(v.getUsuario().getDocumento()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="CPF" size="20" class="Form" value='<% out.print(v.getUsuario().getDocumento()); %>'/>
                </td>
                <td class="textos-tabela">
                    <input type="text" name="Email" size="20" class="Form" value='<% out.print(v.getUsuario().getEmail()); %>'/>
                </td>

                <td class="texto-tabela">
                    <input type="text" name="TipoPlano" size="20" class="Form" value='<% out.print(v.getUsuario().getTipo()); %>'/>
                </td>


                <td class="textos-tabela">
                <input type="text" name="Login" size="20" class="Form" value='<% out.print(v.getUsuario().getLogin()); %>'/></td>
                <td class="textos-tabela">
                <input name="paPagina" type="hidden" value="<=loPagina%>" />
                <a href="empresa_edita.jsp?nvendedor=<% out.print(v.getUsuario().getNusuario()); %>">
                    <input alt="" src="mo_admin/images/editar.jpg" type="image" /></td>
                </a>
        </tr>
                
<%
//Fim da lista
}
%>              
<!--<
If loCondicoes <> "" Then
%>-->
        <tr class="texto">
                <td class="textos-tabelas">
                    Filtro: </td>
                <td class="textos-tabelas">Tipo: 
                    <select name="tipo">
<% 
    List<Vendedor>tipo = vd.listarVendedorAll();
        for(Vendedor v : tipo){
%>  
                        <option value="<% out.print(v.getUsuario().getTipo()); %>"><% out.print(v.getUsuario().getTipo()); %></option>
<% } %>                        
                    </select></td>

                    
                <td class="textos-tabelas">Plano: 
                    <select name="plano">
<% 
    List<Vendedor>plano = vd.listarVendedorAll();
        for(Vendedor v : plano){
%>  
                        <option value="<% out.print(v.getUsuario().getTipo()); %>"><% out.print(v.getUsuario().getTipo()); %></option>
<% } %>                        
                    </select></td>

<td class="textos-tabelas">(Y): 
    <select name="positivacoes">
<% 
    List<Vendedor>positivacoes = vd.listarVendedorAll();
        for(Vendedor v : positivacoes){
%>  
        <option value="<% out.print(v.getPositivacoes()); %>"><% out.print(v.getPositivacoes()); %></option>
<% } %>                        
    </select></td>

<td class="textos-tabelas">(N): 
    <select name="negativacoes">
<% 
    List<Vendedor>negativacoes = vd.listarVendedorAll();
        for(Vendedor v : negativacoes){
%>  
        <option value="<% out.print(v.getNegativacoes()); %>"><% out.print(v.getNegativacoes()); %></option>
<% } %>                        
    </select></td>

                <td width="130" class="textos-tabela">
                <a href="javascript:RemoverFiltro();">
                remover filtro</a></td>
        </tr>
<!--<
End If
%> -->
</form>	
                        </table>

									
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
<%

    //Colocar o método countVendedor aqui    

%>
<td align="center"><b>Total de empresas cadastradas:</b> <% //out.print();%></td>

								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
	<!--
loRS.Open "SELECT * FROM Empresas" & loCondicoes & " ORDER BY RazaoSocial DESC LIMIT " & loPosicao & ", " & loNRegistros, loConexao

If Not loRS.Eof Then


%>	-->
								<tr>
									<td>
									  
									<table width="100%">
										<tr>
											<td width="20%" class="tabela-produtos" align="center">
											Nome fantasia</td>
											
											<td class="tabela-produtos" align="center" style="font-family: 'Trebuchet MS'; font-weight: bold; font-size: 12px; color: black; width: 26%;">
											Plano Contratado</td>
											<td class="tabela-produtos" align="center" style="font-family: 'Trebuchet MS'; font-weight: bold; font-size: 12px; color: black; width: 25%;">
											Telefone</td>
											
											<td width="10%" class="tabela-produtos" align="center">
											Status</td>
											<td width="10%" class="tabela-produtos" align="center">
											Ações</td>
										</tr>
<!--
	While Not loRS.Eof
		IF loRS("Ativa") = 1 Then
			loAtivo = "Ativo"
		Else 
			loAtivo = "Inativo"
		End if

%>-->
										<tr>
											
											<td width="15%" class="back2 campos2">
											<=loRS("RazaoSocial")%></td>
											
											
											
											<td class="back2 campos2" style="width: 26%">
<!--
	If loRS("NPlano") <> "" Then
		loRS2.Open "SELECT * FROM Planos WHERE NPlano =" & loRS("NPlano"), loConexao
			If Not loRS2.Eof Then
				Response.write loRS2("Nome")
			End if
		loRS2.Close	
	End if
	
%>-->												
											</td>
											
											<td class="back2 campos2" style="width: 25%">
											<=loRS("Telefone")%></td>
											
											<td align="center" class="back2 campos2">
											<=loAtivo%></td>
											<td width="" align="center" class="back2 campos2">
											<table width="60%">
												<tr>
													<td width="16" align="right">
													<a href="empresa_edita.jsp?paNEmpresa=<=loRS("NEmpresa")%>
													<img alt="Editar" height="16" src="mo_admin/images/icones/editar.png" style="border-width: 0px" width="16" title="Editar" /></a></td>
													
													<!--<td width="16">
													<a href="proposta_lista.jsp?paNEmpresa=<=loRS("NEmpresa")%>"><img alt="Lista Proposta" height="16" src="images/icones/lista_proposta.gif" width="16" title="Lista Proposta" border="0" /></a></td>-->
													<td width="16">
													<a href="informacoes_adicionais_lista.jsp?paNEmpresa=<=loRS("NEmpresa")%><img alt="Informações Adicionais" height="16" src="mo_admin/images/icones/informacoes_adicionais.gif" width="16" border="0" title="Informações Adicionais" /></a></td>
													<td width="16">
													<a href="visualizar_avaliacoes.jsp?paNEmpresa=<=loRS("NEmpresa")%><img alt="Ver Avaliações" height="16" src="mo_admin/images/icones/ver_avaliacoes.png" width="16" title="Ver Avaliações" border="0" /></a></td>
													<td width="16">
													<a href="lista_assinatura.jsp?paNEmpresa=<loRS("NEmpresa")%><img alt="Ver Assinaturas" height="16" src="mo_admin/images/icones/visualiza_assinatura.png" width="16" title="Ver Assinaturas" border="0" /></a></td>

													<td width="16">
													<a href="javascript:Remover('<=loRS("NEmpresa")>
													<img alt="Remover" height="16" src="mo_admin/images/icones/remover.png" width="16" border="0" title="Remover" /></a></td>
													

													
												</tr>
											</table>
										</td>
										</tr>
<!--
		loRS.MoveNext
	WEnd
%>-->
									</table>
									  
									</td>
								</tr>

								<tr><td>
									<form action="empresa_lista.jsp" method="post" name="Paginador">
										<table align="center">
											<tr>
<!--
	If loPagina > 1 Then
%>-->
												<td class="titulo_produtos2" width="100px">
												<a href="javascript:Anterior();">&lt;&lt;Anterior</a></td>
<!--
	End If
%>-->
												<td class="titulo_produtos2">
<!--<script type="text/javascript">
Form = document.Paginador;
function Anterior()
{
	Form.paPagina.value = <=loPagina%> - 1;
	Form.submit()
}

function Proxima()
{
	Form.paPagina.value = <=loPagina%> + 1;
	Form.submit()
}

function Paginacao()
{
	if (parseInt(Form.Pagina.value) > <=loUltima%> || parseInt(Form.Pagina.value) <= 0)
	{
		alert("Digite um número entre 1 e <=loUltima%>");
	} else {
		Form.submit()
	}
}

function VerificaNumPag(e)
{
	//Verifica se o usuário digitou apenas números
	if (e.keyCode)
		tecla = e.keyCode;  	
	else if (e.which)
		tecla = e.which; // Netscape 4.?
	else if (e.charCode)
		tecla = e.charCode; // Mozilla

	/*8 - Backspace
	9 - Tab
	13 - Enter
	46 - Delete
	35 - Home
	36 - End
	37 - seta para esquerda
	38 - seta para cima
	39 - seta para direita
	40 - seta para baixo
	48 a 57 - números
	*/

	if (!((tecla >= 48 && tecla <= 57) || tecla == 8 || tecla == 9 || tecla == 13 || ((tecla >= 35) && (tecla <= 40)) || tecla == 46))
		return (false);
}
</script>
-->												Página:
												<input name="paPagina" size="3" type="text" onkeypress="return VerificaNumPag(event)" value="<=loPagina%>"/> 
												de <=loUltima%>&nbsp;<input onclick="Paginacao();" type="Image" src="mo_admin/images/icones/ok.jpg" value="OK" /></td>
<!--
	If loPagina < loUltima Then
%>-->	
												<td align="right" class="titulo_produtos2" width="100px">
												<a href="javascript:Proxima();">Próxima&gt;&gt;</a></td>
<!--	
	End If
%>-->											</tr>
										</table>
									</form>
									</td></tr>
<!--
Else
%>-->
								<tr><td class="titulo_produtos2" style="text-align: center">Não há Empresas cadastrados</td></tr>
<!--
End If
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
%>-->
								<tr><td></td></tr>
					

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
		<td class="rodape">
		 <%@include file="../includes_html/rodape.inc" %>
		</td>
	</tr>
</table>

</body>

 

</html>

