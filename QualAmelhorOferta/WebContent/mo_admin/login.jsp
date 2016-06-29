<%-- 
    Document   : empresa_lista
    Created on : 18/05/2012, 01:52:12
    Author     : Diego
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
<title>Admin Melhor Oferta.net</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"/>

</head>

<body bgcolor="white">

<div id="inicial">
	
	<table width="100%" >
		<tr>
			<td align="center" class="login">
			<img alt="Administrador de Conteúdo" height="66" src="images/logoadmin.gif" width="177" /></td>
		</tr>
		<tr>
			<td class="mensagem">
<!--		  <=Request("paMsg")-->
			</td>
		</tr>
		<tr>
			<td>
			  <form action="..\LoginController?cmd=validar_admin" method="post">
			  	<table width="100%">
                                    <tr>
                                    <td>&nbsp;</td>
                                       <td class="mensagem">${mensagem}</td>
                                    </tr>
			  	
					<tr>
						<td align="right" class="form-login">Senha:</td>
						<td class="texto" >
						<input name="senha" type="password" size="20" class="img-destaques" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
						<input type="image" alt="Enviar" src="images/enviar_.jpg" title="enviar" /></td>
					</tr>
				  </table>
			  </form>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	
</div>


</body>

</html>
