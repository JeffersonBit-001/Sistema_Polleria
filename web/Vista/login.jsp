<%-- 
    Document   : login
    Created on : 28 oct. 2024, 15:05:38
    Author     : JEFFERSON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet/less" type="text/css" href="../css/login.less" />
    <script src="https://cdn.jsdelivr.net/npm/less" ></script>
    <title>Login</title>
</head>

<body>
    <section class="container-form register">
        <section class="information">
            <section class="info-childs">
                <h2>¡Bienvenido!</h2>
                <p>Para hacer pedidos más rápido y fáciles, Inicia Sesión con tus datos</p>
                <input type="button" value="Crear Cuenta" onclick="window.location.href='<%= request.getContextPath() %>/Vista/CrearCuenta.jsp';">
            </section>
        </section>
        <section class="form-information">
            <section class="form-information-childs">
                <h2>Inicia Sesión</h2>
                <section class="icons">
                    <i class='bx bxl-google'></i>
                    <i class='bx bxl-facebook'></i>
                    <i class='bx bxl-apple'></i>
                </section>
                <p>Ingresa tus datos</p>
                <form action="<%= request.getContextPath()%>/ControladorLogin" method="post" class="form form-register" novalidate>
                    <section>
                        <label>
                            <i class='bx bx-user'></i>
                            <input type="text" placeholder="Nombre Usuario" name="userName">
                        </label>
                    </section>
                    <section>
                        <label>
                            <i class='bx bx-envelope'></i>
                            <input type="email" placeholder="Correo Electronico" name="userEmail">
                        </label>
                    </section>
                    <section>
                        <label>
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" placeholder="Contraseña" name="userPassword">
                        </label>
                    </section>

                    <input type="submit" value="Registrarse">
                    <section class="alerta-error">Todos los campos son obligatorios</section>
                    <section class="alerta-exito">Te registraste correctamente</section>
                    
                    <input type="button" value="Volver" onclick="window.location.href='<%= request.getContextPath() %>/Main.jsp';">
                </form>
            </section>
        </section>
    </section>

    <section class="container-form login hide">
        <section class="information">
            <section class="info-childs">
                <h2>¡Bienvenido!</h2>
                <p>Para hacer pedidos más rápido y fáciles, Inicia Sesión con tus datos</p>
                <input type="button" value="Registrarse" id="sign-up">
            </section>
        </section>
        <section class="form-information">
            <section class="form-information-childs">
                <h2>Iniciar Sesión</h2>
                <section class="icons">
                    <i class='bx bxl-google'></i>
                    <i class='bx bxl-facebook'></i>
                    <i class='bx bxl-apple'></i>
                </section>
                <p>o Iniciar Sesión con una cuenta</p>
                <form class="form form-login" novalidate>
                    <section>
                        <label>
                            <i class='bx bx-envelope'></i>
                            <input type="email" placeholder="Correo Electronico" name="userEmail">
                        </label>
                    </section>
                    <section>
                        <label>
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" placeholder="Contraseña" name="userPassword">
                        </label>
                    </section>
                    <input type="submit" value="Iniciar Sesión">
                    <section class="alerta-error">Todos los campos son obligatorios</section>
                    <section class="alerta-exito">Te registraste correctamente</section>
                    <input type="button" value="Volver" onclick="window.history.back();">
                </form>
            </section>
        </section>
    </section>

    <script src="../js/script.js"></script>
    <script src="../js/register.js"></script>
    <script src="../js/login.js"></script>
</body>
</html>