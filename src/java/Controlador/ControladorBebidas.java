/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.BebidasDao;
import DAO.ComplementosDao;
import DAO.ProductosDao;
import DAO.ProductosGeneralDao;
import DAO.PromocionesDao;
import Modelo.Productos;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author JEFFERSON
 */
@MultipartConfig
public class ControladorBebidas extends HttpServlet {

    BebidasDao beb = new BebidasDao();
    ProductosGeneralDao prodGen = new ProductosGeneralDao();
    ProductosDao prodDao = new ProductosDao();
    ComplementosDao comp = new ComplementosDao();
    PromocionesDao promo = new PromocionesDao();

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

            case "AdministradorBebidas":
                nombreUsuario = "Bebidas";
                request.setAttribute("datos", beb.obtenerProductos());
                request.setAttribute("agregarModal", "agregarModalBebidas");
                request.setAttribute("modificarModal", "modificarModalBebidas");
                request.setAttribute("informacion", "Agregar Bebidas");

                request.setAttribute("estados_contralador", "AdministradorBebidas");
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

                            String prec = request.getParameter("precio2");

                            try {
                                Part filePart = request.getPart("imagen2");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }

                            String agregar = prodGen.insertar(nombreUsuario, nomb,
                                    abaste, Float.parseFloat(prec), String.valueOf(nombreFile));

