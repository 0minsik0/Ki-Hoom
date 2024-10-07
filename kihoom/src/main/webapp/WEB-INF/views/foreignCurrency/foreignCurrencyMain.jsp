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
	
	#map {
      height: 400px;
      width: 100%;
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
					                            <select id="country-select-1" class="form-control country-select" style="margin-bottom: 20px; width:100px;" >
					                                <option value="JPY(100)" selected>일본</option>
					                                <option value="USD">미국</option>
					                                <option value="EUR">유럽</option>
					                                <option value="THB">태국</option>
					                                <option value="AUD">호주</option>
					                                <option value="CAD">캐나다</option>
					                                <option value="CHF">스위스</option>
					                                <option value="CNH">중국</option>
					                                <option value="DKK">덴마크</option>
					                                <option value="GBP">영국</option>
					                                <option value="HKD">홍콩</option>
					                                <option value="KWD">쿠웨이트</option>
					                                <option value="NOK">노르웨이</option>
					                                <option value="NZD">뉴질랜드</option>
					                                <option value="SAR">사우디</option>
					                                <option value="SGD">싱가포르</option>
					                                <option value="SEK">스웨덴</option>
					                            </select>
					                            <h6 id="selected-country-1">일본</h6>
					                            <h2 id="exchange-rate-1">금액자리</h2>
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
					                            <select id="country-select-2" class="form-control country-select" style="margin-bottom: 20px; width:100px;">
					                                <option value="JPY(100)">일본</option>
					                                <option value="USD" selected>미국</option>
					                                <option value="EUR">유럽</option>
					                                <option value="THB">태국</option>
					                                <option value="AUD">호주</option>
					                                <option value="CAD">캐나다</option>
					                                <option value="CHF">스위스</option>
					                                <option value="CNH">중국</option>
					                                <option value="DKK">덴마크</option>
					                                <option value="GBP">영국</option>
					                                <option value="HKD">홍콩</option>
					                                <option value="KWD">쿠웨이트</option>
					                                <option value="NOK">노르웨이</option>
					                                <option value="NZD">뉴질랜드</option>
					                                <option value="SAR">사우디</option>
					                                <option value="SGD">싱가포르</option>
					                                <option value="SEK">스웨덴</option>
					                            </select>
					                            <h6 id="selected-country-2">미국</h6>
					                            <h2 id="exchange-rate-2">금액자리</h2>
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
					                            <select id="country-select-3" class="form-control country-select" style="margin-bottom: 20px; width:100px;">
					                                <option value="JPY(100)">일본</option>
					                                <option value="USD">미국</option>
					                                <option value="EUR" selected>유럽</option>
					                                <option value="THB">태국</option>
					                                <option value="AUD">호주</option>
					                                <option value="CAD">캐나다</option>
					                                <option value="CHF">스위스</option>
					                                <option value="CNH">중국</option>
					                                <option value="DKK">덴마크</option>
					                                <option value="GBP">영국</option>
					                                <option value="HKD">홍콩</option>
					                                <option value="KWD">쿠웨이트</option>
					                                <option value="NOK">노르웨이</option>
					                                <option value="NZD">뉴질랜드</option>
					                                <option value="SAR">사우디</option>
					                                <option value="SGD">싱가포르</option>
					                                <option value="SEK">스웨덴</option>
					                            </select>
					                            <h6 id="selected-country-3">유럽</h6>
					                            <h2 id="exchange-rate-3">금액자리</h2>
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
					                            <select id="country-select-4" class="form-control country-select" style="margin-bottom: 20px; width:100px;">
					                                <option value="JPY(100)">일본</option>
					                                <option value="USD">미국</option>
					                                <option value="EUR">유럽</option>
					                                <option value="THB" selected>태국</option>
					                                <option value="AUD">호주</option>
					                                <option value="CAD">캐나다</option>
					                                <option value="CHF">스위스</option>
					                                <option value="CNH">중국</option>
					                                <option value="DKK">덴마크</option>
					                                <option value="GBP">영국</option>
					                                <option value="HKD">홍콩</option>
					                                <option value="KWD">쿠웨이트</option>
					                                <option value="NOK">노르웨이</option>
					                                <option value="NZD">뉴질랜드</option>
					                                <option value="SAR">사우디</option>
					                                <option value="SGD">싱가포르</option>
					                                <option value="SEK">스웨덴</option>
					                            </select>
					                            <h6 id="selected-country-4">태국</h6>
					                            <h2 id="exchange-rate-4">금액자리</h6>
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
                                                <div id="map"></div> <!-- 구글 지도 표시할 div -->
                                            </div>
                                            <div class="col-lg-4 col-md-12">
                                            	<h4>선택된 국가 환율</h4>
                                            <div id="country-details"></div>
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
		
		
		
		function fetchExchangeRate(countryCode, countryElement, rateElement) {
            $.ajax({
                url: 'foreign.fo',  // 환율 데이터를 가져오는 API URL
                type: 'POST',       // 요청 방식
                dataType: 'json',   // 반환 데이터 형식
                success: function(data) {
                	 console.log("API 응답 데이터:", data); // 데이터 확인을 위한 로그
                	
                    // API 데이터가 배열 형식으로 온다고 가정
                    var selectedData = data.find(function(item) {
                        return item.cur_unit === countryCode; // 선택한 국가의 코드와 일치하는 데이터 찾기
                    });
                    
                    if (selectedData) {
                        // 국가 이름과 환율 정보를 동적으로 변경
                        $(countryElement).text(selectedData.cur_nm);
                        $(rateElement).text(selectedData.ttb);  // 송금 받으실때 금액
                    } else {
                        $(countryElement).text('데이터 없음');
                        $(rateElement).text('금액 없음');
                    }
                },
                error: function() {
                    console.error("API 데이터를 가져오는데 실패했습니다.");
                }
            });
        }

        // 페이지가 로드될 때 4개의 국가 데이터를 가져오기
        $(document).ready(function() {
            // 국가 선택 시마다 데이터를 업데이트
            $('.country-select').change(function() {
                var selectedCountry = $(this).val();  // 선택된 국가 코드
                var idSuffix = $(this).attr('id').split('-')[2];  // select ID에서 숫자를 추출
                var countryElement = '#selected-country-' + idSuffix;
                var rateElement = '#exchange-rate-' + idSuffix;

                fetchExchangeRate(selectedCountry, countryElement, rateElement);  // 선택된 국가에 대한 데이터 가져오기
            });

            // 페이지 로딩 시 초기 데이터 설정
            fetchExchangeRate('JPY(100)', '#selected-country-1', '#exchange-rate-1');
            fetchExchangeRate('USD', '#selected-country-2', '#exchange-rate-2');
            fetchExchangeRate('EUR', '#selected-country-3', '#exchange-rate-3');
            fetchExchangeRate('THB', '#selected-country-4', '#exchange-rate-4');
        });
        
        // 지도 스크립트
        let map;
		let markers = [];

		// 국가 코드에 따른 위도, 경도 설정
		const countryCoordinates = {
		    "JPY(100)": { lat: 35.652832, lng: 139.839478 },  // 일본
		    "USD": { lat: 37.0902, lng: -95.7129 },          // 미국
		    "EUR": { lat: 48.8566, lng: 2.3522 },            // 유럽
		    "THB": { lat: 13.7563, lng: 100.5018 },          // 태국
		    "AUD": { lat: -25.2744, lng: 133.7751 }          // 호주
		};

		// 지도 초기화
		function initMap() {
		    const initialPosition = { lat: 35.652832, lng: 139.839478 }; // 초기 위치 일본

		    map = new google.maps.Map(document.getElementById("map"), {
		        center: initialPosition,
		        zoom: 2
		    });

		    // 초기 마커 설정
		    updateMarkers();
		}

		// 마커 업데이트 함수
		function updateMarkers() {
		    // 기존 마커 제거
		    markers.forEach(marker => marker.setMap(null));
		    markers = [];

		    // 각 select에서 선택된 국가의 value로 마커 추가
		    for (let i = 1; i <= 4; i++) {
		        const selectedCountryValue = $(`#country-select-${i}`).val();
		        const coordinates = countryCoordinates[selectedCountryValue];

		        if (coordinates) {
		            const marker = new google.maps.Marker({
		                position: coordinates,
		                map: map,
		                title: selectedCountryValue
		            });

		            markers.push(marker);  // 마커 배열에 저장
		        }
		    }
		}

		// select 요소의 변경 이벤트
		$(document).ready(function() {
		    $('.country-select').change(function() {
		        updateMarkers();  // 선택된 국가에 맞춰 마커 업데이트
		    });

		    // 초기 지도 생성
		    initMap();
		});
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA270L40pSA_dxQn8Q5tteX0vN5pVvndp4&callback=initMap"></script>

</body>
</html>