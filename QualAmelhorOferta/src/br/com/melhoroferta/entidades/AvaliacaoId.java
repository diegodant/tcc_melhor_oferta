package br.com.melhoroferta.entidades;
// Generated 10/04/2012 17:04:44 by Hibernate Tools 3.2.1.GA



/**
 * AvaliacaoId generated by hbm2java
 */
public class AvaliacaoId  implements java.io.Serializable {


     private int navaliacao;
     private char avaliado;

    public AvaliacaoId() {
    }

    public AvaliacaoId(int navaliacao, char avaliado) {
       this.navaliacao = navaliacao;
       this.avaliado = avaliado;
    }
   
    public int getNavaliacao() {
        return this.navaliacao;
    }
    
    public void setNavaliacao(int navaliacao) {
        this.navaliacao = navaliacao;
    }
    public char getAvaliado() {
        return this.avaliado;
    }
    
    public void setAvaliado(char avaliado) {
        this.avaliado = avaliado;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof AvaliacaoId) ) return false;
		 AvaliacaoId castOther = ( AvaliacaoId ) other; 
         
		 return (this.getNavaliacao()==castOther.getNavaliacao())
 && (this.getAvaliado()==castOther.getAvaliado());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getNavaliacao();
         result = 37 * result + this.getAvaliado();
         return result;
   }   


}


