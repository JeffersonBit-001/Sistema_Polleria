/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConexionBD.ConexionBD;
import Modelo.Pedido;
import Modelo.Productos;
import Modelo.detalleClienteProd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class PedidoDao {

    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public String insertarPedido(float total, int id_cliente, String cod) {
        String respuesta = "";

        String sql = "INSERT INTO pedido ("
                + "id_usuario, total, codigo)  "
                + "VALUES (?, ?, ?) ";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id_cliente);
            ps.setFloat(2, total);
            ps.setString(3, cod);

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

    public int RecuperarPedido(String cod) {
        int id = 0;
        String sql = "select * from pedido where codigo = ?";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cod);
            rs = ps.executeQuery();

            if (rs.next()) {

                id = rs.getInt("id");

            }

        } catch (Exception e) {
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
        return id;
    }

    public void updateCarrito(String nomac, int id, int id_cliente) {

        String sql = "UPDATE " + nomac + " SET id_pedido = ?, estado = 'pagado' WHERE estado = 'pendiente' AND id_pedido = 1 AND id_usuario = ?";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id_cliente);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.toString());

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

    }

    public ArrayList<Pedido> obtenerPedido() {
        ArrayList<Pedido> pedido = new ArrayList<>();
        String sql = "SELECT \n"
                + "    ped.id AS pedId, \n"
                + "    ped.id_usuario AS idUs, \n"
                + "    CONCAT(cl.nombre, ' ', cl.apellido) AS nombresap,\n"
                + "    ped.total, \n"
                + "    ped.estado, \n"
                + "    ped.codigo, \n"
                + "    ped.fecha \n"
                + "FROM \n"
                + "    pedido ped\n"
                + "INNER JOIN \n"
                + "    clientes cl ON ped.id_usuario = cl.id\n";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                Pedido us = new Pedido();
                us.setId(rs.getInt("pedId"));
                us.setId_usuario(rs.getInt("idUs"));
                us.setNombre(rs.getString("nombresap"));
                us.setTotal(rs.getFloat("total"));
                us.setEstado(rs.getString("estado"));
                us.setCodigo(rs.getString("codigo"));
                us.setFecha(rs.getString("fecha"));

                pedido.add(us);
            }

        } catch (Exception e) {
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
        return pedido;
    }

    public Pedido obtenerPedido(int id) {

        String sql = "SELECT \n"
                + "    ped.id AS pedId, \n"
                + "    ped.id_usuario AS idUs, \n"
                + "    CONCAT(cl.nombre, ' ', cl.apellido) AS nombresap,\n"
                + "    ped.total, \n"
                + "    ped.estado, \n"
                + "    ped.codigo, \n"
                + "    ped.fecha \n"
                + "FROM \n"
                + "    pedido ped\n"
                + "INNER JOIN \n"
                + "    clientes cl ON ped.id_usuario = cl.id\n"
                + "WHERE \n"
                + "    ped.id = ?;";

        Pedido us = new Pedido();
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {

                us.setId(rs.getInt("pedId"));
                us.setId_usuario(rs.getInt("idUs"));
                us.setNombre(rs.getString("nombresap"));
                us.setTotal(rs.getFloat("total"));
                us.setEstado(rs.getString("estado"));
                us.setCodigo(rs.getString("codigo"));
                us.setFecha(rs.getString("fecha"));

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

    public String insertarPedido(float total, int id_cliente, String cod, String estado) {
        String respuesta = "";

        String sql = "INSERT INTO pedido ("
                + "id_usuario, total, codigo,estado)  "
                + "VALUES (?, ?, ?, ? ) ";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id_cliente);
            ps.setFloat(2, total);
            ps.setString(3, cod);
            ps.setString(4, estado);
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

    public String elimiPedido(int id) {

        String respuesta = "";
        String sql = "delete from pedido  WHERE id = ? ";

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

    public String actualizarPedido(int id_pedido, int id_usuario, float total, String estado) {
        String respuesta = "";

        String sql = "UPDATE pedido SET id_usuario = ?,"
                + "total = ?, estado = ? "
                + "WHERE id = ?";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
             ps.setInt(1, id_usuario);
            ps.setFloat(2, total);
            ps.setString(3, estado);
            ps.setInt(4, id_pedido);
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

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                // Manejo de excepción, si es necesario
            }
        }
        return respuesta;
    }

}
