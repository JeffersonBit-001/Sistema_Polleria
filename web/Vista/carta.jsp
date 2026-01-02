<%-- 
    Document   : carta
    Created on : 28 oct. 2024, 15:04:53
    Author     : JEFFERSON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chicken Delivery</title>
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/styles.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carta.less" />
        <script src="https://cdn.jsdelivr.net/npm/less" ></script>
        <style>
            a{
                text-decoration: none !important
            }
        </style>
    </head>
    <body>
        <%@include file="Cabecera.jsp" %>


        <main class="contenedor sombra">
            <header>
                <nav>
                    <ul>
                        <li><a href="#pollos-a-la-brasa">Pollos a la brasa</a></li>
                        <li><a href="#promociones">Promociones</a></li>
                        <li><a href="#complementos">Complementos</a></li>
                        <li><a href="#bebidas">Bebidas</a></li>
                    </ul>
                </nav>
            </header>

            <section id="pollos-a-la-brasa">
                <h2>Pollos a la brasa</h2>

                <c:forEach items="${productos}" var="item">
                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                        <h3>${item.descripcion}</h3>
                        <p class="price">S/${item.precio}</p>
                        <a class="add-button" href="ControladorCarta?accion=carrito_productos&id=${item.id}">Añadir</a>
                    </section>


                </c:forEach>

            </section>

            <section id="promociones">
                <h2>Promociones</h2>
                <c:forEach items="${promociones}" var="item">

                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                        <h3>${item.descripcion}</h3>
                        <p class="price">S/${item.precio}</p>
                        <a class="add-button" href="ControladorCarta?accion=carrito_promos&id=${item.id}">Añadir</a>
                    </section>  

                </c:forEach>

            </section>
            <section id="complementos">
                <h2>Complementos</h2>
                <c:forEach items="${complementos}" var="item">

                    <section class="menu-item">
                        <h3>${item.nombre}</h3>
                        <p class="price">S/${item.precio}</p>
                        <a class="add-button" href="ControladorCarta?accion=carrito_complementos&id=${item.id}">Añadir</a>
                    </section>
                </c:forEach>


            </section>

            <section id="bebidas">
                <h2>Bebidas</h2>
                <c:forEach items="${bebidas}" var="item">

                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                        <h3>${item.descripcion}</h3>
                        <p class="price">S/${item.precio}</p>
                        <a class="add-button" href="ControladorCarta?accion=carrito_bebidas&id=${item.id}">Añadir</a>
                    </section> 

                </c:forEach>


            </section>
        </main>

        




        <footer class="footer">
            <section class="container container-footer">
                <section class="menu-footer">
                    <section class="contact-info">
                        <p class="title-footer">Información de Contacto</p>
                        <ul>
                            <li>Dirección: Av. Alfredo Mendiola 401 - SMP</li>
                            <li>Teléfono: 123-456-7890</li>
                            <li>Email: ikigaideliexpress@gmail.com</li>
                        </ul>
                        <section class="social-icons">
                            <span class="facebook">
                                <i class="fa-brands fa-facebook-f"></i>
                            </span>
                            <span class="twitter">
                                <i class="fa-brands fa-twitter"></i>
                            </span>
                            <span class="youtube">
                                <i class="fa-brands fa-youtube"></i>
                            </span>
                            <span class="pinterest">
                                <i class="fa-brands fa-pinterest-p"></i>
                            </span>
                            <span class="instagram">
                                <i class="fa-brands fa-instagram"></i>
                            </span>
                        </section>
                    </section>

                    <section class="information">
                        <p class="title-footer">Información</p>
                        <ul>
                            <li><a href="#">Acerca de Nosotros</a></li>
                            <li><a href="#">Información Delivery</a></li>
                            <li><a href="#">Políticas de Privacidad</a></li>
                            <li><a href="#">Términos y condiciones</a></li>
                            <li><a href="#">Contáctanos</a></li>
                        </ul>
                    </section>

                    <section class="my-account">
                        <p class="title-footer">Mi cuenta</p>
                        <ul>
                            <li><a href="#">Mi cuenta</a></li>
                            <li><a href="#">Historial de órdenes</a></li>
                            <li><a href="#">Lista de deseos</a></li>
                            <li><a href="#">Boletín</a></li>
                            <li><a href="#">Reembolsos</a></li>
                        </ul>
                    </section>

                    <section class="newsletter">
                        <p class="title-footer">Boletín informativo</p>
                        <section class="content">
                            <p>
                                Suscríbete a nuestros boletines ahora y mantente al día con nuevas colecciones y ofertas exclusivas.
                            </p>
                            <input type="email" placeholder="Ingresa el correo aquí...">
                            <button>Suscríbete</button>
                        </section>
                    </section>
                </section>

                <section class="copyright">
                    <p>
                        Todos los derechos reservados. Chicken Delivery &copy; 2024
                    </p>
                    <img src="../img/payment.png" alt="Pagos">
                </section>
            </section>
        </footer>
        <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
        
    </body>
</html>