/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.melhoroferta.persistencia;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import br.com.melhoroferta.entidades.Empresa;
import br.com.melhoroferta.entidades.MelhorOferta;
import br.com.melhoroferta.entidades.Transacao;
import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.utilidades.UtilXml;




/**
 *
 * @author bruno
 */
public class PagMoip extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private String tokenrec;
    private String resp;
    private String resposta;
    private String respXML;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession sessao = request.getSession();
            Usuario u = new Usuario();
            Transacao trans = new Transacao();
            TransacaoDAO tdao = new TransacaoDAO();
            Empresa emp = new Empresa();
            MelhorOferta mo = new MelhorOferta();

            u = (Usuario) sessao.getAttribute("usuario");

            mo.setToken("OZABLVRAASHZIHE7ACD7XSVCZQYWMAL1");
            mo.setKey("AHOXGEE2SFPPXSBU3K4AVPCYQTVPLZXCPGGGJ0Q4");

            Integer codtran = tdao.trazTransDisponivel();
            Double valtran = Double.parseDouble(request.getParameter("paNPlano"));

            trans.setIdtransacao(codtran);
            trans.setValor(valtran);

            UtilXml xml = new UtilXml();

            // Criar o cliente HTTP
            HttpClient client = new HttpClient();

            // Cria o metodo POST para enviar XML ao MoIP
            PostMethod post = new PostMethod("https://desenvolvedor.moip.com.br/sandbox/ws/alpha/EnviarInstrucao/Unica");

            //url = new URL("https://sitenet05.serasa.com.br/SolucaoSintegra/SS20ws.asmx?wsdl");
            //SS20WS servico = new SS20WS(url, SS20WS_QNAME);
            //SS20WSSoap soap = servico.getSS20WSSoap();
            // Criar requisicao autenticada
            String ctoken = mo.getToken();
            String ckey = mo.getKey();

            String authHeader = ctoken + ":" + ckey;
            String encoded = String.valueOf(org.apache.axis.encoding.Base64.encode(authHeader.getBytes()));
            post.setRequestHeader("Authorization", " Basic " + encoded);
            post.setDoAuthentication( true );

            String body = xml.MontaXML(trans, emp);

            RequestEntity requestEntity = new StringRequestEntity(body,"application/x-www-formurlencoded","UTF-8");
            post.setRequestEntity(requestEntity);

            try {
              // executa o POST
              int status = client.executeMethod( post );

              // print the status and response
              System.out.println(status + "\n" + post.getResponseBodyAsString());

              resp = post.getResponseBodyAsString();

              DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
              DocumentBuilder db;
              db = dbf.newDocumentBuilder();
              ByteArrayInputStream is = new ByteArrayInputStream(resp.getBytes("UTF-8"));
              Document strXML = db.parse(is);

              Element elem = strXML.getDocumentElement();

              NodeList XMLErro = strXML.getElementsByTagName("ERRO");
              respXML = xml.VerXML(XMLErro);

              NodeList list = elem.getElementsByTagName("Resposta");

              for (int j = 0; j < list.getLength(); j++) {

                  Element tag = (Element) list.item(j);
                  resposta = xml.getChild(tag, "Status");
                  tokenrec = xml.getChild(tag, "Token");


              }

              if (resposta.equalsIgnoreCase("FALHA")) {
                      HttpSession mySession = request.getSession();
                      mySession.setAttribute("erro", respXML);
                      return;
              } else {
                      response.sendRedirect("https://desenvolvedor.moip.com.br/sandbox/Instrucao.do?token="+tokenrec);
              }


             // TODO: inicio

             // https://desenvolvedor.moip.com.br/sandbox/Instrucao.do?token=TOKEN_RETORNADO
            // aqui voce deve tartar a resposta, pegar o token da instrucao e apresentar para o
            //seu cliente para que ele realize o pagamento
            // TODO: fim

            } finally {
                // release any connection resources used by the method
               post.releaseConnection();
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
            HttpSession mySession = request.getSession();
            mySession.setAttribute("erro", "Problemas ao acessar o servidor do Moip. Tente novamente.<br>" + e.getMessage());
        } finally {
            out.close();

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PagMoip.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PagMoip.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
