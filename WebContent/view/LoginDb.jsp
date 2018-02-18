<%@page import="java.sql.ResultSet"%>
<%@page import="memberDb.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String inputEmail = request.getParameter("inputEmail");
String inputPasswd = request.getParameter("inputPasswd");

MemberDBBean instance =MemberDBBean.getInstance();
int result = instance.login(inputEmail, inputPasswd);
if(result == 1){
	String userName = instance.MainName(inputEmail);

session.setAttribute("userEmail", inputEmail);
session.setAttribute("userName", userName);        
response.sendRedirect("Main.jsp");  
%>

<%
}else if(result == 0){

	%>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다");
history.go(-1);
</script>
	
<% 
}else{
%>
<script type="text/javascript">
alert("이메일이 존재하지 않습니다.");
history.go(-1);
</script>
<%
}
%>
</body>
</html>