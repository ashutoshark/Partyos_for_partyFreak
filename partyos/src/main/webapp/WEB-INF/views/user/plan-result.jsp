<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Your Plan</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

.card {
	border-radius: 20px;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<div class="card p-4 shadow-lg">

			<h3>🎉 Your Smart Party Plan</h3>

			<div class="card p-3 mb-4 shadow-sm">

				<h5>👤 User Details</h5>

				<p>
					<b>Name:</b> ${user.username}
				</p>
				<p>
					<b>Email:</b> ${user.email}
				</p>

				<c:if test="${not empty profile.phone}">
					<p>
						<b>Phone:</b> ${profile.phone}
					</p>
					<p>
						<b>City:</b> ${profile.city}
					</p>
					<p>
						<b>Address:</b> ${profile.address}
					</p>
				</c:if>

				<c:if test="${empty profile.phone}">
					<p class="text-muted">No contact details added</p>
				</c:if>

			</div>

			<ul class="mt-3">

				<c:forEach var="p" items="${plans}">
					<li>${p}</li>
				</c:forEach>

			</ul>
			<hr>

			<h4>💰 Estimated Cost</h4>
			<p class="text-success fw-bold">₹ ${estimatedCost}</p>
			<h5>🎧 DJ Services</h5>
			<c:forEach var="v" items="${djList}">
				<div class="card p-2 mb-2">
					<b>${v.businessName}</b> - ₹${v.minPrice}
					<p>${v.city}</p>
				</div>
			</c:forEach>
			<h5>🍽 Catering</h5>
			<c:forEach var="v" items="${cateringList}">
				<div class="card p-2 mb-2">
					<b>${v.businessName}</b> - ₹${v.minPrice}
				</div>
			</c:forEach>
			<h5>🎨 Decoration</h5>
			<c:forEach var="v" items="${decorList}">
				<div class="card p-2 mb-2">
					<b>${v.businessName}</b> - ₹${v.minPrice}
				</div>
			</c:forEach>

			<h4 class="mt-4">💡 Recommended Vendors</h4>

			<c:forEach var="entry" items="${vendors}">

				<h5 class="mt-3">${entry.key}</h5>

				<c:forEach var="v" items="${entry.value}">
					<div class="card p-2 mb-2">

						<b>${v.businessName}</b> <br> 📍 ${v.city} <br> 💰
						₹${v.minPrice} - ₹${v.maxPrice} <br> 📞 ${v.contactInfo}

					</div>
				</c:forEach>

			</c:forEach>

			cost = ${estimatedCost} + 5000;
			<!-- Adding fixed cost for venue -->
			<div class="alert alert-success mt-4">
				<h5>💰 Estimated Cost: ₹${cost}</h5>
			</div>

			<div class="mt-4">

				<a href="/user/download-plan/${event.id}" class="btn btn-success">
					📄 Download PDF </a> <a href="/user/profile" class="btn btn-primary">
					Go to Dashboard </a> <a href="/" class="btn btn-secondary"> Home </a>

			</div>

		</div>

	</div>

</body>
</html>