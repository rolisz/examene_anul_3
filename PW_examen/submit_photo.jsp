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
		PreparedStatement  stmt = conn.prepareStatement("INSERT INTO images (img_file, description) VALUES (?, ?)");
		stmt.setString(1, request.getParameter("link"));
		stmt.setString(2, request.getParameter("descr"));
		try {
			stmt.executeUpdate();
			%>[1]<%
		}
		catch (Exception e) {
			%>["S-a intamplat o eroare +<%=e.getMessage()%>"]<%
		}
	}
%>