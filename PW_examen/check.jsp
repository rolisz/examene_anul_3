<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	Connection conn = (Connection) application.getAttribute("conexiune");
	PreparedStatement stmt = conn.prepareStatement("SELECT * FROM images WHERE img_file = ? AND description = ?");
	stmt.setString(1, request.getParameter("img"));
	stmt.setString(2, request.getParameter("descr"));
	try {
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) { 
			%>["1"]<%
		}
		else {
			%>["0"]<%
		}
	}
	catch (Exception e) {
        %>["0"]<%
    }
%>