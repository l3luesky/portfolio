<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<c:import url="/WEB-INF/views/main/inc/head.jsp"></c:import>


</head>

<body id="[##_body_id_##]">


	<div id="dkIndex">
		<!--ì¹ì ê·¼ì±ì© ë°ë¡ê°ê¸° ë§í¬ ëª¨ì-->
		<a href="#dkBody">ë³¸ë¬¸ ë°ë¡ê°ê¸°</a>
	</div>
	<div id="dkWrap" class="wrap_skin">
		<!-- ì¹´íê³ ë¦¬ë²í¼ í´ë¦­ì 'navi_on' í´ëì¤ ë¶ì¬ -->
		<div id="dkHead" role="banner" class="area_head">
			<h1 class="screen_out">l3luesky</h1>
			<button type="button" class="btn_cate">
				<span class="ico_skin ico_cate">메뉴버튼</span>
			</button>
			<div class="area_search ">
				<button type="button" class="btn_search">
					<span class="ico_skin ico_search">ê²ìíê¸°</span>
				</button>
				<s_search>
				<form action="#" method="get" class="frm_search box_search"
					onsubmit="[##_search_onclick_submit_##]">
					>
					<fieldset>
						<legend class="screen_out">ê²ìíê¸°</legend>
						<label for="[##_search_name_##]" class="lab_search screen_out">Search</label>
						<input type="text" name="[##_search_name_##]"
							id="[##_search_name_##]" class="tf_search" placeholder="Search"
							value="검색기능개발중" data-value="[##_search_text_##]">
						<span class="ico_skin ico_search"></span>
					</fieldset>
				</form>
				</s_search>
			</div>
			<div class="area_profile">
				<div class="tit_post">
					<a href="/com/main/index" class="link_post">l3luesky</a>
				</div>
				<span class="thumb_profile"> <img
					src="../img/portfolio/cake.png" class="img_profile"
					alt="íë¡íì¬ì§">
				</span> <span class="txt_profile">BLOG</span>
			</div>
		</div>
		<hr class="hide">
		<div id="dkContent" class="cont_skin" role="main">
			<div id="cMain">
				<div id="mFeature" class="wrap_sub">
					<div class="cont_sub">
						<div class="inner_sub">
							<div class="area_sub">
								<div role="navigation" class="area_navi">
								<ul class="tt_category">
									<c:import url="/WEB-INF/views/main/inc/tree.jsp"></c:import>
								</ul>

								</div>
								<div class="wrap_etc">
									<div class="col_aside left_side">
										<s_sidebar> <s_sidebar_element>
										<!-- ê³µì§ì¬í­ --> <s_rct_notice>
										<div class="box_aside">
											<strong class="tit_aside">Notice</strong>
											<ul class="list_board">
												<s_rct_notice_rep>
												<li><p class="link_board">Developing...</p></li>
												</s_rct_notice_rep>
											</ul>
										</div>
										</s_rct_notice> </s_sidebar_element> <s_sidebar_element> <!-- ìµê·¼ì ì¬ë¼ì¨ ê¸ -->
										<div class="box_aside">
											<strong class="tit_aside">Recent Posts</strong>
											<ul class="list_board">
												<s_rctps_rep>
<%-- 												<c:forEach items="${port}" var="list"> --%>
<%-- 													<li><a href="[##_rctps_rep_link_##]" class="link_board">${list.title}</a></li> --%>
<%-- 												</c:forEach> --%>
												</s_rctps_rep>
											</ul>
										</div>
										</s_sidebar_element>  <s_sidebar_element> <!-- ë§í¬ -->
										<div class="box_aside">
											<strong class="tit_aside">Link</strong>
											<ul class="list_board">
												<s_link_rep>
												<li><a href="http://www.github.com/" class="link_board"
													target="_blank">github</a></li>
													<li><a href="http://www.naver.com/" class="link_board"
													target="_blank">naver</a></li>
												</s_link_rep>
											</ul>
										</div>
										</s_sidebar_element> </s_sidebar>
									</div>

									<div class="col_aside right_side">
                                
                                    <s_sidebar_element>
                                        <!-- ê¸ ë³´ê´í¨ -->
                                    <div class="box_aside box_archive">
                                        <strong class="tit_aside">From</strong>
                                        <ul class="list_keep">
                                            <s_archive_rep>
                                            <li>Kim.jaemin</li>
                                            </s_archive_rep>
                                        </ul>
                                    </div>
                                    </s_sidebar_element>

									</div>
								</div>
							</div>
						</div>
						<button type="button" class="ico_skin btn_close">ë«ê¸°</button>

						<strong class="screen_out">ê´ë¦¬ ë©ë´</strong>
						<ul class="list_control">
							
							<li><a href="/com/main/index" class="ico_skin link_rss"
								title="RSS">RSS</a></li>
							
						</ul>
					</div>
				</div>
				<script src="../img/images/script.js"></script>
</body>
</html>
