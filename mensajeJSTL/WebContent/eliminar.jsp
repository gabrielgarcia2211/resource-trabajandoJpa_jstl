<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar</title>
    <link rel="stylesheet" href="css/buscar.css">
</head>
<body>
<jsp:useBean id="mDao" class="mensajeJPA.dao.MensajeDao" scope="request">
	</jsp:useBean>
    <div class="contenedor">
        <div class="caja">
            <form action="mensajeControl" method="post">
                <p style="position:relative;left:6px;font-size:16px; color:#36a709;">Se listan los mensajes por usuario</p>
                <select name="transporte" id="usuario" required>
                  <c:forEach var="mensaje" items="${mDao.list()}"> 
              		<option><c:out value="${mensaje.name}"/></option>
              	</c:forEach>
                </select>
                 <input type="text" name="validar" value="5" style="display:none">
                <input type="submit" value="Eliminar">
            </form>
        </div>
    </div>
</body>
</html>