<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #5f6fff, #9d4edd);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h3 class="text-center">Admin Login</h3>

    <form action="/admin/login" method="post">

        <input type="text" name="username" class="form-control mb-3" placeholder="Username"/>

        <input type="password" name="password" class="form-control mb-3" placeholder="Password"/>

        <button class="btn btn-primary w-100">Login</button>

        <p class="text-danger mt-2">${error}</p>

    </form>
</div>

</body>
</html>