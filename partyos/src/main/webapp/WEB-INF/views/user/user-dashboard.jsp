<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

.card {
	border-radius: 15px;
}
</style>

</head>

<body>

	<nav class="navbar navbar-dark bg-dark px-3">
		<span class="navbar-brand">👤 My Profile</span> <a href="/"
			class="btn btn-light btn-sm">Home</a>
	</nav>

	<div class="container mt-4">

		<!-- 🔥 PROFILE -->
		<div class="card p-4 shadow-sm">

			<div class="d-flex justify-content-between">
				<h4>👤 Profile Info</h4>
				<a href="/user/edit-profile" class="btn btn-primary btn-sm">Edit</a>
			</div>

			<p>
				<b>Username:</b> ${user.username}
			</p>
			<p>
				<b>Email:</b> ${user.email}
			</p>

		</div>

		<!-- 🔥 CONTACT DETAILS -->
		<div class="card mt-4 p-4 shadow-sm">

			<div class="d-flex justify-content-between">
				<h4>📍 Contact Details</h4>
				<a href="/user/edit-details" class="btn btn-success btn-sm">
					${empty profile.phone ? "Add" : "Edit"} </a>
			</div>

			<c:if test="${not empty profile.phone}">
				<p>
					<b>Phone:</b> ${profile.phone}
				</p>
				<p>
					<b>Address:</b> ${profile.address}
				</p>
				<p>
					<b>City:</b> ${profile.city}
				</p>
			</c:if>

			<c:if test="${empty profile.phone}">
				<p class="text-muted">No contact details added yet.</p>
			</c:if>

		</div>
	</div>

	<!-- 👤 PROFILE INFO 
	<div class="card p-3 mb-4 shadow-sm">
		<h5>Profile Info</h5>
		<p>Name: ${user.username}</p>
		<p>Email: ${user.email}</p>
	</div>
   -->

	<!-- 📦 BOOKING HISTORY (ADD HERE) -->
	<h4 class="mt-4">📦 Your Bookings</h4>

	<div class="card p-3 shadow-sm">
	 

		<table class="table mt-3">
			<tr>
				<th>Service</th>
				<th>City</th>
				<th>Status</th>
			</tr>

			<c:forEach var="b" items="${bookings}">
				<tr>
					<td>${b.service.businessName}</td>
					<td>${b.service.city}</td>
					<td>${b.status}</td>
				</tr>
			</c:forEach>

		</table>
	</div>

	</div>

</body>
</html>