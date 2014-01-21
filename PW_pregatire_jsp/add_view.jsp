<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/pw", "root", "");
	PreparedStatement  stmt = conn.prepareStatement("UPDATE videos SET view_count=view_count+1 WHERE link=?");
	stmt.setString(1, request.getParameter("link"));
	try {
		stmt.executeUpdate();
		
		%>["Succes"]<%
	}
	catch (Exception e) {
        %>["S-a intamplat o eroare +<%=e.getMessage()%>"]<%
    }
%>