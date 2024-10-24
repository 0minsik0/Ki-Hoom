<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>ThemeKit - Admin Template</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>

  <body>
    <!--[if lt IE 8]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="http://browsehappy.com/">upgrade your browser</a> to improve
        your experience.
      </p>
    <![endif]-->

    <div class="wrapper">
      <header class="header-top" header-theme="light">
        <div class="container-fluid">
          <div class="d-flex justify-content-between">
            <div class="top-menu d-flex align-items-center">
              <button
                type="button"
                class="btn-icon mobile-nav-toggle d-lg-none"
              >
                <span></span>
              </button>
              <div class="header-search">
                <div class="input-group">
                  <span class="input-group-addon search-close"
                    ><i class="ik ik-x"></i
                  ></span>
                  <input type="text" class="form-control" />
                  <span class="input-group-addon search-btn"
                    ><i class="ik ik-search"></i
                  ></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>

      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp"/>
        <div class="main-content">
        			<div class="card-header"><h3>회원가입</h3></div>
                        <div class="card-body">
                            <form action="insert.me" method="post">
                                <div class="form-group">
                                    <label for="exampleInputUsername">아이디</label>
                                    <input type="text" class="form-control" id="name" name="memId" placeholder="아이디를 입력해 주세요.">
                                </div>
                            
                                <div class="form-group">
                                    <label for="exampleInputPassword1">비밀번호</label>
                                    <input type="password" class="form-control" id="password" name="memPwd" placeholder="비밀번호를 입력해 주세요.">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword2">비밀번호 확인</label>
                                    <input type="password" class="form-control" id="checkPassword"  placeholder="비밀번호를 입력해 주세요.">
                                </div>
                                    <div class="form-group">
                                    <label for="exampleInputName">이름</label>
                                    <input type="text" class="form-control" id="name" name="memName" placeholder="이름을 입력해 주세요.">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail">이메일</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해 주세요.">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">전화번호</label>
                                    <input type="phone" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력해 주세요.">
                                </div>
                              
                                <button type="submit" class="btn btn-primary mr-2">확인<button>
                                <button class="btn btn-light">돌아가기</button>
                              </form>
                        </div>
        </div>
      </div>
    </div>
  </body>
</html>
