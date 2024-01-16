/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.InputStream;

/**
 *
 * @author osdroix
 */
public class productos {
    private String Nom_producto, Des_producto;
    private int Id_producto,Id_buscador,Id_tipo_producto;
    private float MXN_producto,MXN_producto_4;
    private InputStream Img;

    public String getNom_producto() {
        return Nom_producto;
    }

    public void setNom_producto(String Nom_producto) {
        this.Nom_producto = Nom_producto;
    }

    public String getDes_producto() {
        return Des_producto;
    }

    public void setDes_producto(String Des_producto) {
        this.Des_producto = Des_producto;
    }

    public int getId_producto() {
        return Id_producto;
    }

    public void setId_producto(int Id_producto) {
        this.Id_producto = Id_producto;
    }

    public int getId_buscador() {
        return Id_buscador;
    }

    public void setId_buscador(int Id_buscador) {
        this.Id_buscador = Id_buscador;
    }

    public int getId_tipo_producto() {
        return Id_tipo_producto;
    }

    public void setId_tipo_producto(int Id_tipo_producto) {
        this.Id_tipo_producto = Id_tipo_producto;
    }

 

  

    public InputStream getImg() {
        return Img;
    }

    public void setImg(InputStream Img) {
        this.Img = Img;
    }

    public float getMXN_producto() {
        return MXN_producto;
    }

    public void setMXN_producto(float MXN_producto) {
        this.MXN_producto = MXN_producto;
    }

    public float getMXN_producto_4() {
        return MXN_producto_4;
    }

    public void setMXN_producto_4(float MXN_producto_4) {
        this.MXN_producto_4 = MXN_producto_4;
    }

  


}
