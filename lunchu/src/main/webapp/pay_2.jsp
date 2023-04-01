<%@page import="model.RestaurantDAO"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.ReservationDAO"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script>
	const input_btn = document.getElementById("input_btn");

	function do_alert() {

		alert("결제가 완료되었습니다.");

		opener.location.href = "reservation_list.jsp";
		self.close();
	}
</script>

<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	//request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");

	String card = request.getParameter("card");
	int restSeq = Integer.valueOf(request.getParameter("restSeq"));
	String reservTime = request.getParameter("time");
	System.out.println("test: "+card);
	System.out.println("test: "+restSeq);
	System.out.println("test: "+reservTime);
	%>

	<fieldset>
		<legend>주문/결제</legend>
		<a></a>
		<table border="1" align="center">
			<tr>
				<td>카드결제</td>
				<%--
					request.setCharacterEncoding("utf-8");
					response.setContentType("text/html; charset=utf-8");
					String card = request.getParameter("card");
					System.out.print(card);
					--%>
				<td><%=card%></td>
			</tr>
			<tr>
				<td>결제정보</td>
				<td>
					<table>
						<tr>
							<td>카드번호</td>
							<td><input size="4px" maxlength="4" type="text"> <input
								size="4px" maxlength="4" type="text"> <input size="4px"
								maxlength="4" type="text"> <input size="4px"
								maxlength="4" type="text"></td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td><input size="1px" maxlength="2" type="text">월 <input
								size="4px" maxlength="4" type="text">년</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input size="4px" maxlength="2" type="text">XX
								(앞 2자리)</td>
						</tr>
						<tr>
							<td>주민등록번호</td>
							<td>XXXXXX - <input size="4px" maxlength="6" type="text"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>결제 금액</td>
				<td>10,000원</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox">전자금융 이용약관 <input
					type="checkbox">고유식별정보수집 및 이용약관</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox">개인정보수집 및 이용약관 <input
					type="checkbox">개인정보제공 및 위탁안내</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input id="input_btn" type="submit" value="결제하기" onclick="do_alert()"></td>
			</tr>
			<%
				ReservationDAO dao = new ReservationDAO();
				String memId=info.getMemId();
				int cnt = dao.add(restSeq, reservTime, memId);
				String id = info.getMemId();
				RestaurantDAO Rdao = new RestaurantDAO();
				String VisitRestaurant = Rdao.getName(restSeq);
				int visit =dao.updateVisitedRest(id, VisitRestaurant);
				System.out.println(visit);
			%>
		</table>
	</fieldset>
</body>

</html>