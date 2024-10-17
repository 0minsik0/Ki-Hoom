<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
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
        <!-- jQuery 라이브러리 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	
	<div class="app-sidebar colored">
                    <div class="sidebar-header">
                        <a class="header-brand" href="./index.jsp">
                            <div class="logo-img">
                               <img src="./resources/src/img/kihoom.png" class="header-brand-img" alt="lavalite" width="60px"> 
                            </div>
                            <span class="text" style="margin-left: 20px;">Ki-Hoom</span>
                        </a>
                        <button type="button" class="nav-toggle"><i data-toggle="expanded" class="ik ik-toggle-right toggle-icon"></i></button>
                        <button id="sidebarClose" class="nav-close"><i class="ik ik-x"></i></button>
                    </div>
                    
                    <div class="sidebar-content">
                        <div class="nav-container">
                            <nav id="main-menu-navigation" class="navigation-main">
                                <div class="nav-item has-sub">
                                    <a href="javascript:void(0)"><i class="ik ik-bar-chart-2"></i><span>가계부</span></a>
                                    <div class="submenu-content">
                                    	<a href="acountBook.ac" class="menu-item">🧾 가계부</a>
                                    	<a href="target.ta" class="menu-item">💰 자산 모으기</a>
                                    </div>
                                </div>

                                <div class="nav-item">
								     <a href="searchView.ne"><i class="ik ik-menu"></i><span>뉴스</span> </a>
								</div>
                                
                                <div class="nav-item has-sub">
                                    <a href="javascript:void(0)"><i class="ik ik-layers"></i><span>스케줄</span> </a>
                                    <div class="submenu-content">
                                        <a href="resources/pages/widgets.html" class="menu-item">Basic</a>
                                        <a href="resources/pages/widget-statistic.html" class="menu-item">Statistic</a>
                                        <a href="resources/pages/widget-data.html" class="menu-item">Data</a>
                                        <a href="resources/pages/widget-chart.html" class="menu-item">Chart Widget</a>
                                    </div>
                                </div>
                                <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-box"></i><span>증명서 발급</span></a>
                                    <div class="submenu-content">
                                        <a href="resources/pages/ui/alerts.html" class="menu-item">Alerts</a>
                                        <a href="resources/pages/ui/badges.html" class="menu-item">Badges</a>
                                        <a href="resources/pages/ui/buttons.html" class="menu-item">Buttons</a>
                                        <a href="resources/pages/ui/navigation.html" class="menu-item">Navigation</a>
                                    </div>
                                </div>
                                <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-gitlab"></i><span>투자/주식</span> </a>
                                    <div class="submenu-content">
                                        <a href="stock.st" class="menu-item">Modals</a>
                                        <a href="resources/pages/ui/notifications.html" class="menu-item">Notifications</a>
                                        <a href="resources/pages/ui/carousel.html" class="menu-item">Slider</a>
                                        <a href="resources/pages/ui/range-slider.html" class="menu-item">Range Slider</a>
                                        <a href="resources/pages/ui/rating.html" class="menu-item">Rating</a>
                                    </div>
                                </div>
                                <div class="nav-item has-sub">
                                    <a href="#"><i class="ik ik-package"></i><span>포인트</span></a>
                                    <div class="submenu-content">
                                        <a href="resources/pages/ui/session-timeout.html" class="menu-item">Session Timeout</a>
                                    </div>
                                </div>
                                <div class="nav-item">
                                    <a href="resources/pages/ui/icons.html"><i class="ik ik-command"></i><span>환율</span></a>
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
</body>
</html>