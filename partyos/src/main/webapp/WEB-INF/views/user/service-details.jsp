<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Service Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #667eea, #764ba2);
	font-family: 'Poppins', sans-serif;
}

.card {
	border-radius: 20px;
}

.hero-img {
	height: 350px;
	object-fit: cover;
	border-radius: 20px;
}

.btn-main {
	background: linear-gradient(135deg, #ff9800, #ff5722);
	border-radius: 25px;
	color: white;
}
</style>
</head>

<body>

	<div class="container mt-5">

		<div class="card p-4 shadow-lg">

			<!-- IMAGE -->
			<img
				src="${empty service.imageUrl ? '/images/default.png' : service.imageUrl}"
				class="img-fluid hero-img mb-4">

			<!-- TITLE -->
			<h2>${service.businessName}</h2>
			<p class="text-muted">${service.serviceType}</p>

			<!-- BASIC INFO -->
			<p>
				📍 <b>${service.city}</b>
			</p>
			<p>💰 ₹${service.minPrice} - ₹${service.maxPrice}</p>

			<hr>

			<!-- DESCRIPTION -->
			<h5>📄 Description</h5>
			<p>${service.description}</p>

			<!-- CONTACT -->
			<h5>📞 Contact</h5>
			<p>${service.contactInfo}</p>

			<!-- SOCIAL -->
			<h5>🌐 Social Links</h5>

			<c:if test="${not empty service.instagram}">
				<p>📸 Instagram: ${service.instagram}</p>
			</c:if>

			<c:if test="${not empty service.facebook}">
				<p>📘 Facebook: ${service.facebook}</p>
			</c:if>

			<c:if test="${not empty service.website}">
				<p>🌍 Website: ${service.website}</p>
			</c:if>

			<hr>

			<!-- ALCOHOL LIST (if liquor vendor) -->
			<c:if test="${not empty alcohols}">

				<h5>🍾 Available Drinks</h5>

				<c:forEach var="a" items="${alcohols}">

					<div class="card p-2 mb-2">
						<b>${a.brandName}</b> - ${a.name}
						<p>₹${a.price}</p>
					</div>

				</c:forEach>

			</c:if>

			<!-- BUTTON -->
			<a href="/user/cart/add/${service.id}"
				class="btn btn-main w-100 mt-3"> ➕ Add to Cart </a> <a
				href="/user/marketplace" class="btn btn-dark w-100 mt-2"> ⬅ Back
			</a>

		</div>

	</div>

</body>
</html>