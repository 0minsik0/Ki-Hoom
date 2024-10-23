<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자산 목표</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 외부 부트스트랩 -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
.card-header div{
	display: flex;
	align-content: inherit;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../common/header.jsp" />
		<div class="page-wrap">
			<jsp:include page="../common/menubar.jsp" />
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-6 col-xl-4">
                             <div class="card">
                                 <div class="card-header">
                                     <div><h2>${ targetName }</h2></div>
                                 </div>
                                 <div class="card-header">
                                     <div><h4>목표금액 : ${ targetAsset } 원</h4></div>
                                     
                                     <c:choose>
                                     	<c:when test="${ mTarget > insertAmount}">
                                     		<div class="col-md-3 icon-list-item ik ik-user-minus" style="color: red;">부족해요..</div>
                                     	</c:when>
                                     	<c:when test="${ mTarget < insertAmount }">
                                     		<div class="col-md-3 icon-list-item ik ik-user-plus" style="color: blue;">대단해요~~</div>
                                     	</c:when>
                                     	<c:when test="${ mTarget == insertAmount }">
                                     		<div class="col-md-3 icon-list-item ik ik-user-check" style="color: green;">목표 금액 달성!!</div>
                                     	</c:when>
                                     	<c:otherwise>
                                     		<div class="col-md-3 icon-list-item ik ik-user">그저그래요</div>
                                     	</c:otherwise>
                                     </c:choose>
                                     
                                 </div>
                                 <div class="card-block text-center">
                                     <div id="chartdiv"></div>
                                 </div>
                             </div>
                         </div>
                         
                     	<script>
							am5.ready(function() {
				
				
							// Create root element
							// https://www.amcharts.com/docs/v5/getting-started/#Root_element
							var root = am5.Root.new("chartdiv");
				
				
							// Set themes
							// https://www.amcharts.com/docs/v5/concepts/themes/
							root.setThemes([
							  am5themes_Animated.new(root)
							]);
				
				
							// Create chart
							// https://www.amcharts.com/docs/v5/charts/xy-chart/
							var chart = root.container.children.push(am5xy.XYChart.new(root, {
							  panX: false,
							  panY: false,
							  paddingLeft: 0,
							  wheelX: "panX",
							  wheelY: "zoomX",
							  layout: root.verticalLayout
							}));
				
				
							// Add legend
							// https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
							var legend = chart.children.push(
							  am5.Legend.new(root, {
							    centerX: am5.p50,
							    x: am5.p50
							  })
							);
				
							var data = [{
							  "month": "8월",
							  "reTarget": 2950000,
							  "mTarget": 250000,
							  "insertAmount": 50000,
							}, {
							  "month": "9월",
							  "reTarget": 2650000,
							  "mTarget": 269000,
							  "insertAmount": 300000,
							}, {
							  "month": "10월",
							  "reTarget": 2450000,
							  "mTarget": 265000,
							  "insertAmount": 200000,
							}]
				
				
							// Create axes
							// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
							var xRenderer = am5xy.AxisRendererX.new(root, {
							  cellStartLocation: 0.1,
							  cellEndLocation: 0.9,
							  minorGridEnabled: true
							})
				
							var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
							  categoryField: "month",
							  renderer: xRenderer,
							  tooltip: am5.Tooltip.new(root, {})
							}));
				
							xRenderer.grid.template.setAll({
							  location: 1
							})
				
							xAxis.data.setAll(data);
				
							var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
							  renderer: am5xy.AxisRendererY.new(root, {
							    strokeOpacity: 0.1
							  })
							}));
				
				
							// Add series
							// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
							function makeSeries(name, fieldName) {
							  var series = chart.series.push(am5xy.ColumnSeries.new(root, {
							    name: name,
							    xAxis: xAxis,
							    yAxis: yAxis,
							    valueYField: fieldName,
							    categoryXField: "month"
							  }));
				
							  series.columns.template.setAll({
							    tooltipText: "{name}, {categoryX}:{valueY}",
							    width: am5.percent(90),
							    tooltipY: 0,
							    strokeOpacity: 0
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
							        populateText: true
							      })
							    });
							  });
				
							  legend.data.push(series);
							}
				
							makeSeries("총 남은 금액", "reTarget");
							makeSeries("월별 목표 금액", "mTarget");
							makeSeries("입금 금액", "insertAmount");
				
							// Make stuff animate on load
							// https://www.amcharts.com/docs/v5/concepts/animations/
							chart.appear(1000, 100);
				
							}); // end am5.ready()
						</script>
						
						<div class="col-md-7">
							<div class="card">
								<div class="card-header d-block">
									<h3>입금 내역</h3>
								</div>
								<div class="card-body p-0 table-border-style">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>입금 날짜</th>
													<th>입금 금액</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty list}">
											        <tr>
											            <td colspan="2" align="center"> 입금내역이 없습니다 :)</td>
											        </tr>
											    </c:if>
											    <c:forEach var="t" items="${list}">
											        <tr role="row">
											            <td>${t.inDate}</td>
											            <td>${t.inAmount}</td>
											        </tr>
											    </c:forEach>
											</tbody>
										</table>
										
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
                                  href="list.ac?cpage=${ pi.currentPage - 1 }"
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
                              <a class="page-link" href="list.ac?cpage=${p}"
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
                                  href="list.ac?cpage=${ pi.currentPage + 1 }"
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
									
                         
                         
                         
                 
                            
                         
                         
					</div> <!-- row끝 -->
				</div>
			</div> <!-- main-content 닫는 div-->
		</div>	
	</div>

</body>
</html>