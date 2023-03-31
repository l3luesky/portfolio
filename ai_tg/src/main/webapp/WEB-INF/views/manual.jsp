<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>Welcome to ImgBOT</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="index.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">ImgBOT</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="index.do" class="nav-item nav-link">Home</a>
                <a href="manual.do" class="nav-item nav-link active">Manual</a>
                <a href="http://211.228.63.230:8501" class="nav-item nav-link">Service</a>
                <a href="pricing.do" class="nav-item nav-link">Pricing</a>
                <a href="contact.do" class="nav-item nav-link">Support</a>
                <c:if test="${!empty session}">
                	<div class="nav-item dropdown">
                    	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">MyPage</a>
                    	<div class="dropdown-menu fade-up m-0">
                        	<a href="memberEdit.do" class="dropdown-item">회원정보수정</a>
                        	<a href="contactList.do?mem_num="+${session.mem_num} class="dropdown-item">문의 내역</a>
                    	</div>
                	</div>
                </c:if>
            </div>
            <c:if test="${empty session}">
	            <a href="signup.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i
	                    class="fa fa-arrow-right ms-3"></i></a>
            </c:if>
            <c:if test="${!empty session}">
            	<a href="memberLogout.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
            </c:if>
        </div>
    </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">How to Use</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Manual</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Manual Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div style="text-align: center;">
                <h1 class="display-5 mb-5">사이트 이용 방법</h1>
            </div>
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <h1 class="display-1 txt mb-0">01</h1>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center justify-content-center bg-light"
                            style="width: 60px; height: 60px;">
                            <i class="fa fa-solid fa-upload fa-2x text-primary"></i>
                        </div>
                        <h5 class="mb-3">편집할 사진 업로드</h5>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
                    <h1 class="display-1 txt mb-0">02</h1>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center justify-content-center bg-light"
                            style="width: 60px; height: 60px;">
                            <i class="fa fa-solid fa-brush fa-2x text-primary"></i>
                        </div>
                        <h5 class="mb-3">삭제할 영역 브러싱</h5>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="display-1 txt mb-0">03</h1>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center justify-content-center bg-light"
                            style="width: 60px; height: 60px;">
                            <i class="fa fa-solid fa-eraser fa-2x text-primary"></i>
                        </div>
                        <h5 class="mb-3">영역 삭제 후 합성</h5>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h1 class="display-1 txt mb-0">04</h1>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <div class="d-flex align-items-center justify-content-center bg-light"
                            style="width: 60px; height: 60px;">
                            <i class="fa fa-download fa-2x text-primary"></i>
                        </div>
                        <h5 class="mb-3">비교 및 다운로드</h5>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Manual End -->


    <!-- Feature Start -->
    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container about px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="resources/img/feature-2.jpg"
                            style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 about-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <div>
                            <h2>여행 사진에서 관광객 제거</h2>
                        </div>
                        <p class="mb-4 pb-2">
                            관광객들이 앞뒤로 찍혀서 최고의 사진을 망치는 것에 좌절감을 느낄땐 ImgBOT을 이용해보세요 !</p>
                        <div class="row g-4 mb-4 pb-2">
                            <div class="col-sm-6 wow fadeIn" data-wow-delay="0.1s">
                                <div class="d-flex align-items-center">
                                </div>
                            </div>
                        </div>
                        <a href="upload.do" class="btn btn-primary py-3 px-5">시작하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container feature px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 feature-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                        <div>
                            <h2>워터마크 제거, 텍스트 제거</h1>
                        </div>
                        <p class="mb-4 pb-2">
                            워터마크를 제거하고 로고, 텍스트 또는 아이콘을 탭하거나 펜으로 지워 쉽게 지울 수 있습니다.
                        </p>
                        <div class="row g-4">
                        </div>
                        <a href="upload.do" class="btn btn-primary py-3 px-5">시작하기</a>
                    </div>
                </div>
                <div class="col-lg-6 pe-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="resources/img/feature-3.jpg"
                            style="object-fit: cover;" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="index.do">ImgBOT.com</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/wow/wow.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/counterup/counterup.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>

</html>