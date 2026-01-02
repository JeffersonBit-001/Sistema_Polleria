/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.PedidoDao;
import DAO.UsuariosDao;
import Modelo.Pedido;
import Modelo.Productos;
import Modelo.Usuario;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author JEFFERSON
 */
public class ControladorDetallePedido extends HttpServlet {

    PedidoDao pedi = new PedidoDao();
    UsuariosDao usu = new UsuariosDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String tipoc = request.getParameter("tipoc");

        String nombreUsuario = "";
        String nombreFile = "";

        String mensaje = (String) request.getSession().getAttribute("mensaje");
        String result = (String) request.getSession().getAttribute("result");

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
            request.setAttribute("result", result);
            /*Limpiar SESIONES*/
            request.getSession().removeAttribute("mensaje");
            request.getSession().removeAttribute("result");
        }

        String accion = request.getParameter("accion");
        switch (tipoc) {

            case "AdministradorPedido":
                nombreUsuario = "Pedido";
                request.setAttribute("datos", pedi.obtenerPedido());
                request.setAttribute("datosCliente", usu.obtenerClientes("Clientes"));
                request.setAttribute("agregarModal", "agregarModalDetPedido");
                request.setAttribute("modificarModal", "modificarModalDetPedido");
                request.setAttribute("informacion", "Agregar Pedido");

                request.setAttribute("estados_contralador", "AdministradorPedido");
                request.setAttribute("titulo", nombreUsuario);

                if (accion != null) {
                    int id = 0;
                    if (request.getParameter("id") != null) {

                        id = Integer.parseInt(request.getParameter("id"));
                    }

                    switch (accion) {
                        case "agregar":

                            String nomb = request.getParameter("nombre2");
                            String abaste = request.getParameter("abastece2");

                            String prec = request.getParameter("estado2");

                            String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                            Random random = new Random();
                            StringBuilder codigo = new StringBuilder();

                            for (int i = 0; i < 10; i++) {
                                int indice = random.nextInt(caracteres.length());
                                codigo.append(caracteres.charAt(indice));
                            }

                            String cod = codigo.toString();

                            String agregar = pedi.insertarPedido(Float.parseFloat(abaste), 
                                    Integer.parseInt(nomb), cod,prec);

                            if (!agregar.equals("")) {
                                request.setAttribute("mensaje", "No se agregó el Pedido, Revisar los datos ");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Pedido Agregado " + nombreFile);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorDetallePedido?tipoc=AdministradorPedido");
                                return;
                            }
                            break;
                        case "delete":
                            /*ELIMINAR CLIENTE*/

                            String eliminar = pedi.elimiPedido(id);

                            if (!eliminar.equals("")) {
                                request.setAttribute("mensaje", "No se eliminó el Pedido");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Pedido Eliminado");
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorDetallePedido?tipoc=AdministradorPedido");
                                return;
                            }
                            break;

                        case "update":
                            /*UPDATE CLIENTE*/

                            Pedido conseguir = pedi.obtenerPedido(id);

                            response.setContentType("application/json");
                            PrintWriter out = response.getWriter();

                            String json = new Gson().toJson(conseguir);
                            out.print(json);
                            out.flush();
                            return;
                        case "update2":

                            String nomb2 = request.getParameter("nombre");
                            String abaste2 = request.getParameter("abastece");

                            String prec2 = request.getParameter("estado");

                            /*enctype="multipart/form-data"*/
                            String update = pedi.actualizarPedido(id, Integer.parseInt(nomb2), Float.parseFloat(abaste2)
                                    , prec2);

                            if (!update.equals("")) {
                                request.setAttribute("mensaje", "No se modificó el Pedido, Revisar los datos " + update);
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Pedido Modificado " + id);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorDetallePedido?tipoc=AdministradorPedido");
                                return;
                            }

                            break;
                        default:
                            throw new AssertionError();
                    }

                }

                request.getRequestDispatcher("/VistaAdministrador/AdmPedidos.jsp").forward(request, response);

                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
