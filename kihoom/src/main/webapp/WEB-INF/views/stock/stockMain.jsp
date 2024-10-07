<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    </head>

    <body>
        <div class="wrapper">
            <jsp:include page="../header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../menubar.jsp" />
                <div class="main-content">

                    asdfasdf

                </div>
            </div>




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



        </div>
    </body>

    </html>