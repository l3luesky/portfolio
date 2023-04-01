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
			// 최근 공지사항 포틀릿 가져오기
			getRecent();
		
		});
		
		function getRecent(){
			var url = "/com/blue/portlet/list";
			$.post(url, function(data){
				$("#portletA").html(data);
			});
		}
		
</script>

</head>


</head>
<body>
    <div id="mArticle" class="article_skin">
    		<div style="padding-bottom: 20px;">
		    목록
    		</div>
    	
   		<div id="portletA">
   		</div>
	</div>
</body>
</html>
