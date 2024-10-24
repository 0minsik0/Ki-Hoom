<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

        <link rel="stylesheet" href="resources/certificate/certificateMain.css">

    </head>

    <body>
        <div class="wrapper">
            <jsp:include page="../common/header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../common/menubar.jsp" />
                <div class="main-content">

                    <div class="main_box table_area">
                        <div class="container">
                            <h2>보조금 24 리스트</h2>
                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>서비스명</th>
                                        <th>서비스 목적 요약</th>
                                        <th>지원내용</th>
                                        <th>신청기한</th>
                                        <th>링크</th>
                                        <th>부서명</th>
                                        <th>조회수</th>
                                        <th>전화문의</th>

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
                        <br>

                        <div class="btn_area" align="center">
                            <button class="btn btn-outline-secondary prev">이전</button>
                            <button class="btn btn-outline-secondary next">다음</button>
                        </div>

                    </div>




                    <div class="main_box pdf_area" style="display: none;">
                        <div id="content"
                            style="padding: 20px; border: 1px solid #000; box-sizing: border-box; width: 90%;"
                            align="center">
                            <h1 style="text-align: center;">KiHoom</h1>
                            <br>
                            <h3 style="text-align: center;">보조금 24</h3>
                            <br>
                            <table border="1" align="center" style="width: 95%;">
                                <tr>
                                    <th>서비스명</th>
                                    <td class="serviceName">fsdf</td>
                                    <th>법령</th>
                                    <td class="service1">ddd</td>

                                </tr>
                                <tr>
                                    <th>신청기한</th>
                                    <td class="service3">ddd</td>
                                    <th>문의처</th>
                                    <td class="service4">ddd</td>

                                </tr>
                                <tr>
                                    <th>선정기준</th>
                                    <td colspan="3" class="service5">

                                    </td>
                                </tr>



                                <tr>
                                    <th>구비서류</th>
                                    <td class="service6" colspan="3">ddd</td>
                                </tr>
                                <tr>
                                    <th>신청방법</th>
                                    <td class="service7" colspan="3">ddd</td>
                                </tr>

                                <tr>
                                    <th>지원대상</th>
                                    <td class="service8" colspan="3">ddd</td>
                                </tr>

                            </table>
                        </div>
                        <button id="generate-pdf">Generate PDF</button>





                    </div>


                </div>
            </div>
        </div>



        <script>
            $(function () {
                subsidyList(page)
            })
            let page = 1


            $(".table_area .btn_area .prev").on("click", function () {
                if (page === 1) {
                    $(".table_area .btn_area .prev").attr("disabled", true)

                } else {
                    page = page - 1

                }
                // console.log(page)
                subsidyList(page)
            })

            $(".table_area .btn_area .next").on("click", function () {
                page = page + 1
                if (page !== 1) {
                    $(".table_area .btn_area .prev").attr("disabled", false)

                }
                // console.log(page)
                subsidyList(page)
            })

            if (page === 1) {
                $(".table_area .btn_area .prev").attr("disabled", true)
            }


            function subsidyList(pagenum) {
                $.ajax({
                    url: "subsidyList.ce",
                    data: {
                        page: pagenum
                    },
                    success: function (data) {
                        // console.log(data)
                        const list = data.data

                        let val = ""
                        for (let i in list) {
                            val += "<tr>"
                                + "<input type='hidden' value='" + list[i].서비스ID + "'>"
                                + "<td class='anot'>" + list[i].서비스명 + "</td>"
                                + "<td class='anot'>" + list[i].서비스목적요약 + "</td>"
                                + "<td class='anot'>" + list[i].지원내용 + "</td>"
                                + "<td class='anot'>" + list[i].신청기한 + "</td>"
                                + "<td><a href='" + list[i].상세조회URL + "' target='_blank' onClick='(aClick(event))'>URL    </a>" + "</td>"
                                + "<td class='anot'>" + list[i].부서명 + "</td>"
                                + "<td class='anot'>" + list[i].조회수 + "</td>"
                                + "<td class='anot'>" + list[i].전화문의 + "</td>"
                                + "</tr>"
                        }

                        $(".table_area .container .table tbody").html(val)
                    }
                })
            }


            $(".table_area .container .table tbody").on("click", "tr", function () {
                let Id = $(this).children("input").val()
                // console.log(Id)
                if (confirm("해당 상세 내용을 PDF로 다운하시겠습니까?")) {

                    subsidyDetail(Id)
                }
            })


            function aClick(event) {
                event.stopPropagation()
                console.log('dd')
            }


            function subsidyDetail(id) {
                $.ajax({
                    url: "subsidyDetail.ce",
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        // console.log(data)
                        const list = data.data

                        $(".pdf_area table tr .serviceName").text(list[0].서비스명)
                        $(".pdf_area table tr .service1").text(list[0].법령)
                        $(".pdf_area table tr .service2").text(list[0].수정일시)
                        $(".pdf_area table tr .service3").text(list[0].신청기한)
                        $(".pdf_area table tr .service4").text(list[0].문의처)
                        $(".pdf_area table tr .service5").text(list[0].선정기준)
                        $(".pdf_area table tr .service6").text(list[0].구비서류)
                        $(".pdf_area table tr .service7").text(list[0].신청방법)
                        $(".pdf_area table tr .service8").text(list[0].지원대상)

                        $("#generate-pdf").click()
                    }
                })
            }

        </script>



        <script>
            document.getElementById('generate-pdf').addEventListener('click', () => {
                const element = document.getElementById('content');
                if (!element) {
                    console.error('Content element not found!');
                    return;
                }

                const options = {
                    margin: 1,
                    filename: '보조금24.pdf',
                    html2canvas: { scale: 2 },
                    jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
                };

                // Generate the PDF
                html2pdf()
                    .from(element)
                    .set(options)
                    .save()
                    .catch(err => {
                        console.error('Error generating PDF:', err);
                    });
            });
        </script>
    </body>

    </html>