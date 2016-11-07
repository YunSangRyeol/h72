package com.project.h72.Search.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.Search.dao.SearchDao;
import com.project.h72.Search.service.SearchService;
import com.project.h72.Search.service.SearchServiceImp;
import com.project.h72.Search.vo.Search;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchController {
	@Autowired
	private SearchService ss;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value = "/bag", method = RequestMethod.GET)
	public String bagList(Model title, Model list) throws Exception {
		System.out.println("컨트롤러임니당");

		List<Search> bagList = ss.getBagList();
		System.out.println(bagList + "서비스에서 받아옴");

		String listTitle = "BAG";

		if (bagList.isEmpty()) {
			bagList = null;
		}
		list.addAttribute("bagList", bagList);
		title.addAttribute("listTitle", listTitle);

		// Search cate1 = SearchService.categoryBag(); return
		return "search/searchPage";
	}

	@RequestMapping(value = "/protect", method = RequestMethod.GET)
	public String protectList(Model title, Model list) throws Exception {
		List<Search> protectList = ss.getProtectList();
		System.out.println(protectList + "서비스에서 받아옴");

		String listTitle = "PROTECT";

		if (protectList.isEmpty()) {
			protectList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("protectList", protectList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String foodList(Model title, Model list) throws Exception {
		List<Search> foodList = ss.getFoodList();
		System.out.println(foodList + "서비스에서 받아옴");

		String listTitle = "FOOD";

		if (foodList.isEmpty()) {
			foodList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("foodList", foodList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/tool", method = RequestMethod.GET)
	public String toolList(Model title, Model list) throws Exception {
		List<Search> toolList = ss.getToolList();
		System.out.println(toolList + "서비스에서 받아옴");

		String listTitle = "TOOL";

		if (toolList.isEmpty()) {
			toolList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("toolList", toolList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etcList(Model title, Model list) throws Exception {
		List<Search> etcList = ss.getEtcList();
		System.out.println(etcList + "서비스에서 받아옴");

		String listTitle = "ETC";

		if (etcList.isEmpty()) {
			etcList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("etcList", etcList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(@RequestParam("keyword") String keyword, Model title, Model list) throws Exception {
		List<Search> searchList = ss.getSearchList(keyword);
		System.out.println(searchList);
		if (searchList.isEmpty()) {
			searchList = null;
		}
		title.addAttribute("listTitle", keyword);
		list.addAttribute("keywordList", searchList);

		return "search/searchPage";
	}

}
