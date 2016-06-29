/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.persistencia.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Daniel
 */
public class ControleUsuario extends HttpServlet {

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
    //   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
        /*
     * response.setContentType("text/html;charset=UTF-8"); PrintWriter out = response.getWriter();
     */
    //    String cmd = request.getParameter("cmd");
    //       if (cmd.equalsIgnoreCase("gravar_usuario")) {
    //         cadastrarUsuario(request, response);
    //     }
    //   }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cmd = request.getParameter("cmd");
        if (cmd.equalsIgnoreCase("gravar_usuario")) {
            cadastrarUsuario(request, response);
        }
        if(cmd.equalsIgnoreCase("alterar_dados")){    // Método que listar empresas
            alterarUsuario(request,response);
        }
        if (cmd.equalsIgnoreCase("lista_empresa")) {
           alterarUsuario(request, response);              
                      
    }
        
        
        
    }
    
    protected void alterarUsuario (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
  
        try{           
              HttpSession sessao = request.getSession();
              Usuario u = (Usuario) sessao.getAttribute("usuario");
              
            u.setNome(request.getParameter("nome"));                
            u.setTipo(request.getParameter("tipo"));                
            u.setSexo(request.getParameter("sexo"));                
            u.setEmail(request.getParameter("email"));              
            u.setAtiva(request.getParameter("ativa")==null?1:0);    
            u.setRua(request.getParameter("rua"));                             
            u.setTelefone(request.getParameter("telefone"));        
            u.setCidade(request.getParameter("cidade"));            
            u.setEstado(request.getParameter("estado"));            
            u.setBairro(request.getParameter("bairro"));           
            u.setComplemento(request.getParameter("complemento"));  
            u.setNumero(request.getParameter("numero"));            
            u.setCep(request.getParameter("cep"));                  
            u.setPositivacoes(new Integer(request.getParameter("positivacoes")==null?0:1));
            u.setNegativacoes(new Integer(request.getParameter("negativacoes")==null?0:1));
            u.setRegiao(request.getParameter("regiao"));            
            u.setDocumento(request.getParameter("documento")); 
           
            
            String data = request.getParameter("dtnascimento");
            DateFormat fmt = new SimpleDateFormat("dd/MM/yyy");
            java.sql.Date sqldata = new java.sql.Date(fmt.parse(data).getTime());
            u.setDtnascimento(sqldata);

             
                if(u !=null){
                  
                  UsuariosDAO ud = new UsuariosDAO();
                  ud.updateUsuario(u);  
                  
              }
             
     }catch(Exception e){
        request.setAttribute("mensagem","Erro ao tentar cadastrar usuário.:"+e.getMessage()+ "");
        request.getRequestDispatcher("restrito_altera_dados_comprador.jsp").forward(request, response);
     }finally{
              request.setAttribute("mensagem","Senha alterada com sucesso! ");             
              request.getRequestDispatcher("restrito_altera_dados_comprador.jsp").forward(request, response);
         }
    } 

    protected void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        try {
            Usuario u = new Usuario();
            u.setNome(request.getParameter("nome"));                
            u.setTipo(request.getParameter("tipo"));                
            u.setSexo(request.getParameter("sexo"));                
            u.setEmail(request.getParameter("email"));              
            u.setAtiva(request.getParameter("ativa")==null?1:0);    
            u.setSenha(request.getParameter("senha"));               
            u.setLogin(request.getParameter("login"));              
            u.setTelefone(request.getParameter("telefone"));
            u.setCelular(request.getParameter("celular"));
            u.setRua(request.getParameter("rua"));
            u.setCidade(request.getParameter("cidade"));            
            u.setEstado(request.getParameter("estado"));            
            u.setBairro(request.getParameter("bairro"));           
            u.setComplemento(request.getParameter("complemento"));  
            u.setNumero(request.getParameter("numero"));            
            u.setCep(request.getParameter("cep"));                  
            u.setPositivacoes(new Integer(request.getParameter("positivacoes")==null?0:1));
            u.setNegativacoes(new Integer(request.getParameter("negativacoes")==null?0:1));
            u.setRegiao(request.getParameter("regiao"));            
            u.setDocumento(request.getParameter("documento"));

            String data = request.getParameter("dtnascimento");
            DateFormat fmt = new SimpleDateFormat("dd/MM/yyy");
            java.sql.Date sqldata = new java.sql.Date(fmt.parse(data).getTime());
            u.setDtnascimento(sqldata);
            

          
          
            if (u != null) {
                new UsuariosDAO().cadastrarUsuarios(u);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuario",u);
                request.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
                request.getRequestDispatcher("restrito_minha_solicitacao_comprador.jsp").forward(request, response);
                
            }
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar cadastrar usuário.: "+ e.getMessage());
            request.getRequestDispatcher("cadastro_usuario.jsp").forward(request, response);
        }

    }
}
