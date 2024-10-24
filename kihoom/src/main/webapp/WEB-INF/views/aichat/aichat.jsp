<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>AI 문의</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        #chatBox {
            width: 80%;
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            padding: 10px;
            margin-bottom: 10px;
        }
        #userInput {
            width: 80%;
            padding: 10px;
        }
        #sendBtn {
            padding: 10px;
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
        <jsp:include page="../common/menubar.jsp"/>
        <div class="main-content">
        	<div class="col-md-10" style="margin: 50px auto;">
        		<div class="card">
					<div class="card-header">
        				<h2><b>AI Chat</b></h2>
    				</div>
    				<div class="card-body">
    					<div id="chatBox" style="margin: auto;"></div>
    					<br>
					    <input type="text" id="userInput" placeholder="질문을 입력하세요." style="margin-left: 102.578px; border-radius:10px">
					    <button id="sendBtn" class="btn btn-primary btn-rounded" style="width: 60px; height: 38px; margin-left:5px;">전송</button>
    				</div>
   				</div>
    
			</div>
    <script>
    $(document).ready(function(){
        $("#sendBtn").click(function(){
            var userQuestion = $("#userInput").val();
            if(userQuestion.trim() === "") return;
            // 사용자 질문을 채팅 창에 추가 (누적)
            $("#chatBox").append("<p><b>회원:</b> " + userQuestion + "</p>");
            
            // Ajax로 서버에 질문을 보내고 응답 받기
            $.ajax({
                url: "askQuestion",
                method: "POST",
                data: { question: userQuestion },
                success: function(response) {
                    try {
                        // 응답을 JSON으로 파싱
                        var jsonResponse = JSON.parse(response);
                        
                        // AI 응답에서 content 부분만 추출하여 표시
                        var aiResponseContent = jsonResponse.choices[0].message.content || "응답을 처리할 수 없습니다.";
                        
                        // AI 응답을 채팅 창에 추가 (누적)
                        $("#chatBox").append("<p><b>AI:</b> " + aiResponseContent + "</p>");
                    } catch (e) {
                        console.error("응답 처리 중 오류 발생:", e);
                        $("#chatBox").append("<p><b>AI:</b> 응답을 처리하는 중 오류가 발생했습니다.</p>");
                    }
                    
                    // 입력창 초기화 및 스크롤 하단으로 이동
                    $("#userInput").val("");
                    $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                },
                error: function() {
                    $("#chatBox").append("<p><b>AI:</b> 서버 응답 중 오류가 발생했습니다.</p>");
                }
            });
        });
    });
	</script>
        
        </div>
      </div>
    </div>
  </body>
</html>
