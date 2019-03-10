package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;
import java.util.List;
import java.util.Map;

import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.PageVO;

public class ItemsDAOImpl implements ItemsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Item> selectItemList(String title) {
		// TODO Auto-generated method stub
		return session.selectList("items.selectItemList", title);
	}// selectItemList end
	
	@Override
	public List<Item> selectList(FilterVO filterVO) {
		
		return session.selectList("items.selectList",filterVO);
	}
	@Override
	public int selectTotal() {
	
		return session.selectOne("items.selectTotal");
	}
	@Override
	public Item selectOne(int no) {
		// 한 가지 제품을 가져옴.
		return session.selectOne("items.selectOne", no);
	}
	
	@Override
	public int updateItemType(Map<String, Object> itemTypeMap) {
		// TODO Auto-generated method stub
		return session.update("items.updateType",itemTypeMap);
	}
	
	@Override
	public int insertItem(Item item) {
		return session.insert("items.insertItem", item);
	}
	
	@Override
	public List<Item> searchItemList(FilterVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("items.searchItemList",pageVO);
	}
	
	@Override
	public int searchItemListCut(FilterVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectOne("items.selectSearchCount",pageVO);
	}
	
	public List<Item> selectCompnyList(PageVO pageVO){
		return session.selectList("items.selectCompnyList",pageVO);
	}
	
}// ItemsDAOImpl end
