<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>My Services</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
<script>
function showMsg() {
    alert("This link is not available for this vendor ❌");
}
</script>
body {
	background: #f4f6f9;
}

.card {
	border-radius: 15px;
}
</style>

</head>

<body>

	<nav class="navbar navbar-dark bg-dark px-3">
		<span class="navbar-brand">🎉 PartyOS Vendor</span> <a
			href="/vendor/vendor-dashboard" class="btn btn-light btn-sm">Back</a>
	</nav>

	<div class="container mt-4">

		<h3>📦 My Services</h3>

		<div class="row mt-3">

			<c:forEach var="s" items="${services}">
				<div class="col-md-4">
					<div class="card p-3 shadow-sm mb-3">

						<!-- 🔥 IMAGE -->
						<img
							src="${empty s.imageUrl ? '/images/default.png' : s.imageUrl}"
							class="img-fluid mb-2"
							style="height: 180px; width: 100%; object-fit: cover; border-radius: 10px;">
						<h5>${s.businessName}</h5>
						<p>${s.serviceType}|${s.city}</p>

						<p>₹${s.minPrice} - ₹${s.maxPrice}</p>

						<!-- 🔥 STATUS -->
						<span
							class="badge 
                ${s.status == 'APPROVED' ? 'bg-success' : 
                  (s.status == 'REJECTED' ? 'bg-danger' : 'bg-warning')}">
							${s.status} </span>

						<!-- 🔥 SOCIAL LINKS -->
						<div class="mt-3 d-flex gap-3">

							<!-- INSTAGRAM -->
							<c:choose>
								<c:when test="${not empty s.instagram}">
									<a href="${s.instagram}" target="_blank" title="Instagram">
										<i class="bi bi-instagram text-danger fs-5"></i>
									</a>
								</c:when>
								<c:otherwise>
									<i class="bi bi-instagram text-secondary fs-5"
										title="Instagram not available" onclick="showMsg()"></i>
								</c:otherwise>
							</c:choose>

							<!-- FACEBOOK -->
							<c:choose>
								<c:when test="${not empty s.facebook}">
									<a href="${s.facebook}" target="_blank" title="Facebook"> <i
										class="bi bi-facebook text-primary fs-5"></i>
									</a>
								</c:when>
								<c:otherwise>
									<i class="bi bi-facebook text-secondary fs-5"
										title="Facebook not available" onclick="showMsg()"></i>
								</c:otherwise>
							</c:choose>

							<!-- WEBSITE -->
							<c:choose>
								<c:when test="${not empty s.website}">
									<a href="${s.website}" target="_blank" title="Website"> <i
										class="bi bi-globe text-success fs-5"></i>
									</a>
								</c:when>
								<c:otherwise>
									<i class="bi bi-globe text-secondary fs-5"
										title="Website not available" onclick="showMsg()"></i>
								</c:otherwise>
							</c:choose>

						</div>

						<!-- 🔥 ACTIONS -->
						<div class="mt-2 d-flex justify-content-between">

							<a href="/vendor/edit-service/${s.id}"
								class="btn btn-warning btn-sm">Edit</a> <a
								href="/vendor/delete-service/${s.id}"
								class="btn btn-danger btn-sm"
								onclick="return confirm('Delete this service?')">Delete</a>

						</div>

					</div>
				</div>
			</c:forEach>
		</div>

	</div>

</body>
</html>