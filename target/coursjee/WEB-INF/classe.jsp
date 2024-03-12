<%@ page import="model.Classe" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mamadou Diouf
  Date: 11/03/2024
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<div>
    <%
        int i = 1;
    %>
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
        <%
            List<Classe> classes = (List<Classe>) request.getAttribute("data");
            //response.getWriter().println(classes.size());
            for (int j = 0; j < classes.size(); j++) {

        %>
        <tr>
            <th scope="row"><%= i %></th>
            <td><%=classes.get(j).getLibelle() %></td>
            <td><%=classes.get(j).getCode() %></td>
            <td><%=classes.get(j).getFrais_inscription() %></td>
            <td><%=classes.get(j).getMensualite() %></td>
            <td><%=classes.get(j).getAutres_frais() %></td>
            <td><%=classes.get(j).getFiliere().getLibelle() %></td>
        </tr>
        <%
                i++;
            }
        %>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
