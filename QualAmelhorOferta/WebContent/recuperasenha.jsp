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
<title>Untitled Document</title>
</head>
<body>
<% /* 
'Envio de Email

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
loConexao.Open Application("BD")

loRS.Open "SELECT Email, Senha, Nome FROM Usuarios WHERE Email = '"&Request.Form("Email")&"' OR Login = '"&Request.Form("Email")&"'",loConexao

If loRS.EOF Then
 
 response.Redirect("aaa_index.jsp?loMSG=Esse E-mail não esta cadastrado.")

End If

'Declaramos as váriaveis a serem utilizadas no script
dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, emailRetorno, assunto, mensagem, servidor, loResultado
 
 loResultado = "Prezado "&loRS("Nome")&",<br/>Você solicitou o reenvio de sua senha de cadastro no site Melhor Oferta (www.melhoroferta.net)<br />A sua senha é:"&loRS("Senha")&"<br />Para fazer login, acesse o Link: www.melhoroferta.net/home/identificacao.jsp<br />Agradecemos o contato,<br />Melhor Oferta."
'response.Write(loResultado)
'response.End()
 
'Configuramos os dados a serem utilizados no cabeçalho da mensagem
nomeDestinatario = loRS("Nome")  'loRS("Email")
emailDestinatario = loRS("Email")'Request.Form("Email") '"mauro_mgx@yahoo.com.br"
nomeRemetente = "Equipe Melhor Oferta"
emailRemetente = "contato@melhoroferta.net" 'O endereço de e-mail deve ser preenchido com uma conta existente em seu próprio domínio.
emailRetorno =  ""
responderPara = ""
assunto = "Envio de Senha"
mensagem = loResultado
servidor = "SMTP2.locaweb.com.br"
 
'Agora configuramos o componente utilizando os dados informados nas variáveis
 
'Instancia o objeto na memória
SET AspEmail = Server.CreateObject("Persits.MailSender")
 
'Contfigura o servidor SMTP a ser utilizado
AspEmail.Host = servidor
 
'Configura o Nome do remetente da mensagem
AspEmail.FromName = nomeRemetente
 
'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu próprio domínio
AspEmail.From = emailRemetente
 
'Configura o E-mail de retorno para você ser avisado em caso de problemas no envio da mensagem
AspEmail.MailFrom = emailRemetente
 
 
'Configura o e-mail que receberá as respostas desta mensagem
AspEmail.AddReplyTo responderPara
 
'Configura os destinatários da mensagem
AspEmail.AddAddress emailDestinatario, nomeDestinatario
'AspEmail.AddAddress  "sac@agenciawld.com.br","SAC"
'Configura para enviar e-mail Com Cópia
'AspEmail.AddCC "nome0@dominio.com.br", "Nome"
'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
 
'Configura o Assunto da mensagem enviada
AspEmail.Subject = assunto
 
'Configura o formato da mensagem para HTML
AspEmail.IsHTML = True
 
'Configura o conteúdo da Mensagem
AspEmail.Body = mensagem
AspEmail.Charset = "iso-8859-1"
 
'Utilize este código caso queira enviar arquivo anexo
'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
 
'Para quem utiliza serviços da REVENDA conosco
'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
 
'#Ativa o tratamento de erros
On Error Resume Next
 
'Envia a mensagem
AspEmail.Send
 

 
'## Remove a referência do componente da memória ##
SET AspEmail = Nothing



If Err <> 0 Then
	'erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
'	erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
'	erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
'	erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
'	response.write erro
	response.redirect "aaa_index.jsp?loMsg=Erro ao enviar Pedido de Senha."
Else
    response.redirect "aaa_index.jsp?loMsg=Pedido de Senha enviado com sucesso" 
	
End If



'Set Mailer = Server.CreateObject("SoftArtisans.SMTPMail") 
'Mailer.FromName = Request.Form("Nome")
'Mailer.FromAddress = Request.Form("Email")
'Mailer.RemoteHost = "smtp2.localweb.com.br"
'Mailer.AddRecipient "Equipe Gestor Condomínio", "mauro@agenciawld.com.br"
'Mailer.ContentType = "text/html"
'Mailer.Subject = "Contato Site Gestor Condomínio - Contato"
'Mailer.BodyText = loResultado
'Mailer.CharSet = 2
'
''response.Write(loResultado)
'
''response.end
'
'If Mailer.SendMail Then
'	loMsg = "<BR>Contato enviado com sucesso!"
'Else 
'	loMsg = "<BR>Não foi possivel enviar seu Cadastro"
'End If
'Set Mailer = Nothing
'
'response.redirect "contato2.jsp?loMsg=" & loMsg

 */ %>
</body>
</html>