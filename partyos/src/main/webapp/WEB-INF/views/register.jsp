<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - PartyOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex justify-content-center align-items-center" style="height:100vh;">

<div class="card p-4 shadow-lg" style="width:450px;">
    <h3 class="text-center mb-3">Register</h3>

    <form action="/user/register" method="post">
    	
    	<input type ="email" name="email" class="form-control mb-2" placeholder="Email" required>

        <input type="text" name="username" class="form-control mb-2" placeholder="Username" required>

        <input type="password" name="password" class="form-control mb-2" placeholder="Password" required>

        <select name="role" class="form-control mb-3" required>
            <option value="user">User</option>
            <option value="vendor">vendor</option>
        </select>

        <button class="btn btn-success w-100">Register</button>
    </form>

    <div class="text-center mt-3">
        <a href="/user/login">Already have an account?</a>
    </div>
</div>

</body>
</html>