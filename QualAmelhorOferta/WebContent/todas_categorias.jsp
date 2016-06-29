<%-- 
    Document   : TODAS_CATEGORIAS.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.entidades.Categorias"%>
<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.persistencia.Generico" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
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
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="10"></td>
    </tr>
    <tr>
      <td><!--conteudo-->
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="24">&nbsp;</td>
            <td><!--conteudo interno-->
              
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="1" valign="top"></td>
                        <td class="linha_solicitacoes">&nbsp;</td>
                        <td width="10"><img src="imagens/usuarios/pt_cima_minha-conta2.jpg" width="10" height="26" alt="Minha Conta" /></td>
                      </tr>
                    </table></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="747" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="24">&nbsp;</td>
                              <td width="747"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="747"><img src="imagens/titu_sub.jpg" width="747" height="30" alt="Buscar Solicita&ccedil;&otilde;es" /></td>
                                  </tr>
                                  <!--inicio linha-->
                                  <%
                //Set loConexao = Server.CreateObject("ADODB.Connection")
               // Set loRS = Server.CreateObject("ADODB.Recordset")
               // Set loRS2 = Server.CreateObject("ADODB.RecordSet")

               // loConexao.Open Application("BD")
              //  loRS.Open "SELECT NCategoria, Nome From Categorias WHERE Ativa=1" , loConexao

             //   While Not loRS.Eof
              //  loNCategoria = loRS("NCategoria")
                 %>
                        <% 
                        Generico g = new Generico();
                        List<Categorias>lista = g.listarCategoriasAll();
                            for(Categorias c : lista){
                                
                            

                        %>
                                  <tr>
                                    <td class="detalhes_int "><!-- Inicio tabela -->
                                      
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="lista-categorias-02"><h2><a href="lista_busca_solicitacoes.jsp?Categoria=<% out.print(""+c.getNcategoria()); %>"> <% out.print(c.getNome()); %></a></h2></td>
                                        </tr>
                                        
                                        <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="3" class="lista-categorias-01">
                                              <tr>
                                        <%
                          //  loColunas = 3
                  //  loRS2.Open "SELECT NSubCategoria, Nome From SubCategorias WHERE NCategoria=" & loNCategoria, loConexao

                       // loContador = 0
                      //  While Not loRS2.Eof
                          int cod = c.getNcategoria();
                          List <Subcategorias> listaSub = g.listaSubCategoriasByCodCategoria(cod);
                          for(Subcategorias su : listaSub){
                          
%>
                                          
                                                <td width="333"><p><a href="lista_busca_solicitacoes.jsp?SubCategoria=<% out.print(""+su.getNsubcategoria()); %>"> <% out.print(su.getNome());%></a></p></td>
                                                
                                                
                                                 <%}
	//loContador = loContador + 1	

	//If loContador Mod loColunas = 0 Then
	//	Response.Write "</tr><tr>"
	//End If

	//loRS2.MoveNext
//WEnd

//loRS2.Close
%>                                         </tr>

                                            </table>
                                            </td>
                                        </tr>
                                        
                                      </table>
                                      
                                      <!--  Fim Tabela --></td>
                                  </tr>
                                  <%
     //  loRS.MoveNext
//WEnd
}
//loRS.Close
//loConexao.Close

//Set loRS2 = Nothing
//Set loRS = Nothing
//Set loConexao = Nothing
%>
                                  <!--fim linha-->
                                  
                                </table></td>
                            </tr>
                          </table></td>
                        <td width="12">&nbsp;</td>
                        <td width="215" valign="top"><!--#include file="includes/tags.asp"--></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              
              <!--interno--></td>
            <td width="22">&nbsp;</td>
          </tr>
        </table>
        
        <!--fim conteudo--></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
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
