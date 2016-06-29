/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.*;
import br.com.melhoroferta.persistencia.PropostaDAO;
import br.com.melhoroferta.persistencia.SolitacaoDAO;
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
public class ControleProposta extends HttpServlet {

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
       // processRequest(request, response);
         String cmd = request.getParameter("cmd");
         if (cmd.equalsIgnoreCase("ExibeSolicitacaoVendedor")){
            ExibeSolicitacaoVendedor(request, response);
        }        
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
        if (cmd.equalsIgnoreCase("gravar_solicitacao")) {
            cadastrarInteracao(request, response);
        }
       // processRequest(request, response);
    }
    
    protected void cadastrarInteracao(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        HttpSession sessao = request.getSession();
            Solicitacao s = (Solicitacao) sessao.getAttribute("solicitacao");
            try {
              
                Proposta vs = new Proposta();
//                String valor = request.getParameter("valor");
//                valor = valor.replace(",", ".");
//                valor = valor.replace(",", "|");
//                valor = valor.replace(".", "");
//                valor = valor.replace("|", ".");
                
                
                vs.setObservacao(request.getParameter("texto"));
                vs.setValor(request.getParameter("valor"));
                vs.getSolicitacao().setNsolicitacao(s.getNsolicitacao());
                
//                vs.getSolicitacao().setNsolicitacao(Integer.parseInt(request.getParameter("NSolicitacao")));
                
                if(vs!=null){
                    
                    PropostaDAO vsd = new PropostaDAO();
                    vsd.CadastrarProposta(vs);
                    request.setAttribute("mensagem", "Oferta Enviada!");
                    request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);
                    
                }
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar criar oferta.: "+ e.getMessage());
            request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);
        }
        
    
    
    }
    
    
    protected void ExibeSolicitacaoVendedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
            
            
            Proposta p = new Proposta(new Solicitacao(), new Vendedor(), new VendedorsolicitacaoId(), new Usuario());
            p.getSolicitacao().setNsolicitacao(Integer.parseInt(request.getParameter("nsolicitacao")));

            
            if(p != null){
                PropostaDAO pd = new PropostaDAO();
                pd.exibeSolicitacao(p);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("proposta",p);
                request.getRequestDispatcher("restrito_interagir_vendedor.jsp").forward(request, response);
            }
            
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações: "+e.getMessage());
            request.getRequestDispatcher("colocar a página certa.jsp").forward(request, response);
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
