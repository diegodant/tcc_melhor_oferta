package br.com.melhoroferta.entidades;
// Generated 17/02/2012 16:15:24 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Assinaturas generated by hbm2java
 */
public class Assinaturas  implements java.io.Serializable {


     private Integer nassinatura;
     private Empresas nempresa;
     private Planos nplano;
     private String idTransacao;
     private Date data;
     private Double valorTotal;
     private Date dataPagamento;
     private Date dataValidade;
     private Integer negociacoes;
     private String formaPagamento;
     private Integer nparcelas;
     private String historico;
     private String dadosAdicionais;
     private Integer status;
     private Date ua;

    public Assinaturas() {
    }

	
    public Assinaturas(String idTransacao) {
        this.idTransacao = idTransacao;
    }
    public Assinaturas(Empresas nempresa, Planos nplano, String idTransacao, Date data, Double valorTotal, Date dataPagamento, Date dataValidade, Integer negociacoes, String formaPagamento, Integer nparcelas, String historico, String dadosAdicionais, Integer status, Date ua) {
       this.nempresa = nempresa;
       this.nplano = nplano;
       this.idTransacao = idTransacao;
       this.data = data;
       this.valorTotal = valorTotal;
       this.dataPagamento = dataPagamento;
       this.dataValidade = dataValidade;
       this.negociacoes = negociacoes;
       this.formaPagamento = formaPagamento;
       this.nparcelas = nparcelas;
       this.historico = historico;
       this.dadosAdicionais = dadosAdicionais;
       this.status = status;
       this.ua = ua;
    }
   
    public Integer getNassinatura() {
        return this.nassinatura;
    }
    
    public void setNassinatura(Integer nassinatura) {
        this.nassinatura = nassinatura;
    }
    public Empresas getNempresa() {
        return this.nempresa;
    }
    
    public void setNempresa(Empresas nempresa) {
        this.nempresa = nempresa;
    }
    public Planos getNplano() {
        return this.nplano;
    }
    
    public void setNplano(Planos nplano) {
        this.nplano = nplano;
    }
    public String getIdTransacao() {
        return this.idTransacao;
    }
    
    public void setIdTransacao(String idTransacao) {
        this.idTransacao = idTransacao;
    }
    public Date getData() {
        return this.data;
    }
    
    public void setData(Date data) {
        this.data = data;
    }
    public Double getValorTotal() {
        return this.valorTotal;
    }
    
    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }
    public Date getDataPagamento() {
        return this.dataPagamento;
    }
    
    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }
    public Date getDataValidade() {
        return this.dataValidade;
    }
    
    public void setDataValidade(Date dataValidade) {
        this.dataValidade = dataValidade;
    }
    public Integer getNegociacoes() {
        return this.negociacoes;
    }
    
    public void setNegociacoes(Integer negociacoes) {
        this.negociacoes = negociacoes;
    }
    public String getFormaPagamento() {
        return this.formaPagamento;
    }
    
    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }
    public Integer getNparcelas() {
        return this.nparcelas;
    }
    
    public void setNparcelas(Integer nparcelas) {
        this.nparcelas = nparcelas;
    }
    public String getHistorico() {
        return this.historico;
    }
    
    public void setHistorico(String historico) {
        this.historico = historico;
    }
    public String getDadosAdicionais() {
        return this.dadosAdicionais;
    }
    
    public void setDadosAdicionais(String dadosAdicionais) {
        this.dadosAdicionais = dadosAdicionais;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Date getUa() {
        return this.ua;
    }
    
    public void setUa(Date ua) {
        this.ua = ua;
    }




}


