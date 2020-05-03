<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo</title>
    <link rel="stylesheet" href="css/nuevo.css">
</head>
<body>
	<jsp:useBean id="uDao" class="mensajeJPA.dao.UsuarioDao" scope="request">
	</jsp:useBean>

    <div class="contenedor">
        <div class="caja">
            <form action="mensajeControl" method="post">
                <label for="username">Nombre</label>
                <input type="text" name="username" id="username" required>
                <label for="email">Correo</label>
                <input type="text" name="email" id="email" required>
                <label for="website">Sitio Web</label>
                <input type="text" name="website" id="website" required>
                <label for="message">Mensaje</label>
                <input type="text" name="message" id="message" required>
                <label for="usuario">Usuario</label>
                <select name="usuario" id="usuario" required>
              	<c:forEach var="usuario" items="${uDao.list()}"> 
              		<option><c:out value="${usuario.user}"/></option>
              	</c:forEach>
                </select>
                <input type="text" name="validar" value="1" style="display:none">
                <input type="submit" value="Guadar">
            </form>
        </div>
    </div>
</body>
</html>