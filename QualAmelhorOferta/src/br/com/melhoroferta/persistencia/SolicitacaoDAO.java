/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.Empresassolicitacoes;
import br.com.melhoroferta.entidades.Solicitacoes;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego
 */
public class SolicitacaoDAO extends DAO {
    
      public void CadastrarSolicitacaoDao(Solicitacoes so , Empresassolicitacoes es){
        try {
            openDataBase();

            pstmt = con.prepareStatement("insert into solicitacoes (NUsuario,NCategoria,NSubCategoria,Produto,Prazo,Descricao,Status,NEmpresaVencedora,DataFinalizacao,Contador,UA)values(?,?,?,?,?,?,?,?,?,?,?)");
            
            pstmt.setInt(1, so.getNusuario().getNusuario());
            pstmt.setInt(2, so.getNcategoria().getNcategoria());
            pstmt.setInt(3, so.getNsubCategoria().getNsubcategoria());
            pstmt.setString(4, so.getProduto());
            pstmt.setDate(5, so.getPrazo());
            pstmt.setString(6, so.getDescricao());
            pstmt.setInt(7, so.getStatus());
            pstmt.setInt(8, so.getNempresaVencedora().getNempresa());
            pstmt.setDate(9, so.getDataFinalizacao());
            pstmt.setInt(10, so.getContador());
            pstmt.setDate(11, so.getUa());
            pstmt.execute();
            
            pstmt = con.prepareStatement("insert into empresassolicitacoes(Nempresa,nsolicitacao,UA)values("+so.getNempresaVencedora()+",LAST_INSERT_ID( ) ,?) ");
          //  pstmt.setInt(1, so.getNsolicitacao());
            pstmt.setDate(1, es.getUa());
            pstmt.execute();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
      }
      
          public void listarSolicitacoes(){
          try{
              openDataBase();
               pstmt = con.prepareStatement("select * from solicitacoes ");
               List<Solicitacoes> resp = new ArrayList<Solicitacoes>();
               rs = pstmt.executeQuery();
               
               while(rs.next()){
                   Solicitacoes so = new Solicitacoes();
                          so.getNusuario().setNusuario(rs.getInt("nusuario"));
                          so.getNcategoria().setNcategoria(rs.getInt("ncategoria"));
                          so.getNsubCategoria().setNsubcategoria( rs.getInt("nsubcategoria"));                
                          so.setProduto(rs.getString("produto"));
                          so.setPrazo(rs.getDate("prazo"));
                          so.setDescricao(rs.getString("descricao"));
                          so.setStatus(rs.getInt("status"));
                          so.getNempresaVencedora().setNempresa(rs.getInt("nempresavencedora"));
                          so.setDataFinalizacao(rs.getDate("datafinalizacao"));
                          so.setContador(rs.getInt("contador"));
                          so.setUa(rs.getDate("ua"));
                    
                   resp.add(so);
               }
                       pstmt.close();
                      // return resp;
          }catch(Exception e){
              System.out.println(e.getMessage());
          }finally{
              closeDataBase();
          }
      }
        public void listarSolicitacoesByCod(Integer cod){
          try{
              openDataBase();
               pstmt = con.prepareStatement("select * from solicitacoes where nsolicitacao = ? ");
               pstmt.setInt(1, cod);
               rs = pstmt.executeQuery();
               
                    Solicitacoes so = null;
                    
                    if(rs.next()){
                          so = new Solicitacoes();
                          so.getNusuario().setNusuario(rs.getInt("nusuario"));
                          so.getNcategoria().setNcategoria(rs.getInt("ncategoria"));
                          so.getNsubCategoria().setNsubcategoria( rs.getInt("nsubcategoria"));                
                          so.setProduto(rs.getString("produto"));
                          so.setPrazo(rs.getDate("prazo"));
                          so.setDescricao(rs.getString("descricao"));
                          so.setStatus(rs.getInt("status"));
                          so.getNempresaVencedora().setNempresa(rs.getInt("nempresavencedora"));
                          so.setDataFinalizacao(rs.getDate("datafinalizacao"));
                          so.setContador(rs.getInt("contador"));
                          so.setUa(rs.getDate("ua"));

                  }
                    pstmt.close();
     //              return so;
              
         }catch(Exception e){
              System.out.println(e.getMessage());
         }finally{
             closeDataBase();
        }
      
        } 
        
        public void updateSolitacoes(Solicitacoes so, Empresassolicitacoes es){
            try {
                openDataBase();
                pstmt = con.prepareStatement("update solicitacoes set NUsuario=?,NCategoria=?,NSubCategoria=?,"
                        + "Produto=?,Prazo=?,Descricao=?,Status=?,NEmpresaVencedora=?,DataFinalizacao=?,Contador=?,UA "
                        + "where nsolicitacao =?");
                
                pstmt.setInt(1, so.getNusuario().getNusuario());
                pstmt.setInt(2, so.getNcategoria().getNcategoria());
                pstmt.setInt(3, so.getNsubCategoria().getNsubcategoria());
                pstmt.setString(4, so.getProduto());
                pstmt.setDate(5, so.getPrazo());
                pstmt.setString(6, so.getDescricao());
                pstmt.setInt(7, so.getStatus());
                pstmt.setInt(8, so.getNempresaVencedora().getNempresa());
                pstmt.setDate(9, so.getDataFinalizacao());
                pstmt.setInt(10, so.getContador());
                pstmt.setDate(11, so.getUa());
                pstmt.setInt(12, so.getNsolicitacao());
                pstmt.execute();

                pstmt = con.prepareStatement("update empresassolicitacoes set Nempresa="+so.getNempresaVencedora()+",UA=? where nsolicitacao =? ");
                pstmt.setDate(1, es.getUa());
                pstmt.setInt(2, es.getId().getNsolicitacao());
                pstmt.execute();
                pstmt.close();
                
            } catch (Exception e) {
                e.getMessage();
            }finally{
                closeDataBase();
            }
            
        }
        
        public void deletarSolicitacao(Integer cod){
            try {
                openDataBase();
                pstmt = con.prepareStatement("delete from solitacoes where nsolicitacao =?");
                pstmt.setInt(1, cod);
                pstmt.execute();
                
                pstmt = con.prepareStatement("delete from empresassolicitacoes where nsolicitacao =?");
                pstmt.setInt(1, cod);
                pstmt.execute();
                
            } catch (Exception e) {
                e.getMessage();
            }finally{
                closeDataBase();
            }
            
        }

}
