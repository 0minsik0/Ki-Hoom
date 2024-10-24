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
                
             

                <aside class="right-sidebar">
                    <div class="sidebar-chat" data-plugin="chat-sidebar">
                        <div class="sidebar-chat-info">
                            <h6>Chat List</h6>
                            <form class="mr-t-10">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search for friends ..."> 
                                    <i class="ik ik-search"></i>
                                </div>
                            </form>
                        </div>
                        <div class="chat-list">
                            <div class="list-group row">
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Gene Newman">
                                    <figure class="user--online">
                                        <img src="resources/img/users/1.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Gene Newman</span>  <span class="username">@gene_newman</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Billy Black">
                                    <figure class="user--online">
                                        <img src="resources/img/users/2.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Billy Black</span>  <span class="username">@billyblack</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Herbert Diaz">
                                    <figure class="user--online">
                                        <img src="resources/img/users/3.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Herbert Diaz</span>  <span class="username">@herbert</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Sylvia Harvey">
                                    <figure class="user--busy">
                                        <img src="resources/img/users/4.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Sylvia Harvey</span>  <span class="username">@sylvia</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item active" data-chat-user="Marsha Hoffman">
                                    <figure class="user--busy">
                                        <img src="resources/img/users/5.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Marsha Hoffman</span>  <span class="username">@m_hoffman</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Mason Grant">
                                    <figure class="user--offline">
                                        <img src="resources/img/users/1.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Mason Grant</span>  <span class="username">@masongrant</span> </span>
                                </a>
                                <a href="javascript:void(0)" class="list-group-item" data-chat-user="Shelly Sullivan">
                                    <figure class="user--offline">
                                        <img src="resources/img/users/2.jpg" class="rounded-circle" alt="">
                                    </figure><span><span class="name">Shelly Sullivan</span>  <span class="username">@shelly</span></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </aside>

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
        // 전송 버튼 클릭 시
        $("#sendBtn").click(function(){
            sendMessage();
        });

        // 엔터 키를 누를 때 전송 버튼 클릭 이벤트 트리거
        $("#userInput").keydown(function(event) {
            if (event.key === "Enter") {
                event.preventDefault();  // 엔터 키로 줄 바꿈을 막음
                $("#sendBtn").click();  // 전송 버튼 클릭 이벤트 트리거
            }
        });

        // 메시지 전송 함수
        function sendMessage() {
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
        }
    });
</script>
        
        </div>
      </div>
    </div>
  </body>
</html>
    