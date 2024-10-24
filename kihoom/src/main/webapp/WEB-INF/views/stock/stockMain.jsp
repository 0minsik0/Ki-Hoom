<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/sockjs.min.js"></script>
    <link rel="stylesheet" href="resources/stockCss/stockMain.css" />
  </head>

  <body>
    <c:if test="${not empty alertMsg }">
      <script>
        alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" />
    </c:if>

    <div class="wrapper">
      <jsp:include page="../common/header.jsp" />
      <div class="page-wrap">
        <jsp:include page="../common/menubar.jsp" />
        <div class="main-content">
          <div class="table_session main_box">
            <div class="top_area">
              <h2 style="font-weight: 900">차트</h2>
              <div class="stock_search_area">
                <input type="search" name="stockName" />
                <button type="submit" class="material-icons">search</button>

                <button
                  id="searchModal_btn"
                  data-toggle="modal"
                  ,
                  data-target="#searchModal"
                  style="display: none"
                ></button>
              </div>
            </div>
            <br />
            <div class="table_choose">
              <div class="choose active">
                <input type="hidden" value="1" />거래량
              </div>
              <div class="after"></div>
              <div class="choose"><input type="hidden" value="2" />급상승</div>
              <div class="after"></div>
              <div class="choose"><input type="hidden" value="3" />급하락</div>
              <div class="after"></div>
              <div class="choose"><input type="hidden" value="4" />배당률</div>
            </div>
            <br />
            <table class="table_area">
              <thead>
                <tr>
                  <th>종목</th>
                  <th>현재가</th>
                  <th>전일 대비율</th>
                  <th>누적 거래 대금</th>
                  <th>거래량증가율</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>

                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래대금</td>
                  <td>거래량</td>
                </tr>
              </tbody>
            </table>
            <br />

            <div class="pageinfo_area">
              <button class="btn btn-outline-secondary prev">이전</button>
              <button class="btn btn-outline-secondary page">1</button>
              <button class="btn btn-outline-secondary page">2</button>
              <button class="btn btn-outline-secondary page">3</button>
              <button class="btn btn-outline-secondary next">다음</button>
            </div>
          </div>

          <div class="choose_stock_session main_box">
            <h2 style="font-weight: 900">관심 주식</h2>
            <br />
            <table class="table_area">
              <thead>
                <tr>
                  <th>종목명</th>
                  <th>현재가</th>
                  <th>등락률</th>
                  <th>거래량</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>현재가</td>
                  <td>등락률</td>
                  <td>거래량</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="buy_stock_session main_box">
            <div class="flex">
              <h2 style="font-weight: 900">실현손익합</h2>
              <h3 style="font-weight: 600">-458,854</h3>
            </div>
            <br />
            <div
              class="account_area"
              style="display: flex; justify-content: space-between"
            >
              <div>
                <select name="account_list">
                  <option value="">11111111-12</option>
                </select>
              </div>
              <div
                style="font-weight: 600; cursor: pointer"
                data-toggle="modal"
                data-target="#addAccount"
              >
                + 계좌추가하기
              </div>
            </div>
            <table class="table_area">
              <thead>
                <tr>
                  <th>종목명</th>
                  <th>등락률</th>
                  <th>실현손익</th>
                  <th>손익률</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
                <tr>
                  <input type="hidden" name="stock_No" value="" />
                  <td>종목명</td>
                  <td>매매일자</td>
                  <td>실현손익</td>
                  <td>손익률</td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- The Modal -->
          <div class="modal" id="addAccount">
            <div class="modal-dialog">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">한국 투자 증권 계좌 추가</h4>
                  <button type="button" class="close" data-dismiss="modal">
                    &times;
                  </button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                  <form action="addAccount.st" method="post" align="center">
                    <input
                      type="hidden"
                      name="memNo"
                      value="${loginUser.memNo}"
                    />
                    <input
                      type="number"
                      placeholder="계좌 - 앞 8자리"
                      max="99999999"
                      required
                      pattern="\d*"
                      maxlength="8"
                      name="firstAccount"
                    />-<input
                      type="number"
                      placeholder="계좌 - 뒤 2자리"
                      max="99"
                      required
                      name="secondAccount"
                      pattern="\d*"
                      maxlength="2"
                    />

                    <br /><br />
                    <input
                      type="submit"
                      onclick="return accountsubmit()"
                      class="btn btn-secondary"
                    />
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="main_box tag_session">
            <h2 style="font-weight: 900">카테고리</h2>
            <hr />
            <div class="tag_area">
              <div class="container">
                <button
                  id="tag_modal_btn"
                  style="display: none"
                  data-toggle="modal"
                  data-target="#tag_modal"
                ></button>
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>업종 지수명</th>
                      <th>업종 지수 현재가</th>
                      <th>업종 지수 전일 대비</th>
                      <th>업종 지수 전일 대비율</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <input type="hidden" value="" />
                      <td>John</td>
                      <td>Doe</td>
                      <td>john@example.com</td>
                    </tr>
                    <tr>
                      <td>Mary</td>
                      <td>Moe</td>
                      <td>mary@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- The Modal -->
            <div class="modal" id="tag_modal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">
                      &times;
                    </button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                    <div><span>삼성전자</span>(<span>005930</span>)</div>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-danger"
                      data-dismiss="modal"
                    >
                      Close
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="main_box chat_session">
            <h2 style="font-weight: 900">토론장</h2>

            <hr />

            <div class="chat_content_wrap">
              <div class="chat_view">
                <div class="view_area">
                  <div class="chat_item">
                    <div class="user_id">asdf</div>
                    <div class="message">
                      asddffd
                      aasddddddddddddddddddffffffffffffffffffffasdddddddddddddddddddddddddddddfffffff
                    </div>
                    <div class="date">10/21 18:20</div>
                  </div>
                  <div class="chat_item right">
                    <div class="user_id">rasdf</div>
                    <div class="message">
                      rasdfa asdf asd fsadf sadf saf asdf sad ㅁㄴㅇㄹ ㅁㄴㅇㄹ
                      ㅁㄴㅇㄹ ㅁㄴㅇㄹ ㅁㄴㅇㄹ ㅁㄴㅇㄹ ㅁㄴㅇㄹ ㄴㅁ
                    </div>
                    <div class="date">10/21 18:20</div>
                  </div>
                </div>
              </div>
              <br />
              <div class="chat_input_area">
                <textarea name="" id="chat_message"></textarea>
                <button
                  id="message_send"
                  class="btn btn-outline-success"
                  onclick="send_message()"
                >
                  send
                </button>
              </div>
            </div>
          </div>

          <div class="main_box letay_session">
            <h2 style="font-weight: 900">최근 본 주식</h2>

            <hr />

            <div class="view_content">
              <div class="item">
                <div>삼성전자(005930)</div>
                <input type="hidden" value="" />
                <input type="hidden" value="" />
              </div>
              <div class="item">삼성전자(005930)</div>
            </div>
          </div>
        </div>
        <!--  메인 content 끝  -->
      </div>

      <div class="modal" id="searchModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">검색</h4>
              <button type="button" class="close" data-dismiss="modal">
                &times;
              </button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
              <div class="container">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>종목코드</th>
                      <th>종목명</th>
                      <th>시장</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>John</td>
                      <td>Doe</td>
                      <td>john@example.com</td>
                    </tr>
                    <tr>
                      <td>Mary</td>
                      <td>Moe</td>
                      <td>mary@example.com</td>
                    </tr>
                    <tr>
                      <td>July</td>
                      <td>Dooley</td>
                      <td>july@example.com</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script>
        $(function () {
          $(".pageinfo_area .page").eq(0).click();
          selectChooseList();
          categoryList();
          selectAccount();
          storage();
        });

        const ws = new SockJS("socketChat");
        let flag = false;

        ws.onopen = function () {
          console.log("연결");
          flag = true;
        };
        ws.onerror = function (e) {
          console.log("실패" + console.error(e.error));
        };

        ws.onmessage = function (e) {
          // console.log(e)
          const message = JSON.parse(e.data);
          // console.log(message)
          let val = "";
          if (message.userNo === "${loginUser.memNo}") {
            // console.log("같음")
            val +=
              "<div class='chat_item right'>" +
              "<div class='user_id'>" +
              message.userId +
              "</div>" +
              "<div class='message'>" +
              message.msg +
              "</div>" +
              "<div class='date'>" +
              message.date +
              "</div>" +
              "</div>";
          } else {
            // console.log("다름")
            val +=
              "<div class='chat_item'>" +
              "<div class='user_id'>" +
              message.userId +
              "</div>" +
              "<div class='message'>" +
              message.msg +
              "</div>" +
              "<div class='date'>" +
              message.date +
              "</div>" +
              "</div>";
          }

          $(".chat_session .chat_content_wrap .view_area").append(val);
        };

        $(".chat_session .chat_content_wrap #chat_message").on(
          "keyup",
          function (e) {
            // console.log(e.originalEvent.keyCode)
            if (e.originalEvent.keyCode === 13) {
              if (flag) {
                // console.log("엔터")
                $(".chat_session .chat_content_wrap #message_send").click();
              }
            }
          }
        );

        function storage() {
          let arr = JSON.parse(localStorage.getItem("watced_stock"));
          if (arr === null) {
            arr = [];
          }

          // console.log(arr.length)
          if (arr.length === 0) {
            // console.log(555)
            localStorage.setItem("watced_stock", JSON.stringify(arr));
          } else {
            let value = "";
            for (let i = arr.length - 1; i >= 0; i--) {
              // console.log(i)
              value +=
                "<div class='item'>" +
                "<div>" +
                arr[i].name +
                "(" +
                arr[i].no +
                ")</div>" +
                "<input type='hidden' value='" +
                arr[i].no +
                "'>" +
                "<input type='hidden' value='" +
                arr[i].name +
                "'>" +
                "</div>";
            }
            // console.log(value)
            $(".letay_session .view_content").html(value);
          }
        }

        $(".letay_session .view_content").on("click", ".item", function () {
          const code = $(this).children("input").eq(0).val();
          const codeName = $(this).children("input").eq(1).val();
          location.href = "detail.st?code=" + code + "&codeName=" + codeName;
        });

        $(".table_session .stock_search_area input[name=stockName]").on(
          "keydown",
          function (e) {
            // console.log(e.keyCode)
            if (e.keyCode === 13) {
              // console.log("엔터")
              $(
                ".table_session .stock_search_area button[type=submit]"
              ).click();
            }
          }
        );

        $(".table_session .stock_search_area button[type=submit]").on(
          "click",
          function () {
            let value = $(
              ".table_session .stock_search_area input[name=stockName]"
            ).val();
            console.log(value);
            if (value === "") {
              alert("검색어를 입력해주세요");
              $(
                ".table_session .stock_search_area input[name=stockName]"
              ).focus();
            } else {
              searchStock(value);
            }
          }
        );

        function searchStock(search) {
          $.ajax({
            url: "searchStock.st",
            data: {
              search: search,
            },
            success: function (data) {
              console.log(data);
              const list = data.response.body.items.item;
              console.log(list);

              let value = "";
              console.log(list.length);
              if (list.length === 0) {
                // console.log('0')
                value =
                  "<tr><td style='text-align: center;' colspan='3'>일치하는 검색어가 없습니다. 다시 입력해주세요</td></tr>";
              } else {
                // console.log('ddd')
                for (let i in list) {
                  value +=
                    "<tr>" +
                    "<td>" +
                    list[i].srtnCd +
                    "</td>" +
                    "<td>" +
                    list[i].itmsNm +
                    "</td>" +
                    "<td>" +
                    list[i].mrktCtg +
                    "</td>" +
                    "</tr>";
                }
              }

              $("#searchModal .container .table tbody").html(value);
              $(".table_session .stock_search_area input[name=stockName]").val(
                ""
              );
              $(".table_session .stock_search_area #searchModal_btn").click();
            },
            error: function () {
              console.log("55");
            },
          });
        }

        $("#searchModal .container .table tbody").on(
          "click",
          "tr",
          function () {
            const code = $(this).children("td").eq(0).text();
            if (code === "일치하는 검색어가 없습니다. 다시 입력해주세요") {
              $("#searchModal .close").click();
            } else {
              const arr = [...code];
              // console.log(arr)
              arr.shift();
              const codeNo = arr.join("");
              // console.log(codeNo)
              const codeName = $(this).children("td").eq(1).text();
              location.href =
                "detail.st?code=" + codeNo + "&codeName=" + codeName;
            }
          }
        );

        function send_message() {
          // console.log(55)
          let sendMsg = $(
            ".chat_session .chat_content_wrap #chat_message"
          ).val();
          if (sendMsg === "") {
            alert("보낼 메세지를 입력해주세요");
            $(".chat_session .chat_content_wrap #chat_message").focus();
          } else {
            let date = new Date();
            let message = {
              userNo: "${loginUser.memNo}",
              userId: "${loginUser.memId}",
              msg: sendMsg,
              date:
                date.getMonth() +
                1 +
                "/" +
                date.getDate() +
                " " +
                date.getHours() +
                ":" +
                date.getMinutes(),
            };
            ws.send(JSON.stringify(message));
            $(".chat_session .chat_content_wrap #chat_message").val("").focus();
          }
        }

        let pageNum = 1;

        $(".table_choose .choose").click(function () {
          $(".table_choose .choose").each(function () {
            $(this).removeClass("active");
          });

          $(this).addClass(" active");

          // let num = $(".table_choose .choose.active").children("input").val()
          // pageNum = 1
          // if (num == 1) {

          //     volumeRank(10)
          // } else if (num == 2) {
          //     fluctuation(0, 10)
          // } else if (num == 3) {
          //     fluctuation(1, 10)
          // } else if (num == 4) {
          //     market(10)
          // }
          $(".pageinfo_area .page").eq(0).click();
        });

        $(".pageinfo_area .page").on("click", function () {
          $(".pageinfo_area .page").removeClass("click");
          $(this).addClass(" click");
          const num = $(this).text();
          pageNum = num;
          pageinfo(num);
        });

        function pageinfo(num) {
          let choose = $(".table_choose .choose.active")
            .children("input")
            .val();

          if (pageNum == 1) {
            $(".pageinfo_area .prev").attr("disabled", true);
          } else if (pageNum == 3) {
            $(".pageinfo_area .next").attr("disabled", true);
          } else {
            $(".pageinfo_area .prev").attr("disabled", false);
            $(".pageinfo_area .next").attr("disabled", false);
          }
          $(".pageinfo_area .page").each(function (index, item) {
            if ($(item).text() === pageNum) {
              $(this).attr("disabled", true);
            } else {
              $(this).attr("disabled", false);
            }
          });

          if (choose == 1) {
            volumeRank(num * 10);
          } else if (choose == 2) {
            fluctuation(0, num * 10);
          } else if (choose == 3) {
            fluctuation(1, num * 10);
          } else if (choose == 4) {
            market(num * 10);
          }
        }

        $(".pageinfo_area .next").on("click", function () {
          let page = $(".pageinfo_area .page.click").text();
          let page1 = Number(page) + 1;

          $(".pageinfo_area .page").each(function (index, item) {
            if (Number($(item).text()) === page1) {
              $(item).click();
            }
          });
        });

        $(".pageinfo_area .prev").on("click", function () {
          let page = $(".pageinfo_area .page.click").text();
          let page1 = Number(page) - 1;

          $(".pageinfo_area .page").each(function (index, item) {
            if (Number($(item).text()) === page1) {
              $(item).click();
            }
          });
        });

        $(".table_session .table_area").on("click", "tbody>tr", function () {
          const stock_no = $(this).children("input").val();
          const arr = $(this).children("td").eq(0).text().split(" ");
          arr.shift();
          const stock_name = arr.join();
          // console.log(stock_name)
          location.href =
            "detail.st?code=" + stock_no + "&codeName=" + stock_name;
        });

        $(".choose_stock_session .table_area").on(
          "click",
          "tbody>tr",
          function () {
            const stock_no = $(this).children("input").val();
            const stock_name = $(this).children("td").eq(0).text();
            // console.log(stock_no)
            location.href =
              "detail.st?code=" + stock_no + "&codeName=" + stock_name;
          }
        );

        function volumeRank(page) {
          $.ajax({
            url: "volumeRank.st",
            success: function (data) {
              //console.log(data)
              const list = data.output;

              //console.log(list)
              //console.log(num)

              let begin = 0;

              if (page == 20) {
                begin = 10;
              } else if (page == 30) {
                begin = 20;
              }

              const header =
                "<tr>" +
                "<th>종목</th>" +
                "<th>현재가</th>" +
                "<th>전일 대비율</th>" +
                "<th>누적 거래 대금</th>" +
                "<th>거래량증가율</th>" +
                "</tr>";

              let value = "";
              //console.log(page)
              for (let i = begin; i < page; i++) {
                if (list[i].prdy_ctrt > 0) {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].mksc_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='red'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].acml_tr_pbmn.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "<td>" +
                    list[i].vol_inrt +
                    "%</td>" +
                    "</tr>";
                } else {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].mksc_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='blue'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].acml_tr_pbmn.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "<td>" +
                    list[i].vol_inrt +
                    "%</td>" +
                    "</tr>";
                }
              }
              ////console.log(value)
              $(".table_session.main_box .table_area>thead").html(header);

              $(".table_session.main_box .table_area>tbody").html(value);
            },
            error: function () {},
          });
        }

        function fluctuation(no, page) {
          $.ajax({
            url: "fluctuation.st",
            data: {
              no: no,
            },
            success: function (data) {
              ////console.log(data)
              const list = data.output;

              ////console.log(list)
              ////console.log(num)

              let begin = 0;

              if (page == 20) {
                begin = 10;
              } else if (page == 30) {
                begin = 20;
              }
              const header =
                "<tr>" +
                "<th>종목</th>" +
                "<th>현재가</th>" +
                "<th>전일 대비율</th>" +
                "<th>주식 최고가</th>" +
                "<th>주식 최저가</th>" +
                "</tr>";

              let value = "";
              ////console.log(page)

              for (let i = begin; i < page; i++) {
                if (list[i].prdy_ctrt > 0) {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].stck_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='red'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].stck_hgpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].stck_lwpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "</tr>";
                } else {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].stck_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='blue'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].stck_hgpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].stck_lwpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "</tr>";
                }
              }
              ////console.log(value)
              $(".table_session.main_box .table_area>thead").html(header);
              $(".table_session.main_box .table_area>tbody").html(value);
            },
            error: function () {},
          });
        }

        function market(page) {
          $.ajax({
            url: "market.st",
            success: function (data) {
              ////console.log(data)
              const list = data.output;

              ////console.log(list)
              ////console.log(num)

              let begin = 0;

              if (page == 20) {
                begin = 10;
              } else if (page == 30) {
                begin = 20;
              }

              const header =
                "<tr>" +
                "<th>종목</th>" +
                "<th>현재가</th>" +
                "<th>전일 대비율</th>" +
                "<th>조회 건수</th>" +
                "<th>누적 거래량</th>" +
                "</tr>";

              let value = "";
              ////console.log(page)

              for (let i = begin; i < page; i++) {
                if (list[i].prdy_ctrt > 0) {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].mksc_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='red'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].iqry_csnu.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "<td>" +
                    list[i].acml_vol.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "</tr>";
                } else {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value=" +
                    list[i].mksc_shrn_iscd +
                    ">" +
                    "<td>" +
                    list[i].data_rank +
                    " " +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='blue'>" +
                    list[i].prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    list[i].iqry_csnu.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "<td>" +
                    list[i].acml_vol.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "</tr>";
                }
              }
              ////console.log(value)
              $(".table_session.main_box .table_area>thead").html(header);
              $(".table_session.main_box .table_area>tbody").html(value);
            },
            error: function () {},
          });
        }

        function selectChooseList() {
          $.ajax({
            url: "selectChooseList.st",
            data: {
              userNo: "${loginUser.memNo}",
            },
            success: function (list) {
              // //console.log(list)
              let value = "";
              for (let i in list) {
                // //console.log(i)

                const item = JSON.parse(list[i]);

                // //console.log(item)
                if (item.prdy_ctrt.substr(0, 1) !== "-") {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value='" +
                    item.stock_no +
                    "'>" +
                    "<td>" +
                    item.hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    item.stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='red'>" +
                    item.prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    item.acml_vol.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "</tr>";
                } else {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value='" +
                    item.stock_no +
                    "'>" +
                    "<td>" +
                    item.hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    item.stck_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td class='blue'>" +
                    item.prdy_ctrt +
                    "%</td>" +
                    "<td>" +
                    item.acml_vol.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "건</td>" +
                    "</tr>";
                }
              }

              $(".choose_stock_session .table_area tbody").html(value);
            },
          });
        }

        $(".tag_session .container .table tbody").on(
          "click",
          "tr",
          function () {
            let value = $(this).children("input").val();
            let name = $(this).children("td").eq(0).text();
            // //console.log(name)
            $("#tag_modal .modal-header h4").text(name);

            //console.log(value)
            categoryStockList(value);
          }
        );

        function categoryStockList(category) {
          $.ajax({
            url: "categoryList.st",
            data: {
              category: category,
            },
            success: function (list) {
              //console.log(list)

              let value = "";
              for (let i in list) {
                value +=
                  "<div><span>" +
                  list[i].stockName +
                  "</span>(<span>" +
                  list[i].stockNo +
                  "</span>)</div>";
              }

              $("#tag_modal .modal-body").html(value);
              $(".tag_session .container #tag_modal_btn").click();
            },
          });
        }

        $("#tag_modal .modal-body").on("click", "div", function () {
          let code = $(this).children("span").eq(1).text();
          let codeName = $(this).children("span").eq(0).text();
          // //console.log(code)
          // //console.log(codeName)
          location.href = "detail.st?code=" + code + "&codeName=" + codeName;
        });

        function categoryList() {
          $.ajax({
            url: "category.st",
            success: function (data) {
              // //console.log(data)
              const list = data.output2;
              // //console.log(list)

              let value = "";

              for (let i in list) {
                let code = list[i].bstp_cls_code;
                if (code === "0005") {
                  //음식
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='919,923'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0006") {
                  //섬유 의복
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='931'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0018") {
                  //건설업
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='72,332,994'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0008") {
                  //화학
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='340,467,156,158'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0014") {
                  //의료정밀
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='35,912,555,49,104,77'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0009") {
                  //의약품
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='296,385'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0010") {
                  //비금속광물
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='940,146'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0011") {
                  //철강, 금속
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='343,44'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0012") {
                  //기계
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='71,97,489,920'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0013") {
                  //전기 전자
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='87,985,29,982,257,546,65,700,375,134'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0019") {
                  //운수 창고
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='72,50,995,142'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0020") {
                  //통신업
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='270,382,986'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0021") {
                  //금융
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='324'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0026") {
                  //서비스
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='42,999,57,786'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0027") {
                  //제조업
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='387,43,197,982,330,363,930'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0007") {
                  //종이
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='319'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0015") {
                  //운수, 장비
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='330'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0017") {
                  //전기 ,가스업
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='270,65,489'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                } else if (code === "0016") {
                  //유통
                  value +=
                    "<tr>" +
                    "<input type='hidden' value='73,319'>" +
                    "<td>" +
                    list[i].hts_kor_isnm +
                    "</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prpr.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_vrss.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    list[i].bstp_nmix_prdy_ctrt +
                    "%</td>" +
                    "</tr>";
                }
              }

              $(".tag_session .container .table tbody").html(value);
            },
            error: function () {
              //console.log("실패")
            },
          });
        }

        $("#addAccount form input[name=firstAccount]").on("input", function () {
          if (this.value.length > 8) {
            this.value = this.value.slice(0, 8);
          }
        });

        $("#addAccount form input[name=secondAccount]").on(
          "input",
          function () {
            if (this.value.length > 2) {
              this.value = this.value.slice(0, 2);
            }
          }
        );

        function accountsubmit() {
          let first = $("#addAccount form input[name=firstAccount]").val();
          let second = $("#addAccount form input[name=secondAccount]").val();

          if (first.length < 8) {
            alert("계좌 앞 8자리를 적지 않았습니다.");
            $("#addAccount form input[name=firstAccount]").focus();
            return false;
          }
          if (second.length < 2) {
            alert("계좌 뒤 2자리를 적지 않았습니다.");
            $("#addAccount form input[name=secondAccount]").focus();
            return false;
          }
        }

        function selectAccount() {
          $.ajax({
            url: "selectStockAccount.st",
            data: {
              userNo: "${loginUser.memNo}",
            },
            success: function (list) {
              // //console.log(list.length)
              let value = "";
              if (list.length === 0) {
                value = "등록된 계좌가 없습니다.";
              } else {
                for (let i in list) {
                  value +=
                    "<option value='" +
                    list[i].stockAccount +
                    "'>" +
                    list[i].stockAccount +
                    "</option>";
                }
              }
              $(
                ".buy_stock_session .account_area select[name=account_list]"
              ).html(value);
              selectBuyStock();
            },
            error: function () {
              //console.log("실패")
            },
          });
        }

        function selectbuyStockList(first, second) {
          $.ajax({
            url: "selectbuyStockList.st",
            data: {
              firstAccount: first,
              secondAccount: second,
            },
            success: function (data) {
              // //console.log(data)
              let value = "";

              if (data.rt_cd === "0") {
                const output1 = data.output1;

                // //console.log(output1)
                $(".buy_stock_session .flex h3").text(
                  data.output2[0].asst_icdc_amt.replace(
                    /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                    ","
                  ) + "원"
                );
                for (let i in output1) {
                  value +=
                    "<tr>" +
                    "<input type='hidden' name='stock_No' value='" +
                    output1[i].pdno +
                    "'>" +
                    "<td>" +
                    output1[i].prdt_name +
                    "</td>" +
                    "<td>" +
                    Number(output1[i].fltt_rt).toFixed(2) +
                    "%</td>" +
                    "<td>" +
                    output1[i].evlu_pfls_amt.replace(
                      /\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
                      ","
                    ) +
                    "원</td>" +
                    "<td>" +
                    output1[i].evlu_pfls_rt +
                    "%</td>" +
                    "</tr>";
                }
              } else {
                $(".buy_stock_session .flex h3").text("0원");
                value =
                  "<br><tr>" +
                  "<input type='hidden' name='stock_No' value=''>" +
                  "<td colspan='4' style='text-align: center;' ><h6>구매하신 이력이 없습니다.</h6></td>" +
                  "</tr>";
              }

              $(".buy_stock_session .table_area tbody").html(value);

              let i = 0;
              $(".buy_stock_session .table_area tbody td").each(
                (index, item) => {
                  if (index !== 4 * i) {
                    // //console.log(i * 4)
                    $(item).removeClass();
                    // //console.log($(item).text().substr(0, 1))
                    if ($(item).text().substr(0, 1) === "-") {
                      $(item).addClass("blue");
                    } else {
                      $(item).addClass("red");
                    }
                  } else {
                    i++;
                  }
                }
              );
            },
          });
        }

        $(".buy_stock_session .table_area tbody").on(
          "click",
          "tr",
          function () {
            const stock_no = $(this).children("input").val();
            const stock_name = $(this).children("td").eq(0).text();
            // //console.log(stock_name)

            if (stock_name !== "구매하신 이력이 없습니다.") {
              location.href =
                "detail.st?code=" + stock_no + "&codeName=" + stock_name;
            }
          }
        );

        function selectBuyStock() {
          const account = $(
            ".buy_stock_session .account_area select[name=account_list]"
          ).val();
          // //console.log(account)
          if (account === "등록된 계좌가 없습니다.") {
          } else {
            const accountArr = account.split("-");
            const first = accountArr[0];
            const second = accountArr[1];
            // //console.log(first)
            // //console.log(second)

            selectbuyStockList(first, second);
          }
        }

        $(".buy_stock_session .account_area select[name=account_list]").on(
          "change",
          function () {
            selectBuyStock();
          }
        );
      </script>

      <!--  
            <script>
                



                // 주식 모의인증키
                let a = key();


                // 주식 접근토큰
                const b = a.then((result) => {
                    ////console.log(result);
                    return token(result)
                })

                //실시간 웹소캣
                let c = a.then((result) => {
                    return websokect(result)
                })



                // 주식 모의인증키
                function key() {
                    //alert("1")
                    const one = new Promise((resolve, reject) => {

                        $.ajax({
                            url: "stockKey.st",
                            success: function (result) {
                                ////console.log(result)
                                resolve(result)
                            }
                        })
                    })
                    //console.log("d")
                    return one;

                }




                // 주식 접근토큰
                function token(result) {

                    var settings = {
                        "url": "https://openapivts.koreainvestment.com:29443/oauth2/tokenP",
                        "method": "POST",
                        "timeout": 0,
                        "headers": {
                            "content-type": "multipart/form-data"
                        },
                        "data": JSON.stringify({
                            "grant_type": "client_credentials",
                            "appkey": result.appkey,
                            "appsecret": result.appsecret,

                        }),
                    };


                    let c = $.ajax(settings).done(function (response) {
                        //console.log(response)
                        return response
                    });

                    return c
                }


                //실시간 웹소캣
                function websokect(result) {
                    var settings = {
                        "url": "https://openapivts.koreainvestment.com:29443/oauth2/Approval",
                        "method": "POST",
                        "timeout": 0,
                        "headers": {
                            "content-type": "multipart/form-data"
                        },
                        "data": JSON.stringify({
                            "grant_type": "client_credentials",
                            "appkey": result.appkey,
                            "secretkey": result.appsecret,
                        }),
                    };

                    return $.ajax(settings).done(function (response) {
                        return response
                    });
                }

                //실시간 시세
                function livequotes(result) {
                    var settings = {
                        "url": "ws://ops.koreainvestment.com:31000/tryitout/H0STCNT0",
                        "method": "POST",
                        "timeout": 0,
                        "headers": {
                            "approval_key": result.approval_key,
                            "custtype": "p",
                            "tr_type": "2",
                            "content-type": "utf-8",
                        },
                        "data": JSON.stringify({
                            "tr_id": "H0STCNT0",
                            "tr_key": "005930",
                        }),
                    };


                    $.ajax(settings).done(function (response) {
                        console.log(response)
                    })
                }













                // function aaaa() {
                //     c.then((result) => {
                //         livequotes(result)
                //     })
                // }












                $(function () {
                    //aaaa()

                    //console.log(b)

                    /*
                    b.then((result) => {
                        $.ajax({
                            url: "nowquotes.st",
                            type: "post",
                            data: {
                                authorization: result.access_token,
                            },
                            success: function (data) {
                                console.log(data)
                            },
                            error: function () { },
                        })
                    })
                    */

                $.ajax({
                    url: "volumeRank.st",
                    success: function (data) {
                        console.log(data)
                    },
                    error: function () { },
                })



                })





             


            </script>
-->
    </div>
  </body>
</html>
