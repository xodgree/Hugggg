<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<%
   String boardid = request.getParameter("boardid");
if(boardid==null) boardid = "1";
String pageNum = request.getParameter("pageNum");
if(pageNum==null || pageNum==""){
   pageNum = "1";   }
%>


<%
int num = Integer.parseInt(request.getParameter("num")); //deleteForm 에서 넘어온 데이터
String passwd = request.getParameter("passwd");
BoardDBBean dbPro = BoardDBBean.getInstance();
int check = dbPro.deletemember(num, passwd);
if(check==1){
	

%><meta http-equiv = "Refresh" content="0;url=list.jsp?pageNum=<%=pageNum %>">
<%}else{ %>
<script type="text/javascript">
alert("비밀번호가 맞지 않습니다");
history.go(-1);
</script><%} %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>