<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
<h2>flask 데이터 전송</h2>
	<form action="http://localhost:5000/upload" method="POST" enctype="multipart/form-data">
		<input type="file" name="image">	
		<input type="submit" value="Upload Image">
	</form>
</body>
</html>