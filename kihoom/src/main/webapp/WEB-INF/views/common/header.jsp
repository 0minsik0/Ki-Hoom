<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:if test="${not empty alertMsg}">
	    <script>
	        alert("${alertMsg}"); // 알림창으로 메시지 표시
	    </script>
	</c:if>
	<c:remove var="alertMsg" scope="session"/>

<header class="header-top" header-theme="light">
                <div class="container-fluid">
                    <div class="d-flex justify-content-between">
                        <div class="top-menu d-flex align-items-center">
                            <button type="button" class="btn-icon mobile-nav-toggle d-lg-none"><span></span></button>
                            <div class="header-search">
                                <div class="input-group">
                                    <span class="input-group-addon search-close"><i class="ik ik-x"></i></span>
                                    <input type="text" class="form-control">
                                    <span class="input-group-addon search-btn"><i class="ik ik-search"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="top-menu d-flex align-items-center">
					<div class="dropdown">
						<a class="dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <img class="avatar"
							src="" alt="">
						</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="userDropdown">
							<c:choose>
								<c:when test="${ empty loginUser }">
									<a class="dropdown-item" href="login.lo"><i class="ik ik-user dropdown-icon"></i> 로그인</a>
									<a class="dropdown-item" href="memberEnrollForm.me">회원가입</a>
								</c:when>
								<c:when
									test="${ !empty loginUser and loginUser.memId eq 'admin' }">
									<a class="dropdown-item" href="admin.ad"><i class="ik ik-settings dropdown-icon"></i> 관리자페이지</a>
									<a class="dropdown-item" href="login.lo"><i class="ik ik-power dropdown-icon"></i> Logout</a>
								</c:when>
								<c:otherwise>
									<a class="dropdown-item" href="mypage.lo"><i
										class="ik ik-user dropdown-icon"></i> 마이페이지</a>
									<a class="dropdown-item" href="login.lo"><i class="ik ik-power dropdown-icon"></i> Logout</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>
                    </div>
                </div>
            </header>
</body>
</html>