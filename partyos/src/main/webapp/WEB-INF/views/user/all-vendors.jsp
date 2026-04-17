<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>All Vendor</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="container mt-5">

<h2 class="mb-4">👥 All Vendor</h2>

<table class="table table-bordered table-striped">

    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Status</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="vendor" items="${vendors}">
            <tr>
                <td>${vendor.id}</td>
                <td>${vendor.username}</td>
                <td>${vendor.email}</td>
                <td>${vendor.role}</td>
                <td>${vendor.status}</td>
                  
            </tr>
        </c:forEach>
    </tbody>

</table>

</body>
</html>