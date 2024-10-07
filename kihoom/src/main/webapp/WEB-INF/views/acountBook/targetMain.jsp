<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자산 목표</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../menubar.jsp" />
			<div class="main-content">
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  개인정보 동의
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="staticBackdropLabel">개인정보 동의</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        직접 작성하는 가게부 이외에 사용한 카드내역을 불러오기 위해서는 개인정보 동의가 필요합니다.
				        개인정보에 동의하여 더 나은 가게부를 완성하세요!
				        개인정보에 동의하면 확인 / 동의하지 않으면 취소 버튼을 눌러주세요 :)
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary">동의하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<script>
				const myModal = document.getElementById('myModal')
				const myInput = document.getElementById('myInput')

				myModal.addEventListener('shown.bs.modal', () => {
				  myInput.focus()
				})
				</script>
			
			</div>		
		</div>	
	</div>
</body>
</html>