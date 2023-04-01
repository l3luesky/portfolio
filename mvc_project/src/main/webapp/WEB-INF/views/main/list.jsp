<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<c:import url="/WEB-INF/views/main/inc/head.jsp"></c:import>
</head>

<body id="[##_body_id_##]">
	<c:import url="/WEB-INF/views/main/index.jsp"></c:import>

	<div id="mArticle" class="article_skin">

		<s_list>
		<div class="list_title">
			<h2 id="dkBody" class="tit_skin">
				<span class="screen_out"></span><span class="txt_title">목록</span>
			</h2>
		</div>
		</s_list>

		<s_article_rep> <s_index_article_rep>
		<div class="list_content">
			<s_article_rep_thumbnail> <a
				href="[##_article_rep_link_##]" class="thumbnail_post"><img
				src="//i1.daumcdn.net/thumb/C150x150/?fname=[##_article_rep_thumbnail_raw_url_##]"></a>
			</s_article_rep_thumbnail>

			<a href="javascript:goView('${item.docId}');" class="link_post">
				<p class="txt_post">공지사항</p>
			</a>

		</div>
		</s_index_article_rep> <s_permalink_article_rep>
		<h2 id="dkBody" class="screen_out">[##_article_rep_title_##]
			ë³¸ë¬¸</h2>
		<div class="area_title">
			<strong class="tit_category"><a
				href="[##_article_rep_category_link_##]">[##_article_rep_category_##]</a></strong>
			<h3 class="tit_post">[##_article_rep_title_##]</h3>
			<span class="info_post">[##_article_rep_author_##] <span
				class="txt_bar"></span>[##_article_rep_date_##] <s_ad_div>
				<span class="txt_bar"></span>
				<a href="[##_s_ad_m_link_##]" class="link_detail">ìì </a> <span
					class="txt_bar"></span>
				<a href="#" onclick="[##_s_ad_s2_onclick_##]" class="link_detail">[##_s_ad_s1_label_##]</a>
				<span class="txt_bar"></span>
				<a href="#" onclick="[##_s_ad_d_onclick_##]" class="link_detail">ì­ì </a>
				</s_ad_div>
			</span>
		</div>

		<div class="area_view">[##_article_rep_desc_##]</div>
		<div class="area_etc">
			<s_tag_label>
			<dl class="list_tag">
				<dt>Tag</dt>
				<dd>[##_tag_label_rep_##]</dd>
			</dl>
			</s_tag_label>

			<strong class="screen_out">ê³µì íê¸° ë§í¬</strong>
			<ul class="list_share">
				<li><a href="#none" class="ico_skin link_fb"
					data-service="facebook">íì´ì¤ë¶</a></li>
				<li><a href="#none" class="ico_skin link_ks"
					data-service="kakaostory">ì¹´ì¹´ì¤ì¤í ë¦¬</a></li>
				<li><a href="#none" class="ico_skin link_tw"
					data-service="twitter">í¸ìí°</a></li>
			</ul>
		</div>

		<s_article_related>
		<div class="area_related">
			<strong class="tit_related">'[##_article_rep_category_##]'
				Related Articles</strong>
			<ul class="list_related">
				<s_article_related_rep>
				<li class="[##_article_related_rep_type_##]"><a
					href="[##_article_related_rep_link_##]" class="link_related"> <s_article_related_rep_thumbnail>
						<span class="thumb_related"> <img
							src="//i1.daumcdn.net/thumb/C185x200/?fname=[##_article_related_rep_thumbnail_link_##]"
							class="img_related" alt="">
						</span> </s_article_related_rep_thumbnail> <span class="txt_related">[##_article_related_rep_title_##]</span>
						<span class="date_related">[##_article_related_rep_date_##]</span>
						<span class="frame_related"></span>
				</a></li>
				</s_article_related_rep>
			</ul>
			<a href="[##_article_rep_category_link_##]" class="link_more">more</a>
		</div>
		</s_article_related>

		<div class="area_reply">
			<strong class="tit_reply"><s_rp_count>[##_article_rep_rp_cnt_##]</s_rp_count>
				Comments</strong>
			<s_rp> <s_rp_container>
			<ul class="list_reply">
				<s_rp_rep>
				<li id='[##_rp_rep_id_##]' class="[##_rp_rep_class_##]"><span
					class="ico_skin thumb_profile"> <img
						src="//i1.daumcdn.net/thumb/C96x96/?fname=[##_rp_rep_logo_##]"
						width="48" height="48" class="img_profile" alt="íë¡íì¬ì§">
				</span> <span class="reply_content"> <span class="tit_nickname">[##_rp_rep_name_##]</span>
						<span class="txt_date">[##_rp_rep_date_##]</span> <span
						class="txt_reply">[##_rp_rep_desc_##]</span>
				</span>
					<div class="area_more">
						<!-- on_more í´ëì¤ ì¶ê°ì ë ì´ì´ ì¤í -->
						<a href="#none" class="more_reply"> <span
							class="ico_skin ico_more">ëê¸ ë©ë´ ë³´ê¸°</span>
						</a>
						<div class="reply_layer">
							<div class="inner_reply_layer">
								<div class="layer_head">
									<strong class="screen_out">ëê¸ë©ë´</strong>
								</div>
								<div class="layer_body">
									<a href="[##_rp_rep_link_##]" class="link_reply">ëê¸ì£¼ì</a>
									<a href="#none" onclick="[##_rp_rep_onclick_delete_##]"
										class="link_reply">ìì /ì­ì </a> <a href="#none"
										onclick="[##_rp_rep_onclick_reply_##]" class="link_reply">ëê¸ì°ê¸°</a>
								</div>
							</div>
						</div>
					</div></li>

				<s_rp2_container> <s_rp2_rep>
				<li id='[##_rp_rep_id_##]' class="re_reply [##_rp_rep_class_##]">
					<span class="ico_skin thumb_profile"> <img
						src="//i1.daumcdn.net/thumb/C96x96/?fname=[##_rp_rep_logo_##]"
						width="48" height="48" class="img_profile" alt="íë¡íì¬ì§">
				</span> <span class="reply_content"> <span class="tit_nickname">[##_rp_rep_name_##]</span>
						<span class="txt_date">[##_rp_rep_date_##]</span> <span
						class="txt_reply">[##_rp_rep_desc_##]</span>
				</span>
					<div class="area_more">
						<!-- on_more í´ëì¤ ì¶ê°ì ë ì´ì´ ì¤í -->
						<a href="#none" class="more_reply"> <span
							class="ico_skin ico_more">ëê¸ ë©ë´ ë³´ê¸°</span>
						</a>
						<div class="reply_layer">
							<div class="inner_reply_layer">
								<div class="layer_head">
									<strong class="screen_out">ëê¸ë©ë´</strong>
								</div>
								<div class="layer_body">
									<a href="[##_rp_rep_link_##]" class="link_reply">ëê¸ì£¼ì</a>
									<a href="#none" onclick="[##_rp_rep_onclick_delete_##]"
										class="link_reply">ìì /ì­ì </a>
								</div>
							</div>
						</div>
					</div>
				</li>
				</s_rp2_rep> </s_rp2_container> </s_rp_rep>

			</ul>
			</s_rp_container> <s_rp_input_form>
			<fieldset class="fld_reply">
				<legend class="screen_out">ëê¸ì°ê¸° í¼</legend>
				<s_rp_member> <s_rp_guest>
				<div class="writer_info">
					<span class="info_name"> <label for="[##_rp_input_name_##]"
						class="lab_info screen_out">ì´ë¦</label> <span class="wrap_info">
							<input type="text" name="[##_rp_input_name_##]"
							id="[##_rp_input_name_##]" class="inp_info" placeholder="Name"
							tabindex="1">
					</span>
					</span> <span class="info_pw "> <label
						for="[##_rp_input_password_##]" class="lab_info screen_out">ë¹ë°ë²í¸</label>
						<span class="wrap_info"> <input type="password"
							name="[##_rp_input_password_##]" id="[##_rp_input_password_##]"
							class="inp_info" placeholder="Password" tabindex="2">
					</span>
					</span>
				</div>
				</s_rp_guest>
				<div class="writer_check">
					<span class="check_secret "> <input type="checkbox"
						name="[##_rp_input_is_secret_##]" id="[##_rp_input_is_secret_##]"
						class="inp_secret" tabindex="4"> <label
						for="[##_rp_input_is_secret_##]" class="lab_secret"> <span
							class="ico_skin ico_check"></span> Secret
					</label>
					</span>
				</div>
				</s_rp_member>

				<div class="reply_write ">
					<label for="[##_rp_input_comment_##]" class="lab_write screen_out">ë´ì©</label>
					<textarea name="[##_rp_input_comment_##]"
						id="[##_rp_input_comment_##]" class="tf_reply"
						placeholder="ì¬ë¬ë¶ì ìì¤í ëê¸ì ìë ¥í´ì£¼ì¸ì"
						tabindex="3"></textarea>
				</div>

				<div class="writer_btn">
					<button type="submit" class="btn_enter"
						onclick="[##_rp_onclick_submit_##]" tabindex="5">Send</button>
				</div>
			</fieldset>
			</s_rp_input_form> </s_rp>
		</div>


		</s_permalink_article_rep> </s_article_rep>

		<s_notice_rep> <s_index_article_rep>
		<div class="list_content">
			<a href="[##_notice_rep_link_##]" class="link_post"> <strong
				class="tit_post ">[##_notice_rep_title_##]</strong>
				<p class="txt_post">[##_notice_rep_summary_##]</p>
			</a>
			<div class="detail_info">
				<a href="/notice" class="link_cate">ê³µì§ì¬í­</a> <span
					class="txt_bar"></span> [##_notice_rep_date_##]
			</div>
		</div>
		</s_index_article_rep> <s_permalink_article_rep>
		<h2 id="dkBody" class="screen_out">[##_notice_rep_title_##]
			ë³¸ë¬¸</h2>
		<div class="area_title">
			<strong class="tit_category"><a href="/notice">ê³µì§ì¬í­</a></strong>
			<h3 class="tit_post">[##_notice_rep_title_##]</h3>
			<span class="info_post">[##_notice_rep_author_##] <span
				class="txt_bar"></span>[##_notice_rep_date_##]
			</span>
		</div>

		<div class="area_view">[##_notice_rep_desc_##]</div>
		</s_permalink_article_rep> </s_notice_rep>

		<s_article_protected> <s_index_article_rep>
		<div class="list_content">
			<a href="[##_article_rep_link_##]" class="link_post"> <strong
				class="tit_post ">[##_article_rep_title_##]</strong>
				<p class="txt_post">ë³´í¸ëì´ ìë ê¸ìëë¤.</p>
			</a>
			<div class="detail_info">
				<a href="[##_article_rep_category_link_##]" class="link_cate">[##_article_rep_category_##]</a>
				<span class="txt_bar"></span> [##_article_rep_date_##]
			</div>
		</div>
		</s_index_article_rep> <s_permalink_article_rep>
		<h2 id="dkBody" class="screen_out">[##_article_rep_title_##]
			ë³¸ë¬¸</h2>
		<div class="area_title">
			<strong class="tit_category"><a
				href="[##_article_rep_category_link_##]">[##_article_rep_category_##]</a></strong>
			<h3 class="tit_post">[##_article_rep_title_##]</h3>
			<span class="info_post">[##_article_rep_author_##] <span
				class="txt_bar"></span>[##_article_rep_date_##]
			</span>
		</div>

		<form class="protected_form" onsubmit="[##_article_dissolve_##]">
			<p>
				ë³´í¸ëì´ ìë ê¸ìëë¤.<br>ë´ì©ì ë³´ìë ¤ë©´
				ë¹ë°ë²í¸ë¥¼ ìë ¥íì¸ì.
			</p>
			<input type="password" id="[##_article_password_##]"
				name="[##_article_password_##]" value="" placeholder="ë¹ë°ë²í¸" />
			<button type="submit">íì¸</button>
		</form>
		</s_permalink_article_rep> </s_article_protected>

		<s_tag>
		<h2 id="dkBody" class="tit_skin">
			<span class="txt_title">Tags</span>
		</h2>
		<ul class="list_tag">
			<s_tag_rep>
			<li><a href="[##_tag_link_##]"
				class="link_tag [##_tag_class_##]">[##_tag_name_##]</a></li>
			</s_tag_rep>
		</ul>
		</s_tag>

		<s_guest>
		<h2 id="dkBody" class="tit_skin">
			<span class="txt_title">Guestbook</span>
		</h2>
		<div class="area_reply">
			<s_guest_input_form>
			<fieldset class="fld_reply">
				<legend class="screen_out">ë°©ëªë¡ì°ê¸° í¼</legend>
				<s_guest_member> <s_guest_form>
				<div class="writer_info">
					<span class="info_name"> <label
						for="[##_guest_input_name_##]" class="lab_info screen_out">ì´ë¦</label>
						<span class="wrap_info"> <input type="text"
							name="[##_guest_input_name_##]" id="[##_guest_input_name_##]"
							class="inp_info" placeholder="Name" tabindex="1">
					</span>
					</span> <span class="info_pw "> <label
						for="[##_guest_input_password_##]" class="lab_info screen_out">ë¹ë°ë²í¸</label>
						<span class="wrap_info"> <input type="password"
							name="[##_guest_input_password_##]"
							id="[##_guest_input_password_##]" class="inp_info"
							placeholder="Password" tabindex="2">
					</span>
					</span>
				</div>
				</s_guest_form>
				<div class="writer_check">
					<span class="check_secret "> <input type="checkbox"
						name="[##_guest_input_is_secret_##]"
						id="[##_guest_input_is_secret_##]" class="inp_secret" tabindex="4">
						<label for="[##_guest_input_is_secret_##]" class="lab_secret">
							<span class="ico_skin ico_check"></span> Secret
					</label>
					</span>
				</div>
				</s_guest_member>

				<div class="reply_write ">
					<label for="[##_guest_input_comment_##]"
						class="lab_write screen_out">ë´ì©</label>
					<textarea name="[##_guest_input_comment_##]"
						id="[##_guest_input_comment_##]" class="tf_reply"
						placeholder="ì¬ë¬ë¶ì ìì¤í ëê¸ì ìë ¥í´ì£¼ì¸ì"
						tabindex="3"></textarea>
				</div>

				<div class="writer_btn">
					<button type="submit" class="btn_enter"
						onclick="[##_guest_onclick_submit_##]" tabindex="5">Send</button>
				</div>
			</fieldset>
			</s_guest_input_form>


			<s_guest_container>
			<ul class="list_reply">
				<s_guest_rep>
				<li id='[##_guest_rep_id_##]' class="[##_guest_rep_class_##]">
					<span class="ico_skin thumb_profile"></span> <span
					class="reply_content"> <span class="tit_nickname">[##_guest_rep_name_##]</span>
						<span class="txt_date">[##_guest_rep_date_##]</span> <span
						class="txt_reply">[##_guest_rep_desc_##]</span>
				</span>
					<div class="area_more">
						<!-- on_more í´ëì¤ ì¶ê°ì ë ì´ì´ ì¤í -->
						<a href="#none" class="more_reply"> <span
							class="ico_skin ico_more">ëê¸ ë©ë´ ë³´ê¸°</span>
						</a>
						<div class="reply_layer">
							<div class="inner_reply_layer">
								<div class="layer_head">
									<strong class="screen_out">ëê¸ë©ë´</strong>
								</div>
								<div class="layer_body">
									<a href="#none" onclick="[##_guest_rep_onclick_delete_##]"
										class="link_reply">ìì /ì­ì </a> <a href="#none"
										onclick="[##_guest_rep_onclick_reply_##]" class="link_reply">ëê¸ì°ê¸°</a>
								</div>
							</div>
						</div>
					</div>
				</li>

				<s_guest_reply_container> <s_guest_reply_rep>
				<li id='[##_guest_rep_id_##]'
					class="re_reply [##_guest_rep_class_##]"><span
					class="ico_skin thumb_profile"></span> <span class="reply_content">
						<span class="tit_nickname">[##_guest_rep_name_##]</span> <span
						class="txt_date">[##_guest_rep_date_##]</span> <span
						class="txt_reply">[##_guest_rep_desc_##]</span>
				</span>
					<div class="area_more">
						<!-- on_more í´ëì¤ ì¶ê°ì ë ì´ì´ ì¤í -->
						<a href="#none" class="more_reply"> <span
							class="ico_skin ico_more">ëê¸ ë©ë´ ë³´ê¸°</span>
						</a>
						<div class="reply_layer">
							<div class="inner_reply_layer">
								<div class="layer_head">
									<strong class="screen_out">ëê¸ë©ë´</strong>
								</div>
								<div class="layer_body">
									<a href="#none" onclick="[##_guest_rep_onclick_delete_##]"
										class="link_reply">ìì /ì­ì </a>
								</div>
							</div>
						</div>
					</div></li>
				</s_guest_reply_rep> </s_guest_reply_container> </s_guest_rep>

			</ul>
			</s_guest_container>
		</div>
		</s_guest>

		<s_paging>
		<div class="area_paging">
			<span class="inner_paging"> <a
				[##_prev_page_##] class="btn_prev [##_no_more_prev_##]"><span
					class="ico_skin ico_prev"></span>Prev</a> <s_paging_rep>
				<a [##_paging_rep_link_##] class="link_page">[##_paging_rep_link_num_##]</a>
				</s_paging_rep> <a [##_next_page_##] class="btn_next [##_no_more_next_##]">Next<span
					class="ico_skin ico_next"></span></a>
			</span>
		</div>
		</s_paging>
	</div>
	</div>
	</div>
	<hr class="hide">
	<div id="dkFoot" role="contentinfo" class="area_foot">
		<small class="info_copyright"> Blog is powered by <a
			href="http://www.kakaocorp.com" class="emph_t" target="_blank">kakao</a>
			/ Designed by <a href="http://www.tistory.com" class="emph_t"
			target="_blank">Tistory</a>
		</small>
	</div>
	</div>


	</s_t3>
	<script src="./images/script.js"></script>

</body>
</html>