
 
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>

<html>
<head>
<title>PartyOS - Plan Your Perfect Party</title>

<!-- Bootstrap -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Icons -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Font -->

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
	rel="stylesheet">
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.map(el => new bootstrap.Tooltip(el))
</script>

<style>
body {
	font-family: 'Poppins', sans-serif;
	background: linear-gradient(135deg, #5f6fff, #9d4edd);
	color: white;
}

/* Navbar */
.navbar {
	backdrop-filter: blur(10px);
	background: rgba(0, 0, 0, 0.2);
}

.nav-icon {
    font-size: 22px;
    color: white;
    transition: all 0.3s ease;
    padding: 8px;
    border-radius: 50%;
}

/* 🔥 Hover effect */
.nav-icon:hover {
    color: #ffd369;
    background: rgba(255,255,255,0.15);
    transform: scale(1.2);
}
.tooltip-inner {
    background-color: #111;
    font-size: 13px;
    border-radius: 8px;
    padding: 6px 10px;
}

/* Hero */
.hero {
	text-align: center;
	padding: 120px 20px 80px;
}

.hero h1 {
	font-size: 55px;
	font-weight: 700;
}

.hero p {
	font-size: 18px;
	opacity: 0.9;
}

/* Button */
.btn-main {
	background: white;
	color: #6a11cb;
	padding: 12px 30px;
	border-radius: 30px;
	font-weight: 500;
	transition: 0.3s;
}

.btn-main:hover {
	background: #ffd369;
	color: black;
}

/* Cards */
.glass-card {
	background: rgba(255, 255, 255, 0.12);
	border-radius: 15px;
	padding: 25px;
	backdrop-filter: blur(12px);
	transition: 0.3s;
	height: 100%;
}

.glass-card:hover {
	transform: translateY(-8px);
}

/* Section spacing */
.section {
	margin-top: 80px;
}

/* Steps */
.step-circle {
	width: 60px;
	height: 60px;
	background: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	line-height: 60px;
	margin: auto;
	font-size: 22px;
}
</style>

</head>

<body>

	<!-- 🔝 NAVBAR -->
	<nav class="navbar navbar-expand-lg px-3">
		<div class="container">

			<a class="navbar-brand text-white fw-bold fs-4" href="/">🎉
				PartyOS</a>

			<div class="ms-auto d-flex align-items-center gap-4">

				<!-- ✅ LOGGED IN -->
				<c:if test="${not empty sessionScope.user}">
					<span class="fw-light">Hi, ${sessionScope.user.username}</span>

					<a href="/user/profile" data-bs-toggle="tooltip" title="Profile">
						<i class="bi bi-person-circle nav-icon"></i>
					</a>

					<a href="/user/cart" class="position-relative text-white"
						data-bs-toggle="tooltip" title="Cart"> <i
						class="bi bi-cart3 nav-icon"></i> <c:if test="${cartCount > 0}">
							<span
								class="badge bg-danger position-absolute top-0 start-100 translate-middle">
								${cartCount} </span>
						</c:if>
					</a>

					<a href="/user/logout" data-bs-toggle="tooltip" title="Logout">
						<i class="bi bi-box-arrow-right nav-icon"></i>
					</a>
				</c:if>

				<!-- ❌ NOT LOGGED IN -->
				<c:if test="${empty sessionScope.user}">
					<a href="/user/login" data-bs-toggle="tooltip" title="Login"> <i
						class="bi bi-box-arrow-in-right nav-icon"></i>
					</a>

					<a href="/user/register" data-bs-toggle="tooltip" title="Register">
						<i class="bi bi-person-plus nav-icon"></i>
					</a>
				</c:if>

				<!-- 🔐 ADMIN -->
				<a href="/admin/login" data-bs-toggle="tooltip" title="Admin Login">
					<i class="bi bi-shield-lock nav-icon"></i>
				</a>

			</div>
		</div>
	</nav>

	<!-- 🎯 HERO -->

	<section class="hero">
		<h1>Plan Your Perfect Party 🎉</h1>
		<p>From house parties to big events — manage everything in one
			place</p>


		<c:if test="${empty sessionScope.user}">
			<a href="/user/register" class="btn btn-main mt-3">Start Planning
				🚀</a>
		</c:if>


	</section>

	<!-- ⭐ FEATURES -->

	<section class="container section">
		<div class="row g-4 text-center">


			<div class="col-md-3">
				<a href="/user/smart-plan" class="text-decoration-none text-white">
					<div class="glass-card">
						<h5>📅 Smart Planning</h5>
						<p>AI-based planning & budgeting</p>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="/user/marketplace" class="text-decoration-none text-white">
					<div class="glass-card">
						<h5>🍽 Marketplace</h5>
						<p>Book DJs, caterers & decorators</p>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="/alcohol/reserve" class="text-decoration-none text-white">
					<div class="glass-card">
						<h5>🍷 Alcohol Reservation</h5>
						<p>Reserve from licensed shops</p>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<div class="glass-card">
					<h5>🎉 Management</h5>
					<p>Execute your party seamlessly</p>
				</div>
			</div>

		</div>


	</section>

	<!-- 🔄 HOW IT WORKS -->

	<section class="container text-center section">
		<h2 class="mb-5">How It Works</h2>


		<div class="row">

			<div class="col-md-4">
				<div class="step-circle">1</div>
				<h5 class="mt-3">Create Event</h5>
				<p>Select date, guests & budget</p>
			</div>

			<div class="col-md-4">
				<div class="step-circle">2</div>
				<h5 class="mt-3">Get Recommendations</h5>
				<p>Smart suggestions & vendors</p>
			</div>

			<div class="col-md-4">
				<div class="step-circle">3</div>
				<h5 class="mt-3">Book & Enjoy</h5>
				<p>Finalize and execute</p>
			</div>

		</div>


	</section>

	<!-- 🔻 FOOTER -->

	<footer class="text-center mt-5 pb-4">
		<p>© 2026 PartyOS • Made with ❤️</p>
	</footer>

</body>
</html>

 