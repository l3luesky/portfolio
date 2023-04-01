<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
#submit {
	align-items: center;
}

img {
	width: 50px;
	height: 50px;
	margin-left: 10px;
}

.label {
	width: 300px;
	background-color: #ccccff;
	margin: 10px 0 0 0;
	padding: 10px;
	text-align: center;
	border-radius: 20px;
}

.elements {
	padding: 10px;
	width: 300px;
}

div {
	position: relative;
}

ul {
	list-style: none;
	padding-left: 0px;
	position: static;
}

li {
	display: inline-block;
}

button {
	margin: 20px;
}

#fieldset {
	width: 350px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
<script type="text/javascript">
	$(document).on(
			"click",
			".card",
			function() {
				var card1 = document.getElementById("shinhan").textContent;
				var card2 = document.getElementById("BC").textContent;
				var card3 = document.getElementById("hyundai").textContent;
				var card4 = document.getElementById("samsung").textContent;
				var card5 = document.getElementById("gookmin").textContent;
				var card6 = document.getElementById("hana").textContent;
				var card7 = document.getElementById("woori").textContent;
				var card8 = document.getElementById("citi").textContent;
				var card9 = document.getElementById("NH").textContent;
				var card10 = document.getElementById("why").textContent;
				var card11 = document.getElementById("kakao").textContent;
				var card12 = document.getElementById("shin").textContent;

				cards = [ card1, card2, card3, card4, card5, card6, card7,
						card8, card9, card10, card11, card12 ];
				var card = $(this).text();
				for (i = 0; i < cards.length; i++) {
					if (card == cards[i]) {
						card = cards[i];
					}
				}

				var restSeq = $("#restSeq").text();
				var date = $("#date").text();
				var time = $("#time").text();
				
				console.log(restSeq, date, time);
				location.href = "pay_2.jsp?card=" + card + "&restSeq=" + restSeq + "&time=" + time;

			})
</script>
<body onload="window.resizeTo(600,800)">
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	response.setContentType("text/html; charset=utf-8");
	int restSeq = Integer.valueOf(request.getParameter("rest_seq"));
	String time = request.getParameter("select_time");
	%>
	<div id="restSeq" name="restSeq" style="display: none"><%=restSeq%></div>
	<div id="time" name="time" style="display: none"><%=time%></div>
	<fieldset align="center" id="fieldset">
		<legend id="legend">결제수단</legend>
		<table border="1" align="center">
			<div id="section1" class="label">
				<span align="center">체크/신용카드</span>
			</div>
			<div id="section1b" class="elements">
				<ul align="center">
					<li><a class="card" class="card" aria-selected="false"
						role="tab"> <span><img src="images/bank_logo/shinhan.jfif"
								alt="이미지 준비중.."></span> <br> <strong id="shinhan">신한카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/BC.jfif" alt="이미지 준비중.."></span> <br>
							<strong id="BC">비씨카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/139581_159954_1814.png" alt="이미지 준비중.."></span>
							<br> <strong id="hyundai">현대카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/images.png" alt="이미지 준비중.."></span> <br>
							<strong id="samsung">삼성카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/art_15939965303701_448557.png"
								alt="이미지 준비중.."></span> <br> <strong id="gookmin">국민카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/images (1).png" alt="이미지 준비중.."></span> <br>
							<strong id="hana">하나카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/woori.png" alt="이미지 준비중.."></span> <br>
							<strong id="woori">우리카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/citi.png" alt="이미지 준비중.."></span> <br>
							<strong id="citi">씨티카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/NH.png" alt="이미지 준비중.."></span> <br>
							<strong id="NH">NH카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/why.jfif" alt="이미지 준비중.."></span> <br>
							<strong id="why">외환카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/kakao.jpg" alt="이미지 준비중.."></span> <br>
							<strong id="kakao">카카오카드</strong>
					</a></li>
					<li><a class="card" aria-selected="false" role="tab"> <span><img
								src="images/bank_logo/shin
								.png" alt="이미지 준비중.."></span> <br>
							<strong id="shin">신협카드</strong>
					</a></li>
				</ul>
		</table>
		</div>
		<!-- <div>
            <div id="section1" class="label">
                <span>계좌이체</span>
            </div>
            <div id="section1b" class="elements">
                <ul>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/toss-symbol.jpg" alt="이미지 준비중.." ></span>
                            <br><strong>토스</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/NH.png" alt="이미지 준비중.." ></span>
                            <br><strong>NH은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/art_15939965303701_448557.png" alt="이미지 준비중.." ></span>
                            <br><strong>국민은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/우리.jpg" alt="이미지 준비중.." ></span>
                            <br><strong>우리은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/신한.jfif" alt="이미지 준비중.." ></span>
                            <br><strong>신한은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/하나은행.png" alt="이미지 준비중.." ></span>
                            <br><strong>하나은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/IBK.png" alt="이미지 준비중.." ></span>
                            <br><strong>기업은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/다운로드 (2).png" alt="이미지 준비중.." ></span>
                            <br><strong>씨티은행</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div>
            <div id="section1" class="label">
                <span>무통장입금</span>
            </div>
            <ul>
                <div id="section1b" class="elements">
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/우리.jpg" alt="이미지 준비중.." ></span>
                            <br><strong>우리은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/신한.jfif" alt="이미지 준비중.." ></span>
                            <br><strong>신한은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/하나은행.png" alt="이미지 준비중.." ></span>
                            <br><fh5co-contactstrong>하나은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/art_15939965303701_448557.png" alt="이미지 준비중.." ></span>
                            <br><strong>국민은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/우체국.jfif" alt="이미지 준비중.." ></span>
                            <br><strong>우체국은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/IBK.png" alt="이미지 준비중.." ></span>
                            <br><strong>기업은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/NH.png" alt="이미지 준비중.." ></span>
                            <br><strong>농협은행</strong>
                        </a>
                    </li>
                    <li>
                        <a class="card" aria-selected="false" role="tab">
                            <span><img src="images/bank_logo/다운로드 (2).png" alt="이미지 준비중.." ></span>
                            <br><strong>씨티은행</strong>
                        </a>
                    </li>
                </div>
            </ul>
            </table> -->
		<%--
            
            RequestDispatcher rd = request.getRequestDispatcher("Ex12LoginSuccess.jsp?id="+card);
    		rd.forward(request, response);
            
            --%>
	</fieldset>
	<script type="text/javascript">
		var elements = document.getElementsByTagName("div");

		// 모든 영역 접기
		for (var i = 0; i < elements.length; i++) {
			if (elements[i].className == "elements") {
				elements[i].style.display = "none";
			} else if (elements[i].className == "label") {
				elements[i].onclick = switchDisplay;
			}
		}

		// 상태에 따라 접거나 펼치기
		function switchDisplay() {

			var parent = this.parentNode;
			var target = parent.getElementsByTagName("div")[1];

			if (target.style.display == "none") {
				target.style.display = "block";
			} else {
				target.style.display = "none";
			}
			return false;
		}
	</script>
</body>

</html>