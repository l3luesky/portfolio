<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<head>
<c:import url="/WEB-INF/views/main/inc/head.jsp"></c:import>
<c:import url="/WEB-INF/views/main/inc/left.jsp"></c:import>

<script type="text/javascript">

$(document).ready(function(){

});

function doDelete(docId){
	var url = "/com/blue/remove";
	$.post(url, {docId : docId}, function(data){
		console.log('post')
		if(data.result==0){
			alert("성공적으로 삭제되었습니다.");
			document.location.href="/com/main/index";
		}else{
			alert("조건이 맞지않습니다 다시 시도하세요.");
			document.location.href="/com/main/index";
		}
	});
}

</script>

</head>

<body id="[##_body_id_##]">

	<input type="hidden" name="mapId" value="${map.mapId}">
	<input type="hidden" name="docId" id="docId" value="${doc.docId}">
	
	<div id="mArticle" class="article_skin">
		<c:forEach items="${list}" var="item">
			<div class="list_content">
					<strong class="tit_aside">${item.title}</strong>
					<p class="txt_post">${item.boardContents}</p>
				<div class="detail_info">
					<span class="txt_date">
					<fmt:formatDate value="${item.regDt}" pattern="yyyy-MM-dd"/>
					<span class="txt_bar"></span>
					<a href="#" class="disPB btnBase" onclick="doDelete('${item.docId}')">삭제</a>
					</span>
				</div>
			</div>
		</c:forEach>
		
		<br>
		<a href="/com/blue/write?mapId=${map.mapId}" class="disPB btnBaseSet">게시글 작성</a>
	</div>

</body>
</html>
