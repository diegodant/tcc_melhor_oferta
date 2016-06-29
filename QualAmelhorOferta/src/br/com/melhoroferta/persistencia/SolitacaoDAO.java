/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Diego
 */

package br.com.melhoroferta.persistencia;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.melhoroferta.entidades.Proposta;
import br.com.melhoroferta.entidades.Solicitacao;
import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.entidades.Vendedor;
import br.com.melhoroferta.entidades.VendedorsolicitacaoId;


public class SolitacaoDAO extends DAO {
    
      public void CadastrarSolicitacaoDao(Solicitacao so)throws Exception{
        try {
            openDataBase();

            pstmt = con.prepareStatement("insert into solicitacao (produto,descricao,prazo,dataCriacao,nusuario,"
                    + "nsubcategoria,status)values(?,?,?,NOW(),?,?,0)");
            
            pstmt.setString(1, so.getProduto());
            pstmt.setString(2, so.getDescricao());
            pstmt.setInt(3, so.getPrazo());
            pstmt.setInt(4, so.getUsuario().getNusuario());       
            pstmt.setInt(5, so.getSubcategoria().getNsubcategoria());
  
            pstmt.execute();
            
          //  pstmt = con.prepareStatement("insert into empresassolicitacoes(Nempresa,nsolicitacao,UA)values("+so.getNempresaVencedora()+",LAST_INSERT_ID( ) ,?) ");
          //  pstmt.setInt(1, so.getNsolicitacao());
          //  pstmt.setDate(1, es.getUa());
          //  pstmt.execute();
          //  pstmt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
      }
      
          public List<Solicitacao> listarSolicitacoes(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

          List<Solicitacao> resp = new ArrayList<Solicitacao>();
          try{
               HttpSession sessao = request.getSession();
               Usuario u = (Usuario) sessao.getAttribute("usuario");
              
              openDataBase();
               pstmt = con.prepareStatement("SELECT * FROM "
                + "categorias c, subcategorias sc, solicitacao s, usuario u "
                + "WHERE "
                + "c.ncategoria = sc.ncategoria "
                + "AND "
                + "s.nsubcategoria = sc.nsubcategoria "
                + "AND "
                + "s.nusuario = u.nUsuario "
                + "AND "
                + "u.nusuario = ?");
               pstmt.setInt(1, u.getNusuario());
               rs = pstmt.executeQuery();
               
               while(rs.next()){
                   Solicitacao so = new Solicitacao();
                          so.setNusuario(rs.getInt("nusuario"));
                          so.setNcategoria(rs.getInt("ncategoria"));
                          so.setNsubcategoria(rs.getInt("nsubcategoria"));
                          so.setProduto(rs.getString("produto"));
                          so.setPrazo(rs.getInt("prazo"));
                          so.setDescricao(rs.getString("descricao"));
                          so.setStatus(rs.getInt("status"));
                          so.setNempresaEscolhida(rs.getInt("NempresaEscolhida"));
                          so.setDataFinalizacao(rs.getDate("datafinalizacao"));
                          so.setNsolicitacao(rs.getInt("nsolicitacao"));
                          so.setDataCriacao(rs.getDate("dataCriacao"));
//                          so.setContador(rs.getInt("contador"));
//                          so.setUa(rs.getDate("ua"));
                    
                   resp.add(so);
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
//        public void listarSolicitacoesByCod(Integer cod){
//          try{
//              openDataBase();
//               pstmt = con.prepareStatement("select * from solicitacoes where nsolicitacao = ? ");
//               pstmt.setInt(1, cod);
//               rs = pstmt.executeQuery();
//               
//                    Solicitacoes so = null;
//                    
//                    if(rs.next()){
//                          so = new Solicitacoes();
//                          so.getNusuario().setNusuario(rs.getInt("nusuario"));
//                          so.getNcategoria().setNcategoria(rs.getInt("ncategoria"));
//                          so.getNsubCategoria().setNsubCategoria( rs.getInt("nsubcategoria"));                
//                          so.setProduto(rs.getString("produto"));
//                          so.setPrazo(rs.getDate("prazo"));
//                          so.setDescricao(rs.getString("descricao"));
//                          so.setStatus(rs.getInt("status"));
//                          so.getNempresaVencedora().setNempresa(rs.getInt("nempresavencedora"));
//                          so.setDataFinalizacao(rs.getDate("datafinalizacao"));
//                          so.setContador(rs.getInt("contador"));
//                          so.setUa(rs.getDate("ua"));
//
//                  }
//                    pstmt.close();
//     //              return so;
//              
//         }catch(Exception e){
//              System.out.println(e.getMessage());
//         }finally{
//             closeDataBase();
//        }
//      
//        } 
//        
//        public void updateSolitacoes(Solicitacoes so, Empresassolicitacoes es){
//            try {
//                openDataBase();
//                pstmt = con.prepareStatement("update solicitacoes set NUsuario=?,NCategoria=?,NSubCategoria=?,"
//                        + "Produto=?,Prazo=?,Descricao=?,Status=?,NEmpresaVencedora=?,DataFinalizacao=?,Contador=?,UA "
//                        + "where nsolicitacao =?");
//                
//                pstmt.setInt(1, so.getNusuario().getNusuario());
//                pstmt.setInt(2, so.getNcategoria().getNcategoria());
//                pstmt.setInt(3, so.getNsubCategoria().getNsubCategoria());
//                pstmt.setString(4, so.getProduto());
//                pstmt.setDate(5, so.getPrazo());
//                pstmt.setString(6, so.getDescricao());
//                pstmt.setInt(7, so.getStatus());
//                pstmt.setInt(8, so.getNempresaVencedora().getNempresa());
//                pstmt.setDate(9, so.getDataFinalizacao());
//                pstmt.setInt(10, so.getContador());
//                pstmt.setDate(11, so.getUa());
//                pstmt.setInt(12, so.getNsolicitacao());
//                pstmt.execute();
//
//                pstmt = con.prepareStatement("update empresassolicitacoes set Nempresa="+so.getNempresaVencedora()+",UA=? where nsolicitacao =? ");
//                pstmt.setDate(1, es.getUa());
//                pstmt.setInt(2, es.getId().getNsolicitacao());
//                pstmt.execute();
//                pstmt.close();
//                
//            } catch (Exception e) {
//                e.getMessage();
//            }finally{
//                closeDataBase();
//            }
//            
//        }
// 
          
          
        public List<Solicitacao> buscarSolicitacoes(Solicitacao s)
          throws ServletException, IOException {
          List<Solicitacao> resp = new ArrayList<Solicitacao>();
          try{
              openDataBase();
               pstmt = con.prepareStatement("SELECT DISTINCT * FROM "
                    + "solicitacao s, categorias c, subcategorias sc, usuario u "
                    + "WHERE "
                    + "s.status = 0 "
                    + "AND "
                    + "c.ncategoria = sc.ncategoria "
                    + "AND "
                    + "s.nusuario = u.nusuario "
                    + "AND "
                    + "s.nsubcategoria = sc.nsubcategoria "
                    + "AND "
                    + "c.ncategoria = ? "
                    + "AND "
                    + "s.produto like ? "
                    + "AND "
                    + "sc.nsubcategoria = ? "
                    + "AND "
                    + "u.estado like ? ");

               pstmt.setInt(1, s.getNcategoria());
               pstmt.setString(2, s.getProduto());
               pstmt.setInt(3, s.getNsubcategoria());
               pstmt.setString(4, s.getEstado());
               rs = pstmt.executeQuery();
               
               while(rs.next()){
                          s.setNusuario(rs.getInt("nusuario"));
                          s.setNcategoria(rs.getInt("ncategoria"));
                          s.setNsubcategoria(rs.getInt("nsubcategoria"));
                          s.setProduto(rs.getString("produto"));
                          s.setPrazo(rs.getInt("prazo"));
                          s.setDescricao(rs.getString("descricao"));
                          s.setStatus(rs.getInt("status"));
                          s.setNempresaEscolhida(rs.getInt("NempresaEscolhida"));
                          s.setDataFinalizacao(rs.getDate("datafinalizacao"));
                          s.setNsolicitacao(rs.getInt("nsolicitacao"));
                          s.setDataCriacao(rs.getDate("dataCriacao"));
                    
                   resp.add(s);
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
        
        
      public Proposta exibeSolicitacao(int nSolicitacao ){

          Proposta p = null;
          try{
               //HttpSession sessao = request.getSession();
              //Solicitacao s = (Solicitacao) sessao.getAttribute("solicitacao");
                     
              openDataBase();
               pstmt = con.prepareStatement("SELECT s.*,v.*,cliente.*, p.*, cv.nome vnome , cv.telefone vtelefone, "
                       + " cv.email vemail , cv.bairro vbairro , cv.cep vcep , cv.numero vnumero , "
                       + " cv.rua vrua , cv.cidade vcidade , cv.estado vestado "
                       + " FROM "
                + "usuario cliente , usuario cv , solicitacao s left join  vendedorsolicitacao p "
                + " on p.nsolicitacao = s.nsolicitacao "
                + " left join vendedor v "
                + " on p.nvendedor = v.nvendedor "
                + "WHERE "
                + " v.nusuario = cv.nusuario "
                + "AND "
                + " s.nusuario = cliente.nusuario "
                + "AND "       
                + "s.nsolicitacao = ?");
               pstmt.setInt(1, nSolicitacao);
               rs = pstmt.executeQuery();
               while(rs.next()){
                   p =  new Proposta(new Solicitacao(), new Vendedor(), new VendedorsolicitacaoId(), new Usuario());
                                      
                          p.setDataInteracao(rs.getDate("dataInteracao"));
                         // v.setNvendedor(rs.getInt("nvendedor"));
                          
                          
                          p.getId().setNproposta(rs.getInt("nproposta"));
                          p.setMelhoroferta(rs.getInt("melhoroferta"));
                          p.setObservacao(rs.getString("observacao"));
                          p.setPrazoEntrega(rs.getDate("prazo_entrega"));
                          p.setValor(rs.getString("valor"));
                          
                          p.getVendedor().setNegativacoes(rs.getInt("negativacoes"));
                          p.getVendedor().setPositivacoes(rs.getInt("positivacoes"));
                          p.getVendedor().setNvendedor(rs.getInt("nvendedor"));
                          
                          Usuario vend = new Usuario();
                          vend.setTelefone(rs.getString("vtelefone"));
                          vend.setNome(rs.getString("vnome"));
                          vend.setEmail(rs.getString("vemail"));
                          vend.setCidade(rs.getString("vcidade"));
                          vend.setCep(rs.getString("vcep"));
                          vend.setBairro(rs.getString("vbairro"));
                          vend.setRua(rs.getString("vrua"));
                          vend.setNumero(rs.getString("vnumero"));
                          vend.setEstado(rs.getString("vestado"));
                          
                          p.getVendedor().setUsuario(vend);
                          
                          p.getSolicitacao().setNsolicitacao(rs.getInt("nsolicitacao"));
                          p.getSolicitacao().setNusuario(rs.getInt("nusuario"));
                          p.getSolicitacao().setNsubcategoria(rs.getInt("nsubcategoria"));
                          p.getSolicitacao().setProduto(rs.getString("produto"));
                          p.getSolicitacao().setDescricao(rs.getString("descricao"));
                          p.getSolicitacao().setNusuario(rs.getInt("nusuario"));
                          p.getSolicitacao().setNsubcategoria(rs.getInt("nsubcategoria"));
                          p.getSolicitacao().setStatus(rs.getInt("status"));
                          p.getSolicitacao().setNempresaEscolhida(rs.getInt("NempresaEscolhida"));
                          p.getSolicitacao().setDataFinalizacao(rs.getDate("datafinalizacao"));
                          p.getSolicitacao().setNsolicitacao(rs.getInt("nsolicitacao"));
                          p.getSolicitacao().setDataCriacao(rs.getDate("dataCriacao"));

                          p.getUsuario().setNome(rs.getString("nome"));
                          p.getUsuario().setFantasia(rs.getString("fantasia"));
                          p.getUsuario().setRazao(rs.getString("razao"));
                          p.getUsuario().setResponsavel(rs.getString("responsavel"));
                          
               }
  
                    rs.close();
                    pstmt.close();
          }catch(Exception e){
                    System.out.println(e.getMessage());
                }finally{
                    closeDataBase();
                }
          
          return p;
        }
        
        
      
      public void exibeSolicitacao(Solicitacao s ){

          Proposta p = null;
          try{
               //HttpSession sessao = request.getSession();
              //Solicitacao s = (Solicitacao) sessao.getAttribute("solicitacao");
                     
              openDataBase();
               pstmt = con.prepareStatement("SELECT * FROM "
                + "vendedor v, solicitacao s, usuario u, vendedorsolicitacao p "
                + "WHERE "
                + "p.nvendedor = v.nvendedor "
                + "AND "
                + "p.nsolicitacao = s.nsolicitacao "
                + "AND "
                + "s.nusuario = u.nUsuario "
                + "AND "
                + "s.nsolicitacao = ?");
               pstmt.setInt(1, s.getNsolicitacao());
               rs = pstmt.executeQuery();
               
                   p =  new Proposta(new Solicitacao(), new Vendedor(), new VendedorsolicitacaoId(), new Usuario());
                                      
                          p.setDataInteracao(rs.getDate("dataInteracao"));
                         // v.setNvendedor(rs.getInt("nvendedor"));
                          p.getVendedor().setNvendedor(rs.getInt("nvendedor"));
                          
                          p.getId().setNproposta(rs.getInt("nproposta"));
                          p.getSolicitacao().setNsolicitacao(rs.getInt("nsolicitacao"));
                          p.setMelhoroferta(rs.getInt("melhoroferta"));
                          p.setObservacao(rs.getString("observacao"));
                          p.setPrazoEntrega(rs.getDate("prazo_entrega"));
                          p.setValor(rs.getString("valor"));
                          p.getVendedor().setNegativacoes(rs.getInt("negativacoes"));
                          p.getVendedor().setPositivacoes(rs.getInt("positivacoes"));
                          p.getUsuario().setNome(rs.getString("nome"));
                          p.getUsuario().setFantasia(rs.getString("fantasia"));
                          p.getUsuario().setRazao(rs.getString("razao"));
                          p.getUsuario().setResponsavel(rs.getString("responsavel"));
                          p.getSolicitacao().setNusuario(rs.getInt("nusuario"));
//                        p.getSolicitacao().setNcategoria(rs.getInt("ncategoria"));
                          p.getSolicitacao().setNsubcategoria(rs.getInt("nsubcategoria"));
                          p.getSolicitacao().setProduto(rs.getString("produto"));
                          p.getSolicitacao().setPrazo(rs.getInt("prazo"));
                          p.getSolicitacao().setDescricao(rs.getString("descricao"));
                          p.getSolicitacao().setStatus(rs.getInt("status"));
                          p.getSolicitacao().setNempresaEscolhida(rs.getInt("NempresaEscolhida"));
                          p.getSolicitacao().setDataFinalizacao(rs.getDate("datafinalizacao"));
                          p.getSolicitacao().setNsolicitacao(rs.getInt("nsolicitacao"));
                          p.getSolicitacao().setDataCriacao(rs.getDate("dataCriacao"));
//                          so.setContador(rs.getInt("contador"));
//                          so.setUa(rs.getDate("ua"));
  
                    rs.close();
                    pstmt.close();
          }catch(Exception e){
                    System.out.println(e.getMessage());
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

     public boolean fecharSolicitacao(int nsolicitacao , int nproposta, int nempresa){
         
         boolean retorno = true;
         
        try {
            openDataBase();

            pstmt = con.prepareStatement("update solicitacao set status = ?, nEmpresaEscolhida = ?, dataFinalizacao = NOW() where nsolicitacao = ? ");
            
            pstmt.setInt(1, 2);
            pstmt.setInt(2, nempresa);
            pstmt.setInt(3, nsolicitacao);
            
  
            pstmt.execute();
            
            pstmt = con.prepareStatement("update vendedorsolicitacao set melhoroferta = ? where nsolicitacao = ? and nproposta = ?");
            
            pstmt.setInt(1, 1);
            pstmt.setInt(2, nsolicitacao);
            pstmt.setInt(3, nproposta);
  
            pstmt.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            retorno = false;
        }finally{
            closeDataBase();
        }
        
        return retorno;
      }
        
}
