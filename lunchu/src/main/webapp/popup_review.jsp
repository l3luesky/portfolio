<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	display: flex;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 500px;
	border-radius: 10px;
	border : 3px;
	overflow: hidden;
	background-color: gray;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.popup-body {
	background-color: #ffffff;
}

.body-content {
	width: 100%;
	padding: 30px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	height: 40px;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	min-height: 400px;
	max-height: 1000px;
}

.popup-foot {
	width: 100%;
	height: 50px;
}

.pop-btn {
	display: inline-flex;
	width: 49%;
	height: 100%;
	justify-content: center;
	align-items: center;
	float: left;
	color: #ffffff;
	cursor: pointer;
}

.pop-btn.confirm {
	border-right: 1px solid white;
}


.starpoint_wrap {

	display: inline-block;
}

.starpoint_box {
	position: relative;
	background:
		url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0
		no-repeat;
	font-size: 0;
}

.starpoint_box .starpoint_bg {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	background:
		url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0
		-20px no-repeat;
	pointer-events: none;
}

.starpoint_box .label_star {
	display: inline-block;
	width: 10px;
	height: 18px;
	box-sizing: border-box;
}

.starpoint_box .star_radio {
	opacity: 0;
	width: 0;
	height: 0;
	position: absolute;
}

.starpoint_box .star_radio:nth-of-type(1):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~.starpoint_bg {
	width: 10%;
}

.starpoint_box .star_radio:nth-of-type(2):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~.starpoint_bg {
	width: 20%;
}

.starpoint_box .star_radio:nth-of-type(3):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~.starpoint_bg {
	width: 30%;
}

.starpoint_box .star_radio:nth-of-type(4):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~.starpoint_bg {
	width: 40%;
}

.starpoint_box .star_radio:nth-of-type(5):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~.starpoint_bg {
	width: 50%;
}

.starpoint_box .star_radio:nth-of-type(6):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~.starpoint_bg {
	width: 60%;
}

.starpoint_box .star_radio:nth-of-type(7):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~.starpoint_bg {
	width: 70%;
}

.starpoint_box .star_radio:nth-of-type(8):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~.starpoint_bg {
	width: 80%;
}

.starpoint_box .star_radio:nth-of-type(9):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~.starpoint_bg {
	width: 90%;
}

.starpoint_box .star_radio:nth-of-type(10):hover ~.starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~.starpoint_bg {
	width: 100%;
}

.blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
	overflow: hidden;
}

.rating-title {
	float: left;
	width: 290px;
}

</style>



</head>
<script>
	$(function() {
		$("#confirm").click(function() {
			modalClose(); //모달 닫기 함수 호출

			//컨펌 이벤트 처리
		});
		$("#modal-open").click(function() {
			$("#popup").css('display', 'flex').hide().fadeIn();
			//팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
		});
		$("#close").click(function() {
			modalClose(); //모달 닫기 함수 호출
		});
		function modalClose() {
			$("#popup").fadeOut(); //페이드아웃 효과
		}
	});
</script>

<body>

	<div class="container">
		<div class="popup-wrap" id="popup">
			<div class="popup">
				<div class="popup-head">
                    <span class="head-title">리뷰 및 평점</span>
                </div>
				<div class="popup-body">
					<div class="body-content">
		
						<div class="body-contentbox">

							<div class="score_box">
								<div>
									<input id="hid_score" name="score" type="hidden" value="">
									<div class="fl">평점을 남겨주세요</div>
									<div class="starpoint_wrap">
										<div class="starpoint_box">
											<label for="starpoint_1" class="label_star" title="0.5"><span
												class="blind">0.5점</span></label> <label for="starpoint_2"
												class="label_star" title="1"><span class="blind">1점</span></label>
											<label for="starpoint_3" class="label_star" title="1.5"><span
												class="blind">1.5점</span></label> <label for="starpoint_4"
												class="label_star" title="2"><span class="blind">2점</span></label>
											<label for="starpoint_5" class="label_star" title="2.5"><span
												class="blind">2.5점</span></label> <label for="starpoint_6"
												class="label_star" title="3"><span class="blind">3점</span></label>
											<label for="starpoint_7" class="label_star" title="3.5"><span
												class="blind">3.5점</span></label> <label for="starpoint_8"
												class="label_star" title="4"><span class="blind">4점</span></label>
											<label for="starpoint_9" class="label_star" title="4.5"><span
												class="blind">4.5점</span></label> <label for="starpoint_10"
												class="label_star" title="5"><span class="blind">5점</span></label>
											<input type="radio" name="starpoint" id="starpoint_1"
												class="star_radio"> <input type="radio"
												name="starpoint" id="starpoint_2" class="star_radio">
											<input type="radio" name="starpoint" id="starpoint_3"
												class="star_radio"> <input type="radio"
												name="starpoint" id="starpoint_4" class="star_radio">
											<input type="radio" name="starpoint" id="starpoint_5"
												class="star_radio"> <input type="radio"
												name="starpoint" id="starpoint_6" class="star_radio">
											<input type="radio" name="starpoint" id="starpoint_7"
												class="star_radio"> <input type="radio"
												name="starpoint" id="starpoint_8" class="star_radio">
											<input type="radio" name="starpoint" id="starpoint_9"
												class="star_radio"> <input type="radio"
												name="starpoint" id="starpoint_10" class="star_radio">
											<span class="starpoint_bg"></span>
										</div>
									</div>

								</div>
							</div><br>
							<div class="section">
								<!-- 방문후기 -->
								<input id="hid_contents_deny" type="hidden" value="">
								<div style="position: relative">
									<div class="title">
										리뷰를 남겨주세요.<span class="deny fc-red"></span>
									</div>
									<div style="position: absolute; right: 0px; top: 0px;"></div>
									<div class="clear"></div>
								</div>

								<textarea id="txt_contents" name="content" class="fs-13"
									placeholder="맛, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."
									style="border: solid 1px #D5D5D5; width: 450px; height: 300px;"></textarea>
								<div style="padding-top: 5px;">
									<div id="div_contents_point" class="fl fc-blue "
										style="display: none">
										<img
											src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-point-save-ok.png"
											style="margin-top: -3px;">
									</div>
									<div class="fr">
										<span id="lbl_limit">0</span> / 1000
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm">확인</span> <span
						class="pop-btn close" id="close">닫기</span>
				</div>
			</div>
		</div>
	</div>

</body>

</html>