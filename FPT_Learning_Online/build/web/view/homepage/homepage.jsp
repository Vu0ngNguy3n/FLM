<%-- 
Document   : homepage
Created on : Feb 1, 2023, 11:17:45 PM
Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../view/homepage/homepage.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="../view/toast/toast.css"/>
        <title>FLM Home Page</title>
    </head>
    <%@include file="../navigator/header.jsp" %>
    <body>

        <main class="mt-5" >
            <div class="container " style=" margin-top: 140px">
                <c:if test="${requestScope.login eq  true}">
                    <input type="hidden" id="login" value="${requestScope.login}">
                </c:if>
                <div id="success-toast" class="toast hide">
                    <div class="toast-header" style="background-color: #FDA769">
                        <strong class="mr-auto">FLM Notification</strong>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">
                            &times;
                        </button>
                    </div>
                    <div class="toast-body">
                        <i class="fa-regular fa-circle-check"></i>You have been login successfully!!
                    </div>
                </div>
                <section>
                    <div class="row" >
                        <div class="col-md-6 gx-5 mb-4">
                            <div class="bg-image hover-overlay ripple shadow-2-strong" data-mdb-ripple-color="light">
                                <img src="../view/homepage/fpt1.png" class="img-fluid" />
                                <a href="#!">
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                </a>
                            </div>
                        </div>

                        <div class="col-md-6 gx-5 mb-4">
                            <h4 style="color: orange; margin-bottom: 0"><strong>Tại sao 15000+<strong/></h4> <br/>
                            <h4>Sinh viên lựa chọn Đại Học FPT</h4>
                            <p class="text-muted">
                                Đại học FPT hướng tới việc đào tạo sinh viên 1 cách toàn diện. 
                                Không chỉ cung cấp cho sinh viên những kiến thức sát với thực tiễn mà Đại học FPT còn 
                                trang bị những kỹ năng mềm cần thiết cho sinh viên <br/>
                                Bên cạnh đó nhà trường đặc biệt chú trọng đến kỹ năng ngoại
                                ngữ đã giúp cho sinh viên của Đại học FPT ra trường có thể tự tin làm việc ở bất cứ đâu trên thế giới
                            </p>
                        </div>
                    </div>
                </section>
                <!--Section: Content-->

                <hr class="my-5" style="background-color: orange;"/>

                <!--Section: Content-->
                <section class="text-center">
                    <h4 style="color: orange;" class="mb-5"><strong>FLM Learning Material</strong></h4>

                    <div class="row">
                        <div class="col-lg-4 col-md-12 mb-4">
                            <div class="card">
                                <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                                    <img src="https://mdbootstrap.com/img/new/standard/nature/184.jpg" class="img-fluid" />
                                    <a href="#!">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Curriculum</h5>
                                    <p class="card-text">
                                        Khám phá thêm về chương trình giảng dạy đại học FPT 
                                    </p>
                                    <a href="<%=request.getContextPath() %>/FLM/curriculum" class="btn btn-primary">Search</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card">
                                <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                                    <img src="https://mdbootstrap.com/img/new/standard/nature/023.jpg" class="img-fluid" />
                                    <a href="#!">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Syllabus</h5>
                                    <p class="card-text">
                                        Bạn đang muốn biết thêm về giáo trình của từng môn học một cách rõ ràng?
                                    </p>
                                    <a href="<%=request.getContextPath() %>/FLM/syllabus" class="btn btn-primary">Search</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card">
                                <div class="bg-image hover-overlay ripple" data-mdb-ripple-color="light">
                                    <img src="https://mdbootstrap.com/img/new/standard/nature/111.jpg" class="img-fluid" />
                                    <a href="#!">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Subject </h5>
                                    <p class="card-text">
                                        Cùng tìm hiểu, nghiên cứu kĩ hơn về các môn học, combo có trong ĐH FPT
                                    </p>
                                    <a href="<%=request.getContextPath() %>/FLM/prerequisite" class="btn btn-primary">Search</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--Section: Content-->

                <hr class="my-5" />


            </div>
        </main>

        <div class="section-area section-sp2 bg-fix ovbl-dark join-bx" style="background-image:url(../view/homepage/fpt5.png);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center heading-bx text-white">
                        <h2 class="title-head m-b0">Why Choose <span>Us</span></h2>
                        <p class="m-b0 ">Đại Học FPT là ngôi trường chuyên đào tạo và cung cấp nguồn nhân lực chất lượng cao cho các công ty, tập đoàn lớn của Việt Nam và Thế Giới.</p>
                    </div>
                    <div class="col-md-6">	
                        <div class="why-chooses-bx ">
                            <div class="ttr-accordion m-b30 faq-bx" id="accordion1">
                                <div class="panel">
                                    <div class="acod-head">
                                        <h6 class="acod-title"> 
                                            <a data-toggle="collapse" href="#faq1" class="collapsed" data-parent="#faq1">
                                                Làm cách nào để tôi có thể được tư vấn tuyển sinh vào đại học FPT? </a> </h6>
                                    </div>
                                    <div id="faq1" class="acod-body collapse">
                                        <div class="acod-content">Hãy liên hệ với phòng tuyển sinh thông qua gmail hoặc sđt để được nhận tư vấn từ trường đại học FPT</div>
                                    </div>
                                </div>
                                <div class="panel">
                                    <div class="acod-head">
                                        <h6 class="acod-title"> 
                                            <a data-toggle="collapse" href="#faq2" class="collapsed" data-parent="#faq2">
                                                Điều kiện để nộp hồ sơ nhập học đại học FPT?</a> </h6>
                                    </div>
                                    <div id="faq2" class="acod-body collapse">
                                        <div class="acod-content"></div>
                                    </div>
                                </div>
                                <div class="panel">
                                    <div class="acod-head">
                                        <h6 class="acod-title"> 
                                            <a data-toggle="collapse"  href="#faq3" class="collapsed"  data-parent="#faq3">
                                                Khung chương trình có được công bố với mỗi sinh viên? </a> </h6>
                                    </div>
                                    <div id="faq3" class="acod-body collapse">
                                        <div class="acod-content"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">	
                        <div class="video-bx">
                            <img src="../view/homepage/review.png" alt=""/>
                            <a href="https://www.youtube.com/watch?v=g42VaFGZXsY" class="popup-youtube video"><i class="fa fa-play"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</div>
