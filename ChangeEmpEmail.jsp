<%@ page import="java.sql.*" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<title>Change Password: OSMlite</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
<script language="javascript">
function forwardTo(v)
{
  document.changeEmail.forwarding.value = "empty"; 
  document.changeEmail.count.value = v;
  document.changeEmail.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.changeEmail.submit();
}
</script>
</head>
<body bgcolor="white">
<form name="changeEmail">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="count" value="">
<%
  String uid = (String)session.getAttribute("empid2");
%>
<div id="header"></div>
<hr>
<font color="#000000" face="Times New Roman, Times, serif">

<%
String newEmail = request.getParameter("email2");
String uid1 = request.getParameter("uid");
String sql = "UPDATE employee SET email= '"+ newEmail +"' WHERE empid= '"+ uid1 +"'";
//String uid2 = (String)session.getAttribute("userid2");

if(uid != null){
try
{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection("jdbc:odbc:OSM","","");
  Statement stmt = con.createStatement();
  stmt.executeUpdate(sql);
}catch(SQLException e){}
catch(Exception e){}

%>

<h1>Welcome!&nbsp;<%= uid %></h1>
<h2>The E-mail ID Has Been Successfully Changed.</h2>


<%
//session.removeAttribute("userid2");
//session.invalidate();
}
else
{
%>

<font color="red">
<h1>Error! You Have Already Logged Out!</h1>
</font>
<h2> Please Login Again to Change Your E-mail ID.</h2>


<%
}
%>

<br><br><br><br><br>
<br><br><br><br><br><br>
<div id="footer">
<center>
<a href="http://localhost:8080/OSM/Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><font size="4"><b>Back to Administrative Page</b></font></a>
</div>
</font>
</form>
</body>
</html>
