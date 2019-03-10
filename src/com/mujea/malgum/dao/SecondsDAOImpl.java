package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

public class SecondsDAOImpl implements SecondsDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
}//SecondsDAOImpl end
