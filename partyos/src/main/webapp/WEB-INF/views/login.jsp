<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login - PartyOS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-dark d-flex justify-content-center align-items-center"
	style="height: 100vh;">

	<div class="card p-4 shadow-lg" style="width: 400px;">
		<h3 class="text-center mb-3">Login</h3>

		<form action="/user/login" method="post">
			<input type="text" name="username" class="form-control mb-3"
				placeholder="Username" required> <input type="password"
				name="password" class="form-control mb-3" placeholder="Password"
				required>

			<button class="btn btn-primary w-100">Login</button>
		</form>

		<p class="text-danger text-center mt-2">${error}</p>
		<p class="text-danger text-center">${sessionScope.msg}</p>
		<c:remove var="msg" scope="session" />

		<div class="text-center mt-3">
			<a href="/user/register">Create Account</a>
		</div>
	</div>

</body>
</html>