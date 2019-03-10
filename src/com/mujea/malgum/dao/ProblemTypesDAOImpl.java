package com.mujea.malgum.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.mujea.malgum.vo.ProblemType;

public class ProblemTypesDAOImpl implements ProblemTypesDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//회원가입, 유저의 피부고민 중복 선택 시 insert 
	//DAO는 data를 access해야 하기 때문에 xml sql구문과 연결!
	@Override
	public int insertProb(ProblemType problemType) {
		// TODO Auto-generated method stub
		return session.insert("problemTypes.insertProb",problemType);
	}
	
	//마이페이지 유저 고민 가져오기
	@Override
	public List<ProblemType> selectList(String id) {
		// TODO Auto-generated method stub
		return session.selectList("problemTypes.selectTypeList", id);
	}
	
	@Override
	public List<ProblemType> selectProblemTypeList(int no) {
		// TODO Auto-generated method stub
		System.out.println("/getProblemTypeList /get");
		return session.selectList("problemTypes.itemTypes", no);
	}
	
	@Override
	public int insertProblemType(ProblemType problemType) {
		return session.insert("problemTypes.insertItemProblemTypes",problemType);
	}
}//ProblemTypesDAOImpl end
