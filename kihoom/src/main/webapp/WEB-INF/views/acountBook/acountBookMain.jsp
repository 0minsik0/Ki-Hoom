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
    <style>
      #myChartDiv {
        width: 450px;
        height: 200px;
        background-color: white;
        border-radius: 20px;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../menubar.jsp" />
        <div class="main-content">
          <button id="certification">인증하기</button>

          <script>
            $("#certification").click(()=>{
            	let tmpWindow = window.open(url,'about:blank');
            	console.log(tmpWindow);
            	tmpWindow.location = ${url};
            })
          </script>

          <div id="myChartDiv"><canvas id="myChart"></canvas></div>

          <div class="card">
            <div class="card-header">
              <h3>입금띠</h3>
            </div>
            <div class="card-body">
              <div id="c3-donut-chart" class="c3">
                <svg width="100" height="50">
                  <g transform="translate(0.5,4.5)">
                    <g
                      clip-path="url(https://themewagon.github.io/themekit/#c3-1728278621058-clip)"
                      class="c3-chart"
                    ></g>
                  </g>
                </svg>
              </div>
            </div>
          </div>

          <script>
            const ctx = document.getElementById("myChart");

            new Chart(ctx, {
              type: "doughnut",
              data: {
                labels: ["Red", "Blue", "Yellow"],
                datasets: [
                  {
                    label: "My First Dataset",
                    data: [300, 50, 100],
                    backgroundColor: [
                      "rgb(255, 99, 132)",
                      "rgb(54, 162, 235)",
                      "rgb(255, 205, 86)",
                    ],
                    hoverOffset: 4,
                  },
                ],
              },
            });
          </script>
        </div>
      </div>
    </div>
  </body>
</html>
