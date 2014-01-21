<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/pw", "root", "");
	PreparedStatement  stmt = conn.prepareStatement("INSERT INTO videos (user_id, title, link) VALUES (1,?, ?)", Statement.RETURN_GENERATED_KEYS);
	stmt.setString(1, request.getParameter("title"));
	stmt.setString(2, request.getParameter("link"));
	try {
		stmt.executeUpdate();
		ResultSet generatedKeys = stmt.getGeneratedKeys();
		int numero = -1;
        if (generatedKeys.next()) {
             numero = generatedKeys.getInt(1);
		}
		%>["Succes", <%=numero%>]<%
	}
	catch (Exception e) {
        %>["S-a intamplat o eroare +<%=e.getMessage()%>"]<%
    }
%>