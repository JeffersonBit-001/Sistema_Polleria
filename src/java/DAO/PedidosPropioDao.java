/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConexionBD.ConexionBD;
import Modelo.Productos;
import Modelo.detalleClienteProd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class PedidosPropioDao {
    
    
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    
    
    public ArrayList<detalleClienteProd> obtenerProductos(int id_cliente) {
    ArrayList<detalleClienteProd> detalle = new ArrayList<>();
    String sql = "SELECT ped.id AS pedId, " +
                 "beb.id AS id_be, beb.nombre AS nombeb, beb.imagen AS bebimg, beb.precio AS bebpre, " +
                 "com.id AS id_com, com.nombre AS nomcom, com.imagen AS comimg, com.precio AS compre, " +
                 "prom.id AS id_prom, prom.nombre AS promnom, prom.imagen AS promimg, prom.precio AS prompre, " +
                 "prod.id AS id_prod, prod.nombre AS prodnom, prod.imagen AS prodimg, prod.precio AS prodpre, " +
                 "COUNT(*) AS tot, ped.total as tot_ped " +
                 "FROM pedido ped " +
                 "LEFT JOIN carrito_bebidas carb ON ped.id = carb.id_pedido " +
                 "LEFT JOIN carrito_complementos carrcm ON ped.id = carrcm.id_pedido " +
                 "LEFT JOIN carrito_productos carprod ON ped.id = carprod.id_pedido " +
                 "LEFT JOIN carrito_promos carpro ON ped.id = carpro.id_pedido " +
                 "LEFT JOIN clientes cl ON ped.id_usuario = cl.id " +
                 "LEFT JOIN bebidas beb ON carb.id_p = beb.id " +
                 "LEFT JOIN complementos com ON carrcm.id_p = com.id " +
                 "LEFT JOIN promociones prom ON carpro.id_p = prom.id " +
                 "LEFT JOIN productos prod ON carprod.id_p = prod.id " +
                 "WHERE cl.id = ? AND (carb.estado = 'pagado' OR carpro.estado = 'pagado' OR " +
                 "carprod.estado = 'pagado' OR carrcm.estado = 'pagado') " +
                 "GROUP BY ped.id, beb.id, com.id, prom.id, prod.id order by ped.id desc";


    try {
        cn = ConexionBD.getConexion();
        ps = cn.prepareStatement(sql);
        ps.setInt(1, id_cliente);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            detalleClienteProd com = new detalleClienteProd();
            com.setId(rs.getInt("pedId"));
            com.setIdbebida(rs.getInt("id_be"));
            com.setNombebida(rs.getString("nombeb"));
            com.setBebidaImg(rs.getString("bebimg"));
            com.setBebidaprecio(rs.getFloat("bebpre"));
            
            com.setId_complemento(rs.getInt("id_com"));
            com.setNomcomplemento(rs.getString("nomcom"));
            com.setComplementoImg(rs.getString("comimg"));
            com.setComplementoprecio(rs.getFloat("compre"));
            
            com.setId_prom(rs.getInt("id_prom"));
            com.setPromonom(rs.getString("promnom"));
            com.setPromoImg(rs.getString("promimg")); // Ajustado
            com.setPromoPrecio(rs.getFloat("prompre")); // Ajustado
            
            com.setId_prod(rs.getInt("id_prod"));
            com.setProd_nom(rs.getString("prodnom"));
            com.setProductoImg(rs.getString("prodimg")); // Ajustado
            com.setProductoPrecio(rs.getFloat("prodpre")); // Ajustado
            
            com.setTotal(rs.getInt("tot_ped"));
            
            detalle.add(com);
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (cn != null) cn.close();
        } catch (Exception e) {
            e.printStackTrace(); // Opcional: Manejo de errores al cerrar
        }
    }
    
    return detalle;
}

    
    
    
    
    
    
}
