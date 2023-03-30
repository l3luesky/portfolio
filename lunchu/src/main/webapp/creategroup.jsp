<%@page import="javax.swing.text.Document"%>
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
	margin-top: 30px;
	border-radius: 5px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	function search() {
		var arr = $(".memberId").get()
		var memberIds = [];

		for (var i = 0; i < arr.length; i++) {
			memberIds.push(arr[i].innerText);
		}

		$
				.ajax({
					url : "SearchService", //어디로 요청할 것인가?
					type : "post", //요청방식(Get or Post)
					async : false,
					data : {
						"searchId" : $("#searchid").val(),
						"memberIds" : memberIds
					}, //보내는 데이터
					success : function(res) {
						if (res == "") {
							alert("존재하지 않는 아이디입니다. 검색한 아이디를 확인해주세요.")
						} else if (res == "이미 추가한 아이디입니다.") {
							alert(res);
						} else {
							$("#members")
									.append(
											'<tr><td class = "memberId" style="padding-left: 10px; width: 140px; text-align: left">'
													+ res
													+ '</td><td class = "delete" style="width: 50%; text-align: right;"><button class = "delete_btn" type="button" style="background-color: #df3278; border: none; color: #fff; border-radius: 5px;">삭제</button></td></tr>');
						}

					},
					error : function(e) {
						alert("존재하지 않는 아이디입니다.");
						// 요청이 실패했을 때, 실행되는 콜백함수
					}
				})
	}

	function create() {

		var arr = $(".memberId").get()
		var memberIds = new Array();

		for (var i = 0; i < arr.length; i++) {
			memberIds.push(arr[i].innerText);
		}

		$.ajax({
			url : "CreateGroup", //어디로 요청할 것인가?
			type : "post", //요청방식(Get or Post)
			async : false,
			data : {
				"groupname" : $("#groupname").val(),
				"memberIds" : memberIds
			}, //보내는 데이터
			success : function(res) {
				var result = $.trim(res);
				alert(res);
				if (result==="그룹이 생성되었습니다.") {
					location.replace("groups.jsp");
				}
			},
			error : function(e) {
				alert("요청이 실패하였습니다. 관리자에게 문의하세요.");
				// 요청이 실패했을 때, 실행되는 콜백함수
			}

		})
	}

	$(document).on("click", ".delete_btn", function() {
		$(this).parent().parent().detach();
	})
</script>
<%
MemberDTO info = (MemberDTO) session.getAttribute("info");
String id = info.getMemId();
%>
<body>
	<div id="con">
		<div id="login">
			<div id="login_form">

				<h3 class="login" style="letter-spacing: -1px;">그룹 생성</h3>
				<hr>
				<p style="text-align: left; font-size: 15px; color: #666">그룹명</p>
				<input type="text" placeholder="그룹명 입력" class="size"
					required="required" id="groupname">
				<form action="">
					<p style="text-align: left; font-size: 15px; color: #666">그룹멤버</p>
					<input type="text" placeholder="멤버 아이디 검색" class="size"
						id="searchid" style="width: 248px;">
					<button type="reset"
						style="border: none; width: 48px; height: 30px; vertical-align: center"
						onclick="search()">추가</button>
				</form>
				<div id="box">
					<table id="members">
						<tr>
							<td class="memberId"
								style="padding-left: 10px; width: 140px; text-align: left"><%=id%>
							</td>
						</tr>

					</table>
				</div>

				<p></p>
				<p>
					<button class="btn" onclick="create()">그룹생성</button>
				</p>
				<hr>
				<p class="find">
					<span><a href="groups.jsp">그룹 페이지로 이동</a></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>