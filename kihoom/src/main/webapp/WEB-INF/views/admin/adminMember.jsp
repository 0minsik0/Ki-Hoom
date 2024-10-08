<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <a href="adminBoard.ad"><i class="ik ik-edit-1"></i><span>게시판관리</span></a>
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
                <jsp:include page="../header.jsp"/>
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
                                                        <th>신고누적횟수</th>
                                                        <th>수정/삭제</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>회원명</td>
                                                        <td>
                                                            <div class="p-status bg-green"></div>
                                                        </td>
                                                        <td>신고받은횟수</td>
                                                        <td>
                                                            <a href="#!"><i class="ik ik-edit f-16 mr-15 text-green"></i></a>
                                                            <a href="#!"><i class="ik ik-trash-2 f-16 text-red"></i></a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                </div>
            </div>
    </div>

</body>
</html>