/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.melhoroferta.entidades;

/**
 *
 * @author bruno
 */
public class Transacao {

    private Integer idtransacao;
    private Integer idvendedor;
    private String tokenmoip;
    private String emissao;
    private String datacredito;
    private Double valor;
    private Double taxavendedor;
    private Double taxamoip;
    private Double valorliquido;
    private Integer formapagamento;
    private Integer status;

    /**
     * @return the idtransacao
     */
    public Integer getIdtransacao() {
        return idtransacao;
    }

    /**
     * @param idtransacao the idtransacao to set
     */
    public void setIdtransacao(Integer idtransacao) {
        this.idtransacao = idtransacao;
    }

    /**
     * @return the idvendedor
     */
    public Integer getIdvendedor() {
        return idvendedor;
    }

    /**
     * @param idvendedor the idvendedor to set
     */
    public void setIdvendedor(Integer idvendedor) {
        this.idvendedor = idvendedor;
    }

    /**
     * @return the tokenmoip
     */
    public String getTokenmoip() {
        return tokenmoip;
    }

    /**
     * @param tokenmoip the tokenmoip to set
     */
    public void setTokenmoip(String tokenmoip) {
        this.tokenmoip = tokenmoip;
    }

    /**
     * @return the emissao
     */
    public String getEmissao() {
        return emissao;
    }

    /**
     * @param emissao the emissao to set
     */
    public void setEmissao(String emissao) {
        this.emissao = emissao;
    }

    /**
     * @return the datacredito
     */
    public String getDatacredito() {
        return datacredito;
    }

    /**
     * @param datacredito the datacredito to set
     */
    public void setDatacredito(String datacredito) {
        this.datacredito = datacredito;
    }

    /**
     * @return the valor
     */
    public Double getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(Double valor) {
        this.valor = valor;
    }

    /**
     * @return the taxavendedor
     */
    public Double getTaxavendedor() {
        return taxavendedor;
    }

    /**
     * @param taxavendedor the taxavendedor to set
     */
    public void setTaxavendedor(Double taxavendedor) {
        this.taxavendedor = taxavendedor;
    }

    /**
     * @return the taxamoip
     */
    public Double getTaxamoip() {
        return taxamoip;
    }

    /**
     * @param taxamoip the taxamoip to set
     */
    public void setTaxamoip(Double taxamoip) {
        this.taxamoip = taxamoip;
    }

    /**
     * @return the valorliquido
     */
    public Double getValorliquido() {
        return valorliquido;
    }

    /**
     * @param valorliquido the valorliquido to set
     */
    public void setValorliquido(Double valorliquido) {
        this.valorliquido = valorliquido;
    }

    /**
     * @return the formapagamento
     */
    public Integer getFormapagamento() {
        return formapagamento;
    }

    /**
     * @param formapagamento the formapagamento to set
     */
    public void setFormapagamento(Integer formapagamento) {
        this.formapagamento = formapagamento;
    }

    /**
     * @return the status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(Integer status) {
        this.status = status;
    }


    


}
