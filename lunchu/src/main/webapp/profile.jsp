<%@page import="model.MemberDAO"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.lang.ProcessHandle.Info"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gourmet Traditional Restaurant | Portfolio</title>
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/prettyPhoto.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<style type="text/css">
	.size {
    width: 300px;
    height: 30px;
    padding-left: 10px;
    background-color: #f4f4f4;
    /* margin-left: 10px; */
    border: none;
    border-radius: 5px;
}
	.btn {
    width: 310px;
    height: 40px;
    font-size: 15px;
    background-color: #DF3278;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}
	input {
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}
	input [type="submit" i] {
	width: 310px;
    height: 40px;
    font-size: 15px;
    background-color: #DF3278;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    appearance: auto;
    user-select: none;
    white-space: pre;
    align-items: flex-start;
    text-align: center;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    color: buttontext;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
}
</style>
<script>
	$(document).ready(function() {
		$("a[data-gal^='prettyPhoto']").prettyPhoto({
			theme : 'facebook'
		});
	});
</script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String[] sp = info.getMemPrefCategory().replace("[", "").replace("]", "").replace(" ", "").split(",");
	String[] cate = { "분식", "한식", "퓨전", "패스트푸드", "중식", "닭요리", "일식", "양식", "부페" };
	%>
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
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
		<div class="content">
			<div class="container_12" margin-left="50px">
				<div class="grid_12">
					<h2>내 정보</h2>
				</div>
				<div class="portfolio">
					<form action="UpdateMember" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td><%=info.getMemId()%></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td> <label>
									<input type="password" placeholder="비밀번호 입력" value=<%=info.getMemPw()%> name="pw" class="size">
								</label> </td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td> <label>
									<input type="password" placeholder="비밀번호 확인" value=<%=info.getMemPw()%> name="pwCheck" class="size">
								</label> </td>
							</tr>
							<tr>
								<td>직장 주소</td>
								<td> <label>
									<input type="text" value="<%=info.getMemAddr()%>" name="address" placeholder="주소를 입력해주세요" class="size">
								</label> </td>
							</tr>
							<tr>
								<td>선호 카테고리</td>


								<td>
									<%
									for (int j=0; j < cate.length; j++){
									%>
									<input type="checkbox" name="category" value=<%=cate[j] %>
									<%for (int i=0; i<sp.length; i++) {
										if(sp[i].equals(cate[j])){
										%> checked <%
										}
									}
										%>
									>
									<label style="text-align: left; font-size: 15px; color: #666"><%=cate[j]%>
									</label>

									<%}%>
								</td>
							</tr>
							<tr>
								<td>최근 방문 식당</td>
								<td>
									<%
									String visitRest = "";
									String id = info.getMemId();
									if (info.getMemVisitRestaurant() != null) {
										visitRest = info.getMemVisitRestaurant();
									} else {
										visitRest = "-";
									}
									%>
									<%=visitRest%>
								</td>
							</tr>
							<tr>
								<td>가입날짜</td>
								<td><%=info.getMemJoindate()%></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="수정"
									style="text-align: center" class="btn"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="clear"></div>
				<div class="bottom_block">
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container_12">
			<div class="grid_12">
				Gourmet Traditional Restaurant &copy; 2045 | <a href="#">Privacy
					Policy</a> | Design by: <a href="http://www.templatemonster.com/">TemplateMonster.com</a>
			</div>
			<div class="clear"></div>
		</div>
	</footer>
</body>
</html>