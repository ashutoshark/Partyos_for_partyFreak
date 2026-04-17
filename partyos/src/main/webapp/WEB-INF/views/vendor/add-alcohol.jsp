<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Alcohol</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #1f1c2c, #928dab);
	font-family: 'Poppins', sans-serif;
}

.glass-card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(15px);
	border-radius: 20px;
	padding: 30px;
	color: white;
}

.form-control, .form-select {
	border-radius: 12px;
}

.btn-main {
	background: linear-gradient(135deg, #ff6a00, #ee0979);
	border-radius: 30px;
	color: white;
	font-weight: bold;
}

.preview-img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 15px;
	margin-top: 10px;
}
</style>
</head>

<body>

	<div class="container mt-5">

		<div class="glass-card shadow-lg">

			<h2>🍷 Add Alcohol</h2>
			<p class="text-light">Add drinks available in your shop</p>

			<!-- 🔥 FORM -->
			<form action="/vendor/add-alcohol" method="post"
				enctype="multipart/form-data">

				<div class="row">

					<div class="col-md-6">
						<label>Brand</label> <input name="brandName"
							class="form-control mb-3" placeholder="Johnnie Walker" required>
					</div>

					<div class="col-md-6">
						<label>Product</label> <input name="name"
							class="form-control mb-3" placeholder="Black Label" required>
					</div>

					<div class="col-md-6">
						<label>Category</label> <select name="category"
							class="form-select mb-3" required>
							<option value="">Select</option>
							<option value="BEER">🍺 Beer</option>
							<option value="WHISKEY">🥃 Whiskey</option>
							<option value="VODKA">🍸 Vodka</option>
							<option value="RUM">🍹 Rum</option>
							<option value="WINE">🍷 Wine</option>
						</select>
					</div>

					<div class="col-md-6">
						<label>City</label> <select name="city" class="form-select mb-3"
							required>
							<option value="">Select</option>
							<c:forEach var="c" items="${cities}">
								<option value="${c}">${c}</option>
							</c:forEach>
						</select>
					</div>

					<div class="col-md-6">
						<label>Price (₹)</label> <input name="price" type="number"
							class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label>Shop Name</label> <input name="shopName"
							class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label>Contact</label> <input name="contact"
							class="form-control mb-3" required>
					</div>

					<div class="col-md-6">
						<label>Upload Image</label> <input type="file" name="imageFile"
							class="form-control mb-3" accept="image/*"
							onchange="previewImage(event)">
					</div>

				</div>

				<!-- 🔥 IMAGE PREVIEW -->
				<img id="preview" class="preview-img d-none" />

				<button class="btn btn-main w-100 mt-3">Add Alcohol 🍾</button>

			</form>

		</div>

	</div>

	<script>
		function previewImage(event) {
			const img = document.getElementById('preview');
			img.src = URL.createObjectURL(event.target.files[0]);
			img.classList.remove('d-none');
		}
	</script>

</body>
</html>