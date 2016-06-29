/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.Vendedorcategorias;

/**
 *
 * @author CELTAPHP
 */
public class VendedorCategoriasDAO extends DAO {
    
    /**
     * Cadastramento das Categorias do Vendedor
     * @param vc
     * @throws Exception 
     */
        public void CadastrarCategoriasVendedor(Vendedorcategorias vc) throws Exception{
        try{
            openDataBase();
            
            pstmt = con.prepareStatement("insert into vendedorcategorias (nvendedor,ncategoria,dataCriacao)values(?,?,NOW())");
            
            pstmt.setInt(1,vc.getVendedor().getNvendedor());
            pstmt.setInt(2, vc.getCategorias().getNcategoria());
            
            pstmt.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
            closeDataBase();
        }
    }
    
}
