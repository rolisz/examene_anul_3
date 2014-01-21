<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Login</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<form action="send_login.jsp" method="POST">
	<ul>
		<li><label for="user">Username</label><input type="text" name="user" id="user" /></li>
		<li><label for="pass">Password</label><input type="text" name="pass" id="pass" /></li>
		<li><input type="submit" value="Logare" /></li>
	</ul>
</form>
</body>
</html>
