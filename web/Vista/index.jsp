<%-- 
    Document   : index
    Created on : 28 oct. 2024, 15:05:22
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/styles.less" />
        
        <script src="https://cdn.jsdelivr.net/npm/less" ></script>
    </head>

    <!--Integrantes
        COSSIO VEGA, Antony Piero (U22200842)
        ESCUDERO RODRIGUEZ, Crhist Leonor (U22206487)
        SULLON LEVANO, Leonardo José (U22202313)
        VIRHUEZ ZAVALETA, Giovanni Elber (U22215913)
        CUADROS MAÑUICO, Martin (U22213582)
    -->

    <body>
        <%@include file="Cabecera.jsp" %>

        <section class="banner">
            
            
            <article class="carousel">
                <img src="<%= request.getContextPath()%>/img/imagen1.jpg" alt="Imagen 1" />
                <img src="<%= request.getContextPath()%>/img/imagen2.jpg" alt="Imagen 3" />
                <img src="<%= request.getContextPath()%>/img/imagen3.jpg" alt="Imagen 1" />
                <img src="<%= request.getContextPath()%>/img/imagen1.jpg" alt="Imagen 1" />
                <img src="<%= request.getContextPath()%>/img/imagen2.jpg" alt="Imagen 3" />
                <img src="<%= request.getContextPath()%>/img/imagen3.jpg" alt="Imagen 1" />
                <img src="<%= request.getContextPath()%>/img/imagen1.jpg" alt="Imagen 1" />
                
            </article>
            
            
            
            
            
            <!-- comment <section class="content-banner">
                <p>¡Deliciosa!</p>
                <h2>Polleria Chicken <br />¡El mejor pollo a la brasa!</h2>
                <a href="carta.jsp">Comprar ahora</a>-->
            </section>
        </section>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Texto Deslizante</title>
        <style>
            /* Estilos del contenedor del texto */
            .article {
                width: 100%;
                height: 80px; /* Aumenta el alto del contenedor */
                overflow: hidden;
                white-space: nowrap;
                box-sizing: border-box;
                background-color: green;
            }

            /* Estilos del texto animado */
            .article p {
                display: inline-block;
                padding-left: 0%; /* Empieza fuera del contenedor */
                animation: marquee 10s linear infinite; /* Animación continua */
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: white; /* Color del texto blanco */
                font-size: 51px; /* Aumenta el tamaño del texto */
            }

            /* Animación de deslizamiento */
            @keyframes marquee {
                from {
                    transform: translateX(10%); /* Empieza desde el lado derecho */
                }
                to {
                    transform: translateX(-100%); /* Se mueve completamente hacia la izquierda */
                }
            }
        </style>
    </head>

    <article class="article">
        <p>
            POLLOS A LA BRASA, PAPAS FRITAS, PAPAS NATIVAS, PARRILLAS, ENSALADAS, DELICIOSAS BEBIDAS,
            POSTRES, COCTELES Y MUCHO MÁS SOLO AQUI EN TU POLLERÍA FAVORITA CHICKEN DELIVERY
        </p>
        <p>
            POLLOS A LA BRASA, PAPAS FRITAS, PAPAS NATIVAS, PARRILLAS, ENSALADAS, DELICIOSAS BEBIDAS,
            POSTRES, COCTELES Y MUCHO MÁS SOLO AQUI EN TU POLLERÍA FAVORITA CHICKEN DELIVERY
        </p>
    </article>

    <main class="main-content">
        <section class="container container-features">
            <section class="card-feature">
                <i class="fa-solid fa-plane-up"></i>
                <section class="feature-content">
                    <span>Envios a todo SMP y Los Olivos</span>
                    <p>Envios</p>
                </section>
            </section>
            <section class="card-feature">
                <i class="fa-solid fa-wallet"></i>
                <section class="feature-content">
                    <span>Contrareembolso</span>
                    <p>100% garantía de devolución de dinero</p>
                </section>
            </section>
            <section class="card-feature">
                <i class="fa-solid fa-gift"></i>
                <section class="feature-content">
                    <span>Promociones</span>
                    <p>Acceda a promociones</p>
                </section>
            </section>
            <section class="card-feature">
                <i class="fa-solid fa-headset"></i>
                <section class="feature-content">
                    <span>Servicio al cliente 24/7</span>
                    <p>LLámenos 24/7 al 989 177 246</p>
                </section>
            </section>
        </section>

        <section class="container top-products">
            <h1 class="heading-1">DESCUBRE LO QUE TENEMOS PARA TI</h1>

            <section class="container-products">
                <!-- Productos Iterados Base de datos -->


                <c:forEach items="${productos}" var="item">
                    <section class="card-product">
                        <section class="container-img">
                            <img src="<%= request.getContextPath()%>/img/${item.imagen}" alt="Actualización" />
                            <section class="button-group">
                                <span>
                                    <i class="fa-regular fa-eye"></i>
                                </span>
                                <span>
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-code-compare"></i>
                                </span>
                            </section>
                        </section>
                        <section class="content-card-product">
                            <section class="stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </section>
                            <h3>${item.descripcion}</h3>
                            <span class="add-cart">
                                <i class="fa-solid fa-basket-shopping"></i>
                            </span>
                            <p class="price">S/. ${item.precio}</p>
                        </section>
                    </section>
                </c:forEach>

            </section>
        </section>

        <section>
            <button id="color">Ver todas las promociones</button>
        </section>

        <section class="gallery">
            <img src="<%= request.getContextPath()%>/img/gallery1.jpeg" alt="Gallery Img1" class="gallery-img-1" />
            <img src="<%= request.getContextPath()%>/img/gallery2.jpeg" alt="Gallery Img2" class="gallery-img-2" />
            <img src="<%= request.getContextPath()%>/img/gallery3.jpg" alt="Gallery Img3" class="gallery-img-3" />
            <img src="<%= request.getContextPath()%>/img/gallery4.jpeg" alt="Gallery Img4" class="gallery-img-4" />
            <img src="<%= request.getContextPath()%>/img/gallery5.jpg" alt="Gallery Img5" class="gallery-img-5" />
        </section>
    </main>

    <footer class="footer">
        <section class="container container-footer">
            <section class="menu-footer">
                <section class="contact-info">
                    <p class="title-footer">Información de Contacto</p>
                    <ul>
                        <li>Dirección: Av. Alfredo Mendiola 401 - SMP</li>
                        <li>Teléfono: 989 177 246</li>
                        <li>EmaiL: ikigaideliexpress@gmail.com</li>
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
                        <li><a href="#">Politicas de Privacidad</a></li>
                        <li><a href="#">Términos y condiciones</a></li>
                        <li><a href="#">Contactános</a></li>
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
                        <p>
                            Suscríbete a nuestros boletines ahora y mantente al día con nuevas colecciones y ofertas exclusivas.
                        </p>
                        <input type="email" placeholder="Ingresa el correo aquí...">
                    </section>
                </section>
            </section>

            <section class="copyright">
                <p>
                    Todos los derechos reservados. Chicken Delivery &copy; 2024
                </p>
                <img src="<%= request.getContextPath()%>/img/payment.png" alt="Pagos" width="100px" height="50px">
            </section>
        </section>
        <head>
            <meta charset="utf-8">
            <style>
                /* Estilos de la imagen oculta y la animación de crecimiento */
                #flyjet {
                    width: 40px;
                    height: 24px;
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%) scale(0); /* Inicialmente oculta con escala 0 */
                    transition: transform 2s ease; /* Transición suave de transformación */
                }

                #flyjet.growing {
                    transform: translate(-50%, -50%) scale(25); /* Crecimiento de la imagen */
                }

                /* Estilo para el ícono */
                .icon-btn {
                    cursor: pointer;
                    display: inline-block;
                    margin-top: 10px;
                }
            </style>
        </head>

        <!-- Imagen de oferta inicialmente oculta -->
        <img id="flyjet" src="<%= request.getContextPath()%>/img/oferta1.png">

        <!-- Ícono de estrella como botón -->
        <article class="icon-btn" id="iconBtn">
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
            </svg>
        </article>

        <!-- Script para manejar la interacción -->
        <script>
            let ended = false;

            // Obtener referencia al icono de estrella y la imagen
            const iconBtn = document.getElementById('iconBtn');
            const flyjet = document.getElementById('flyjet');

            // Evento de clic para el icono
            iconBtn.onclick = function () {
                // Ocultar el ícono y mostrar la imagen
                iconBtn.style.display = 'none'; // El ícono desaparece
                flyjet.style.display = 'block'; // La imagen aparece

                // Agregar la clase que inicia la animación
                flyjet.classList.add('growing');

                // Escuchar la transición y mostrar la alerta
                flyjet.addEventListener('transitionend', function () {
                    if (!ended) { // Mostrar mensaje solo una vez
                        ended = true;
                        alert('¡Encontraste la oferta Secreta del mes!');
                    }
                });
            }

            // Cerrar la imagen si se hace clic fuera de la alerta
            document.addEventListener('click', function (event) {
                const isClickInside = flyjet.contains(event.target) || iconBtn.contains(event.target);

                if (!isClickInside) {
                    // Ocultar la imagen y volver a mostrar el ícono
                    flyjet.style.display = 'none';
                    iconBtn.style.display = 'inline-block';
                    flyjet.classList.remove('growing'); // Reiniciar la animación
                    ended = false; // Resetear el estado para que la alerta vuelva a mostrarse
                }
            });
        </script>

        <!-- Incluyendo el script de Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
        
        
        
        
        
        
        
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

    </body>
</html>