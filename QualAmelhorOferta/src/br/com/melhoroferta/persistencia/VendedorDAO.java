/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import java.util.ArrayList;
import java.util.List;

import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.entidades.Vendedor;


/**
 *
 * @author Diego
 */
public class VendedorDAO extends DAO{
    
    public void cadastrarVendedor(Vendedor v){
        try {
            openDataBase();

                pstmt = con.prepareStatement("insert into usuario(nome,documento,cep,rua,numero,complemento,"
                        + "bairro,estado,cidade,telefone,email,login,senha,fantasia,razao,responsavel)"
                        + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
           
            	pstmt.setString(1, v.getUsuario().getNome());
                pstmt.setString(2, v.getUsuario().getDocumento());
                pstmt.setString(3, v.getUsuario().getCep());
                pstmt.setString(4, v.getUsuario().getRua());
                pstmt.setString(5, v.getUsuario().getNumero());
                pstmt.setString(6, v.getUsuario().getComplemento());
                pstmt.setString(7, v.getUsuario().getBairro());
                pstmt.setString(8, v.getUsuario().getEstado());
                pstmt.setString(9, v.getUsuario().getCidade());
                pstmt.setString(10, v.getUsuario().getTelefone());
                pstmt.setString(11, v.getUsuario().getEmail());
                pstmt.setString(12, v.getUsuario().getLogin());
                pstmt.setString(13, v.getUsuario().getSenha());
                pstmt.setString(14, v.getUsuario().getFantasia());
                pstmt.setString(15, v.getUsuario().getRazao());
                pstmt.setString(16, v.getUsuario().getResponsavel());

              
                pstmt.executeUpdate();
            
                pstmt = con.prepareStatement("insert into vendedor(nusuario)"
                        + "values(LAST_INSERT_ID( ))");
                pstmt.executeUpdate();
                pstmt.close();
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
    }
    public List<Vendedor> listarVendedorAll() throws Exception{
        List<Vendedor> resp = new ArrayList<Vendedor>();
        try {
            openDataBase();
            pstmt=con.prepareStatement("SELECT * FROM vendedor v, usuario u WHERE u.nusuario = v.nusuario");
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                Vendedor v = new Vendedor(new Usuario());
                
                v.getUsuario().setNome(rs.getString("nome"));
                v.getUsuario().setDocumento(rs.getString("documento"));
                v.getUsuario().setCep(rs.getString("cep"));
                v.getUsuario().setRua(rs.getString("rua"));
                v.getUsuario().setNumero(rs.getString("numero"));
                v.getUsuario().setComplemento(rs.getString("complemento"));
                v.getUsuario().setBairro(rs.getString("bairro"));
                v.getUsuario().setEstado(rs.getString("estado"));
                v.getUsuario().setCidade(rs.getString("cidade"));
                v.getUsuario().setTelefone(rs.getString("telefone"));
                v.getUsuario().setEmail(rs.getString("email"));
                v.getUsuario().setLogin(rs.getString("login"));
                v.getUsuario().setSenha(rs.getString("senha"));
                v.setNegativacoes(rs.getInt("negativacoes"));
                v.setPositivacoes(rs.getInt("positivacoes"));
                                
                v.getUsuario().setTipo(rs.getString("tipo"));
                v.getUsuario().setAtiva(rs.getInt("ativa"));
                v.getUsuario().setDatacriacao((rs.getDate("datacriacao")));
                v.getUsuario().setRegiao(rs.getString("regiao"));
                v.getUsuario().setSexo(rs.getString("sexo"));
                v.getUsuario().setDtnascimento(rs.getDate("dtnascimento"));
                v.getUsuario().setNusuario(rs.getInt("nUsuario"));
                
                resp.add(v);
                
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            //response.sendRedirect("empresa_list.jsp?messagem"+e.getMessage());
        }finally{
            closeDataBase();
        }
        return resp;
        
    }

    public Vendedor listarVendedorByCod(Integer cod){
        Vendedor v = null;
        v= new Vendedor(new Usuario());
        
        try {
            openDataBase();
            pstmt = con.prepareStatement("select * from vendedor where nvendedor = ?");
            pstmt.setInt(1, cod);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                v.getUsuario().setNome(rs.getString("nome"));
                v.getUsuario().setDocumento(rs.getString("documento"));
                v.getUsuario().setCep(rs.getString("cep"));
                v.getUsuario().setRua(rs.getString("rua"));
                v.getUsuario().setNumero(rs.getString("numero"));
                v.getUsuario().setComplemento(rs.getString("complemento"));
                v.getUsuario().setBairro(rs.getString("bairro"));
                v.getUsuario().setEstado(rs.getString("estado"));
                v.getUsuario().setCidade(rs.getString("cidade"));
                v.getUsuario().setTelefone(rs.getString("telefone"));
                v.getUsuario().setEmail(rs.getString("email"));
                v.getUsuario().setLogin(rs.getString("login"));
                v.getUsuario().setSenha(rs.getString("senha"));
                v.setNegativacoes(rs.getInt("negativacoes"));
                v.setPositivacoes(rs.getInt("positivacoes"));
                
                
            }
            rs.close();
            pstmt.close();
            
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
        return v;
    }
    public void updateVendedor(Vendedor v){
        
        try {
            openDataBase();
            pstmt= con.prepareStatement("update Vendedor set nusuario=?,negativacoes=?,positivacoes=? "
                    + "where nvendedor=? ");
            pstmt.setInt(1, v.getUsuario().getNusuario());
            pstmt.setInt(2, v.getNegativacoes());
            pstmt.setInt(3, v.getPositivacoes());
            pstmt.setInt(4, v.getNvendedor());
            
            pstmt= con.prepareStatement("update usuario set nome=?,documento=?,cep=?,rua=?,numero=?,"
                    + "complemento=?,bairro=?,estado=?,cidade=?,telefone=?,email=?,login=?,senha=?,"
                    + "positivacoes=?,negativacoes=?,fantasia=?,razao=?,responsavel=? where nusuario=?");
            
                pstmt.setString(1, v.getUsuario().getNome());
                pstmt.setString(2, v.getUsuario().getDocumento());
                pstmt.setString(3, v.getUsuario().getCep());
                pstmt.setString(4, v.getUsuario().getRua());
                pstmt.setString(5, v.getUsuario().getNumero());
                pstmt.setString(6, v.getUsuario().getComplemento());
                pstmt.setString(7, v.getUsuario().getBairro());
                pstmt.setString(8, v.getUsuario().getEstado());
                pstmt.setString(9, v.getUsuario().getCidade());
                pstmt.setString(10, v.getUsuario().getTelefone());
                pstmt.setString(11, v.getUsuario().getEmail());
                pstmt.setString(12, v.getUsuario().getLogin());
                pstmt.setString(13, v.getUsuario().getSenha());
                pstmt.setInt(14, v.getUsuario().getPositivacoes());
                pstmt.setInt(15, v.getUsuario().getNegativacoes());
                pstmt.setString(16, v.getUsuario().getFantasia());
                pstmt.setString(17, v.getUsuario().getRazao());
                pstmt.setString(18, v.getUsuario().getResponsavel());
                pstmt.setInt(19, v.getUsuario().getNusuario()); 
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }       
    }
    public void deletarVendedor(Integer cod){
        
        try {
            openDataBase();
            pstmt = con.prepareStatement("delete from vendedor where nvendedor =?");
            pstmt.setInt(1, cod);
            
            pstmt.execute();
            pstmt.close();
                    
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
    }
    
    public int countSolicitacoes(Integer cod){
        int nsolicitacoes = 0;
        
        try{
           openDataBase();
           pstmt = con.prepareStatement("select count(nsolicitacao) from solicitacao where nEmpresaEscolhida = ? ");
           pstmt.setInt(1, cod);
           rs = pstmt.executeQuery();
           if(rs.next()){
               nsolicitacoes = rs.getInt(1);
           }
           rs.close();
           pstmt.close();
        }catch(Exception e){
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
        return nsolicitacoes;
    }
    
    public int countVendedor(Integer cod){
        int nvendedor = 0;
        
        try{
           openDataBase();
           pstmt = con.prepareStatement("select count(nvendedor) from vendedor");
           rs = pstmt.executeQuery();
           if(rs.next()){
               nvendedor = rs.getInt(1);
           }
           rs.close();
           pstmt.close();
        }catch(Exception e){
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
        return nvendedor;
    }
    
    public int[] avaliacoesVendedor(int cod){
        int[] avaliacao = new int[2];
        avaliacao[0] =0;
        avaliacao[1] =0;
        try{
           openDataBase();
           pstmt = con.prepareStatement("select positivacoes , negativacoes from vendedor where nvendedor = ? ");
           pstmt.setInt(1, cod);
           rs = pstmt.executeQuery();
           if(rs.next()){
               avaliacao[0] = rs.getInt("positivacoes");
               avaliacao[1] = rs.getInt("negativacoes"); 
           }
           rs.close();
           pstmt.close();
        }catch(Exception e){
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
        return avaliacao;
    }
    
    
    public List<String[]>listarVendedorByCategory(int subcategoria){
        List<String[]>resp=new ArrayList<String[]>();
        try {
            openDataBase();
                     
            pstmt=con.prepareStatement("select u.nome,  email , sc.nome categoria from usuario u , vendedor v , subcategorias sc , categorias c , vendedorcategorias vc"
                            + " where c.ativa = 1"
                            + "  and sc.ncategoria = c.ncategoria"
                            + "  and sc.nsubcategoria = ?"
                            + "  and vc.ncategoria = c.ncategoria"
                            + "  and v.nvendedor = vc.nvendedor"
                            + "  and v.nusuario = u.nusuario");
            pstmt.setInt(1, subcategoria);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                String[] retorno = new String[3];
                retorno[0] = rs.getString("nome");
                retorno[1] = rs.getString("email");
                retorno[2] = rs.getString("categoria");
                resp.add(retorno);
                
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        return resp;
        
    }

    
}
