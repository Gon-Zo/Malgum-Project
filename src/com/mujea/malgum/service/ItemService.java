package com.mujea.malgum.service;

import java.util.Map;

import com.mujea.malgum.vo.Item;

public interface ItemService {
	
	Map<String, Object> getItems(String order, int page, String problem, String second, String skin, String age,String gender);
	public Map<String, Object> getItem(int no);
	public Map<String, Object> getItemReviewList(int pageNo, String order, int itemNo, int filterScore, String reviewTypeStr, int loginUser);
	public boolean updateItemType(int itemNo, String type);
	public void regItem(Item item, int[] warnNo, int[] prob);
	public Map<String, Object> searchItems(int pageNo , String title , String order);
	public Map<String, Object> corporationItems(int pageNo , int userNo);
}//ItemService end
