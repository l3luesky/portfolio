<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<c:import url="/WEB-INF/views/main/inc/head.jsp"></c:import>
<c:import url="/WEB-INF/views/main/inc/left.jsp"></c:import>


<script type="text/javascript">

$(document).ready(function(){
	$("#btnWrite").click(function(){
		$("#frmWrite").ajaxSubmit({
			type: 'POST'
			, url : '/com/blue/write'
			, dataType : 'JSON'
			, beforeSubmit : function(){
			}
			, success : function(data){
				if(data.result==9){
					alert("성공적으로 등록되었습니다.");
					document.location.href="/com/main/index";
				}else{
					alert("등록이 실패하였습니다. 관리자에게 문의하세요.");
					document.location.href="/com/main/index";
				}				
			}
		});
	});
});

</script>

</head>

<body id="[##_body_id_##]">
	<div id="mArticle" class="article_skin">

		<s_list>
		<div class="list_title">
			<h2 id="dkBody" class="tit_skin">
				<span class="screen_out"></span><span class="txt_title">목록</span>
			</h2>
		</div>
		</s_list>

		<form id="frmWrite" action="/com/blue/write" method="post">
			<input type="hidden" name="mapId" value="${map.mapId}" />
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" placeholder="제목입력"
					title="제목을 입력하세요" required="required"></td>
			</tr>
			<br>
			<br>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContents" title="내용을 입력하세요"
						placeholder="내용입력" required="required"></textarea></td>
			</tr>
		</form>
		
		<div class="btnSet alignCenter"><br>
			<a href="#" class="disPB btnBase" id="btnWrite">저장</a>
			<a href="/com/main/index" class="disPB btnBase">취소</a>
		</div>
		
	</div>
</body>
</html>
