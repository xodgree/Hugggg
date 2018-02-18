<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/assets_main/css/main.css" />
<title>Visualize by TEMPLATED</title>
</head>
<body>
	<% String userName = (String)session.getAttribute("userName"); %>
	<% String userEmail = (String)session.getAttribute("userEmail"); %>
	
	<% if(userName == null || userName.equals("")){
		response.sendRedirect("Login.jsp");
	}
	%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<span class="avatar"><img src="assets/assets_main/images/avatar.jpg" alt="" /></span>
						<div style="margin-bottom:25px; margin-top:-20px;">
						
						<a href="Mypage.jsp">mypage</a>
						 &nbsp;  &nbsp;  &nbsp;
						<a href="Logout.jsp">logout</a>
						</div>
						<!-- <h1>This is <strong>your space</strong>. Have a good time!<br /> -->
						
						<!-- 환영메세지 -->
						<!-- txt_ko 스타일로 배민주아 폰트 적용 -->
						<div class="txt_ko">
							<h1>
								<strong><%= userName %></strong>님 환영합니다!
							</h1>
						</div>
						
						<ul class="icons">
							<li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
							<li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
						</ul>
					</header>

				<!-- Main -->
					<section id="main">

						<!-- Thumbnails -->
							<section class="thumbnails">
								<div>
									<a href="assets/assets_main/images/fulls/01.jpg">
										<img src="assets/assets_main/images/thumbs/01.jpg" alt="" />
										<h3>2018 . 02 . 12 MON</h3>
									</a>
									<a href="assets/assets_main/images/fulls/02.jpg">
										<img src="assets/assets_main/images/thumbs/02.jpg" alt="" />
										<h3>2018 . 02 . 13 TUE</h3>
									</a>
								</div>
								<div>
									<a href="assets/assets_main/images/fulls/03.jpg">
										<img src="assets/assets_main/images/thumbs/03.jpg" alt="" />
										<h3>2018 . 02 . 14 WED</h3>
									</a>
									<a href="assets/assets_main/images/fulls/04.jpg">
										<img src="assets/assets_main/images/thumbs/04.jpg" alt="" />
										<h3>2018 . 02 . 15 THU</h3>
									</a>
									<a href="assets/assets_main/images/fulls/05.jpg">
										<img src="assets/assets_main/images/thumbs/05.jpg" alt="" />
										<h3>2018 . 02 . 16 FRI</h3>
									</a>
								</div>
								<div>
									<a href="assets/assets_main/images/fulls/06.jpg">
										<img src="assets/assets_main/images/thumbs/06.jpg" alt="" />
										<h3>2018 . 02 . 17 SAT</h3>
									</a>
									<a href="assets/assets_main/images/fulls/07.jpg">
										<img src="assets/assets_main/images/thumbs/07.jpg" alt="" />
										<h3>2018 . 02 . 18 SUN</h3>
									</a>
								</div>
							</section>

					</section>

				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/assets_main/js/jquery.min.js"></script>
			<script src="assets/assets_main/js/jquery.poptrox.min.js"></script>
			<script src="assets/assets_main/js/skel.min.js"></script>
			<script src="assets/assets_main/js/main.js"></script>

	</body>
</html>