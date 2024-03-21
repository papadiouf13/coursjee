<%@ page import="model.Classe" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mamadou Diouf
  Date: 11/03/2024
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<a href="<%=request.getContextPath()%>/classe?action=add" class="btn btn-secondary">Ajouter une Classe</a>
<div container>
    <div col-6>
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
            <th scope="col"> Action</th>
        </tr>
        </thead>
        <tbody>
       <c:forEach var="classe" items="${requestScope.data}">
        <tr>
            <th scope="row"><c:out value="i"/></th>
            <td>${classe.libelle}</td>
            <td>${classe.code}</td>
            <td>${classe.frais_inscription}</td>
            <td>${classe.mensualite}</td>
            <td>${classe.autres_frais}</td>
            <td>${classe.filiere.libelle}</td>
            <td>
                <a href="<%=request.getContextPath()%>/classe?action=edit&id=${classe.id}" class="btn btn-primary">Modifier</a>
                <button type="button" class="btn btn-danger del" data-bs-toggle="modal" id="del" data-bs-target="#exampleModal" data="${classe.id}">
                    Supprimer
                </button>
            </td>
        </tr>
           <c:set var="i" value="${i + 1}" scope="page"/>
       </c:forEach>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="POST" action="<%=request.getContextPath()%>/classe">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" id="idClasse">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>Etes-vous sure de bien vouloir supprimer la classe
                    <label id="message"></label></h5>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">OK</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">ANNULER</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    </div>
</div>
<script src="http://code.jquery.com/jquery-1.9.0rc1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0rc1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript">

        $(document).ready(function () {
            $(".del").click(function () {

                //var $item = $(this).closest("tr")   // Finds the closest row <tr>
                    //.find(".del");     // Gets a descendent with class="nr"

                console.log($(this).attr("data"))
                $.ajax({
                    url: "classe",
                    type: "get", //send it through get method
                    data: {
                        action: "delete",
                        id: $(this).attr("data")
                    },
                    success: function(response) {
                        console.log(response)
                        $("#message").text(response.libelle)
                        $("#idClasse").val(response.id)
                    },
                    error: function(xhr) {
                        console.log(xhr)
                    }
                })
                return false;
            })
        })


</script>
</body>
</html>
