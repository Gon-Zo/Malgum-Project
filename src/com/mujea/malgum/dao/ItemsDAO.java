package com.mujea.malgum.dao;

import java.util.List;
import java.util.Map;

import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.PageVO;

public interface ItemsDAO {

	public List<Item> selectItemList(String title);

	public List<Item> selectList(FilterVO filterVO);

	public int selectTotal();

	public Item selectOne(int no);

	public int updateItemType(Map<String, Object> itemTypeMap);

	public int insertItem(Item item);

	public List<Item> searchItemList(FilterVO pageVO);

	public int searchItemListCut(FilterVO pageVO);
	
	public List<Item> selectCompnyList(PageVO pageVO);
}// ItemsDAO end
