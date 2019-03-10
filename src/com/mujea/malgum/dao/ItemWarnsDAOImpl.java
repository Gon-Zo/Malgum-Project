package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

public class ItemWarnsDAOImpl implements ItemWarnsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
}//ItemWarnsDAOImpl end
