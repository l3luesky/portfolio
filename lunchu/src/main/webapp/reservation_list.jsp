<%@page import="model.RestaurantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.ReservationDAO"%>
<%@page import="model.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>
<style>
td {
	text-align: center;
}
</style>
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
</script>
<%
MemberDTO info = (MemberDTO) session.getAttribute("info");
%>
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
								<%
								if (info != null) {
								%>
								<li><a href="LogoutService">로그아웃</a></li>
								<li class="with_ul"><a href="#">마이페이지</a>
									<ul>
										<li><a href="profile.jsp"> 내 정보</a></li>
										<li><a href="reservation_list.jsp"> 내 예약</a></li>
										<li><a href="review_list.jsp"> 내 리뷰 </a></li>
										<li><a href="groups.jsp"> 내 그룹</a></li>
									</ul></li>
								<%
								} else {
								%>
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="join.jsp">회원가입</a></li>
								<%
								}
								%>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
		<%
		ReservationDAO Rdao = new ReservationDAO();
		String id = info.getMemId();
		ArrayList<ReservationDTO> re_dto = Rdao.select(id);
		%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_12">
					<div class="reservation">
						<h2>예약내역</h2>
						<table class="reservation_list">
							<thead>
								<tr>
									<td class="reservation_col" colspan="2">번호</td>
									<td class="reservation_col">음식점명</td>
									<td class="reservation_col">방문일자</td>
								</tr>
							</thead>

							<tbody>
								<%
								ReservationDAO reservdao = new ReservationDAO();
								RestaurantDAO Restdao = new RestaurantDAO();

								for (int i = 0; i < re_dto.size(); i++) {
								%>
								<tr class="reservation_detail">
									<td colspan="2" class="reservation_detail"><%=i + 1%></td>
									<td><a href=""><%=Restdao.getName(re_dto.get(i).getRestSeq())%></a></td>
									<td><%=re_dto.get(i).getReservDate()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>

					<div class="grid_6"></div>
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