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
        <!-- <a class="btn btn-default" href="#">Iniciar SesiÃ³n</a> -->
        <a class="btn-icon" href="#"><i class="fa fa-user"></i></a>
    </header>

    <div class="navbar">
        <a class="navbar-opcion" href="home.jsp">Inicio</a>
        <div class="dropdown">
            <button class="navbar-opcion dropdwonbtn" href="#"> Usuarios <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="lista_admins.jsp">Lista de Administradores</a>
                <a href="lista_profesores.jsp">Lista de Profesores</a>
                <a href="lista_estdiantes.jsp">Lista de Estudiantes</a>
                <a href="registro_usuario.jsp">Registrar Usuario</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="navbar-opcion dropdwonbtn" href="#"> Cursos <i class="fa fa-caret-down"></i></button>
            <div class="navbar-opcion dropdown-content">
                <a href="lista_cursos.jsp">Lista de Cursos</a>
                <a href="registro_curso.jsp">Registro de Cursos</a>
                <a href="registro_leccion.jsp">Registar LecciÃ³n</a>
            </div>
        </div>
        <a class="navbar-opcion" href="about.html">Sobre Nosotros</a>
    </div> <!-- Fin Navbar -->

    <main class="main-vistas">
        <div class="contenedor-vistas">  
            <h1>Lista de Estudiantes Registrados:</h1><br><br>
            
            <div id="main-home" class="main">
                    <table border="1">
        <tr>
            <th>ID Estudiante</th>
            <th>Nombre del Estudiante</th>
            <th>Apellido del Estudiante</th>
            <th>Ver perfil del Estudiante</th>
        </tr>
        <% 
            String usuario = "Admin";
            String contrasena = "12345";
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();
                
                String mostrarsql = "SELECT * FROM Usuarios";
                ResultSet rs = dbstatement.executeQuery(mostrarsql);
                boolean hayDatos = false;

                while (rs.next()) {
                    hayDatos = true;

        %>      
                    <tr>
                        <td><%= rs.getInt("id_usuario_usr") %></td>
                        <td><%= rs.getString("nombre_usr") %></td>
                        <td><%= rs.getString("apellido_usr") %></td>
                        <td><a href="../backend/ver_perfil_est.jsp?id_usuario_usr=<%= rs.getInt("id_usuario_usr") %>" target="_parent">Perfil</a></td>
                   	</tr>
        <% 
                }

                if (!hayDatos) {
                    out.println("No se encontraron registros en la tabla Usuarios<br>");
                }

                rs.close();
                dbstatement.close();
                dbconnect.close();
                
            } catch (Exception e) {
                out.println("Error en la conexión o consulta: " + e.getMessage());
            }
        %>
    </table>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="footer_columna">
            <h4>MathUP</h4>
            <ul>
                <li class="home"><a href="home.jsp">Inicio</a></li>
                <li><a href="registro_curso.jsp">Registar Curso</a></li>
                <li><a href="lista_cursos.jsp">Lista de Cursos</a></li>
                <li><a href="registro_leccion.jsp">Registar LecciÃ³n</a></li>
                <li><a href="registro_usuario.jsp">Registrar Usuario</a></li>
                <li><a href="lista_admins.jsp">Lista de Administradores</a></li>
                <li><a href="lista_profesores.jsp">Lista de Profesores</a></li>
                <li><a href="lista_estdiantes.jsp">Lista de Estudiantes</a></li>
                <li><a href="about.jsp">Sobre Nosotros</a></li>
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