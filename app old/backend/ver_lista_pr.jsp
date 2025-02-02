<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <h1>Lista de Profesores</h1>
    <table border="1">
        <tr>
            <th>ID Profesor</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Ver perfil</th>
        </tr>
        <% 
            String usuario = "Admin";
            String contrasena = "12345";
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();
                
                String mostrarsql = "SELECT * FROM Profesores";
                ResultSet rs = dbstatement.executeQuery(mostrarsql);
                boolean hayDatos = false;

                while (rs.next()) {
                    hayDatos = true;

        %>
                    <tr>
                        <td><%= rs.getInt("id_profesor") %></td>
                        <td><%= rs.getString("nombre_pr") %></td>
                        <td><%= rs.getString("apellido_pr") %></td>
                        <td><a href="ver_perfil_pr.jsp?id_profesor=<%= rs.getInt("id_profesor") %>" target="_parent">Perfil</a></td>
                    </tr>
        <% 
                }

                if (!hayDatos) {
                    out.println("No se encontraron registros en la tabla Profesores<br>");
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