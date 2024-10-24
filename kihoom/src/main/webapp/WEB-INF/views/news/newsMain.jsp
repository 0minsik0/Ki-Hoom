<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>NEWS</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="resources/css/news.css" />
  </head>
  <body>

          <!-- 로딩될때..! -->
          <div class="typewriter" align="center">
            <div class="slide"><i></i></div>
            <div class="paper"></div>
            <div class="keyboard"></div>
            <div>뉴스 가져오는중입니다</div>
          </div>

    <script>
      $(window).load(() => {
        $(".typewriter").hide();
      });
    </script>

    <script>
      $(() => {
        news();
      });

      function news() {
        const newsValue = "<h1 align='center'>세계 시장 포켓 뉴스</h1>";
        $.ajax({
          url: "global.ne",
          success: function (data) {
            let itemArr = data.response.body.itemList.item;

            let value = "";
            for (let i in itemArr) {
              let item = itemArr[i];

              value +=
                "<a href='" +
                item.kotraNewsUrl +
                "' id='newsAtag'>" +
                "<div class='newsCard'>" +
                "<img class='newsCard-image' src='" +
                item.fileLink +
                "'>" +
                "<div class='newsCategory'>" +
                item.infoCl +
                " / " +
                item.natn +
                "</div>" +
                "<div class='newsHeading'>" +
                item.newsTitl +
                "<div class='newsAuthor'>By <span class='newsName'>" +
                item.newsWrterNm +
                "</span> " +
                item.othbcDt +
                "</div>" +
                "</div> </div> </a>";
            }
            $(".resultDiv").html(newsValue + value);
          },
          error: function () {
            console.log("국제 뉴스 ajax 통신 실패");
          },
        });
      }
    </script>
  </body>
</html>
