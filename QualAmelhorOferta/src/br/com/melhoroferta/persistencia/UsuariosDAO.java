/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Dantas
 */
public class UsuariosDAO extends DAO {

    public void cadastrarUsuarios(Usuario u)throws Exception{
        
            openDataBase();
            pstmt = con.prepareStatement("insert into usuario(nome,tipo,sexo,email,ativa,login,senha,telefone,rua,"
                    + "cidade,estado,bairro,complemento,"
                    + "numero,cep,positivacoes,negativacoes,regiao,documento,dtnascimento)"
                    + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");

            pstmt.setString(1, u.getNome());       
            pstmt.setString(2, u.getTipo());       
            pstmt.setString(3, u.getSexo());       
            pstmt.setString(4,u.getEmail());       
            pstmt.setInt(5, u.getAtiva()==null?0:1);
            pstmt.setString(6, u.getLogin());      
            pstmt.setString(7, u.getSenha());      
            pstmt.setString(8, u.getTelefone());
            pstmt.setString(9, u.getRua());
            pstmt.setString(10, u.getCidade());     
            pstmt.setString(11, u.getEstado());    
            pstmt.setString(12, u.getBairro());    
            pstmt.setString(13, u.getComplemento());
            pstmt.setString(14, u.getNumero());    
            pstmt.setString(15, u.getCep());       
            pstmt.setInt(16, u.getPositivacoes()); 
            pstmt.setInt(17, u.getNegativacoes()); 
            pstmt.setString(18, u.getRegiao());    
            pstmt.setString(19,u.getDocumento()); 
            pstmt.setDate(20,(u.getDtnascimento())); 

            pstmt.executeUpdate();
            pstmt.close();

       

    }

    public List<Usuario> listarUsuariosAll() throws Exception{
        List<Usuario> resp = new ArrayList<Usuario>();
        
            openDataBase();
            pstmt = con.prepareStatement("select * from usuario");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();

                u.setNome(rs.getString("nome"));        
                u.setTipo(rs.getString("tipo"));        
                u.setSexo(rs.getString("sexo"));            
                u.setEmail(rs.getString ("email"));        
                u.setAtiva(rs.getInt("ativa"));       
                u.setSexo(rs.getString("login"));          
                u.setLogin(rs.getString("senha"));        
                u.setTelefone(rs.getString("telefone")); 
                u.setRua(rs.getString("rua"));
                u.setCidade(rs.getString("cidade"));             
                u.setEstado(rs.getString("estado"));             
                u.setBairro(rs.getString("bairro"));          
                u.setComplemento(rs.getString("complemento"));   
                u.setNumero(rs.getString("numero"));             
                u.setCep(rs.getString("cep"));           
                u.setPositivacoes(rs.getInt("positivacoes")); 
                u.setNegativacoes(rs.getInt("negativacoes")); 
                u.setRegiao(rs.getString("regiao"));             
                u.setDocumento(rs.getString("documento"));       

                resp.add(u);

            }
            rs.close();
            pstmt.close();

        return resp;
    }

    public Usuario listaUsuariosByCod(Integer cod)throws Exception{
        Usuario u = null;
        u = new Usuario();

        
            openDataBase();
            pstmt = con.prepareStatement("select * from usuario where nusuario = ?");
            pstmt.setInt(1, cod);
            rs = pstmt.executeQuery();

            if (rs.next()) {

                u.setNome(rs.getString("nome"));        
                u.setTipo(rs.getString("tipo"));        
                u.setSexo(rs.getString("sexo"));            
                u.setEmail(rs.getString ("email"));        
                u.setAtiva(rs.getInt("ativa"));       
                u.setSexo(rs.getString("login"));          
                u.setLogin(rs.getString("senha"));        
                u.setTelefone(rs.getString("telefone"));
                u.setRua(rs.getString("rua"));
                u.setCidade(rs.getString("cidade"));             
                u.setEstado(rs.getString("estado"));             
                u.setBairro(rs.getString("bairro"));          
                u.setComplemento(rs.getString("complemento"));   
                u.setNumero(rs.getString("numero"));             
                u.setCep(rs.getString("cep"));           
                u.setPositivacoes(rs.getInt("positivacoes")); 
                u.setNegativacoes(rs.getInt("negativacoes")); 
                u.setRegiao(rs.getString("regiao"));             
                u.setDocumento(rs.getString("documento"));  

            }
            rs.close();
            pstmt.close();
closeDataBase();
    
        return u;
    }

    public void updateUsuario(Usuario u) throws Exception{

        
            openDataBase();
            pstmt = con.prepareStatement("update usuario set nome=?,tipo=?,sexo=?,email=?,ativa=?,senha=?,telefone=?,rua=?,cidade=?,"
                    + "estado=?,bairro=?,complemento=?,numero=?,cep=?,positivacoes=?,negativacoes=?,regiao=?,documento=?,dtnascimento=? "
                    + "where nusuario = ?");

            pstmt.setString(1, u.getNome());       
            pstmt.setString(2, u.getTipo());       
            pstmt.setString(3, u.getSexo());       
            pstmt.setString(4,u.getEmail());       
            pstmt.setInt(5, u.getAtiva()==null?0:1);     
            pstmt.setString(6, u.getSenha());      
            pstmt.setString(7, u.getTelefone());
            pstmt.setString(8, u.getRua());
            pstmt.setString(9, u.getCidade());     
            pstmt.setString(10, u.getEstado());    
            pstmt.setString(11, u.getBairro());    
            pstmt.setString(12, u.getComplemento());
            pstmt.setString(13, u.getNumero());    
            pstmt.setString(14, u.getCep());       
            pstmt.setInt(15, u.getPositivacoes()); 
            pstmt.setInt(16, u.getNegativacoes()); 
            pstmt.setString(17, u.getRegiao());    
            pstmt.setString(18,u.getDocumento()); 
            pstmt.setDate(19,u.getDtnascimento()); 
            pstmt.setInt(20, u.getNusuario());

            pstmt.execute();
            pstmt.close();
            
            closeDataBase();
    

    }

    public void deletarUsuario(Integer cod)throws Exception{
   

            openDataBase();
            pstmt = con.prepareStatement("delete from usuarios where nusuario = ?");
            pstmt.setInt(1, cod);

            pstmt.execute();
            pstmt.close();
            closeDataBase();

    }    
}
