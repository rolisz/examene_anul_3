<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="time_start" value="<%=new java.util.Date()%>" scope="session"/>
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
		<h2>Poze trebuie potrivite:</h2>
		<table id="picture_list" class="col-md-8 table-bordered table-condensed">
			<thead><tr><th>Descriere</th><th>Poza</th></tr></thead>
			<tbody>
			<%
				Connection con = (Connection) application.getAttribute("conexiune");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM images");
				ArrayList<String> links = new ArrayList<String>();
				ArrayList<String> descrs = new ArrayList<String>();
				while (rs.next()) {
					String link = rs.getString(2);
					String descr = rs.getString(3);
					links.add(link);
					descrs.add(descr);
				}
				Collections.shuffle(links);
				Collections.shuffle(descrs);
				for (int i = 0; i < links.size(); i++)	{ 
					String link = links.get(i);
					String descr = descrs.get(i);%>
					  <tr><td><span class="descr"><%=descr%><span></td><td><img src="<%=link%>" class="image"/></td></tr>
					<%
				}
			%>
			</tbody>
		</table>
	</div>
	<div class="row">
		<h2>Poze potrivite corect:</h2>
		<table id="correct_matches" class="col-md-8 table-bordered table-condensed">
			<thead><tr><th>Descriere</th><th>Poza</th></tr></thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/index.js"></script>
</body>
</html>
