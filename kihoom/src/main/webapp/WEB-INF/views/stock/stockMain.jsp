<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="resources/stockCss/stockMain.css">
    </head>

    <body>
        <div class="wrapper">
            <jsp:include page="../header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../menubar.jsp" />
                <div class="main-content">

                    <div class="table_session main_box">
                        <div class="top_area">
                            <h2 style="font-weight: 900;">차트</h2>
                            <div class="stock_search_area">
                                <form action="">
                                    <input type="search" name="stockName">
                                    <button type="submit" class="material-icons">
                                        search
                                    </button>
                                </form>
                            </div>
                        </div>
                        <br>
                        <div class="table_choose">
                            <div class="choose active"><input type="hidden" value="1">거래량</div>
                            <div class="after"></div>
                            <div class="choose"><input type="hidden" value="2">급상승</div>
                            <div class="after"></div>
                            <div class="choose"><input type="hidden" value="3">급하락</div>
                            <div class="after"></div>
                            <div class="choose"><input type="hidden" value="4">배당률</div>
                        </div>
                        <br>
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
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>

                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래대금</td>
                                    <td>거래량</td>
                                </tr>
                            </tbody>
                        </table>
                        <br>

                        <div class="pageinfo_area">
                            <button class="btn btn-outline-secondary prev">이전</button>
                            <button class="btn btn-outline-secondary page">1</button>
                            <button class="btn btn-outline-secondary page">2</button>
                            <button class="btn btn-outline-secondary page">3</button>
                            <button class="btn btn-outline-secondary next">다음</button>
                        </div>


                    </div>



                    <div class="choose_stock_session main_box">
                        <h2 style="font-weight: 900;">관심 주식</h2>
                        <br>
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
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>현재가</td>
                                    <td>등락률</td>
                                    <td>거래량</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
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
                            <h2 style="font-weight: 900;">실현손익합</h2>
                            <h2 style="font-weight: 900;">-458,854</h2>

                        </div>
                        <br>
                        <table class="table_area">
                            <thead>
                                <tr>
                                    <th>종목명</th>
                                    <th>매매일자</th>
                                    <th>실현손익</th>
                                    <th>손익률</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <td>종목명</td>
                                    <td>매매일자</td>
                                    <td>실현손익</td>
                                    <td>손익률</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>




                    <div class="main_box tag_session">
                        <h2 style="font-weight: 900;">지금 뜨는 카테고리</h2>
                        <hr>
                        <div class="tag_area">
                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_one</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>

                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_two</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>


                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_3</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>


                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_4</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>


                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_5</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>

                            <div class="tag_item">
                                <div class="top_area">
                                    <div class="top_left">
                                        <div class="material-icons">looks_6</div>
                                        <div>전자제품</div>
                                    </div>
                                    <div class="total">5.2%</div>
                                </div>
                                <div class="bottom_area">

                                    <div class="item">
                                        <div class="title">1. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">2. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>
                                    <div class="item">
                                        <div class="title">3. 삼성</div>
                                        <div class="rate">5.3%</div>
                                    </div>

                                </div>
                            </div>

                        </div>



                    </div>






                </div><!--  메인 content 끝  -->
            </div>

            <script>
                $(function () {
                    $('.pageinfo_area .page').eq(0).click()
                })

                let pageNum = 1;

                $('.table_choose .choose').click(function () {
                    $('.table_choose .choose').each(function () {
                        $(this).removeClass("active")
                    })

                    $(this).addClass(" active")

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
                    $('.pageinfo_area .page').eq(0).click()



                })


                $('.pageinfo_area .page').on("click", function () {
                    $('.pageinfo_area .page').removeClass("click")
                    $(this).addClass(" click")
                    const num = $(this).text()
                    pageNum = num;
                    pageinfo(num)
                })

                function pageinfo(num) {
                    let choose = $(".table_choose .choose.active").children("input").val()

                    if (pageNum == 1) {
                        $('.pageinfo_area .prev').attr("disabled", true)
                    } else if (pageNum == 3) {
                        $('.pageinfo_area .next').attr("disabled", true)
                    } else {
                        $('.pageinfo_area .prev').attr("disabled", false)
                        $('.pageinfo_area .next').attr("disabled", false)

                    }
                    $('.pageinfo_area .page').each(function (index, item) {
                        if ($(item).text() === pageNum) {
                            $(this).attr("disabled", true)
                        } else {
                            $(this).attr("disabled", false)
                        }
                    })



                    if (choose == 1) {
                        volumeRank(num * 10)
                    } else if (choose == 2) {
                        fluctuation(0, num * 10)
                    } else if (choose == 3) {
                        fluctuation(1, num * 10)
                    } else if (choose == 4) {
                        market(num * 10)
                    }




                }



                $('.pageinfo_area .next').on("click", function () {
                    let page = $('.pageinfo_area .page.click').text()
                    let page1 = Number(page) + 1

                    $('.pageinfo_area .page').each(function (index, item) {
                        if (Number($(item).text()) === page1) {
                            $(item).click()
                        }

                    })



                })


                $('.pageinfo_area .prev').on("click", function () {
                    let page = $('.pageinfo_area .page.click').text()
                    let page1 = Number(page) - 1

                    $('.pageinfo_area .page').each(function (index, item) {
                        if (Number($(item).text()) === page1) {
                            $(item).click()
                        }

                    })



                })





                $(".table_session .table_area").on("click", "tbody>tr", function () {
                    const stock_no = $(this).children('input').val();
                    const arr = $(this).children("td").eq(0).text().split(" ");
                    arr.shift()
                    const stock_name = arr.join();
                    // console.log(stock_name)
                    location.href = "detail.st?code=" + stock_no + "&codeName=" + stock_name
                })











                function volumeRank(page) {
                    $.ajax({
                        url: "volumeRank.st",
                        success: function (data) {
                            //console.log(data)
                            const list = data.output

                            //console.log(list)
                            //console.log(num)

                            let begin = 0;

                            if (page == 20) {
                                begin = 10
                            } else if (page == 30) {
                                begin = 20

                            }


                            const header = "<tr>"
                                + "<th>종목</th>"
                                + "<th>현재가</th>"
                                + "<th>전일 대비율</th>"
                                + "<th>누적 거래 대금</th>"
                                + "<th>거래량증가율</th>"
                                + "</tr>"


                            let value = "";
                            //console.log(page)
                            for (let i = begin; i < page; i++) {
                                if (list[i].prdy_ctrt > 0) {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].mksc_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='red'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].acml_tr_pbmn.toLocaleString() + "</td>"
                                        + "<td>" + list[i].vol_inrt + "</td>"
                                        + "</tr>"
                                } else {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].mksc_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='blue'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].acml_tr_pbmn.toLocaleString() + "</td>"
                                        + "<td>" + list[i].vol_inrt + "</td>"
                                        + "</tr>"
                                }

                            }
                            //console.log(value)
                            $('.table_session.main_box .table_area>thead').html(header)

                            $('.table_session.main_box .table_area>tbody').html(value)



                        },
                        error: function () {

                        }
                    })
                }




                function fluctuation(no, page) {
                    $.ajax({
                        url: "fluctuation.st",
                        data: {
                            no: no
                        },
                        success: function (data) {
                            //console.log(data)
                            const list = data.output

                            //console.log(list)
                            //console.log(num)

                            let begin = 0;

                            if (page == 20) {
                                begin = 10
                            } else if (page == 30) {
                                begin = 20

                            }
                            const header = "<tr>"
                                + "<th>종목</th>"
                                + "<th>현재가</th>"
                                + "<th>전일 대비율</th>"
                                + "<th>주식 최고가</th>"
                                + "<th>주식 최저가</th>"
                                + "</tr>"

                            let value = "";
                            //console.log(page)

                            for (let i = begin; i < page; i++) {
                                if (list[i].prdy_ctrt > 0) {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].stck_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='red'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].stck_hgpr + "</td>"
                                        + "<td>" + list[i].stck_lwpr + "</td>"
                                        + "</tr>"
                                } else {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].stck_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='blue'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].stck_hgpr + "</td>"
                                        + "<td>" + list[i].stck_lwpr + "</td>"
                                        + "</tr>"
                                }

                            }
                            //console.log(value)
                            $('.table_session.main_box .table_area>thead').html(header)
                            $('.table_session.main_box .table_area>tbody').html(value)



                        },
                        error: function () {

                        }
                    })
                }



                function market(page) {
                    $.ajax({
                        url: "market.st",
                        success: function (data) {
                            //console.log(data)
                            const list = data.output

                            //console.log(list)
                            //console.log(num)

                            let begin = 0;

                            if (page == 20) {
                                begin = 10
                            } else if (page == 30) {
                                begin = 20

                            }


                            const header = "<tr>"
                                + "<th>종목</th>"
                                + "<th>현재가</th>"
                                + "<th>전일 대비율</th>"
                                + "<th>조회 건수</th>"
                                + "<th>누적 거래량</th>"
                                + "</tr>"

                            let value = "";
                            //console.log(page)

                            for (let i = begin; i < page; i++) {
                                if (list[i].prdy_ctrt > 0) {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].mksc_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='red'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].iqry_csnu + "</td>"
                                        + "<td>" + list[i].acml_vol + "</td>"
                                        + "</tr>"
                                } else {
                                    value += "<tr>"
                                        + "<input type='hidden' name='stock_No' value=" + list[i].mksc_shrn_iscd + ">"
                                        + "<td>" + list[i].data_rank + " " + list[i].hts_kor_isnm + "</td>"
                                        + "<td>" + list[i].stck_prpr + "</td>"
                                        + "<td class='blue'>" + list[i].prdy_ctrt + "</td>"
                                        + "<td>" + list[i].iqry_csnu + "</td>"
                                        + "<td>" + list[i].acml_vol + "</td>"
                                        + "</tr>"
                                }

                            }
                            //console.log(value)
                            $('.table_session.main_box .table_area>thead').html(header)
                            $('.table_session.main_box .table_area>tbody').html(value)



                        },
                        error: function () {

                        }
                    })
                }


















            </script>







            <!--  
            <script>
                



                // 주식 모의인증키
                let a = key();


                // 주식 접근토큰
                const b = a.then((result) => {
                    //console.log(result);
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
                                //console.log(result)
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