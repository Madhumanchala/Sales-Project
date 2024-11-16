<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Hello from index and ${message }

<form action="CreateUser" method="post">
<input name="firstName" />
<input name="lastName" />
<input name="emailId" />
<input name="mobileNo" />
<input name="password" />
<input name="role" />
<input name="userLocation" />
<input name="status" />

<input type="submit">
</form>
</body>
</html>