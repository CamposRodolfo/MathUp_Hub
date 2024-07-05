<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="../assets/Imagenes/Logo.png">
    <title>MathUP</title>
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body class="body">
    <header>
        <a class="logo" href="home.jsp?correo=<%= request.getParameter("correo") %>"><img src="../assets/Imagenes/MathUP.png" alt="logo"></a>
        <div class="social-icon">
            <a href="https://www.google.com/" target="_blank"><i class="fa fa-search"></i></a>
            <a href="https://www.instagram.com/math_up0/" target="_blank"><i class="fa fa-instagram"></i></a>
            <a href="https://www.facebook.com/profile.php?id=61561506939201" target="_blank"><i class="fa fa-facebook"></i></a>
            <a href="https://x.com/MathUP0" target="_blank"><i class="fa fa-twitter"></i></a>
        </div>
        <!-- <a class="btn btn-default" href="#">Iniciar Sesión</a> -->
        <a class="btn-icon" href="perfil.jsp?correo=<%= request.getParameter("correo") %>"><i class="fa fa-user"></i></a>
    </header>

    <div class="navbar">
        <a class="navbar-opcion" href="home.jsp?correo=<%= request.getParameter("correo") %>">Inicio</a>
        <div class="dropdown">
            <button class="navbar-opcion dropdwonbtn" href="#"> Usuarios <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="lista_admins.jsp?correo=<%= request.getParameter("correo") %>">Lista de Administradores</a>
                <a href="lista_profesores.jsp?correo=<%= request.getParameter("correo") %>">Lista de Profesores</a>
                <a href="lista_estdiantes.jsp?correo=<%= request.getParameter("correo") %>">Lista de Estudiantes</a>
                <a href="registro_usuario.jsp?correo=<%= request.getParameter("correo") %>">Registrar Usuario</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="navbar-opcion dropdwonbtn" href="#"> Cursos <i class="fa fa-caret-down"></i></button>
            <div class="navbar-opcion dropdown-content">
                <a href="lista_cursos.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos</a>
                <a href="lista_profesor_curso.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos por Profesor</a>
                <a href="lista_estudiantes_curso.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos por Estudiante</a>
            </div>
        </div>
        <a class="navbar-opcion" href="about.jsp?correo=<%= request.getParameter("correo") %>">Sobre Nosotros</a>
    </div>
     <!-- Fin Navbar -->

    <div class="main">
        <br><h1>Página Usuario</h1><br><br>
        <div class="protal">
            <div class="icon-container">
                <a href="../admin/lista_admins.jsp">
                    <img src="../assets/Imagenes/admin.png" alt="Icono 1">
                    <span>Lista Admins</span>
                </a>
                <a href="../admin/lista_profesores.jsp">
                    <img src="../assets/Imagenes/profesor.png" alt="Icono 2">
                    <span>Lista Profesores</span>
                </a>
                <a href="../admin/lista_profesor_curso.jsp">
                    <img src="../assets/Imagenes/profesor.png" alt="Icono 3">
                    <span>Lisa Profesores por Curso</span>
                </a>
            </div>
            <div class="icon-container">
                <a href="../admin/lista_estdiantes.jsp">
                    <img src="../assets/Imagenes/estudiante.png" alt="Icono 4">
                    <span>Lista Estudiantes</span>
                </a>
                <a href="../admin/lista_estudiantes_curso.jsp">
                    <img src="../assets/Imagenes/estudiante.png" alt="Icono 5">
                    <span>Lista Estudiantes por Curso</span>
                </a>
                <a href="../admin/registro_usuario.jsp">
                    <img src="../assets/Imagenes/registrar.png" alt="Icono 6">
                    <span>Registrar Usuarios</span>
                </a>
            </div>
        </div>
        
    </div>
    
    <footer class="footer">
            <div class="footer_columna">
                <h4>MathUP</h4>
                <ul>
                    <li class="home"><a href="home.jsp?correo=<%= request.getParameter("correo") %>">Inicio</a></li>
                    <li><a href="registro_curso.jsp?correo=<%= request.getParameter("correo") %>">Registar Curso</a></li>
                    <li><a href="lista_cursos.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos</a></li>
                    <li><a href="registro_leccion.jsp?correo=<%= request.getParameter("correo") %>">Registar Lección</a></li>
                    <li><a href="registro_usuario.jsp?correo=<%= request.getParameter("correo") %>">Registrar Usuario</a></li>
                    <li><a href="lista_admins.jsp?correo=<%= request.getParameter("correo") %>">Lista de Administradores</a></li>
                    <li><a href="lista_profesores.jsp?correo=<%= request.getParameter("correo") %>">Lista de Profesores</a></li>
                    <li><a href="lista_estdiantes.jsp?correo=<%= request.getParameter("correo") %>">Lista de Estudiantes</a></li>
                    <li><a href="about.jsp?correo=<%= request.getParameter("correo") %>">Sobre Nosotros</a></li>
                </ul>
            </div>
            <div class="footer_columna">
                <h4>Derechos Reservados</h4>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus esse magnam quis mollitia temporibus blanditiis, quia aliquid rerum sint exercitationem reiciendis nisi placeat itaque fuga dignissimos ipsam accusantium quasi officiis.</p>
            </div>
            <div class="footer_columna">
                <h4>Perfil</h4>
                <ul>
                    <li><a href="#">Gestionar Perfil</a></li>
                    <li><a href="../general/home.html">Log Out</a></li>
                </ul>
            </div>
        </footer>
    </body>
    </html>
    