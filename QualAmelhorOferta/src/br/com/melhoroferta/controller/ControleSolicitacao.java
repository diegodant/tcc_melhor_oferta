/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import br.com.melhoroferta.entidades.*;
import br.com.melhoroferta.persistencia.SolitacaoDAO;
import br.com.melhoroferta.persistencia.UsuariosDAO;
import br.com.melhoroferta.persistencia.VendedorDAO;
import br.com.melhoroferta.persistencia.PropostaDAO;
import br.com.melhoroferta.utilidades.EnviaEmail;
import br.com.melhoroferta.utilidades.SendEmail; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego
 */
public class ControleSolicitacao extends HttpServlet {

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
        
         String cmd = request.getParameter("cmd");
         if (cmd.equalsIgnoreCase("ExibeSolicitacaoVendedor")){
            ExibeSolicitacaoVendedor(request, response);
        }
         if (cmd.equalsIgnoreCase("fecharSolicitacao")){
            fecharSolicitacao(request, response);
        }
    //    processRequest(request, response);
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
            cadastrarSolicitacao(request, response);
        }
        if (cmd.equalsIgnoreCase("buscarSolicitacaoVendedor")){
            buscarSolicitacaoVendedor(request, response);
        }
        if (cmd.equalsIgnoreCase("buscarAcompanhaSolicitacao")){
            buscarAcompanhaSolicitacao(request, response);
        }
        if (cmd.equalsIgnoreCase("cadastrarInteracaoVendedor")){
            cadastrarInteracaoVendedor(request, response);
        }
        if (cmd.equalsIgnoreCase("cadastrarInteracaoComprador")){
            cadastrarInteracaoComprador(request, response);
        }
       
        
        
        
    }
    
    protected void cadastrarSolicitacao(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
            HttpSession sessao = request.getSession();
            int nSubCategoria = Integer.parseInt(request.getParameter("nsubcategoria"));
            Usuario u = (Usuario) sessao.getAttribute("usuario");
            Subcategorias su = new Subcategorias();
            su.setNsubcategoria(nSubCategoria);
                       
            Solicitacao s = new Solicitacao();
            s.setProduto(request.getParameter("produto"));
            s.setPrazo(Integer.parseInt(request.getParameter("prazo")));
            s.setDescricao(request.getParameter("descricao"));
            s.setUsuario(u);
           // s.getUsuario().setNusuario(new Integer(request.getSession().setAttribute("usuario", u.getNusuario())));
            s.setSubcategoria(su);
            
             if (s != null) {
                new SolitacaoDAO().CadastrarSolicitacaoDao(s);
                
                // seleciona todos os vendedores que atuam em determinada area
                
               VendedorDAO vdao = new VendedorDAO();
               List<String[]> emails = vdao.listarVendedorByCategory(nSubCategoria);
               for(int i = 0; i < emails.size(); i++){
               
                   String[] retorno = emails.get(i);
                   try{
                       SendEmail send = new SendEmail(retorno[1], retorno[0], retorno[2]);
                   }catch(Exception e){}
               }
                request.setAttribute("mensagem", "Solicitacao cadastrado com sucesso!");
                request.getRequestDispatcher("nova_solicitacao.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
             response.sendRedirect("erro.jsp?erro="+e.getMessage());
            //request.setAttribute("Erro ao tentar cadastrar usuário.: ", e.getMessage());
           //request.getRequestDispatcher("nova_solicitacao.jsp").forward(request, response);
        }
    }
    
     protected void cadastrarInteracaoVendedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
            
            Vendedor vendedor = (Vendedor) request.getSession().getAttribute("vendedor");
            
            //Verificar se existe um objeto de sessao para a solicitacao caso nao exista usar abaixo
            int idsolic  = Integer.parseInt(request.getParameter("NSolicitacaoIntera"));
            Solicitacao solic = new Solicitacao();
            solic.setNsolicitacao(idsolic);
            
//            float valor = Float.parseFloat(request.getParameter("valor"));
            
//            String valor = request.getParameter("valor");
//                valor = valor.replace(",", ".");
//                valor = valor.replace(",", "|");
//                valor = valor.replace(".", "");
//                valor = valor.replace("|", ".");
               
            String valorf = request.getParameter("valor");     
            String obs   = request.getParameter("texto");
            // Usar date format para montar a data do prazo
//            String data = request.getParameter("prazoentrega");
            
            //Chamar VendedorSoliciatacaDAO
            Proposta vendsolic = new Proposta();
            vendsolic.setVendedor(vendedor);
            vendsolic.setSolicitacao(solic);
            vendsolic.setObservacao(obs);
            vendsolic.setValor(valorf);
//            vendsolic.setPrazoEntrega(null); //usar data formatada
            
            PropostaDAO vsDao = new PropostaDAO();
            vsDao.CadastrarProposta(vendsolic);
            request.setAttribute("mensagem", "Oferta Enviada!");
            request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);
                
        }catch(Exception e){
            request.setAttribute("mensagem","Erro ao tentar criar oferta.: "+ e.getMessage());
            request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);            
        }
        }
     protected void cadastrarInteracaoComprador(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
            
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            
            //Verificar se existe um objeto de sessao para a solicitacao caso nao exista usar abaixo
            int idsolic  = Integer.parseInt(request.getParameter("NSolicitacaoIntera"));
            Solicitacao solic = new Solicitacao();
            solic.setNsolicitacao(idsolic);
            
//            float valor = Float.parseFloat(request.getParameter("valor"));
            
//            String valor = request.getParameter("valor");
//                valor = valor.replace(",", ".");
//                valor = valor.replace(",", "|");
//                valor = valor.replace(".", "");
//                valor = valor.replace("|", ".");
               
            String valorf = request.getParameter("valor");     
            String obs   = request.getParameter("texto");
            // Usar date format para montar a data do prazo
//            String data = request.getParameter("prazoentrega");
            
            //Chamar VendedorSoliciatacaDAO
            Proposta compsolic = new Proposta();
            compsolic.setUsuario(usuario);
            compsolic.setSolicitacao(solic);
            compsolic.setObservacao(obs);
            compsolic.setValor(valorf);
//            vendsolic.setPrazoEntrega(null); //usar data formatada
            
            PropostaDAO vsDao = new PropostaDAO();
            vsDao.CadastrarProposta(compsolic);
            request.setAttribute("mensagem", "Oferta Enviada!");
            request.getRequestDispatcher("restrito_interacao_comprador.jsp").forward(request, response);
                
        }catch(Exception e){
            request.setAttribute("mensagem","Erro ao tentar criar oferta.: "+ e.getMessage());
            request.getRequestDispatcher("restrito_minha_solicitacao_comprador.jsp").forward(request, response);            
        }
        }
   
protected void buscarSolicitacaoVendedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
                       
            Solicitacao s = new Solicitacao();
            s.setProduto(request.getParameter("produto").toString());
            s.setNcategoria(Integer.parseInt(request.getParameter("categoria")));
            s.setNsubcategoria(Integer.parseInt(request.getParameter("nsubcategoria")));
            s.setEstado(request.getParameter("Estado"));
            
            if(s != null){
                SolitacaoDAO so = new SolitacaoDAO();
                so.buscarSolicitacoes(s);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("solicitacao",s);
                if (sessao.getAttribute("vendedor") != null){
//                    request.getRequestDispatcher("restrito_interagir_vendedor.jsp").forward(request, response);
                    request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp?nvendedor="+sessao.getAttribute("nvendedor")+"&NSolicitacao="+s.getNsolicitacao()+"&NCategoria="+s.getNcategoria()+"&NSubCategoria="+s.getNsubcategoria()).forward(request, response);
                }else
                if (sessao.getAttribute("usuario") != null){
                    request.getRequestDispatcher("lista_busca_solicitacoes.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("lista_busca_solicitacoes.jsp").forward(request, response);
                }
                
            }
            
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações: "+e.getMessage());
            request.getRequestDispatcher("buscar_solicitacoes.jsp").forward(request, response);
        }
    }
protected void buscarSolicitacaoComprador(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
                       
            Solicitacao s = new Solicitacao();
            s.setProduto(request.getParameter("produto").toString());
            s.setNcategoria(Integer.parseInt(request.getParameter("categoria")));
            s.setCidade(request.getParameter("Cidade"));
            s.setNsubcategoria(Integer.parseInt(request.getParameter("nsubcategoria")));
            s.setEstado(request.getParameter("Estado"));
            
            if(s != null){
                SolitacaoDAO so = new SolitacaoDAO();
                so.buscarSolicitacoes(s);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("solicitacao",s);
                request.getRequestDispatcher("lista_interacao_comprador.jsp").forward(request, response);
            }
            
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações: "+e.getMessage());
            request.getRequestDispatcher("colocar a página certa.jsp").forward(request, response);
        }
    }

protected void ExibeSolicitacaoVendedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
                       
            Solicitacao s = new Solicitacao();
            s.setNsolicitacao(Integer.parseInt(request.getParameter("nsolicitacao")));

            
            if(s != null){
                SolitacaoDAO so = new SolitacaoDAO();
                so.exibeSolicitacao(s);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("solicitacao",s);
                request.getRequestDispatcher("restrito_interagir_vendedor.jsp").forward(request, response);
            }
            
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações: "+e.getMessage());
            request.getRequestDispatcher("colocar a página certa.jsp").forward(request, response);
        }
    }

        protected void buscarAcompanhaSolicitacao(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
                       
            Solicitacao s = new Solicitacao();
            s.setProduto(request.getParameter("produto").toString());
            s.setNcategoria(Integer.parseInt(request.getParameter("categoria")));
            s.setNsubcategoria(Integer.parseInt(request.getParameter("nsubcategoria")));
            s.setEstado(request.getParameter("Estado"));
            
            if(s != null){
                SolitacaoDAO so = new SolitacaoDAO();
                so.buscarSolicitacoes(s);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("solicitacao",s);
                request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);
            }
            
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações:  "+e.getMessage());
            request.getRequestDispatcher("restrito_acompanhar_solicitacao_comprador.jsp").forward(request, response);
        }
    }
        
        
     protected void fecharSolicitacao(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {
                       
            Solicitacao s = new Solicitacao();
            VendedorsolicitacaoId vsid = new VendedorsolicitacaoId();
            s.setNsolicitacao(Integer.parseInt(request.getParameter("nsolicitacao")));
            s.setNempresaEscolhida(Integer.parseInt(request.getParameter("nempresa")));
            vsid.setNproposta(Integer.parseInt(request.getParameter("nproposta")));

            int nsolicitacao = s.getNsolicitacao();
            int nproposta = vsid.getNproposta();
            int nempresa = s.getNempresaEscolhida();
            
            if(s != null){
                SolitacaoDAO so = new SolitacaoDAO();
                if(so.fecharSolicitacao(nsolicitacao, nproposta, nempresa)){
                HttpSession sessao = request.getSession();
                sessao.setAttribute("solicitacao",s);
                request.setAttribute("mensagem", "Proposta escolhida com sucesso!");
                response.sendRedirect("restrito_detalhes_solicitacoes.jsp?nsolicitacao="+nsolicitacao);
            }
          }
            
        } catch (Exception e) {
            request.setAttribute("mensagem","Erro ao tentar pesquisar Solicitações: "+e.getMessage());
            request.getRequestDispatcher("restrito_minha_solicitacao_comprador.jsp").forward(request, response);
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
