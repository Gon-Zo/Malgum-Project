package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

public class ProblemsDAOImpl implements ProblemsDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
}//ProblemsDAOImpl end
