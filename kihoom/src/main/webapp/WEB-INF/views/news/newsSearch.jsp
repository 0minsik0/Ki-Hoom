<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
          <div class="coolinput">
            <label for="input" class="textlabel">keyword : </label>
            <input
              type="text"
              placeholder="키워드를 입력해주세요 :)"
              name="keyword"
              class="newsInput"
            />
          </div>
          <button type="submit" class="nSearchBtn" onclick="searchNews()">
            <span>Search</span>
          </button>
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
              console.log(data.data);

              let items = data.data;

              let value = "";
              for (let i in items) {
                let item = items[i];

                if (articles == "articles") {
                  value += <div class='card'>
		       			 	+ <div class='image'><img src='${item.image_url}' alt='titleImage'></div>
			   			 		+ <div class='content'>
			   			 		  + <a href='${item.content_url}'>
			   			 		    + <span class='title'> + ${item.title} + </span>
			   					  + </a>
			   					  + <p class='desc'> + ${item.summary} + </p>
			   					  + <a class='action' href='${item.content_url}'>Detail View
			   					    + <span aria-hidden='true'> → </span>
			   					  + </a> </div> </div>
                	}else{
                		value += `<div class="card">
	       					 <div class="image"><img src="${item.image_url}" alt="titleImage"></div>
		   					  <div class="content">
		   					    <a href="${item.content_url}">
		   					      <span class="title">
		   					        ${item.title_ko}
		   					      </span>
		   					    </a>
		
		   					    <p class="desc">
		   					      ${item.summary_ko}
		   					    </p>
		
		   					    <a class="action" href="${item.content_url}">
		   					      Detail View
		   					      <span aria-hidden="true">
		   					        →
		   					      </span>
		   					    </a>
		   					  </div>
	   					  </div>`;
                	}
              }
              $(".main-content").html(value);
              keywordInput.val("");
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
