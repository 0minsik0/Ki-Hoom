<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.card .card-header{
		justify-content: space-between;
	}
	
	.card .card-header .header-content h3{
		font-size: 24px;
		margin-bottom: 10px;
	}
	
	.card .card-header .header-content .writer{
		font-size: 20px;
		color: black;
	}
	
	.card .card-header .header-content .date{
		font-size: 16px;
		color: #999;
	}
	
	.header-content p{
		margin: 0 !important;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../common/header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../common/menubar.jsp" />
			
			<div class="main-content">
				<div class="col-md-12" style="margin: auto; max-width: 85%;">
					<div class="card">
						<div class="card-header">
							<div class="header-content">
								<h3>${ b.boardTitle }</h3>
								<p class="writer">${ b.boardWriter }</p>	
								<p class="date">${ b.createDate }</p>
							</div>
							<a class="btn btn-secondary" style="float:right" href="list.bo">목록</a>
						</div>
						<div class="card-body">
							<div>
								<p style="height: 500px;">${ b.boardContent }</p>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>