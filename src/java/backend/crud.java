/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import entidades.productos;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author osdroix
 */
public class crud {
    
    public static int guardar(productos e){
        
        int estado = 0;
        try{
            Connection con = conexion.getConnection();
           String q="insert into productos (Id_producto,Id_buscador,Id_tipo_producto,Img_producto,Nom_producto,Des_producto,MXN_producto,MXN_producto_)values(?,?,?,?,?,?,?,?)";
            PreparedStatement set=con.prepareStatement(q);
            set.setInt(1, e.getId_producto());
            set.setInt(2, e.getId_buscador());
            set.setInt(3, e.getId_tipo_producto());
            set.setBlob(4, e.getImg());
            set.setString(5, e.getNom_producto());
            set.setString(6, e.getDes_producto());
            set.setFloat(7, e.getMXN_producto());
            set.setFloat(8, e.getMXN_producto_4());
            System.out.println("Tabla registro encontrada");
             estado = set.executeUpdate();
             
                System.out.print(e);
                con.close();
        }catch(Exception d){
            System.out.println("NO HAY TABLA  registro");
            System.out.println(d.getMessage());
            
                System.out.print(e);
            System.out.println(d.getStackTrace());
        }
        return estado;
    
    }
    public static ArrayList<productos> productos(String i){
        
        ArrayList<productos> productos = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from productos where Id_tipo_producto like '"+i+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                productos u = new productos();
                u.setId_producto(rs.getInt("Id_producto"));
                u.setId_buscador(rs.getInt("Id_buscador"));
                u.setId_tipo_producto(rs.getInt("Id_tipo_producto"));
                u.setNom_producto(rs.getString("Nom_producto"));
                u.setDes_producto(rs.getString("Des_producto"));
                u.setMXN_producto(rs.getFloat("MXN_producto"));
                u.setMXN_producto_4(rs.getFloat("MXN_producto_"));
                productos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            
            System.out.println(e.getMessage()+"Quezo");
            System.out.println(e.getStackTrace()+"Quezo3");
            
        }
        
        return productos;
     }
    public static ArrayList<productos> productosEdit(String i){
        
        ArrayList<productos> productos = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from productos where Id_producto like '"+i+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                productos u = new productos();
                u.setId_producto(rs.getInt("Id_producto"));
                u.setId_buscador(rs.getInt("Id_buscador"));
                u.setId_tipo_producto(rs.getInt("Id_tipo_producto"));
                u.setNom_producto(rs.getString("Nom_producto"));
                u.setDes_producto(rs.getString("Des_producto"));
                u.setMXN_producto(rs.getFloat("MXN_producto"));
                u.setMXN_producto_4(rs.getFloat("MXN_producto_"));
                productos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            
            System.out.println(e.getMessage()+"Quezo");
            System.out.println(e.getStackTrace()+"Quezo3");
            
        }
        
        return productos;
     }
    public static ArrayList<productos> productosnom(String nom){
        
        ArrayList<productos> productos = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from productos where Nom_producto like '"+nom+"'";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                productos u = new productos();
                u.setId_producto(rs.getInt("Id_producto"));
                u.setId_buscador(rs.getInt("Id_buscador"));
                u.setId_tipo_producto(rs.getInt("Id_tipo_producto"));
                u.setNom_producto(rs.getString("Nom_producto"));
                u.setDes_producto(rs.getString("Des_producto"));
                u.setMXN_producto(rs.getFloat("MXN_producto"));
                u.setMXN_producto_4(rs.getFloat("MXN_producto_"));
                productos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            
            System.out.println(e.getMessage()+"Quezo");
            System.out.println(e.getStackTrace()+"Quezo3");
            
        }
        
        return productos;
     }
    public static ArrayList<productos> Vistaproductos(){
        
        ArrayList<productos> productos = new ArrayList();
        
        try{
            Connection c = conexion.getConnection();
            
            String x = "select * from productos";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
            while (rs.next()) {
                productos u = new productos();
                u.setId_producto(rs.getInt("Id_producto"));
                u.setId_buscador(rs.getInt("Id_buscador"));
                u.setId_tipo_producto(rs.getInt("Id_tipo_producto"));
                u.setNom_producto(rs.getString("Nom_producto"));
                u.setDes_producto(rs.getString("Des_producto"));
                u.setMXN_producto(rs.getFloat("MXN_producto"));
                u.setMXN_producto_4(rs.getFloat("MXN_producto_"));
                productos.add(u);
            }
            c.close();
            
        }catch(Exception e){
            
            System.out.println(e.getMessage()+"Quezo");
            System.out.println(e.getStackTrace()+"Quezo3");
            
        }
        
        return productos;
     }
    public void Listaimg(int id, HttpServletResponse response){
        
         PreparedStatement ps;
         ResultSet rs;
         String x = "select * from productos where Id_producto like '"+id+"'";  
         InputStream inputStream=null;
         OutputStream outputStream=null;
         BufferedInputStream bufferedInputStream=null;
         BufferedOutputStream bufferedOutputStream=null;
         response.setContentType("Img/*");
         try{
             outputStream = response.getOutputStream();
             Connection c = conexion.getConnection();                                  
             ps = c.prepareStatement(x);
             rs =ps.executeQuery();
             if(rs.next()){
                 inputStream=rs.getBinaryStream("Img_producto");
             }
             bufferedInputStream = new BufferedInputStream(inputStream);
             bufferedOutputStream = new BufferedOutputStream(outputStream);
             int i=0;
             while((i=bufferedInputStream.read())!=-1){
                bufferedOutputStream.write(i);
            }
         }catch(Exception e){
         }
    }
}
