<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>vista_profesores</title>
</head>
<body>
    <h1>Lista de Profesores y sus Cursos</h1>
    <table border="1">
        <tr>
            <th>ID Curso</th>
            <th>Nombre del curso</th>
            <th>ID Profesor</th>
            <th>Nombre del Profesor</th>
            <th>Apellido del Profesor</th>
            <th>Ver perfil del Profesor</th>
        </tr>
        <% 
            String usuario = "Admin";
            String contrasena = "12345";
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();
                
                String mostrarsql = "SELECT c.id_curso, c.nombre_cur, p.id_profesor, p.nombre_pr, p.apellido_pr " +
                                    "FROM Profesores p " +
                                    "JOIN Cursos_profesores cp ON p.id_profesor = cp.id_profesor_fk_lp " +
                                    "JOIN Cursos c ON cp.id_curso_fk_lp = c.id_curso";
                ResultSet rs = dbstatement.executeQuery(mostrarsql);
                boolean hayDatos = false;

                while (rs.next()) {
                    hayDatos = true;
        %>      
                    <tr>
                        <td><%= rs.getInt("id_curso") %></td>
                        <td><%= rs.getString("nombre_cur") %></td>
                        <td><%= rs.getInt("id_profesor") %></td>
                        <td><%= rs.getString("nombre_pr") %></td>
                        <td><%= rs.getString("apellido_pr") %></td>
                        <td><a href="ver_perfil_pr.jsp?id=<%= rs.getInt("id_profesor") %>" target="_parent">Perfil</a></td>
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