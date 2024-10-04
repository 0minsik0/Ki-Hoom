<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환율</title>
<!-- DataTables CSS 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<!-- jQuery와 DataTables JS 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<style>
	th.sorting, th.sorting_asc, th.sorting_desc {
    	background: none !important;  /* 배경 제거 */
	}
	
	/* 필요하면 템플릿의 정렬 아이콘을 지정하는 클래스도 숨김 처리 */
	th .sorting-template {
	    display: none !important;  /* 템플릿 정렬 아이콘을 숨기기 */
	}
</style>
</head>
<body>

	<div class="wrapper">
		<jsp:include page="../header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../menubar.jsp" />
			<div class="main-content">
				<!-- 메인 컨텐츠 자리 -->
				<div class="container-fluid">
                        <div class="row clearfix">
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>일본</h6>
                                                <h2>금액자리</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>미국</h6>
                                                <h2>금액자리</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>유럽</h6>
                                                <h2>금액자리</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>태국</h6>
                                                <h2>금액자리</h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="justify-content: center;">
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-lg-8 col-md-12">
                                                <h3 class="card-title">국제 환율</h3>
                                                <div id="visitfromworld" style="width:100%; height:350px"></div>
                                            </div>
                                            <div class="col-lg-4 col-md-12">
                                                <div class="row mb-15">
                                                    <div class="col-9">India</div>
                                                    <div class="col-3 text-right">28%</div>
                                                </div>
                                                <div class="row mb-15">
                                                    <div class="col-9"> UK</div>
                                                    <div class="col-3 text-right">21%</div>
                                                </div>
                                                <div class="row mb-15">
                                                    <div class="col-9"> USA</div>
                                                    <div class="col-3 text-right">18%</div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-9">China</div>
                                                    <div class="col-3 text-right">12%</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header"><h3>국제 환율</h3></div>
                                <div class="card-body">
                                    <table id="data-table" class="display" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>국가/통화명</th>
                                                <th>송금 받으실때(원)</th>
                                                <th>송금 보내실때(원)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
		    // DataTables 초기화
		    $('#data-table').DataTable({
		        pageLength: 5, // 기본으로 5개의 항목 표시
		        lengthMenu: [ [5, 10, 25, -1], [5, 10, 25, "All"] ], // 선택 가능한 페이지 길이
		        ajax: {
		            url: "foreign.fo", // 서버에서 데이터를 가져올 URL
		            type: "POST", // 서버에 데이터를 요청할 방식
		            dataType: "json", // 서버에서 반환되는 데이터 형식
		            dataSrc: "" // 응답에서 데이터를 어떻게 처리할지 (빈 문자열은 기본 배열로 처리)
		        },
		        columns: [
		            { data: 'cur_nm' },  // 국가/통화명
		            { data: 'ttb' },     // 송금 받으실때
		            { data: 'tts' }      // 송금 보내실때
		        ],
		        language: {
		            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
		            "zeroRecords": "데이터가 없습니다.",
		            "info": "총 _TOTAL_ 개 중 _PAGE_ 페이지",
		            "infoEmpty": "데이터가 없습니다.",
		            "infoFiltered": "(전체 _MAX_ 개 중에서 필터링됨)",
		            "search": "검색:",
		            "paginate": {
		                "first": "처음",
		                "last": "마지막",
		                "next": "다음",
		                "previous": "이전"
		            }
		        }
		    });
		});
	</script>

</body>
</html>