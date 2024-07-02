<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>vista_est</title>
</head>
<body>
    <h1>Lista de Estudiantes</h1>
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
                        <td><a href="ver_perfil_est.jsp?id_usuario_usr=<%= rs.getInt("id_usuario_usr") %>" target="_parent">Perfil</a></td>
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
</body>
</html>