<script>
    function showToast() {
        const successToast = document.getElementById('success-toast');
        successToast.classList.remove('hide');
        successToast.classList.add('show');
        setTimeout(() => {
            successToast.classList.remove('show');
            successToast.classList.add('hide');
        }, 3000);
    }

    var status = document.getElementById('login').value;
    if (status !== null) {
        showToast();
        document.getElementById('login').value = false;
    }
</script>
</body>
<%@include file="../navigator/footer.jsp" %>


<script src="../view/assets/js/jquery.min.js"></script>
<script src="../view/assets/vendors/bootstrap/js/popper.min.js"></script>
<script src="../view/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="../view/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="../view/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="../view/view/assets/vendors/magnific-popup/magnific-popup.js"></script>
<script src="../view/assets/vendors/counter/waypoints-min.js"></script>
<script src="../view/assets/vendors/counter/counterup.min.js"></script>
<script src="../view/assets/vendors/imagesloaded/imagesloaded.js"></script>
<script src="../view/assets/vendors/masonry/masonry.js"></script>
<script src="../view/assets/vendors/masonry/filter.js"></script>
<script src="../view/assets/vendors/owl-carousel/owl.carousel.js"></script>
<script src="../view/assets/js/functions.js"></script>
<script src="../view/assets/js/contact.js"></script>
<script src='../view/assets/vendors/switcher/switcher.js'></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
