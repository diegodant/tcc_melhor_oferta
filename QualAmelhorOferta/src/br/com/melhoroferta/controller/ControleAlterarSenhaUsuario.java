/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.persistencia.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
public class ControleAlterarSenhaUsuario extends HttpServlet {

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
   // protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            /*
//             * TODO output your page here. You may use following sample code.
//             */
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ControleAlterarSenhaUsuario</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ControleAlterarSenhaUsuario at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        } finally {            
//            out.close();
//        }
//    }

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
        String msg=null;
        if (cmd.equalsIgnoreCase("alterar_senha")) {
            HttpSession sessao = request.getSession();
            Usuario u = (Usuario) sessao.getAttribute("usuario");
            if(!request.getParameter("Senha").equals(u.getSenha())){
               request.setAttribute("Erro ao tentar alterar senha usuário.: ",msg);
            }else{
            alterarSenhaUsuario(request, response);
        }
     }
}
    
     protected void alterarSenhaUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try{
             HttpSession sessao = request.getSession();
              Usuario u = (Usuario) sessao.getAttribute("usuario");
              //u.setSenha(null);
              u.setSenha(request.getParameter("NovaSenha"));
             
              if(u !=null){
                  
                  UsuariosDAO ud = new UsuariosDAO();
                  ud.updateUsuario(u);  
                  
              }
             
     }catch(Exception e){
        request.setAttribute("msg","Erro ao tentar cadastrar usuário.:"+e.getMessage()+ "");
        request.getRequestDispatcher("restrito_altera_senha_comprador.jsp").forward(request, response);
     }finally{
              request.setAttribute("msg","Senha alterada com sucesso! ");             
              request.getRequestDispatcher("restrito_altera_senha_comprador.jsp").forward(request, response);
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
}
