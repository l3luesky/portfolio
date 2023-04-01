<%@page import="model.SelectRestListTestDAO"%>
<%@page import="model.MenuListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MenuListDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/slider.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script src="js/youtube.js"></script>
<script src="js/tms-0.4.1.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>  
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
<%
MemberDTO info = (MemberDTO) session.getAttribute("info");
MenuListDAO dao = new MenuListDAO();
String han = "한식";
String il = "일식";
String yang = "양식";
String buffet = "부페";
String bunsik = "분식";
String fusion = "퓨전";
String fastfood = "패스트푸드";
String joong = "중식";
String chicken = "닭요리";

ArrayList<MenuListDTO> hanlist = dao.menuList(han);
ArrayList<MenuListDTO> illist = dao.menuList(il);
ArrayList<MenuListDTO> yanglist = dao.menuList(yang);
ArrayList<MenuListDTO> buffetlist = dao.menuList(buffet);
ArrayList<MenuListDTO> bunsiklist = dao.menuList(bunsik);
ArrayList<MenuListDTO> fusionlist = dao.menuList(fusion);
ArrayList<MenuListDTO> fastfoodlist = dao.menuList(fastfood);
ArrayList<MenuListDTO> joonglist = dao.menuList(joong);
ArrayList<MenuListDTO> chickenlist = dao.menuList(chicken);
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
								<span id="MemPrefCategory" style="display: none"><%=info.getMemPrefCategory() %></span>
								<li><a href="http://localhost:8083/">점메추</a></li>
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
		<!-- YOUTUBE VIDEO -->
		  <section class="youtube">
		    <div class="youtube__area">
		      <div id="player"></div>
		    </div>
		    <div class="youtube__cover"></div>
		    <div class="inner">
		    </div>
		  </section>
		<script>
		
		$(function(){
			const MemPrefCategory = $("#MemPrefCategory").text();
			console.log("MemPrefCategory = "+MemPrefCategory)
			if(MemPrefCategory != null){
			console.log("MemPrefCategory null ?? = "+MemPrefCategory)
			const category = MemPrefCategory.split(',');
			  $.ajax({
		          type: 'post',
		          url: 'http://localhost:8081/',
		          data : {
		        	  "category" : category
					}, success: function(jsonData) {
						const data = JSON.parse(jsonData);
						console.log("요청성공");
						console.log(jsonData);
					}, error : function(e) {
						console.log("요청실패");
					}
			  });	
			}
		})
		</script>
		<%if (hanlist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=hanlist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=hanlist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (hanlist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < hanlist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/hansik.jpg" alt="">
										<p></p>
										<a href="restaurant_detail.jsp?rest_seq=<%=hanlist.get(i).getRestSeq()%>">
											<strong style="margin-top: 10px;"> <%=hanlist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < hanlist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/hansik.jpg" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=hanlist.get(i).getRestSeq()%>">
											<strong> <%=hanlist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (yanglist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=yanglist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=yanglist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (yanglist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < yanglist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/steak.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=yanglist.get(i).getRestSeq()%>">
											<strong> <%=yanglist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < yanglist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/steak.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=yanglist.get(i).getRestSeq()%>">
											<strong> <%=yanglist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (illist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=illist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=illist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (illist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < illist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/ilsik2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=illist.get(i).getRestSeq()%>">
											<strong> <%=illist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < illist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/ilsik2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=illist.get(i).getRestSeq()%>">
											<strong> <%=illist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (buffetlist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=buffetlist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=buffetlist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (buffetlist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < buffetlist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/bupe2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=buffetlist.get(i).getRestSeq()%>">
											<strong> <%=buffetlist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < buffetlist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/bupe2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=buffetlist.get(i).getRestSeq()%>">
											<strong> <%=buffetlist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (bunsiklist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=bunsiklist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=bunsiklist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (bunsiklist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < bunsiklist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/bunsick2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=bunsiklist.get(i).getRestSeq()%>">
											<strong> <%=bunsiklist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < bunsiklist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/bunsick2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=bunsiklist.get(i).getRestSeq()%>">
											<strong> <%=bunsiklist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (fusionlist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=fusionlist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=fusionlist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (fusionlist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < fusionlist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/fusion2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=fusionlist.get(i).getRestSeq()%>">
											<strong> <%=fusionlist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < fusionlist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/fusion2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=fusionlist.get(i).getRestSeq()%>">
											<strong> <%=fusionlist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (fastfoodlist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=fastfoodlist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=fastfoodlist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (fastfoodlist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < fastfoodlist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/hamburger.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=fastfoodlist.get(i).getRestSeq()%>">
											<strong> <%=fastfoodlist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < fastfoodlist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/hamburger.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=fastfoodlist.get(i).getRestSeq()%>">
											<strong> <%=fastfoodlist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (joonglist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=joonglist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=joonglist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (joonglist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < joonglist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/joongsick2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=joonglist.get(i).getRestSeq()%>">
											<strong> <%=joonglist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < joonglist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/joongsick2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=joonglist.get(i).getRestSeq()%>">
											<strong> <%=joonglist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%}if (chickenlist.size() != 0) {%>
		<div class="content page1">
			<div class="container_12">
				<div class="grid_5">
					<div class="grid_12">
						<div class="car_wrap">
							<h2><%=chickenlist.get(0).getCateName()%> 	<a href="Lunch_U_Map.jsp?cate=<%=chickenlist.get(0).getCateName()%>"><img
								src="./images/map_location.png"></a></h2>

							<%if (chickenlist.size() > 4) {%>
							<section class="visual" data-slick='{"slidesToShow": 4, "slidesToScroll": 1}'>
								<%for (int i = 0; i < chickenlist.size(); i++) {%>
									<div style="text-align: center;margin: 10px;width: 200px;">
										<img src="images/chicken2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=chickenlist.get(i).getRestSeq()%>">
											<strong> <%=chickenlist.get(i).getRestName()%></strong>
										</a>
									</div>
								<%}%>
							</section>
							<%}else{%>
								<%for (int i = 0; i < chickenlist.size(); i++) {%>
								<div style="margin-left: 10px">
									<div style="text-align: center;margin: 10px;width: 200px;float: left">
										<img src="images/chicken2.png" alt="">
										<a href="restaurant_detail.jsp?rest_seq=<%=chickenlist.get(i).getRestSeq()%>">
											<strong> <%=chickenlist.get(i).getRestName()%></strong>
										</a>
									</div>
								</div>
								<%}%>
							<%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		
	</div>

	<script type="text/javascript">
        $('.visual').slick();
    </script>
</body>

</html>