<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .card-header {
        display: flex;
        justify-content: space-between;
      }

      .form-control {
        width: 100px !important;
      }

      #pagingArea {
        display: flex;
        justify-content: center;
      }

      .pagination {
        width: 200px;
      }

      .pageNo {
        width: 20px;
        height: 20px;
        text-align: center;
        margin-left: 20px;
      }

      .pageNo:hover {
        text-decoration: underline;
      }

      .pageNo.selected {
        border: 1px solid gray;
      }

      .pageNo.selected a {
        color: #007bff;
      }

      .pageNo.selected:hover {
        text-decoration: underline;
        text-decoration-color: #007bff;
      }

      #boardList > tbody > tr:hover {
        cursor: pointer;
        background-color: lightgray;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
          <div
            class="col-md-12"
            style="margin: auto; max-width: 85%; margin-top: 50px"
          >
            <div class="card">
              <div class="card-header">
                <div class="title-area">
                  <h3>게시판</h3>
                  <br />
                  <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                  <c:if test="${ not empty loginUser }">
                    <a
                      class="btn btn-secondary btn-sm"
                      style="float: right"
                      href="enrollForm.bo"
                      >글쓰기</a
                    >
                  </c:if>
                </div>
                <div class="selection-area">
                  <select class="form-control">
                    <option>전체</option>
                    <option>투자/주식</option>
                    <option>뉴스</option>
                    <option>자유</option>
                  </select>
                </div>
              </div>
              <div class="card-body p-0 table-border-style">
                <div class="table-responsive">
                  <table
                    id="boardList"
                    class="table"
                    style="text-align: center"
                  >
                    <thead>
                      <tr>
                        <th></th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회</th>
                        <th>좋아요</th>
                        <th>작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="b" items="${ list }">
                        <tr>
                          <td class="bno">${ b.boardNo }</td>
                          <td>[${ b.categoryName }]${ b.boardTitle }</td>
                          <td>${ b.boardWriter }</td>
                          <td>${ b.boardCount }</td>
                          <td>${ b.likeCount }</td>
                          <td>${ b.createDate }</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>

                  <br />

                  <script>
                    $(function () {
                      $("#boardList>tbody>tr").click(function () {
                        location.href =
                          "detail.bo?bno=" + $(this).children(".bno").text();
                      });
                    });
                  </script>

                  <div id="pagingArea">
                    <ul class="pagination">
                      <c:forEach
                        var="p"
                        begin="${ pi.startPage }"
                        end="${ pi.endPage }"
                      >
                        <c:choose>
                          <c:when test="${ pi.currentPage eq p}">
                            <li class="pageNo selected">
                              <a href="list.bo?cpage=${ p }">${ p }</a>
                            </li>
                          </c:when>
                          <c:otherwise>
                            <li class="pageNo">
                              <a href="list.bo?cpage=${ p }">${ p }</a>
                            </li>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
