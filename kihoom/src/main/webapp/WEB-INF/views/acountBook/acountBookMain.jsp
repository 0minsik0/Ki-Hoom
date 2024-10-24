<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>가계부</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.1/dist/echarts.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 구글 아이콘 -->
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <!-- 부트스트랩 -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <!-- Two Linked Pie Charts Resources -->
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

    <!-- js 연결 -->
    <script src="./resources/js/acountBook.js"></script>

    <style>
      #myChartDiv {
        width: 450px;
        height: 200px;
        border-radius: 20px;
      }

      .plusBtn {
        color: #0e4ead;
      }

      #chartdiv0,
      #chartdiv9 {
        width: 100%;
        height: 500px;
      }

      .chartWrap {
        display: flex;
      }

      #chartdiv1 {
        width: 100%;
        height: 500px;
        /* margin: 20px; */
      }

      #chartdiv2 {
        width: 100%;
        height: 500px;
        /* margin: 20px; */
      }

      #monthTotal,
      #weekTotal {
        padding: 10px;
        margin-left: 20px;
      }

      #month {
        border-style: none;
        font-size: 20px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
          <!-- Button trigger modal -->
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            개인정보 동의
          </button>

          <!-- Modal -->
          <div
            class="modal fade"
            id="staticBackdrop"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true"
          >
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="staticBackdropLabel">
                    개인정보 동의
                  </h1>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="modal-body">
                  직접 작성하는 가게부 이외에 사용한 카드내역을 불러오기
                  위해서는 개인정보 동의가 필요합니다. <br />
                  개인정보에 동의하여 더 나은 가게부를 완성하세요! <br />
                  개인정보에 동의하면 인증하기 / 동의하지 않으면 닫기 버튼을
                  눌러주세요 :)
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-primary"
                    onclick="certification()"
                  >
                    인증하기
                  </button>
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    닫기
                  </button>
                </div>

                <div id="codeDisplay"></div>
              </div>
            </div>
          </div>

          <br />
          <br />

          <script>
            /* 인증 코드 */
            function certification() {
              $.ajax({
                url: "certification.ac",
                type: "GET",
                success: function (response) {
                  const url = response.url;
                  window.open(url, "_self");
                },
                error: function (request, status, error) {
                  console.log("url 생성 ajax 오류");
                },
              });
            }
          </script>

          <!-- 전체 통계 그래프 -->
          <div class="row">
            <div class="col-lg-6 col-xl-6">
              <div class="card">
                <div class="card-header">
                  <div id="monthTotal" onclick="showMonthTotal()">월별</div>

                  <div id="weekTotal" onclick="showWeekTotal()">주간별</div>
                  <select id="weekMonth">
	                  <c:forEach var="mm" items="${ monthList }">
	                     <option value="${ mm.paymentDate }">
	                       ${ mm.paymentDate }
	                     </option>
	                  </c:forEach>
                  </select>
                </div>

                <div class="card-body">
                  <div id="monthContent" style="display: block">
                    <div id="chartdiv0"></div>
                    <div id="noDataMessage" style="display: none; color:blue" align="center">
                      입력된 값이 없습니다.
                    </div>
                  </div>

                  <div id="weekContent" style="display: none">
                    <div id="chartdiv9"></div>
                    <div id="noDataMessagee" style="display:none; color: blue" align="center">
                    	입력된 값이 없습니다.
                    </div>
                  </div>
                </div>
              </div>
            </div>

            
            <script>
            /* week Content */
            $(document).ready(() => {
            	
            	$(document).ready(() => {
                    let wMonth = $("#weekMonth").val();
                    fetchData(wMonth);

                    $('#weekMonth').change(() => {
                        wMonth = $("#weekMonth").val();
                        fetchData(wMonth);
                    });

                function fetchData(wMonth) {
                    $.ajax({
                        url: "weekList.ac",
                        data: {
                            memNo: ${loginUser.memNo},
                            paymentDate: wMonth,
                        },
                        success: function (wArray) {
                        	
                        	
                        	
                        	/* weekContent */
                        	am5.ready(function () {
                           // Create root element
                           // https://www.amcharts.com/docs/v5/getting-started/#Root_element
                           var root = am5.Root.new("chartdiv9");

                           // Set themes
                           // https://www.amcharts.com/docs/v5/concepts/themes/
                           root.setThemes([am5themes_Animated.new(root)]);

                           // Create chart
                           // https://www.amcharts.com/docs/v5/charts/xy-chart/
                           var chart = root.container.children.push(
                             am5xy.XYChart.new(root, {
                               panX: false,
                               panY: false,
                               paddingLeft: 0,
                               wheelX: "panX",
                               wheelY: "zoomX",
                               layout: root.verticalLayout,
                             })
                           );

                           // Add legend
                           // https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
                           var legend = chart.children.push(
                             am5.Legend.new(root, {
                               centerX: am5.p50,
                               x: am5.p50,
                             })
                           );
                        	
                           let data = [];
									
		                       	   // inWList 처리
		                           wArray.inWList.forEach(item => {
		                        	 
		                               data.push({
		                                   week: item.dealDivide + "주", // dealDivide를 week으로 사용
		                                   입금: item.amount, // 입금 amount
		                                   출금: 0,
		                               });
		                           });
		                       	  

		                           // outList 처리
		                            wArray.outList.forEach(item => {
		                               // 해당 dealDivide에 맞는 entry를 찾아서 업데이트
		                               const weekData = data.find(d => d.week === item.dealDivide);
		                               if (weekData) {
		                                   weekData.출금 += item.amount; // 출금 amount 추가
		                               } else {
		                                   // dealDivide가 없는 경우 새로 추가
		                                   data.push({
		                                       week: item.dealDivide + "주",
		                                       입금: 0, // 초기값으로 0 설정
		                                       출금: item.amount, // 출금 amount
		                                   });
		                               }
		                           });

                           // Create axes
                           // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
                           var xRenderer = am5xy.AxisRendererX.new(root, {
                             cellStartLocation: 0.1,
                             cellEndLocation: 0.9,
                             minorGridEnabled: true,
                           });

                           var xAxis = chart.xAxes.push(
                             am5xy.CategoryAxis.new(root, {
                               categoryField: "week",
                               renderer: xRenderer,
                               tooltip: am5.Tooltip.new(root, {}),
                             })
                           );

                           xRenderer.grid.template.setAll({
                             location: 1,
                           });

                           xAxis.data.setAll(data);

                           var yAxis = chart.yAxes.push(
                             am5xy.ValueAxis.new(root, {
                               renderer: am5xy.AxisRendererY.new(root, {
                                 strokeOpacity: 0.1,
                               }),
                             })
                           );

                           // Add series
                           // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
                           function makeSeries(name, fieldName) {
                             var series = chart.series.push(
                               am5xy.ColumnSeries.new(root, {
                                 name: name,
                                 xAxis: xAxis,
                                 yAxis: yAxis,
                                 valueYField: fieldName,
                                 categoryXField: "week",
                               })
                             );

                             series.columns.template.setAll({
                               tooltipText: "{name}, {categoryX}:{valueY}",
                               width: am5.percent(90),
                               tooltipY: 0,
                               strokeOpacity: 0,
                             });

                             xAxis.data.setAll(data);
                             chart.series.each(series => {
                                 series.data.setAll(data); // 각 시리즈에 데이터 설정
                             });

                             // Make stuff animate on load
                             // https://www.amcharts.com/docs/v5/concepts/animations/
                             series.appear();

                             series.bullets.push(function () {
                               return am5.Bullet.new(root, {
                                 locationY: 0,
                                 sprite: am5.Label.new(root, {
                                   text: "{valueY}",
                                   fill: root.interfaceColors.get("alternativeText"),
                                   centerY: 0,
                                   centerX: am5.p50,
                                   populateText: true,
                                 }),
                               });
                             });

                             legend.data.push(series);
                           }

                           makeSeries("입금 금액", "입금");
                           makeSeries("출금 금액", "출금");

                           // Make stuff animate on load
                           // https://www.amcharts.com/docs/v5/concepts/animations/
                           chart.appear(1000, 100);
                         }); // end am5.ready()
                        	
                        	
                        	
                        }, /* success 끝*/
                        error: function () {
                            console.error("주간 리스트 ajax 조회 실패");
                        },
                    });
                }
            });
        });

                /* month Content */
                 am5.ready(function () {

                 var root = am5.Root.new("chartdiv0");

                 root.setThemes([am5themes_Animated.new(root)]);

                 var chart = root.container.children.push(
                   am5xy.XYChart.new(root, {
                     panX: false,
                     panY: false,
                     paddingLeft: 0,
                     wheelX: "panX",
                     wheelY: "zoomX",
                     layout: root.verticalLayout,
                   })
                 );

                 var legend = chart.children.push(
                   am5.Legend.new(root, {
                     centerX: am5.p50,
                     x: am5.p50,
                   })
                 );

                 var data = [
                 <c:forEach var="total" items="${totalList}">
                	{
                    	month: "${total.paymentDate}월",
                		${total.dealType}: ${total.amount},
                	},
                </c:forEach>
                 ];

	             // 데이터 비어있을때 출력될거
	              if(data.length == 0){
	              	chart.hide();
	              	document.getElementById("noDataMessage").style.display = "block";
	              	$("#chartdiv0").hide();
	              }else{
                           var xRenderer = am5xy.AxisRendererX.new(root, {
                             cellStartLocation: 0.1,
                             cellEndLocation: 0.9,
                             minorGridEnabled: true,
                           });

                           var xAxis = chart.xAxes.push(
                             am5xy.CategoryAxis.new(root, {
                               categoryField: "month",
                               renderer: xRenderer,
                               tooltip: am5.Tooltip.new(root, {}),
                             })
                           );

                           xRenderer.grid.template.setAll({
                             location: 1,
                           });

                           xAxis.data.setAll(data);

                           var yAxis = chart.yAxes.push(
                             am5xy.ValueAxis.new(root, {
                               renderer: am5xy.AxisRendererY.new(root, {
                                 strokeOpacity: 0.1,
                               }),
                             })
                           );

                           // Add series
                           // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
                           function makeSeries(name, fieldName) {
                             var series = chart.series.push(
                               am5xy.ColumnSeries.new(root, {
                                 name: name,
                                 xAxis: xAxis,
                                 yAxis: yAxis,
                                 valueYField: fieldName,
                                 categoryXField: "month",
                               })
                             );

                             series.columns.template.setAll({
                               tooltipText: "{name}, {categoryX}:{valueY}",
                               width: am5.percent(90),
                               tooltipY: 0,
                               strokeOpacity: 0,
                             });

                             series.data.setAll(data);

                             // Make stuff animate on load
                             // https://www.amcharts.com/docs/v5/concepts/animations/
                             series.appear();

                             series.bullets.push(function () {
                               return am5.Bullet.new(root, {
                                 locationY: 0,
                                 sprite: am5.Label.new(root, {
                                   text: "{valueY}",
                                   fill: root.interfaceColors.get("alternativeText"),
                                   centerY: 0,
                                   centerX: am5.p50,
                                   populateText: true,
                                 }),
                               });
                             });

                             legend.data.push(series);
                           }

                           makeSeries("입금 금액", "입금");
                           makeSeries("출금 금액", "출금");

                           // Make stuff animate on load
                           // https://www.amcharts.com/docs/v5/concepts/animations/
                           chart.appear(1000, 100);

              	}
                        }); // end am5.ready()
            </script>

            <!-- 수입/지출 그래프 그룹 -->
            <div class="col-md-6">
              <div class="card">
                <div class="card-header">
                  <select id="month">
                    <c:forEach var="m" items="${ monthList }">
                      <option value="${ m.paymentDate }">
                        ${ m.paymentDate }
                      </option>
                    </c:forEach>
                  </select>

                  <label style="margin-left: 20px; margin-top: 15px">
                    <h6>월별 수입 / 지출 통계</h6>
                  </label>
                </div>

                <div class="card-body">
                  <div class="chartWrap">
                    <!-- 수입 그래프 -->
                    <div id="chartdiv1"></div>
                    <!-- 지출 그래프 -->
                    <div id="chartdiv2"></div>

                    <!-- Chart code -->
                    <script>
                      let incomeChart, expenseChart;

                      $(document).ready(() => {
                          let month = $("#month").val();
                          fetchData(month);

                          $('#month').change(() => {
                              month = $("#month").val();
                              fetchData(month);
                          });

                          function fetchData(month) {
                              // 입금 데이터 요청
                              $.ajax({
                                  url: "monthIn.ac",
                                  data: {
                                      memNo: ${loginUser.memNo},
                                      paymentDate: month,
                                  },
                                  success: function(data) {
                                  	if(data.length == 0){
                                  		if(incomeChart){
                                  			incometChart.hide();
                                  		}
                                  		$("#chartdiv1").append("<div class='noData'>입력된 값이 없습니다.</div>");
                                  	}else{
                                  		$(".noData").remove();
                                  		
                                        if (!incomeChart) {
                                           // 차트가 없는 경우 새로 생성
                                           am5.ready(function() {
                                               let root = am5.Root.new("chartdiv1");
                                               root.setThemes([am5themes_Animated.new(root)]);

                                               incomeChart = root.container.children.push(
                                                   am5percent.PieChart.new(root, {
                                                       layout: root.verticalLayout,
                                                       innerRadius: am5.percent(50),
                                                   })
                                               );

                                               let series = incomeChart.series.push(
                                                   am5percent.PieSeries.new(root, {
                                                       valueField: "value",
                                                       categoryField: "category",
                                                       alignLabels: false,
                                                   })
                                               );

                                               series.labels.template.setAll({
                                                   textType: "circular",
                                                   centerX: 0,
                                                   centerY: 0,
                                               });

                                               // 초기 데이터 설정
                                               let chartData = data.map(item => ({
                                                   value: item.amount,
                                                   category: item.dealDivide
                                               }));
                                               series.data.setAll(chartData);

                                            // 수입 라벨
                                            var incomeLabel = root.container.children.push(
                                                am5.Label.new(root, {
                                                    text: "수입",
                                                    fontSize: 15,
                                                    fontWeight: "bold",
                                                    x: am5.percent(50),
                                                    y: am5.percent(10),
                                                    centerX: am5.percent(50),
                                                    centerY: am5.percent(50),
                                                    fill: am5.color(0x0E4EAD) // 텍스트 색상
                                                })
                                            );
                                           });
                                       } else {
                                           // 차트가 있는 경우 데이터만 업데이트
                                           let series = incomeChart.series.getIndex(0);
                                           let chartData = data.map(item => ({
                                               value: item.amount,
                                               category: item.dealDivide
                                           }));
                                           series.data.setAll(chartData);  // 데이터 업데이트
                                       }

                                    // 금액 나오게
                                       incomeChart.series.getIndex(0).labels.template.setAll({
                                           text: "{category}: {value}원" // 카테고리, 금액 표시
                                       });
                                  	}
                                  },
                                  error: function() {
                                      console.log("수입 그래프 ajax 실패");
                                  },
                              });

                              // 지출 데이터 요청
                              $.ajax({
                                  url: "monthOut.ac",
                                  data: {
                                      memNo: ${loginUser.memNo},
                                      paymentDate: month,
                                  },
                                  success: function(outData) {
                                  	if(outData.length == 0){
                                  		if (expenseChart) {
                                            expenseChart.hide();
                                        }
                                        $("#chartdiv2").append("<div class='noData'>입력된 값이 없습니다.</div>");
                                  	}else{
                                  		$(".noData").remove();
                                        if (!expenseChart) {
                                           // 차트가 없는 경우 새로 생성
                                           am5.ready(function() {
                                               let root = am5.Root.new("chartdiv2");
                                               root.setThemes([am5themes_Animated.new(root)]);

                                               expenseChart = root.container.children.push(
                                                   am5percent.PieChart.new(root, {
                                                       layout: root.verticalLayout,
                                                       innerRadius: am5.percent(50),
                                                   })
                                               );

                                               let series = expenseChart.series.push(
                                                   am5percent.PieSeries.new(root, {
                                                       valueField: "value",
                                                       categoryField: "category",
                                                       alignLabels: false,
                                                   })
                                               );

                                               series.labels.template.setAll({
                                                   textType: "circular",
                                                   centerX: 0,
                                                   centerY: 0,
                                               });

                                               // 초기 데이터 설정
                                               let chartData = outData.map(item => ({
                                                   value: item.amount,
                                                   category: item.dealDivide
                                               }));
                                               series.data.setAll(chartData);

                                               // 지출 라벨
                                               var expenseLabel = root.container.children.push(
                                                       am5.Label.new(root, {
                                                           text: "지출",
                                                           fontSize: 15,
                                                           fontWeight: "bold",
                                                           x: am5.percent(50),
                                                           y: am5.percent(10),
                                                           centerX: am5.percent(50),
                                                           centerY: am5.percent(50),
                                                           fill: am5.color(0x0E4EAD) // 텍스트 색상
                                                       })
                                                   );
                                           });
                                       } else {
                                           // 차트가 있는 경우 데이터만 업데이트
                                           let series = expenseChart.series.getIndex(0);
                                           let chartData = outData.map(item => ({
                                               value: item.amount,
                                               category: item.dealDivide
                                           }));
                                           series.data.setAll(chartData);  // 데이터 업데이트
                                       }

                                       // 금액 뜨게
                                       expenseChart.series.getIndex(0).labels.template.setAll({
                                           text: "{category}: {value}원" // 카테고리, 금액 표시
                                       });
                                  	}
                                  },
                                  error: function() {
                                      console.log("지출 그래프 ajax 실패");
                                  },
                              });
                          }
                      });
                    </script>
                  </div>
                </div>
                <!-- cardbody -->
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="card">
                <div class="card-header">
                  거래내역보기
                  <!-- Button trigger modal -->
                  <div
                    class="btn col-md-3 icon-list-item ik ik-plus-circle"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  ></div>

                  <!-- Modal -->
                  <div
                    class="modal fade"
                    id="exampleModal"
                    tabindex="-1"
                    aria-labelledby="exampleModalLabel"
                    aria-hidden="true"
                  >
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel">
                            가계부 수기 입력
                          </h1>
                          <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                          ></button>
                        </div>
                        <div class="modal-body">
                          <jsp:include page="inputAcountBook.jsp" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <div
                    id="data_table_wrapper"
                    class="dataTables_wrapper dt-bootstrap4 no-footer"
                  >
                    <div class="row">
                      <table
                        id="data_table"
                        class="table dataTableno-footer"
                        role="grid"
                        aria-describedby="data_table_info"
                      >
                        <thead>
                          <tr role="row">
                            <th>거래 날짜</th>
                            <th>거래 유형</th>
                            <th>거래 구분</th>
                            <th>거래내역명</th>
                            <th>금액</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:if test="${empty list}">
                            <tr>
                              <td colspan="5" align="center">
                                이용내역이 없습니다 :)
                              </td>
                            </tr>
                          </c:if>
                          <c:forEach var="a" items="${list}">
                            <tr role="row">
                              <td>${a.paymentDate}</td>
                              <td>${a.dealType}</td>
                              <td>${a.dealDivide}</td>
                              <td>${a.compendiums}</td>
                              <td>${a.amount}원</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div class="row">
                      <div id="pagainaArea">
                        <ul class="pagination">
                          <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                              <li class="page-item disabled">
                                <a class="page-link" href="">←</a>
                              </li>
                            </c:when>
                            <c:otherwise>
                              <li class="page-item">
                                <a
                                  class="page-link"
                                  href="acountBook.ac?cpage=${ pi.currentPage - 1 }"
                                  >←</a
                                >
                              </li>
                            </c:otherwise>
                          </c:choose>

                          <c:forEach
                            var="p"
                            begin="${ pi.startPage }"
                            end="${ pi.endPage }"
                          >
                            <li class="page-item">
                              <a
                                class="page-link"
                                href="acountBook.ac?cpage=${p}"
                                >${ p }</a
                              >
                            </li>
                          </c:forEach>

                          <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                              <li class="page-item disabled">
                                <a class="page-link" href="">→</a>
                              </li>
                            </c:when>
                            <c:otherwise>
                              <li class="page-item">
                                <a
                                  class="page-link"
                                  href="acountBook.ac?cpage=${ pi.currentPage + 1 }"
                                  >→</a
                                >
                              </li>
                            </c:otherwise>
                          </c:choose>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 메인 컨테이너 div 끝 -->

        </div>
      </div>
    </div>
  </body>
</html>
