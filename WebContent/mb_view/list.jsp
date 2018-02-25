<%@page import="memberDb.MemberDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="memberDb.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 
<!-- list.css -->
<link rel="stylesheet" href ="/MemberBoard/view/list.css">

<%request.setCharacterEncoding("euc-kr");%>
<% String boardid = request.getParameter("boardid");
   if(boardid == null) boardid ="1";%>


<html>
<script>
$(document).ready(function(){
    $(".form-control").popover({title: "Search Here", placement: "top"});
   })
</script>
  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
   int pageSize=5;
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   String pageNum = request.getParameter("pageNum");
   if(pageNum==null || pageNum==""){
      pageNum = "1";}
   int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage-1)*pageSize+1;
   int endRow = currentPage* pageSize;
   int count = 0;
   int number = 0;
   List articleList = null;
   MemberDBBean dbPro = MemberDBBean.getInstance();
   count = dbPro.getDataCount();
   if(count > 0){
      articleList = dbPro.articleList(startRow, endRow);}
         number=count - (currentPage-1)*pageSize;

%>
<!-- 자바스크립트 -->
 
 <!-- html  -->
 <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="row">
      <!-- 회원 목록 -->
      <div class="col-md-4">
         <h2 class="text-center pull-left"> <span class="glyphicon glyphicon-list-alt"> </span> 회원목록<br>(전체 회원:<%=count%>) </h2>
      </div>
      
      <!-- 회원등록
      <div class="col-md-4 col-md-offset-4" style="text-align:right; margin-top:10px;">
         <a class="btn btn-default" href="writeForm.jsp" role="button">회원가입</a>
      </div> -->
      <!-- 로그아웃 -->
      <div class="col-md-4 col-md-offset-4" style="text-align:right; margin-top:10px;">
         <a class="btn btn-default" href="/HugHug/view/Logout.jsp" role="button">로그아웃</a>
      </div>
   </div>
      <%if(count ==0){
         %>
         <td align ="center"> 게시판에 저장된 글이 없습니다.</td>
        <%}else{ %>
      

      <div class="panel-body table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <th class="text-center"> No </th>
              <th class="text-center"> 이메일 </th>
              <th class="text-center"> 닉네임 </th>
              <th class="text-center"> 비밀번호 </th>
              <th class="text-center"> 등록일자 </th>
 
            </tr>
          </thead>

          <tbody>
    
         <% for(int i =0; i < articleList.size();i++){
             MemberDataBean article = (MemberDataBean)articleList.get(i); %>
             
             <!-- 글 클릭시 글 보기 페이지로 넘어감.-->
         
            <tr class="edit" id="detail">
            <td class="text-center"><%=number-- %></td>
              <td id="email" class="text-center"><a href="viewContent.jsp?num=<%=article.getNum()%>"> <%= article.getEmail() %></a></td>
              <td id="name" class="text-center"> <%= article.getName() %> </td>
              <td id="passwd" class="text-center"> <%= article.getPasswd() %> </td>
              <td id="regdt" class="text-center">  <%= sdf.format(article.getRegdate()) %> </td>
            
            </tr><%} %>  
          </tbody>
        </table>
      </div>
    
    <!--페이지 처리 -->
    <div style="text-align: center; margin-bottom: 10px;"> 
   <%} %>
   <%int bottomLine=3;
   if(count>0){int pageCount=count/pageSize+(count%pageSize==0?0:1);
   int startPage = 1+(currentPage-1)/bottomLine*bottomLine;
   int endPage = startPage+bottomLine-1;
   if(endPage>pageCount) endPage=pageCount;
   if(startPage>bottomLine){   %>
   <a href="list.jsp?pageNum=<%=startPage-bottomLine %>">[이전]</a>
   <%} %>
   <%for (int i=startPage; i<=endPage; i++){ %>
   <a href="list.jsp?pageNum=<%=i%>"><%
      if(i!=currentPage) out.print("["+i+"]");
      else out.print("<font color='red'>["+i+"]</font>");   %></a>
   <%}
      if(endPage<pageCount){ %>
      <a href="list.jsp?pageNum=<%=startPage+bottomLine%>">[다음]</a>
      <%}   } %>
   </div>   

<!-- 회원 검색 -->
<div class="container-fluid">
   <div class="col-md-4 col-md-offset-4">
      <label> Search </label>
         <div class="form-group">
            <div class="input-group">
               <input type="text" class="form-control input-md" name="search">
                  <div class="input-group-btn">
                     <button type="button" onclick="document.location.href='Search.jsp?'" class="btn btn-md btn-danger disabled"> 
                     <i class ="fa fa-search"></i></button>
                  </div>
            </div>
         </div>
   </div>
</div>

<div class="panel-footer">
  <div class="row">
     <div class="col-md-4 col-md-offset-8">
        <p class="muted pull-right"><strong> 토닥토닥 company</strong></p>
    </div>
  </div>
</div>
  </div>
</div>
</div>
</body>
</html>