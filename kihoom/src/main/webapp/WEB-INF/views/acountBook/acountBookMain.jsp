<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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

    <style>
      #myChartDiv {
        width: 450px;
        height: 200px;
        background-color: white;
        border-radius: 20px;
      }

      .plusBtn {
        color: #0e4ead;
      }
      
       #chartdiv0 {
	  width: 100%;
	  height: 500px;
	}
      
      .chartWrap{
      	display: flex;
      }

      #chartdiv1 {
        width: 20%;
        height: 500px;
        margin: 20px;
      }
      
      #chartdiv2{
      	width: 20%;
      	height: 500px;
      	margin: 20px;
      }
      
     
      
    </style>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../menubar.jsp" />
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
              </div>
            </div>
          </div>
          
          <br> <br>

          <div id="codeDisplay">
            사용자 인증 코드 : ${code} <br />
            사용자 토큰 : ${accessToken} <br />
            사용자 번호 : ${userSeqNo}
          </div>

          <script>
            function certification() {
              $.ajax({
                url: "certification.ac",
                type: "GET",
                success: function (response) {
                  const url = response.url;
                  console.log(url);
                  window.open(url, "_self");
                },
                error: function (request, status, error) {
                  console.log(
                    "code:" +
                      request.status +
                      "\n" +
                      "message:" +
                      request.responseText +
                      "\n" +
                      "error:" +
                      error
                  );
                },
              });
            }
          </script>
          
          <!-- 전체 통계 그래프 -->
          <div id="chartdiv0"></div>
          
          <!-- Chart code -->
			<script>
			am5.ready(function() {
			
			
			// Create root element
			// https://www.amcharts.com/docs/v5/getting-started/#Root_element
			var root = am5.Root.new("chartdiv0");
			
			
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
			  "year": "2021",
			  "europe": 2.5,
			  "namerica": 2.5,
			  "asia": 2.1,
			  "lamerica": 1,
			  "meast": 0.8,
			  "africa": 0.4
			}, {
			  "year": "2022",
			  "europe": 2.6,
			  "namerica": 2.7,
			  "asia": 2.2,
			  "lamerica": 0.5,
			  "meast": 0.4,
			  "africa": 0.3
			}, {
			  "year": "2023",
			  "europe": 2.8,
			  "namerica": 2.9,
			  "asia": 2.4,
			  "lamerica": 0.3,
			  "meast": 0.9,
			  "africa": 0.5
			}]
			
			
			// Create axes
			// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
			var xRenderer = am5xy.AxisRendererX.new(root, {
			  cellStartLocation: 0.1,
			  cellEndLocation: 0.9,
			  minorGridEnabled: true
			})
			
			var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
			  categoryField: "year",
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
			    categoryXField: "year"
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
			
			makeSeries("Europe", "europe");
			makeSeries("North America", "namerica");
			makeSeries("Asia", "asia");
			makeSeries("Latin America", "lamerica");
			makeSeries("Middle East", "meast");
			makeSeries("Africa", "africa");
			
			
			// Make stuff animate on load
			// https://www.amcharts.com/docs/v5/concepts/animations/
			chart.appear(1000, 100);
			
			}); // end am5.ready()
			</script>
          
          
          
          <!-- 수입/지출 그래프 그룹 -->
          <div class="chartWrap">
          
          <!-- 수입 그래프 -->
          <div id="chartdiv1"></div>
          
          <!-- Chart code -->
			<script>
			am5.ready(function() {
			
			// Create root element
			// https://www.amcharts.com/docs/v5/getting-started/#Root_element
			var root = am5.Root.new("chartdiv1");
			
			
			// Set themes
			// https://www.amcharts.com/docs/v5/concepts/themes/
			root.setThemes([
			  am5themes_Animated.new(root)
			]);
			
			
			// Create chart
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
			var chart = root.container.children.push(am5percent.PieChart.new(root, {
			  layout: root.verticalLayout,
			  innerRadius: am5.percent(50)
			}));
			
			
			// Create series
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
			var series = chart.series.push(am5percent.PieSeries.new(root, {
			  valueField: "value",
			  categoryField: "category",
			  alignLabels: false
			}));
			
			series.labels.template.setAll({
			  textType: "circular",
			  centerX: 0,
			  centerY: 0
			});
			
			
			// Set data
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
			series.data.setAll([
			  { value: 10, category: "One" },
			  { value: 9, category: "Two" },
			  { value: 6, category: "Three" },
			  { value: 5, category: "Four" },
			  { value: 4, category: "Five" },
			  { value: 3, category: "Six" },
			  { value: 1, category: "Seven" },
			]);
			
			
			// Create legend
			// https://www.amcharts.com/docs/v5/charts/percent-charts/legend-percent-series/
			var legend = chart.children.push(am5.Legend.new(root, {
			  centerX: am5.percent(50),
			  x: am5.percent(50),
			  marginTop: 15,
			  marginBottom: 15,
			}));
			
			legend.data.setAll(series.dataItems);
			
			
			// Play initial series animation
			// https://www.amcharts.com/docs/v5/concepts/animations/#Animation_of_series
			series.appear(1000, 100);
			
			}); // end am5.ready()
			</script>
			
			<!-- 지출 그래프 -->
			<div id="chartdiv2"></div>
          
          	<!-- Chart code -->
			<script>
			am5.ready(function() {
			
			// Create root element
			// https://www.amcharts.com/docs/v5/getting-started/#Root_element
			var root = am5.Root.new("chartdiv2");
			
			
			// Set themes
			// https://www.amcharts.com/docs/v5/concepts/themes/
			root.setThemes([
			  am5themes_Animated.new(root)
			]);
			
			
			// Create chart
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
			var chart = root.container.children.push(am5percent.PieChart.new(root, {
			  layout: root.verticalLayout,
			  innerRadius: am5.percent(50)
			}));
			
			
			// Create series
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
			var series = chart.series.push(am5percent.PieSeries.new(root, {
			  valueField: "value",
			  categoryField: "category",
			  alignLabels: false
			}));
			
			series.labels.template.setAll({
			  textType: "circular",
			  centerX: 0,
			  centerY: 0
			});
			
			
			// Set data
			// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
			series.data.setAll([
			  { value: 10, category: "One" },
			  { value: 9, category: "Two" },
			  { value: 6, category: "Three" },
			  { value: 5, category: "Four" },
			  { value: 4, category: "Five" },
			  { value: 3, category: "Six" },
			  { value: 1, category: "Seven" },
			]);
			
			
			// Create legend
			// https://www.amcharts.com/docs/v5/charts/percent-charts/legend-percent-series/
			var legend = chart.children.push(am5.Legend.new(root, {
			  centerX: am5.percent(50),
			  x: am5.percent(50),
			  marginTop: 15,
			  marginBottom: 15,
			}));
			
			legend.data.setAll(series.dataItems);
			
			
			// Play initial series animation
			// https://www.amcharts.com/docs/v5/concepts/animations/#Animation_of_series
			series.appear(1000, 100);
			
			}); // end am5.ready()
			</script>
          </div>

          
          
          
          
          

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
                    가계부 직접 입력하기
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
          
          
          
          
        </div> <!-- 메인 컨테이너 div -->
      </div>
    </div>
  </body>
</html>
