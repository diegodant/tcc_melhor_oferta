/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.melhoroferta.utilidades;

/**
 *
 * @author bruno-sigo
 */

import br.com.melhoroferta.entidades.Transacao;
import br.com.melhoroferta.entidades.Empresa;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class UtilXml {

    /// private String senha = "ortodw";
    //private String login = "33036873";
    public String getChild(Element elem, String tag) {

        NodeList children = elem.getElementsByTagName(tag);
        if (children == null) {
            return "";
        }
        Element child = (Element) children.item(0);
        if (child == null) {
            return "";
        }
        if (child.getFirstChild() != null )
            return child.getFirstChild().getNodeValue();
        else
            return "";
    }

    public String VerXML(NodeList elem) {

        String resp = "";

        for (int i = 0; i < elem.getLength(); i++) {

            Node property = elem.item(i);
            NamedNodeMap namedNodeMap = property.getAttributes();

            resp += property.getFirstChild().getNodeValue() + "\n";
        }
        return resp;
    }

    public String MontaXML(Transacao log, Empresa emp) {

        String sxml = "";
        Transacao logon = log;


        Integer codtran = logon.getIdtransacao();
        Double nvalor = logon.getValor();

        sxml = "<EnviarInstrucao>" +
            "<InstrucaoUnica>" +
            "<Razao>razão do pagamento</Razao>" +
            "<IdProprio>"+codtran+"</IdProprio>" +
            "<Valores>" +
            "<Valor moeda=\"BRL\">"+String.valueOf(nvalor)+"</Valor>" +
            "</Valores>" +
            "<Pagador>" +
            " <Nome>Pagador de Teste</Nome>" +
            " <Email>pagador@exemplo.com.br</Email>" +
            " <Identidade>000.093.210-34</Identidade>" +
            " <EnderecoCobranca>" +
            " <Logradouro>Rua do Pagador</Logradouro>" +
            " <Numero>111</Numero>" +
            " <Complemento>apt 1201</Complemento>" +
            " <Bairro>Bairro do pagador</Bairro>" +
            " <Cidade>Cidade do pagador</Cidade>" +
            " <Estado>MA</Estado>" +
            " <Pais>BRA</Pais>" +
            " <CEP>20120-102</CEP>" +
            " <TelefoneFixo>(21)4444-1111</TelefoneFixo>" +
            " </EnderecoCobranca>" +
            "</Pagador>" +
            "</InstrucaoUnica>" +
            "</EnviarInstrucao>";

        return sxml;
    }
}