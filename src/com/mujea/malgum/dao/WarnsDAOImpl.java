package com.mujea.malgum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Warn;

public class WarnsDAOImpl implements WarnsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Warn> selectWarnList() {
		// TODO Auto-generated method stub
		System.out.println("/getWarnList /get");
		return session.selectList("warns.selectList");
	}
}
