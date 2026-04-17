<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Marketplace</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #667eea, #764ba2);
	font-family: 'Poppins', sans-serif;
}

.navbar {
	background: rgba(0, 0, 0, 0.4);
	backdrop-filter: blur(10px);
}

.card {
	border-radius: 20px;
	transition: 0.3s;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
}

.service-img {
	height: 180px;
	object-fit: cover;
	border-radius: 15px;
}

.filter-box {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	border-radius: 15px;
	padding: 15px;
}

.btn-cart {
	background: linear-gradient(135deg, #ff9800, #ff5722);
	border-radius: 25px;
	color: white;
}

.price {
	font-weight: bold;
	color: #ff9800;
}
</style>
</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar px-4 text-white d-flex justify-content-between">
		<a href="/" class="fs-4 text-white text-decoration-none">🎉
			PartyOS</a>

		<div class="d-flex align-items-center gap-4">

			<a href="/" class="text-white fs-5"><i
				class="bi bi-house-door-fill"></i></a> <a href="/user/cart"
				class="text-white position-relative fs-5"> <i
				class="bi bi-cart-fill"></i> <c:if test="${cartCount > 0}">
					<span
						class="badge bg-danger position-absolute top-0 start-100 translate-middle">
						${cartCount} </span>
				</c:if>
			</a>

			<c:choose>
				<c:when test="${user != null}">
					<span>👤 ${user.username}</span>
					<a href="/user/logout" class="text-warning"> <i
						class="bi bi-box-arrow-right"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a href="/user/login" class="text-white"> <i
						class="bi bi-person-circle"></i>
					</a>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>

	<div class="container mt-4">

		<!-- FILTER -->
		<div class="filter-box mb-4">
			<form method="get" action="/user/marketplace">

				<div class="row g-2">

					<div class="col-md-3">
						<input name="search" value="${param.search}" class="form-control"
							placeholder="🔍 Search vendor">
					</div>

					<div class="col-md-2">
						<select name="type" class="form-control">
							<option value="ALL">All</option>
							<c:forEach var="t" items="${serviceTypes}">
								<option value="${t}"
									${param.type == t.toString() ? 'selected' : ''}>${t}</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-2">
						<select name="city" class="form-control">
							<option value="">All Cities</option>
							<option value="BANGALORE">Bangalore</option>
							<option value="DELHI">Delhi</option>
							<option value="MUMBAI">Mumbai</option>
							<option value="PUNE">Pune</option>
						</select>
					</div>

					<div class="col-md-1">
						<input name="minPrice" value="${param.minPrice}"
							class="form-control" placeholder="Min">
					</div>

					<div class="col-md-1">
						<input name="maxPrice" value="${param.maxPrice}"
							class="form-control" placeholder="Max">
					</div>

					<div class="col-md-2">
						<select name="sort" class="form-control">
							<option value="">Sort</option>
							<option value="low">Price ↑</option>
							<option value="high">Price ↓</option>
						</select>
					</div>

					<div class="col-md-1">
						<button class="btn btn-light w-100">Go</button>
					</div>

				</div>
			</form>
		</div>

		<!-- 🔥 EMPTY STATE -->
		<c:if test="${empty services}">
			<div class="text-center text-white mt-5">
				<h4>😔 No services found</h4>
				<p>Try changing filters</p>
			</div>
		</c:if>

		<!-- PRODUCTS -->
		<div class="row">

			<c:forEach var="v" items="${services}">

				<div class="col-md-3 mb-4">

					<a href="/user/service/${v.id}"
						style="text-decoration: none; color: inherit;">
						<div class="card p-3 h-100">

							<img
								src="${empty v.imageUrl ? '/images/default.png' : v.imageUrl}"
								class="service-img">

							<h6 class="mt-2">${v.businessName}</h6>

							<small class="text-muted">${v.serviceType}</small>

							<p>📍 ${v.city}</p>

							<p class="price">₹${v.minPrice} - ₹${v.maxPrice}</p>

							<a href="/user/cart/add/${v.id}" class="btn btn-cart w-100">➕
								Add</a>

						</div>
					</a>

				</div>

			</c:forEach>

		</div>

		<!-- 🔥 PAGINATION SAFE -->
		<c:if test="${not empty services && totalPages > 0}">
			<div class="d-flex justify-content-center mt-4">
				<ul class="pagination">

					<li class="page-item ${currentPage == 0 ? 'disabled' : ''}"><a
						class="page-link"
						href="?page=${currentPage - 1}&type=${param.type}&city=${param.city}&search=${param.search}">
							Prev </a></li>

					<c:forEach begin="0" end="${totalPages - 1}" var="i">
						<li class="page-item ${i == currentPage ? 'active' : ''}"><a
							class="page-link"
							href="?page=${i}&type=${param.type}&city=${param.city}&search=${param.search}">
								${i + 1} </a></li>
					</c:forEach>

					<li
						class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
						<a class="page-link"
						href="?page=${currentPage + 1}&type=${param.type}&city=${param.city}&search=${param.search}">
							Next </a>
					</li>

				</ul>
			</div>
		</c:if>

	</div>

</body>
</html>