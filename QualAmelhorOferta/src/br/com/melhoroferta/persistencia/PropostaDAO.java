/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author marciocaldeira
 */
public class PropostaDAO extends DAO{
    
    public void CadastrarProposta(Proposta vendsolic) throws Exception{
        try{
            openDataBase();
            
            pstmt = con.prepareStatement("insert into vendedorsolicitacao (nvendedor,nsolicitacao,dataInteracao,valor,observacao,prazo_entrega)values(?,?,NOW(),?,?,?)");
            
            pstmt.setInt (1 , vendsolic.getVendedor().getNvendedor());
            pstmt.setInt (2 , vendsolic.getSolicitacao().getNsolicitacao());
            //pstmt.setDate(3 , vendsolic.getDataInteracao());
            pstmt.setString(3 , vendsolic.getValor());
            pstmt.setString(4, vendsolic.getObservacao());
            pstmt.setDate(5 , vendsolic.getPrazoEntrega());
            
            pstmt.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
    }
    
    public void CadastrarCompradorSolicitacao(Proposta vendsolic) throws Exception{
        try{
            openDataBase();
            
            pstmt = con.prepareStatement("insert into vendedorsolicitacao (nusuario,nsolicitacao,dataInteracao,valor,observacao,prazo_entrega)values(?,?,?,?,?,?)");
            
            pstmt.setInt (1 , vendsolic.getVendedor().getUsuario().getNusuario());
            pstmt.setInt (2 , vendsolic.getSolicitacao().getNsolicitacao());
            pstmt.setDate(3 , vendsolic.getDataInteracao());
            pstmt.setString(4 , vendsolic.getValor());
            pstmt.setString( 5, vendsolic.getObservacao());
            pstmt.setDate(6 , vendsolic.getPrazoEntrega());
            
            pstmt.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
    }
    
    
    
    public List<Proposta> listarProposta(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

          List<Proposta> resp = new ArrayList<Proposta>();
          try{
               HttpSession sessao = request.getSession();
               Solicitacao s = (Solicitacao) sessao.getAttribute("solicitacao");
                     
              openDataBase();
/*              
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
                
*/
               pstmt = con.prepareStatement("SELECT vs.datainteracao, vs.nproposta, vs.melhoroferta, vs.observacao, vs.prazo_entrega, vs.valor, v.negativacoes, v.positivacoes, v.nvendedor, s.nsolicitacao, s.produto, s.descricao, s.nusuario, s.nsubcategoria, s.status, s.nempresaescolhida, s.datafinalizacao, s.nsolicitacao, s.datafinalizacao, s.datacriacao, u.nome, u.fantasia, u.razao, u.responsavel"
                    +" FROM usuario u, solicitacao s"
                    +" LEFT JOIN vendedorsolicitacao vs ON vs.nsolicitacao = s.nsolicitacao"
                    +" LEFT JOIN vendedor v ON vs.nvendedor = v.nvendedor"
                    +" WHERE s.nusuario = u.nusuario"
                    +" AND s.nsolicitacao = ?");
               pstmt.setInt(1, s.getNsolicitacao());
               rs = pstmt.executeQuery();
//               rs.first();
               if(rs.next()){  
                Proposta  p =  new Proposta(new Solicitacao(), new Vendedor(), new VendedorsolicitacaoId(), new Usuario());
                                    
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
//                          vend.setTelefone(rs.getString("vtelefone"));
//                          vend.setNome(rs.getString("vnome"));
//                          vend.setEmail(rs.getString("vemail"));
//                          vend.setCidade(rs.getString("vcidade"));
//                          vend.setCep(rs.getString("vcep"));
//                          vend.setBairro(rs.getString("vbairro"));
//                          vend.setRua(rs.getString("vrua"));
//                          vend.setNumero(rs.getString("vnumero"));
//                          vend.setEstado(rs.getString("vestado"));
                          
                          p.getVendedor().setUsuario(vend);
                          
                          p.getSolicitacao().setNsolicitacao(rs.getInt("nsolicitacao"));
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
                          
                        resp.add(p);
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
    
    
    public Proposta getPropostaBySolicitacao(int nsolicitacao , int nproposta)
          throws ServletException, IOException {

          Proposta p = null;
          try{
                     
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
                + "s.nsolicitacao = ? "
                + "AND "
                + "p.nproposta = ?");
               pstmt.setInt(1, nsolicitacao);
               pstmt.setInt(2,nproposta);
               rs = pstmt.executeQuery();
               
               while(rs.next()){
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
    
        
    
    
    public void exibeSolicitacao(Proposta p){

          //Solicitacao s = new Solicitacao();
          try{
               //HttpSession sessao = request.getSession();
              //Solicitacao s = (Solicitacao) sessao.getAttribute("solicitacao");
                     
              openDataBase();
               pstmt = con.prepareStatement("SELECT * FROM "
                + "usuario u, solicitacao s left join  vendedorsolicitacao p "
                + " on p.nsolicitacao = s.nsolicitacao "
                + " left join vendedor v "
                + " on p.nvendedor = v.nvendedor "
                + "WHERE "
                + "s.nusuario = u.nUsuario "
                + "AND "
                + "s.nsolicitacao = ?");
               pstmt.setInt(1, p.getSolicitacao().getNsolicitacao());
               rs = pstmt.executeQuery();
               
                    while(rs.next()) {                              
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
                    }
                    rs.close();
                    pstmt.close();
          }catch(Exception e){
                    System.out.println(e.getMessage());
                }finally{
                    closeDataBase();
                }
        }
    
    
        public void listarPropostaByCod(Integer nsolicitacao){
          
          Proposta p = null;
          try{
              openDataBase();
               pstmt = con.prepareStatement("select * from vendedorsolicitacao where nsolicitacao = ? AND melhoroferta = ?");
               pstmt.setInt(1, nsolicitacao);
               pstmt.setInt(2, 1);
               rs = pstmt.executeQuery();
               
                    
                    
                    if(rs.next()){
                          
                          p = new Proposta(new VendedorsolicitacaoId(), new Solicitacao(), new Vendedor());
                          p.getId().setNsolicitacao(rs.getInt("nsolicitacao"));
                          p.getId().setNvendedor(rs.getInt("nvendedor"));
                          p.getId().setNproposta(rs.getInt("nproposta"));

                  }
                    pstmt.close();
              
         }catch(Exception e){
              System.out.println(e.getMessage());
         }finally{
             closeDataBase();
        }

        } 
    
}
