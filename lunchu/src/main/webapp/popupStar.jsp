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
.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.wrap {
	padding: 10px;
}

.btn_open {
	font-weight: bold;
	margin: 5px;
	padding: 4px 6px;
	background: #000;
	color: #fff;
}

.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 20px 30px;
	background: #fff;
	width: 200px;
	vertical-align: middle;
	font-size: 15px;
}

.pop_wrap .dsc {
	
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
	<!--�˾� ���� -->
	<!--  <a href="#pop_info_1" class="btn_open">�˾� ����1</a> -->



	<div id="pop_info_1" class="pop_wrap">
		<!--�˾�����-->
		<div class="pop_inner" id="pop_inner">
			<p class="dsc">
				<!--�˾���-->
				<span class="star"> <!--���� �ο�--> �ڡڡڡڡ� <span>�ڡڡڡڡ�</span> <input
					type="range" oninput="drawStar(this)" value="1" step="1" min="0"
					max="10">
				</span>
				<!-- ���� �ο���-->
			<div class="section">
				<!-- ���� -->
				<input id="hid_contents_deny" type="hidden" value="">
				<div style="position: relative">
					<div class="title">
						����.<span class="deny fc-red"></span>
					</div>
					<div style="position: absolute; right: 0px; top: 0px;"></div>
					<div class="clear"></div>
				</div>

				<textarea id="txt_contents" name="content" class="fs-13"
					placeholder="���並 �����ּ���."
					style="border: solid 2px #D5D5D5; width: 100%; height: 120px;">
                        </textarea>
				<!--���䱸����-->
				<div style="padding-top: 5px;">
					<div id="div_contents_point" class="fl fc-blue "
						style="display: none">
						<img
							src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-point-save-ok.png"
							style="margin-top: -3px;">
					</div>
					<div class="fr">
						<span class="lbl_cnt">0</span>/ <span class="lbl_limit">1000</span>
						<!--�����������-->
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<button type="button" class="btn_insert">���</button>
			<button type="button" class="btn_close">�ݱ�</button>

		</div>
	</div>

	<script>//���� js
        const drawStar = (target) => {
            document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
        }

    </script>
	<script>// �˾�â js
        //var target = document.querySelectorAll('.btn_open');
        var target = document.querySelectorAll('.pop_wrap');
        var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
        var targetID;
        
        /*
        // �˾�����
        for (var i = 0; i < target.length; i++) {
            target[i].addEventListener('click', function () {
                targetID = this.getAttribute('href');
                document.querySelector(targetID).style.display = 'block';
            });
        }
*/
        // �˾� �ݱ�
        for (var j = 0; j < target.length; j++) {
            btnPopClose[j].addEventListener('click', function () {
                this.parentNode.parentNode.style.display = 'none';
                location.href = 'restaurant_detail.jsp';
            });
        }
       
        $('textarea').on('keyup', function(){
            var content = $(this).val();

            if (content.length == 0 || content == ""){
                $('.lbl_cnt').text('0');
            }else{
                $('.lbl_cnt').text(content.length);
            }
            if (content.length>1000){
                $(this).val($(this).val().substring(0,1000));
                alert('���ڼ��� 1000�ڱ��� �Է� �����մϴ�.')
            }


        });
    </script>
</body>

</html>