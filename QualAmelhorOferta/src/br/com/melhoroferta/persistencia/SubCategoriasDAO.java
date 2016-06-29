/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;


import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Subcategorias;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author marciocaldeira
 */
public class SubCategoriasDAO extends DAO{
    
   public List<Subcategorias>listarSubCategoriasAll() throws Exception{
          List <Subcategorias> resp = new ArrayList<Subcategorias>();
          openDataBase();
          
          pstmt=con.prepareStatement("select * from subcategorias where ativa=1");
          rs=pstmt.executeQuery();
          
          while(rs.next()){
              Subcategorias subcategoria = new Subcategorias();
             
              subcategoria.setNsubcategoria(rs.getInt("nsubcategoria"));
              subcategoria.setNome(rs.getString("nome"));
              
              Categorias categoria = new Categorias();
              categoria.setNcategoria(rs.getInt("ncategoria"));
              
              subcategoria.setCategorias(categoria);
                      
              
              resp.add(subcategoria);
          }
          rs.close();
          pstmt.close();
          
          return resp;
      }
     
      public List<Subcategorias>listarSubCategoriasByCod(int nsubcategoria) throws Exception{
          List <Subcategorias> resp = new ArrayList<Subcategorias>();
          openDataBase();
          
          pstmt=con.prepareStatement("select * from subcategorias where ativa=1 and nsubcategoria = ?");
          pstmt.setInt(1, nsubcategoria);
          
          rs=pstmt.executeQuery();
          
          while(rs.next()){
              Subcategorias subcategoria = new Subcategorias();
             
              subcategoria.setNsubcategoria(rs.getInt("nsubcategoria"));
              subcategoria.setNome(rs.getString("nome"));
              
              Categorias categoria = new Categorias();
              categoria.setNcategoria(rs.getInt("ncategoria"));
              
              subcategoria.setCategorias(categoria);
                      
              resp.add(subcategoria);
          }
          rs.close();
          pstmt.close();
          
          return resp;
      }
}
