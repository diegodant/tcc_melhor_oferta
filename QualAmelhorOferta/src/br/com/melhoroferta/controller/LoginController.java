/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.entidades.Vendedor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.melhoroferta.persistencia.*;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String cmd = request.getParameter("cmd");
            if (cmd.equalsIgnoreCase("consulta_login")) {
                login(request, response);
    }       if (cmd.equalsIgnoreCase("validar_admin")) {
                validaAdmin(request, response);
    }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
     protected void login(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            
         ResultSet rs = null;
         Generico g = new Generico();
         
         //try de verificação de usuário já logado
         try{
             HttpSession quebra = request.getSession();
            if( quebra.getAttribute("usuario") != null){
              quebra.invalidate();   
            }
            if(quebra.getAttribute("vendedor") !=null){
            quebra.invalidate(); 
            }
         
         
         //try normal do sistema de login
         try {
             String login = request.getParameter("login");
             String senha = request.getParameter("senha");
         

         HttpSession sessao = request.getSession();
          
//         Usuario u = g.consultarLogin(login,senha);
         rs = g.consultarLogin(login, senha);
         
         if (rs == null){
               g.closeDataBase();
               response.sendRedirect("identificacao.jsp?erro=Usuario nao registrado");
        }
         else{
                rs.first();
               
                Usuario u = new Usuario();
                u.setNusuario(rs.getInt("nusuario"));
                u.setTipo(rs.getString("tipo")); 
                u.setNome(rs.getString("nome"));  
                u.setSexo(rs.getString("sexo"));            
                u.setEmail(rs.getString ("email"));        
                u.setAtiva(rs.getInt("ativa"));          
                u.setLogin(rs.getString("login"));
                u.setSenha(rs.getString("senha"));
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
                
                
                sessao.setAttribute("usuario",u);
                
                
              if(rs.getString("vendedor").equalsIgnoreCase("S")){
                    Vendedor v = new Vendedor();
                    v.setNvendedor(rs.getInt("nvendedor"));
                    v.setUsuario(u);
                    v.setPositivacoes(rs.getInt("positivacoes"));
                    v.setNegativacoes(rs.getInt("negativacoes"));
                    
                    sessao.setAttribute("vendedor",v );
                    response.sendRedirect("restrito_empresa.jsp");
                }
              else
                  response.sendRedirect("restrito_minha_solicitacao_comprador.jsp");
            }
             rs.close();
            
 
         } catch (Exception e) {
                request.setAttribute("mensagem", "Usuário ou Senha Incorreta: Tente Novamente!");
                request.getRequestDispatcher("identificacao.jsp").forward(request, response);
          
         }
         
         finally{
        
         g.closeDataBase();
         }
         
         
         
         //Fecha o try da verificação de usuário já logado
         }catch (Exception e) {
                request.setAttribute("mensagem", "Erro ao logar: Tente Novamente!");
                request.getRequestDispatcher("identificacao.jsp").forward(request, response);
         }
        
         
     }
     
     
          protected void validaAdmin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
              
              ResultSet rs = null;
              Generico g = new Generico();
              
              String senha = request.getParameter("senha");
              
              try{
              HttpSession sessao = request.getSession();    
              
                 //rs=  g.consultarAdmin(senha);
                 
                 
                  // rs.first();
               
                Usuario u = new Usuario();
                u.setNusuario(100);//(rs.getInt("nusuario"));
                u.setTipo("a");//(rs.getString("tipo")); 
                u.setNome("Diego");//(rs.getString("nome"));  
                u.setSexo("M");//(rs.getString("sexo"));            
                u.setEmail("diegodantas@tcc.com");//(rs.getString ("email"));        
                u.setAtiva(1);//(rs.getInt("ativa"));          
                u.setLogin("diego");//(rs.getString("login"));
                u.setSenha("1234");//(rs.getString("senha"));
                u.setTelefone("2222222222");//(rs.getString("telefone"));
                u.setRua("Rua v");//(rs.getString("rua"));
                u.setCidade("SJM");//(rs.getString("cidade"));             
                u.setEstado("Rio de janeiro");//(rs.getString("estado"));             
                u.setBairro("Coelho");//(rs.getString("bairro"));          
                u.setComplemento("Apto");//(rs.getString("complemento"));   
                u.setNumero("10");//(rs.getString("numero"));             
                u.setCep("123456789");//(rs.getString("cep"));           
                u.setPositivacoes(0);//(rs.getInt("positivacoes")); 
                u.setNegativacoes(0);//(rs.getInt("negativacoes")); 
                u.setRegiao("Sudeste");//(rs.getString("regiao"));             
                u.setDocumento("RG");//(rs.getString("documento")); 
                
              
                sessao.setAttribute("usuario",u);
                 
                 
              
              if (u!=null){//(rs!=null){
                  request.getRequestDispatcher("mo_admin/empresa_lista.jsp").forward(request, response);
              }else{
              request.setAttribute("mensagem","Senha incorreta.:");
               request.getRequestDispatcher("mo_admin/login.jsp").forward(request, response);
              }
                  
              
              }catch(Exception e){
               request.setAttribute("mensagem","Senha incorreta.:"+e.getMessage()+ "");
               request.getRequestDispatcher("mo_admin/login.jsp").forward(request, response);
              }
              
          }
         

}
     


