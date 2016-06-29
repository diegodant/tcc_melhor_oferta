package br.com.melhoroferta.entidades;
// Generated 17/02/2012 16:15:24 by Hibernate Tools 3.2.1.GA



/**
 * EmpresassolicitacoesId generated by hbm2java
 */
public class EmpresassolicitacoesId  implements java.io.Serializable {


     private int nempresa;
     private int nsolicitacao;

    public EmpresassolicitacoesId() {
    }

    public EmpresassolicitacoesId(int nempresa, int nsolicitacao) {
       this.nempresa = nempresa;
       this.nsolicitacao = nsolicitacao;
    }
   
    public int getNempresa() {
        return this.nempresa;
    }
    
    public void setNempresa(int nempresa) {
        this.nempresa = nempresa;
    }
    public int getNsolicitacao() {
        return this.nsolicitacao;
    }
    
    public void setNsolicitacao(int nsolicitacao) {
        this.nsolicitacao = nsolicitacao;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof EmpresassolicitacoesId) ) return false;
		 EmpresassolicitacoesId castOther = ( EmpresassolicitacoesId ) other; 
         
		 return (this.getNempresa()==castOther.getNempresa())
 && (this.getNsolicitacao()==castOther.getNsolicitacao());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getNempresa();
         result = 37 * result + this.getNsolicitacao();
         return result;
   }   


}

