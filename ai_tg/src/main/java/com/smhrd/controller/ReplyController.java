package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.entity.Contact;
import com.smhrd.entity.Reply;
import com.smhrd.mapper.ContactMapper;
import com.smhrd.mapper.ReplyMapper;

@Controller
public class ReplyController {

	@Autowired
	private ReplyMapper reMapper;
	@Autowired
	private ContactMapper conMapper;
	
	@PostMapping("insertReply.do")
	public String insertReply(Reply reply, RedirectAttributes reAttr) {
		Contact con = conMapper.getContact(reply.getCon_num());
		if (con.getCon_replyCheck().equals("답변대기")) {
			reMapper.insertReply(reply);
			conMapper.updateContact(reply.getCon_num());
			reAttr.addFlashAttribute("reInsert","답글 저장 완료");
		}else {
			System.out.println("false 입장===컨텐트=="+reply.getRe_content());
			System.out.println(reply.getCon_num());
			reMapper.updataReply(reply);
			reAttr.addFlashAttribute("successUpdate","답글을 수정하였습니다..");
		}
		return "redirect:/adminContactView.do?con_num="+reply.getCon_num();
	}
	
	@GetMapping("adminContactView.do")
	public String adminContactView(@RequestParam("con_num")String con_num, Model model) {
		int con_number = Integer.parseInt(con_num);
		Contact con = conMapper.getContact(con_number);
		Reply re = reMapper.getReply(con_number);
		System.out.println(re);
		if (re != null) {
			model.addAttribute("reply",re);
		}
		model.addAttribute("con", con);
		return "adminContactView";
	}
}

