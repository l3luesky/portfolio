<%@page import="model.RestaurantDAO"%>
<%@page import="model.RestGroupDTO"%>
<%@page import="model.GroupDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.JoinGroupDAO"%>
<%@page import="model.GroupDAO"%>
<%@page import="model.RestGroupDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<style>
/* @import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css'); */
@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 100;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 300;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 400;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 500;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 700;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 900;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf)
		format('opentype');
}

body {
	margin: 0 auto;
}
/* body, table, div, p ,span{font-family:'Nanum Gothic';} */
body, table, div, p, span {
	font-family: 'Noto Sans KR';
}

a {
	text-decoration: none;
	color: #333;
}

#con {
	width: 100%;
	height: 100vh;
	background-color: #f5f1ee;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	padding: 0;
}

#login {
	width: 600px;
	height: 600px;
	margin: 0 auto;
	/* position: relative; */
	/* background:#ddd; */
}

#login_form {
	/* text-align:center; */
	border-radius: 10px;
	padding: 50px;
	background: #fff;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.login {
	font-size: 25px;
	font-weight: 900;
	color: #333;
}

.size {
	width: 300px;
	height: 30px;
	padding-left: 10px;
	background-color: #f4f4f4;
	/* margin-left:10px; */
	border: none;
	border-radius: 5px;
}

.btn {
	width: 310px;
	height: 40px;
	font-size: 15px;
	background-color: #df3278;
	color: #fff;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btn:hover {
	background: #ca296a;
}

hr {
	margin-top: 20px;
	background: #eee;
}

.find {
	color: #ddd;
	font-size: 12px;
}

.find span {
	padding-left: 10px;
}

.find span::before {
	content: '|';
	color: #333;
	padding-right: 10px;
}

.find span:nth-child(1):before {
	content: none;
}

.find span:nth-child(1) {
	padding-left: 0px;
}

.find a:hover {
	color: #707070;
}

.delete_btn {
	background-color: #df3278;
	border: none;
	color: #fff;
	border-radius: 5px;
	margin-right: 10px
}

#box {
	padding-left: 10px;
	width: 300px;
	background-color: #f2f0f0;
	height: 200px;
	margin-top: 10px;
	border-radius: 5px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	function popupclose() {
		window.close();
	}
	function togroup() {
		window.close();
		window.opener.location.href = "groups.jsp";
	}
</script>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	String id = info.getMemId();

	JoinGroupDAO JGdao = new JoinGroupDAO();
	ArrayList<Integer> Glist = JGdao.select(id);
	%>
	<div id="con">
		<div id="login">
			<div id="login_form">
				<%
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=UTF-8");

				int restseq = Integer.valueOf(request.getParameter("rest_seq"));

				RestaurantDAO Rdao = new RestaurantDAO();

				String restname = Rdao.getName(restseq);
				%>
				<h3 class="login" style="letter-spacing: -1px;">그룹에 추가</h3>
				<hr>
				<p style="text-align: left; font-size: 15px; color: #666">식당이름</p>
				<input type="text" class="size" id="restname" value="<%=restname%>"
					readonly="readonly">

				<p style="text-align: left; font-size: 15px; color: #666">그룹 선택</p>
				<div id="box">
					<table id="members">
						<%
						GroupDAO Gdao = new GroupDAO();
						ArrayList<String> result = new ArrayList<String>();
						for (int i : Glist) {
							GroupDTO Gdto = Gdao.select(i);
						%>
						<tr>
							<td><input value="<%=Gdto.getGroupSeq()%>" name="groupcheck"
								type="checkbox"></td>
							<td style="padding-left: 10px; width: 140px; text-align: left"><%=Gdto.getGroupName()%>
							</td>
						</tr>
						<%
						}
						%>

					</table>
				</div>

				<p></p>
				<script type="text/javascript">
				function add2group() {
					var arr = [];
					var rest_seq = <%=restseq%>
					$("input:checkbox[name='groupcheck']:checked").each(function() {
						var checked = $(this).val();
						arr.push(checked);
					})

					$.ajax({
						type : "POST",
						url : "Add2GroupService",
						data : {
							"arr" : arr,
							"rest_seq" : rest_seq
						},
						success : function(res) {
							alert("그룹에 음식점 추가를 성공했습니다.");
							opener.parent.location = "restaurant_detail.jsp?rest_seq=" + <%=restseq%>;
							window.close();

						},
						error : function(e) {
							console.log("요청실패");
						}
					})

				}
				</script>
				<p>
					<button class="btn" onclick="add2group()">추가하기</button>
				</p>
				<hr>
				<p class="find">
					<span><a href="#" onclick="togroup()">그룹 페이지로 이동</a></span> <span><a
						href="#" onclick="popupclose()">닫기</a></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>