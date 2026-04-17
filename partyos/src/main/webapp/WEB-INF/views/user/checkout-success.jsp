<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Success</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #28a745, #218838);
	color: white;
	text-align: center;
	padding-top: 100px;
}

.card {
	border-radius: 20px;
}
</style>

</head>

<body>

	<div class="container">

		<div class="card p-5 shadow-lg">

			<h1>🎉 Booking Successful!</h1>

			<p class="mt-3">Your services have been successfully booked.</p>

			<div class="mt-4">

				<a href="/user/profile" class="btn btn-light"> View Bookings 📦
				</a> <a href="/user/marketplace" class="btn btn-outline-light">
					Explore More 🛍 </a>

			</div>

		</div>

	</div>

</body>
</html>