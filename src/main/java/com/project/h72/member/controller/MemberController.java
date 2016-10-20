package com.project.h72.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "member/loginPage", method = RequestMethod.GET)
	public String loginPage(Locale locale, Model model) {
/*		단순 페이지 이동	*/		
		return "member/loginPage";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "home";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {

		return "home";
	}
	@RequestMapping(value = "member/memberJoin", method = RequestMethod.GET)
	public String mJoinPage(Locale locale, Model model) {
		/*		단순 페이지 이동	*/		
		return "member/memberJoin";
	}
	@RequestMapping(value = "/mJoin", method = RequestMethod.GET)
	public String mJoin(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "member/memberUpdate", method = RequestMethod.GET)
	public String mUpdatePage(Locale locale, Model model) {
		/*		단순 페이지 이동	*/		
		return "member/memberUpdate";
	}
	@RequestMapping(value = "/mUpdate", method = RequestMethod.GET)
	public String mUpdate(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/mDelete", method = RequestMethod.GET)
	public String mDelete(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "member/memberSearch", method = RequestMethod.GET)
	public String mSearchPage(Locale locale, Model model) {
			/*단순 페이지 이동*/
		return "member/memberSearch";
	}

	@RequestMapping(value = "member/idFindResult", method = RequestMethod.GET)
	public String idFindResult(Locale locale, Model model) {

		return "member/idFindResult";
	}

	@RequestMapping(value = "member/pwdFindResult", method = RequestMethod.GET)
	public String pwdFindResult(Locale locale, Model model) {

		return "member/pwdFindResult";
	}

}
