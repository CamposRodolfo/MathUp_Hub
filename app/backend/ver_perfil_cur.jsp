<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfil del Usuario</title>
</head>
<body>
    <h1>Perfil del Curso</h1>
    
    <% 
        // Obtener los parámetros de la URL
        String idcurso = request.getParameter("id_curso");

        if (idcurso != null) {
            try {
                // Convertir idcurso a un entero
                int idcursoInt = Integer.parseInt(idcurso);
                
                String usuario = "Admin";
                String contrasena = "12345";

                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                
                String sql = "SELECT * FROM Cursos WHERE id_curso = ?";
                PreparedStatement pstmt = dbconnect.prepareStatement(sql);
                pstmt.setInt(1, idcursoInt);
                ResultSet rs = pstmt.executeQuery();
                
                String sql2 = "SELECT P.nombre_pr, P.apellido_pr FROM Cursos_profesores CP JOIN Profesores P ON CP.id_profesor_fk_lp = P.id_profesor WHERE CP.id_curso_fk_lp = ?";
                PreparedStatement pstmt2 = dbconnect.prepareStatement(sql2);
                pstmt2.setInt(1, idcursoInt);
                ResultSet rs2 = pstmt2.executeQuery();

                if (rs.next()) {
    %>
                    <h1>ID Curso: <%=rs.getString("id_curso") %><br></h1>
                    <h1>Nombre: <%=rs.getString("nombre_cur") %><br></h1>
                    <h1>Descripcion: <%=rs.getString("descripcion_cur") %><br></h1>
                    <h1>Duracion: <%=rs.getString("duracion_cur") %><br></h1>
                    <h1>Dificultad: <%=rs.getString("dificultad_cur") %><br></h1>   
                    <h1>Profesor: 
                    <% 
                        if (rs2.next()) { 
                            String nombreProfesor = rs2.getString("nombre_pr");
                            String apellidoProfesor = rs2.getString("apellido_pr");
                    %>
                            <%= nombreProfesor + " " + apellidoProfesor %><br>
                    <% 
                        } else { 
                    %>
                            No hay profesor asignado<br>
                    <% 
                        } 
                    %>
                    </h1>
					
                    <h2>Lecciones</h2>
                    <table border="1">
                        <tr>
                            <th>ID Leccion</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                        </tr>
                    <%
                        String mostrarsql2 = "SELECT * FROM Lecciones WHERE id_curso_fk_lec = ?";
                        PreparedStatement pstmt3 = dbconnect.prepareStatement(mostrarsql2);
                        pstmt3.setInt(1, idcursoInt);
                        ResultSet rs3 = pstmt3.executeQuery();
                        boolean hayDatos = false;
                        
                        while (rs3.next()) {
                            hayDatos = true;
                    %>
                        <tr>
                            <td><%= rs3.getInt("id_leccion") %></td>
                            <td><%= rs3.getString("nombre_lec") %></td>
                            <td><%= rs3.getString("contenido_lec") %></td>
                        </tr>
                    <% 
                        }
                        if (!hayDatos) {
                    %>
                        <tr>
                            <td colspan="3">No se encontraron registros en la tabla Lecciones</td>
                        </tr>
                    <%
                        }
                        rs3.close();
                        pstmt3.close();
                    %>
                    </table>
    <% 
                } else {
                    out.println("No se encontró el curso con ID: " + idcurso + "<br>");
                }

                rs.close();
                rs2.close();
                pstmt.close();
                pstmt2.close();
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