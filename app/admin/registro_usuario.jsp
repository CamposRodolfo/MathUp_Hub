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
                <a href="registro_leccion.jsp">Registar Lección</a>
            </div>
        </div>
        <a class="navbar-opcion" href="about.jsp">Sobre Nosotros</a>
    </div> <!-- Fin Navbar -->

    <main class="main-login-general">
        <div>
            <form action="/app/backend/registros.jsp" method="post">
            	<div class="" >

                    <div class="">
                        <input type="radio" id="Profesor" name="op_login" value="1" required>
                        <label for="Profesor">Profesor</label>
                        
                        <input type="radio" id="Administrador" name="op_login" value="2" required>
                        <label for="Administrador">Administrador</label>

                        <input type="radio" id="Estudiante" name="op_login" value="3" required>
                        <label for="Estudiante">Estudiante</label>
                    </div>

	                <div class="">
	                    <label for="fname">Nombre:</label>
	                    <input type="text" id="fname" name="fname" required><br/><br/>
                        
                        <label for="lname">Apellido:</label>
	                    <input type="text" id="lname" name="lname" required> 
                        
                        <label for="usernameUs">Nombre de usuario:</label>
	                    <input type="text" id="usernameUs" name="usernameUs" required> 
                        
	                </div>

                    <div class="">
	                    <label for="Correo">Correo:</label>
	                    <input type="text" id="Correo" name="Correo" required><br/><br/>
                        
                        <label for="ContraseÃ±a">ContraseÃ±a:</label>
	                    <input type="text" id="ContraseÃ±a" name="ContraseÃ±a" required> 

                        <label for="Celular">Celular:</label>
	                    <input type="text" id="Celular" name="Celular" required><br/><br/>
	                </div>

                    <div class="">
	                    <label for="id_admin">Administrador:</label>
	                    <input type="text" id="id_admin" name="id_admin" required><br/><br/>
	                </div>

                    <div>
                        <label for="fecha_de_nacimiento">Fecha de nacimiento:</label>
	                	<input type="date" value="2024-03-01" min="1924-03-01" max="2004-07-07" id="fecha_de_nacimiento" name="fecha_de_nacimiento" required>
                    </div>

                    <div class="">
                        <select name="especialidad" required>
	                        <option value="1">Matematicas</option>
	                        <option value="2">Fisica</option>
	                        <option value="3">Programacion</option>
	                    </select>
                    </div>

            	</div>

                <div class="button-container">
            		<input type="submit" value="Login">
        		</div>
            </form>
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