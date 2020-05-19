
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<body>
<h2>Proje Listesi</h2>

<table>
    <th><b>Proje Code</b></th>
    <th><b>Proje Name</b></th>
<c:forEach items="${lists}" var="project">
    <tr>

        <td>${project.id}</td>&nbsp;<td>${project.projectCode}</td>&nbsp;<td>${project.projectName}</td>
        <td><a href="editproject/${project.id}">Düzenle</a></td>
        <td><a href="deleteproject/${project.id}">Sil</a></td>

    </tr>


</c:forEach>
</table>


</body>
</html>