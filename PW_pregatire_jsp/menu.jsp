<ul>
	<li><a href="index.jsp">Home</a></li>
	<%
if(null == session.getAttribute("name")){ %>
  <li><a href="login.jsp">Login</a></li>
<% } else { %>
	<li><a href="manage.jsp">Manage</a></li>
	<li><a href="logout.jsp">Logout</a></li>
<% } %>  
</ul>