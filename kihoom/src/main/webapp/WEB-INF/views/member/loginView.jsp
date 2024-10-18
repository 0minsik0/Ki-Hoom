<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Login | ThemeKit - Admin Template</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <link
      href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="resources/node_modules/bootstrap/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="resources/node_modules/@fortawesome/fontawesome-free/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="resources/node_modules/ionicons/dist/css/ionicons.min.css"
    />
    <link
      rel="stylesheet"
      href="resources/node_modules/icon-kit/dist/css/iconkit.min.css"
    />
    <link
      rel="stylesheet"
      href="resources/node_modules/perfect-scrollbar/css/perfect-scrollbar.css"
    />
    <link rel="stylesheet" href="resources/dist/css/theme.min.css" />
    <script src="src/js/vendor/modernizr-2.8.3.min.js"></script>
    <style>
    	
    </style>
  </head>

  <body>
    <!--[if lt IE 8]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="http://browsehappy.com/">upgrade your browser</a> to improve
        your experience.
      </p>
    <![endif]-->
    
    <c:if test="${not empty alertMsg}">
	    <script>
	        alert("${alertMsg}"); // 알림창으로 메시지 표시
	    </script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>

    <div class="auth-wrapper">
      <div class="container-fluid h-100">
        <div class="row flex-row h-100 bg-white">
          <div
            class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none"
          >
            <div
              class="lavalite-bg"
              style="background-image: url('resources/img/auth/login-bg.jpg')"
            >
              <div class="lavalite-overlay"></div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
            <div class="authentication-form mx-auto">
              <div class="logo-centered">
                <a href="index.html"
                  ><img src="resources/src/img/brand.svg" alt=""
                /></a>
              </div>
              <h3>Sign In to ThemeKit</h3>
              <p>Happy to see you again!</p>
              <form action="login.lo">
                <div class="form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="memId"
                    name="memId"
                    placeholder="아이디 : "
                    required
                  />
                  <i class="ik ik-user"></i>
                </div>
                <div class="form-group">
                  <input
                    type="password"
                    class="form-control"
                    id="memPwd"
                    name="memPwd"
                    placeholder="비밀번호 : "
                    required
                  />
                  <i class="ik ik-lock"></i>
                </div>
                <div class="row">
                  <div class="col text-left">
                   
                  </div>
                  <div class="col text-right">
                    <a href="forgot-password.html">아이디 찾기</a>
                    <!--§ 4. 아이디 찾기("가입하실때 사용한 이메일을 입력해 주세요!" - )  -->
                    <span>/</span>
                    <a href="forgot-password.html">비밀번호 찾기</a>
                    <!--§ 6. 비밀번호 찾기("비밀번호를 찾고자 하는 아이디 입력) -->
                  </div>
                </div>
                <div class="sign-btn text-center">
                  <button class="btn btn-theme">로그인</button>
                  <!--§ 메인으로. -->
                </div>
              </form>
              <div class="register">
                <p><a href="memberEnrollForm.me">회원가입</a></p>
                <!--§ 6번  -->

                <ul>
                  <li onclick="kakaoLogin();">
                    <a href="javascript:void(0)">
                      <span>카카오 로그인</span>
                    </a>
                  </li>
                  <li onclick="kakaoLogout();">
                    <a href="javascript:void(0)">
                      <span>카카오 로그아웃</span>
                    </a>
                  </li>
                </ul>
                <!-- 카카오 스크립트 -->
                <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                <script>
                  Kakao.init("380af2edeb82dfbf591425877a112ec6"); //발급받은 키 중 javascript키를 사용해준다.
                  console.log(Kakao.isInitialized()); // sdk초기화여부판단
                  //카카오로그인
                  function kakaoLogin() {
                    Kakao.Auth.login({
                      success: function (response) {
                        Kakao.API.request({
                          url: "/v2/user/me",
                          success: function (response) {
                            console.log(response);
                          },
                          fail: function (error) {
                            console.log(error);
                          },
                        });
                      },
                      fail: function (error) {
                        console.log(error);
                      },
                    });
                  }
                  //카카오로그아웃
                  function kakaoLogout() {
                    if (Kakao.Auth.getAccessToken()) {
                      Kakao.API.request({
                        url: "/v1/user/unlink",
                        success: function (response) {
                          console.log(response);
                        },
                        fail: function (error) {
                          console.log(error);
                        },
                      });
                      Kakao.Auth.setAccessToken(undefined);
                    }
                  }
                </script>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      window.jQuery ||
        document.write(
          '<script src="src/js/vendor/jquery-3.3.1.min.js"><\/script>'
        );
    </script>
    <script src="resources/node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="resources/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="resources/node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
    <script src="resources/node_modules/screenfull/dist/screenfull.js"></script>
    <script src="resources/dist/js/theme.js"></script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
      (function (b, o, i, l, e, r) {
        b.GoogleAnalyticsObject = l;
        b[l] ||
          (b[l] = function () {
            (b[l].q = b[l].q || []).push(arguments);
          });
        b[l].l = +new Date();
        e = o.createElement(i);
        r = o.getElementsByTagName(i)[0];
        e.src = "https://www.google-analytics.com/analytics.js";
        r.parentNode.insertBefore(e, r);
      })(window, document, "script", "ga");
      ga("create", "UA-XXXXX-X", "auto");
      ga("send", "pageview");
    </script>
  </body>
</html>
