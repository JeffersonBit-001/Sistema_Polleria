<%-- 
    Document   : PedidosPropio
    Created on : 28 oct. 2024, 22:47:36
    Author     : JEFFERSON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/styles.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carta.less" />
        <link rel="stylesheet/less" type="text/css" href="<%= request.getContextPath()%>/css/carrito.less" />
        <script src="https://cdn.jsdelivr.net/npm/less" ></script>
    </head>
    <body>
        <%@include file="Cabecera.jsp" %>


        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

        <section id="pollos-a-la-brasa">
            <h2>Pedidos</h2>
            <c:set var="lastId" value="" />
            <c:set var="totalShown" value="" />

            <c:forEach items="${detalles}" var="item">
                <c:set var="currentId" value="${item.id}" />

                <c:if test="${lastId != currentId}">
                    <section id="pollos-a-la-brasa-${currentId}">
                        <h2>Pedido: ${currentId}</h2>

                        <c:if test="${totalShown != item.total}">
                            <h1>Total: S/${item.total}</h1>
                            <c:set var="totalShown" value="${item.total}" />
                        </c:if>

                        <c:set var="lastId" value="${currentId}" />
                    </section>
                </c:if>

                
                <c:if test="${not empty item.prod_nom}">
                    <c:set var="itemName" value="${item.prod_nom}" />
                    <c:set var="itemCount" value="0" />

                    <!-- Contar repeticiones -->
                    <c:forEach items="${detalles}" var="innerItem">
                        <c:if test="${innerItem.prod_nom == itemName}">
                            <c:set var="itemCount" value="${itemCount + 1}" />
                        </c:if>
                    </c:forEach>

                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.productoImg}" alt="Actualización" width="130" height="130">
                        <h3>${item.prod_nom}</h3>
                        <p class="price">S/${item.productoPrecio}</p>
                        <p>Cantidad: ${itemCount}</p>
                    </section>
                </c:if>

                <c:if test="${not empty item.promonom}">
                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.promoImg}" alt="Actualización" width="130" height="130">
                        <h3>${item.promonom}</h3>
                        <p class="price">S/${item.promoPrecio}</p>
                    </section>
                </c:if>

                <c:if test="${not empty item.nomcomplemento}">
                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/imagen3.jpg" alt="Actualización" width="130" height="130">
                        <h3>${item.nomcomplemento}</h3>
                        <p class="price">S/${item.complementoprecio}</p>
                    </section>
                </c:if>

                <c:if test="${not empty item.nombebida}">
                    <section class="menu-item">
                        <img src="<%= request.getContextPath()%>/img/${item.bebidaImg}" alt="Actualización" width="130" height="130">
                        <h3>${item.nombebida}</h3>
                        <p class="price">S/${item.bebidaprecio}</p>
                    </section>
                </c:if>
            </c:forEach>
        </section>








    </body>
    <script src="https://kit.fontawesome.com/81581fb069.js" crossorigin="anonymous"></script>
</html>
