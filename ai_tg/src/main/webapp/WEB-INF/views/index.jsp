<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
	var message = "${message}";
	if (message) {
		alert(message);
	}
	var memberInsert = "${memberInsert}";
	if (memberInsert) {
		alert(memberInsert);
	}
	var insertQ = "${insertQ}";
	if (insertQ) {
		alert(insertQ);
	}
	
	function checkSession(mem_num) {
		var mem_num = mem_num;
		console.log(mem_num);
		if (mem_num != null) {
			location.href="http://115.23.24.192:8501";
		}else {
			alert("로그인 후 사용이 가능합니다.");
			location.href="signup.do";
		}
	}
</script>


<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->


	<!-- Topbar Start -->
	<div class="container-fluid bg-light p-0">
		<div class="row gx-0 d-none d-lg-flex">
			<div class="col-lg-7 px-5 text-start"></div>
			<div class="col-lg-5 px-5 text-end"></div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="index.do"
			class="navbar-brand d-flex align-items-center px-4 px-lg-5">
			<h2 class="m-0 text-primary">ImgBOT</h2>
		</a>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<a href="index.do" class="nav-item nav-link active">Home</a> <a
					href="manual.do" class="nav-item nav-link">Manual</a> <a
					href="http://115.23.24.192:8501" class="nav-item nav-link">Service</a>
				<a href="pricing.do" class="nav-item nav-link">Pricing</a> <a
					href="contact.do" class="nav-item nav-link">Support</a>
				<c:if test="${!empty session}">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">MyPage</a>
						<div class="dropdown-menu fade-up m-0">
							<a href="memberEdit.do" class="dropdown-item">회원정보수정</a> <a
								href="contactList.do?mem_num=${session.mem_num}"
								class="dropdown-item">문의 내역</a>
						</div>
					</div>
				</c:if>
			</div>

			<!-- 세션값을 이용하여 로그인시 로그아웃 버튼이 나타나게 -->
			<c:if test="${empty session}">
				<a href="signup.do"
					class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i
					class="fa fa-arrow-right ms-3"></i></a>
			</c:if>
			<c:if test="${!empty session}">
				<a href="memberLogout.do"
					class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그아웃<i
					class="fa fa-arrow-right ms-3"></i></a>
			</c:if>
		</div>
	</nav>
	<!-- Navbar End -->


	<!-- Carousel Start -->
	<div class="container-fluid p-0 pb-5">
		<div class="owl-carousel header-carousel position-relative">
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="resources/img/carousel-1.jpg" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To IMGBOT</h5>
								<h1 class="display-3 text-white animated slideInDown mb-4">AI
									IMAGE CLEANUP</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">워터 마크 제거, 사진
									글씨 지우기, 사진 속 인물 지우기</p>
								<button type="button" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft" onclick="checkSession(${session.mem_num})">시작하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="resources/img/carousel-2.jpg" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To IMGBOT</h5>
								<h1 class="display-3 text-white animated slideInDown mb-4">간단한
									사진 편집 사이트</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">AI를 활용하여 나만의
									사진을 편집해보세요 !</p>
								<button type="button" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft" onclick="checkSession(${session.mem_num})">시작하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-carousel-item position-relative">
				<img class="img-fluid" src="resources/img/carousel-3.jpg" alt="">
				<div
					class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
					style="background: rgba(53, 53, 53, .7);">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 col-lg-8 text-center">
								<h5 class="text-white text-uppercase mb-3 animated slideInDown">Welcome
									To IMGBOT</h5>
								<h1 class="display-3 text-white animated slideInDown mb-4">간단한
									사진 편집 사이트</h1>
								<p class="fs-5 fw-medium text-white mb-4 pb-2">AI를 활용하여 나만의
									사진을 편집해보세요 !</p>
								<button type="button" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft" onclick="checkSession(${session.mem_num})">시작하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- About Start -->
	<div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
		<div class="container about px-lg-0">
			<div class="row g-0 mx-lg-0">
				<div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
					<div class="position-relative h-100">
						<img class="position-absolute img-fluid w-100 h-100"
							src="resources/img/about.png" style="object-fit: none;" alt="">
					</div>
				</div>
				<div class="col-lg-6 about-text py-5 wow fadeIn"
					data-wow-delay="0.5s">
					<div class="p-lg-5 pe-lg-0">
						<div>
							<h1 class="display-5 mb-4">ImgBOT</h1>
						</div>
						<h5 class="mb-4 pb-2">CRA 인공지능 인페이팅 기술을 사용한 간편한 사진 편집 웹 사이트
							입니다.</h5>
						<div class="row g-4 mb-4 pb-2">
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.3s">
								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-check fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h5 class="mb-3">인물 제거</h5>
									</div>
								</div>
							</div>
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.5s">
								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-check fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h5 class="mb-3">물체 제거</h5>
									</div>
								</div>
							</div>
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.5s">
								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-check fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h5 class="mb-3">텍스트 제거</h5>
									</div>
								</div>
							</div>
							<div class="col-sm-6 wow fadeIn" data-wow-delay="0.5s">
								<div class="d-flex align-items-center">
									<div
										class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white"
										style="width: 60px; height: 60px;">
										<i class="fa fa-check fa-2x text-primary"></i>
									</div>
									<div class="ms-3">
										<h5 class="mb-3">워터마크 제거</h5>
									</div>
								</div>
							</div>
						</div>
						<a href="manual.do" class="btn btn-primary py-3 px-5">사용방법</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Intro Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center">
				<h1 class="display-5 mb-5">서비스 소개</h1>
			</div>
			<div class="row g-4">
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid" src="resources/img/service-1.png" alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">이미지 객체 제거</h4>
							<p>인공지능 알고리즘을 사용하여 이미지내의 객체 제거</p>
							<a class="fw-medium" href="upload.do">시작하기<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid" src="resources/img/service-2.png" alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">컬러이미지 흑백화</h4>
							<p>인공지능 알고리즘을 사용하여 컬러 이미지를 그레이스케일 이미지로 변환</p>
							<a class="fw-medium" href="upload.do">시작하기<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item">
						<div class="overflow-hidden">
							<img class="img-fluid" src="resources/img/service-3.png" alt="">
						</div>
						<div
							class="p-4 text-center border border-5 border-light border-top-0">
							<h4 class="mb-3">이미지를 흐릿하게</h4>
							<p>인공지능 알고리즘을 사용하여 이미지를 흐릿하게 변환</p>
							<a class="fw-medium" href="upload.do">시작하기<i
								class="fa fa-arrow-right ms-2"></i></a>
						</div>
					</div>
				</div>
				<!-- <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="resources/img/service-4.jpg" alt="">
                        </div>
                        <div class="p-4 text-center border border-5 border-light border-top-0">
                            <h4 class="mb-3">Wooden Floor</h4>
                            <p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</p>
                            <a class="fw-medium" href="">Read More<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="resources/img/service-5.jpg" alt="">
                        </div>
                        <div class="p-4 text-center border border-5 border-light border-top-0">
                            <h4 class="mb-3">Wooden Furniture</h4>
                            <p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</p>
                            <a class="fw-medium" href="">Read More<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="resources/img/service-6.jpg" alt="">
                        </div>
                        <div class="p-4 text-center border border-5 border-light border-top-0">
                            <h4 class="mb-3">Custom Work</h4>
                            <p>Stet stet justo dolor sed duo. Ut clita sea sit ipsum diam lorem diam.</p>
                            <a class="fw-medium" href="">Read More<i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                    </div>
                </div> -->
			</div>
		</div>
	</div>
	<!-- Intro End -->


	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="index.do">ImgBOT.com</a>,
						All Right Reserved.
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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