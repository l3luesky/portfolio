<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<body id="[##_body_id_##]">

		<c:forEach items="${port}" var="list">
			<div class="list_content">
					<strong class="tit_aside">${list.title}</strong>
					<p class="txt_post">${list.boardContents}</p>
				<div class="detail_info">
					<span class="txt_date">
					<fmt:formatDate value="${list.regDt}" pattern="yyyy-MM-dd"/>
					</span>
				</div>
			</div>
		</c:forEach>
</body>
