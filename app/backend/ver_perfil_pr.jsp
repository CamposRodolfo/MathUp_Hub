<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil del Usuario</title>
</head>
<body>
    <h1>Perfil del Profesor</h1>
    
    <% 
        // Obtener el parámetro id_profesor desde la URL
        String idprofesor = request.getParameter("id");

        if (idprofesor != null && !idprofesor.isEmpty()) {
            // Convertir id_profesor a un entero para usarlo en la consulta SQL
            int id_profesor = Integer.parseInt(idprofesor);
            
            try {
                String usuario = "Admin";
                String contrasena = "12345";

                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();

                // Consulta SQL para obtener el perfil del profesor según su ID
                String sql = "SELECT * FROM Admins WHERE id_admin = " + id_profesor;
                ResultSet rs = dbstatement.executeQuery(sql);

                if (rs.next()) {
                	%>
                	<h1>ID Profesor: <%=rs.getString("id_admin") %><br></h1>
                    <h1>Nombre: <%=rs.getString("nombre_adm") %><br></h1>
                    <h1>Apellido:  <%=rs.getString("apellido_adm") %><br></h1>
                    <h1>Correo: <%=rs.getString("correo_adm") %><br></h1>
                    <%
                } else {
                    out.println("No se encontró el admin con ID: " + id_profesor + "<br>");
                }

                rs.close();
                dbstatement.close();
                dbconnect.close();
            } catch (Exception e) {
                out.println("Error en la conexión o consulta: " + e.getMessage());
            }
        } else {
            out.println("Parámetro ID Profesor no válido.<br>");
        }
    %>
</body>
</html>