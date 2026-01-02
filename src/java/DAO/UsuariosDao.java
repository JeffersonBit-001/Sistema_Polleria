/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConexionBD.ConexionBD;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class UsuariosDao {
    
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public String crearCuenta(String nomac,String nombre, String apellido, int dni, String usuario, String pass,String correo) {
        String respuesta = "";

        String sql = "INSERT INTO "+nomac+" (" 
                + "nombre,apellido,dni,usuario,correo,pass)  "
                + "VALUES (?, ?,?,?,?,?) ";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setInt(3, dni);
            ps.setString(4, usuario);
            ps.setString(5, correo);
            ps.setString(6, pass);

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

    
    
    
    
    public ArrayList<Usuario> obtenerClientes(String nombre) {
        ArrayList<Usuario> usuario = new ArrayList<>();
        String sql = "SELECT * FROM " + nombre + "";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId(rs.getInt("id"));
                us.setNombre(rs.getString("nombre"));
                us.setApellido(rs.getString("apellido"));
                us.setDni(rs.getInt("dni"));
                us.setUsuario(rs.getString("usuario"));
                us.setCorreo(rs.getString("correo"));
                us.setPass(rs.getString("pass"));

                usuario.add(us);
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
        return usuario;
    }
    
    public String eliminarCliente(int id, String nombre) {

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
    
    
    
    
    
    public String actualizarCliente(int id, String nomac,
            String nombre, String apellido, int dni, String genero, String correo, String pass) {

        String respuesta = "";
        String sql = "UPDATE " + nomac + " SET "
                + "    nombre = ?,"
                + "    apellido = ?,"
                + "    dni = ?,"
                + "    usuario = ?,"
                + "    correo = ?,"
                + "    pass = ? "
                + "WHERE id = ?;";


        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setInt(3, dni);
            ps.setString(4, genero);
            
            ps.setString(5, correo);
            ps.setString(6, pass);
            ps.setInt(7, id);

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

    
    public Usuario obtenerCliente(String nombre,int id) {

        String sql = "SELECT * FROM " + nombre + " where id = ?";
        Usuario us = new Usuario();
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {

                us.setId(rs.getInt("id"));
                us.setNombre(rs.getString("nombre"));
                us.setApellido(rs.getString("apellido"));
                us.setDni(rs.getInt("dni"));
                us.setUsuario(rs.getString("usuario"));
                
                us.setCorreo(rs.getString("correo"));
                us.setPass(rs.getString("pass"));

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
        return us;
    }

    
    
}
