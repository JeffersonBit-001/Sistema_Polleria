<%-- 
    Document   : info
    Created on : 28 oct. 2024, 21:30:23
    Author     : JEFFERSON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/styles.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carta.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carrito.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/Crear_Cuenta.css" />
        <script src="https://cdn.jsdelivr.net/npm/less" ></script>
    </head>
    <body>
        
        
        <%@include file="Cabecera.jsp" %>
        
        
        <article class="class_article_body">
            <div>
                <h2 id="formulario_boyd">Credenciales</h2>
            </div>
            


            <form id="form_menu" action="Actualiza_clientes.php" method="post">

            <div class="display_body_content">


                <section class="flex_class">
                    <img src="<%= request.getContextPath()%>/img/img_usuario.png" alt="" width="100%">
                    <h3>Usuario</h3>
                    <input id="credencial_usuario" placeholder="anonimo" value="@${usua}">
    
                </section>
    
                <section class="flex_class2">
                    <h4 class="datos_text">Datos Personales</h4>
    
                    <content id="form_action" >
    
    
    
                        <div id="class_2_content_Action">
                            
                            <div class="flex_content_label_input">
                                <div class="flex_div_content">
                                    <div> <label class="text_label_form">Nombres</label></div>
                                    
                                    
                                    <input id="nombre_crear" class="input_form" type="text"  name="nombre" value="${nom}">
                                </div>
    
                                <div class="flex_div_content">
                                    <div><label class="text_label_form" >Apellidos</label></div>
                                    
                                    
                                    <input id="apellido_crear" class="input_form" type="text"  name="apellido" value="${ape}">
                                </div>
    
    
                            </div>
    
                            <div class="flex_content_label_input">
                                <div class="flex_div_content">
                                    <div><label class="text_label_form" >DNI</label></div>
                                    
                                    
                                    <input id="dni_crear" class="input_form" type="text"  name="dni" value="${dn}">
    
                                </div>
    
    
                                <div class="flex_div_content">
                                    <div><label class="text_label_form" >Usuario</label></div>
                                    
                                    
                                    <input id="dni_crear" class="input_form" type="text"  name="usu" value="${usua}">
    
                                </div>
    
    
                            </div>
    
    
    
    
    
                        </div>
    
    
                        <h4 class="datos_text">Claves de Acceso</h4>
                  
                        
                        
                        <div id="class_2_content_Action">
                            <br>
                            <div class="flex_content_label_input">
                                <div class="flex_div_content">
                                    <div><label class="text_label_form">Correo Electrónico</label></div>
                                    
                                    
                                    <input id="correo_crear" class="input_form" type="email"  name="correo" value="${corr}">
                                </div>
    
                                <div class="flex_div_content">
                                    <div><label class="text_label_form" >Confirma tu Correo Electrónico</label></div>
                                    
                                    
                                    <input id="correo_crear_confirm" class="input_form" type="email"  name="correo_confirm" value="${corr}">
                                </div>
    
    
                            </div>
    
    
    
    
    
                            <div class="flex_content_label_input">
                                <div class="flex_div_content">
                                    <div><label class="text_label_form">Contraseña</label></div>
                                    
                                    
                                    <input  id="pass_crear" class="input_form"  type="password" name="pass" value="${passss}">

                                    <label class="checkbox_content">
                                        <input type="checkbox" class="checkbox">
                                        <img onclick="Password('pass_crear','pass_crear_confirm')" id="check2" src="<%= request.getContextPath()%>/img/img_ver.png" width="20px" height="20px">
                                    </label>
                                </div>
    
    
    
                                <div class="flex_div_content">
                                    <div><label class="text_label_form">Confirma tu Contraseña</label></div>
                                    
                                    
                                    <input id="pass_crear_confirm" class="input_form"  type="password" name="pass_confirm" value="${passss}">
                                </div>
    
                            </div>
    
                        </div>
                        
                        
                        
                        
                            
                        
                        
                        </div>
                        
                        <div class="butn">
                            <a href="<%= request.getContextPath()%>/ControladorPedidosPropio" id="crear_login2" class="button_crear_login2">Ver Pedidos</a>
                            
                            <a href="<%= request.getContextPath()%>/ControladorCerrar" id="crear_login2" class="button_crear_login2">Cerrar Sesión</a>
                        </div>
                        
                        

    
    
    
                    </content>
    
                </section>
            </div>

            
        </form>


        


        </article>
        
        
        
        
        
        
        
        
        
    </body>
    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/Crear_cuenta.js"></script>
</html>
