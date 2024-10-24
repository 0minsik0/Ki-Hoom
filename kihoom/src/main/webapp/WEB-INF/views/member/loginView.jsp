<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    .authentication-form mx-auto{
    	border: 1 solid black
    }
    
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

    <div class="auth-wrapper">
      <div class="container-fluid h-100">
        <div class="row flex-row h-100 bg-white">
          <div
            class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none"
          >
            <div
              class="lavalite-bg"
              style="background-image: url('resources/img/auth/login-bg2.png')"
            >
              <div class="lavalite-overlay"></div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
            <div class="authentication-form mx-auto">
              <div class="logo-centered">
                <a href="./index.jsp"
                  ><img
                    src="resources/img/profile/kihoom.png"
                    width="200"
                    height="200"
                    alt=""
                /></a>
              </div>
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
                  <div class="col text-left"></div>
                  <div class="col text-right">
                    <a href="findId.1">아이디 찾기</a>
                    <!--§ 4. 아이디 찾기("가입하실때 사용한 이메일을 입력해 주세요!" - )  -->
                    <span>/</span>
                    <a href="findPwd.1">비밀번호 찾기</a>
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

                <div class="col-lg-12 text-center mt-3">
                  <img
                    alt="카카오로그인"
                    src="${pageContext.request.contextPath}/resources/img/kakao/kakao_login_medium_wide.png"
                    onclick="loginWithKakao()"
                  />
                </div>

                <!-- 카카오 로그인 -->
                <script
                  type="text/javascript"
                  src="https://developers.kakao.com/sdk/js/kakao.min.js"
                  charset="utf-8"
                ></script>
                <script type="text/javascript">
                  $(document).ready(function () {
                    Kakao.init("4b8515a0d3871dfac2164752c3e4a98e"); //script 앱키 입력
                    Kakao.isInitialized();
                  });

                  function loginWithKakao() {
                    Kakao.Auth.authorize({
                      redirectUri: "http://localhost:8888/kakao_callback",
                    }); // 등록한 리다이렉트uri 입력
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
