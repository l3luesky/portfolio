package com.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.entity.Contact;
import com.smhrd.entity.Member;
import com.smhrd.entity.Reply;
import com.smhrd.mapper.ContactMapper;
import com.smhrd.mapper.ReplyMapper;

@Controller
public class ContactController {

	@Autowired
	private ContactMapper mapper;
	@Autowired
	private ReplyMapper reMapper;
	
	@PostMapping("/insertQues.do")
	public String insertQues(Contact con,HttpSession session, RedirectAttributes reatt, String mem_id) {
		System.out.println("con.getMem_num()==="+con.getMem_num());
		if (con.getMem_num()==0) {
			if (mem_id.equals("")) {
				reatt.addFlashAttribute("idnone", "아이디를 입력해주세요.");
				return "redirect:/contact.do";
			} else {
				Member m = mapper.selectTest(mem_id);
				if (m != null) {
					con.setMem_num(m.getMem_num());
					mapper.insertQues(con);
					reatt.addFlashAttribute("insertQ","문의 완료");
					return "redirect:/index.do";
				} else {
					reatt.addFlashAttribute("nullId","입력하신 아이디가 없습니다.");
					return "redirect:/contact.do";
				}
			}
		}else {
			Member m = mapper.selectMem(con.getMem_num());
			if (m != null) {
				mapper.insertQues(con);
				reatt.addFlashAttribute("insertQ","문의 완료");
				session.setAttribute("session", m);
				return "redirect:/index.do";
			}else {
				reatt.addFlashAttribute("nullId","입력하신 아이디가 없습니다.");
				return "redirect:/contact.do";
			}
		}
	}
	@GetMapping("/contactList.do")
	public String contactList(@RequestParam("mem_num") String mem_num,Model model) {
		int number = Integer.parseInt(mem_num);
		if (number == 3) {
			List<Contact> conList = mapper.getList(number);
			model.addAttribute("conList", conList);
		} else {
			List<Contact> conList = mapper.contactList(number);
			model.addAttribute("conList", conList);
		}
		return "testList";
	}
	
	@GetMapping("contactView.do")
	public String contactView(@RequestParam("con_num") String con_num, Model model){
		int con_number = Integer.parseInt(con_num);
		Contact con = mapper.getContact(con_number);
		Reply re = reMapper.getReply(con.getCon_num());
		if (re != null) {
			model.addAttribute("reply", re);
		}
		model.addAttribute("con", con);
		return "contactView";
	}
	
	@GetMapping("goReply.do")
	public String goReply(@RequestParam("con_num") String con_num, Model model){
		int con_number = Integer.parseInt(con_num);
		Contact con = mapper.getContact(con_number);
		Reply re = reMapper.getReply(con.getCon_num());
		if (re != null) {
			model.addAttribute("reply", re);
		}
		model.addAttribute("con", con);
		return "adminContactView";
	}
}




