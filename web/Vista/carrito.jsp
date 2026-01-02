<%-- 
    Document   : carrito
    Created on : 28 oct. 2024, 15:04:33
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
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carrito.less" />
        <script src="https://cdn.jsdelivr.net/npm/less" ></script>
        

    </head>
    <body>
        <%@include file="Cabecera.jsp" %>





        <main>
            <section id="cart-items">
                <!-- Aquí se mostrarán los productos del carrito -->
            </section>

            <form action="<%= request.getContextPath()%>/ControladorPedido" method="post">
                <section class="total">
                    <H1 id="total-price">Total: S/0.00</H1>
                    <input type="hidden" name="total_valor" id="inp_total">

                </section>
                <section class="button-container">
                    <button class="btn-process-order" name="accion_tot" value = "total">Procesar pago</button>
                    <button class="btn-empty-cart">Vaciar Carrito</button>
                </section>

            </form>






            <section id="pollos-a-la-brasa">
                <h2>Carrito de Compras</h2>

                <c:forEach items="${carrito}" var="item">
                    <section class="menu-item" data-precio="${item.precio}" data-cantidad="${item.cantidad}">
                        <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                        <h3>${item.descripcion}</h3>
                        <p class="price">S/${item.precio}</p>
                        <p class="cantidad">${item.cantidad}</p>
                        <a class="add-button" href="ControladorCarrito?val=agregar&accion=carrito_productos&id=${item.id}">Agregar</a>
                        <a class="add-button" href="ControladorCarrito?val=eliminar&accion=carrito_productos&id=${item.id}">Eliminar</a>
                    </section>


                </c:forEach>


                <section id="promociones">
                    <h2>Promociones</h2>
                    <c:forEach items="${promociones}" var="item">

                        <section class="menu-item" data-precio="${item.precio}" data-cantidad="${item.cantidad}">
                            <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                            <h3>${item.descripcion}</h3>
                            <p class="price">S/${item.precio}</p>
                            <p class="cantidad">${item.cantidad}</p>
                            <a class="add-button" href="ControladorCarrito?val=agregar&accion=carrito_promos&id=${item.id}">Agregar</a>
                            <a class="add-button" href="ControladorCarrito?val=eliminar&accion=carrito_promos&id=${item.id}">Eliminar</a>
                        </section>  

                    </c:forEach>

                </section>
                <section id="complementos">
                    <h2>Complementos</h2>
                    <c:forEach items="${complementos}" var="item">

                        <section class="menu-item" data-precio="${item.precio}" data-cantidad="${item.cantidad}">
                            <h3>${item.nombre}</h3>
                            <p class="price">S/${item.precio}</p>
                            <p class="cantidad">${item.cantidad}</p>
                            <a class="add-button" href="ControladorCarrito?val=agregar&accion=carrito_complementos&id=${item.id}">Agregar</a>
                            <a class="add-button" href="ControladorCarrito?val=eliminar&accion=carrito_complementos&id=${item.id}">Eliminar</a>
                        </section>
                    </c:forEach>


                </section>

                <section id="bebidas">
                    <h2>Bebidas</h2>
                    <c:forEach items="${bebidas}" var="item">

                        <section class="menu-item" data-precio="${item.precio}" data-cantidad="${item.cantidad}">
                            <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" width="130" height="130">
                            <h3>${item.descripcion}</h3>
                            <p class="price">S/${item.precio}</p>
                            <p class="cantidad">${item.cantidad}</p>
                            <a class="add-button" href="ControladorCarrito?val=agregar&accion=carrito_bebidas&id=${item.id}">Agregar</a>
                            <a class="add-button" href="ControladorCarrito?val=eliminar&accion=carrito_bebidas&id=${item.id}">Eliminar</a>
                        </section> 

                    </c:forEach>


                </section>

            </section>

        </main>







        <div class="box">
            <div class="giphy-container">
                <iframe src="https://giphy.com/embed/3xJ2QOR1yy57ESNsHW" width="100%" height="100%" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
            </div>
            <div class="egg"></div>
        </div>







        <footer class="footer">
            <section class="container container-footer">
                <section class="menu-footer">
                    <section class="contact-info">
                        <p class="title-footer">Información de Contacto</p>
                        <ul>
                            <li>Dirección: 71 Pennington Lane Vernon Rockville, CT 06066</li>
                            <li>Teléfono: 123-456-7890</li>
                            <li>Email: ikigaideliexpress@gmail.com</li>
                        </ul>
                        <section class="social-icons">
                            <span class="facebook"><i class="fa-brands fa-facebook-f"></i></span>
                            <span class="twitter"><i class="fa-brands fa-twitter"></i></span>
                            <span class="youtube"><i class="fa-brands fa-youtube"></i></span>
                            <span class="pinterest"><i class="fa-brands fa-pinterest-p"></i></span>
                            <span class="instagram"><i class="fa-brands fa-instagram"></i></span>
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
                            <li><a href="#">Historial de ordenes</a></li>
                            <li><a href="#">Lista de deseos</a></li>
                            <li><a href="#">Boletín</a></li>
                            <li><a href="#">Reembolsos</a></li>
                        </ul>
                    </section>
                    <section class="newsletter">
                        <p class="title-footer">Boletín informativo</p>
                        <section class="content">
                            <p>Suscríbete a nuestros boletines ahora y mantente al día con nuevas colecciones y ofertas exclusivas.</p>
                            <input type="email" placeholder="Ingresa el correo aquí...">
                            <button>Suscríbete</button>
                        </section>
                    </section>
                </section>

                <section class="copyright">
                    <p>Todos los derechos reservados. Chicken Delivery &copy; 2024</p>
                    <img src="img/payment.png" alt="Pagos" width = "50px" height="50px">
                </section>
            </section>
        </footer>

        <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>

    </body>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let total = 0;

            const items = document.querySelectorAll('.menu-item');
            items.forEach(item => {
                const precio = parseFloat(item.getAttribute('data-precio'));
                const cantidad = parseInt(item.getAttribute('data-cantidad'));

                total += precio * cantidad;
            });

            const totalDisplay = document.getElementById('total-price');
            const totalDisplay2 = document.getElementById('inp_total');
            totalDisplay.innerText = "Total: S/" + total.toFixed(2);
            totalDisplay2.value = total.toFixed(2);
        });
    </script>


</html>

