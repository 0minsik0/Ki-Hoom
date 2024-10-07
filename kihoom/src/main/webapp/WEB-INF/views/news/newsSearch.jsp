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
          <form action="search.ne">
            <div class="coolinput">
              <label for="input" class="text">keyword : </label>
              <input
                type="text"
                placeholder="키워드를 입력해주세요 :)"
                name="keyword"
                class="newsInput"
              />
            </div>
            <button type="submit" class="nSearchBtn">
              <span>Search</span>
            </button>
          </form>
        </div>
      </div>
    </div>

    <script></script>
  </body>
</html>
