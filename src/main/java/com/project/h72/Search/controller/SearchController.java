package com.project.h72.Search.controller;

import java.text.DateFormat;
import java.sql.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.Search.service.SearchService;
import com.project.h72.Search.vo.Search;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	private SearchService ss;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/bag", method = RequestMethod.GET)
	public String bagList(Model title, Model list) throws Exception {
		List<Search> bagList = ss.getBagList();
		list.addAttribute("bagList", bagList);
		String listTitle = "BAG";
		title.addAttribute("listTitle", listTitle);

		// Search cate1 = SearchService.categoryBag();
		return "search/searchPage";
	}

	@RequestMapping(value = "/protect", method = RequestMethod.GET)
	public String protectList(String listTitle, Model model) {
		listTitle = "PROTECT";
		model.addAttribute("listTitle", listTitle);

		return "search/searchPage";
	}

	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String foodList(String listTitle, Model model) {
		listTitle = "FOOD";
		model.addAttribute("listTitle", listTitle);

		return "search/searchPage";
	}

	@RequestMapping(value = "/tool", method = RequestMethod.GET)
	public String toolList(String listTitle, Model model) {
		listTitle = "TOOL";
		model.addAttribute("listTitle", listTitle);

		return "search/searchPage";
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etcList(String listTitle, Model model) {
		listTitle = "ETC";
		model.addAttribute("listTitle", listTitle);

		return "search/searchPage";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("listTitle", keyword);

		return "search/searchPage";
	}

}
