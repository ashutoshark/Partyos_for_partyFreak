<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #5f6fff, #9d4edd);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
        }
    </style>
</head>

<body>

<div class="register-box">
    <h3 class="text-center">Admin Register</h3>

    <form action="/admin/register" method="post">

        <input type="text" name="username" class="form-control mb-3" placeholder="Username" required/>

        <input type="email" name="email" class="form-control mb-3" placeholder="Email" required/>

        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required/>

        <button class="btn btn-success w-100">Register</button>

    </form>

    <div class="text-center mt-3">
        <a href="/admin/login">Already have an account?</a>
    </div>
</div>

</body>
</html>