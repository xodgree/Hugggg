<%@ page import = "memberDb.MemberDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="member" class="memberDb.MemberDataBean">
	<jsp:setProperty name = "member" property="*"/>
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null || pageNum =="1"){
		pageNum ="1";
	}
	MemberDBBean dbPro = MemberDBBean.getInstance();
	int pwdck = dbPro.updatemember(member);
		%>
<% if(pwdck == 1){ %>
<meta http-equiv="Refresh" content ="0;url=list.jsp">
<%}else{ %>
<script>
alert("비밀번호가 맞지 않습니다.");
history.go(-1);
</script>
<%} %>
</body>
</html>