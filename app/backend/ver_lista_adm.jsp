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
            <th>ID Curso</th>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th>Ver perfil curso</th>
        </tr>
        <% 
            String usuario = "LABS_ALEX";
            String contrasena = "LAB_2003";
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();
                
                String mostrarsql = "SELECT * FROM Admins";
                ResultSet rs = dbstatement.executeQuery(mostrarsql);
                boolean hayDatos = false;

                while (rs.next()) {
                    hayDatos = true;

        %>      
                    <tr>
                        <td><%= rs.getInt("id_admin") %></td>
                        <td><%= rs.getString("nombre_adm") %></td>
                        <td><%= rs.getString("apellido_adm") %></td>
                        <td><a href="ver_perfil_adm.jsp?id_admin=<%= rs.getInt("id_admin") %>" target="_parent">Perfil del curso</a></td>
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