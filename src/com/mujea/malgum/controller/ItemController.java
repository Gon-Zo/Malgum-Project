package com.mujea.malgum.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mujea.malgum.service.ItemService;
import com.mujea.malgum.vo.Item;

@Controller
public class ItemController {

	private ItemService itemService;

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping(value = "/items", method = RequestMethod.GET)
	public String itemMain() {

		return "item_main";
	}

	@RequestMapping(value = "/ajax/items/page", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getItems(String order, int page, String second, String skin, String age, String problem,
			String gender) {

		return itemService.getItems(order, page, problem, second, skin, age, gender);

	}

	@RequestMapping(value = "/item/{no}", method = RequestMethod.GET)
	public String itemDetail(Model model, @PathVariable int no) {

		// 아이템 번호로 바로 아이템 불러옴.
		// model.addAttribute("item_no",no);
		System.out.println(no);
		model.addAllAttributes(itemService.getItem(no));

		return "item_detail";
	}

	@RequestMapping(value = "/ajax/item/review/{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxItemReviewList(@PathVariable int pageNo, String order, int itemNo, int filterScore,
			String reviewTypeStr, int loginUser) {
		// System.out.println("여기 출력");
		return itemService.getItemReviewList(pageNo, order, itemNo, filterScore, reviewTypeStr, loginUser);
	}

	@RequestMapping(value = "/item/type/{itemNo}/{type}", method = RequestMethod.GET)
	public String ajaxItemType(@PathVariable String type, @PathVariable int itemNo, @RequestHeader String referer) {
		System.out.println(itemService.updateItemType(itemNo, type));
		// return "redirect:/item/"+itemNo;
		return "redirect:" + referer;
	}

	@RequestMapping(value = "/item/write", method = RequestMethod.GET)
	public String itemRegister() {
		System.out.println("GET/item_write");
		return "item_write";
	}

	@RequestMapping(value = "/write/success", method = RequestMethod.POST)
	public String itemInsert(Item item, int[] warnNo, int[] probNo) {
		System.out.println("POST/success");

		itemService.regItem(item, warnNo, probNo);

		return "redirect:/items";
	}

	@RequestMapping(value = "/ajax/search/items/page", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchItems(int pageNo, String title, String order) {
		System.out.println("pageNo 컨트롤러:: " + pageNo);
		System.out.println("pageNo 컨트롤러:: " + title);
		System.out.println("pageNo 컨트롤러:: " + order);
		return itemService.searchItems(pageNo, title, order);
	}

	@RequestMapping(value = "/search/items/{title}/{count}", method = RequestMethod.GET)
	public String searchMain(@PathVariable String title, @PathVariable int count, Model model) {
		if (title != "undefined") {
			model.addAttribute("title", title);
			model.addAttribute("count", count);
		} else {
			model.addAttribute("title", null);
			model.addAttribute("count", 0);
		}
		return "search_product";
	}

	// 회사의 제품 관리
	@RequestMapping(value = "/items/{id}", method = RequestMethod.GET)
	public String eventAdmin(@PathVariable String id) {

		return "corporation_product_main";

	}// eventAdmin() end

	@RequestMapping(value = "/ajax/corporation/items/page/{pageNo}/{loginUser}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getItems(@PathVariable int loginUser, @PathVariable int pageNo) {
		return itemService.corporationItems(pageNo, loginUser);

	}

}// ItemController end
