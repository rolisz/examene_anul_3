<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 	if(null == session.getAttribute("winner")) {
		throw new Exception("Invalid Page!");
	} %>
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
		<form action="submit_photo.jsp" method="POST" id="add_photo">
		<div class="form-group">
			<label for="descr">Descriere</label>
			<input type="text" class="form-control" id="descr" placeholder="Ce contine poza">
		  </div>
		  <div class="form-group">
			<label for="link">Link</label>
			<input type="text" class="form-control" id="link" placeholder="Link catre poza">
		  </div>
		  <button type="submit" class="btn btn-default">Trimite</button>
		</form>
	</div>
</div>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script>
	$('#add_photo').submit(function(e) {
		e.preventDefault();
		$.post('submit_photo.jsp', {descr: $('#descr').val(), link:$('#link').val()}, function (data) {
			data = JSON.parse(data);
			if (data[0] == '1') {
				alert("Poza s-a incarcat!");
			} else {
				alert("Something went wrong :-S");
			}
			$('#descr').val('')
			$('#link').val('')
		});
	});
</script>
</body>
</html>
