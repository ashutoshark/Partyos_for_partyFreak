<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Smart Planning</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- ICONS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #667eea, #764ba2);
	font-family: 'Poppins', sans-serif;
	color: white;
}

/* 🔥 GLASS CARD */
.card {
	border-radius: 25px;
	background: rgba(255, 255, 255, 0.12);
	backdrop-filter: blur(15px);
	border: none;
}

/* 🔥 INPUT STYLE */
.form-control, .form-select {
	border-radius: 12px;
	border: none;
	padding: 10px;
}

.form-control:focus {
	box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
}

/* 🔥 BUTTON */
.btn-main {
	background: linear-gradient(135deg, #ff6a00, #ee0979);
	color: white;
	border-radius: 30px;
	font-weight: bold;
	padding: 10px;
	transition: 0.3s;
}

.btn-main:hover {
	transform: scale(1.03);
}

/* 🔥 SERVICE BOX */
.service-box {
	background: rgba(255, 255, 255, 0.2);
	padding: 10px 15px;
	border-radius: 15px;
	margin: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.service-box:hover {
	background: rgba(255, 255, 255, 0.35);
}

/* 🔥 ICON */
.icon {
	margin-right: 6px;
}

/* 🔥 HEADER */
.heading {
	text-align: center;
	margin-bottom: 20px;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<div class="card p-4 shadow-lg">

			<!-- 🔥 HEADER -->
			<div class="heading">
				<h2>🎉 Smart Party Planner</h2>
				<p>Plan your perfect event in seconds 🚀</p>
			</div>

			<form action="/user/generate-plan" method="post">

				<div class="row">

					<div class="col-md-6">
						<label><i class="bi bi-geo-alt icon"></i>City</label> <input
							name="city" class="form-control mb-3" placeholder="Enter city"
							required>
					</div>

					<div class="col-md-6">
						<label><i class="bi bi-people icon"></i>Guests</label> <input
							name="guests" type="number" min="1" max="500"
							class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label><i class="bi bi-calendar icon"></i>Date</label> <input
							type="date" name="date" class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label><i class="bi bi-clock icon"></i>Time</label> <input
							type="time" name="time" class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label><i class="bi bi-cash icon"></i>Budget (₹)</label> <input
							name="budget" type="number" min="100" class="form-control mb-3"
							required>
					</div>

					<div class="col-md-6">
						<label><i class="bi bi-egg-fried icon"></i>Food Preference</label>
						<select name="food" class="form-select mb-3">
							<option>Vegetarian</option>
							<option>Non-Vegetarian</option>
							<option>Mixed</option>
						</select>
					</div>

				</div>

				<!-- 🔥 SERVICES -->
				<h5 class="mt-3 mb-2">✨ Select Services</h5>

				<div class="d-flex flex-wrap">

					<label class="service-box"> <input type="checkbox"
						name="services" value="DJ"> 🎧 DJ
					</label> <label class="service-box"> <input type="checkbox"
						name="services" value="DECORATION"> 🎨 Decoration
					</label> <label class="service-box"> <input type="checkbox"
						name="services" value="CATERING"> 🍽 Catering
					</label> <label class="service-box"> <input type="checkbox"
						name="services" value="BARTENDER"> 🍸 Bartender
					</label>

				</div>

				<!-- 🔥 SUBMIT -->
				<button class="btn btn-main w-100 mt-4">Generate Smart Plan
					🚀</button>

			</form>

		</div>

	</div>

</body>
</html>