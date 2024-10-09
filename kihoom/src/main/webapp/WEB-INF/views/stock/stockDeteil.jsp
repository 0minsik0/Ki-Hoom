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
            <jsp:include page="../header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../menubar.jsp" />
                <div class="main-content">
                    <div class="deteil_session main_box">
                        <div class="header ">
                            <div class="header_stock">
                                <div class="header_title">
                                    <div class="stock_name">${codeName}</div>
                                    <div class="stock_price">60,000원</div>
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

                        </div>

                    </div>


                    <br>

                    <div class="content_session ">





                        <div class="body ">

                            <div class="chart_area main_box">
                                <div>실시간 차트</div>
                                <canvas id="stock_chart"></canvas>
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
                                        <div class="name">주식 최고가</div>
                                        <div class="stck_mxpr">ㄹ</div>
                                        <div class="name">주식 최저가</div>
                                        <div class="stck_mxpr">ㄹ</div>
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
                                        <div class="name">액면가</div>
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

        <script>
            $(function () {

                nowStock()



                //websokect()
            })
            const ctx = document.getElementById('stock_chart');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'Signal',
                        data: [],
                        borderWidth: 1
                    }]
                },
                options: {

                    scales: {
                        x: {
                            type: 'linear',
                            position: 'bottom'
                        }
                    }
                }
            });


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
                         console.log(data.output)
                        const stock = data.output
                        console.log(stock.rprs_mrkt_kor_name)
                        $(".header_stock .stock_price").text(stock.stck_prpr+"원")
                        $(".prev_price span").text(stock.prdy_vrss+"원("+stock.prdy_ctrt+"%)")
               
                        if(stock.prdy_vrss<0){
                            // console.log("0보다 작다")
                            $(".prev_price span").removeClass()
                            $(".prev_price span").addClass("blue")

                        }else{
                            $(".prev_price span").removeClass()
                            $(".prev_price span").addClass("red")
                        }
                        
                        const now_low= $(".stock_items .item_price.now_low span") // 금일 최저
                        const now_higt =$(".stock_items .item_price.now_higt span") // 금일 최고


                        if(stock.stck_prpr>now_higt.text()){
                            now_higt.text(stock.stck_prpr)
                        }


                        if(now_low.text()==0){
                            now_low.text(stock.stck_prpr)
                        }

                        if(stock.stck_prpr<now_higt.text()){
                            now_low.text(stock.stck_prpr)
                        }


                        $(".stock_items .item_price.stck_dryy_hgpr").text(stock.stck_dryy_hgpr  + "원") //연중 최고가
                        $(".stock_items .item_price.stck_dryy_lwpr").text(stock.stck_dryy_lwpr  + "원") //연중 최저가
                  
                        $(".stock_detail .deteil_item .item .stck_mxpr").text(stock.stck_mxpr  + "원") //상한가
                        $(".stock_detail .deteil_item .item .stck_llam").text(stock.stck_llam  + "원") //하한가
                        $(".stock_detail .deteil_item .item .acml_tr_pbmn").text(stock.acml_tr_pbmn  + "원") //누적거래대금
                        $(".stock_detail .deteil_item .item .acml_vol").text(stock.acml_vol  + "건") //누적거래량
                        $(".stock_detail .deteil_item .item .prdy_vrss_vol_rate").text(stock.prdy_vrss_vol_rate  + "%") //전일대배 거래량 비율
                        $(".stock_detail .deteil_item .item .stck_oprc").text(stock.stck_oprc  + "원") //시가
                        $(".stock_detail .deteil_item .item .stck_sdpr").text(stock.stck_sdpr  + "원") //기준가
                        $(".stock_detail .deteil_item .item .wghn_avrg_stck_prc").text(stock.wghn_avrg_stck_prc  + "원") //가중평균 주식 가격
                        $(".stock_detail .deteil_item .item .cpfn").text(stock.cpfn  + stock.cpfn_cnnm) //자본금
                        $(".stock_detail .deteil_item .item .stck_fcam").text(stock.stck_fcam  + stock.fcam_cnnm) //액면가
                        $(".stock_detail .deteil_item .item .w52_hgpr").text(stock.w52_hgpr  + "원") //52주 최고가
                        $(".stock_detail .deteil_item .item .w52_lwpr").text(stock.w52_lwpr  + "원") ///52주 최저가
                        $(".stock_detail .deteil_item .item .stac_month").text(stock.stac_month  + "월") //결산월
                        $(".stock_detail .deteil_item .item .frgn_hldn_qty").text(stock.frgn_hldn_qty  + "원") //외국인보유



                        
                    }

                })
            }




            // function websokect() {
            //     const ws = new WebSocket("ws://ops.koreainvestment.com:21000/tryitout/H0STCNT0");

            //     ws.onopen = function () {
            //         ws.send(JSON.stringify(sendMssage))
            //         ws.onmessage = function (event) {
            //             //console.log(event)
            //             console.log(event.data)
            //             let msg = filterUnicode(event.data)
            //             // console.log(msg[1])
            //             if (msg[0] === 0 || msg[0] === 1) {
            //                 //console.log('dd')
            //             } else {
            //                 const json = event.data;
            //                 // console.log(json)
            //                 let obj = JSON.parse(json);
            //                 let trid = obj.header.tr_id
            //                 let encyn = obj.header.encyn
            //                 // console.log(trid)

            //                 if (trid === "PINGPONG") {
            //                    // nowStock();
            //                 }






            //             }
            //         }
            //     }
            // }











        </script>


    </body>

    </html>