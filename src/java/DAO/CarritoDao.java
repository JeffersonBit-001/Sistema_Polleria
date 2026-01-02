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
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class CarritoDao {

    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String insertarCarrito(String nomac, int id, int id_cliente) {
        String respuesta = "";
        
        String sql = "INSERT INTO " + nomac + " ("
                + "id_p,id_usuario)  "
                + "VALUES (?, ?) ";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id_cliente);

            ps.executeUpdate();

            respuesta = "";
        } catch (SQLException e) {
            System.out.println(e.toString());
            respuesta = "error:" + e.toString();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        return respuesta;

    }

    
    
    
    
    
    

    
    public ArrayList<Productos> obtenerCarrito(String nom, String inner, int id){
    ArrayList<Productos> productos = new ArrayList<>();
    String sql = "select pro.id ,pro.nombre, pro.descripcion, pro.imagen, pro.precio, count(*) as cant from "+nom+" carr " +
                "inner join "+ inner +" pro " +
                "on carr.id_p = pro.id " +
                " where carr.id_usuario = ? and carr.estado = 'pendiente' "
            + " "
            + "group by id_p "
            + "order by pro.nombre asc";
    
        try {
            cn= ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Productos com=new Productos();
                com.setId(rs.getInt("id"));
                com.setNombre(rs.getString("nombre"));
                com.setDescripcion(rs.getString("descripcion"));
                com.setPrecio(rs.getFloat("precio"));
                com.setImagen(rs.getString("imagen"));
                com.setCantidad(rs.getInt("cant"));
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
    
    public String eliminarCarrito(String nomac, int id, int id_usuario) {
        String respuesta = "";
        
            String sql = "DELETE FROM " + nomac + " WHERE id_p = ? AND id_usuario = ? and estado = 'pendiente' LIMIT 1;";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id_usuario);

            ps.executeUpdate();

            respuesta = "";
        } catch (SQLException e) {
            System.out.println(e.toString());
            respuesta = "error:" + e.toString();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        return respuesta;

    }

    
}
