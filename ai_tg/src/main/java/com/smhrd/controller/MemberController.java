package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.entity.Member;
import com.smhrd.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	/*
	 * home버튼 클릭시 index페이지로 이동
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String indexdo() {
		return "index";
	}
	
	/*
	 * manual버튼 클릭시 manual페이지로 이동
	 */
	@RequestMapping(value = "/manual.do", method = RequestMethod.GET)
	public String manualdo() {
		return "manual";
	}
	
	/*
	 * service버튼 클릭시 upload페이지로 이동
	 */
	@RequestMapping(value = "/upload.do", method = RequestMethod.GET)
	public String uploaddo() {
		return "upload";
	}
	/*
	 * upload 페이지에서 submit 버튼 클릭시 uploadView페이지로 이동
	 */
	@RequestMapping(value = "/uploadView.do", method = RequestMethod.GET)
	public String uploadViewdo() {
		return "uploadView";
	}
	
	/*
	 * service 버튼 클릭시 contact페이지로 이동
	 */
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String supportdo() {
		return "contact";
	}
	
	/*
	 * pricing 버튼 클릭시 pricing페이지로 이동
	 */
	@RequestMapping(value = "/pricing.do", method = RequestMethod.GET)
	public String pricingdo() {
		return "pricing";
	}
	
	/*
	 * 회원정보수정버튼 클릭시 회원정보수정페이지로 이동
	 */
	@RequestMapping(value = "/memberEdit.do", method = RequestMethod.GET)
	public String memberEditdo() {
		return "memberEdit";
	}
	
	/*
	 * 로그인버튼 클릭시 로그인페이지로 이동
	 */
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	@RequestMapping(value = "/serviceToSignup.do", method = RequestMethod.GET)
	public String serviceToSignup(RedirectAttributes rediatt) {
		rediatt.addFlashAttribute("serviceToSignup","로그인 후 서비스 이용이 가능합니다.");
		return "redirect:signup.do";
	}
	
	/*
	 * 회원가입 데이터 저장
	 */
	@RequestMapping(value = "/memberInsert.do", method = RequestMethod.POST)
	public String memberInsert(Member member, RedirectAttributes redirectAttributes) {
		mapper.memberInsert(member);
		redirectAttributes.addFlashAttribute("memberInsert","회원가입이 완료되었습니다.");
		return "redirect:/index.do";
	}
	/*
	 * 회원 정보 수정
	 */
	@PostMapping(value = "/updateInfo.do")
	public String updateInfo(HttpSession session,Member member,RedirectAttributes redirectAttributes) {
		mapper.updateInfo(member);
		System.out.println("member.getMem_num()==="+member.getMem_num());
		Member m = mapper.selectData(member.getMem_num());
		session.setAttribute("session", m);
		redirectAttributes.addFlashAttribute("message","회원정보가 수정되었습니다.");
		return "redirect:/index.do";
	}
	/*
	 * flask 테스트
	 */
	@RequestMapping(value = "/flask.do", method = RequestMethod.GET)
	public String flask() {
		return "flask";
	}
	@RequestMapping(value = "/flaskSubmit.do", method = RequestMethod.GET)
	public String flaskSubmit(String test) {
		return "flaskResult";
	}
	/*
	 * 로그인
	 */
	@PostMapping("/memberLogin.do")
	public @ResponseBody int memLogin(HttpSession session,String mem_id,String mem_pw) {
		if (mem_id.equals("")) {
			return 0;
		}else if(mem_pw.equals("")) {
			return 1;
		}else {
			if (mem_id.equals("admin")) {
				Member admin = mapper.memberLogin(mem_id);
				if (admin.getMem_pw().equals(mem_pw)) {
					session.setAttribute("session", admin);
					return 5;
				} else {
					return 3;
				}
			}else {
				Member resultMember = mapper.memberLogin(mem_id);
				if (resultMember != null) {
					if (resultMember.getMem_pw().equals(mem_pw)) {
						session.setAttribute("session", resultMember);
						return 5;
					}else {
						return 3;
					}
					
				}else {
					return 2;
				}
			}
		}
	}
	/*
	 * 로그아웃
	 */
	@RequestMapping("/memberLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	/*
	 * 중복체크
	 * return 0 >> 중복 아이디 없음
	 * return 1 >> 중복 아이디 있음
	 * return 2 >> 입력된 아이디 없음
	 */
	@GetMapping("/registerCheck.do")
	public @ResponseBody int registerCheck(@RequestParam("mem_id") String mem_id) {
		if (mem_id.equals("")) {
			return 2;
		}else {
			Member m = mapper.memberLogin(mem_id);
			if (m != null) {
				return 1;
			}else {
				return 0;
			}
		}
	}
}