                            if (!agregar.equals("")) {
                                request.setAttribute("mensaje", "No se agregó el cliente, Revisar los datos ");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Agregado " + nombreFile);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorBebidas");
                                return;
                            }
                            break;
                        case "delete":
                            /*ELIMINAR CLIENTE*/

                            String eliminar = prodGen.eliminar(id, nombreUsuario);

                            if (!eliminar.equals("")) {
                                request.setAttribute("mensaje", "No se eliminó el Combo");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Eliminado");
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorBebidas");
                                return;
                            }
                            break;

                        case "update":
                            /*UPDATE CLIENTE*/

                            Productos conseguir = prodGen.obtener(nombreUsuario, id);

                            response.setContentType("application/json");
                            PrintWriter out = response.getWriter();

                            String json = new Gson().toJson(conseguir);
                            out.print(json);
                            out.flush();
                            return;
                        case "update2":

                            String nomb2 = request.getParameter("nombre");
                            String abaste2 = request.getParameter("abastece");

                            String prec2 = request.getParameter("precio");
                            String sinops2 = request.getParameter("sinopsis");

                            String oferta2 = request.getParameter("oferta");

                            try {
                                Part filePart = request.getPart("imagen");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }
                            /*enctype="multipart/form-data"*/

                            String update = prodGen.actualizar(id, nombreUsuario, nomb2, abaste2, Float.parseFloat(prec2),
                                    String.valueOf(nombreFile));

                            if (!update.equals("")) {
                                request.setAttribute("mensaje", "No se modificó el Combo, Revisar los datos " + update);
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Modificado " + id);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorBebidas");
                                return;
                            }

                            break;
                        default:
                            throw new AssertionError();
                    }

                }

                request.getRequestDispatcher("/VistaAdministrador/AdmCombo.jsp").forward(request, response);

                break;

            case "AdministradorProductos":

                nombreUsuario = "Administrar Productos";

                nombreUsuario = "Productos";
                request.setAttribute("datos", prodDao.obtenerProductos());
                request.setAttribute("agregarModal", "agregarModalProductos");
                request.setAttribute("modificarModal", "modificarModalProductos");
                request.setAttribute("informacion", "Agregar Productos");

                request.setAttribute("estados_contralador", "AdministradorProductos");
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

                            String prec = request.getParameter("precio2");

                            try {
                                Part filePart = request.getPart("imagen2");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }

                            String agregar = prodGen.insertar(nombreUsuario, nomb,
                                    abaste, Float.parseFloat(prec), String.valueOf(nombreFile));

                            if (!agregar.equals("")) {
                                request.setAttribute("mensaje", "No se agregó el cliente, Revisar los datos ");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Agregado " + nombreFile);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorProductos");
                                return;
                            }
                            break;
                        case "delete":
                            /*ELIMINAR CLIENTE*/

                            String eliminar = prodGen.eliminar(id, nombreUsuario);

                            if (!eliminar.equals("")) {
                                request.setAttribute("mensaje", "No se eliminó el Combo");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Eliminado");
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorProductos");
                                return;
                            }
                            break;

                        case "update":
                            /*UPDATE CLIENTE*/

                            Productos conseguir = prodGen.obtener(nombreUsuario, id);

                            response.setContentType("application/json");
                            PrintWriter out = response.getWriter();

                            String json = new Gson().toJson(conseguir);
                            out.print(json);
                            out.flush();
                            return;
                        case "update2":

                            String nomb2 = request.getParameter("nombre");
                            String abaste2 = request.getParameter("abastece");

                            String prec2 = request.getParameter("precio");
                            String sinops2 = request.getParameter("sinopsis");

                            String oferta2 = request.getParameter("oferta");

                            try {
                                Part filePart = request.getPart("imagen");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }
                            /*enctype="multipart/form-data"*/

                            String update = prodGen.actualizar(id, nombreUsuario, nomb2, abaste2, Float.parseFloat(prec2),
                                    String.valueOf(nombreFile));

                            if (!update.equals("")) {
                                request.setAttribute("mensaje", "No se modificó el Combo, Revisar los datos " + update);
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Modificado " + id);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorProductos");
                                return;
                            }

                            break;
                        default:
                            throw new AssertionError();
                    }

                }

                request.getRequestDispatcher("/VistaAdministrador/AdmCombo.jsp").forward(request, response);

                break;

            case "AdministradorComplementos":

                nombreUsuario = "Administrar Complementos";

                nombreUsuario = "Complementos";
                request.setAttribute("datos", comp.obtenerProductos());
                request.setAttribute("agregarModal", "agregarModalComplementos");
                request.setAttribute("modificarModal", "modificarModalComplementos");
                request.setAttribute("informacion", "Agregar Complementos");

                request.setAttribute("estados_contralador", "AdministradorComplementos");
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

                            String prec = request.getParameter("precio2");

                            try {
                                Part filePart = request.getPart("imagen2");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }

                            String agregar = prodGen.insertar(nombreUsuario, nomb,
                                    abaste, Float.parseFloat(prec), String.valueOf(nombreFile));

                            if (!agregar.equals("")) {
                                request.setAttribute("mensaje", "No se agregó el cliente, Revisar los datos ");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Agregado " + nombreFile);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorComplementos");
                                return;
                            }
                            break;
                        case "delete":
                            /*ELIMINAR CLIENTE*/

                            String eliminar = prodGen.eliminar(id, nombreUsuario);

                            if (!eliminar.equals("")) {
                                request.setAttribute("mensaje", "No se eliminó el Combo");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Eliminado");
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorComplementos");
                                return;
                            }
                            break;

                        case "update":
                            /*UPDATE CLIENTE*/

                            Productos conseguir = prodGen.obtener(nombreUsuario, id);

                            response.setContentType("application/json");
                            PrintWriter out = response.getWriter();

                            String json = new Gson().toJson(conseguir);
                            out.print(json);
                            out.flush();
                            return;
                        case "update2":

                            String nomb2 = request.getParameter("nombre");
                            String abaste2 = request.getParameter("abastece");

                            String prec2 = request.getParameter("precio");
                            String sinops2 = request.getParameter("sinopsis");

                            String oferta2 = request.getParameter("oferta");

                            try {
                                Part filePart = request.getPart("imagen");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }
                            /*enctype="multipart/form-data"*/

                            String update = prodGen.actualizar(id, nombreUsuario, nomb2, abaste2, Float.parseFloat(prec2),
                                    String.valueOf(nombreFile));

                            if (!update.equals("")) {
                                request.setAttribute("mensaje", "No se modificó el Combo, Revisar los datos " + update);
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Modificado " + id);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorComplementos");
                                return;
                            }

                            break;
                        default:
                            throw new AssertionError();
                    }

                }

                request.getRequestDispatcher("/VistaAdministrador/AdmCombo.jsp").forward(request, response);

                break;

            case "AdministradorPromociones":

                nombreUsuario = "Administrar Promociones";

                nombreUsuario = "Promociones";
                request.setAttribute("datos", promo.obtenerProductos());
                request.setAttribute("agregarModal", "agregarModalPromociones");
                request.setAttribute("modificarModal", "modificarModalPromociones");
                request.setAttribute("informacion", "Agregar Promociones");

                request.setAttribute("estados_contralador", "AdministradorPromociones");
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

                            String prec = request.getParameter("precio2");

                            try {
                                Part filePart = request.getPart("imagen2");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }

                            String agregar = prodGen.insertar(nombreUsuario, nomb,
                                    abaste, Float.parseFloat(prec), String.valueOf(nombreFile));

                            if (!agregar.equals("")) {
                                request.setAttribute("mensaje", "No se agregó el cliente, Revisar los datos ");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Agregado " + nombreFile);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorPromociones");
                                return;
                            }
                            break;
                        case "delete":
                            /*ELIMINAR CLIENTE*/

                            String eliminar = prodGen.eliminar(id, nombreUsuario);

                            if (!eliminar.equals("")) {
                                request.setAttribute("mensaje", "No se eliminó el Combo");
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Eliminado");
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorPromociones");
                                return;
                            }
                            break;

                        case "update":
                            /*UPDATE CLIENTE*/

                            Productos conseguir = prodGen.obtener(nombreUsuario, id);

                            response.setContentType("application/json");
                            PrintWriter out = response.getWriter();

                            String json = new Gson().toJson(conseguir);
                            out.print(json);
                            out.flush();
                            return;
                        case "update2":

                            String nomb2 = request.getParameter("nombre");
                            String abaste2 = request.getParameter("abastece");

                            String prec2 = request.getParameter("precio");
                            String sinops2 = request.getParameter("sinopsis");

                            String oferta2 = request.getParameter("oferta");

                            try {
                                Part filePart = request.getPart("imagen");

                                nombreFile = filePart.getSubmittedFileName();
                                if (nombreFile == null || nombreFile.isEmpty()) {
                                    throw new ServletException("No se ha subido ningún archivo.");
                                }

                                String uploadPath = getServletContext().getRealPath("/img");
                                File uploadDir = new File(uploadPath);
                                if (!uploadDir.exists()) {
                                    uploadDir.mkdirs();
                                }

                                File file = new File(uploadDir, nombreFile);
                                filePart.write(file.getAbsolutePath());

                            } catch (Exception e) {

                            }
                            /*enctype="multipart/form-data"*/

                            String update = prodGen.actualizar(id, nombreUsuario, nomb2, abaste2, Float.parseFloat(prec2),
                                    String.valueOf(nombreFile));

                            if (!update.equals("")) {
                                request.setAttribute("mensaje", "No se modificó el Combo, Revisar los datos " + update);
                                request.setAttribute("result", "error");
                            } else {
                                request.getSession().setAttribute("mensaje", "Combo Modificado " + id);
                                request.getSession().setAttribute("result", "ok");
                                response.sendRedirect("ControladorBebidas?tipoc=AdministradorPromociones");
                                return;
                            }

                            break;
                        default:
                            throw new AssertionError();
                    }

                }

                request.getRequestDispatcher("/VistaAdministrador/AdmCombo.jsp").forward(request, response);

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
