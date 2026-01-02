<%-- 
    Document   : Cabecera
    Created on : 28 oct. 2024, 16:41:00
    Author     : JEFFERSON
--%>
<%@page import="Modelo.Usuario"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <section class="container-hero">
                <section class="container hero">
                    <section class="customer-support">
                        <i class="fa-solid fa-headset"></i>
                        <section class="content-customer-support">
                            <span class="text">Soporte al cliente</span>
                            <span class="number">989 177 246</span>
                        </section>
                    </section>
                    <section class="container-logo">
                        <h1 class="logo"><a href="/">Chicken Delivery</a><span>Express</span></h1>
                    </section>
                    <section class="container-user">

                        <%
                            
                            Usuario us = (Usuario) (session != null ? session.getAttribute("usuario") : null); // Verifica que la sesión no sea nula

                        %>

                        <a href="<%= request.getContextPath()%><%= (us != null) ? "/ControladorInfo" : "/Vista/login.jsp"%>" class="user-link">
                            <i class="fa-solid fa-user"><%= (us != null) ? "Bienvenido " + us.getNombre() : "" %></i>
                        </a>
                        
                        
                        <a href="<%= request.getContextPath()%>/ControladorCarrito" class="cart-link">
                            <i class="fa-solid fa-basket-shopping"></i>
                            <section class="content-shopping-cart"></section>
                        </a>
                    </section>
                </section>
            </section>

            <section class="container-navbar">
                <nav class="navbar container">
                    <i class="fa-solid fa-bars"></i>
                    <ul class="menu">
                        <li><a href="<%= request.getContextPath()%>/Main.jsp">Inicio</a></li>
                        <li><a href="<%= request.getContextPath()%>/ControladorProduc">Carta</a></li>
                        <li><a href="<%= request.getContextPath()%>/Vista/sobre-nosotros.jsp">Sobre nosotros</a></li>
                        <li><a href="<%= request.getContextPath()%>/Vista/encuentranos.jsp">Encuentranos</a></li>
                    </ul>
                    <form class="search-form">
                        <input type="search" placeholder="Buscar..." />
                        <button class="btn-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </nav>
            </section>
        </header>
    </body>
</html>
