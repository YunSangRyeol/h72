package com.project.h72.Search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String bagList(HttpServletRequest request, Model title, Model list) throws Exception {

		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="bag";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate);
		List<Search> bagList = ss.getBagList(currentPage, limit);
		System.out.println(bagList + "서비스에서 받아옴");

		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		String listTitle = "BAG";

		if (bagList.isEmpty()) {
			bagList = null;
		}
		list.addAttribute("bagList", bagList);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);

		title.addAttribute("listTitle", listTitle);

		// Search cate1 = SearchService.categoryBag(); return
		return "search/searchPage";
	}

	@RequestMapping(value = "/protect", method = RequestMethod.GET)
	public String protectList(HttpServletRequest request, Model title, Model list) throws Exception {
		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="protect";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate);
		List<Search> protectList = ss.getProtectList(currentPage, limit);
		System.out.println(protectList + "서비스에서 받아옴");

		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		String listTitle = "PROTECT";

		if (protectList.isEmpty()) {
			protectList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);
		list.addAttribute("protectList", protectList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String foodList(HttpServletRequest request, Model title, Model list) throws Exception {
		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="food";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate);
		List<Search> foodList = ss.getFoodList(currentPage, limit);
		System.out.println(foodList + "서비스에서 받아옴");

		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		String listTitle = "FOOD";

		if (foodList.isEmpty()) {
			foodList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);
		list.addAttribute("foodList", foodList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/tool", method = RequestMethod.GET)
	public String toolList(HttpServletRequest request, Model title, Model list) throws Exception {
		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="tool";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate);
		List<Search> toolList = ss.getToolList(currentPage, limit);
		System.out.println(toolList + "서비스에서 받아옴");

		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		String listTitle = "TOOL";

		if (toolList.isEmpty()) {
			toolList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);
		list.addAttribute("toolList", toolList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/etc", method = RequestMethod.GET)
	public String etcList(HttpServletRequest request, Model title, Model list) throws Exception {
		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="etc";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate);
		List<Search> etcList = ss.getEtcList(currentPage, limit);
		System.out.println(etcList + "서비스에서 받아옴");

		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		String listTitle = "ETC";

		if (etcList.isEmpty()) {
			etcList = null;
		}
		title.addAttribute("listTitle", listTitle);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);
		list.addAttribute("etcList", etcList);

		return "search/searchPage";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(HttpServletRequest request, @RequestParam("itemName") String itemName, Model title,
			Model list) throws Exception {
		// 페이지 수 처리용 변수
		int currentPage = 1;
		int limit = 8; // 한 페이지에 8개씩 출력
		String cate="keyword";

		// 전달받은 페이지 값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int listCount = ss.getListCount(currentPage, limit, cate, itemName);
		System.out.println("컨트롤러 카운트 + " + listCount);

		List<Search> searchList = ss.getSearchList(itemName,currentPage, limit);
		System.out.println("컨트롤러 +"+searchList);


		// 총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		String listTitle = itemName;
		
		if (searchList.isEmpty()) {
			searchList = null;
		}
		title.addAttribute("listTitle", itemName);
		list.addAttribute("startPage", startPage);
		list.addAttribute("currentPage", currentPage);
		list.addAttribute("maxPage", maxPage);
		list.addAttribute("endPage", endPage);
		list.addAttribute("keywordList", searchList);

		return "search/searchPage";
	}

}
