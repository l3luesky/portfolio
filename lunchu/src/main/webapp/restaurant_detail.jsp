<%@page import="model.ReservationDAO"%>
<%@page import="model.RestaurantDTO"%>
<%@page import="model.RestaurantDAO"%>
<%@page import="model.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ReviewDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Gourmet Traditional Restaurant | News</title>
<meta charset="utf-8">
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
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->

<style type="text/css">
td {
	height: 23px;
}

table {
	width: 100%;
}

button {
	float: right;
}

#detail tr {
	border-bottom: 1px solid #dcdcdc;
	height: auto;
}

#detail td {
	vertical-align: middle;
	font-size: 15px;
}

hr {
	margin-top: 15px;
}

.restaurant_info {
	margin-top: 10px;
}

#reviewlist td {
	text-align: center;
	height: auto;
}

.seq, .rating {
	width: 35px;
}

.writer {
	width: 40px;
}

thead {
	font-style: bold;
}

.date {
	width: 100px;
}

tbody .date, tbody .writer, tbody .review {
	border-right: solid 1px #dcdcdc;
}
</style>
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
								<%
								MemberDTO info = (MemberDTO) session.getAttribute("info");
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
					</div>
				</div>
			</div>
		</header>
		<%
		int rest_seq = Integer.parseInt(request.getParameter("rest_seq"));
		System.out.println(rest_seq);
		RestaurantDAO dao = new RestaurantDAO();
		RestaurantDTO restaurant = dao.getRestaurant(rest_seq);
		
		ReviewDAO Rdao = new ReviewDAO();
		ArrayList<ReviewDTO> review = Rdao.restReview(restaurant.getRestSeq());
		
		double rating = restaurant.getRest_rating()/review.size();
		
		String restRating = String.format("%.1f", rating);
		
		%>
		<div class="content">
			<div class="container_12">
				<div class="grid_3 restaurant_detail">
					<div class="restaurant_info">
						<table>
							<tr>
								<td>
									<h2>
										<strong><%=restaurant.getRestName()%></strong> <span
											id="restSeq" style="display: none"><%=restaurant.getRestSeq()%></span>
									</h2>
								</td>
							</tr>
							<tr>
								<td style="height: 20px"><%=restaurant.getCateName()%></td>
								<%if(review.size()!=0){ %>
								<td style="text-align: right;"><%=review.size() %>명의 평가 <%=restRating %></td>
								<%} %>
							</tr>

						</table>
						<script type="text/javascript">
						function doPopupopen() {
							window
									.open("LastPopup.jsp?rest_seq=" + <%=rest_seq%> , 'popup',
											'width=500px, height=750px, scrollbars= 0, toolbar=0, menubar=no');
						}
						
						function add2group() {
							var url = "add2group.jsp?rest_seq="+<%=rest_seq%>;
							var name = "add 2 group";
							var option = "width = 500, height = 500, top = 100, left = 200, location = no"
							window.open(url, name, option);
						}
						</script>
						<div style="left: 0px">
							<%
							if (info != null) {
							%>
							<button id="add2group" onclick="add2group()">그룹에 추가</button>
							<a href="reservation_do.jsp?rest_seq=<%=rest_seq%>"><button
									id="reservation">예약하기</button></a>
							<button onclick="doPopupopen()">리뷰 및 평점</button>
							<%
							}
							%>
							
							<br>
						</div>
						<hr>
					</div>

					<div id="detail">
						<table>
							<tr>
								<td>주소 : <%=restaurant.getRestAddr()%></td>
							</tr>
							<tr>
								<td>전화번호 : <%=restaurant.getRestTel()%></td>
							</tr>
						</table>
					</div>
					<hr>
					<div id="reviewlist" style="overflow: auto; height: 330px;">
						<table>
							<thead>
								<tr>
									<td class="date">작성일자</td>
									<td class="writer">작성자</td>
									<td class="review">내용</td>
									<td class="rating">별점</td>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < review.size(); i++) {
								%>
								<tr>
									<td class="date"><%=review.get(i).getRv_dt()%></td>
									<td class="writer"><%=review.get(i).getMem_id()%></td>
									<td class="review"><%=review.get(i).getRv_content()%></td>
									<td class="rating"><%=review.get(i).getRv_rating()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<div class="grid_7 map">
					<div id="map" style="width: 700px; height: 500px;"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1e1365d26517c250086a71d91902fcd&libraries=services"></script>

					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch('<%=restaurant.getRestAddr()%>',
										function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});
					</script>

				</div>
				<div class="clear"></div>
				<div class="bottom_block"></div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container_12"></div>
	</footer>
</body>
</html>