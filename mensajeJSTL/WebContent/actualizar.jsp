<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar</title>
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
                 <input type="text" name="validar" value="3" style="display:none">
                <input type="submit" value="Buscar">
           </form>
           
             <form action="mensajeControl" method="post">
                <div  class="caja2">
                    <label for="username">Nombre</label>
                    <input type="text" name="username" id="username" value="<c:out value="${nombre}"></c:out>" required>
                    <label for="email">Correo</label>
                    <input type="text" name="email" id="email" value="<c:out value="${correo}"></c:out>" required >
                    <label for="website">Sitio Web</label>
                    <input type="text" name="website" id="website" value="<c:out value="${sitio}"></c:out>"  required>
                    <label for="message">Mensaje</label>
                    <input type="text" name="message" id="message" value="<c:out value="${mensaje}"></c:out> " required>
                      <input type="text" name="validar" value="4" style="display:none">
                    <input type="submit" value="Actualizar">
                </div>
             </form>
        </div>
    </div>
</body>
</html>