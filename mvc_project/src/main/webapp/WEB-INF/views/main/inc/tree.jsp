<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="/com/js/dtree/dtree.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		getTree();
	});
	
	function getTree(){
		var url = "/com/main/inc/tree";
		$.post(url, function(data){
			if($.isArray(data)){
				dTree = new dTree('dTree');
				
				$(data).each(function(){
					if(this.parMapId == null){
						dTree.add(this.mapId, -1, this.mapNm);
					}else{
						dTree.add(this.mapId, this.parMapId, this.mapNm, "/com/blue/gong?mapId="+this.mapId);
					}
				});
				
				// 선택한 맵메뉴 하이라이트 삭제
				dTree.clearCookie();
				
				$("#dtree").html(dTree.toString());
			}
		});
	}
	
	function getList(mapId){
		$("#header li a").removeClass("on");
		$("#header li a[data="+mapId+"]").addClass("on");
		
		dTree.s(mapId-1);
		var url = "/com/blue/gong";
		$.post(url, {mapId : mapId}, function(data){
			$("#rightBlock").html(data);
		});
	}
	
</script>

<div id="">
	<div class="dtree" id="dtree">
	</div>
</div>
