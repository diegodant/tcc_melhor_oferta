/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Vendedor;
import br.com.melhoroferta.entidades.Vendedorcategorias;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego
 */
public class CategoriasDAO extends DAO{
    public void CadastrarCategoriasDao(Categorias categoria)throws Exception{
        try {
            openDataBase();

            pstmt = con.prepareStatement("insert into categorias (nome,ativa,dataCriacao,nArea,"
                    + ")values(?,?,NOW(),?)");
            
            pstmt.setString(1, categoria.getNome());
            pstmt.setInt(2, categoria.getAtiva());
            pstmt.setInt(3, 1);       
            
            pstmt.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
      }
    
     public List<Categorias>listarCategoriasAll() throws Exception{
          List <Categorias> resp = new ArrayList<Categorias>();
          openDataBase();
          
          pstmt=con.prepareStatement("select * from categorias where ativa=1");
          rs=pstmt.executeQuery();
          
          while(rs.next()){
              Categorias c = new Categorias();
             
              c.setNcategoria(rs.getInt("ncategoria"));
              c.setNome(rs.getString("nome"));
              
              resp.add(c);
          }
          rs.close();
          pstmt.close();
          
          return resp;
      }
     
      public List<Categorias>listarCategoriasByCategoria(int codCategoria) throws Exception{
          List <Categorias> resp = new ArrayList<Categorias>();
          openDataBase();
          
          pstmt=con.prepareStatement("select * from categorias where ativa=1 and ncategoria = ? ");
          pstmt.setInt(1, codCategoria);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              Categorias c = new Categorias();
              
              c.setNcategoria(rs.getInt("ncategoria"));
              c.setNome(rs.getString("nome"));
              
              resp.add(c);
          }
          rs.close();
          pstmt.close();
          
          return resp;
      }
      
      public List<Categorias>listarCategoriasByVendedor(int codVendedor) throws Exception{
          List <Categorias> resp = new ArrayList<Categorias>();
          
          Vendedor vendedor = new Vendedor();
          vendedor.setNvendedor(codVendedor);
          
          openDataBase();
          
          pstmt=con.prepareStatement("select c.ncategoria , c.nome , "
                  + " (case when vc.nvendedor is null then '0' else '1' end) nvendedor "
                  + "from categorias c left join vendedorcategorias vc "
                  + " on vc.ncategoria = c.ncategoria "
                  + " and vc.nvendedor = ? "
                  + " where ativa=1 ");
 
          pstmt.setInt(1, codVendedor);
          rs = pstmt.executeQuery();
          
          while(rs.next()){
              Categorias c = new Categorias();
              
              if(rs.getString("nvendedor").equalsIgnoreCase("1"))
              {
                  Vendedorcategorias vendedorcat = new Vendedorcategorias();
                  vendedorcat.setVendedor(vendedor);
                  c.setVendedorcategoriases(vendedorcat);
                  
              }
              
              c.setNcategoria(rs.getInt("ncategoria"));
              c.setNome(rs.getString("nome"));
              
              resp.add(c);
          }
          rs.close();
          pstmt.close();
          
          return resp;
      }
}
