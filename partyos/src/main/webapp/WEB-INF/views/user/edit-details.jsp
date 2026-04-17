<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Contact Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card p-4 shadow-sm">

        <h4>📍 Contact Details</h4>

        <form action="/user/save-details" method="post">

            <input type="hidden" name="id" value="${profile.id}"/>

            <label>Phone</label>
            <input name="phone" value="${profile.phone}" class="form-control mb-2">

            <label>Address</label>
            <input name="address" value="${profile.address}" class="form-control mb-2">

            <label>City</label>
            <input name="city" value="${profile.city}" class="form-control mb-3">

            <button class="btn btn-success">Save</button>
            <a href="/user/profile" class="btn btn-secondary">Cancel</a>

        </form>

    </div>

</div>

</body>
</html>