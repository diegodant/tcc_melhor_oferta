package br.com.melhoroferta.entidades;
// Generated 10/04/2012 17:04:44 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Solicitacao generated by hbm2java
 */
public class Solicitacao  implements java.io.Serializable {


     private Integer nsolicitacao;
     private Usuario usuario;
     private Integer prazo;
     private Subcategorias subcategoria;
     private String descricao;
     private Date dataCriacao;
     private String produto;
     private Integer status;
     private Integer nempresaEscolhida;
     private Date dataFinalizacao;
     private Set vendedorsolicitacaos = new HashSet(0);
     private Set avaliacaos = new HashSet(0);
     private Categorias categorias;
     private Integer ncategoria;
     private Integer nusuario;
     private Integer nsubcategoria;
     private String cidade;
     private String estado;

    public Solicitacao() {
    }

    public Solicitacao(String estado, String cidade, Integer nsubcategoria, Integer nusuario, Integer ncategoria, Categorias categorias, Usuario usuario, Subcategorias subcategoria, Date dataCriacao, String produto, Integer status, Integer nempresaEscolhida, Date dataFinalizacao, Set vendedorsolicitacaos, Set avaliacaos) {
       this.usuario = usuario;
       this.subcategoria = subcategoria;
       this.dataCriacao = dataCriacao;
       this.produto = produto;
       this.status = status;
       this.nempresaEscolhida = nempresaEscolhida;
       this.dataFinalizacao = dataFinalizacao;
       this.vendedorsolicitacaos = vendedorsolicitacaos;
       this.avaliacaos = avaliacaos;
       this.categorias = categorias;
       this.ncategoria = ncategoria;
       this.nusuario = nusuario;
       this.nsubcategoria = nsubcategoria;
       this.cidade = cidade;
       this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public Integer getNsubcategoria() {
        return nsubcategoria;
    }

    public void setNsubcategoria(Integer nsubcategoria) {
        this.nsubcategoria = nsubcategoria;
    }

    public Integer getNusuario() {
        return nusuario;
    }

    public void setNusuario(Integer nusuario) {
        this.nusuario = nusuario;
    }
    
    public Integer getNcategoria() {
        return ncategoria;
    }

    public void setNcategoria(Integer ncategoria) {
        this.ncategoria = ncategoria;
    }
    
    public Categorias getCategorias() {
        return categorias;
    }

    public void setCategorias(Categorias categorias) {
        this.categorias = categorias;
    }
    
       
    public Integer getNsolicitacao() {
        return this.nsolicitacao;
    }
    
    public void setNsolicitacao(Integer nsolicitacao) {
        this.nsolicitacao = nsolicitacao;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Subcategorias getSubcategoria() {
        return this.subcategoria;
    }
    
    public void setSubcategoria(Subcategorias subcategoria) {
        this.subcategoria = subcategoria;
    }
    public Date getDataCriacao() {
        return this.dataCriacao;
    }
    
    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
    public String getProduto() {
        return this.produto;
    }
    
    public void setProduto(String produto) {
        this.produto = produto;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Integer getNempresaEscolhida() {
        return this.nempresaEscolhida;
    }
    
    public void setNempresaEscolhida(Integer nempresaEscolhida) {
        this.nempresaEscolhida = nempresaEscolhida;
    }
    public Date getDataFinalizacao() {
        return this.dataFinalizacao;
    }
    
    public void setDataFinalizacao(Date dataFinalizacao) {
        this.dataFinalizacao = dataFinalizacao;
    }
    public Set getVendedorsolicitacaos() {
        return this.vendedorsolicitacaos;
    }
    
    public void setVendedorsolicitacaos(Set vendedorsolicitacaos) {
        this.vendedorsolicitacaos = vendedorsolicitacaos;
    }
    public Set getAvaliacaos() {
        return this.avaliacaos;
    }
    
    public void setAvaliacaos(Set avaliacaos) {
        this.avaliacaos = avaliacaos;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the prazo
     */
    public Integer getPrazo() {
        return prazo;
    }

    /**
     * @param prazo the prazo to set
     */
    public void setPrazo(Integer prazo) {
        this.prazo = prazo;
    }

}


