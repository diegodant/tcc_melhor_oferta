/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.persistencia.UsuariosDAO;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * @author Hilda Bárbara
 */
public class ControleCategoria  extends HttpServlet {

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
        if (cmd.equalsIgnoreCase("gravar_categoria")) {
            cadastrarCategoria(request, response);
                      
    }
        
        
        
    }
    
 

    protected void cadastrarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        //try {
            Categorias c = new Categorias();
            c.setNome(request.getParameter("nome"));                
            
            String data = request.getParameter("dtnascimento");
            DateFormat fmt = new SimpleDateFormat("dd/MM/yyy");
            //java.sql.Date sqldata = new java.sql.Date(fmt.parse(data).getTime());
            //u.setDtnascimento(sqldata);
            

          /*
          
            if (c != null) {
                new UsuariosDAO().cadastrarUsuarios(u);
                request.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
                request.getRequestDispatcher("cadastro_usuario.jsp").forward(request, response);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuario",u);
            }
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar cadastrar usuário.: "+ e.getMessage());
            request.getRequestDispatcher("cadastro_usuario.jsp").forward(request, response);
        }
         */

    }
}
