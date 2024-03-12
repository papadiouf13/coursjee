<%@ page import="model.Classe" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mamadou Diouf
  Date: 11/03/2024
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<div>
    <c:set var="i" value="1" scope="page"/>
    <table class="table table-dark table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Libelle</th>
            <th scope="col">Code</th>
            <th scope="col">Frais Inscription</th>
            <th scope="col">mensualite</th>
            <th scope="col">autres Frais</th>
            <th scope="col">Filiere</th>
        </tr>
        </thead>
        <tbody>
       <c:forEach var="classe" items="${data}">
        <tr>
            <th scope="row"><c:out value="${i}"/></th>
            <td>${classe.libelle}</td>
            <td>${classe.code}</td>
            <td>${classe.frais_inscription}</td>
            <td>${classe.mensualite}</td>
            <td>${classe.autres_frais}</td>
            <td>${classe.filiere.libelle}</td>
        </tr>
           <c:set var="i" value="${i + 1}" scope="page"/>
       </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
