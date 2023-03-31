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
    <link href="resources/css/test.css" rel="stylesheet">
    <link href="resources/css/upload.css" rel="Stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var login = "${session}";
		var msg = "로그인 후 사용 가능합니다.";
		if (!login) {
			location.href="serviceToSignup.do";
		}
		
	});
</script>
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
                <a href="manual.do" class="nav-item nav-link">Manual</a>
                <a href="upload.do" class="nav-item nav-link active">Service</a>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">AI IMAGE CLEANUP</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Service</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- 이미지 업로드 -->
    <div class="container">
        <div class="image-upload" id="image-upload">

            <form method="post" enctype="multipart/form-data">
                <div class="button">
                    <label for="chooseFile">
                        👉 CLICK HERE! 👈
                    </label>
                </div>
                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
            </form>

            <div class="fileContainer">
                <div class="fileInput">
                    <p>FILE NAME: </p>
                    <p id="fileName"></p>
                </div>
                <div class="buttonContainer">
                    <a href="uploadView.do">
                        <div class="submitButton" id="submitButton">SUBMIT</div>
                    </a>
                </div>
            </div>
        </div>

        <div class="image-show" id="image-show"></div>
    </div>

    <!-- <div class="container-xxl py-5">
        <div class="h-20 sm:h-52 px-4 w-full my-8 sm:my-0" style="max-width: 800px;">
            <label for="file-upload-0.3887999526414472"
                class="flex items-center w-full h-full group relative cursor-pointer rounded-md font-medium focus-within:outline-none">
                <div
                    class="w-full flex items-center justify-center px-6 py-8 sm:py-16 text- font-semibold border-4 border-dashed rounded-3xl border-black hover:bg-primary text-center bg-gray-100">
                    <input id="file-upload-0.3887999526414472" name="file-upload-0.3887999526414472" type="file"
                        class="sr-only" accept="image/png, image/jpeg">
                    <p class="hidden sm:block">Click here or drag an image file</p>
                    <p class="sm:hidden">Tap here to load your picture</p>
                </div>
            </label>
        </div>
    </div> -->
    <!-- 이미지 업로드 끝 -->



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
    <script src="resources/js/upload.js"></script>
</body>

</html>