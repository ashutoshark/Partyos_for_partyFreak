<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Alcohol Reservation</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	font-family: 'Poppins', sans-serif;
	color: white;
}

.card {
	border-radius: 18px;
	transition: 0.3s;
	border: none;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
}

.service-img {
	height: 150px;
	object-fit: cover;
	border-radius: 12px;
}

.filter-btn {
	border-radius: 25px;
	margin: 5px;
}

.qty-input {
	width: 60px;
}

.top-bar {
	text-align: center;
	margin-bottom: 20px;
}
</style>

</head>

<body>

	<div class="container mt-4">

		<!--  TITLE -->
		<div class="top-bar">
		<h2>🍷 Alcohol Reservation</h2>
			<div class="mb-4" style="text-align:right;">
            <a href="/" class="btn btn-light">🏠 Home</a>
            </div>
			<p>Select your drinks and reserve instantly</p>
		</div>
		

		<!-- FILTER BUTTONS -->
		<div class="text-center mb-4">

			<!-- SHOW ALL -->
			<a href="/alcohol/reserve?category=ALL"
				class="btn btn-light filter-btn">🍾 All</a>

			<!-- CATEGORY LOOP -->
			<c:forEach var="c" items="${categories}">
				<a href="/alcohol/reserve?category=${c}"
					class="btn btn-light filter-btn"> ${c} </a>
			</c:forEach>

		</div>

		<!--  FORM -->
		<form action="/alcohol/reserve" method="post">

			<div class="row">

				<c:forEach var="a" items="${items}">

					<div class="col-md-3">

						<div class="card p-3 mb-3 text-dark">

							<!--  IMAGE (AUTO FALLBACK) -->


							<img src="${a.displayImage}" class="img-fluid service-img mb-2"
								loading="lazy"
								onerror="this.src='https://via.placeholder.com/300x200'">

							<h6>${a.brandName}</h6>
							<small class="text-muted">${a.name}</small>

							<p class="mb-1">🍾 ${a.category}</p>
							<p class="mb-1">💰 ₹${a.price}</p>

							<small>🏪 ${a.shopName}</small> <small>📞 ${a.contact}</small>

							<div class="d-flex justify-content-between mt-2">

								<input type="checkbox" name="ids" value="${a.id}"> <input
									type="number" name="qty_${a.id}" class="form-control qty-input"
									min="1" value="1">

							</div>

						</div>

					</div>

				</c:forEach>

			</div>

			<c:choose>

				<c:when test="${sessionScope.user != null}">
					<button class="btn btn-light w-100 mt-3">Reserve &
						Continue 🚀</button>
				</c:when>

				<c:otherwise>
					<a href="/user/login" class="btn btn-warning w-100 mt-3"> Login to
						Reserve 🔐 </a>
				</c:otherwise>

			</c:choose>

		</form>

	</div>

</body>
</html>