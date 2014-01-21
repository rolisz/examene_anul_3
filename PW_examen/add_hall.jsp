<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	if(null == session.getAttribute("winner")) {
		%>["Nu aveti voie aici!"]<%
	} else {
		Connection conn = (Connection) application.getAttribute("conexiune");
		PreparedStatement  stmt = conn.prepareStatement("INSERT INTO hall_of_fame (name, time) VALUES (?, ?)");
		java.util.Date end = new java.util.Date();
		long seconds = (end.getTime() - ((java.util.Date)session.getAttribute("time_start")).getTime())/1000;
		stmt.setString(1, request.getParameter("name"));
		stmt.setLong(2, seconds);
		try {
			stmt.executeUpdate();
			session.setAttribute("winner", request.getParameter("name"));
			%>[1]<%
		}
		catch (Exception e) {
			%>["S-a intamplat o eroare +<%=e.getMessage()%>"]<%
		}
	}
%>