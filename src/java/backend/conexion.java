/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author osdroix
 */
public class conexion {
     public static Connection getConnection(){


        Statement st = null;
        Connection con = null;
        String URL = "jdbc:mysql://localhost/vaquita?useSSL=false";
        String userName = "root";//Mi usuario
        String password = "";//Mi password


        try{

            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection(URL,userName,password); 
            st = con.createStatement();
            System.out.println("Se conecto a la base de datos");

        }catch(Exception e){

            System.out.println("No se conecto a la bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());

        }

        return con;

    } 

    static Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
