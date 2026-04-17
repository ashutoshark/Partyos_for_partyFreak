<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FeedBack</title>
</head>
<body>
<form action="/user/give-feedback" method="post">

    <input type="hidden" name="service.id" value="${service.id}"/>

    <label>Rating:</label>
    <select name="rating" class="form-control">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>

    <textarea name="comment" placeholder="Write feedback..." class="form-control"></textarea>

    <button class="btn btn-primary mt-2">Submit</button>

</form>
</body>
</html>