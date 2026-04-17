<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<title>Reservation Success</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f6f7fb;
}

.card {
	border-radius: 15px;
}
</style>

</head>

<body>

	<div class="container mt-5">

		<div class="card p-4 shadow">

			<h3>🎉 Reservation Successful</h3>

			<table class="table mt-3">
				<tr>
					<th>Brand</th>
					<th>Product</th>
					<th>Price</th>
				</tr>

				<c:forEach var="a" items="${selectedItems}">
					<tr>
						<td>${a.brandName}</td>
						<td>${a.name}</td>
						<td>₹${a.price}</td>
					</tr>
				</c:forEach>

			</table>

			<h4>Total: ₹${total}</h4>

			<a href="/" class="btn btn-primary mt-3">Back to Home</a>

		</div>

	</div>

</body>
</html>