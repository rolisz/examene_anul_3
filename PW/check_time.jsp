<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	java.util.Date end = new java.util.Date();
	long seconds = (end.getTime() - ((java.util.Date)session.getAttribute("time_start")).getTime())/1000;
	Connection con = (Connection) application.getAttribute("conexiune");
	Statement st = con.createStatement();
	String query = "SELECT COUNT(*) FROM hall_of_fame WHERE time < "+ String.valueOf(seconds);
	try {
		ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM hall_of_fame WHERE time < "+ String.valueOf(seconds));
		rs.next();
		int nr = rs.getInt(1);
		if (nr < 3) {
			session.setAttribute("winner", "temp");
		}
	%>
	[<%=nr%>]<%
	} catch (Exception e) {
        %>["S-a intamplat o eroare <%=e.getMessage()%>"]<%
    }
%>
