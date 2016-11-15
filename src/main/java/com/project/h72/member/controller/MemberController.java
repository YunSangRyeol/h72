package com.project.h72.member.controller;

import java.text.DateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.*;

import org.apache.catalina.connector.Response;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project.h72.member.service.MemberService;
import com.project.h72.member.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "member/loginPage", method = RequestMethod.GET)
	public String loginPage(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/loginPage";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam("userid") String id, @RequestParam("userpass") String pass, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.out.println(id + " @@ " + pass);
		Member login = memberService.getUserInfo(new Member(id, pass));
		System.out.println(login);
		if (login != null) {
			session.setAttribute("loginUser", login);
			
			
		if(session.getAttribute("forPage") != null){
			if(session.getAttribute("forPage").equals("orderAll") || session.getAttribute("forPage").equals("directOrder")){

				System.out.println("member : "+session.getAttribute("forPage")+"?"+session.getAttribute("forQueryString"));
				return "redirect:/"+session.getAttribute("forPage")+"?"+session.getAttribute("forQueryString");
				
			}else if(session.getAttribute("forPage").equals("/order/order_list")){
				System.out.println("member : "+session.getAttribute("forPage"));
				return "redirect:/order/order_list";
			}
		}
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');</script>");
			writer.flush();
			return "member/loginPage";
		}
		
		
		return  "home";
	}
	

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");

		return "home";

	}

	@RequestMapping(value = "member/memberJoin", method = RequestMethod.GET)
	public String mJoinPage(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/memberJoin";
	}

	@RequestMapping(value = "/mJoin.do", method = RequestMethod.POST)
	public String mJoin(@RequestParam("userid") String id, @RequestParam("userpass") String pass,
			@RequestParam("userpass_confirm") String pass_confirm, @RequestParam("name") String name,
			@RequestParam("birthdate") Date birthdate, @RequestParam("postnum") String postnum,
			@RequestParam("address") String address, @RequestParam("addressdetail") String addressDetail,
			@RequestParam("phone") String phone, @RequestParam("email") String email, Model model, HttpServletResponse response) throws IOException {
		int mJoin = 0;
		System.out.println(id + ", " + pass + ", " + name + ", " + birthdate + ", " + email + ", " + phone + ", "
				+ postnum + ", " + address + ", " + addressDetail);		
		mJoin = memberService
				.insertMember(new Member(id, pass, name, birthdate, email, phone, postnum, address, addressDetail));
		System.out.println(mJoin + "@@@@Controller");
		model.addAttribute("joinResult", mJoin);
		return "home";
	}

	/*
	 * @RequestMapping(value = "member/memberUpdate", method =
	 * RequestMethod.GET) public String mUpdatePage(Locale locale, Model model)
	 * { 단순 페이지 이동 return "member/memberUpdate"; }
	 */

	@RequestMapping(value = "/mUpdate", method = RequestMethod.POST)
	public String mUpdate(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/mDelete", method = RequestMethod.POST)
	public String mDelete(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "member/idFindPage", method = RequestMethod.GET)
	public String mSearchIdPage(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/idFindPage";
	}

	@RequestMapping(value = "/searchId.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String mSearchID(@RequestParam("name") String name, @RequestParam("birthdate") Date birthdate, Model user)
			throws Exception {
		/* 아이디찾기 */
		System.out.println(name + "%%%%" + birthdate);
		Member searchId = memberService.getSearchId(new Member(name, birthdate));
		user.addAttribute("user", searchId);
		if(searchId == null){
			user.addAttribute("user", "-1");
		}
		System.out.println(user);

		return "member/idFindResult";
	}

	@RequestMapping(value = "member/pwdFindPage", method = RequestMethod.GET)
	public String mSearchPwPage(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/pwdFindPage";
	}

	@RequestMapping(value = "/searchPw.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String mSearchPW(@RequestParam("userid") String userid, @RequestParam("name") String name,
			@RequestParam("email") String email, Model user) throws Exception {
		/* 아이디찾기 */
		Member searchPw = memberService.getSearchPw(new Member(userid, name, email));

		user.addAttribute("user", searchPw);
		
		System.out.println(user);
		
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("h72shop@gmail.com");
		msg.setTo(new String[] { email });
		msg.setSubject("재난대비 용품점 h72, 귀하의 비밀번호 찾기 결과입니다.");
		msg.setText(searchPw.getName() + "님, 항상 이용해 주셔서 감사합니다! ^-^  귀하의 비밀번호는 [ " + searchPw.getUserpass() + " ] 입니다");

		try {
			mailSender.send(msg);
		} catch (MailException ex) {
			// 적절히 처리
		}
		

		return "member/pwdFindResult";
	}

	/* 아이디 중복검사 */
	@RequestMapping(value = "/chkDupId.do", method = RequestMethod.POST)
	@ResponseBody
	public int chkDupId(@RequestParam("userid") String userid, HttpSession session, HttpServletResponse response)
			throws IOException {
		int result = 0;
		try {

			result = memberService.chkDupId(userid);
			System.out.println(result);
			//response.getWriter().print("result");

		} catch (Exception e) {
			System.out.println("아이디 사용가능");
		} 
		return result;

	}

}