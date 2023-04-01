<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<head>
<c:import url="/WEB-INF/views/main/inc/head.jsp"></c:import>

<script type="text/javascript">

/* $(document).ready(function(){
	$("#btnRemoveDoc").click(function(){
		var docId = $("#docId").val();
		var url = "/com/blue/remove";
		$.post(url, {docId : docId}, function(data){
			if(data.result==0){
				alert("성공적으로 삭제되었습니다.");
				
				// 성공후 목록으로 이동
				document.location.href="/com/blue/gong";
			}else{
				alert("삭제 실패하였습니다. 관리자에게 문의하세요.");
			}
		});
		
	});
}); */

</script>

</head>

<body id="[##_body_id_##]">
	<c:import url="/WEB-INF/views/main/index.jsp"></c:import>

	<div id="mArticle" class="article_skin">

<div class="list_title">
    <h2 id="dkBody" class="tit_skin"><span class="screen_out">싸움터</span><span class="txt_title">싸움터</span></h2>
  </div>

		<%-- <c:forEach items="${list}" var="item">
			<div class="area_title">
				<h3 class="tit_post">${item.title}</h3>
				<span class="info_post">${item.boardContents} </span>
				<a href="#" class="btnBase" id="btnRemoveDoc">삭제</a>
			</div>
		</c:forEach> --%>
			<!-- <a href="/com/blue/bwrite" class="txt_post">글쓰기</a> -->
</body>
</html>
