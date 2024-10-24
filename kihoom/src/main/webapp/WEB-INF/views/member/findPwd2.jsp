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
          </div>
        </div>
      </header>

      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
          <div class="card-header"><h3>비밀번호 찾기</h3></div>
          	<form action="findPwd.3" method="post">
			  <div class="form-group email-form">
			    <label for="email">회원가입 때 사용한 이메일을 입력해 주세요.</label>
			    <div class="input-group">
			      <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" />
			      <select class="form-control" name="userEmail2" id="userEmail2">
			        <option>@naver.com</option>
			        <option>@daum.net</option>
			        <option>@gmail.com</option>
			        <option>@hanmail.com</option>
			        <option>@yahoo.co.kr</option>
			      </select>
			    </div>
			    <div class="input-group-addon">
			      <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
			    </div>
			    <div class="mail-check-box">
			      <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" />
			    </div>
			    <span id="mail-check-warn"></span>
			  </div>
			  <button type="submit" class="btn btn-primary">다음</button>
			</form>
        </div>
      </div>
    </div><!-- wrapper -->
    
    <script>
    $('#mail-Check-Btn').click(function() {
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/user/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // ajax
	}); //send email
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#useremail1').attr('readonly',true);
			$('#useremail2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	</script>
  </body>
</html>
