<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card p-4 shadow-sm">

        <h4>Edit Profile</h4>

        <form action="/user/update-profile" method="post">

            <input type="hidden" name="id" value="${user.id}"/>

            <label>Username</label>
            <input name="username" value="${user.username}" class="form-control mb-2">

            <label>Email</label>
            <input name="email" value="${user.email}" class="form-control mb-3">

            <button class="btn btn-primary">Update</button>
            <a href="/user/profile" class="btn btn-secondary">Cancel</a>

        </form>

    </div>

</div>

</body>
</html>