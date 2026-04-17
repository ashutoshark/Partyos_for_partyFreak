<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background-color: #f1f3f6;
}

/* Sidebar */
.sidebar {
    height: 100vh;
    background: #1e293b;
    color: white;
    padding: 20px;
    position: fixed;
    width: 220px;
}

.sidebar h4 {
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    color: #cbd5e1;
    text-decoration: none;
    margin: 10px 0;
}

.sidebar a:hover {
    color: white;
}

/* Main */
.main {
    margin-left: 240px;
    padding: 20px;
}

/* Cards */
.stat-card {
    border-radius: 12px;
    padding: 20px;
    color: white;
}

.card-section {
    border-radius: 12px;
}
</style>

</head>
<body>

<!--  SIDEBAR -->
<div class="sidebar">
    <h4>🎉 PartyOS</h4>

    <a href="/admin/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="/user/allUsers"><i class="bi bi-people"></i> Users</a>
    <a href="/user/allVendors"><i class="bi bi-shop"></i> Vendors</a>
</div>

<!--  MAIN CONTENT -->
<div class="main">

    <h3 class="mb-4">👑 Admin Dashboard</h3>
    <p>Welcome back, Admin! Here's a quick overview of the platform.</p>
    <div class="mb-4"  style="text-align:right;">
        <a href="/" class="btn btn-dark">🏠 Home</a>
        </div>

    <!--  STATS -->
    <div class="row">

        <div class="col-md-4">
            <div class="stat-card bg-primary">
                <h6>Total Users</h6>
                <h3>${totalUsers}</h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card bg-success">
                <h6>Total Vendors</h6>
                <h3>${totalVendors}</h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="stat-card bg-warning text-dark">
                <h6>Pending Services</h6>
                <h3>${pendingServices}</h3>
            </div>
        </div>

    </div>

    <!--  SERVICES -->
    <div class="card mt-4 p-3 card-section shadow-sm">
        <h5>🛠 Pending Services</h5>

        <div class="row">
            <c:forEach var="s" items="${services}">
                <div class="col-md-4">
                    <div class="card p-3 mt-3 shadow-sm">

                        <h6>${s.businessName}</h6>
                        <p>${s.serviceType} | ${s.city}</p>

                        <div class="d-flex justify-content-between">
                            <a href="/admin/approve-service/${s.id}" class="btn btn-success btn-sm">Approve</a>
                            <a href="/admin/reject-service/${s.id}" class="btn btn-danger btn-sm">Reject</a>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!--  PENDING VENDORS -->
    <div class="card mt-4 p-3 card-section shadow-sm">
        <h5>⏳ Pending Vendors</h5>

        <table class="table">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

            <c:forEach var="v" items="${pendingVendors}">
                <tr>
                    <td>${v.username}</td>
                    <td>${v.email}</td>
                    <td>
                        <a href="/admin/approve-vendor/${v.id}" class="btn btn-success btn-sm">Approve</a>
                        <a href="/admin/reject-vendor/${v.id}" class="btn btn-danger btn-sm">Reject</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!--  SEARCH -->
    <div class="card mt-4 p-3 card-section shadow-sm">
        <h5>🔍 Search Vendors</h5>

        <form method="get" action="/admin/dashboard">
            <input type="text" name="keyword" class="form-control mb-3" 
                   placeholder="Search by name or email..." value="${keyword}">
        </form>

        <!-- APPROVED -->
        <h6>Approved Vendors</h6>

        <table class="table">
            <tr>
                <th>Name</th>
                <th>Email</th>
            </tr>

            <c:forEach var="v" items="${approvedVendors}">
                <tr>
                    <td>${v.username}</td>
                    <td>${v.email}</td>
                </tr>
            </c:forEach>
        </table>

        <!--  PAGINATION -->
        <div class="d-flex justify-content-between">
            <c:if test="${currentPage > 0}">
                <a href="/admin/dashboard?page=${currentPage - 1}&keyword=${keyword}" class="btn btn-secondary">Prev</a>
            </c:if>

            <c:if test="${hasNext}">
                <a href="/admin/dashboard?page=${currentPage + 1}&keyword=${keyword}" class="btn btn-primary">Next</a>
            </c:if>
        </div>
    </div>

</div>

</body>
</html>