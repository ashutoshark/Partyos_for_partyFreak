<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Service</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>

	<div class="container mt-4">

		<h3>Edit Service</h3>

		<form action="/vendor/update-service" method="post" enctype="multipart/form-data">

			<input type="hidden" name="id" value="${service.id}" /> <input
				name="businessName" value="${service.businessName}"
				class="form-control mb-2"> <input name="serviceType"
				value="${service.serviceType}" class="form-control mb-2"> <input
				name="city" value="${service.city}" class="form-control mb-2">

			<input name="minPrice" value="${service.minPrice}"
				class="form-control mb-2"> <input name="maxPrice"
				value="${service.maxPrice}" class="form-control mb-2"> <input
				name="contactInfo" value="${service.contactInfo}"
				class="form-control mb-2">

			<textarea name="description" class="form-control mb-2">${service.description}</textarea>

			<!-- 🔥 SOCIAL LINKS -->
			<input name="instagram" value="${service.instagram}"
				class="form-control mb-2"> <input name="facebook"
				value="${service.facebook}" class="form-control mb-2"> <input
				name="website" value="${service.website}" class="form-control mb-2">

			<!-- 🔥 IMAGE UPLOAD -->
			<input type="file" name="imageFile" class="form-control mb-2">

			<button class="btn btn-success">Update</button>

             <a href="/vendor/my-services" class="btn btn-secondary">Cancel</a>

		</form>

	</div>

</body>
</html>