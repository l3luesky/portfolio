<%@page import="model.RestaurantDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<style type="text/css">

/* 창 여분 없애기 */
body {
	margin: 0;
}
/* 전체 배경화면 색상 */
.wrapper_div {
	background-color: #f5f5f5;
	height: 100%;
}
/* 팝업창 제목 */
.subject_div {
	width: 100%;
	background-color: #7b8ed1;
	color: white;
	padding: 10px;
	font-weight: bold;
}

/* 컨텐츠, 버튼 영역 padding */
.input_wrap {
	padding: 30px;
}

.btn_wrap {
	padding: 5px 30px 30px 30px;
	text-align: center;
}

/* 버튼 영역 */
.cancel_btn {
	margin-right: 5px;
	display: inline-block;
	width: 130px;
	background-color: #5e6b9f;
	padding-top: 10px;
	height: 27px;
	color: #fff;
	font-size: 14px;
	line-height: 18px;
}

.enroll_btn {
	display: inline-block;
	width: 130px;
	background-color: #7b8ed1;
	padding-top: 10px;
	height: 27px;
	color: #fff;
	font-size: 14px;
	line-height: 18px;
}

/* 책제목 영역 */
.bookName_div h2 {
	margin: 0;
}
/* 평점 영역 */
.rating_div {
	padding-top: 10px;
}

.rating_div h4 {
	margin: 0;
}

select {
	margin: 15px;
	width: 100px;
	height: 40px;
	text-align: center;
	font-size: 16px;
	font-weight: 600;
}
/* 리뷰 작성 영역 */
.content_div {
	padding-top: 10px;
}

.content_div h4 {
	margin: 0;
}

textarea {
	width: 100%;
	height: 400px;
	border: 1px solid #dadada;
	padding: 12px 8px 12px 8px;
	font-size: 15px;
	color: #a9a9a9;
	resize: none;
	margin-top: 10px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	/* 취소 버튼 */
	$(".cancel_btn").on("click", function(e) {
		window.close();
	});

	/* 등록 버튼 */

	$(document).on("click", ".enroll_btn", function(e) {

		var rest_seq = $("#rest_seq").text();
		var mem_id = $("#id").text();
		var rv_content = $("textarea").val();
		var rv_rating = $("select").val();
		console.log(rest_seq);
		console.log(mem_id);
		console.log(rv_content);
		console.log(rv_rating);

		$.ajax({
			type : 'POST',
			url : 'replyService',
			data : {
				"rest_seq" : rest_seq,
				"mem_id" : mem_id,
				"rv_rating" : rv_rating,
				"rv_content" : rv_content
			},
			success : function(result) {
				alert(result);
				self.close();
				opener.window.location.reload("restaurant_detail.jsp");
			},
			error : function(e) {
				console.log(e);
				alert("리뷰 등록이 실패하였습니다.");
			}

		});

	});

</script>
<body>

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	int rest_seq = Integer.valueOf(request.getParameter("rest_seq"));
	System.out.println(rest_seq);
	RestaurantDAO rdao = new RestaurantDAO();
	%>
	<div class="wrapper_div">
		<div class="음식점명"></div>
		<div id="id" style="display: none"><%=info.getMemId()%></div>
		<div id="rest_seq" style="display: none"><%=rest_seq%></div>

		<div class="input_wrap">
			<div class="restName_div">
				<h2><%=rdao.getName(rest_seq)%></h2>
			</div>
			<div class="rating_div">
				<h4>평점</h4>

				<select name="rating">
					<option value="0.5">0.5</option>
					<option value="1.0">1.0</option>
					<option value="1.5">1.5</option>
					<option value="2.0">2.0</option>
					<option value="2.5">2.5</option>
					<option value="3.0">3.0</option>
					<option value="3.5">3.5</option>
					<option value="4.0">4.0</option>
					<option value="4.5">4.5</option>
					<option value="5.0">5.0</option>
				</select>

			</div>
			<div class="content_div">
				<h4>리뷰</h4>
				<textarea name="content"></textarea>
				<div class="fr">
					<span class="lbl_cnt">0</span>/ <span class="lbl_limit">800</span>
					<!--리뷰길이제한-->
				</div>
			</div>
		</div>
		<div class="btn_wrap">
			<a class="cancel_btn">취소</a> <a class="enroll_btn">등록</a>
		</div>
	</div>

	<script>
		$('textarea').on('keyup', function() {
			var content = $(this).val();

			if (content.length == 0 || content == "") {
				$('.lbl_cnt').text('0');
			} else {
				$('.lbl_cnt').text(content.length);
			}
			if (content.length > 800) {
				$(this).val($(this).val().substring(0, 800));
				alert('글자수는 800자까지 입력 가능합니다.')
			}

		});
	</script>
</body>
</html>