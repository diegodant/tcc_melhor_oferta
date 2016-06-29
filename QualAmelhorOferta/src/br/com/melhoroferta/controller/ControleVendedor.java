/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.melhoroferta.entidades.Categorias;
import br.com.melhoroferta.entidades.Usuario;
import br.com.melhoroferta.entidades.Vendedor;
import br.com.melhoroferta.entidades.Vendedorcategorias;
import br.com.melhoroferta.persistencia.VendedorCategoriasDAO;
import br.com.melhoroferta.persistencia.VendedorDAO;

/**
 *
 * @author Diego
 */
public class ControleVendedor extends HttpServlet {

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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cmd = request.getParameter("cmd");
        if (cmd.equalsIgnoreCase("gravar_empresa")) {
            cadastrarVendedor(request, response);
        }



        if (cmd.equalsIgnoreCase("gravar_empresa_categoria")) {
            cadastrarVendedorCategoria(request, response);

        }

        if (cmd.equalsIgnoreCase("lista_empresa")) {
            cadastrarVendedor(request, response);              // Método que tenta listar empresas

        }

    }

    protected void listaEmpresa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession sessao = request.getSession();
            Vendedor v = (Vendedor) sessao.getAttribute("usuario");

            //v.setUsuario(request.getParameter("nome"));
            v.setNvendedor(1);
            /*
             * v.setTipo(request.getParameter("tipo"));
             * v.setSexo(request.getParameter("sexo"));
             * v.setEmail(request.getParameter("email"));
             * v.setAtiva(request.getParameter("ativa")==null?1:0);
             * v.setRua(request.getParameter("rua"));
             * v.setTelefone(request.getParameter("telefone"));
             * v.setCidade(request.getParameter("cidade"));
             * v.setEstado(request.getParameter("estado"));
             * v.setBairro(request.getParameter("bairro"));
             * v.setComplemento(request.getParameter("complemento"));
             * v.setNumero(request.getParameter("numero"));
             * v.setCep(request.getParameter("cep")); v.setPositivacoes(new
             * Integer(request.getParameter("positivacoes")==null?0:1));
             * v.setNegativacoes(new
             * Integer(request.getParameter("negativacoes")==null?0:1));
             * v.setRegiao(request.getParameter("regiao"));
             * v.setDocumento(request.getParameter("documento")); 
            *
             */
//
//            String data = request.getParameter("dtnascimento");
//            DateFormat fmt = new SimpleDateFormat("dd/MM/yyy");
//            java.sql.Date sqldata = new java.sql.Date(fmt.parse(data).getTime());
//            v.setDtnascimento(sqldata);

            if (v != null) {

                VendedorDAO ud = new VendedorDAO();
                //ud.updateUsuario(v);  

            }

        } catch (Exception e) {
            request.setAttribute("mensagem", "Erro ao tentar cadastrar usuário.:" + e.getMessage() + "");
            request.getRequestDispatcher("restrito_altera_dados_comprador.jsp").forward(request, response);
        } finally {
            request.setAttribute("mensagem", "Senha alterada com sucesso! ");
            request.getRequestDispatcher("restrito_altera_dados_comprador.jsp").forward(request, response);
        }
    }

    protected void cadastrarVendedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        try {
            Vendedor v = new Vendedor(new Usuario());
            v.getUsuario().setNome(request.getParameter("vendedor"));
            v.getUsuario().setDocumento(request.getParameter("cpf"));
            v.getUsuario().setCep(request.getParameter("cep"));
            v.getUsuario().setRua(request.getParameter("endereco"));
            v.getUsuario().setNumero(request.getParameter("numero"));
            v.getUsuario().setComplemento(request.getParameter("complemento"));
            v.getUsuario().setEstado(request.getParameter("estado"));
            v.getUsuario().setCidade(request.getParameter("cidade"));
            v.getUsuario().setTelefone(request.getParameter("telefone"));
            v.getUsuario().setEmail(request.getParameter("email"));
            v.getUsuario().setLogin(request.getParameter("login"));
            v.getUsuario().setSenha(request.getParameter("senha"));
            v.getUsuario().setFantasia(request.getParameter("fantasia"));
            v.getUsuario().setRazao(request.getParameter("razao"));
            v.getUsuario().setResponsavel(request.getParameter("responsavel"));



            if (v != null) {
                new VendedorDAO().cadastrarVendedor(v);
                HttpSession sessao = request.getSession();
                sessao.setAttribute("vendedor",v);
                request.setAttribute("mensagem", "Vendedor cadastrado com sucesso!");
                request.getRequestDispatcher("restrito_empresa.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("mensagem", "Erro ao tentar cadastrar vendedor.: " + e.getMessage());
            request.getRequestDispatcher("cadastro_empresa.jsp").forward(request, response);
        }

    }

    /**
     *
     * cadastramaneto das categorias e subcategorias no banco
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void cadastrarVendedorCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        try {

            //Vendedorcategorias vc = new Vendedorcategorias(new Vendedor(), new Categorias());

            Vendedor vendedor = (Vendedor) request.getSession().getAttribute("vendedor");

            VendedorCategoriasDAO daoCategoria = new VendedorCategoriasDAO();
            
            String[] categorias = request.getParameterValues("ncategoria");
            
            for(int i=0; i< categorias.length;i++){
                if(categorias[i] != null){
                    Categorias categoria = new Categorias();
                    categoria.setNcategoria(Integer.parseInt(categorias[i]));
                    Vendedorcategorias vc = new Vendedorcategorias(vendedor, categoria); 
                    daoCategoria.CadastrarCategoriasVendedor(vc);
                }
            }

              request.setAttribute("mensagem", "Categoria(as) cadastrada(as) com sucesso!");
              request.getRequestDispatcher("cadastro_empresa_categorias.jsp").forward(request,
              response); 
             
        } catch (Exception e) {
            request.setAttribute("mensagem", "Erro ao tentar cadastrar vendedor.: " + e.getMessage());
            request.getRequestDispatcher("cadastro_empresa_categorias.jsp").forward(request, response);
        }

    }

//    protected List<Categorias> lista(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        try {
//
//            List<Categorias> listaCategorias = new ArrayList<Categorias>();
//           Categorias c = new Categorias();
//
//              listaCategorias.add(c.setNcategoria(Integer.parseInt(request.getParameter("Ncategoria"))));
//              
//              
//
//
//            } catch (Exception e) {
//            e.getMessage();
//        }
//
//        return listaCategorias;
//    }
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
