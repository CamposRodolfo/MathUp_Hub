<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
</head>
<body>

<%
    String usuario = "LABS_ALEX";
    String contraseña = "LAB_2003";

    Connection dbconnect = null;
    CallableStatement callableStatement = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        dbconnect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", usuario, contraseña);

        // Obtener parámetro op_login como string y convertirlo a entero
        int n = Integer.parseInt(request.getParameter("op_login"));

        if (n == 1) {
            // Llamar al procedimiento almacenado para insertar profesores
            String sql = "{call insertar_profesores(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            callableStatement = dbconnect.prepareCall(sql);

            // Establecer los parámetros del procedimiento almacenado
            String nombre = request.getParameter("fname");
            String apellido = request.getParameter("lname");
            Date fechaNacimiento = Date.valueOf(request.getParameter("fecha_de_nacimiento")); // Convertir String a java.sql.Date
            String correo = request.getParameter("Correo");
            String contraseña_pr = request.getParameter("Contraseña");
            int idEsp = Integer.parseInt(request.getParameter("especialidad"));
            int idAdmin = Integer.parseInt(request.getParameter("id_admin"));
            int celular = Integer.parseInt(request.getParameter("Celular"));
            int idCurso = Integer.parseInt(request.getParameter("id_curso"));

            callableStatement.setString(1, nombre);
            callableStatement.setString(2, apellido);
            callableStatement.setDate(3, fechaNacimiento);
            callableStatement.setString(4, correo);
            callableStatement.setString(5, contraseña_pr);
            callableStatement.setInt(6, idEsp);
            callableStatement.setInt(7, idAdmin);
            callableStatement.setInt(8, idCurso);
            callableStatement.setInt(9, celular);

            callableStatement.execute();
        } else if (n == 2) {
            // Llamar al procedimiento almacenado para insertar admins
            String sql = "{call insertar_admins(?, ?, ?, ?, ?, ?)}";
            callableStatement = dbconnect.prepareCall(sql);

            // Establecer los parámetros del procedimiento almacenado
            String nombre = request.getParameter("fname");
            String apellido = request.getParameter("lname");
            String fechaNacimiento = request.getParameter("fecha_de_nacimiento"); // Debe ser String si el procedimiento espera VARCHAR2
            String correo = request.getParameter("Correo");
            String contraseña_adm = request.getParameter("Contraseña");
            String celular = request.getParameter("Celular");

            callableStatement.setString(1, nombre);
            callableStatement.setString(2, apellido);
            callableStatement.setString(3, fechaNacimiento);
            callableStatement.setString(4, correo);
            callableStatement.setString(5, contraseña_adm);
            callableStatement.setString(6, celular);

            callableStatement.execute();
        } else {
            // Llamar al procedimiento almacenado para insertar usuarios
            String sql = "{call insertar_usuarios(?, ?, ?, ?, ?, ?)}";
            callableStatement = dbconnect.prepareCall(sql);

            // Establecer los parámetros del procedimiento almacenado
            String nombre = request.getParameter("fname");
            String apellido = request.getParameter("lname");
            Date fechaNacimiento = Date.valueOf(request.getParameter("fecha_de_nacimiento")); // Convertir String a java.sql.Date
            String username = request.getParameter("usernameUs");
            String correo = request.getParameter("Correo");
            String contraseña_us = request.getParameter("Contraseña");
            int idCurso = Integer.parseInt(request.getParameter("id_curso"));

            callableStatement.setString(1, nombre);
            callableStatement.setString(2, apellido);
            callableStatement.setDate(3, fechaNacimiento);
            callableStatement.setString(4, username);
            callableStatement.setString(5, correo);
            callableStatement.setString(6, contraseña_us);
            callableStatement.setInt(7, idCurso);

            callableStatement.execute();
        }

        dbconnect.commit(); // Realizar el commit de la transacción

        out.println("Procedimiento almacenado ejecutado con éxito.");
    } catch (ClassNotFoundException e) {
        out.println("Error al cargar el driver JDBC: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Error al ejecutar el procedimiento almacenado: " + e.getMessage());
        if (dbconnect != null) {
            try {
                dbconnect.rollback(); // Hacer rollback en caso de error
            } catch (SQLException ex) {
                out.println("Error al hacer rollback: " + ex.getMessage());
            }
        }
    }
%>
</body>
</html>

