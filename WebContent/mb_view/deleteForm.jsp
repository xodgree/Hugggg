<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
</head>
<body>
<p class="w3-left" style="padding-left: 30px;"></p>
<center>
<div class="w3-container">
	<b>글삭제</b><br>
<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post" name="delForm" onsubmit="return deleteSave()">
	<table class="table-bordered" width="360">
	<tr height="30">
		<td align=center><b>비밀번호를 입력해주세요</b></td>
	</tr>
	<tr height="30">
		<td align="center">비밀번호 :
		<input type="password" name="passwd" size="8" maxlength="12">
		<input type="hidden" name="num" value="<%=num%>">
		</td>
	</tr> 
	<tr height="30">
		<td align="center">
			<input type="submit" value="글삭제">
			<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
		</td>
	</tr>
	</table>
</form>
</div>
</center>
</body>
</html>