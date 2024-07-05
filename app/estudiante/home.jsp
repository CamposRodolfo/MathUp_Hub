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
        <a class="logo" href="home.jsp"><img src="../assets/Imagenes/MathUP.png" alt="logo"></a>
        <div class="social-icon">
            <a href="https://www.google.com/" target="_blank"><i class="fa fa-search"></i></a>
            <a href="https://www.instagram.com/math_up0/" target="_blank"><i class="fa fa-instagram"></i></a>
            <a href="https://www.facebook.com/profile.php?id=61561506939201" target="_blank"><i class="fa fa-facebook"></i></a>
            <a href="https://x.com/MathUP0" target="_blank"><i class="fa fa-twitter"></i></a>
        </div>
        <!-- <a class="btn btn-default" href="#">Iniciar Sesión</a> -->
        <a class="btn-icon" href="#"><i class="fa fa-user"></i></a>
    </header>

    <div class="navbar">
        <a class="navbar-opcion" href="home.html">Inicio</a>
        <div class="dropdown">
            <button class="navbar-opcion dropdwonbtn" href="#"> Cursos <i class="fa fa-caret-down"></i></button>
            <div class="navbar-opcion dropdown-content">
                <a href="lista_cursos.html">Lista de Cursos</a>
                <a href="registro_curso.html">Registro de Cursos</a>
                <a href="registro_leccion.html">Registar Lección</a>
            </div>
        </div>
        <a class="navbar-opcion" href="about.html">Sobre Nosotros</a>
    </div> <!-- Fin Navbar -->

    <div id="main-home-general" class="main">
    
    </div>

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
            String correo = request.getParameter("Correo");
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                
                String mostrarsql = "SELECT c.id_curso, c.nombre_cur, c.descripcion_cur " +
                        "FROM Cursos c " +
                        "JOIN Usuarios_curso cp ON c.id_curso = cp.id_curso_fk_uc " +
                        "JOIN Usuarios u ON cp.id_usuario_fk_uc = u.id_usuario_usr " +
                        "WHERE u.correo_usr = ?";
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
                        <td><a href="../backend/ver_perfil_cur.jsp?id_curso=<%= rs.getInt("id_curso") %>" target="_parent">Perfil del curso</a></td>
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

    <footer class="footer">
        <div class="footer_columna">
            <h4>MathUP</h4>
            <ul>
                <li class="home"><a href="home.html">Inicio</a></li>
                <li class="home"><a href="cursos.html">Listado de Cursos</a></li>
                <li class="about"><a href="about.html">Sobre Nosotros</a></li>
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
                <li><a href="../general/login.html">Log Out</a></li>
            </ul>
        </div>
    </footer>
</body>
</html>