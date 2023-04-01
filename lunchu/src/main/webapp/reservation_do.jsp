<%@page import="java.util.ArrayList"%>
<%@page import="model.ReservationDAO"%>
<%@page import="model.ReservationDTO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- Simple Line Icons -->
<link rel="stylesheet" href="css/simple-line-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/style.css">
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
<script type="text/javascript">
	const btn_btn_primary = document.getElementsByClassName("btn btn-primary");

	function doPopupopen(rest_seq) {

		var rest_seq = rest_seq;
		window.open("", "popup",
						"width=#fieldset, height=#fieldset, scrollbars= 0, toolbar=0, menubar=no");

		var frmData = document.frmData;
		frmData.target = "popup";
		frmData.action = "pay_1.jsp?rest_seq="+rest_seq;
		frmData.submit();
	}
</script>
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
		<div class="content page1">
			<%
			int rest_seq = Integer.valueOf(request.getParameter("rest_seq"));
			%>

			<div class="container_12">
				<div class="grid_12">
					<div id="fh5co-contact" data-section="reservation">
						<div class="container">
							<div class="row">
								<div class="col-md-6 to-animate-2">
									<img src="images/foodfood/soba.jfif" alt="이미지 준비중.."> 
									<img src="images/foodfood/bulgogi.jfif" alt="이미지 준비중.."> 
									<img width="300px" height="300px" src="images/foodfood/beakban.jfif" alt="이미지 준비중.."> 
									<img width="200px" height="300px" src="images/foodfood/sheepgobchang.jpg" alt="이미지 준비중..">
								</div>
								<div class="col-md-6 to-animate-2">
									<h3>Reservation</h3>

									<div class="form-group">
										<label for="id" class="sr-only">id</label>
										<p id="id">
											예약자 ID :
											<%=info.getMemId()%>
										</p>
									</div>
									<form name="frmData" id="frmData" method="post">
										<div class="form-group">
											<label for="tel" class="sr-only">연락처 ( - 를 빼고 입력해주세요.
												)</label> <input name="tel" id="tel" class="form-control"
												placeholder="연락처 ( - 를 빼고 입력해주세요. )" type="text">
										</div>



										<div class="form-group">
											<div>※ 예약은 당일 예약만 가능합니다. ※</div>
											<label for="occation" class="sr-only">Occation</label> 
											<select class="form-control" id="select_time" name="select_time">
												<%
												ArrayList<String> result = new ArrayList <>();
												ReservationDAO dao = new ReservationDAO();
												String[] timelist = { "11:30", "12:00", "12:30", "13:00" };
												ArrayList<String> list = new ArrayList<>();
												if(info != null){
													list = dao.showReserveTime(rest_seq);
												}
													System.out.println(list);
												if(list.size() != 0){
													for(int i = 0; i<list.size();i++){
														for(int j = 0; j<timelist.length; j++){
															if(! list.get(i).equals(timelist[j])){
																if(! result.contains(timelist[j])){
																	System.out.println(timelist[j]);
																	result.add(timelist[j]);
																}
															}
														}
													}
													for(String s:result ){%>
														<option>
															<%=s%>
														</option>
												<%}
												}
												else{
													for(String s: timelist){%>
														<option>
															<%=s%>
														</option>
												<%
													}
												}
												%>
											</select>
										</div>
										<div class="form-group">
											<label for="message" class="sr-only">사장님께 요청사항</label>
											<textarea name="" id="message" cols="30" rows="5"
												class="form-control" placeholder="사장님께 요청사항"></textarea>
										</div>
										<div class="form-group">
											<input class="btn btn-primary" value="예약하기" type="submit"
												onclick="doPopupopen(<%=rest_seq%>)">
										</div>
									</form>


								</div>
								<p></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer>
			<div class="container_12">
				<div class="grid_12">스마트인재개발원 Team Lunch_U</div>
				<div class="clear"></div>
			</div>
		</footer>
</body>

</html>