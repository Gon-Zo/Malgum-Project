package com.mujea.malgum.service;

import java.util.List;
import com.mujea.malgum.vo.ProblemType;
import com.mujea.malgum.vo.User;

public interface UserService {

	//회원가입
	//public boolean join(User user);

	//회원가입 피부고민과 일반 회원의 기본정보를 넣기!
	public void insert(User user, int[] types);
	
	//회원가입 시 id 중복 check
	public boolean checkId(String id);
	
	//로그인했을 때 처리
	public User login(User user);
	
	//마이페이지 유저 고민
	public List<ProblemType> getProbTypes(String id);
	
	public boolean checkBrand(String brand);
	
	public boolean checkTel(String tel);
	
	public boolean checkLink(String link);
	
	public boolean checkBusinessNum(String businessNum);
	
	public void companyWrite(User user);
	
	public int updateUser(User user);
	
}//UserService end
