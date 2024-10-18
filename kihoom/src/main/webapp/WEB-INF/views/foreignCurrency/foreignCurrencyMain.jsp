<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환율</title>
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
				<div class="container-fluid">
					<div class="row clearfix">
						<div class="col-lg-3 col-md-6 col-sm-12">
							<div class="widget">
								<div class="widget-body">
									<div class="d-flex justify-content-between align-items-center">
										<div class="state">
											<select id="country-select-1"
												class="form-control country-select"
												style="margin-bottom: 20px; width: 100px;">
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
											<select id="country-select-2"
												class="form-control country-select"
												style="margin-bottom: 20px; width: 100px;">
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
											<select id="country-select-3"
												class="form-control country-select"
												style="margin-bottom: 20px; width: 100px;">
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
											<select id="country-select-4"
												class="form-control country-select"
												style="margin-bottom: 20px; width: 100px;">
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
											<h2 id="exchange-rate-4">
												금액자리
												</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-lg-8 col-md-12">
											<h3 class="card-title">국제 환율</h3>
											<div id="map"></div>
											<!-- 구글 지도 표시할 div -->
										</div>
										<div class="col-lg-4 col-md-12">
											<h4>선택된 국가 환율</h4><br>
											<div id="country-details">
											    <div id="country-detail-1"></div>
											    <div id="country-detail-2"></div>
											    <div id="country-detail-3"></div>
											    <div id="country-detail-4"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 환율계산기 -->
						<div class="col-lg-4 col-md-12">
                                <div class="card" style="height:473.59px;">
                                    <div class="card-header">
                                        <h3>환율계산기</h3>
                                    </div>
                                    <div class="card-body calculator" style="margin-top: 60px;">
                                    	<label for="krw-amount"><b>한국 원화 (KRW):</b></label>
							            <input type="number" id="krw-amount" class="form-control" placeholder="원화 금액을 입력하세요"><br>
							
							            <label for="currency-select"><b>환산할 국가를 선택하세요:</b></label>
							            <select id="currency-select" class="form-control">
							                <option value="" selected disabled hidden>국가를 선택하세요.</option>
							                <option value="JPY(100)">일본(JPY)</option>
											<option value="USD">미국(USD)</option>
											<option value="EUR">유럽(EUR)</option>
											<option value="THB">태국(THB)</option>
											<option value="AUD">호주(AUD)</option>
											<option value="CAD">캐나다(CAD)</option>
											<option value="CHF">스위스(CHF)</option>
											<option value="CNH">중국(CNY)</option>
											<option value="DKK">덴마크(DKK)</option>
											<option value="GBP">영국(GBP)</option>
											<option value="HKD">홍콩(HKD)</option>
											<option value="KWD">쿠웨이트(KWD)</option>
											<option value="NOK">노르웨이(NOK)</option>
											<option value="NZD">뉴질랜드(NZD)</option>
											<option value="SAR">사우디(SAR)</option>
											<option value="SGD">싱가포르(SGD)</option>
											<option value="SEK">스웨덴(SEK)</option>
							            </select><br>
							
							            <!-- 환산된 금액을 보여줄 곳 -->
							            <p><b>환산된 금액:</b> <span id="converted-amount">-</span></p>
                                    </div>
                                </div>
                            </div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3>국제 환율</h3>
							</div>
							<div class="card-body">
								<table id="data-table" class="display" style="width: 100%">
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
	        lengthMenu: [ [5, 10, 25, -1], [5, 10, 25, "All"] ],
	        ajax: {
	            url: "foreign.fo",
	            type: "POST",
	            dataType: "json",
	            dataSrc: ""
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
	
	    // 초기 국가별 환율 정보를 로드
	    initializeExchangeRates();

	    // 국가 선택 시마다 데이터를 업데이트 및 마커 표시
	    $('.country-select').change(function() {
	        var selectedCountry = $(this).val();
	        var idSuffix = $(this).attr('id').split('-')[2];
	        var countryElement = '#selected-country-' + idSuffix;
	        var rateElement = '#exchange-rate-' + idSuffix;
	        var detailElement = '#country-detail-' + idSuffix;

	        fetchExchangeRate(selectedCountry, countryElement, rateElement, detailElement);
	        updateMarkers(); // 지도 마커 업데이트
	    });
	    
	    // 초기 지도 생성
	    initMap();
	});

	// 국가별 환율 정보 초기화 함수
	function initializeExchangeRates() {
	    fetchExchangeRate('JPY(100)', '#selected-country-1', '#exchange-rate-1', '#country-detail-1');
	    fetchExchangeRate('USD', '#selected-country-2', '#exchange-rate-2', '#country-detail-2');
	    fetchExchangeRate('EUR', '#selected-country-3', '#exchange-rate-3', '#country-detail-3');
	    fetchExchangeRate('THB', '#selected-country-4', '#exchange-rate-4', '#country-detail-4');
	}

	// 환율 정보 가져오는 함수
	function fetchExchangeRate(countryCode, countryElement, rateElement, detailElement) {
    $.ajax({
        url: 'foreign.fo',
        type: 'POST',
        dataType: 'json',
        success: function(data) {
            var selectedData = data.find(function(item) {
                return item.cur_unit === countryCode;
            });

            if (selectedData) {
                var countryName = selectedData.cur_nm;  // 국가명 가져오기
                $(countryElement).text(countryName);
                $(rateElement).text(selectedData.ttb);

                // 국가명을 함께 넘겨서 표시
                updateCountryDetail(detailElement, selectedData.deal_bas_r, countryName);
            } else {
                $(countryElement).text('데이터 없음');
                $(rateElement).text('금액 없음');
                $(detailElement).html('<p>해당 국가의 매매 기준율 정보를 찾을 수 없습니다.</p>');
            }
        },
        error: function() {
            console.error("API 데이터를 가져오는데 실패했습니다.");
            $(detailElement).html('<p>환율 정보를 가져오는데 실패했습니다.</p>');
        }
    });
}

	// 선택된 국가의 매매 기준율을 해당 영역에 표시하는 함수
	function updateCountryDetail(detailElement, dealBasR, countryName) {
	    var detailHtml = "<p><b>" + countryName + "</b>의 매매기준율 : " + dealBasR + "원 </p>";
	    $(detailElement).html(detailHtml);
	}
	
	// 지도 생성 및 마커 표시 함수
	var map;
	var markers = [];
	var countryCoordinates = {
		    'JPY(100)': { lat: 35.6895, lng: 139.6917 },  // 일본 도쿄
		    'USD': { lat: 38.9072, lng: -77.0369 },       // 미국 워싱턴 D.C.
		    'EUR': { lat: 48.8566, lng: 2.3522 },         // 유럽 (프랑스 파리)
		    'THB': { lat: 13.7563, lng: 100.5018 },       // 태국 방콕
		    'AUD': { lat: -33.8688, lng: 151.2093 },      // 호주 시드니
		    'CAD': { lat: 45.4215, lng: -75.6972 },       // 캐나다 오타와
		    'CHF': { lat: 46.9481, lng: 7.4474 },         // 스위스 베른
		    'CNH': { lat: 39.9042, lng: 116.4074 },       // 중국 베이징
		    'DKK': { lat: 55.6761, lng: 12.5683 },        // 덴마크 코펜하겐
		    'GBP': { lat: 51.5074, lng: -0.1278 },        // 영국 런던
		    'HKD': { lat: 22.3193, lng: 114.1694 },       // 홍콩
		    'KWD': { lat: 29.3759, lng: 47.9774 },        // 쿠웨이트 시티
		    'NOK': { lat: 59.9139, lng: 10.7522 },        // 노르웨이 오슬로
		    'NZD': { lat: -41.2865, lng: 174.7762 },      // 뉴질랜드 웰링턴
		    'SAR': { lat: 24.7136, lng: 46.6753 },        // 사우디아라비아 리야드
		    'SGD': { lat: 1.3521, lng: 103.8198 },        // 싱가포르
		    'SEK': { lat: 59.3293, lng: 18.0686 }         // 스웨덴 스톡홀름
		};

	function initMap() {
	    map = new google.maps.Map(document.getElementById('map'), {
	        center: { lat: 20.5937, lng: 78.9629 },  // 기본 위치 (세계 중심)
	        zoom: 2,
	        // 구글 맵 옵션 설정
	        zoomControl: true,  // 확대/축소 버튼 보이기
	        mapTypeControl: false,  // 지도 종류 선택 안보이게
	        scaleControl: false,  // 거리 측정 바 숨기기
	        streetViewControl: false,  // 스트리트 뷰 버튼 숨기기
	        fullscreenControl: false,  // 전체 화면 버튼 숨기기
	    });
	    updateMarkers();  // 마커 업데이트
	}

	function updateMarkers() {
	    clearMarkers();
	    var bounds = new google.maps.LatLngBounds();

	    $('.country-select').each(function() {
	        var selectedCountry = $(this).val();
	        var coordinates = countryCoordinates[selectedCountry];
	        var countryName = $(this).find('option:selected').text();  // 선택된 국가의 이름 가져오기

	        if (coordinates) {
	            var marker = new google.maps.Marker({
	                position: coordinates,
	                map: map,
	                title: countryName  // 마커에 국가 이름 표시
	            });
	            
	            // 마커 클릭 시 정보창(infoWindow) 표시
	            var infoWindow = new google.maps.InfoWindow({
	                content: "<p><strong>" + countryName + "</strong></p>"
	            });

	            marker.addListener('click', function() {
	                infoWindow.open(map, marker);
	            });

	            markers.push(marker);
	            bounds.extend(marker.getPosition());
	        }
	    });

	    if (markers.length > 0) {
	        map.fitBounds(bounds);
	    }
	}

	function clearMarkers() {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(null);
	    }
	    markers = [];
	}
	
	// 환율계산기
	var exchangeRates = {
    'JPY(100)': null,
    'USD': null,
    'EUR': null,
    'THB': null,
    'AUD': null,
	'CAD': null,
	'CHF': null,
	'CNH': null,
	'DKK': null,
	'GBP': null,
	'HKD': null,
	'KWD': null,
	'NOK': null,
	'NZD': null,
	'SAR': null,
	'SGD': null,
	'SEK': null
	};
	
	// 초기 데이터 로드 및 선택한 국가 데이터 표시
	$(document).ready(function() {
	    // 국가 선택 시 환율 정보 업데이트
	    $('#currency-select').change(function() {
	        var selectedCurrency = $(this).val();
	        if (exchangeRates[selectedCurrency]) {
	            updateConvertedAmount($('#krw-amount').val(), selectedCurrency);
	        } else {
	            fetchExchangeRateForCalculator(selectedCurrency); // 선택한 국가 환율 정보 가져오기
	        }
	    });

	    // 원화 금액 입력 시 환율 계산
	    $('#krw-amount').on('input', function() {
	        var krwAmount = $(this).val();
	        var selectedCurrency = $('#currency-select').val();
	        updateConvertedAmount(krwAmount, selectedCurrency);
	    });
	});

	// 선택된 국가의 환율을 사용해 환산된 금액을 업데이트하는 함수
	function updateConvertedAmount(krwAmount, selectedCurrency) {
	    if (krwAmount && !isNaN(krwAmount) && exchangeRates[selectedCurrency]) {
	        var convertedAmount = (krwAmount / exchangeRates[selectedCurrency]).toFixed(2); // 환산된 금액 계산
	        $('#converted-amount').text(convertedAmount + " " + selectedCurrency.split('(')[0]); // 통화 단위와 함께 표시
	    } else {
	        $('#converted-amount').text('-'); // 유효한 입력이 없을 경우
	    }
	}

	// 특정 국가의 환율 정보를 가져오는 함수 (환율 계산기용)
	function fetchExchangeRateForCalculator(countryCode) {
	    $.ajax({
	        url: 'foreign.fo', // 서버 API 요청
	        type: 'POST',
	        dataType: 'json',
	        success: function(data) {
	            var selectedData = data.find(function(item) {
	                return item.cur_unit === countryCode;
	            });

	            if (selectedData) {
	                // 선택된 국가의 환율을 저장
	                if (countryCode === 'JPY(100)') {
	                    exchangeRates['JPY(100)'] = selectedData.deal_bas_r / 100; // 100엔 기준 환율 처리
	                } else {
	                    exchangeRates[countryCode] = selectedData.deal_bas_r; // 환율 저장
	                }

	                // 원화 입력값이 있으면 즉시 환산
	                var krwAmount = $('#krw-amount').val();
	                if (krwAmount) {
	                    updateConvertedAmount(krwAmount, countryCode);
	                }
	            } else {
	                console.error('환율 데이터를 찾을 수 없습니다.');
	            }
	        },
	        error: function() {
	            console.error('환율 데이터를 가져오는데 실패했습니다.');
	        }
	    });
	}
	
	</script>


</body>
</html>