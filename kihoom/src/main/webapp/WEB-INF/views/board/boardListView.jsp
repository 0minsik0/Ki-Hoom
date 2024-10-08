<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="wrapper">
			<jsp:include page="../common/header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../common/menubar.jsp" />
			<div class="main-content">
				<div class="col-md-12" style="margin: auto; max-width: 85%;">
					<div class="card">
				        <div class="card-header d-block">
				            <h3>게시판</h3>
				        </div>
				        <div class="card-body p-0 table-border-style">
				            <div class="table-responsive">
				                <table class="table" style="text-align: center">
				                    <thead>
				                        <tr>
				                            <th>카테고리</th>
				                            <th>제목</th>
				                            <th>작성자</th>
				                            <th>작성일</th>
				                            <th>조회수</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <th scope="row">1</th>
				                            <td>Mark</td>
				                            <td>Otto</td>
				                            <td>@mdo</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">2</th>
				                            <td>Jacob</td>
				                            <td>Thornton</td>
				                            <td>@fat</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">3</th>
				                            <td>Larry</td>
				                            <td>the Bird</td>
				                            <td>@twitter</td>
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