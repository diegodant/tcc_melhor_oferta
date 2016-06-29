<%-- 
    Document   : 
    Created on : 29/09/2012, 16:35:00
    Author     : CELTAPHP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- #include file="lib\lib.asp"-->
<% /* 
response.ContentType = "text/HTML"
response.Charset = "ISO-8859-1"
 
' Log para informar que alguém chegou na página, seja usuário ou robo do PagSeguro
 
Dim TOKEN
'coloca o Token gerado pelo PagSeguro 
TOKEN = "F9A0DBD96F68445FA1E4936BF2EF58EE"
 
timeout = 20  'Timeout em segundos
 
function notificationPost()
 
	postdata = "Comando=validar&Token=" & TOKEN
 
	For each x In Request.Form
		valued = clearStr(request.Form(x))
		postdata = postdata & "&" & x & "=" & valued
	Next
 
	notificationPost = verify(postdata)
 
end Function
 
function clearStr(str)
 
	str = replace(str, "'","\'")
	clearStr = str
 
end function
 
function verify(data)
 
	strUrl = "https://pagseguro.uol.com.br/pagseguro-ws/checkout/NPI.jhtml"
 
	Set xmlHttp = Server.Createobject("MSXML2.ServerXMLHTTP")
 
	xmlHttp.Open "POST", strUrl, False
	xmlHttp.setRequestHeader "User-Agent", "asp httprequest"
	xmlHttp.setRequestHeader "content-type", "application/x-www-form-urlencoded"
	xmlHttp.setRequestHeader "content-length", Len(data)
	xmlHttp.Send(data)
 
	retorno = xmlHttp.responseText
 
	xmlHttp.abort()
 
	set xmlHttp = Nothing
 
	verify = retorno
 
end function

 
  
  
if Request.Form.count > 0 then
	result = notificationPost()
 
	if Request.Form("TransacaoID") <> empty then
		transacaoID = Request.Form("TransacaoID")
	Else
		transacaoID = ""
	end If
 
	' Agora ficou fácil, se chegou via POST, o script irá verificar se ele veio do PagSeguro
	' e gravará no log VERIFICADO ou FALSO
	
	if result = "VERIFICADO" then
		'O post foi validado pelo PagSeguro.
	
	
	
	Set loConexao = Server.CreateObject("ADODB.Connection")
   Set loRS = Server.CreateObject("ADODB.Recordset")
   Set loRS2 = Server.CreateObject("ADODB.Recordset")

   loConexao.Open Application("BD")
'Pega os Posts que o pagseguro retorna apos geração do boleto
   t = Request.Form("TransacaoID")
   id = Request.Form("ProdID_1")
'faz um Select na tabela do pagseguro verificando se é a primeira interação
 
   loRS.Open "SELECT idTransacao FROM PagSeguro WHERE idEmpresa='"&id&"'",loConexao
   
'se for a primeira faz esse bloco
   if loRS.EOF Then
'insere na tabela do pagseguro status da transação  iddo produto no caso a Empresa e o id da Transação
      Data = Request.Form("DataTransacao")
      DT = FormataData(Data)
	  loConexao.Execute "INSERT INTO PagSeguro (status, idTransacao , idEmpresa , tipoPagamento, dataTransacao) VALUES ('"&request.Form("StatusTransacao")&"' , '"&Request.Form("TransacaoID")&"' , '"&id&"' , '"&Request.Form("TipoPagamento")&"' , '"&DT&"' )"
'faz uma busta pela tabela do pagseguro para pegar a transação feita  e o status dela.
	   loRS2.Open "SELECT idTransacao, status , tipoPagamento, dataTransacao FROM PagSeguro WHERE idTransacao='"&t&"'",loConexao
	   
'duvida aqui tem Completo e Aprovado  so caso seria bom ligar para se informar.
	   if loRS2("status") = "Completo" then
		  ativo = 1
		else
		  ativo = 0 
		end if 
'faz um update na tabela de assinatura usando as informações que estão na tabela do pagseguro fiz isso para não ter que alterar todas as verificações do site 
'mas o corredo é relacionar o cliente ou produto na tabale do pagseguro.
	   loConexao.Execute "UPDATE Assinaturas SET Status="&ativo&", idTransacao='"&loRS2("idTransacao")&"', FormaPagamento = '"&loRS2("tipoPagamento")&"' , DataPagamento='"&loRS2("dataTransacao")&"' WHERE NEmpresa='"&id&"'"
   else
'caso não seje a primeira interação ele ira fazer um update  nos status do da transação
'e da tabela do pagseguro e de assinatura
        if request.Form("StatusTransacao") = "Completo" then
		  ativo = 1
		else
		  ativo = 0 
		end if 
      
        loConexao.Execute "UPDATE Assinaturas SET  Status="&ativo&" WHERE NEmpresa="&id
	    loConexao.Execute "UPDATE PagSeguro SET  status="&ativo&" WHERE NEmpresa="&id
   end if 
	
	
	elseif result = "FALSO" then
		'O post não foi validado pelo PagSeguro.
	else
		'Erro na integração com o PagSeguro.
	end if
 
else
	' POST não recebido, indica que a requisição é o retorno do Checkout PagSeguro.
	' No término do checkout o usuário é redirecionado para este bloco.
	

	 */ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta - Home</title>
<meta http-equiv="Refresh" content="3; url=http://www.melhoroferta.net"> 
</head>

<div id="retorno-principal">
  <h3>Obrigado por efetuar a compra.</h3>
  <img src="imagens/loader.gif" width="220" height="19"  alt="Loading" title="Loading" style="margin:10px 0 0 0;"/>
  <a href="http://www.melhoroferta.net/home/"> Conectando ao Site </a>
</div>
<% /* 
end if



 */ %>
