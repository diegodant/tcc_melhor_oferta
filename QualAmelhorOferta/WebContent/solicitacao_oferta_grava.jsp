<%@page import="br.com.melhoroferta.persistencia.SolitacaoDAO"%>
<head>
<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
</head>

<% 

int nsolicitacao = Integer.parseInt(request.getParameter("nsolicitacao"));
int nproposta    = Integer.parseInt(request.getParameter("nproposta"));
SolitacaoDAO sdao = new SolitacaoDAO();
String msg = "";
if(sdao.fecharSolicitacao(nsolicitacao , nproposta,0)){
    
    msg = "Solicitação finalizada com sucesso.<br>Veja abaixo os dados da empresa escolhida.";
    
}else{
    
    msg = "Houve um erro ao finalizar sua solicitação:"+ nsolicitacao + "<br>.Por favor, verifique se o seu email está correto. Caso esse erro persista, entre em contato conosco.";
}
response.sendRedirect("restrito_detalhes_solicitacoes.jsp?nsolicitacao="+nsolicitacao+"&msg="+msg);
//request.getRequestDispatcher("restrito_detalhes_solicitacoes.jsp?nsolicitacao="+nsolicitacao+"&msg="+msg).forward(request, response);

/* 

If Request("paNInteracao") = "" And Not IsNumeric(Request("paNInteracao")) Then
	Response.Redirect "index.jsp"
End If

Set loConexao = Server.CreateObject("ADODB.Connection")
Set loRS = Server.CreateObject("ADODB.Recordset")
Set loRS2 = Server.CreateObject("ADODB.Recordset")

loConexao.Open Application("BD")
loRS.Open "SELECT NSolicitacao, NEmpresa FROM Interacoes WHERE NInteracao = " & Request("paNInteracao"), loConexao
If loRS.Eof Then
	Response.Redirect "index.jsp"

Else
	loNSolicitacao = loRS("NSolicitacao")
	loNEmpresa = loRS("NEmpresa")
	
End If
loRS.Close

loRS.Open "SELECT NPlano, NomeFantasia, Email FROM Empresas WHERE NEmpresa = " & loNEmpresa, loConexao
If loRS.Eof Then
	Response.Redirect "detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao

Else
	loNomeEmpresa = loRS("NomeFantasia")
	loEmailEmpresa = loRS("Email")
	loNPlano = loRS("NPlano")

End If
loRS.Close


loRS.Open "SELECT NAssinatura, DataValidade, Negociacoes FROM Assinaturas WHERE NEmpresa = " & loNEmpresa & " AND NPlano = " & loNPlano & " AND Status = 1 ORDER BY DataValidade DESC", loConexao
If loRS.Eof Then

	Response.Redirect "detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao & "&paMsg=A empresa escolhida está com o plano vencido. Por isso ela não pode ser escolhida."

'Else
	'If loRS("DataValidade") < Date Then

		'Response.Redirect "detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao & "&paMsg=A empresa escolhida está com o plano vencido. Por isso ela não pode ser escolhida."
	
ElseIf loRS("Negociacoes") <= 0  Then
		Response.Redirect "detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao & "&paMsg=A empresa escolhida está com o plano vencido. Por isso ela não pode ser escolhida."
	
Else
		loNAssinatura = loRS("NAssinatura")
	
End If

loRS.Close


loRS.Open "SELECT NSolicitacao, Status, NEmpresaVencedora, DataFinalizacao, UA FROM Solicitacoes WHERE NSolicitacao = " & loNSolicitacao & " AND NUsuario = " & Session("Usuario-NUsuario"), loConexao, 3, 3
If loRS.Eof Then
	Response.Redirect "index.jsp"

Else
	If loRS("Status") <> 1 Then
		Response.Redirect "restrito_detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao
	End If

	Set loHTTP = Server.Createobject("Dynu.HTTP")
	loHTTP.SetFormData "NSolicitacao", loNSolicitacao
	loHTTP.SetFormData "NEmpresa", loNEmpresa
	loHTTP.SetURL "http://www.melhoroferta.net/home/e-mail_solicitacao_finalizada.jsp"
	loHTML = loHTTP.PostURL()
	
	'Response.write loHTML	
	'Response.end
	Set loHTTP = Nothing

	Set loMailer = Server.CreateObject("SoftArtisans.SMTPMail")
	loMailer.RemoteHost = "localhost"
	loMailer.FromName = "MelhorOferta.Net" 
	loMailer.FromAddress = "roman.grasso@melhoroferta.net"
	loMailer.Subject = "Solicitação Finalizada"
	loMailer.AddRecipient Session("Usuario-Nome"), Session("Usuario-Email")
	loMailer.AddRecipient loNomeEmpresa, loEmailEmpresa
	loMailer.HTMLText = loHTML
	loMailer.ContentType = "text/html"
	loMailer.CharSet = 2
	
	If loMailer.SendMail Then
		loRS("Status") = 2
		loRS("NEmpresaVencedora") = loNEmpresa
		loRS("DataFinalizacao") = Now
		loRS("UA") = Now
		loRS.Update

		loRS2.Open "SELECT NAssinatura, Negociacoes, UA FROM Assinaturas WHERE NAssinatura = " & loNAssinatura, loConexao, 3, 3
		If Not loRS2.Eof Then
			loRS2("Negociacoes") = loRS2("Negociacoes") - 1
			loRS2("UA") = Now
			loRS2.Update
		
		End If
		loRS2.Close

		loRedir = "restrito_detalhes_solicitacoes.jsp?paNSolicitacao=" & loNSolicitacao & "&paMsg=Solicitação finalizada com sucesso.<br>Veja abaixo os dados da empresa escolhida."

	Else

		loRedir = "vendedor.jsp?paNInteracao=" & Request("paNInteracao") & "&paMsg=Houve um erro ao finalizar sua solicitação:" & loMailer.Response & "<br>.Por favor, verifique se o seu email está correto. Caso esse erro persista, entre em contato conosco."
			
	End If

	Set loMailer = Nothing

	Response.Redirect loRedir

End If

loRS.Close
loConexao.Close

Set loRS2 = Nothing
Set loRS = Nothing
Set loConexao = Nothing
 */ %>