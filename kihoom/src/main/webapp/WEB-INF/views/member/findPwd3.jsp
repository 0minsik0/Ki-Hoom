<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>비밀번호 변경</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>

  <body>
	    <div class="wrapper">
	      <header class="header-top" header-theme="light">
	        <div class="container-fluid">
	          <div class="d-flex justify-content-between">
	            <div class="top-menu d-flex align-items-center">
	              <button type="button" class="btn-icon mobile-nav-toggle d-lg-none">
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
	        <jsp:include page="../common/menubar.jsp" />
	        <div class="main-content">
	          <div class="card-header"><h3>비밀번호 변경</h3></div>
	          <div class="card-body">
	            <form action="changePwd" method="post">
			    <!-- hidden 필드로 이메일과 아이디 값을 넘기기 -->
			    <input type="hidden" name="email" value="${param.email}" />
			    <input type="hidden" name="memId" value="${param.memId}" />
			
			    <!-- 새 비밀번호 입력 필드 -->
			    <div class="form-group">
			        <label for="newPassword">새 비밀번호</label>
			        <input
			            type="password"
			            class="form-control"
			            id="newPassword"
			            name="changePwd"
			            placeholder="새 비밀번호를 입력해 주세요."
			            required
			        />
			    </div>
			
			    <!-- 새 비밀번호 확인 필드 -->
			    <div class="form-group">
			        <label for="confirmPassword">비밀번호 확인</label>
			        <input
			            type="password"
			            class="form-control"
			            id="confirmPassword"
			            placeholder="비밀번호를 다시 입력해 주세요."
			            required
			        />
			    </div>
			
			    <!-- 제출 버튼 -->
			    <button type="submit" class="btn btn-primary mr-2">확인</button>
			    <button
			        type="button"
			        onclick="location.href='loginView.lo' "
			        class="btn btn-light"
			    >
			        돌아가기
			    </button>
			</form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
