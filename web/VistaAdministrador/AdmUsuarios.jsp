<%-- 
    Document   : Index
    Created on : 12 oct. 2024, 11:24:27
    Author     : JEFFERSON
--%>
<%@page import="Modelo.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    </head>

    <body>

        <%@include file="CabeceraAdm.jsp" %>

        <div class="wrapper">
            <nav id="sidebar" class="sidebar js-sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="index.html">

                        <div class="mb-2 center_text">
                            <i class="align-middle me-2" data-feather="github"></i>
                            <span class="align-middle">Administrador
                            </span>
                        </div>


                    </a>


                    <!--BARRA NEGRA IZQUIERDA, MANTENIMIENTO-->
                    <ul class="sidebar-nav">
                        <li class="sidebar-header">Páginas</li>

                        <!--Primer Slider-->
                        <li class="sidebar-item">


                            <a class="sidebar-link" href="#"
                               data-bs-toggle="collapse" data-bs-target="#dashboard-submenu" aria-expanded="false">
                                <i class="align-middle me-2" data-feather="user-check"></i>
                                <span class="align-middle">Usuarios</span>
                            </a>



                            <ul class="collapse show" id="dashboard-submenu">
                                <li class="nav-item <%= "AdministradorUsuarios".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>
                                    ">
                                    <a href="<%=request.getContextPath()%>/ControladorUsuario?tipoc=AdministradorUsuarios" class="sidebar-link">

                                        <span class="align-middle">Administrar Empleados</span>
                                    </a>
                                </li>
                                <li class="nav-item <%= "AdministradorClientes".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>
                                    ">
                                    <a href="<%=request.getContextPath()%>/ControladorUsuario?tipoc=AdministradorClientes" class="sidebar-link">

                                        <span class="align-middle">Administrar Clientes</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item">


                            <a class="sidebar-link" href="#"
                               data-bs-toggle="collapse" data-bs-target="#dashboard-submenu3" aria-expanded="false">
                                <i class="align-middle me-2" data-feather="package"></i>
                                <span class="align-middle">Productos</span>
                            </a>



                            <ul class="collapse" id="dashboard-submenu3">
                                <li class="nav-item <%= "AdministradorProductos".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>">
                                    <a href="<%=request.getContextPath()%>/ControladorBebidas?tipoc=AdministradorProductos" class="sidebar-link">

                                        <span class="align-middle">Administrar Productos</span>
                                    </a>
                                </li>
                                
                                
                                <li class="nav-item <%= "AdministradorBebidas".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>">
                                    <a href="<%=request.getContextPath()%>/ControladorBebidas?tipoc=AdministradorBebidas" class="sidebar-link">

                                        <span class="align-middle">Administrar Bebidas</span>
                                    </a>
                                </li>
                                
                                
                                
                                <li class="nav-item <%= "AdministradorComplementos".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>">
                                    <a href="<%=request.getContextPath()%>/ControladorBebidas?tipoc=AdministradorComplementos" class="sidebar-link">

                                        <span class="align-middle">Administrar Complementos</span>
                                    </a>
                                </li>
                                
                                
                                <li class="nav-item <%= "AdministradorPromociones".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>">
                                    <a href="<%=request.getContextPath()%>/ControladorBebidas?tipoc=AdministradorPromociones" class="sidebar-link">

                                        <span class="align-middle">Administrar Promociones</span>
                                    </a>
                                </li>

                            </ul>




                        </li>
                        
                        
                        <li class="sidebar-item">


                            <a class="sidebar-link" href="#"
                               data-bs-toggle="collapse" data-bs-target="#dashboard-submenu8" aria-expanded="false">
                                <i class="align-middle me-2" data-feather="user-check"></i>
                                <span class="align-middle">Pedidos</span>
                            </a>



                            <ul class="collapse" id="dashboard-submenu8">
                                <li class="nav-item <%= "AdministradorPedido".equals(request.getAttribute("estados_contralador")) ? "sidebar-item active" : ""%>
                                    ">
                                    <a href="<%=request.getContextPath()%>/ControladorDetallePedido?tipoc=AdministradorPedido" class="sidebar-link">

                                        <span class="align-middle">Detalle Pedido</span>
                                    </a>
                                </li>



                            </ul>
                        </li>


                    </ul>



                </div>
            </nav>

            <div class="main">
                <nav class="navbar navbar-expand navbar-light navbar-bg navar_informacion">
                    <a class="sidebar-toggle js-sidebar-toggle">
                        <i class="hamburger align-self-center"></i>
                    </a>

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="bell"></i>
                                        <span class="indicator">4</span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
                                    <div class="dropdown-menu-header">
                                        4 New Notifications
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-danger" data-feather="alert-circle"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Update completed</div>
                                                    <div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
                                                    <div class="text-muted small mt-1">30m ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-warning" data-feather="bell"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Lorem ipsum</div>
                                                    <div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate hendrerit et.</div>
                                                    <div class="text-muted small mt-1">2h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-primary" data-feather="home"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Login from 192.186.1.8</div>
                                                    <div class="text-muted small mt-1">5h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-success" data-feather="user-plus"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">New connection</div>
                                                    <div class="text-muted small mt-1">Christina accepted your request.</div>
                                                    <div class="text-muted small mt-1">14h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">Show all notifications</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="message-square"></i>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
                                    <div class="dropdown-menu-header">
                                        <div class="position-relative">
                                            4 New Messages
                                        </div>
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="<%= request.getContextPath()%>/img/imgAdm/avatars/avatar-5.jpg" class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Vanessa Tucker</div>
                                                    <div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu tortor.</div>
                                                    <div class="text-muted small mt-1">15m ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="<%= request.getContextPath()%>/img/imgAdm/avatars/avatar-2.jpg" class="avatar img-fluid rounded-circle" alt="William Harris">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">William Harris</div>
                                                    <div class="text-muted small mt-1">Curabitur ligula sapien euismod vitae.</div>
                                                    <div class="text-muted small mt-1">2h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="<%= request.getContextPath()%>/img/imgAdm/avatars/avatar-4.jpg" class="avatar img-fluid rounded-circle" alt="Christina Mason">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Christina Mason</div>
                                                    <div class="text-muted small mt-1">Pellentesque auctor neque nec urna.</div>
                                                    <div class="text-muted small mt-1">4h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <img src="<%= request.getContextPath()%>/img/imgAdm/avatars/avatar-3.jpg" class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
                                                </div>
                                                <div class="col-10 ps-2">
                                                    <div class="text-dark">Sharon Lessman</div>
                                                    <div class="text-muted small mt-1">Aenean tellus metus, bibendum sed, posuere ac, mattis non.</div>
                                                    <div class="text-muted small mt-1">5h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">Show all messages</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>

                                <%
                            
                                    Usuario us = (Usuario) (session != null ? session.getAttribute("usuario") : null); // Verifica que la sesión no sea nula

                                %>

                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                                    <img src="<%= request.getContextPath()%>/img/imgAdm/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="" /> <span class="text-dark"><%= (us != null) ? us.getNombre() : "" %></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Perfil</a>
                                    <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Alánisis</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="index.html"><i class="align-middle me-1" data-feather="settings"></i> Configuración</a>
                                    <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i>Ayuda</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Main.jsp">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>



                <div class="app-content-header bg-dark app_container">
                    <div class="container-fluid containt_title">
                        <div class="row">
                            <div class="col-sm-6">
                                <span class="align-middle peli_align_text">Usuarios</span>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-end">
                                    <li class="breadcrumb-item li_item_edit"><a href="#">Home </a>
                                    </li>
                                    <i class="align-middle me-2 star_edie" data-feather="star"></i>
                                    <li class="breadcrumb-item active edit_li" aria-current="page">
                                        Usuarios
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <main class="content">

                    <!-- AGREGAR MODAL CLIENTES -->

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#${agregarModal}" data-bs-whatever="@mdo">${informacion}</button>

                    <div class="modal fade" id="${agregarModal}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Nuevo ${titulo}</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <!-- FORMULARIO -->
                                    <form action="<%=request.getContextPath()%>/ControladorUsuario?tipoc=${estados_contralador}" method="post">


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Nombre:</label>
                                            <input type="text" name="nombres2" id="nombres2" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Apellido:</label>
                                            <input type="text" name="apellidos2" id="apellidos2" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">DNI:</label>
                                            <input type="text" name="dni2" id="dni2" class="form-control" required>
                                        </div>

                                        <div class="mb-2">
                                            <label for="genero" class="form-label">Usuario</label>
                                            <input type="text" name="genero2" id="genero2" class="form-control" required>
                                        </div>

                                        


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Email:</label>
                                            <input type="email" name="correo2" id="correo2" class="form-control" required>
                                        </div>

                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Email Confirmación:</label>
                                            <input type="email" name="correo_confirm2" id="correo_confirm2" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Contraseña:</label>
                                            <input type="password" name="pass2" id="pass2" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Confirma contraseña:</label>
                                            <input type="password" name="pass_confirm2" id="pass_confirm2" class="form-control" required>
                                        </div>


                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary me-1" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="submit" name="accion" value="agregar"  class="btn btn-primary ms-1"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                                        </div>


                                    </form>


                                </div>




                            </div>
                        </div>
                    </div>


                    <!-- MODIFICAR MODAL -->
                    <div class="modal fade" id="${modificarModal}" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel2">Modificar ${titulo}</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <!-- FORMULARIO -->
                                    <form action="<%=request.getContextPath()%>/ControladorUsuario?tipoc=${estados_contralador}" method="post">

                                        <input type="hidden" id="id" name="id">


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Nombre:</label>
                                            <input type="text" name="nombres" id="nombres" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Apellido:</label>
                                            <input type="text" name="apellidos" id="apellidos" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">DNI:</label>
                                            <input type="text" name="dni" id="dni" class="form-control" required>
                                        </div>

                                        <div class="mb-2">
                                            <label for="genero" class="form-label">Usuario:</label>
                                            <input type="text" name="genero" id="genero" class="form-control" required>
                                        </div>

                                        

                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Email:</label>
                                            <input type="email" name="correo" id="correo" class="form-control" required>
                                        </div>

                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Email Confirmación:</label>
                                            <input type="email" name="correo_confirm" id="correo_confirm" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Contraseña:</label>
                                            <input type="password" name="pass" id="pass" class="form-control" required>
                                        </div>


                                        <div class="mb-2">
                                            <label for="nombre" class="form-label">Confirma contraseña:</label>
                                            <input type="password" name="pass_confirm" id="pass_confirm" class="form-control" required>
                                        </div>



                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary me-1" data-bs-dismiss="modal">Cerrar</button>
                                            <button type="submit" name="accion" value="update2"  class="btn btn-primary ms-1"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                                        </div>


                                    </form>


                                </div>

                            </div>
                        </div>
                    </div>










                    <div class="container-fluid p-0">

                        <!--TABLA DE REGISTROS-->

                        <div class="container-fluid edit_container"> <!--begin::Row-->

                            <div class="" style="margin-top: 10px;padding: 2px">
                                <table id="tablax" class="table table-responsive table-hover border-top-color-black" style="width:100%">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Id</th>
                                            <th scope="col">Nombres</th>
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">DNI</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Correo</th>
                                            
                                            <th scope="col">Contraseña</th>
                                            
                                            <th scope="col">Acción</th>

                                        </tr>
                                    </thead>


                                    <tbody class="tbody_cuerpo table-group-divider">
                                        <c:forEach items="${datos}" var="item">   
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.nombre}</td>
                                                <td>${item.apellido}</td>
                                                <td>${item.dni}</td>
                                                <td>${item.usuario}</td>
                                                
                                                <td>${item.correo}</td>
                                                
                                                <td>${item.pass}</td>
                                                

                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#${modificarModal}"
                                                                value="${item.id}" onclick="cargarDatos(${item.id})">
                                                            <i class="fa-solid fa-pen-to-square editar"></i>
                                                        </button>

                                                        <a href="<%=request.getContextPath()%>/ControladorUsuario?tipoc=${estados_contralador}&id=${item.id}&accion=delete" type="button" class="btn btn-warning" value="${item.id}">
                                                            <i class="fa-sharp fa-solid fa-trash delete"></i>
                                                        </a>
                                                    </div>
                                                </td>

                                            </c:forEach>

                                    </tbody>
                                </table>
                            </div>




                        </div> <!--end::Container-->










                    </div>
                </main>


                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            









                            
                        </div>
                    </div>
                </footer>
            </div>
        </div>


        <script>
            function cargarDatos(id) {
                $.ajax({
                    url: '<%=request.getContextPath()%>/ControladorUsuario?tipoc=${estados_contralador}&accion=update&id=' + id,
                    method: 'GET',
                    success: function (data) {
                        $('#id').val(data.id);
                        $('#nombres').val(data.nombre);
                        $('#apellidos').val(data.apellido);
                        $('#dni').val(data.dni);
                        $('#genero').val(data.usuario);
                        
                        $('#correo').val(data.correo);
                        $('#correo_confirm').val(data.correo);
                        $('#pass').val(data.pass);
                        $('#pass_confirm').val(data.pass);
                    },
                    error: function () {
                        alert('Error al cargar datos');
                    }
                });
            }
        </script>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>         
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>                


        <c:if test="${requestScope.mensaje != null}">
            <script>
            toastr.options = {
                "closeButton": true,
                "positionClass": "toast-bottom-left",
                "preventDuplicates": false,
                "timeOut": "2000",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
                <c:if test="${requestScope.result == 'ok'}">
            toastr.success('${requestScope.mensaje}', toastr.options);
                </c:if>
                <c:if test="${requestScope.result == 'error'}">
            toastr.error('${requestScope.mensaje}', toastr.options);
                </c:if>
                <c:if test="${requestScope.result == 'info'}">
            toastr.info('${requestScope.mensaje}', toastr.options);
                </c:if>
            </script>
        </c:if>




        <script src="${pageContext.request.contextPath}/js/jsAdm/app.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
                var gradient = ctx.createLinearGradient(0, 0, 0, 225);
                gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
                gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
                // Line chart
                new Chart(document.getElementById("chartjs-dashboard-line"), {
                    type: "line",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "Sales ($)",
                                fill: true,
                                backgroundColor: gradient,
                                borderColor: window.theme.primary,
                                data: [
                                    2115,
                                    1562,
                                    1584,
                                    1892,
                                    1587,
                                    1923,
                                    2566,
                                    2448,
                                    2805,
                                    3438,
                                    2917,
                                    3327
                                ]
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        tooltips: {
                            intersect: false
                        },
                        hover: {
                            intersect: true
                        },
                        plugins: {
                            filler: {
                                propagate: false
                            }
                        },
                        scales: {
                            xAxes: [{
                                    reverse: true,
                                    gridLines: {
                                        color: "rgba(0,0,0,0.0)"
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        stepSize: 1000
                                    },
                                    display: true,
                                    borderDash: [3, 3],
                                    gridLines: {
                                        color: "rgba(0,0,0,0.0)"
                                    }
                                }]
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Pie chart
                new Chart(document.getElementById("chartjs-dashboard-pie"), {
                    type: "pie",
                    data: {
                        labels: ["Chrome", "Firefox", "IE"],
                        datasets: [{
                                data: [4306, 3801, 1689],
                                backgroundColor: [
                                    window.theme.primary,
                                    window.theme.warning,
                                    window.theme.danger
                                ],
                                borderWidth: 5
                            }]
                    },
                    options: {
                        responsive: !window.MSInputMethodContext,
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        cutoutPercentage: 75
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Bar chart
                new Chart(document.getElementById("chartjs-dashboard-bar"), {
                    type: "bar",
                    data: {
                        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        datasets: [{
                                label: "This year",
                                backgroundColor: window.theme.primary,
                                borderColor: window.theme.primary,
                                hoverBackgroundColor: window.theme.primary,
                                hoverBorderColor: window.theme.primary,
                                data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                                barPercentage: .75,
                                categoryPercentage: .5
                            }]
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false
                        },
                        scales: {
                            yAxes: [{
                                    gridLines: {
                                        display: false
                                    },
                                    stacked: false,
                                    ticks: {
                                        stepSize: 20
                                    }
                                }],
                            xAxes: [{
                                    stacked: false,
                                    gridLines: {
                                        color: "transparent"
                                    }
                                }]
                        }
                    }
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var markers = [{
                        coords: [31.230391, 121.473701],
                        name: "Shanghai"
                    },
                    {
                        coords: [28.704060, 77.102493],
                        name: "Delhi"
                    },
                    {
                        coords: [6.524379, 3.379206],
                        name: "Lagos"
                    },
                    {
                        coords: [35.689487, 139.691711],
                        name: "Tokyo"
                    },
                    {
                        coords: [23.129110, 113.264381],
                        name: "Guangzhou"
                    },
                    {
                        coords: [40.7127837, -74.0059413],
                        name: "New York"
                    },
                    {
                        coords: [34.052235, -118.243683],
                        name: "Los Angeles"
                    },
                    {
                        coords: [41.878113, -87.629799],
                        name: "Chicago"
                    },
                    {
                        coords: [51.507351, -0.127758],
                        name: "London"
                    },
                    {
                        coords: [40.416775, -3.703790],
                        name: "Madrid "
                    }
                ];
                var map = new jsVectorMap({
                    map: "world",
                    selector: "#world_map",
                    zoomButtons: true,
                    markers: markers,
                    markerStyle: {
                        initial: {
                            r: 9,
                            strokeWidth: 7,
                            stokeOpacity: .4,
                            fill: window.theme.primary
                        },
                        hover: {
                            fill: window.theme.primary,
                            stroke: window.theme.primary
                        }
                    },
                    zoomOnScroll: false
                });
                window.addEventListener("resize", () => {
                    map.updateSize();
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
                var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
                document.getElementById("datetimepicker-dashboard").flatpickr({
                    inline: true,
                    prevArrow: "<span title=\"Previous month\">&laquo;</span>",
                    nextArrow: "<span title=\"Next month\">&raquo;</span>",
                    defaultDate: defaultDate
                });
            });
        </script>





        <!--- Script tabla -->



        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>



        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Número _MENU_ items",
                        info: "",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                });
            });
        </script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    
    </body>

</html>