/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import java.util.ArrayList;
import java.util.List;

import br.com.melhoroferta.entidades.Categorias;

/**
 *
 * @author Marcio
 */
public class SolicitacaosubcategoriasDAO extends DAO {
    
    
    public List<Categorias> listarTagsCategorias(){
        List<Categorias> resp = new ArrayList<Categorias>();  
        try{
              openDataBase();
              pstmt = con.prepareStatement("SELECT SSC.NCategoria, COUNT(DISTINCT NSolicitacao) AS Total, Nome "
                       + "FROM SolicitacaoSubCategorias SSC INNER JOIN Categorias C ON SSC.NCategoria = C.NCategoria "
                       + "GROUP BY NCategoria ORDER BY Total DESC, Nome LIMIT 10 ");
               rs = pstmt.executeQuery();
               while(rs.next()){
               
                    Categorias cat = new Categorias();
                    cat.setNome(rs.getString("nome"));
                    cat.setNcategoria(rs.getInt("NCategoria"));
                    resp.add(cat);
               }
               rs.close();
               pstmt.close();
          }catch(Exception e){
                System.out.println(e.getMessage());
          }finally{
              closeDataBase();
          }
          return resp;
    }
}
