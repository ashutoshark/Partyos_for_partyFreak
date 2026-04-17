<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Service</title>
<script>
	function previewImage(event) {
		const file = event.target.files[0];
		const preview = document.getElementById('preview');

		if (file) {
			preview.src = URL.createObjectURL(file);
			preview.style.display = "block";
		}
	}
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

.form-card {
	max-width: 500px;
	margin: auto;
	margin-top: 40px;
	padding: 20px;
	border-radius: 15px;
}
</style>

</head>

<body>

	<nav class="navbar navbar-dark bg-dark px-3">
		<span class="navbar-brand">🎉 Add Service</span> <a
			href="/vendor/vendor-dashboard" class="btn btn-light btn-sm">Back</a>
	</nav>

	<div class="card form-card shadow">

		<h4 class="mb-3 text-center">➕ Add New Service</h4>

		<form action="/vendor/add-service" method="post"
			enctype="multipart/form-data">

			<input name="businessName" placeholder="Business Name"
				class="form-control mb-2" required>
			<%@ taglib prefix="c" uri="jakarta.tags.core"%>

			<!-- CITY -->
			<select name="city" class="form-control mb-2" required>
				<option value="">Select City</option>
				<c:forEach var="c" items="${cities}">
					<option value="${c}">${c}</option>
				</c:forEach>
			</select>

			<!-- SERVICE TYPE -->
			<select name="serviceType" class="form-control mb-2" required>
				<option value="">Select Service</option>
				<c:forEach var="s" items="${serviceTypes}">
					<option value="${s}">${s}</option>
				</c:forEach>
			</select> </select> <input name="contactInfo" placeholder="Contact Info"
				class="form-control mb-2">

			<textarea name="description" placeholder="Description"
				class="form-control mb-2"></textarea>

			<input type="number" name="minPrice" placeholder="Min Price"
				class="form-control mb-2"> <input type="number"
				name="maxPrice" placeholder="Max Price" class="form-control mb-2">

			<!-- 🔥 IMAGE -->
			<input type="file" name="imageFile" class="form-control mb-2"
				onchange="previewImage(event)"> <img id="preview"
				style="width: 100%; height: 180px; object-fit: cover; display: none; border-radius: 10px;">

			<!-- 🔥 SOCIAL LINKS -->
			<input name="instagram" placeholder="Instagram Link"
				class="form-control mb-2"> <input name="facebook"
				placeholder="Facebook Link" class="form-control mb-2"> <input
				name="website" placeholder="Website Link" class="form-control mb-2">

			<button class="btn btn-primary w-100">Submit</button>

		</form>

	</div>

</body>
</html>