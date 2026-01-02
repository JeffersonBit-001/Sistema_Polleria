<%-- 
    Document   : sobre_nosotros
    Created on : 28 oct. 2024, 15:05:55
    Author     : JEFFERSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chicken Delivery</title>
    <link rel="stylesheet/less" type="text/css" href="../css/styles.less" />
    <link rel="stylesheet/less" type="text/css" href="../css/sobre-nosotros.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>
</head>
<body>
    <%@include file="Cabecera.jsp" %>

    <main>
        <section class="about-us">
            <section class="container">
                <h2>Conoce nuestra historia</h2>
                <p>Chicken Delivery comenzó en 2020 con el objetivo de ofrecer las mejores experiencias de comida rápida de calidad a domicilio. Somos un equipo comprometido con la satisfacción de nuestros clientes y trabajamos día a día para brindar un servicio rápido, eficiente y delicioso.</p>
                <h3>Nuestra Misión</h3>
                <p>Proveer a nuestros clientes de comida rápida de alta calidad, entregada con la mayor rapidez posible, garantizando la frescura de los ingredientes y un sabor inolvidable.</p>
                
                <h3>Nuestra Visión</h3>
                <p>Ser la opción número uno de delivery de comida en nuestra región, conocida por nuestro compromiso con la calidad, la rapidez, y la satisfacción del cliente.</p>
                
                <h3>Valores</h3>
                <ul>
                    <li>Calidad en cada producto</li>
                    <li>Compromiso con el cliente</li>
                    <li>Rapidez y eficiencia</li>
                    <li>Innovación continua</li>
                </ul>

                <h3>Equipo</h3>
                <p>Nos enorgullece contar con un equipo de profesionales apasionados por la comida y el servicio al cliente, siempre listos para llevarte lo mejor hasta tu puerta.</p>
            </section>
        </section>
    </main>

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
                        <li><a href="#">Contactános</a></li>
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
                        <p>Suscríbete a nuestros boletines ahora y mantente al día con nuevas colecciones y ofertas exclusivas.</p>
                        <input type="email" placeholder="Ingresa el correo aquí...">
                        <button>Suscríbete</button>
                    </section>
                </section>
            </section>

            <section class="copyright">
                <p>Todos los derechos reservados. Chicken Delivery &copy; 2024</p>
                <img src="../img/payment.png" alt="Pagos">
            </section>
        </section>
    </footer>

    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
</body>
</html>