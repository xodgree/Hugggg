<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<head>
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
                            <form class="login100-form validate-form">
                                <span class="login100-form-title p-b-70">
                                    <!-- ���� �޼��� -->
                                    Welcome
                                </span>
                                <span class="login100-form-avatar">
                                    <!-- �ƹ�Ÿ �̹��� -->
                                    <img src="assets/assets_main/images/avatar.jpg" alt="AVATAR">
                                </span>
            
                                <div class="wrap-input100 validate-input m-t-50 m-b-35" data-validate = "Enter username">
                                    <!-- Username -->
                                    <!-- ����� �Է� �޴� input -->
                                    <input class="input100" type="text" name="username">
                                    <span class="focus-input100" data-placeholder="Username"></span>
                                </div>
            
                                <div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
                                    <input class="input100" type="password" name="pass">
                                    <!-- password -->
                                    <!-- ����� ��й�ȣ �Է� �޴� input  -->
                                    <span class="focus-input100" data-placeholder="Password"></span>
                                </div>
            
                                <div class="container-login100-form-btn">
                                    <!-- Log In "Submit" ��ư -->
                                    <!-- index.html(����ȭ��� html)�� redirect -->
                                    <button class="login100-form-btn" type="submit" onclick="location.href = 'index.html'">
                                        
                                        Login
                                    </button>
                                </div>
                                

                                <div class = "row justify-content-center centered-text">
                                    <div class="col-4">	
                                        <a href="#" class="txt2 centered-text">
                                            ȸ������
                                        </a>
                                    </div>
            
                                    <div class = "col-4 centered-text">
                                        <a href="#" class="txt2">
                                            ��й�ȣ ã��
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