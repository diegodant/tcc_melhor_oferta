<%@page import="java.util.List"%>
<%@page import="br.com.melhoroferta.entidades.Subcategorias"%>
<%@page import="br.com.melhoroferta.persistencia.Generico"%>

<% 

String cmd = request.getParameter("cmd");
        if (cmd.equalsIgnoreCase("buscarSolicitacao")) {
            int cod = Integer.parseInt(request.getParameter("parent_id"));
                Generico g = new Generico();
                String option="";

                List<Subcategorias> lista = g.listaSubCategoriasByCodCategoria(cod);
//                option+="<option value='null'>Todos</option>";
                for(Subcategorias c : lista ){
                    option+="<option value="+c.getNsubcategoria()+" id="+c.getNsubcategoria()+">"+c.getNome()+"</option>";

                }
                out.print(""+option.toString());
        }else{
            int cod = Integer.parseInt(request.getParameter("parent_id"));
                Generico g = new Generico();
                String option="";

                List<Subcategorias> lista = g.listaSubCategoriasByCodCategoria(cod);
                for(Subcategorias c : lista ){
                    option+="<option value="+c.getNsubcategoria()+" id="+c.getNsubcategoria()+">"+c.getNome()+"</option>";

                }
                out.print(""+option.toString());
        }


//int cod = Integer.parseInt(request.getParameter("parent_id"));
//Generico g = new Generico();
//String option="";

//List<Subcategorias> lista = g.listaSubCategoriasByCodCategoria(cod);
//option+="<option value='%%%'>Todos</option>";
//for(Subcategorias c : lista ){
//    option+="<option value="+c.getNsubcategoria()+" id="+c.getNsubcategoria()+">"+c.getNome()+"</option>";
      
//}
//out.print(""+option.toString());

//out.print("<option value='11' id='11'>Teste</option>");


%>



