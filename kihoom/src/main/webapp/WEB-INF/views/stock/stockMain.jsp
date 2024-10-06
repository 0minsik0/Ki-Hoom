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
                        <h2 style="font-weight: 900;">차트</h2>
                        <br>
                        <div class="table_choose">
                            <div class="choose">거래량</div>
                            <div class="after"></div>
                            <div class="choose">급상승</div>
                            <div class="after"></div>
                            <div class="choose">급하락</div>
                            <div class="after"></div>
                            <div class="choose">배당률</div>
                        </div>
                        <br>
                        <table class="table_area">
                            <thead>

                                <tr>
                                    <input type="hidden" name="stock_No" value="">
                                    <th>종목</th>
                                    <th>현재가</th>
                                    <th>등락률</th>
                                    <th>거래대금</th>
                                    <th>거래량</th>
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
                            <button class="btn btn-outline-secondary">이전</button>
                            <button class="btn btn-outline-secondary">1</button>
                            <button class="btn btn-outline-secondary">다음</button>
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