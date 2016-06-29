package br.com.melhoroferta.entidades;
// Generated 10/04/2012 17:04:44 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Bairros generated by hbm2java
 */
public class Bairros  implements java.io.Serializable {


     private int cdBairro;
     private Cidades cidades;
     private String dsBairroNome;
     private Set logradouroses = new HashSet(0);

    public Bairros() {
    }

	
    public Bairros(int cdBairro) {
        this.cdBairro = cdBairro;
    }
    public Bairros(int cdBairro, Cidades cidades, String dsBairroNome, Set logradouroses) {
       this.cdBairro = cdBairro;
       this.cidades = cidades;
       this.dsBairroNome = dsBairroNome;
       this.logradouroses = logradouroses;
    }
   
    public int getCdBairro() {
        return this.cdBairro;
    }
    
    public void setCdBairro(int cdBairro) {
        this.cdBairro = cdBairro;
    }
    public Cidades getCidades() {
        return this.cidades;
    }
    
    public void setCidades(Cidades cidades) {
        this.cidades = cidades;
    }
    public String getDsBairroNome() {
        return this.dsBairroNome;
    }
    
    public void setDsBairroNome(String dsBairroNome) {
        this.dsBairroNome = dsBairroNome;
    }
    public Set getLogradouroses() {
        return this.logradouroses;
    }
    
    public void setLogradouroses(Set logradouroses) {
        this.logradouroses = logradouroses;
    }




}


