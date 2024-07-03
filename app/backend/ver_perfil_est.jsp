<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil del Usuario</title>
</head>
<body>
    <h1>Perfil del Estudiante</h1>
    
    <% 
        //obtener los parámetros de la URL
        String idUsuario = request.getParameter("id_usuario_usr");

        if (idUsuario != null) {
            //convertir idUsuario a un entero para usuarlo en el select
            int idUsuarioInt = Integer.parseInt(idUsuario);
            
            
            try {
                String usuario = "Admin";
                String contrasena = "12345";

                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();

                String sql = "SELECT * FROM Usuarios WHERE id_usuario_usr = " + idUsuarioInt;
                ResultSet rs = dbstatement.executeQuery(sql);

                if (rs.next()) {
                	%>
                	<h1>ID Usuario: <%=rs.getString("id_usuario_usr") %><br></h1>
                    <h1>Nombre: <%=rs.getString("nombre_usr") %><br></h1>
                    <h1>Apellido:  <%=rs.getString("apellido_usr") %><br></h1>
                    <h1>Correo: <%=rs.getString("correo_usr") %><br></h1>
                    <%
                    
                } else {
                    out.println("No se encontró el usuario con ID: " + idUsuarioInt + "<br>");
                }

                rs.close();
                dbstatement.close();
                dbconnect.close();
            } catch (Exception e) {
                out.println("Error en la conexión o consulta: " + e.getMessage());
            }
        } else {
            out.println("Parámetros no válidos.<br>");
        }
    %>
</body>
</html>


