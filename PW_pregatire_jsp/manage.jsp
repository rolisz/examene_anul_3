<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Manage Playlist</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<ul id="video_list">
	<%
	  Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/pw", "root", "");
	  Statement st = con.createStatement();
	  ResultSet rs = st.executeQuery("SELECT * FROM videos");
	  while (rs.next()) {
		String link = rs.getString(3);
		String title = rs.getString(4);
		int id = rs.getInt(1);
		%>
		  <li><%=title%><a href="<%=link%>" class="delete" id="<%=id%>">Sterge</a></li>
		<%
	  }
	%>
</ul>
<form id="adauga">
	<ul>
		<li><label for="title">Titlu</label><input type="text" name="title" id="title" /></li>
		<li><label for="link">Link</label><input type="text" name="link" id="link" /></li>
		<li><input type="submit" value="Adauga"/></li>
	</ul>
</form>
<script src="jquery.js"></script>
<script>
$('#adauga').submit(function(e) {
	e.preventDefault();
	$.post('add_video.jsp', {title:$('#title').val(), link:$('#link').val()}, function(data) {
		data = JSON.parse(data);
		alert(data[0]);
		if (data[0] == 'Succes') {
			$('#video_list').append("<li>"+$('#title').val()+"<a href="+$('#link').val()+" class='delete' id="+data[1]+">Sterge</a></li>");
		}
	});
});
$('.delete').click(function(e) {
	e.preventDefault();
	console.log(this);
	var self = this;
	$.post('delete_video.jsp', {link:this.href, id:this.id}, function(data) {
		data = JSON.parse(data);
		alert(data[0]);
		console.log(data);
		if (data[0] == 'Succes') {
			$(self).parent().remove();
		}
	});
});
</script>
</body>
</html>
