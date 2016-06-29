package br.com.melhoroferta.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	
	//Responsavel pela conexao com a base da dados
	Connection con =null;
	//responsavel em gerar os comandos sql da query
	PreparedStatement pstmt =null;
	//funciona como cursor / usado pra resgatar os valores dos campos da tabela
	ResultSet rs=null;
	//teste
	public void openDataBase(){
		//>>>>>>>>>>>>>>>>>>>>>> BANCO DE DADOS LOCALWEB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                String url ="jdbc:mysql://187.45.196.162/qualamelhorofe?autoReconnect=true";
		String user="qualamelhorofe";
		String password="m3lh0r0f3rt@";
                
                //>>>>>>>>>>>>>>>>>>>>>> BANCO DE DADOS LOCAL<<<<<<<<<<<<<<<<<<<<<<<<<<<<<      
               
               //String user="melhoroferta";
               // String password="caldeira";

//                String url ="jdbc:mysql://localhost:3306/qualamelhorofe?autoReconnect=true";
//		String user="root";
//		String password="181287";
            
		try {
			Class.forName("com.mysql.jdbc.Driver");
                        DriverManager.setLoginTimeout(10);
			con = DriverManager.getConnection(url, user, password);
			
			
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("Erro ao conectar ao banco "+e.getMessage());
		}
	}
	
	public void closeDataBase(){
		try {
			
			if(con != null)
				con.close();
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
