<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to ImgBOT</title>
    <link href="resources/css/signup.css" rel="stylesheet">
    <link href="resources/css/memberEdit.css" rel="stylesheet">    
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var serviceToSignup = "${serviceToSignup}";
	if (serviceToSignup) {
		alert(serviceToSignup);
	}
	function registerCheck() {
		var registerId = $("#registerId").val();
		console.log("registerId=="+registerId);
		$.ajax({
			url : "registerCheck.do",
			type : "get",
			data : {"mem_id":registerId},
			success : function(result) {
				if (result == 2) {
					alert("아이디를 입력해 주세요.");
				} else if (result == 1) {
					alert("이미 사용중인 아이디 입니다.");
				} else {
					alert("사용 가능한 아이디 입니다..");
				}
			},
			error : function() {
				alert("error");
			}
			
		});
		
	}
	function loginCheck() {
		var memId = $("#memId").val();
		var memPw = $("#memPw").val();
		$.ajax({
			url:"memberLogin.do",
			type : "post",
			data : {"mem_id":memId,
					"mem_pw":memPw},
			success :function(result){
				console.log("result=="+result);
				if(result == 0){
					alert("아이디를 입력해 주세요.");
				}else if (result == 1) {
					alert("비밀번호를 입력해 주세요.");
				}else if(result == 2){
					alert("아이디가 존재하지 않습니다.");
				}else if(result == 3){
					alert("비밀번호가 일치하지 않습니다.");
				}else{
					location.href="index.do";
				}
			},
			error : function(){
				alert("error");
			}
		});
		
	}
	function testCheck() {
		location.href="testCheck.do";
	}
</script>
<body>
    <div class="container right-panel-active">

        <!-- Sign In -->
        <div class="container__form container--signin">
            <form class="form" id="form2">
                <h2 class="form__title">Sign In</h2>
                <input type="email" placeholder="Email" class="input" name="mem_id" id="memId"/>
                <input type="password" placeholder="Password" class="input" name="mem_pw" id="memPw"/>
                <a href="#" class="link">Forgot your password?</a>
                <button type="button" class="btn" onclick="loginCheck()">로그인</button>
            </form>
        </div>

        <!-- Sign Up -->
        <div class="container__form container--signup">
            <form action="memberInsert.do" class="form" id="form1" method="post">
                <h2 class="form__title">Sign Up</h2>
                <input type="text" placeholder="Nickname" class="input" name="mem_name"/>
                <input type="email" placeholder="Email" class="input" name="mem_id" id="registerId"/>
				<button type="button" class='but2' onclick="registerCheck()">중복체크</button>
                <input type="password" placeholder="Password" class="input" name="mem_pw"/>
                <input type="text" placeholder="Address" class="input" name="mem_addr"/>
                <input type="text" placeholder="Tel" class="input" name="mem_tel"/>
                <button class="btn">회원가입</button>
            </form>
        </div>
    
        <!-- Overlay -->
        <div class="container__overlay">
            <div class="overlay">
                <div class="overlay__panel overlay--left">
                    <button class="btn" id="signIn">로그인</button>
                </div>
                <div class="overlay__panel overlay--right">
                    <button class="btn" id="signUp">회원가입</button>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/signup.js"></script>
</body>
</html>