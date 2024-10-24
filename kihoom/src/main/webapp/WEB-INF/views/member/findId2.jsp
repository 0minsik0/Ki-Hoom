<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="searchId" value="${sessionScope.searchId}" />
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
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
          <div class="card-header"><h3>아이디 찾기</h3></div>
          <div class="card-body">
            <!--if문. 가입 한 적이 있을 경우-->
            <div>해당 이메일로 가입된 아이디</div>
            <div>
              	<c:choose>
					<c:when test="${empty searchId}">
						<p class="inquiry">조회결과가 없습니다.</p>
					</c:when>
			        <c:otherwise>
			            <c:forEach var="member" items="${searchId}">
			            	아이디 : <c:out value="${member.memId}"/>
			            	가입일 : <c:out value="${member.enrollDate}"/>
			            	<br>
			            </c:forEach>
		        	</c:otherwise>
			 	</c:choose>
            </div>

           
            <button class="btn btn-primary mr-2" onclick="location.href='findId.1' ">
            돌아가기
            </button>
            <button class="btn btn-primary mr-2" onclick="location.href='findPwd.1' ">
            비밀번호 찾기
            </button>
            <button class="btn btn-primary mr-2" onclick="location.href='loginView.lo' "> 
              로그인 화면으로
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
