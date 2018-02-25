<!-- 글 보기 -->
<%@page import="memberDb.MemberDataBean"%>
<%@page import="memberDb.MemberDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<html lang="en">
<head>
    <!-- Standard Meta -->
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>Bootstrap 4 viewContent</title>
	
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<style type="text/css">
	@media(min-width: 768px) {
  .field-label-responsive {
    padding-top: .5rem;
    text-align: right;
  }
}
	</style>
</head>

<%
int num =Integer.parseInt(request.getParameter("num"));
//페이지 번호 넘기기
String pageNum = request.getParameter("pageNum");
if(pageNum == null || pageNum == ""){
	pageNum = "1";
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
try{
	MemberDBBean dbPro = MemberDBBean.getInstance();
	MemberDataBean member = dbPro.getContent(num,"content");

%>
<body>
<div class="container">
   <%-- <form method = "post" name ="writeform" action="<%= request.getContextPath() %>/view/writePro.jsp"> --%>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>회원 정보</h2>
                <hr>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-3 field-label-responsive">
            
                <label for="name">닉네임</label> 
                
            </div>
            		<%-- <%= member.getName()%> --%>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-user"></i></div>
                       	   
                      <!--  <input type="text" name="name" class="form-control" id="name"
                               placeholder="name" required autofocus> -->
                               &nbsp; &nbsp; <%=member.getName() %>
                             
                    </div>
                </div>
                
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put name validation error messages here -->
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">E-Mail 주소</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                        <!-- <input type="text" name="email" class="form-control" id="email"
                               placeholder="you@example.com" required autofocus> -->
                               &nbsp; &nbsp; <%=member.getEmail() %>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <!-- Put e-mail validation error messages here -->
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">비밀번호</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                       <!--  <input type="password" name="passwd" class="form-control" id="passwd"
                               placeholder="Password" required> -->
                               &nbsp; &nbsp; <%=member.getPasswd() %>
                    </div>
                </div>
            </div>
            <!-- <div class="col-md-3">
                <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                            <i class="fa fa-close"> 비밀번호를 입력하세요</i>
                        </span>
                </div>
            </div> -->
        </div>
        <!-- <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">비밀번호 확인</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <div class="input-group-addon" style="width: 2.6rem">
                            <i class="fa fa-repeat"></i>
                        </div>
                        <input type="password" name="password-confirmation" class="form-control"
                               id="password-confirm" placeholder="Password" required>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <input type="submit" class="btn btn-warning btn-sm" value="회원수정" 
                 onclick = "document.location.href='updateForm.jsp?num=<%=member.getNum()
                 %>&pageNum=<%=pageNum%>'">
                
                <input type="submit" class="btn btn-danger  btn-sm" value="회원삭제" 
         		 onclick = "document.location.href='deleteForm.jsp?num=<%=member.getNum()
         		 %>&pageNum=<%=pageNum%>'">
                 
                <input type="submit" class="btn btn-primary btn-sm" value = "회원목록"
                 onclick = "document.location.href='list.jsp?pageNum=<%=pageNum%>'">
            </div>
        </div>
    </form>
    <%
}catch(Exception e){}%>
    
</div>
</body>
</html>




