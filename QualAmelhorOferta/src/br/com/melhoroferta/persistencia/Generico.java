/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Subcategorias;


/**
 *
 * @author Marcio
 */
public class Generico extends DAO{
    
    
    public java.sql.ResultSet ultimaSolicitacoes(){
    
       try{
              openDataBase();
              pstmt = con.prepareStatement("SELECT NSolicitacao, u.login, Produto, Descricao, s.dataCriacao AS UASolicitacao " 
                      +" FROM solicitacao s INNER JOIN usuario u ON s.nusuario = u.nusuario "
                      +" WHERE Status= 0 ORDER BY s.dataCriacao DESC LIMIT 0,5");                                                                   
               rs = pstmt.executeQuery();
          }catch(Exception e){
                e.getMessage();
          
          }
        return rs;
    }
   
    public java.sql.ResultSet maisPedidas(){
        
           try{
              openDataBase();
              pstmt = con.prepareStatement("SELECT c.ncategoria, COUNT( DISTINCT NSolicitacao ) AS Total, "
                      + "c.Nome "
                      + "FROM categorias c, subcategorias sub INNER JOIN solicitacao s "
                      + "ON sub.nsubcategoria = s.nsubcategoria "
                      + "WHERE c.ncategoria = sub.ncategoria GROUP BY NCategoria ORDER BY Total DESC , Nome");                                                                   
               rs = pstmt.executeQuery();
          }catch(Exception e){
                e.getMessage();
          }
        return rs;
    } 

    public String consultarEndereco(String cep) {
        String retorno="";
         try{
              openDataBase();
              pstmt = con.prepareStatement("SELECT ds_bairro_nome , ds_logradouro_nome , ds_cidade_nome, "
                      + "ds_uf_sigla FROM logradouro l , cidades c , bairros b , uf u "
                      + "WHERE no_logradouro_cep = "+cep +" and c.cd_uf = u.cd_uf "
                      + "and c.cd_cidade = b.cd_cidade and b.cd_bairro = l.cd_bairro");
              rs = pstmt.executeQuery();
              if (rs.next()){
                  retorno += "#"+rs.getString("ds_logradouro_nome")+"#";
                  retorno += rs.getString("ds_cidade_nome")+"#";
                  retorno += rs.getString("ds_bairro_nome")+"#";
                  retorno += rs.getString("ds_uf_sigla");                                   
              }
          }catch(Exception e){
                e.getMessage();
          
          }finally{
             closeDataBase();
         }
        
        return retorno;
}
    
     public List<Categorias> listarTagsCategorias(){
        List<Categorias> resp = new ArrayList<Categorias>();  
        try{
              openDataBase();
              pstmt = con.prepareStatement("SELECT c.nome, COUNT( DISTINCT nsolicitacao ) "
                      + "AS total, c.ncategoria FROM categorias c, subcategorias sb, solicitacao s "
                      + "WHERE c.ncategoria = sb.ncategoria AND s.nsubcategoria = sb.nsubcategoria "
                      + "GROUP BY c.nome, c.ncategoria ORDER BY total DESC , c.nome LIMIT 10");
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
    
      public ResultSet consultarLogin(String login,String senha) throws Exception {
        rs = null;
        
        
         try{
              openDataBase();
           
             // pstmt = con.prepareStatement("select count(*) existe from usuario where login ='"+ login +"'");
              pstmt=con.prepareStatement("SELECT u.* , v.* , IF( v.nusuario IS NULL ,'N','S') vendedor "
                      + " FROM vendedor v RIGHT JOIN usuario u ON u.nusuario = v.nusuario "
                      + " where u.login = ? and u.senha = ? ");
              pstmt.setString(1, login);
              pstmt.setString(2,senha);
  
              rs = pstmt.executeQuery();
              rs.first();
             
              
          }catch(Exception e){
              rs = null;
                e.getMessage();
          
          }
        
        return rs;
}
      
      
      
      public ResultSet consultarAdmin(String senha) throws Exception {
        rs = null;
       
       
              openDataBase();
           
              pstmt=con.prepareStatement("select * from usuario where login ='admin' and senha=?");
              pstmt.setString(1,senha);
  
              rs = pstmt.executeQuery();
              rs.first();
             
        
        return rs;
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
      
      public List<Subcategorias>listaSubCategoriasByCodCategoria(Integer cod)throws Exception{
          Subcategorias su = null;
          List<Subcategorias>resp = new ArrayList<Subcategorias>();
          openDataBase();
          try {          
          pstmt= con.prepareStatement("select * from subcategorias where ncategoria=?");
          pstmt.setInt(1,cod);
          
          rs= pstmt.executeQuery();
          
          while(rs.next()){
              su= new Subcategorias();
              su.setNsubcategoria(rs.getInt("nsubcategoria"));
              su.setNome(rs.getString("nome"));              
              resp.add(su);
          }

          
          }catch(Exception e){
              e.getMessage();
          }finally{
              closeDataBase();
          }
          rs.close();
          pstmt.close();
          return resp;
      }
      
      
    
}



















