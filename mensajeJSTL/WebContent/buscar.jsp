<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar</title>
    <link rel="stylesheet" href="css/buscar.css">
</head>
<body>
<jsp:useBean id="mDao" class="mensajeJPA.dao.MensajeDao" scope="request">
	</jsp:useBean>
    <div class="contenedor">
        <div class="caja">
            <form action="mensajeControl" method="post">
                <p style="position:relative;left:6px;font-size:16px; color:#36a709;">Se listan los mensajes por nombre de usuario</p>
                <select name="transporte" id="usuario" required>
                <c:forEach var="mensaje" items="${mDao.list()}"> 
              		<option><c:out value="${mensaje.name}"/></option>
              	</c:forEach>
                </select>
                <input type="text" name="validar" value="2" style="display:none">
                <input type="submit" value="Buscar">

                <div  class="caja2">
                    <label for="username">Nombre :</label> 
                	<p style="display:inline- block; position:relative; left:20px; color:white"> <c:out value="${nombre}"></c:out> </p>
                    <label for="email">Correo :</label>
             		<p style="display:inline- block; position:relative; left:20px; color:white"> <c:out value="${correo}"></c:out> </p>
                    <label for="website">Sitio Web :</label>
                	 <p style="display:inline- block; position:relative; left:20px; color:white"> <c:out value="${sitio}"></c:out> </p>
                    <label for="message">Mensaje :</label>
              		 <p style="display:inline- block; position:relative; left:20px; color:white"> <c:out value="${mensaje}"></c:out> </p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>