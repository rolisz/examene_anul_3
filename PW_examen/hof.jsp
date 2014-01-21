<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>Potriveste descrierea</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css"> 
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-theme.css"> 
	<link rel="stylesheet" type="text/css" href="assets/css/index.css"> 
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="container">
	<div class="row">
		<ul>
		<%
				Connection con = (Connection) application.getAttribute("conexiune");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM hall_of_fame ORDER BY time ASC");
				while (rs.next()) {
					String name = rs.getString(2);
					long time = rs.getLong(3);
					%><li><%=name%> - <%=time %></li><%
				}
		%>
		</ul>
	</div>
</div>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
</body>
</html>
