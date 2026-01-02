/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConexionBD.ConexionBD;
import Modelo.Productos;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JEFFERSON
 */
public class ProductosGeneralDao {
    
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public String insertar(String nomac,String nombre, String descripcion, float precio, String imagen) {
        String respuesta = "";

        String sql = "INSERT INTO "+nomac+" (" 
                + "nombre,descripcion,precio,imagen)  "
                + "VALUES (?, ?, ?, ?) ";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setFloat(3, precio);
            ps.setString(4, imagen);

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

    public String eliminar(int id, String nombre) {

        String respuesta = "";
        String sql = "delete from " + nombre + "  WHERE id = ? ";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);

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
    
    
    
    public Productos obtener(String nombre,int id) {

        String sql = "SELECT * FROM " + nombre + " where id = ?";
        Productos pro = new Productos();
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {

                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setImagen(rs.getString("imagen"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
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
            } catch (Exception e) {

            }
        }
        return pro;
    }
    
    
    public String actualizar(int id, String nomac,
            String nombre, String descripcion, float precio, String imagen) {

        String respuesta = "";
        String sql = "UPDATE " + nomac + " SET "
                + "    nombre = ?,"
                + "    descripcion = ?,"
                + "    precio = ?,"
                + "    imagen = ? "
                + "WHERE id = ?;";


        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, descripcion);
            ps.setFloat(3, precio);
            ps.setString(4, imagen);
            ps.setInt(5, id);

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
