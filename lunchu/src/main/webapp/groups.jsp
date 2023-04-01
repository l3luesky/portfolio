<%@page import="model.JoinGroupDTO"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.JoinGroupDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.GroupDTO"%>
<%@page import="model.GroupDAO"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Gourmet Traditional Restaurant | Menu</title>
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/superfish.js"></script>
<script src="js/sForm.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>
<script type="text/javascript">
	$(document).on("click", ".deletegroup_btn", function() {
		var groupseq = $(this).parent().parent().find(".groupseq_1").text();

		var adminId = $(this).parent().parent().find(".adminId").text();

		var id = $("#id").text();

		console.log(groupseq, adminId, id);
		var answer = null;
		if (adminId == id) {
			console.log("같음.")
			answer = confirm("그룹을 삭제하시겠습니까?");
		} else {
			answer = confirm("그룹에서 나가시겠습니까?");
		}
		if (answer) {
			$.ajax({
				type : "POST",
				url : "DeleteGroupService",
				data : {
					"groupseq" : groupseq,
					"adminId" : adminId,
				},
				success : function(res) {
					console.log("요청성공");
					alert(res);
					location.reload("groups.jsp");
				},
				error : function(e) {
					console.log("요청실패");
				}
			})
		}
	})

	$(document)
			.on(
					"click",
					".group_detail",
					function() {
						var name = $(this).find(".groupname").text();
						$(".prefix_1").find("h2").text(name);

						var adminId = $(this).find(".adminId").text();
						$(".prefix_1").find("span").text(
								"created by. " + adminId);

						var arr = $(this).find("span").text().trim().split(" ");
						var str = "";
						for (var i = 0; i < arr.length; i++) {
							str += ('<a href="#">' + arr[i] + '</a>,')
						}
						$(".inn1").html(str.slice(0, -1));

						var groupseq = $(this).find(".groupseq_1").text();
						$("#hidden_group_seq").text(groupseq);

						$
								.ajax({
									type : "POST",
									url : "RestGroupService",
									data : {
										"groupseq" : groupseq
									},
									success : function(res) {
										console.log("요청성공");

										if(res.length>2){
										var arr = res.slice(1, res.length - 1)
												.split(",");
										var str = ""
											for (var i = 0; i < arr.length; i++) {
												var temp = '<tr><td style = "width : 30px"><input name="restseq" value = "'+arr[i]+'" type="checkbox"></td><td style = "width : 23px" class="review_detail">'
														+ (i + 1)
														+ '</td><td style = "width : 330px; text-align : center">'
														+ '<a href="restaurant_detail.jsp?rest_seq="'
														+ groupseq
														+ '+>'
														+ arr[i]
														+ '</a></td></tr>';
												str += temp;
											}
										}
										$(".prefix_1 tbody").html(str);
										$(".manage_favorites").attr("style",
												"display:block")
										$(".prefix_1 hr").attr("style",
												"display:block")
									},
									error : function(e) {
										console.log("요청실패");
									}
								})

					})

	$(document).on("click", ".manage_favorites", function() {
		var groupseq = $("#hidden_group_seq").text();

		var arr = [];
		console.log("test: " + groupseq);
		$("input:checkbox[name='restseq']:checked").each(function() {

			var checked = $(this).val();
			arr.push(checked);
		})
		console.log("test: " + arr);
		//여기까지 잘 실행됨.
		
		$.ajax({
			type : "POST",
			url : "DelRestFromGroup",
			data : {
				"groupseq" : groupseq,
				"arr" : arr
			},
			success : function(res) {
				console.log("요청성공");
				alert(res);
				location.reload();
			},
			error : function(e) {
				console.log("요청실패");
			}
		})
		
	})
</script>
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
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
		<div class="content">
			<div class="container_12">
				<div class="group_list">
					<h2 class="head_groupList"
						style="display: content; width: 200px; margin-right: 0px">Group
						List</h2>
					<div class="scroll_box">
						<table>

							<%
							String id = info.getMemId();

							JoinGroupDAO JGdao = new JoinGroupDAO();
							GroupDAO Gdao = new GroupDAO();

							ArrayList<Integer> groupseq = JGdao.select(id);

							ResultSet result = null;
							if (groupseq.size() == 0) {
							%>
							<tr>
								<td style="text-align: center; vertical-align: center">생성된
									그룹이 없습니다.</td>
							</tr>
							<%
							} else {
							for (int i = 0; i < groupseq.size(); i++) {
								GroupDTO Gdto = Gdao.select(groupseq.get(i));
								ArrayList<String> members = JGdao.findmembers(groupseq.get(i));
							%>
							<tbody class="element">
								<tr>
									<td class="sequence"><%=i + 1%></td>
									<td class="group_detail" style="width: 200px"><a
										class="groupname" href="#"><%=Gdto.getGroupName()%></a> <a
										class="groupseq_1" style="display: none;"><%=groupseq.get(i)%></a>
										<a class="adminId" style="display: none;"><%=Gdto.getAdminId()%></a>
										<br> <span> <%
 String temp = "";
 for (String j : members) {
 	temp += j + " ";
 }
 %><%=temp%></span></td>
									<td class="deletegroup_btn"
										style="color: red; text-align: right"><strong>X</strong>
									</td>
								</tr>
							</tbody>
							<%
							}
							}
							%>

						</table>
					</div>
					<table>
						<thead>
							<tr style="display: none">
								<td id="id"><%=id%></td>
							</tr>
							<tr>
								<td colspan="3" onclick="location.href='creategroup.jsp'"
									class="add_new_group" align="center"><br> ➕새 그룹</td>
							</tr>
					</table>
				</div>

				<div class="grid_5 prefix_1">
					<h2></h2>
					<span></span>
					<p class="col2 inn1"></p>


					<div>
						<span id="hidden_group_seq" style="display: none"></span>
						<button class="manage_favorites" style="display: none">삭제</button>
						<hr style="display: none;">
						<table id="restaurant_list_">
							<tbody>
								<%-- 클릭하면 그룹 상세정보 뜰 곳 --%>
							</tbody>
						</table>

					</div>
				</div>

			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>

		<div class="bottom_block"></div>
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