<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
</head>

<body>
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="170" align="right"><img src="imagens/topo/logo.jpg" width="150" height="126" alt="Melhor Oferta.net" /></td>
                <td width="340" align="center"><img src="imagens/lista/titu_detalhes.jpg" width="286" height="28" alt="Detalhes dos Produtos" /></td>
                <td><img src="imagens/sacola_melhor_pla.jpg" width="141" height="141" alt="Melhor Oferta" /></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="10" bgcolor="#F49304"></td>
          </tr>
            <tr>
                <td bgcolor="#103182" height="3"></td>
              </tr> 
              <tr>
               <td>&nbsp;</td>
            </tr>         
          <%
/* Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT * FROM Planos WHERE NPlano=" & Request("paNPlano") , loConexao
*/
%>

<tr>
			 <td class="lista_planosd">
               <h1>Nome do Plano: <%//=loRS("Nome")%> Plano padão</h1>
               <p>Descrição: <%//=loRS("Descricao")%>Coloque aqui sua descrição do plano</p><br/><br/>
               <p>Valor do Plano: R$<%//=loRS("Valor")%>300,00</p>
               <p>Limite de Negociações:<%//=loRS("Negociacoes")%>300</p>
               <p>Quantidade de Categorias: <%//=loRS("QtCategoria")%>30</p>
               <p>Quantidade de SubCategorias:<%//=loRS("QtSubCategoria")%>60</p>
               <p>Imagens Permitidas: <%//=loRS("NImagem")%>30</p>
               <p>Logotipo: <%//=loRS("Logotipo")%></p>
               

             </td>
           </tr>

<%
/*
loRS.Close
loConexao.Close

Set loRS = Nothing
Set loConexao = Nothing
 */
%>          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#103182" height="15"></td>
  </tr>
  <tr>
    <td bgcolor="#F49304" height="15"></td>
  </tr>
</table>

    </td>
  </tr>
</table>

</body>
</html>
