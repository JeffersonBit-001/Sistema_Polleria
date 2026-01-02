/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConexionBD.ConexionBD;
import Modelo.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class ProductosDao {
    
    private Connection cn=null;

    
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    
    
    public ArrayList<Productos> obtenerProductos(){
    ArrayList<Productos> productos = new ArrayList<>();
    String sql = "select * from productos ";
    
        try {
            cn= ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                Productos com=new Productos();
                com.setId(rs.getInt("id"));
                com.setNombre(rs.getString("nombre"));
                com.setDescripcion(rs.getString("descripcion"));
                com.setPrecio(rs.getFloat("precio"));
                com.setImagen(rs.getString("imagen"));
                
                productos.add(com);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(cn !=null){
                    cn.close();
                }
                
                if (rs != null){
                    rs.close();
                }
                
                if(ps != null){
                    ps.close();
                }
            } catch (Exception e) {
                
            }
        }
    return productos;
    }
    
    
    
    
}
