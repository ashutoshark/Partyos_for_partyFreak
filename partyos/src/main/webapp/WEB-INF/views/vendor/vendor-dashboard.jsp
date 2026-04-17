<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Vendor Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
	background: #f4f6f9;
}

/* Card UI */
.dashboard-card {
	border-radius: 15px;
	padding: 20px;
	cursor: pointer;
	transition: 0.2s;
}

.dashboard-card:hover {
	transform: scale(1.03);
}

.card-title {
	font-weight: bold;
}
</style>

</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-dark bg-dark px-3">
		<span class="navbar-brand">🎉 PartyOS Vendor</span> <a
			href="/user/logout" class="btn btn-danger btn-sm">Logout</a>
	</nav>

	<div class="container mt-4">

		<h3>Welcome, ${sessionScope.user.username} 👑</h3>

		<!-- 🔥 TOP CARDS -->
		<div class="row mt-4">

			<!-- 📦 SERVICES -->
			<div class="col-md-4">
				<div class="card dashboard-card shadow-sm"
					onclick="window.location='/vendor/my-services'">

					<h5 class="card-title">📦 My Services</h5>
					<p>Total Services: ${servicesCount}</p>
				</div>
			</div>

			<!-- ➕ ADD -->
			<div class="col-md-4">
				<div class="card dashboard-card bg-primary text-white shadow-sm"
					onclick="window.location='/vendor/add-service'">

					<h5 class="card-title">➕ Add Service</h5>
					<p>Create new listing</p>
				</div>
			</div>
			<!-- ➕ ADD ALCOHOL -->

			<c:if test="${isLiquorVendor}">
				<div class="col-md-4">
					<div class="card dashboard-card bg-warning text-white shadow-sm"
						onclick="window.location='/vendor/add-alcohol'">

						<h5 class="card-title">🍷 Add Alcohol</h5>
						<p>Create new alcohol listing</p>
					</div>
				</div>
			</c:if>

			<!-- 💰 REVENUE -->
			<div class="col-md-4">
				<div class="card dashboard-card shadow-sm">
					<h5 class="card-title">💰 Revenue</h5>

					<p>Today: ₹${todayRevenue}</p>
					<p>Week: ₹${weekRevenue}</p>
					<p>Year: ₹${yearRevenue}</p>

					<canvas id="revenueChart"></canvas>
				</div>
			</div>

		</div>

		<!-- ⭐ FEEDBACK -->
		<div class="card mt-4 p-3 shadow-sm dashboard-card"
			onclick="window.location='/vendor/feedbacks'">

			<h5>⭐ Customer Feedback</h5>

			<table class="table">
				<tr>
					<th>User</th>
					<th>Service</th>
					<th>Rating</th>
				</tr>

				<c:forEach var="f" items="${feedbacks}">
					<tr>
						<td>${f.user.username}</td>
						<td>${f.service.businessName}</td>
						<td>${f.rating}</td>
					</tr>
				</c:forEach>

			</table>
		</div>

		<!-- 🔥 FREQUENT BUYERS -->
		<div class="card mt-4 p-3 shadow-sm dashboard-card"
			onclick="window.location='/vendor/buyers'">

			<h5>🔥 Frequent Buyers</h5>

			<table class="table">
				<tr>
					<th>User</th>
					<th>Orders</th>
				</tr>

				<!-- Placeholder -->
				<tr>
					<td>Aman</td>
					<td>5</td>
				</tr>

			</table>
		</div>

	</div>

	<!-- 🔥 SIMPLE GRAPH -->
	<script>
		const ctx = document.getElementById('revenueChart');

		new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri' ],
				datasets : [ {
					label : 'Revenue',
					data : [ 1000, 2000, 1500, 3000, 2500 ]
				} ]
			}
		});
	</script>

</body>
</html>