package com.mujea.malgum.dao;

import com.mujea.malgum.vo.User;

public interface UsersDAO {

	// 회원가입
	public int insert(User user);

	// id 중복 체크
	public int selectCheckId(String id);

	// login했을 때 처리
	public User selectLogin(User user);

	// public int probInsert(User user);

	public int selectCheckBrand(String brand);

	public int selectCheckTel(String tel);

	public int selectCheckLink(String link);

	public int selectCheckBusinessNum(String buisnessNum);

	public int insertCompany(User user);
	
	public User selectOneReviewUser(int no);

	public int updateUser(User user);
}// UsersDAO end
