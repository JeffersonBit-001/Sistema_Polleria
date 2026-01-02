<%-- 
    Document   : encuentranos
    Created on : 28 oct. 2024, 15:05:08
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
    <link rel="stylesheet/less" type="text/css" href="../css/encuentranos.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="Cabecera.jsp" %>

    <main>
        <section>
            <section class="find-us-container">
                <h1 class="find-us-header">Encuéntranos</h1>
                <section class="find-us-content">
                    <section class="contact-info">
                        <h2 class="contact-header">Información de Contacto</h2>
                        <p class="contact-text">
                            Dirección: Av Alfredo Mendiola 401, urbanización Ingeniería, Lima, Peru, 15103<br>
                            Teléfono: 989 177 246<br>
                            Email: <a href="mailto:ikigaideliexpress@gmail.com">ikigaideliexpress@gmail.com</a>
                        </p>
                    </section>
                    <section class="map-container">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.23659675934!2d-77.06124252528238!3d-12.027226088208057!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ced8e8ae45f7%3A0x75eba2f7032e7631!2sAv.%20Alfredo%20Mendiola%20401%2C%20San%20Mart%C3%ADn%20de%20Porres%2015103!5e0!3m2!1ses-419!2spe!4v1725929871699!5m2!1ses-419!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </section>
                </section>
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