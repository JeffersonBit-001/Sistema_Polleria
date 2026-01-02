<%-- 
    Document   : CabeceraAdm
    Created on : 12 oct. 2024, 14:00:13
    Author     : JEFFERSON
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
        <meta name="author" content="AdminKit">
        <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icons/icon-48x48.png" />

        <link rel="canonical" href="https://demo-basic.adminkit.io/" />

        <title>Administracion CINE+STAR</title>

        <link href="${pageContext.request.contextPath}/css/cssAdm/app.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  

        <style>
            
            .toast-success {
                background-color: #28a745 !important;
                color: white !important;
            }
            .toast-error {
                background-color: #dc3545 !important;
                color: white !important;
            }
            .toast-info {
                background-color: #17a2b8 !important;
                color: white !important;
            }
            .toast-warning {
                background-color: #ffc107 !important;
                color: black !important;
            }
            
            
            .dropdown-menu-end{
                width: 300px !important
            }
            .navar_informacion{
                padding: 1.5rem 2rem
            }
            
            .sidebar-link{
                padding-left: 0 !important;
                padding-right: 0 !important;
                padding-left: 15px !important;
                padding-right: 5px !important;
                
                    
            }
            
            a{
              text-decoration: none  
            }
            .edit_container{
                padding: 0;
            }

            .dataTables_scrollBody{
                height: 470px !important;
                cursor: default;
            }

            .dataTables_scroll{
                cursor: default;
            }
            .align-middle{
                text-align: center !important;
                padding: 0;
                margin: 0;
                font-weight: bold;
            }

            .adm_text{
                color: azure;
            }

            .sidebar-brand{
                margin-bottom: 0;
                padding-bottom: 0;
                color: white;
                text-shadow: 0px 0px 6px rgba(0, 0, 0, 0.4);
            }

            .center_text{
                text-align: center;
                font-size: 25px;
                margin-bottom: 0 !important;
            }
            .center_text svg{
                font-size: 40px !important;
            }
            .dataTables_filter label{
                text-align: center;
                display: flex;
                align-items: center;
                align-content: center;
                justify-content: center;
                justify-items: center;
                font-weight: bold;
            }

            .tbody_cuerpo{
                background-color: white !important;

            }

            .dataTables_filter label input{
                margin-left: 10px;
                width: 100%;
                box-shadow: 0px 0px 2px rgba(202, 199, 199, 0.4);
                border-radius: 10px;
            }

            .dataTables_length label{
                text-align: center;
                display: flex;
                align-items: center;
                align-content: center;
                justify-content: center;
                justify-items: center;
                font-weight: bold;
            }

            .dataTables_length label select{
                width: 100%;
                margin-left: 1%;
                margin-right: 1%;
                border-radius: 10px;
                margin: 5px;

            }

            .dataTables_filter{
                float: right;
            }

            .dataTables_length{
                float: left;
            }


            #tablax_wrapper .row{
                margin-bottom: 20px;
            }

            .containt_title{
                margin: 0;
                padding: 0;
            }

            .app_container{
                padding: 1rem;
            }

            .li_item_edit a:hover{
                text-decoration: none !important;
            }

            .edit_li{
                color: white !important;
                cursor: default;
            }
            .containt_title .row .col-sm-6,.containt_title .row {
                align-items: center !important;
                align-content: center !important;
                justify-content: center !important;
                justify-items: center !important;
            }

            .breadcrumb {
                margin-bottom: 0;
                padding-bottom: 0;
            }

            .peli_align_text{
                font-size: 20px;
                color: white;
                text-shadow: 0px 0px 2px rgba(202, 199, 199, 0.4);
                cursor: default;
            }

            .page-link{
                text-decoration: none !important;
            }

            .text-start{
                cursor: default;
            }

            .star_edie{
                margin-left: 7px;
                color: white;
                margin-top: 3px
            }

        </style>
    </head>
    
    <body>
        
    </body>
</html>
