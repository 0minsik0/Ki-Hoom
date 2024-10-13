<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>news search</title>
    <link rel="stylesheet" href="resources/css/newsSearch.css" />
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../menubar.jsp" />
        <div class="main-content">
          <select id="articles">
            <option value="articles">국내 뉴스</option>
            <option value="global-articles">해외 뉴스</option>
          </select>
          <div class="inputWrap-news">
            <div class="coolinput">
              <label for="input" class="textlabel">keyword : </label>
              <input
                type="text"
                placeholder="키워드를 입력해주세요 :)"
                name="keyword"
                class="newsInput"
              />
            </div>
          </div>
          <button class="nSearchBtn" onclick="searchNews()">
            <span>Search</span>
          </button>
          <div class="searchDiv"></div>
        </div>
      </div>
    </div>

    <script>
      let keywordInput = $(".newsInput");

      $(".newsInput").on("keypress", (e) => {
        if (e.keyCode == "13") {
          if (keywordInput.val() != "") {
            searchNews();
          } else {
            alert("키워드를 입력해주세요!");
          }
        }
      });

      function searchNews() {
        if (keywordInput.val() != "") {
          $.ajax({
            url: "search.ne",
            data: {
              articles: $("#articles").val(),
              keyword: keywordInput.val(),
            },
            success: function (data) {
              let items = data.data;

              let value = "";
              for (let i in items) {
                let item = items[i];

                value +=
                  "<a href='" +
                  item.content_url +
                  "' id='newsAtag'>" +
                  "<div class='newsCard'>" +
                  "<img class='newsCard-image' src='" +
                  item.image_url +
                  "'>" +
                  "<div class='newsCategory'>" +
                  item.sections +
                  "</div>" +
                  "<div class='newsHeading'>" +
                  item.title +
                  "<div class='newsAuthor'>By <span class='newsName'>" +
                  item.publisher +
                  "</span> <br/>" +
                  item.published_at +
                  "</div>" +
                  "</div> </div> </a>";
              }
              keywordInput.val("");
              $(".searchDiv").html(value);
            },
            error: function () {
              console.log("search ajax 실패");
            },
          });
        } else {
          alert("키워드를 입력해주세요!");
        }
      }
    </script>
  </body>
</html>
