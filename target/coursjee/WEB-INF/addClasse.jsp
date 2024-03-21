<%--
  Created by IntelliJ IDEA.
  User: Mamadou Diouf
  Date: 12/03/2024
  Time: 17:48
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
<label>${message}</label>
<form action="<%=request.getContextPath()%>/classe" method="post" class="col-6">
    <input type="hidden" name="action" value="${selectedClasse == null ? 'add' : 'update'}">
    <input type="hidden" name="classeId" value="${selectedClasse.id}">
    <fieldset >
        <legend>Disabled fieldset example</legend>
        <div class="mb-3">
            <label  class="form-label">Libelle</label>
            <input type="text" name="libelle" value="${selectedClasse.libelle}" class="form-control" placeholder="libelle">
        </div>
        <div class="mb-3">
            <label class="form-label">Code</label>
            <input type="text" name="code" value="${selectedClasse.code}" class="form-control" placeholder="code">
        </div>
        <div class="mb-3">
            <label  class="form-label">Frais Inscription</label>
            <input type="number" name="frais_inscription" value="${selectedClasse.frais_inscription}" class="form-control" placeholder="frais_inscription">
        </div>
        <div class="mb-3">
            <label  class="form-label">Mensualité</label>
            <input type="number" name="mensualite" value="${selectedClasse.mensualite}" class="form-control" placeholder="Mensualité">
        </div>
        <div class="mb-3">
            <label  class="form-label">Autres Frais</label>
            <input type="number" name="autres_frais" value="${selectedClasse.autres_frais}" class="form-control" placeholder="Autres Frais">
        </div>
        <div class="mb-3">
            <label for="disabledSelect" class="form-label">Filiere</label>
            <select id="disabledSelect" class="form-select" name="idfiliere" required>
                <option value="">Filiere</option>
                <c:forEach var="f" items="${requestScope.data}">
                    <c:choose>
                        <c:when test="${f.id == selectedClasse.filiere.id}">
                            <option selected value="${f.id}">${f.libelle}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${f.id}">${f.libelle}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </fieldset>
</form>
</body>
</html>
