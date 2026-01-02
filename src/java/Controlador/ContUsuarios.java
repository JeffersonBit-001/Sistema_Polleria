/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.UsuariosDao;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;


/**
 *
 * @author JEFFERSON
 */
public class ContUsuarios extends HttpServlet {

    UsuariosDao cli = new UsuariosDao();

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
        /*MENSAJES*/
        int dni = 0;
        int cel = 0;
        int estado = 0;
        String nombre = "";
        String apellido = "";

        String genero = "";
        String fecha = "";

        String domicilio = "";
        String correo = "";
        String correoc = "";
        String pass = "";
        String passc = "";
        String nombreUsuario = "";
        String mensaje = (String) request.getSession().getAttribute("mensaje");
        String result = (String) request.getSession().getAttribute("result");

        if (mensaje != null) {
            request.setAttribute("mensaje", mensaje);
            request.setAttribute("result", result);
            /*Limpiar SESIONES*/
            request.getSession().removeAttribute("mensaje");
            request.getSession().removeAttribute("result");
        }

        String tipoc = request.getParameter("tipoc");
        String accion = request.getParameter("accion");

        if (tipoc != null) {

            switch (tipoc) {
                case "AdministradorClientes":

                    nombreUsuario = "Clientes";

                    request.setAttribute("datos", cli.obtenerClientes(nombreUsuario));
                    request.setAttribute("agregarModal", "agregarModalCliente");
                    request.setAttribute("modificarModal", "modificarModalCliente");
                    request.setAttribute("informacion", "Agregar Cliente");
                    request.setAttribute("estados_contralador", "AdministradorClientes");
                    request.setAttribute("titulo", nombreUsuario);
                    
                    if (accion != null) {
                        int id = 0;
                        if (request.getParameter("id") != null) {

                            id = Integer.parseInt(request.getParameter("id"));
                        }

                        switch (accion) {
                            case "agregar":

                                nombre = request.getParameter("nombres2");
                                apellido = request.getParameter("apellidos2");

                                genero = request.getParameter("genero2");
                                fecha = request.getParameter("fecha2");

                                domicilio = request.getParameter("domicilio2");
                                correo = request.getParameter("correo2");
                                correoc = request.getParameter("correo_confirm2");
                                pass = request.getParameter("pass2");
                                passc = request.getParameter("pass_confirm2");

                                try {
                                    dni = Integer.parseInt(request.getParameter("dni2"));
                                    cel = Integer.parseInt(request.getParameter("cel2"));
                                    estado = Integer.parseInt(request.getParameter("estado2"));
                                } catch (NumberFormatException e) {

                                } catch (Exception e) {

                                }

                                
                                break;

                            case "delete":
                                /*ELIMINAR CLIENTE*/
                                
                                break;

                            case "update":
                                /*UPDATE CLIENTE*/

                                
                                return;

                            case "update2":
                                nombre = request.getParameter("nombres");
                                apellido = request.getParameter("apellidos");

                                genero = request.getParameter("genero");
                                fecha = request.getParameter("fecha");

                                domicilio = request.getParameter("domicilio");
                                correo = request.getParameter("correo");
                                correoc = request.getParameter("correo_confirm");
                                pass = request.getParameter("pass");
                                passc = request.getParameter("pass_confirm");

                                try {
                                    dni = Integer.parseInt(request.getParameter("dni"));
                                    cel = Integer.parseInt(request.getParameter("cel"));
                                    estado = Integer.parseInt(request.getParameter("estado"));
                                } catch (NumberFormatException e) {

                                } catch (Exception e) {

                                }

                                

                                break;
                            default:
                                throw new AssertionError();
                        }

                    }

                    break;

                case "AdministradorUsuarios":
                    nombreUsuario = "Usuarios";

                    request.setAttribute("datos", cli.obtenerClientes(nombreUsuario));
                    request.setAttribute("agregarModal", "agregarModalUsuario");
                    request.setAttribute("modificarModal", "modificarModalUsuario");
                    request.setAttribute("informacion", "Agregar Empleado");
                    request.setAttribute("estados_contralador", "AdministradorUsuarios");
                    request.setAttribute("titulo", "Empleados");

                    
                    if (accion != null) {
                        int id = 0;
                        if (request.getParameter("id") != null) {

                            id = Integer.parseInt(request.getParameter("id"));
                        }

                        switch (accion) {
                            case "agregar":

                                nombre = request.getParameter("nombres2");
                                apellido = request.getParameter("apellidos2");

                                genero = request.getParameter("genero2");
                                fecha = request.getParameter("fecha2");

                                domicilio = request.getParameter("domicilio2");
                                correo = request.getParameter("correo2");
                                correoc = request.getParameter("correo_confirm2");
                                pass = request.getParameter("pass2");
                                passc = request.getParameter("pass_confirm2");

                                try {
                                    dni = Integer.parseInt(request.getParameter("dni2"));
                                    cel = Integer.parseInt(request.getParameter("cel2"));
                                    estado = Integer.parseInt(request.getParameter("estado2"));
                                } catch (NumberFormatException e) {

                                } catch (Exception e) {

                                }
                                
                                break;

                            case "delete":
                                /*ELIMINAR CLIENTE*/
                                

                            case "update":
                                /*UPDATE CLIENTE*/

                                

                            case "update2":
                                nombre = request.getParameter("nombres");
                                apellido = request.getParameter("apellidos");

                                genero = request.getParameter("genero");
                                fecha = request.getParameter("fecha");

                                domicilio = request.getParameter("domicilio");
                                correo = request.getParameter("correo");
                                correoc = request.getParameter("correo_confirm");
                                pass = request.getParameter("pass");
                                passc = request.getParameter("pass_confirm");

                                try {
                                    dni = Integer.parseInt(request.getParameter("dni"));
                                    cel = Integer.parseInt(request.getParameter("cel"));
                                    estado = Integer.parseInt(request.getParameter("estado"));
                                } catch (NumberFormatException e) {

                                } catch (Exception e) {

                                }

                                

                                break;
                            default:
                                throw new AssertionError();
                        }

                    }

                    break;

                default:
                    throw new AssertionError();
            }

        }
        request.getRequestDispatcher("/VistaAdministrador/AdmUsuarios.jsp").forward(request, response);

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
