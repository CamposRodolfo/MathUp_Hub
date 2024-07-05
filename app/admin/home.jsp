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
        <a class="navbar-opcion" href="lista_cursos.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos</a>
        <a class="navbar-opcion" href="about.jsp?correo=<%= request.getParameter("correo") %>">Sobre Nosotros</a>
    </div>
     <!-- Fin Navbar -->
<div id="main-home-general" class="main">
    <br><h1>Mis cursos:</h1><br><br>

    <table border="1">
        <tr>
            <th>ID Curso</th>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th>Ver perfil curso</th>
        </tr>
        <% 
            String usuario = "Admin";
            String contrasena = "12345";
            String correo = request.getParameter("correo");
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                
                String mostrarsql = "SELECT Cursos.* FROM Cursos JOIN Admins ON Cursos.id_admin_fk_cur = Admins.id_admin WHERE Admins.correo_adm = ?";
                PreparedStatement preparado = dbconnect.prepareStatement(mostrarsql);
                preparado.setString(1, correo);
                ResultSet rs = preparado.executeQuery();
                boolean hayDatos = false;

                while (rs.next()) {
                    hayDatos = true;
        %>      
                    <tr>
                        <td><%= rs.getInt("id_curso") %></td>
                        <td><%= rs.getString("nombre_cur") %></td>
                        <td><%= rs.getString("descripcion_cur") %></td>
                        <td><a href="ver_perfil_cur.jsp?id_curso=<%= rs.getInt("id_curso") %>" target="_parent">Perfil del curso</a></td>
                    </tr>
        <% 
                }

                if (!hayDatos) {
                    out.println("<tr><td colspan='4'>No se encontraron registros en la tabla Cursos</td></tr>");
                }

                rs.close();
                preparado.close();
                dbconnect.close();
                
            } catch (Exception e) {
                out.println("<tr><td colspan='4'>Error en la conexión o consulta: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>
<footer class="footer">
        <div class="footer_columna">
            <h4>MathUP</h4>
            <ul>
                <li class="home"><a href="home.jsp?correo=<%= request.getParameter("correo") %>">Inicio</a></li>
                <li><a href="portal_usuario.jsp?correo=<%= request.getParameter("correo") %>">Portal Usuarios</a></li>
                <li><a href="lista_cursos.jsp?correo=<%= request.getParameter("correo") %>">Lista de Cursos</a></li>
                <li><a href="about.jsp?correo=<%= request.getParameter("correo") %>">Sobre Nosotros</a></li>
            </ul>
        </div>
        <div class="footer_columna">
            <h4>Derechos Reservados</h4>
            <p>Si tienes alguna pregunta o comentario sobre nuestros términos de uso, por favor contacta a nuestro equipo de soporte a través del correo electrónico: <a href="mailto:soporte@mathup.com">soporte@mathup.com</a>.</p>         </div>
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
