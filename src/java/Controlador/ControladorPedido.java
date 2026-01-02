/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.PedidoDao;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JEFFERSON
 */
public class ControladorPedido extends HttpServlet {

    PedidoDao pedi = new PedidoDao();

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

        String accion = request.getParameter("accion_tot");
        String valor = request.getParameter("total_valor");

        String valor_form = request.getParameter("form_pago_tot");

        if (accion != null) {
            if (accion.equals("total")) {

                request.setAttribute("valor_total_input", valor);
                request.getRequestDispatcher("/Vista/FormPago.jsp").forward(request, response);

            }
        }

        if (valor_form != null) {
            HttpSession session = request.getSession();
            Usuario us = (Usuario) session.getAttribute("usuario");

            String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = new Random();
            StringBuilder codigo = new StringBuilder();

            for (int i = 0; i < 10; i++) {
                int indice = random.nextInt(caracteres.length());
                codigo.append(caracteres.charAt(indice));
            }

            String cod = codigo.toString();

            String valor3 = request.getParameter("pago-total");

            us.setCodig_form(cod);

            pedi.insertarPedido(Float.parseFloat(valor3), us.getId(), cod);

            us.setCodigo(pedi.RecuperarPedido(cod));
            System.out.println(us.getCodigo());

            pedi.updateCarrito("carrito_productos", us.getCodigo(), us.getId());
            pedi.updateCarrito("carrito_bebidas", us.getCodigo(), us.getId());
            pedi.updateCarrito("carrito_promos", us.getCodigo(), us.getId());
            pedi.updateCarrito("carrito_complementos", us.getCodigo(), us.getId());
            
            request.getSession().setAttribute("mensaje", "Pago Exitoso");
            request.getSession().setAttribute("result", "ok");

            response.sendRedirect("/Chicken/Main.jsp");
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
