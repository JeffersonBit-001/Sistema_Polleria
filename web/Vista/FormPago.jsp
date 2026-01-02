<%-- 
    Document   : FormPago
    Created on : 28 oct. 2024, 22:59:47
    Author     : JEFFERSON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Pago</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        input[type="month"],
        input[type="submit"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Formulario de Pago</h2>
    <form action="<%= request.getContextPath()%>/ControladorPedido" method="POST">
        <div class="form-group">
            <label for="nombre">Nombre del Titular:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        <div class="form-group">
            <label for="numero_tarjeta">Número de Tarjeta:</label>
            <input type="text" id="numero_tarjeta" name="numero_tarjeta" required>
        </div>
        <div class="form-group">
            <label for="fecha_vencimiento">Fecha de Vencimiento:</label>
            <input type="month" id="fecha_vencimiento" name="fecha_vencimiento" required>
        </div>
        <div class="form-group">
            <label for="cvv">Código de Seguridad (CVV):</label>
            <input type="text" id="cvv" name="cvv" required>
        </div>
        
        <input type="hidden" name="pago-total" value="${valor_total_input}">
        <input type="submit" value="Pagar" name ="form_pago_tot">
    </form>
</div>

</body>
</html>

