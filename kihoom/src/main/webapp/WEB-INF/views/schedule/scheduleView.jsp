<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cMemo" value="${sessionScope.cMemo}" />

<html class="no-js" lang="en">
   <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ThemeKit - Admin Template</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	#main_content{
		position:absolute;
	}
	.calendar{
		width:500px;
		height:500px;
	}

	
	#up_schedule{
		width:500px;
		height:500px;
		border: 1px solid black;
	
	}
	#memo{
		width:500px;
		height:500px;
		border: 1px solid black;
	}
</style>

        
    </head>

    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		
        <div class="wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="page-wrap">
                <jsp:include page="../common/menubar.jsp"/>
                <div class="main-content">
                	
                	<div id=calendar>
                	
                		<jsp:include page="./calendar.jsp"/>
                		
                	
                	
                	</div>
                	
                	<div id=up_schedule> <!-- 일반 메모 + 청약스케줄 -->
                	
                		<div>
                			  <h2>청약 정보 리스트</h2>
							    <table border="1">
							        <tr>
							            <th>주택명</th>
							            <th>청약접수시작일</th>
							            <th>청약접수종료일</th>
							            <th>공급위치주소</th>
							            <th>입주예정년월</th>
							        </tr>
							        <c:forEach items="${subInfoList}" var="info">
							            <tr>
							                <td>${info.houseNm}</td>
							                <td>${info.subscrptRceptBgnde}</td>
							                <td>${info.subscrptRceptEndde}</td>
							                <td>${info.hssplyAddres}</td>
							                <td>${info.mvnPrearngeYm}</td>
							            </tr>
							        </c:forEach>
							    </table>		  
                		</div>
                		
                	
                	
                	
                	
                	</div>
                	
                	
                	
                	
             
                	<div id=memo> <!-- 청약 메모 -->
                		
                		청약메모
                		
                		
                	
                	</div>
                	
                	
                	
                	
                	
                	
                	
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
                    </div>
                </aside>

                </div>
                
            </div>
        
        
        
        

        <div class="modal fade apps-modal" id="appsModal" tabindex="-1" role="dialog" aria-labelledby="appsModalLabel" aria-hidden="true" data-backdrop="false">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ik ik-x-circle"></i></button>
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="quick-search">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 ml-auto mr-auto">
                                    <div class="input-wrap">
                                        <input type="text" id="quick-search" class="form-control" placeholder="Search..." />
                                        <i class="ik ik-search"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                   
                </div>
            </div>
        </div>
        <script>
        
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', // 초기 화면 설정
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                selectable: true,
                selectMirror: true,
                locale: 'ko', // 한국어 설정
                nowIndicator: true,
                navLinks: true,
                editable: true,
                dayMaxEvents: true,

                // 서버에서 이벤트를 받아오기 위한 Ajax 설정 (예시)
                events: function(fetchInfo, successCallback, failureCallback) {
                    $.ajax({
                        url: 'your-server-endpoint', // 서버 이벤트 불러올 URL
                        method: 'GET',
                        dataType: 'json',
                        success: function(data) {
                            var events = [];
                            // 서버에서 가져온 데이터를 캘린더에 맞게 변환 (필요 시 커스터마이즈)
                            $.each(data, function(index, event) {
                                events.push({
                                    title: event.title,
                                    start: event.start,
                                    end: event.end,
                                    allDay: event.allDay
                                });
                            });
                            successCallback(events);
                        },
                        error: function() {
                            alert('Failed to fetch events.');
                            failureCallback();
                        }
                    });
                },

                select: function(arg) {
                    var title = prompt('입력할 일정:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay,
                            backgroundColor: "yellow",
                            textColor: "blue"
                        });
                        // Ajax로 이벤트 저장 처리 예시
                        $.ajax({
                            url: 'your-server-save-endpoint',
                            method: 'POST',
                            data: {
                                title: title,
                                start: arg.start.toISOString(),
                                end: arg.end ? arg.end.toISOString() : null,
                                allDay: arg.allDay
                            },
                            success: function() {
                                alert('Event saved successfully.');
                            },
                            error: function() {
                                alert('Failed to save event.');
                            }
                        });
                    }
                    calendar.unselect();
                },

                eventClick: function(arg) {
                    if (confirm('Are you sure you want to delete this event?')) {
                        arg.event.remove();
                        // Ajax로 이벤트 삭제 처리 예시
                        $.ajax({
                            url: 'your-server-delete-endpoint',
                            method: 'POST',
                            data: {
                                eventId: arg.event.id // 서버에서 식별할 이벤트 ID
                            },
                            success: function() {
                                alert('Event deleted successfully.');
                            },
                            error: function() {
                                alert('Failed to delete event.');
                            }
                        });
                    }
                }
            });
            calendar.render();
        });

       
       
       </script>
    </body>
</html>
    