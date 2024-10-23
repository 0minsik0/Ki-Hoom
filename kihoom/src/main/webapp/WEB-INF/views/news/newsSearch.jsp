<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>NEWS</title>
    <link rel="stylesheet" href="resources/css/newsSearch.css" />
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
        	<div class="inputDiv">
	          <table align="center">
	            <tr>
	              <td>
	                <select id="articles">
	                  <option value="articles">국내 뉴스</option>
	                  <option value="global-articles">해외 뉴스</option>
	                </select>
	              </td>
	              <td>
	                <div class="coolinput">
	                  <label for="input" class="textlabel">keyword : </label>
	                  <input
	                    type="text"
	                    placeholder="키워드를 입력해주세요 :)"
	                    name="keyword"
	                    class="newsInput"
	                  />
	                </div>
	              </td>
	              <td>
	                <button class="nSearchBtn" onclick="searchNews()">
	                  <span>Search</span>
	                </button>
	              </td>
	            </tr>
	          </table>
        	</div>

          <div class="resultDiv">
          	<jsp:include page="newsMain.jsp" />
          </div>
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
          $.ajax({
            url: "search.ne",
            data: {
              articles: $("#articles").val(),
              keyword: keywordInput.val(),
            },
            success: function (data) {
              let items = data.data;
              console.log(items);

              let value = "";
              if(items.length != 0){
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
	              $(".resultDiv").html(value);
              }else{
            	  keywordInput.val("");
            	  $(".resultDiv").html("<div align='center'>제목에 검색하신 키워드를 가진 뉴스가 없습니다.<div>")
              }
            },
            error: function () {
              console.log("search ajax 실패");
            },
          });
      }
    </script>
  </body>
</html>
