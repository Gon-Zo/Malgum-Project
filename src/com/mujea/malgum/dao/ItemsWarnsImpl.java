package com.mujea.malgum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.ItemWarn;

public class ItemsWarnsImpl implements ItemsWarnsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ItemWarn> selectItemWarnList(int no) {
		// TODO Auto-generated method stub
		System.out.println("/getItemWarnList /get");
		return session.selectList("itemWarns.itemWarnList",no);
	}
	@Override
	public int insertItemWarn(ItemWarn itemWarn) {
		return session.insert("itemWarns.insertItemWarn", itemWarn);
	}
}
