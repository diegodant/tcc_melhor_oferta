<%-- 
    Document   : TERMOS.JSP
    Created on : 27/02/2012, 16:13:57
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/estilo_oferta.css"/>
<title>Melhor Oferta</title>
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
</script>
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
  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="40">&nbsp;</td>
      <td width="729"><!--<img src="imagens/identificacao/img_publicidade.jpg" width="729" height="92" />--></td>
      <td width="15">&nbsp;</td>
      <td width="15"><a href="como_funciona.jsp"><img src="imagens/identificacao/box_como_funciona.jpg" width="216" height="95" alt="Como Funciona" title="Como Funciona" border="0"/></a></td>
      <td>&nbsp;</td>
    </tr>
  </table></td>
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
                <td width="115"><img src="imagens/titu_termos.jpg" width="135" height="15" alt="Quero a Melhor Oferta" title="Quero a Melhor Oferta" border="0" /></td>
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
                                <td class="empresa">
                                 <p>TERMO DE USO DA FERRAMENTA MelhorOferta.net</p>

								<p>Este Termo disciplina os termos e condições pelos quais Swiss Vision Ltda., pessoa jurídica de direito privado, inscrita no CNPJ sob o nº. 05.866.049/0001-45, CEP 05411-000, São Paulo, SP, doravante denominada MelhorOferta.net, coloca à disposição do USUÁRIO (Você), mediante a aceitação eletrônica deste contrato, o Site denominado MelhorOferta.net e os SERVIÇOS associados a ele.</p>
								<p>A MelhorOferta.net não se responsabiliza  pelos produtos e serviços oferecidos, não guarda a posse deles e não realiza as ofertas de venda. Tampouco intervém na entrega dos produtos cuja negociação se inicie no site.</p>	
                                <p>A MelhorOferta não se responsabiliza pela existência, quantidade, qualidade, estado, integridade ou legitimidade dos produtos oferecidos, adquiridos ou alienados pelos Usuários, assim como pela capacidade para contratar dos Usuários ou pela veracidade dos Dados Pessoais por eles inseridos em seus cadastros. A MelhorOferta não outorga garantia por vícios ocultos ou aparentes nas negociações entre os Usuários. Cada vendedor conhece e aceita ser o único responsável pelos produtos que anuncia ou pelas ofertas que realiza.</p>
                                <p>A MelhorOferta não será responsável pelo efetivo cumprimento das obrigações assumidas pelos vendedores e compradores. O Usuário reconhece e aceita que ao realizar negociações com outros Usuários ou terceiros faz por sua conta e risco. Em nenhum caso a MelhorOferta será responsável pelo lucro cessante ou por qualquer outro dano e/ou prejuízo que o Usuário possa sofrer devido às negociações realizadas ou não realizadas através da MelhorOferta decorrentes da conduta de outros usuários. </p>									
								<p>ATENÇÃO: Antes de concluir qualquer cadastro para continuação do uso da MelhorOferta.net, leia atentamente todas as condições gerais contidas neste contrato e caso você não esteja integralmente de acordo com o conteúdo deste e/ou dos documentos que o compõem, não conclua seu cadastro. A conclusão de seu cadastro será interpretada como integral concordância com os termos e condições do presente instrumento. Sugerimos ao USUÁRIO que, para seus próprios registros, imprima e/ou salve em arquivo seguro o presente termo de uso e os documentos que o compõem.</p>
                                
                                 <p>TERMOS E DEFINIÇÕES</p>

                                <p>Serão observados, no presente contrato, os termos e definições abaixo indicados. Internet &#8211; é a rede mundial de computadores interligados entre si, por meio dos protocolos TCP/IP (Transmission Control Protocol/Internet Protocol). Web &#8211; Abreviação de World Wide Web (WWW), é o ambiente gráfico daInternet, onde documentos (páginas com conteúdo multimídia) podem ser acessados por meio de navegadores (browsers). Site &#8211; Conjunto de páginas disponíveis na Web e que podem ser acessadas por meio de um endereço específico, do tipo http://www.dominio.com.br. MelhorOferta.net &#8211; é um serviço Web de propriedade da Swiss Vision disponível no endereço www.MelhorOferta.net; </p>
                                <p>Política de Privacidade &#8211; são os termos e condições a serem seguidos pela MelhorOferta.net e que demonstram o compromisso e respeito com a segurança e privacidade da informação fornecida pelo USUÁRIO; Usuário &#8211; é uma pessoa física considerada capaz nos termos da legislação civil em vigor; Contrato &#8211; significa o presente termo de uso, do qual faz parte integrante a Política de Privacidade;</p>
                                <p>Base de dados &#8211; sinônimo de banco de dados, é a coleção organizada e interrelacionada de dados que visam alimentar o Software; Hardware &#8211; componente, ou conjunto de componentes físicos (equipamentos)
                                  de um computador ou de seus periféricos;
                                  Software &#8211; é uma seqüência de instruções a serem seguidas e/ou executadas,
                                  na manipulação, redirecionamento ou modificação de um dado/informação ou
                                  acontecimento, que é interpretada e executada por um processador ou por uma
                                  máquina virtual. Também denominado de Programa de Computador.
                                  Licença de Uso &#8211; trata-se de uma autorização concedida pelo titular dos direitos
                                  sobre o Software para que uma pessoa faça uso do mesmo.
                                  Manutenção &#8211; cuidados técnicos para prevenir e/ou corrigir falhas do software.
                                  Dados Cadastrais &#8211; é o conjunto de informações prestadas pelo USUÁRIO no
                                  momento da realização de seu cadastro, via Site on-line;
                                  Suporte Técnico &#8211; atividade de orientação e apoio ao usuário referente ao
                                  funcionamento do software, visando esclarecer as suas dúvidas e registrar
                                  possíveis falhas;</p>
                                <p>COMUNICAÇÕES ENTRE AS PARTES</p>
                                <p>As partes reconhecem o e-mail como forma válida, eficaz e suficiente de
                                  comunicação e aceitam o site da MelhorOferta.net como meio
                                  válido, eficaz e suficiente para a divulgação de qualquer assunto que se refira aos
                                  SERVIÇOS, bem como às condições de sua prestação ou a qualquer outro
                                  assunto nele abordado, ressalvadas as disposições expressamente diversas
                                  previstas neste instrumento.</p>
                                <p>CONDIÇÕES GERAIS</p>
                                <p>1) OBJETO  </p>
                                <p>1.1 A MelhorOferta.net disponibiliza ao USUÁRIO o Site para publicar a sua solicitação e encontrar as melhores ofertas oferecidas pelas empresas. As Empresas cadastrem-se para receber ou pesquisar pelas solicitações e colocados pelos USUÁRIOS.
                                  <br />
                                  1.2 Os termos e condições estabelecidos neste contrato se referem à utilização do
                                  MelhorOferta.net nos planos gratuitos e pagos.
                                  As características de cada plano são informadas no site do MelhorOferta.net , no link planos.
                                  
                                  <br />
                                  1.3 A MelhorOferta.net se reserva o direito de alterar, a qualquer tempo, as características dos SERVIÇOS ofertados, devendo para tanto informar as alterações no site da MelhorOferta.net.  </p>
                                <p>2) PREÇO E FORMA DE PAGAMENTO</p>
                                <p> 2.1 Gratuito. O USUÁRIO que concluir seu cadastro na MelhorOferta.net ,
                                  concordando com os termos e condições do presente instrumento, poderá utilizar
                                  gratuitamente os SERVIÇOS oferecidos pela MelhorOferta.net na modalidade gratuita,
                                  destinados à avaliação da MelhorOferta.net . A versão gratuita tem limitações de
                                  recursos (quantidades de anúncios e ofertas).</p>
                                <p>3) PROPRIEDADE INTELECTUAL</p>
                                <p>3.1 A MelhorOferta.net é de propriedade exclusiva da Swiss Vision. O USUÁRIO não adquire, por meio do presente instrumento, qualquer direito de propriedade sobre o
                                  Site, sendo-lhe vedado praticar os seguintes atos:</p>
                                <p>I- utilizar de engenharia reversa, descompilação, reprogramação ou
                                  modificação de qualquer natureza das características do Site,
                                  bem como criar versões sucessivas dele, reproduzi-lo ou a adotar
                                  qualquer medida que vise à obtenção do seu código-fonte;
                                  <br />
                                  II- usar o Site para fins diferentes daqueles para os quais foi
                                  desenvolvido ou em condições diferentes daquelas expressamente
                                  autorizadas nos termos desta licença;
                                  <br />
                                  III- transferir, repassar, sublicenciar ou ceder o Site, total ou
                                  parcialmente, assim como praticar qualquer outro ato de permissão
                                  de uso, fruição ou disposição, provisória ou permanentemente,
                                  gratuita ou onerosamente, ficando o USUÁRIO responsável pelas
                                  conseqüências derivadas de tais ações.  </p>
                                <p>3.2 O USUÁRIO não poderá fazer uso, em quaisquer circunstâncias, da marca,
                                  nome comercial, know-how ou qualquer outra informação da MelhorOferta.net .  </p>
                                <p>4) CONFIDENCIALIDADE  </p>
                                <p>4.1 As partes, por si e por seus colaboradores, obrigam-se a manter sigilo sobre a
                                  propriedade intelectual, dados, informações, conhecimentos, materiais,
                                  equipamentos, documentos, informações técnicas ou comerciais e sobre o
                                  presente contrato, não podendo, em nenhuma hipótese, revelar, reproduzir ou dar
                                  conhecimento a terceiros, tanto durante o período de execução do contrato,
                                  quanto após seu término.
                                  
                                  <br />
                                  4.2 No caso de uma das partes ser chamada, por força de decisão judicial ou de
                                  ato de autoridade com poderes para tal, a prestar qualquer informação referente à
                                  outra, ou sobre seus documentos, dados e informações, deverá informar a
                                  autoridade encarregada de cumprir o mandado, do dever de confidencialidade a
                                  que está adstrito e comunicar o fato imediatamente à outra parte, para que esta
                                  tome as medidas cabíveis de defesa.  </p>
                                <p>5) SENHAS E SEGURANÇA DA CONTA DO USUÁRIO  </p>
                                <p>5.1 O USUÁRIO concorda e entende que será responsável por manter a
                                  confidencialidade das senhas relacionadas a qualquer conta que utilizar para
                                  acessar os Serviços.
                                  
                                  <br />
                                  5.2 De forma correspondente, o USUÁRIO concorda que será exclusivamente
                                  responsável por todas as atividades que ocorram em sua conta.
                                  
                                  <br />
                                  5.3 Se o USUÁRIO tomar conhecimento de qualquer uso desautorizado de sua
                                  senha ou conta, ele concorda em notificar a MelhorOferta.net imediatamente.
                                  
                                  <br />
                                  5.4 A Política de Privacidade da MelhorOferta.net é parte integrante do presente instrumentoe demonstra o compromisso e respeito da MelhorOferta.net com a segurança e privacidade da informação fornecida pelo USUÁRIO. Aceitando o termo de uso o USUÁRIO
                                  está concordando também com a Política de Privacidade.  </p>
                                <p>6) GARANTIAS E RESPONSABILIDADES  </p>
                                <p>6.1 Dados/base de dados: O USUÁRIO é responsável pela utilização e gestão do
                                  conteúdo da base de dados, bem como pelos danos causados pelo seu mau uso.
                                  
                                  <br />
                                  6.2 Exclusões de responsabilidade:
                                  <br />
                                  6.2.1 Mau uso: A MelhorOferta.net não responderá por defeitos, danos ou qualquer
                                  funcionamento não adequado, proveniente do mau uso do Site ou de uso em
                                  equipamentos ou sistemas operacionais.
                                  
                                  <br />
                                  6.2.2 A MelhorOferta.net não se responsabilizará por eventuais interrupções nos
                                  SERVIÇOS aqui contratados que possam ser motivados por defeitos na rede
                                  pública de energia e/ou telecomunicações, ou por problemas relacionados aos
                                  recursos técnicos do USUÁRIO, tais como computador, modem, acesso à Internet.
                                  
                                  <br />
                                  6.2.3 Prejuízos a terceiros: A MelhorOferta.net não responderá por quaisquer danos materiaisou morais causados a terceiros, em virtude do mau uso do Site pelo
                                  USUÁRIO ou por terceiros, ou mesmo em virtude do conteúdo armazenado,
                                  processado ou enviado por seu intermédio. No caso de a MelhorOferta.net ser envolvida em qualquer demanda judicial por ação ou omissão do USUÁRIO, todas as despesas
                                  judiciais e extrajudiciais por ela suportadas deverão ser reembolsadas pelo
                                  USUÁRIO.
                                  
                                  <br />
                                  6.2.4 Limitação da responsabilidade: A MelhorOferta.net limita sua responsabilidade por
                                  danos causados em decorrência de vícios, defeitos ou impossibilidade do uso do
                                  Site ao valor pago pelos SERVIÇOS.  </p>
                                <p>7) OUTRAS OBRIGAÇÕES  </p>
                                <p> 7.1.1 O USUÁRIO obriga-se a respeitar todos os direitos de propriedade
                                  intelectual decorrentes da titularidade do Site.<br />
                                7.2.1 A MelhorOferta.net disponibilizará aos USUÁRIOS as atualizações pertinentes ao
                                  Site.
                                  
                                  <br />
                                  7.2.2 A Opticanet prestará serviço de suporte técnico, via e-mail, Skype e telefone para esclarecer dúvidas sobre a utilização da MelhorOferta.net e para registrar possíveis falhas,
                                  providenciando a devida correção das mesmas.  </p>
                                <p>8) PRAZO  </p>
                                <p>8.1 O presente contrato é celebrado por prazo indeterminado, podendo ser
                                  denunciado por qualquer uma das partes, mediante notificação por escrito,
                                  encaminhada à outra parte via e-mail, com prazo mínimo de sete dias.
                                  
                                  <br />
                                  8.2 A rescisão do contrato não exime as partes da quitação de suas dívidas.  </p>
                                <p>9) TRANSFERÊNCIA  </p>
                                <p>9.1 Nenhuma das partes poderá, por qualquer modo, transferir os direitos e
                                  deveres provenientes deste contrato a terceiros, salvo se houver a expressa
                                  anuência da outra parte.  </p>
                                <p>10) EXTINÇÃO DO CONTRATO  </p>
                                <p>10.1 O descumprimento de quaisquer obrigações assumidas no presente contrato,
                                  por caso fortuito ou força maior, nos termos do Código Civil, não constitui causa
                                  de resolução contratual.  </p>
                                <p>11) LEI APLICÁVEL  </p>
                                <p>11.1 O presente contrato, no caso de lacuna ou conflito com a legislação, será
                                  regido por: <br />
                                  a) Lei nº. 9.609, de 19 de fevereiro de 1998, nas questões referentes à
                                  proteção de propriedade intelectual de programa de computador e sua
                                  comercialização no Brasil; <br />
                                  b) Lei nº. 9.610, de 19 de fevereiro de 1998, para base
                                  de dados, obras literárias, artísticas e científicas, e sua aplicação supletiva aos
                                  direitos autorais referente ao software; <br />
                                  c) Lei nº. 9.279, de 14 de maio de 1996,
                                  para direitos de propriedade industrial sobre invenção e modelo de utilidade,
                                  desenho industrial, marcas, indicações geográficas e concorrência desleal; <br />
                                  d) Lei
                                  nº. 11.484, de 31 de maio de 2007, para equipamento de TV digital, de
                                  componentes eletrônicos semicondutores e propriedade intelectual das topografias
                                  de circuitos integrados; <br />
                                  e) Código Civil, Lei nº. 10.406, de 10 de janeiro de 2002,
                                  para as questões referentes às pessoas, aos bens, aos fatos jurídicos, às
                                  obrigações, à empresa e à propriedade em sentido geral; <br />
                                  f) nas questões
                                  referentes à confidencialidade, a Lei nº. 9.279/1996, artigo 195, e o Decreto nº.
                                  1.355, de 30 de dezembro de 1994, que promulgou a Ata Final que Incorpora os
                                  Resultados da Rodada Uruguai de Negociações Comerciais Multilaterais do
                                  GATT, Anexo 1C, denominado Acordo sobre Aspectos do Direitos de Propriedade
                                  Intelectual Relacionados ao Comércio (sigla TRIPS), artigo 39.  </p>
                                <p>12) ALTERAÇÕES CONTRATUAIS  </p>
                                <p>12.1 A MelhorOferta.net se reserva o direito de alterar quaisquer condições do Contrato,
                                  devendo para tanto informar o USUÁRIO no Site ou por e-mail qualquer outra forma
                                  efetiva de transmissão da informação. Caso o USUÁRIO não concorde com as
                                  alterações promovidas pela MelhorOferta.net , deverá manifestar-se, expressamente, no prazomáximo de 30 (trinta) dias a contar da data da comunicação realizada pela MelhorOferta.net.  <br />
                                  12.2 ATENÇÃO: O SILÊNCIO DO USUÁRIO NO PRAZO ORA ESTIPULADO
                                  SERÁ ENTENDIDO COMO ACEITAÇÃO AOS NOVOS TERMOS E CONDIÇÕES
                                  CONTRATUAIS.
                                  
                                  <br />
                                  12.3 ATENÇÃO: O USO CONTÍNUO DOS SERVIÇOS TAMBÉM SERÁ
                                  CONSIDERADO COMO ACEITAÇÃO AOS NOVOS TERMOS E CONDIÇÕES
                                  CONTRATUAIS.
                                  
                                  <br />
                                  12.4 O USUÁRIO declara expressamente estar ciente de que a não aceitação dos
                                  novos termos do Contrato facultará à MelhorOferta.net a rescisão imediata do presente
                                  Contrato, com a suspensão dos SERVIÇOS ao USUÁRIO.
                                  
                                  <br />
                                  12.5 Em caso de anulabilidade de uma ou mais cláusulas ou disposições do
                                  presente contrato, as demais não serão afetadas e permanecerão vigentes.  </p>
                                <p>13) DA SOLUÇÃO DE CONTROVÉRSIAS POR ARBITRAGEM  </p>
                                <p>13.1 As partes acordam expressamente que qualquer controvérsia decorrente do
                                  presente contrato ou de seus aditivos posteriores será definitivamente resolvida
                                  por arbitragem, de conformidade com a Lei nº. 9.307, de 23 de setembro de 1996,
                                  e pelos regulamentos e normas da Corte Catarinense de Mediação e Arbitragem,
                                  por um ou mais árbitros nomeados em conformidade com tal Regulamento. As
                                  partes ainda se comprometem a manter e exigir sigilo do(s) árbitro(s) e demais
                                  colaboradores da referida Instituição sobre quaisquer informações referentes aos
                                  elementos da controvérsia submetida à arbitragem.
                                  São Paulo, 30 de outubro de 2009.</p>
  </td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
               </td>
               <td width="239" align="center" valign="top"><!--#include file="includes/tags.asp"-->
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
