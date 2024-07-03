<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil del Usuario</title>
</head>
<body>
    <h1>Perfil del Administrador</h1>
    
    <% 
        //obtener los parámetros de la URL
        String id_admin = request.getParameter("id_admin");

        if (id_admin != null) {
            //convertir idUsuario a un entero para usuarlo en el select
            int idUsuarioInt = Integer.parseInt(id_admin);
            
            
            try {
                String usuario = "Admin";
                String contrasena = "12345";

                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();

                String sql = "SELECT * FROM Admins WHERE id_admin = " + id_admin;
                ResultSet rs = dbstatement.executeQuery(sql);

                if (rs.next()) {
                	%>
                	<h1>ID Administrador: <%=rs.getString("id_admin") %><br></h1>
                    <h1>Nombre: <%=rs.getString("nombre_adm") %><br></h1>
                    <h1>Apellido:  <%=rs.getString("apellido_adm") %><br></h1>
                    <h1>Correo: <%=rs.getString("correo_adm") %><br></h1>
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