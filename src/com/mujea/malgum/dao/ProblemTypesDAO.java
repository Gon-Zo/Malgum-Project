package com.mujea.malgum.dao;

import java.util.List;
import com.mujea.malgum.vo.ProblemType;

public interface ProblemTypesDAO {

	//회원가입, 유저의 피부고민 중복 선택 시 insert 
	public int insertProb(ProblemType problemType);
	
	//마이페이지 유저 고민 가져오기
	public List<ProblemType> selectList(String id);
	
	public List<ProblemType> selectProblemTypeList(int no);
	
	public int insertProblemType(ProblemType problemType);
}//ProblemTypesDAO end
