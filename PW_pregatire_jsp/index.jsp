<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Playlists</title>
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
		%>
		  <li><a href="<%=link%>" class="video"><%=title%></a></li>
		<%
	  }
	%>
</ul>
<script src="jquery.js"></script>
<script>
$('.video').click(function(e) {
	e.preventDefault();
	$('iframe').remove();
	var yt_embed = "<iframe width='560' height='315' src='http://youtube.com/embed/YT_ID' frameborder='0' allowfullscreen></iframe>";
	var link = this.href;
	var indx = link.indexOf('watch?v=');
	var yt_id = link.substr(indx+8);
	console.log(yt_id);
	var n = yt_embed.replace('YT_ID', yt_id);
	$(this).parent().append(n);
	$.post('add_view.jsp', {link:this.href});
});
</script>
</body>
</html>
