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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="resources/stockCss/stockDetail.css">
        <script src="resources/stockJs/crypto-js.min.js"></script>
    </head>

    <body>



        <div class="wrapper">
            <jsp:include page="../common/header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../common/menubar.jsp" />
                <div class="main-content">
                    <div class="deteil_session main_box">
                        <div class="header ">
                            <div class="header_stock">
                                <div class="header_title">
                                    <div class="stock_name">${codeName}</div>
                                    <div class="stock_price">60,000원</div>

                                    <div class="chooseAndBuy">
                                        <div class="material-icons choose_stock">bookmark_border</div>
                                        <div class="material-icons" id="buy_stock" data-toggle="modal"
                                            data-target="#buyModal">shopping_cart</div>
                                    </div>
                                </div>
                                <div class="prev_price">어제보다 <span class="red">600원(16%)</span></div>
                            </div>




                            <div class="stock_search">
                                <form action="">
                                    <input type="search" name="stockName">
                                    <button type="submit" class="material-icons">
                                        search
                                    </button>
                                </form>
                            </div>
                        </div>

                        <br>
                        <div class="stock_items">



                            <div class="stock_item">
                                <div class="item_name">1일 최저</div>
                                <div class="item_price now_low"><span></span>원</div>
                            </div>

                            <div class="split"></div>
                            <div class="stock_item">
                                <div class="item_name">1일 최고</div>
                                <div class="item_price now_higt"><span></span>원</div>

                            </div>

                            <div class="split"></div>
                            <div class="stock_item">
                                <div class="item_name">1년 최저</div>
                                <div class="item_price stck_dryy_lwpr">51561원</div>
                            </div>

                            <div class="split"></div>

                            <div class="stock_item">
                                <div class="item_name">1년 최고</div>
                                <div class="item_price stck_dryy_hgpr">51561원</div>
                            </div>
                            <div class="split"></div>
                            <div class="stock_item">
                                <div class="item_name">전일 대비 거래량 등략율</div>
                                <div class="item_price prdy_vrss_vol_rate"><span>0</span>%</div>
                            </div>
                        </div>

                    </div>


                    <br>

                    <div class="content_session ">





                        <div class="body ">

                            <div class="chart_area main_box">
                                <div class="chart_title">
                                    <div>실시간 차트</div>
                                    <div>
                                        <button class="daliy day click">최근 30일</button>
                                        <button class="daliy month">최근 30월</button>
                                    </div>
                                </div>
                                <div class="chart day">
                                    <canvas id="day_chart"></canvas>
                                </div>
                                <div class="chart month hide">
                                    <canvas id="month_chart"></canvas>
                                </div>
                            </div>

                            <div class="stock_detail main_box">
                                <div>종목 정보</div>
                                <br><br>
                                <div class="deteil_item">
                                    <div class="item">
                                        <div class="name">주식 상한가</div>
                                        <div class="stck_mxpr">ㄹ</div>
                                        <div class="name">주식 하한가</div>
                                        <div class="stck_llam">ㄹ</div>
                                    </div>

                                    <div class="item">
                                        <div class="name">누적 거래 대금</div>
                                        <div class="acml_tr_pbmn">ㄹ</div>
                                        <div class="name">누적 거래량</div>
                                        <div class="acml_vol">ㄹ</div>
                                    </div>
                                    <div class="item">
                                        <div class="name">주식 시가</div>
                                        <div class="stck_oprc">ㄹ</div>
                                        <div class="name">전일 대비 거래량 비율</div>
                                        <div class="prdy_vrss_vol_rate">ㄹ</div>
                                    </div>

                                    <div class="item">
                                        <div class="name">주식 기준가</div>
                                        <div class="stck_sdpr">ㄹ</div>
                                        <div class="name">가중 평균 주식 가격</div>
                                        <div class="wghn_avrg_stck_prc">ㄹ</div>
                                    </div>
                                    <div class="item">
                                        <div class="name">자본금</div>
                                        <div class="cpfn">ㄹ</div>
                                        <div class="name">거래량 회전율</div>
                                        <div class="stck_fcam">ㄹ</div>
                                    </div>
                                    <div class="item">
                                        <div class="name">52주일 최고가</div>
                                        <div class="w52_hgpr">ㄹ</div>
                                        <div class="name">52주일 최저가</div>
                                        <div class="w52_lwpr">ㄹ</div>

                                    </div>
                                    <div class="item">
                                        <div class="name">결산 월</div>
                                        <div class="stac_month">ㄹ</div>
                                        <div class="name">외국인 보유 수량</div>
                                        <div class="frgn_hldn_qty">ㄹ</div>
                                    </div>

                                </div>
                            </div>




                        </div>



                        <div class="footer_session ">

                            <div class="news_area main_box">
                                <div class="title">관련 뉴스</div>
                                <br>
                                <div class="content_area">
                                    <a class="content" href="dd">
                                        <div class="news_title">
                                            <div>뉴스타이틀</div>
                                            <div></div>
                                        </div>
                                        <br>
                                        <div class="news_content">
                                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit corporis
                                            commodi ducimus autem facere quaerat dolorem quibusdam voluptatum
                                            reprehenderit quia, nemo minus iusto error distinctio. Expedita rerum quae
                                            facilis culpa.avavav a fsda sadf asdf sdf sadf sadf sdaf asdf asdf sadf saf
                                            wef sdf we asdf sadf asdf asdf asdf
                                        </div>
                                    </a>
                                    <a class="content" href="dd">
                                        <div class="news_title">뉴스 타이틀</div>
                                        <br>
                                        <div class="news_content">
                                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit corporis
                                            commodi ducimus autem facere quaerat dolorem quibusdam voluptatum
                                            reprehenderit quia, nemo minus iusto error distinctio. Expedita rerum quae
                                            facilis culpa.avavav a fsda sadf asdf sdf sadf sadf sdaf asdf asdf sadf saf
                                            wef sdf we asdf sadf asdf asdf asdf
                                        </div>
                                    </a>
                                    <a class="content" href="dd">
                                        <div class="news_title">뉴스 타이틀</div>
                                        <br>
                                        <div class="news_content">
                                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit corporis
                                            commodi ducimus autem facere quaerat dolorem quibusdam voluptatum
                                            reprehenderit quia, nemo minus iusto error distinctio. Expedita rerum quae
                                            facilis culpa.avavav a fsda sadf asdf sdf sadf sadf sdaf asdf asdf sadf saf
                                            wef sdf we asdf sadf asdf asdf asdf
                                        </div>
                                    </a>
                                    <a class="content" href="dd">
                                        <div class="news_title">뉴스 타이틀</div>
                                        <br>
                                        <div class="news_content">
                                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit corporis
                                            commodi ducimus autem facere quaerat dolorem quibusdam voluptatum
                                            reprehenderit quia, nemo minus iusto error distinctio. Expedita rerum quae
                                            facilis culpa.avavav a fsda sadf asdf sdf sadf sadf sdaf asdf asdf sadf saf
                                            wef sdf we asdf sadf asdf asdf asdf
                                        </div>
                                    </a>

                                </div>
                            </div>

                            <div class="chat_area main_box">
                                <div class="title">실시간 채팅</div>
                                <br>
                                <div class="content_area">
                                    <div class="chat_view">

                                    </div>
                                    <br>
                                    <div class="chat_input">
                                        <textarea name="" id=""></textarea>
                                        <div class="material-icons">send</div>
                                    </div>

                                </div>

                            </div>









                        </div>

                    </div>




                </div>
            </div>
        </div>






        <!-- The Modal -->
        <div class="modal" id="buyModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">구매하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div>
                            <div class="name">구매할 종목명</div>
                            <div class="result">${codeName}</div>
                        </div>

                        <div>
                            <div class="name">내계좌</div>
                            <div class="result">
                                <select name="myAccount_list" id="">
                                    <option>dd</option>
                                </select>
                            </div>
                        </div>

                        <div>
                            <div class="name">구매 금액</div>
                            <div class="result">
                                <input type="radio" name="checkPrice" id="currentPrice">
                                <label for="currentPrice">지정가</label>



                                <input type="radio" name="checkPrice" id="marketPrice">
                                <label for="marketPrice">시장가</label>
                            </div>
                        </div>

                        <div>
                            <div class="name">수량</div>
                            <div class="result"><input type="number" min="0" class="week" value="0">주</div>
                        </div>
                        <div>
                            <div class="name">예상 가격</div>
                            <input type="hidden" class="buy_price">
                            <input type="hidden" class="result_prcie">
                            <div class="result price"><span></span>원</div>
                        </div>
                        <br>
                        <button type="button" class="btn btn-success" data-dismiss="modal" align="center"
                            onclick="return buyStock()">구매</button>
                    </div>



                </div>
            </div>
        </div>




















        <script>
            $(function () {





                nowStock()
                naverNew()
                dailyPrice("D")
                dailyPrice("M")
                select_stock_choose()
                // investOpinion()

                websokect()






            })
            const ctx = document.getElementById('stock_chart');

            document.addEventListener("DOMContentLoaded", function () {

            })


            $(".chart_area .chart_title .daliy").on("click", function () {
                $(".chart_area .chart_title .daliy").removeClass("click")
                $(this).addClass(" click")
                if ($(this).hasClass('day')) {
                    $(".chart_area .chart").removeClass("hide")
                    $(".chart_area .chart.month").addClass(" hide")
                } else {
                    $(".chart_area .chart").removeClass("hide")
                    $(".chart_area .chart.day").addClass(" hide")
                }

            })



            //찜하기 db 연결 필요
            $(".main-content .deteil_session .header .header_title .chooseAndBuy .choose_stock").on("click", function () {
                stock_choose()

            })



            function buyStock() {
                const account = $("#buyModal .result select[name=myAccount_list]").val()
                // console.log(account)
                const accountArr = account.split("-")
                // console.log(accountArr)
                const firstAccount = accountArr[0]
                const secondAccount = accountArr[1]
                let division = "00"
                let orderPrice = $("#buyModal .result.price span").text()

                const orderCount = $("#buyModal .result .week").val()
                // console.log(orderCount)

                if (orderCount == 0) {
                    alert("최소 1주 구매하셔야 합니다.")
                    return false
                } else {
                    if ($("#buyModal .result input[name=checkPrice]:checked").attr("id") === "marketPrice") {
                        division = "01"
                        orderPrice = "0"
                    }
                    // console.log(division)
                    buyStock_ajax(firstAccount, secondAccount, division, orderCount, orderPrice)
                }

            }


            function buyStock_ajax(firstAccount, secondAccount, division, orderCount, orderPrice) {
                $.ajax({
                    url: "buyStoct.st",
                    data: {
                        code: "${code}",
                        division: division,
                        orderCount: orderCount,
                        orderPrice: orderPrice,
                        firstAccount: firstAccount,
                        secondAccount: secondAccount
                    },
                    success: function (data) {
                        // console.log(data)

                        let value = ""
                        if (data.rt_cd === "0") {
                            const output = data.output
                            const hh = output.ORD_TMD.substr(0, 2)
                            const mm = output.ORD_TMD.substr(2, 2)

                            value = "주문이 정상 처리되었습니다.\n"
                                + "영업점코드 : " + output.KRX_FWDG_ORD_ORGNO
                                + "\n주문번호 : " + output.ODNO
                                + "\n주문시간 : " + hh + "시 " + mm + "분"

                        } else {
                            value = "주문에 실패했습니다.\n오류 : " + data.msg1
                        }

                        alert(value)

                    },
                    error: function () { }
                })
            }



            function stock_choose() {
                $.ajax({
                    url: "chooseStock.st",
                    data: {
                        code: "${code}",
                        userNo: "${loginUser.memNo}"
                    },
                    success: function (result) {
                        // console.log(result)

                        if (result === "iyyy") {
                            alert("관심주식에 등록되었습니다.")
                        } else if (result === "innn") {
                            alert("관심주식에 등록 실패했습니다..")
                        } else if (result === "dyyy") {
                            alert("관심주식에 삭제되었습니다.")
                        } else if (result === "dnnn") {
                            alert("관심주식에 삭제 실패했습니다..")
                        }
                        select_stock_choose()
                    },
                    error: function () {
                        console.log("통신 실패")
                    },

                })
            }

            function select_stock_choose() {
                $.ajax({
                    url: "selectChoose.st",
                    data: {
                        code: "${code}",
                        userNo: "${loginUser.memNo}"
                    },
                    success: function (result) {
                        // console.log(result)

                        if (result === "0") {
                            $(".main-content .deteil_session .header .header_title .chooseAndBuy .choose_stock").text("bookmark_border")
                        } else {

                            $(".main-content .deteil_session .header .header_title .chooseAndBuy .choose_stock").text("bookmark")
                        }


                    },
                    error: function () {
                        console.log("통신 실패")
                    },

                })
            }

            let choosePrice = 0;;
            let chooseWeek = 0;

            $("#buyModal").on("shown.bs.modal", function () {
                // console.log(500000)
                selectAccount().then((list) => {
                    // console.log(list)

                    if (list.length === 0) {
                        if (confirm("등록된 한국투자 계좌가 없습니다. 등록하시겠습니까?")) {

                        } else {

                        }
                    } else {
                        let value = "";
                        for (let i in list) {
                            value += "<option value='" + list[i].stockAccount + "'>" + list[i].stockAccount + "</option>"
                        }
                        $("#buyModal .modal-content .modal-body>div .result select").html(value)
                    }
                    $('#buyModal .result #currentPrice').click()

                })


            })




            $('#buyModal .result input[type=radio]').on("change", function () {
                // console.log($(this).val())
                // console.log(choosePrice)

                choosePrice = $(this).val()
                // console.log(choosePrice)
                $("#buyModal .result.price span").text(choosePrice * chooseWeek)

            })

            $('#buyModal .result input[type=number]').on("change", function () {
                // console.log($(this).val())
                // console.log(choosePrice)

                chooseWeek = $(this).val()
                // console.log(chooseWeek)
                $("#buyModal .result.price span").text(choosePrice * chooseWeek)
            })






            function selectAccount() {
                return new Promise((reject, resolve) => {
                    $.ajax({
                        url: "selectStockAccount.st",
                        data: {
                            userNo: "${loginUser.memNo}"
                        },
                        success: function (list) {
                            // console.log(list.length)
                            reject(list)

                        },
                        error: function () {
                            console.log("실패")
                        }
                    })
                })
            }




            let chart = new Chart(day_chart, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: '최근 30일 종가',
                        data: [],
                        borderWidth: 1
                    },
                    {
                        label: '최근 30일 시가',
                        data: [],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            let chart_month = new Chart(month_chart, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: '최근 30월 종가',
                        data: [],
                        borderWidth: 1
                    },
                    {
                        label: '최근 30월 시가',
                        data: [],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });







            function dailyPrice(daliy) {
                $.ajax({
                    url: "dailyPrice.st",
                    data: {
                        code: "${code}",
                        daliy: daliy
                    },
                    success: function (data) {
                        // console.log(data.output.reverse())
                        const daliyArr = data.output.reverse();
                        // let daliyArr = []

                        // for (let i in list) {
                        //     daliyArr.push(list[i].stck_bsop_date)

                        // }
                        // console.log(daliyArr)

                        let label = "";
                        // chart.data.labels.push(daliyArr.stck_bsop_date);

                        if (daliy === "D") {

                            for (let i in daliyArr) {
                                let month = daliyArr[i].stck_bsop_date.substr(4, 2)
                                let day = daliyArr[i].stck_bsop_date.substr(6, 2)
                                // console.log(month.substr(0, 1))
                                // console.log(daliyArr[i].stck_bsop_date)
                                if (month.substr(0, 1) == 0) {
                                    // console.log('dd')
                                    month = month.substr(1, 1)
                                }

                                if (day.substr(0, 1) == 0) {
                                    // console.log('dd')
                                    day = day.substr(1, 1)
                                }
                                label = month + "월 " + day + "일"
                                // console.log(label)
                                chart.data.labels.push(label);
                                chart.data.datasets[0].data.push(daliyArr[i].stck_clpr);
                                chart.data.datasets[1].data.push(daliyArr[i].stck_oprc);

                            }
                            chart.update()

                        } else {
                            for (let i in daliyArr) {
                                let month = daliyArr[i].stck_bsop_date.substr(4, 2)
                                let year = daliyArr[i].stck_bsop_date.substr(0, 4)
                                // console.log(month.substr(0, 1))
                                // console.log(daliyArr[i].stck_bsop_date)
                                if (month.substr(0, 1) == 0) {
                                    // console.log('dd')
                                    month = month.substr(1, 1)
                                }


                                label = year + "년 " + month + "월 "
                                // console.log(label)
                                chart_month.data.labels.push(label);
                                chart_month.data.datasets[0].data.push(daliyArr[i].stck_clpr);
                                chart_month.data.datasets[1].data.push(daliyArr[i].stck_oprc);
                            }
                            chart_month.update()
                        }


                    }

                })


            }




            function naverNew() {
                $.ajax({
                    url: "naverNew.st",
                    data: {
                        codeName: "${codeName}"
                    },
                    success: function (data) {
                        // console.log(data.items)
                        const list = data.items
                        let value = ""
                        for (let i in list) {
                            let dateArr = list[i].pubDate.split(" ")
                            let date = dateArr[3] + "년 "
                            date += dateArr[2] + "  "
                            date += dateArr[1] + "일"
                            // console.log(dateArr)
                            value += "<a class='content' target='_blank' href='" + list[i].link + "'>"
                                + "<div class='news_title'>"
                                + "<div>" + list[i].title + "</div>"
                                + "<div>" + date + "</div>"
                                + "</div>"
                                + "<br>"
                                + "<div class='news_content'>" + list[i].description + "</div>"
                                + "</a>"
                        }

                        $(".footer_session .news_area .content_area").html(value)


                    }
                })
            }






            let sendMssage = {
                "header": {
                    "approval_key": "${approvalKey}",
                    "custtype": "P",
                    "tr_type": "1",
                    "content-type": "utf-8",
                },
                "body": {
                    "input": {
                        "tr_id": "H0STCNT0",
                        "tr_key": "${code}",
                    },
                }
            }




            var escapable = /[\x00-\x1f\ud800-\udfff\u200c\u2028-\u202f\u2060-\u206f\ufff0-\uffff]/g;
            function filterUnicode(quoted) {
                // console.log(escapable)
                escapable.lastIndex = 0;
                if (!escapable.test(quoted)) return quoted;

                return quoted.replace(escapable, function (a) {
                    return '';
                });
            }

            function log(s) {
                console.log(s);
                if (document.readyState !== "complete") {
                    console.log(log.buffer)
                    log3.buffer.push(s);
                } else {
                    console.log(s)
                }
            }
            log.buffer = [];


            function nowStock() {
                $.ajax({
                    url: "nowquotes.st",
                    data: {
                        code: "${code}"
                    },
                    success: function (data) {
                        // console.log(data.output)
                        const stock = data.output
                        // console.log(stock.rprs_mrkt_kor_name)
                        $(".header_stock .stock_price").text(stock.stck_prpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원")
                        $(".prev_price span").text(stock.prdy_vrss.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원(" + stock.prdy_ctrt + "%)")
                        $('#buyModal .result #currentPrice').val(stock.stck_prpr)
                        $('#buyModal .result #marketPrice').val(stock.stck_oprc)
                        if (stock.prdy_vrss < 0) {
                            // console.log("0보다 작다")
                            $(".prev_price span").removeClass()
                            $(".prev_price span").addClass("blue")

                        } else {
                            $(".prev_price span").removeClass()
                            $(".prev_price span").addClass("red")
                        }
                        $(".stock_items .item_price.prdy_vrss_vol_rate span").text(stock.prdy_vrss_vol_rate) //매수비율

                        const now_low = $(".stock_items .item_price.now_low span") // 금일 최저
                        const now_higt = $(".stock_items .item_price.now_higt span") // 금일 최고


                        if (stock.stck_prpr > now_higt.text()) {
                            now_higt.text(stock.stck_prpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))
                        }


                        if (now_low.text() == 0) {
                            now_low.text(stock.stck_prpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))
                        }

                        if (stock.stck_prpr < now_higt.text()) {
                            now_low.text(stock.stck_prpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))
                        }


                        $(".stock_items .item_price.stck_dryy_hgpr").text(stock.stck_dryy_hgpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //연중 최고가
                        $(".stock_items .item_price.stck_dryy_lwpr").text(stock.stck_dryy_lwpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //연중 최저가

                        $(".stock_detail .deteil_item .item .stck_mxpr").text(stock.stck_mxpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //상한가
                        $(".stock_detail .deteil_item .item .stck_llam").text(stock.stck_llam.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //하한가
                        $(".stock_detail .deteil_item .item .acml_tr_pbmn").text(stock.acml_tr_pbmn.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //누적거래대금
                        $(".stock_detail .deteil_item .item .acml_vol").text(stock.acml_vol.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "건") //누적거래량
                        $(".stock_detail .deteil_item .item .prdy_vrss_vol_rate").text(stock.prdy_vrss_vol_rate + "%") //전일대배 거래량 비율
                        $(".stock_detail .deteil_item .item .stck_oprc").text(stock.stck_oprc.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //시가
                        $(".stock_detail .deteil_item .item .stck_sdpr").text(stock.stck_sdpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //기준가
                        $(".stock_detail .deteil_item .item .wghn_avrg_stck_prc").text(stock.wghn_avrg_stck_prc.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //가중평균 주식 가격
                        $(".stock_detail .deteil_item .item .cpfn").text(stock.cpfn.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + stock.cpfn_cnnm) //자본금
                        $(".stock_detail .deteil_item .item .stck_fcam").text(stock.vol_tnrt + "%") //거래량 회전율
                        $(".stock_detail .deteil_item .item .w52_hgpr").text(stock.w52_hgpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //52주 최고가
                        $(".stock_detail .deteil_item .item .w52_lwpr").text(stock.w52_lwpr.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") ///52주 최저가
                        $(".stock_detail .deteil_item .item .stac_month").text(stock.stac_month + "월") //결산월
                        $(".stock_detail .deteil_item .item .frgn_hldn_qty").text(stock.frgn_hldn_qty.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "명") //외국인보유




                    }

                })
            }



            // function investOpinion() {
            //     $.ajax({
            //         url: "investOpinion.st",
            //         data: {
            //             code: "${code}",
            //         },
            //         success: function (data) {
            //             console.log(data)
            //         }
            //     })
            // }



            function websokect() {
                const ws = new WebSocket("ws://ops.koreainvestment.com:21000/tryitout/H0STCNT0");

                ws.onopen = function () {
                    ws.send(JSON.stringify(sendMssage))
                    ws.onmessage = function (event) {
                        //console.log(event)
                        // console.log(event.data)
                        let msg = filterUnicode(event.data)
                        // console.log(msg[1])

                        let msgArr = msg.split("|")
                        // console.log(msgArr[0])
                        if (msgArr[0] == 0 || msgArr[0] == 1) {
                            const stock = msgArr[3]
                            // console.log(stock)

                            const stockArr = stock.split("^")
                            // console.log(stockArr)


                            $(".prev_price span").text(stockArr[4].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원(" + stockArr[5] + "%)")

                            if (stockArr[4] < 0) {
                                // console.log("0보다 작다")
                                $(".prev_price span").removeClass()
                                $(".prev_price span").addClass("blue")

                            } else {
                                $(".prev_price span").removeClass()
                                $(".prev_price span").addClass("red")
                            }
                            $(".stock_items .item_price.prdy_vrss_vol_rate span").text(stockArr[22].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")) //매수비율
                            $(".stock_items .item_price.now_low span").text(stockArr[9].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")) // 금일 최저
                            $(".stock_items .item_price.now_higt span").text(stockArr[8].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")) // 금일 최고

                            $(".stock_detail .deteil_item .item .acml_tr_pbmn").text(stockArr[14].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //누적거래대금
                            $(".stock_detail .deteil_item .item .acml_vol").text(stockArr[13].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "건") //누적거래량
                            $(".stock_detail .deteil_item .item .stck_oprc").text(stockArr[7].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") //시가
                            $(".stock_detail .deteil_item .item .stck_fcam").text(stockArr[40] + "%") //거래량 회전율


                            const h = stockArr[1].substr(0, 2)
                            const m = stockArr[1].substr(3, 2)
                            const s = stockArr[1].substr(5, 2)

                            if ($(".header_stock .stock_price").text() !== stockArr[2].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원") {
                                // chart.data.datasets[0].data.push(stockArr[2]);
                                chart.data.datasets[0].data[chart.data.datasets[0].data.length - 1] = stockArr[2]
                                chart.data.datasets[1].data[chart.data.datasets[1].data.length - 1] = stockArr[7]


                                chart.update();

                            }

                            $(".header_stock .stock_price").text(stockArr[2].replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원")
                            $('#buyModal .result #currentPrice').val(stockArr[2])
                            $('#buyModal .result #marketPrice').val(stockArr[7])


                        } else {
                            const json = event.data;
                            // console.log(json)
                            let obj = JSON.parse(json);
                            // console.log(obj)
                            let trid = obj.header.tr_id
                            let encyn = obj.header.encyn
                            // console.log(trid)

                            if (trid === "PINGPONG") {
                                nowStock();
                            }






                        }
                    }
                }
            }











        </script>


    </body>

    </html>