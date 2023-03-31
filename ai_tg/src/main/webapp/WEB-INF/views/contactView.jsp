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
<link href="resources/css/css.css" rel="stylesheet">
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
				<a href="index.do" class="nav-item nav-link">Home</a> <a
					href="manual.do" class="nav-item nav-link">Manual</a> <a
					href="upload.do" class="nav-item nav-link">Service</a> <a
					href="pricing.do" class="nav-item nav-link">Pricing</a> <a
					href="contact.do" class="nav-item nav-link">Support</a>
				<c:if test="${!empty session}">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle active"
							data-bs-toggle="dropdown">MyPage</a>
						<div class="dropdown-menu fade-up m-0">
							<a href="memberEdit.do" class="dropdown-item">회원정보수정</a> <a
								href="contactList.do?mem_num=${session.mem_num}"
								class="dropdown-item active">문의 내역</a>
						</div>
					</div>
				</c:if>
			</div>
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


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">문의내역</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
					<li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
					<li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->


	<div class="container-fluid bg-light p-0">
		<div class="contact">
			<div class="board_wrap">
				<div class="board_title">
					<strong>나의 문의 내역을 확인할 수 있습니다.</strong>
				</div>
				<div class="board_view_wrap">
					<div class="board_view">
						<div class="title">${con.con_title}</div>
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd>${con.con_num}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${con.con_date}</dd>
							</dl>
							<dl>
								<dt>답변여부</dt>
								<dd>${con.con_replyCheck}</dd>
							</dl>
						</div>
						<div class="cont">${con.con_content}</div>
					</div>
					<c:if test="${!empty reply}">
						<div class="board_view">
							<div class="title">${reply.re_content}</div>
							<div class="title">${reply.re_date}</div>
						</div>
					</c:if>
					<c:if test="">
					</c:if>
					<div class="bt_wrap">
						<a href="contactList.do?mem_num=${session.mem_num}" class="on">목록</a>
						<!-- <a href="edit.html">수정</a> -->
					</div>
				</div>
			</div>
		</div>
	</div>

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