<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Gourmet Traditional Restaurant</title>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slider.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script>
	$(window).load(function() {
		$('.slider')._TMS({
			show : 0,
			pauseOnHover : false,
			prevBu : '.prev',
			nextBu : '.next',
			playBu : false,
			duration : 800,
			preset : 'fade',
			pagination : true, //'.pagination',true,'<ul></ul>'
			pagNums : false,
			slideshow : 8000,
			numStatus : false,
			banners : false,
			waitBannerAnimation : false,
			progressBar : false
		})
	});
	$(window).load(function() {
		$('.carousel1').carouFredSel({
			auto : false,
			prev : '.prev',
			next : '.next',
			width : 960,
			items : {
				visible : {
					min : 1,
					max : 4
				},
				height : 'auto',
				width : 240,
			},
			responsive : false,
			scroll : 1,
			mousewheel : false,
			swipe : {
				onMouse : false,
				onTouch : false
			}
		});
	});
</script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>

<body>
	<div class="main">
		<header>
			<div class="container_12">
				<div class="grid_12">
					<h1>
						<a href="home.jsp"><img src="images/logo_lunchu1.png" alt=""></a>
					</h1>
					<div class="menu_block">
						<nav>
							<ul class="sf-menu">
								<li><a href="LogoutService">로그아웃</a></li>
								<li class="with_ul"><a href="#">마이페이지</a>
									<ul>
										<li><a href="profile.jsp"> 내 정보</a></li>
										<li><a href="reservation_list.jsp"> 내 예약</a></li>
										<li><a href="reviews.jsp"> 내 리뷰 </a></li>
										<li><a href="groups.jsp"> 내 그룹</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>

		<div class="content page1">
			<div class="container_12">
				<div class="grid_12">
					<div class="review">
						<h2>Evaluation</h2>
						<table class="review_list">
							<form action="">
								<thead>
									<tr>
										<td class="review_col"></td>
										<td class="review_col">번호</td>
										<td class="review_col">음식점명</td>
										<td class="review_col">평점</td>
										<td class="review_col">리뷰</td>
									</tr>
								</thead>
								<div class="scroll_box">
									<tbody>
										<tr class="review_detail">
											<td><input type="checkbox"></td>
											<td class="review_detail">1</td>
											<td><a href="#">신쭈꾸미</a></td>
											<td>4.5</td>
											<td>맛있음</td>
										</tr>

										<tr class="review_detail">
											<td><input type="checkbox"></td>
											<td class="review_detail">2</td>
											<td><a href="#">비바로마</a></td>
											<td>5</td>
											<td>분위기 좋음</td>
										</tr>

									</tbody>
								</div>
								<button class="review_delete">삭제</button>
							</form>
						</table>
					</div>
				</div>
				<div class="bottom_block">
					<div class="grid_6">
						<h3>Follow Us</h3>
						<div class="socials">
							<a href="#"></a> <a href="#"></a> <a href="#"></a>
						</div>
						<nav>
							<ul>
								<li class="current"><a href="index.html">Home</a></li>
								<li><a href="about-us.html">About Us</a></li>
								<li><a href="menu.html">Menu</a></li>
								<li><a href="portfolio.html">Portfolio</a></li>
								<li><a href="news.html">News</a></li>
								<li><a href="contacts.html">Contacts</a></li>
							</ul>
						</nav>
					</div>
					<div class="grid_6">
						<h3>Email Updates</h3>
						<p class="col1">
							Join our digital mailing list and get news<br> deals and be
							first to know about events
						</p>
						<form id="newsletter" action="#">
							<div class="success">Your subscribe request has been sent!</div>
							<label class="email"> <input type="email"
								value="Enter e-mail address"> <a href="#" class="btn"
								data-type="submit">subscribe</a> <span class="error">*This
									is not a valid email address.</span>
							</label>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container_12">
			<div class="grid_12">
				Gourmet Traditional Restaurant &copy; 2045 | <a href="#">Privacy
					Policy</a> | Design by: <a href="http://www.templatemonster.com/">TemplateMonster.com</a>
			</div>
		</div>
	</footer>
</body>

</html>