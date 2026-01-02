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
import javax.swing.JOptionPane;

/**
 *
 * @author JEFFERSON
 */
public class LoginDao {

    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String crearCuenta(String nombre, String apellido, int dni, String usuario, String pass,String correo) {
        String respuesta = "";

        String sql = "INSERT INTO clientes ("
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

    public String IngresarLoginUsuario(Usuario us) {

        try {
            // Consulta para buscar en la tabla "clientes"
            String consulta = "SELECT * FROM clientes WHERE usuario = '"+us.getUsuario()+"' AND correo = '"+us.getCorreo()+"'"
                    + " AND pass = '"+us.getPass()+"'";
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(consulta);
            //ps.setString(1, us.getUsuario());
            //ps.setString(2, us.getCorreo());
            //ps.setString(3, us.getPass());

            rs = ps.executeQuery();

            if (rs.next()) {
                us.setId(rs.getInt("id"));
                us.setNombre(rs.getString("nombre"));
                us.setApellido(rs.getString("apellido"));
                us.setDni(rs.getInt("dni"));
                us.setUsuario(rs.getString("usuario"));
                us.setPass(rs.getString("pass"));
                us.setCorreo(rs.getString("correo"));
                return "clientes";
            } else {
                // Consulta para buscar en la tabla "usuarios"
                String consulta2 = "SELECT * FROM USUARIOS WHERE usuario = '"+us.getUsuario()+"' AND correo = '"+us.getCorreo()+"'"
                    + " AND pass = '"+us.getPass()+"'";
                ps = cn.prepareStatement(consulta2);
                //ps.setString(1, us.getUsuario());
                //ps.setString(2, us.getCorreo());
                //ps.setString(3, us.getPass());

                rs = ps.executeQuery();
                if (rs.next()) {
                    us.setId(rs.getInt("id"));
                    us.setNombre(rs.getString("nombre"));
                    us.setApellido(rs.getString("apellido"));
                    us.setUsuario(rs.getString("usuario"));
                    us.setDni(rs.getInt("dni"));
                    us.setPass(rs.getString("pass"));
                    us.setCorreo(rs.getString("correo"));
                    return "usuarios";
                }
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.toString());
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return "";
    }

}
