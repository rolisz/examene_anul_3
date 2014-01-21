<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/pw", "root", "");
	PreparedStatement  stmt = conn.prepareStatement("SELECT * FROM useros WHERE username = ? AND password= ?");
    stmt.setString(1, request.getParameter("user"));
    stmt.setString(2, request.getParameter("pass"));
    ResultSet rs = stmt.executeQuery();
	if (rs.next()) { 
		session.setAttribute( "name", rs.getString(2)); 
		String redirectURL = "index.jsp";
		response.sendRedirect(redirectURL);
	} else { %>
		Invalid login
	<% }

%>