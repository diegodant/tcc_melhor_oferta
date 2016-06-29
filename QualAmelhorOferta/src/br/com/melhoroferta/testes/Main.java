/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.testes;

import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Empresassolicitacoes;
import br.com.melhoroferta.entidades.Solicitacoes;
import br.com.melhoroferta.persistencia.Generico;
import br.com.melhoroferta.persistencia.SolicitacaoDAO;
import br.com.melhoroferta.persistencia.SolicitacaosubcategoriasDAO;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Diego
 */
public class Main {

public static void main(String[] args) {
    try{
/*    Generico g = new Generico();
    ResultSet rs = g.maisPedidas();
    while(rs.next()){
        System.out.println(rs.getString("nome"));
    }
    rs.close();
  */
                 SolicitacaosubcategoriasDAO sub = new SolicitacaosubcategoriasDAO();
                 List<Categorias> a =  sub.listarTagsCategorias();
                 for(Categorias c : a){
                     System.out.println(c.getNcategoria()+" - "+c.getNome());
                 }
                        
                /*
                 * Solicitacoes s = new Solicitacoes();
                SolicitacaoDAO sd = new SolicitacaoDAO();
                Empresassolicitacoes es = new Empresassolicitacoes();
                
                s.setNusuario(2);
                s.setNcategoria(3);
                s.setNsubCategoria(4);
                
                s.setProduto("Coca-Cola");
                s.setPrazo(null);
                s.setDescricao("Coca-Cola 2,5 Litros");
                s.setStatus(1);
                s.setNempresaVencedora(15);
                s.setDataFinalizacao(null);
                s.setContador(8);
                s.setUa(null);
                
                es.setUa(null);
                
                sd.CadastrarSolicitacaoDao(s,es);
        */
    }catch(Exception e){
        System.out.println("Erro: "+e.getMessage());
    }
}
    
    
}
