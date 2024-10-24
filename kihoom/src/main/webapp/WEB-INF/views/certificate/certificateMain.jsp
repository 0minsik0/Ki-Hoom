<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

        <link rel="stylesheet" href="resources/certificate/certificateMain.css">

    </head>

    <body>
        <div class="wrapper">
            <jsp:include page="../common/header.jsp" />
            <div class="page-wrap">
                <jsp:include page="../common/menubar.jsp" />
                <div class="main-content">

                    <div class="main_box">
                        <div id="content" style="padding: 20px; border: 1px solid #000;">
                            <h1>KiHoom 증명서</h1>
                            <h3>주민등록등본</h3>
                            <p>You can style this content using CSS.</p>
                        </div>
                        <button id="generate-pdf">Generate PDF</button>





                    </div>


                </div>
            </div>
        </div>






        <script>
            document.getElementById('generate-pdf').addEventListener('click', () => {
                const element = document.getElementById('content');
                if (!element) {
                    console.error('Content element not found!');
                    return;
                }

                const options = {
                    margin: 1,
                    filename: 'sample.pdf',
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