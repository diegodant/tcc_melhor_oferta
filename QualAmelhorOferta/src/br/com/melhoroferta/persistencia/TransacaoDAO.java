/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.melhoroferta.persistencia;

import br.com.melhoroferta.entidades.Transacao;
//import java.util.ArrayList;
//import java.util.List;
/**
 *
 * @author bruno-sigo
 */
public class TransacaoDAO extends DAO {

    public Integer trazTransDisponivel(){
        Transacao trans = new Transacao();

        try {
            openDataBase();

            pstmt = con.prepareStatement("select max(idtransacao)+1 codtrans from transacao ");
            rs = pstmt.executeQuery();

            if(rs.next()){
                trans.setIdtransacao(rs.getInt("codtrans"));
            }else{
                trans.setIdtransacao(1);
            }
            rs.close();
            pstmt.close();


        } catch (Exception e) {
            e.getMessage();
        }finally{
//            closeDataBase();
        }

        return trans.getIdtransacao();
    }


}

