<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
		<link rel="icon" href="favicon.ico" type="image/x-icon" />

        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">
        
        <link rel="stylesheet" href="resources/node_modules/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/node_modules/@fortawesome/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="resources/node_modules/icon-kit/dist/css/iconkit.min.css">
        <link rel="stylesheet" href="resources/node_modules/ionicons/dist/css/ionicons.min.css">
        <link rel="stylesheet" href="resources/node_modules/perfect-scrollbar/css/perfect-scrollbar.css">
        <link rel="stylesheet" href="resources/node_modules/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="resources/node_modules/jvectormap/jquery-jvectormap.css">
        <link rel="stylesheet" href="resources/node_modules/tempusdominus-bootstrap-4/build/css/tempusdominus-bootstrap-4.min.css">
        <link rel="stylesheet" href="resources/node_modules/weather-icons/css/weather-icons.min.css">
        <link rel="stylesheet" href="resources/node_modules/c3/c3.min.css">
        <link rel="stylesheet" href="resources/node_modules/perfect-scrollbar/css/perfect-scrollbar.css">
        <link rel="stylesheet" href="resources/node_modules/owl.carousel/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="resources/node_modules/owl.carousel/dist/assets/owl.theme.default.css">
        <link rel="stylesheet" href="resources/dist/css/theme.min.css">
        <script src="resources/src/js/vendor/modernizr-2.8.3.min.js"></script>
        
<style>
#pagingArea{
		display: flex;
		justify-content: center;
	}
	
	.pagination{
		width: 200px;
	}
	
	.pageNo{
		width: 20px;
		height: 20px;
		text-align: center;
		margin-left: 20px;
	}
	
	.pageNo:hover{
		text-decoration: underline;
	}
	
	.pageNo.selected{
		border: 1px solid gray;
	}
	
	.pageNo.selected a{
		color:  #007bff;
	}
	
	.pageNo.selected:hover{
		text-decoration: underline;
		text-decoration-color: #007bff;
	}
	
	button{
		border: none;
    	background-color: unset;
	}
</style>
</head>
<body>

	<div class="wrapper">
            <div class="page-wrap">
                <div class="app-sidebar colored">
                    <div class="sidebar-header">
                        <a class="header-brand" href="./index.jsp">
                            <div class="logo-img">
                               <img src="resources/src/img/kihoom.png" class="header-brand-img" alt="lavalite" width="60px"> 
                            </div>
                            <span class="text" style="margin-left: 20px;">Ki-Hoom</span>
                        </a>
                        <button type="button" class="nav-toggle"><i data-toggle="expanded" class="ik ik-toggle-right toggle-icon"></i></button>
                        <button id="sidebarClose" class="nav-close"><i class="ik ik-x"></i></button>
                    </div>
                    
                    <div class="sidebar-content">
                        <div class="nav-container">
                            <nav id="main-menu-navigation" class="navigation-main">
                                <div class="nav-item">
                                    <a href="admin.ad"><i class="ik ik-bar-chart-line-"></i><span>사이트 통계</span> </a>
                                </div>
                                <div class="nav-item">
                                    <a href="adminMember.ad"><i class="ik ik-users"></i><span>회원관리</span></a>
                                </div>
                                <div class="nav-item">
                                    <a href="list.ad"><i class="ik ik-edit-1"></i><span>게시판관리</span></a>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
 		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>window.jQuery || document.write('<script src="resources/src/js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
        <script src="resources/node_modules/popper.js/dist/umd/popper.min.js"></script>
        <script src="resources/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="resources/node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
        <script src="resources/node_modules/screenfull/dist/screenfull.js"></script>
        <script src="resources/node_modules/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="resources/node_modules/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="resources/node_modules/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="resources/node_modules/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <script src="resources/node_modules/jvectormap/jquery-jvectormap.min.js"></script>
        <script src="resources/node_modules/jvectormap/tests/assets/jquery-jvectormap-world-mill-en.js"></script>
        <script src="resources/node_modules/moment/moment.js"></script>
        <script src="resources/node_modules/tempusdominus-bootstrap-4/build/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="resources/node_modules/d3/dist/d3.min.js"></script>
        <script src="resources/node_modules/c3/c3.min.js"></script>
        <script src="resources/js/tables.js"></script>
        <script src="resources/js/widgets.js"></script>
        <script src="resources/js/charts.js"></script>
        <script src="resources/dist/js/theme.min.js"></script>
        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
                <jsp:include page="../common/header.jsp"/>
                <div class="main-content">
                	<div class="col-xl-8 col-md-6" style="margin: auto; max-width: 85%;">
                                <div class="card table-card">
                                    <div class="card-header">
                                        <h3>회원관리</h3>
                                        <div class="card-header-right">
                                            <ul class="list-unstyled card-option">
                                                <li><i class="ik ik-chevron-left action-toggle"></i></li>
                                                <li><i class="ik ik-minus minimize-card"></i></li>
                                                <li><i class="ik ik-x close-card"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive">
                                            <table class="table table-hover mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>회원명</th>
                                                        <th>상태</th>
                                                        <th>가입일</th>
                                                        <th>수정/삭제</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="m" items="${ list }">
	                                                    <tr>
	                                                        <td>${ m.memId }</td>
	                                                        <td>
	                                                            <div class="p-status bg-green"></div>
	                                                        </td>
	                                                        <td>${ m.enrollDate }</td>
	                                                        <td>
	                                                            <a href="updateMember.ad?memNo=${m.memNo}"><i class="ik ik-edit f-16 mr-15 text-green"></i></a>
	                                                            <button type="button" class="open-delete-modal" data-toggle="modal" data-memid="${m.memId}" data-target="#exampleModalCenter"><i class="ik ik-trash-2 f-16 text-red"></i></button>
	                                                        </td>
	                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <br>
                                            <div id="pagingArea">
								                <ul class="pagination">
									                   	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									                	<c:choose>
															<c:when test="${ pi.currentPage eq p}">
										                    	<li class="pageNo selected"><a href="adminMember.ad?cpage=${ p }">${ p }</a></li>
															</c:when>
															<c:otherwise>
										                    	<li class="pageNo"><a href="adminMember.ad?cpage=${ p }">${ p }</a></li>
															</c:otherwise>
									               		</c:choose>
								                   	</c:forEach>
								                </ul>
								            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
    </div>
	
	<!-- 회원탈퇴 모달 -->
	
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterLabel">회원탈퇴</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                <form action="deleteMember.ad" method="post">
                <div class="modal-body" align="center">
               
                   <b>
                                   정말로 탈퇴 시키겠습니까?
                   </b>
                   <br><br>

               	
                           관리자 비밀번호 : 
                    <input type="password" name="adminPwd" required>
                    <input type="hidden" name="memId" value="${m.memId}">
                   

               </div>
               <div class="modal-footer">
                   <button type="submit" class="btn btn-danger">탈퇴하기</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
               </div>
               </form>
            </div>
        </div>
    </div>
    
    <script>
    $(document).ready(function() {
        // 탈퇴 모달 열 때 memId 값 설정
        $('.open-delete-modal').on('click', function() {
            var memId = $(this).data('memid'); // 클릭된 버튼의 data-memid 값 가져오기
            $('#exampleModalCenter input[name="memId"]').val(memId); // 모달의 숨겨진 input에 memId 설정
        });
    });
</script>
</body>
</html>