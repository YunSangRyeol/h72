package com.project.h72.Search.controller;

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
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/bag", method = RequestMethod.GET)
	public String bagList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

	@RequestMapping(value = "/protect", method = RequestMethod.GET)
	public String protectList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String foodList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

	@RequestMapping(value = "/tool", method = RequestMethod.GET)
	public String toolList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etcList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime");

		return null;
	}

}
