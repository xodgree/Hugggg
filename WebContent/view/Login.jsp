<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<head>
<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="assets/assets_login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/assets_login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<!-- <form class="login100-form validate-form">  -->
				<form method = "post" name = "loginform" class="login100-form validate-form" action ="<%= request.getContextPath() %>/view/LoginDb.jsp">
					<span class="login100-form-title p-b-70" lang="ko">
						<!-- 웰컴 메세지 Welcome-->
						토닥토닥
					</span>
					<span class="login100-form-avatar">
						<!-- 아바타 이미지 -->
						<img src="assets/assets_main/images/avatar.jpg" alt="AVATAR">
					</span>
						
						<!-- email 입력 -->
					<div class="wrap-input100 validate-input m-t-50 m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="inputEmail">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

						<!-- password 입력 -->
					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="inputPasswd">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
					<!-- input 태그에서 이동하도록 바꿈.
						<button class="login100-form-btn" type="submit" onclick="location.href = 'index.html'">	<-->
						<button class="login100-form-btn" type="submit">
							<!-- Login button 텍스트 -->
							Login
						</button>
					</div>
					
					<div class = "row justify-content-center centered-text">
						<div class="col-4">	
							<a href="SignUp.jsp" class="txt2 centered-text">
									회원가입
							</a>
						</div>

						<div class = "col-4 centered-text">
							<a href="FindPasswd.jsp" class="txt2">
								비밀번호 찾기
							</a>						
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/bootstrap/js/popper.js"></script>
	<script src="assets/assets_login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/daterangepicker/moment.min.js"></script>
	<script src="assets/assets_login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="assets/assets_login/js/main.js"></script>

</body>
</html>