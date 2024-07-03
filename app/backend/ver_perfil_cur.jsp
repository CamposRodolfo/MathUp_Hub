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
        //obtener los parámetros de la URL
        String idcurso = request.getParameter("id_curso");

        if (idUsuario != null) {
            //convertir idUsuario a un entero para usuarlo en el select
            int idcursoInt = Integer.parseInt(idcurso);
            
            
            try {
                String usuario = "Admin";
                String contrasena = "12345";

                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contrasena);
                Statement dbstatement = dbconnect.createStatement();

                String sql = "SELECT * FROM Cursos WHERE id_curso = " + idcursoInt;
                ResultSet rs = dbstatement.executeQuery(sql);

                if (rs.next()) {
                	%>
                	<h1>ID Usuario: <%=rs.getString("id_curso") %><br></h1>
                    <h1>Nombre: <%=rs.getString("nombre_cur") %><br></h1>
                    <h1>Descripcion:  <%=rs.getString("descripcion_cur") %><br></h1>
                    <h1>Duracion: <%=rs.getString("duracion_cur") %><br></h1>
                    <h1>Dificultad: <%=rs.getString("duracion_cur") %><br></h1>
                    <h1>Profesor: <%=rs.getString("duracion_cur") %><br></h1>


                    <tr>
                        <th>ID Leccion</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                    </tr>
                    <%
                        String mostrarsql2 = "SELECT * FROM Lecciones WHERE id_curso_fk_lec = " + idcursoInt;
                        ResultSet rs2 = dbstatement.executeQuery(mostrarsql2);
                        while (rs2.next()) {
                        hayDatos = true;
                    %>
                        <tr>
                            <td><%= rs2.getInt("id_curso") %></td>
                            <td><%= rs2.getString("nombre_cur") %></td>
                            <td><%= rs2.getString("descripcion_cur") %></td>
                            <td><a href="ver_perfil_cur.jsp?id_curso=<%= rs2.getInt("id_curso") %>" target="_parent">Perfil del curso</a></td>
                        </tr>
                    <%
                    }

                    if (!hayDatos) {
                    out.println("No se encontraron registros en la tabla Usuarios<br>");
                    }

                    
                } else {
                    out.println("No se encontró el usuario con ID: " + id_curso + "<br>");
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