package br.com.melhoroferta.entidades;
// Generated 17/02/2012 16:15:24 by Hibernate Tools 3.2.1.GA


import java.sql.Date;

/**
 * Empresassolicitacoes generated by hbm2java
 */
public class Empresassolicitacoes  implements java.io.Serializable {


     private EmpresassolicitacoesId id;
     private Date ua;

    public Empresassolicitacoes() {
    }

	
    public Empresassolicitacoes(EmpresassolicitacoesId id) {
        this.id = id;
    }
    public Empresassolicitacoes(EmpresassolicitacoesId id, Date ua) {
       this.id = id;
       this.ua = ua;
    }
   
    public EmpresassolicitacoesId getId() {
        return this.id;
    }
    
    public void setId(EmpresassolicitacoesId id) {
        this.id = id;
    }
    public Date getUa() {
        return this.ua;
    }
    
    public void setUa(Date ua) {
        this.ua = ua;
    }




}

