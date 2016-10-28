package com.project.h72.member.controller;

import java.text.DateFormat;
import java.sql.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.member.service.MemberService;
import com.project.h72.member.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

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
	public String login(@RequestParam("userid") String id, @RequestParam("userpass") String pass, HttpSession session)
			throws Exception {
		System.out.println(id + " @@ " + pass);
		Member login = memberService.getUserInfo(new Member(id, pass));
		if (login != null) {
			session.setAttribute("loginUser", login);
			System.out.println(login + "!@#!@#@!#!@#@!#!@#@!#@!#@!#@!#@!#@!#@!#");
		}
		return "home";
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
			@RequestParam("phone") String phone, @RequestParam("email") String email, HttpSession session) {
		int mJoin = 0;
		System.out.println(id + ", " + pass + ", " + name + ", " + birthdate + ", " + email + ", " + phone + ", "
				+ postnum + ", " + address + ", " + addressDetail);
			mJoin = memberService.insertMember(
					new Member(id, pass, name, birthdate, email, phone, postnum, address, addressDetail));
			System.out.println(mJoin + "@@@@Controller");

		return "home";
	}

	@RequestMapping(value = "member/memberUpdate", method = RequestMethod.GET)
	public String mUpdatePage(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/memberUpdate";
	}

	@RequestMapping(value = "/mUpdate", method = RequestMethod.POST)
	public String mUpdate(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/mDelete", method = RequestMethod.POST)
	public String mDelete(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "member/idFindPage", method = RequestMethod.GET)
	public String mSearchID(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/idFindPage";
	}

	@RequestMapping(value = "member/pwdFindPage", method = RequestMethod.GET)
	public String mSearchPW(Locale locale, Model model) {
		/* 단순 페이지 이동 */
		return "member/pwdFindPage";
	}

	@RequestMapping(value = "member/idFindResult", method = RequestMethod.POST)
	public String idFindResult(Locale locale, Model model) {

		return "member/idFindResult";
	}

	@RequestMapping(value = "member/pwdFindResult", method = RequestMethod.POST)
	public String pwdFindResult(Locale locale, Model model) {

		return "member/pwdFindResult";
	}

}
