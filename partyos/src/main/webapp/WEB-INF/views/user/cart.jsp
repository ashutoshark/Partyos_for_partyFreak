<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Your Cart</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f6f7fb;
	font-family: 'Poppins', sans-serif;
}

/* Navbar */
.navbar {
	background: #1f1f2e;
}

/* Card */
.service-card {
	border-radius: 15px;
	transition: 0.3s;
	border: none;
}

.service-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* Image */
.service-img {
	height: 150px;
	object-fit: cover;
	border-radius: 10px;
}

/* Total Box */
.total-box {
	background: white;
	padding: 25px;
	border-radius: 15px;
	position: sticky;
	top: 20px;
}

/* Buttons */
.btn-checkout {
	background: linear-gradient(135deg, #28a745, #218838);
	border: none;
	border-radius: 25px;
}

.btn-remove {
	border-radius: 20px;
}

/* Empty state */
.empty-box {
	text-align: center;
	padding: 60px;
	background: white;
	border-radius: 15px;
}
</style>

</head>

<body>

	<!--  NAVBAR -->
	<nav class="navbar navbar-dark px-4">
		<span class="navbar-brand">🛒 Your Cart</span>

		<div class="d-flex gap-3">
			<a href="/user/marketplace" class="btn btn-light btn-sm">Continue
				Shopping</a>
		</div>
		<div class="ms-auto d-flex align-items-center gap-4">

			<!--  CART -->
			<a href="/user/cart" class="position-relative text-white fs-5">

				🛒 <c:if test="${cartCount > 0}">
					<span
						class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						${cartCount} </span>
				</c:if>

			</a>

			<!--  PROFILE -->
			<a href="/user/profile" class="text-white fs-5"> 👤 </a>

		</div>
	</nav>

	<div class="container mt-4">

		<c:choose>

    <%-- EMPTY CART --%>
    <c:when test="${empty services}">

        <div class="empty-box shadow-sm">
            <h3>😢 Your cart is empty</h3>
            <p class="text-muted">Start adding services to plan your party</p>

            <a href="/user/marketplace" class="btn btn-primary mt-3">
                Browse Marketplace 🚀
            </a>
        </div>

    </c:when>

    <%-- CART ITEMS --%>
    <c:otherwise>

        <div class="row">

            <!-- LEFT SIDE -->
            <div class="col-md-8">

                <c:forEach var="s" items="${services}">

                    <div class="card service-card mb-3 p-3">

                        <div class="row align-items-center">

                            <div class="col-md-4">
                                <img src="${empty s.imageUrl ? '/images/default.jpg' : s.imageUrl}" 
                                     class="img-fluid service-img">
                            </div>

                            <div class="col-md-5">
                                <h5>${s.businessName}</h5>
                                <p class="text-muted mb-1">📍 ${s.city}</p>
                                <p class="mb-1">💰 ₹${s.minPrice} - ₹${s.maxPrice}</p>
                            </div>

                            <div class="col-md-3 text-end">
                                <a href="/user/cart/remove/${s.id}"
                                   class="btn btn-outline-danger btn-sm btn-remove">
                                    Remove ❌
                                </a>
                            </div>

                        </div>

                    </div>

                </c:forEach>

            </div>

            <!-- RIGHT SIDE -->
            <div class="col-md-4">

                <div class="total-box shadow">

                    <h4>Total Amount</h4>
                    <hr>

                    <h2>₹ ${total}</h2>

                    <p class="text-muted">Inclusive of all services</p>

                    <a href="/user/cart/checkout"
                       class="btn btn-checkout w-100 mt-3 text-white">
                        Checkout 🚀
                    </a>

                    <a href="/user/marketplace"
                       class="btn btn-outline-secondary w-100 mt-2">
                        Add More Services
                    </a>

                </div>

            </div>

        </div>

    </c:otherwise>

</c:choose>

	</div>

</body>
</html>