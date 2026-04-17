<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="card shadow p-3">
    <h5>${s.businessName}</h5>
    <p>${s.description}</p>

    <span class="badge bg-warning">Pending</span>

    <div class="mt-2">
        <a href="/admin/approve-service/${s.id}" class="btn btn-success btn-sm">Approve</a>
        <a href="/admin/reject-service/${s.id}" class="btn btn-danger btn-sm">Reject</a>
    </div>
</div>
</body>
</html>