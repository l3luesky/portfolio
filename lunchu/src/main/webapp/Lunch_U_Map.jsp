<%@page import="model.MenuListDAO"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MenuListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gourmet Traditional Restaurant | Portfolio</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/sForm.js"></script>
<style>
.height_scroll{
	 height:397px;
	 overflow-x:hidden; 
	 overflow-y:auto; 
}
</style>

</head>
<%
   MemberDTO info = (MemberDTO) session.getAttribute("info");
   String cate = request.getParameter("cate");
   MenuListDAO dao = new MenuListDAO();
   ArrayList<MenuListDTO> restaurantList = dao.menuList(cate);
   int j = 0;
   
%>
<body>
<div class="main">
  <header>
    <div class="container_12">
      <div class="grid_12">
        <h1>
        <a href="home.jsp"><img src="images/logo_lunchu1.png" alt=""></a></h1>
        <div class="menu_block">
          <nav>
         <ul class="sf-menu">
            <%
            if (info != null) {
            %>
            <li><a href="LogoutService">로그아웃</a></li>
            <li class="with_ul"><a href="#">마이페이지</a>
               <ul>
                  <li><a href="profile.jsp"> 내 정보</a></li>
                  <li><a href="reservation_list.jsp"> 내 예약</a></li>
                  <li><a href="review_list.jsp"> 내 리뷰 </a></li>
                  <li><a href="groups.jsp"> 내 그룹</a></li>
               </ul></li>
            <%
            } else {
            %>
            <li><a href="login.jsp">로그인</a></li>
            <li><a href="join.jsp">회원가입</a></li>
            <%
            }
            %>
         </ul>
         </nav>
          <div class="clear"></div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </header>
  <div class="content">
    <!-- 지도 영역 -->
    <div class="container_12">
        <div class="grid_3">
            <h2 class="head2">음식점 목록<span id="category" style="display: none"><%=cate%></span></h2>
            <ul id = "getRestList" class="height_scroll">
            </ul>
        </div>
        <div id="map" style="width:700px;height:500px;"></div>
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1e1365d26517c250086a71d91902fcd&libraries=services"></script>
        <script>
        var cate = $("#category").text();
        $.ajax({
           url : "SelectRestList",
         data : {
            "category" : cate
         },
            success: function (jsonData) {
                const data = JSON.parse(jsonData);
                
                let getRestList = restList(data);
                getList(getRestList);
            }
        });
        function restList(data) {
            let list = [];
            // for 반복문의 범위 를 ?
            for (let i = 0; i < data.length; i++) {
                list.push({
                    "restSeq": data[i].restSeq,
                    "restNm": data[i].restName,
                    "restAddr": data[i].restAddr
                });
            }
            return list;
        }
        function getList(getRestList) {
			const restul = document.getElementById("getRestList");
			const geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch('<%=info.getMemAddr()%>', function (result, status) {
               if (status === kakao.maps.services.Status.OK) {
                   addrCoord = new kakao.maps.LatLng(result[0].y, result[0].x);
                   for (let i = 0; i < getRestList.length; i++) {
                      geocoder.addressSearch(getRestList[i].restAddr, function (result, status) {
                         restCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
                         var licnt = $("#getRestList").children('li').length;
                         if (restCoords.La <= addrCoord.La+0.009 && restCoords.La >= addrCoord.La-0.009) {
                               if (restCoords.Ma <= addrCoord.Ma+0.01 && restCoords.Ma >= addrCoord.Ma-0.01) {
                               restul.innerHTML +='<li><a href=restaurant_detail.jsp?rest_seq='+
                               getRestList[i].restSeq+'>'+getRestList[i].restNm+'</a></li>'
                               }
                            }
                         
                      });
                   }
               }
           });
         
      }
        </script>

        <script>
            
            $(function () {
               
               var category = $("#category").text();
                function getMap() {
                    $.ajax({
                       url : "SelectRestList",
                    data : {
                       "category" : category
                    },
                        success: function (jsonData) {
                            const obj = JSON.parse(jsonData);
                            let addressList = restInfo(obj);
                            createMap(addressList);
                        }
                    });
                };

                getMap();
                function restInfo(restaurant) {
                    let list = [];
                    // for 반복문의 범위 를 ?
                    for (let i = 0; i < restaurant.length; i++) {
                        list.push({
                            "restNm": restaurant[i].restName,
                            "restCate": restaurant[i].cateName,
                            "restAdd": restaurant[i].restAddr
                        });
                    }
                    return list;
                }

                function createMap(addressList) {
                    

                    let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center: new kakao.maps.LatLng(35.1904480847838, 126.812984611101), // 지도의 중심좌표
                            level: 4 // 지도의 확대 레벨
                        };
                    let map = new kakao.maps.Map(mapContainer, mapOption);
                    let geocoder = new kakao.maps.services.Geocoder();
                    let overlayList = [];
                    
                    var imageSrc = "images/map_marker.png"; 
                    var imageSize = new kakao.maps.Size(35, 40); 
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                    
                    geocoder.addressSearch('<%=info.getMemAddr()%>', function (result, status) {
                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {

                            companyCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            map.setCenter(companyCoords);
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: companyCoords,
                                image : markerImage
                            });
                        }
                    });

                    function info(result, status, restNm, restCate, restAdd) {
                        return function (result, status) {
                            if (status === kakao.maps.services.Status.OK) {
								let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								geocoder.addressSearch('<%=info.getMemAddr()%>', function (result, status) {
								companyCoords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                  
                                  
                                  
                                     if (coords.La <= companyCoords.La+0.009 && coords.La >= companyCoords.La-0.009) {
                              			if (coords.Ma <= companyCoords.Ma+0.01 && coords.Ma >= companyCoords.Ma-0.01) {
                                 
                                         // 결과값으로 받은 위치를 마커로 표시합니다
                                         let marker = new kakao.maps.Marker({
                                             map: map,
                                             position: coords
                                         });
         
                                         // 마커 위에 커스텀오버레이를 표시합니다
                                         // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                                         let overlay = new kakao.maps.CustomOverlay({
                                             // content: content,
                                             // map: map,
                                             position: marker.getPosition()
                                         });
         
                                         //overlay객체에 content 추가하는 함수
                                         overlay.setContent(createOverlayContent(overlay, restNm, restAdd, restCate));
         
                                         // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                                         kakao.maps.event.addListener(marker, 'click', mouseClickEventHandler(map, overlay));
         
                                         overlayList.push(overlay);
         
                                         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                         // map.setCenter(coords);
			                              }
			                           }
                                });
                            }
                        }
                    }
                    for (let i = 0; i < addressList.length; i++) {
                        let restNm = addressList[i].restNm;
                        let restCate = addressList[i].restCate;
                        let restAdd = addressList[i].restAdd;

                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch(restAdd, info(null, null, restNm, restCate, restAdd));
                    }
                }


                //마커별 오버레이를 생성 및 닫기버튼 이벤트를 적용하는 함수
                //오버레이의 구조를 변경하거나 디자인을 위한 클래스명을 추가하려면 이 함수 내에서 수정해야 함
                const createOverlayContent = function (overlay, restNm, restAdd, restCate) {

                    // HTML객체를 생성 : document.createElement(태그이름)
                    // HTML객체 클래스이름 설정 : document.createElement(태그이름).className = 추가할 클래스이름
                    // HTML객체의 자식요소로 추가 : 부모HTML객체.appendChild(자식HTML객체)
                    // HTML객체 스타일 적용 : HTML객체.style.스타일속성 = 값 ( * 크기값을 줄 경우 반드시 'px'나 'em' 단위를 작성해야 함 )
                    const divWrap = document.createElement("div");
                    divWrap.className = "wrap";

                    const divInfo = document.createElement("div");
                    divInfo.className = "info";

                    const divTitle = document.createElement("div");
                    divTitle.className = "title";
                    divTitle.textContent = restNm;

                    const divClose = document.createElement("div");
                    divClose.className = "close";
                    divClose.setAttribute("title", "닫기");
                    divClose.addEventListener("click", function () {
                        overlay.setMap(null);
                    });

                    const divBody = document.createElement("div");
                    divBody.className = "body";

                    const divEllipsis = document.createElement("div");
                    divEllipsis.className = "ellipsis";
                    divEllipsis.textContent = restAdd;

                    const divJibun = document.createElement("div");
                    divJibun.className = "jibun ellipsis";
                    divJibun.textContent = restCate;

                    //생성된 HTML객체를 하나씩 자식요소로 추가
                    divTitle.appendChild(divClose);
                    divBody.appendChild(divEllipsis);
                    divBody.appendChild(divJibun);
                    divInfo.appendChild(divTitle);
                    divInfo.appendChild(divBody);
                    divWrap.appendChild(divInfo);

                    return divWrap;

                }

                const mouseClickEventHandler = function (map, overlay) {
                    return function () {
                        overlay.setMap(map);
                    }
                }

            });

        </script>
    </div>
  </div>
</div>
<footer>
  <div class="container_12">
    <div class="grid_12"> Gourmet Traditional Restaurant &copy; 2045 | <a href="#">Privacy Policy</a> | Design by: <a href="http://www.templatemonster.com/">TemplateMonster.com</a> </div>
    <div class="clear"></div>
  </div>
</footer>
</body>
</html>