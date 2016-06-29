/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;
import br.com.melhoroferta.entidades.Empresas;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Dantas
 */
public class EmpresasDAO extends DAO {
    
    public void cadastrarEmpresas(Empresas ep){
        try {
            openDataBase();
            pstmt=con.prepareStatement("insert into empresas(nplano,razaoSocial,nomeFantasia,ramoAtividade,responsavel,"
                    + "tipo,cnpj,cpf,cep,endereco,numero,complemento,bairro,estado,cidade,telefone,email,"
                    + "site,login,senha,palavrasChaves,mapa,descricao,ativa,ua)"
                    + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            pstmt.setInt(1, ep.getNplano().getNplano());
            pstmt.setString(2, ep.getRazaoSocial());
            pstmt.setString(3, ep.getNomeFantasia());
            pstmt.setString(4, ep.getRamoAtividade());
            pstmt.setString(5, ep.getResponsavel());
            pstmt.setString(6, ep.getTipo());
            pstmt.setString(7, ep.getCnpj());
            pstmt.setString(8, ep.getCpf());
            pstmt.setString(9, ep.getCep());
            pstmt.setString(10, ep.getEndereco());
            pstmt.setString(11, ep.getNumero());
            pstmt.setString(12, ep.getComplemento());
            pstmt.setString(13, ep.getBairro());
            pstmt.setString(14, ep.getEstado());
            pstmt.setString(15, ep.getCidade());
            pstmt.setString(16, ep.getTelefone());
            pstmt.setString(17, ep.getEmail());
            pstmt.setString(18, ep.getSite());
            pstmt.setString(19, ep.getLogin());
            pstmt.setString(20, ep.getSenha());
            pstmt.setString(21, ep.getPalavrasChaves());
            pstmt.setString(22, ep.getMapa());
            pstmt.setString(23, ep.getDescricao());
            pstmt.setInt(24, ep.getAtiva());
            pstmt.setDate(25, ep.getUa());
            
            pstmt.execute();
            pstmt.close();
        }catch(Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
    }
    
    public List<Empresas> listaEmpresasAll(){
        List<Empresas> resp = new ArrayList<Empresas>();
        try {
            openDataBase();
            pstmt= con.prepareStatement("select * from empresas");
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                Empresas empresas = new Empresas();
                
               empresas.getNplano().setNplano(rs.getInt("Nplano"));                    	         
               empresas.setRazaoSocial(rs.getString("RazaoSocial"));                
               empresas.setNomeFantasia(rs.getString("NomeFantasia"));               
               empresas.setRamoAtividade( rs.getString("RamoAtividade"));             
               empresas.setResponsavel(rs.getString("Responsavel"));                
               empresas.setTipo(rs.getString("Tipo"));                       
               empresas.setCnpj( rs.getString("CNPJ"));                      
               empresas.setCpf(rs.getString("CPF"));                        
               empresas.setCep( rs.getString("CEP"));                       
               empresas.setEndereco( rs.getString("Endereco"));                  
               empresas.setNumero(rs.getString("Numero"));                     
               empresas.setComplemento(rs.getString("Complemento"));                
               empresas.setBairro(rs.getString("Bairro"));                     
               empresas.setEstado(rs.getString("Estado"));                     
               empresas.setCidade( rs.getString("Cidade"));                    
               empresas.setTelefone(rs.getString("Telefone"));                   
               empresas.setEmail(rs.getString("Email"));                      
               empresas.setSite(rs.getString("Site"));                       
               empresas.setLogin(rs.getString("Login"));                      
               empresas.setSenha( rs.getString("Senha"));                     
               empresas.setPalavrasChaves(rs.getString("PalavrasChaves"));             
               empresas.setMapa(rs.getString("Mapa"));                       
               empresas.setDescricao(rs.getString("Descricao"));                  
               empresas.setAtiva(rs.getInt("Ativa"));                      
               empresas.setUa(rs.getDate("UA"));              
                
               resp.add(empresas);
                
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
    
    public Empresas listarEmpresasByCod(Integer cod){
        Empresas empresas = null;
        empresas= new Empresas();
        
        try {
            openDataBase();
            pstmt = con.prepareStatement("select * from empresas where NEmpresa = ?");
            pstmt.setInt(1, cod);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                
               empresas.getNplano().setNplano(rs.getInt("Nplano"));                    	         
               empresas.setRazaoSocial(rs.getString("RazaoSocial"));                
               empresas.setNomeFantasia(rs.getString("NomeFantasia"));               
               empresas.setRamoAtividade( rs.getString("RamoAtividade"));             
               empresas.setResponsavel(rs.getString("Responsavel"));                
               empresas.setTipo(rs.getString("Tipo"));                       
               empresas.setCnpj( rs.getString("CNPJ"));                      
               empresas.setCpf(rs.getString("CPF"));                        
               empresas.setCep( rs.getString("CEP"));                       
               empresas.setEndereco( rs.getString("Endereco"));                  
               empresas.setNumero(rs.getString("Numero"));                     
               empresas.setComplemento(rs.getString("Complemento"));                
               empresas.setBairro(rs.getString("Bairro"));                     
               empresas.setEstado(rs.getString("Estado"));                     
               empresas.setCidade( rs.getString("Cidade"));                    
               empresas.setTelefone(rs.getString("Telefone"));                   
               empresas.setEmail(rs.getString("Email"));                      
               empresas.setSite(rs.getString("Site"));                       
               empresas.setLogin(rs.getString("Login"));                      
               empresas.setSenha( rs.getString("Senha"));                     
               empresas.setPalavrasChaves(rs.getString("PalavrasChaves"));             
               empresas.setMapa(rs.getString("Mapa"));                       
               empresas.setDescricao(rs.getString("Descricao"));                  
               empresas.setAtiva(rs.getInt("Ativa"));                      
               empresas.setUa(rs.getDate("UA")); 
               
            }
             rs.close();
            pstmt.close();
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
        return empresas;
    }
    public void updateEmpresa(Empresas ep){
        try {
            openDataBase();
         
            pstmt=con.prepareStatement("update empresas  set empresasnplano=?,razaoSocial=?,nomeFantasia=?,ramoAtividade=?,responsavel=?,"
        + "tipo=?,cnpj=?,cpf=?,cep=?,endereco=?,numero=?,complemento=?,bairro=?,estado=?,cidade=?,telefone=?,email=?,"
        + "site=?,login=?,senha=?,palavrasChaves=?,mapa=?,descricao=?,ativa=?,ua=? where NEmpresa=?");
                      
            pstmt.setInt(1, ep.getNplano().getNplano());
            pstmt.setString(2, ep.getRazaoSocial());
            pstmt.setString(3, ep.getNomeFantasia());
            pstmt.setString(4, ep.getRamoAtividade());
            pstmt.setString(5, ep.getResponsavel());
            pstmt.setString(6, ep.getTipo());
            pstmt.setString(7, ep.getCnpj());
            pstmt.setString(8, ep.getCpf());
            pstmt.setString(9, ep.getCep());
            pstmt.setString(10, ep.getEndereco());
            pstmt.setString(11, ep.getNumero());
            pstmt.setString(12, ep.getComplemento());
            pstmt.setString(13, ep.getBairro());
            pstmt.setString(14, ep.getEstado());
            pstmt.setString(15, ep.getCidade());
            pstmt.setString(16, ep.getTelefone());
            pstmt.setString(17, ep.getEmail());
            pstmt.setString(18, ep.getSite());
            pstmt.setString(19, ep.getLogin());
            pstmt.setString(20, ep.getSenha());
            pstmt.setString(21, ep.getPalavrasChaves());
            pstmt.setString(22, ep.getMapa());
            pstmt.setString(23, ep.getDescricao());
            pstmt.setInt(24, ep.getAtiva());
            pstmt.setDate(25, ep.getUa());
            pstmt.setInt(26, ep.getNempresa());
            
            pstmt.execute();
            pstmt.close();
            
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
    }
    
    public void deletarEmpresa(Integer cod){
        try {
            openDataBase();
            pstmt = con.prepareStatement("delete from empresa where NEmpresa = ?");
            pstmt.setInt(1, cod);
            
            pstmt.execute();
            pstmt.close();
            
        } catch (Exception e) {
            e.getMessage();
        }finally{
            closeDataBase();
        }
        
    }
}
