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
            <div class="top-menu d-flex align-items-center">
              <div class="dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="notiDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  ><i class="ik ik-bell"></i
                  ><span class="badge bg-danger">3</span></a
                >
              </div>
              <div class="dropdown">
                <a
                  class="dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  ><img class="avatar" src="resources/img/user.jpg" alt=""
                /></a>
                <div
                  class="dropdown-menu dropdown-menu-right"
                  aria-labelledby="userDropdown"
                >
                  <a class="dropdown-item" href="resources/pages/profile.html"
                    ><i class="ik ik-user dropdown-icon"></i> Profile</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ik ik-settings dropdown-icon"></i> Settings</a
                  >
                  <a class="dropdown-item" href="#"
                    ><span class="float-right"
                      ><span class="badge badge-primary">6</span></span
                    ><i class="ik ik-mail dropdown-icon"></i> Inbox</a
                  >
                  <a class="dropdown-item" href="#"
                    ><i class="ik ik-navigation dropdown-icon"></i> Message</a
                  >
                  <a class="dropdown-item" href="loginView.lo"
                    ><i class="ik ik-power dropdown-icon"></i> Logout</a
                  >
                  <!-- <a class="dropdown-item" href="resources/pages/login.html"><i class="ik ik-power dropdown-icon"></i> Logout</a> -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>

      <div class="page-wrap">
        <jsp:include page="../menubar.jsp" />
        <div class="main-content">
        
        
        		 <jsp:include page="./calendar.jsp" />
               
        
        </div>
      </div>
    </div>
  </body>
</html>
