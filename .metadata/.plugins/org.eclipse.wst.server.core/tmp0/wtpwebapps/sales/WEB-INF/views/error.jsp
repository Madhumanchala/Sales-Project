<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>

<%-- <%
if (session != null) {
	System.out.println("Session before invalidation: " + session.getId());
	session.invalidate();
	System.out.println("Session invalidated."+ session.getId());
} else {
	System.out.println("No session to invalidate.");
}
%> --%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404 Error</title>
<script>
	
</script>
</head>
<style>
.errorbg {
	background: #eee;
	text-align: center;
	padding-top: 14%;
}

.error h1 {
	color: #092b53;
	font-size: 6em;
	margin: 0px;
	padding: 0px;
}

.error p {
	font-size: 20px;
	line-height: 26px;
}

.error h5 a {
	background: #f03a00;
	border-radius: 5px;
	text-decoration: none;
	color: #fff;
	padding: 6px 10px;
	font-size: 1.2em;
	margin: 0px;
}
</style>

<body class="errorbg">
	<div class="container-fluid">
		<div class="row">
			<div class="error">
				<h1>Oops!</h1>
				<p>
					Something went wrong..!!! 
				</p>
				<!-- <h5>
					<a href="login"> Click to here Login in Sales</a>
				</h5> -->

			</div>
		</div>
</body>
</html>