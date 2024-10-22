<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원정보수정</title>
<!-- DataTables CSS 추가 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<!-- jQuery와 DataTables JS 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA270L40pSA_dxQn8Q5tteX0vN5pVvndp4&callback=initMap" async defer></script>

<style>
th.sorting, th.sorting_asc, th.sorting_desc {
	background: none !important; /* 배경 제거 */
}

/* 필요하면 템플릿의 정렬 아이콘을 지정하는 클래스도 숨김 처리 */
th .sorting-template {
	display: none !important; /* 템플릿 정렬 아이콘을 숨기기 */
}

#map {
	height: 400px;
	width: 100%;
}

b {
	font-size: 18px;
}
</style>
</head>
<body>
	
	<div class="wrapper">
		<jsp:include page="../common/header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../common/menubar.jsp" />
			<div class="main-content">
				<!-- 메인 컨텐츠 자리 -->
				<div class="col-md-6" style="margin:60px auto;">
					<div class="card">
						<div class="card-header"><h3>정보수정</h3></div>
	                           <div class="card-body">
	                               <form action="updateMemberProcess.me" method="post">
	                               <input type="hidden" name="memNo" value="${member.memNo}">
	                                   <div class="form-group">
	                                       <label for="exampleInputUsername">아이디</label>
	                                       <input type="text" class="form-control" id="name" name="memId" value="${member.memId}" readonly>
	                                   </div>
	                                   <div class="form-group">
	                                       <label for="exampleInputPassword1">비밀번호</label>
	                                       <input type="password" class="form-control" id="password" name="memPwd" value="${member.memPwd}" readonly>
	                                   </div>
	                                   <div class="form-group">
	                                   	<button type="button" class="btn btn-secondary" id="updatePwd">변경하기</button>
	                                   </div>
	                                   
	                                   <!-- 비밀번호 변경 모달 -->
									    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
									      <div class="modal-dialog" role="document">
									        <div class="modal-content">
									          <div class="modal-header">
									            <h5 class="modal-title" id="passwordModalLabel">비밀번호 변경</h5>
									            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									              <span aria-hidden="true">&times;</span>
									            </button>
									          </div>
									          <div class="modal-body">
									            <div class="form-group">
									              <label for="newPassword">새 비밀번호</label>
									              <input type="password" class="form-control" id="newPassword" placeholder="새 비밀번호를 입력하세요">
									            </div>
									            <div class="form-group">
									              <label for="confirmPassword">비밀번호 확인</label>
									              <input type="password" class="form-control" id="confirmPassword" placeholder="비밀번호를 다시 입력하세요">
									            </div>
									          </div>
									          <div class="modal-footer">
									            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									            <button type="button" class="btn btn-primary" id="saveNewPwd" disabled>변경하기</button>
									          </div>
									        </div>
									      </div>
									    </div>
									    
                                       <div class="form-group">
	                                       <label for="exampleInputName">이름</label>
	                                       <input type="text" class="form-control" id="name" name="memName" value="${member.memName}" readonly>
	                                   </div>
	                                   
	                                   <div class="form-group">
	                                       <label for="exampleInputEmail">이메일</label>
	                                       <input type="email" class="form-control" id="email" name="email" value="${member.email}">
	                                   </div>
	                                   <div class="form-group">
	                                       <label for="exampleInputPhone">전화번호</label>
	                                       <input type="phone" class="form-control" id="phone" name="phone" value="${member.phone}">
	                                   </div>
	                                 
	                                   <button type="submit" class="btn btn-primary mr-2">수정하기</button>
	                                 </form>
	                           </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<script>
	$(document).ready(function() {
	    // 비밀번호 변경 버튼 클릭 시 모달 표시
	    $("#updatePwd").click(function() {
	        $("#passwordModal").modal('show'); // 모달 창 띄우기
	    });

	    // 비밀번호 입력 시 두 입력값이 일치하는지 확인하고 버튼 활성화
	    $("#newPassword, #confirmPassword").on('keyup', function() {
	        var newPwd = $("#newPassword").val();
	        var confirmPwd = $("#confirmPassword").val();

	        if (newPwd === confirmPwd && newPwd !== "") {
	            $("#saveNewPwd").prop('disabled', false); // 비밀번호가 일치하면 버튼 활성화
	        } else {
	            $("#saveNewPwd").prop('disabled', true); // 비밀번호가 일치하지 않으면 비활성화
	        }
	    });

	    // 모달에서 비밀번호 변경 처리
	    $("#saveNewPwd").click(function() {
	        var newPassword = $("#newPassword").val();
	        $("#password").val(newPassword); // 새 비밀번호를 메인 폼의 비밀번호 칸에 입력
	        $("#passwordModal").modal('hide'); // 모달 닫기
	        alert("비밀번호가 변경되었습니다.");
	    });
	});
	</script>

</body>
</html>