package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.User;

public class UsersDAOImpl implements UsersDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession() end

	// 일반 유저 회원가입
	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return session.insert("users.insert", user);
	}// insert() end

	// id 중복 체크
	@Override
	public int selectCheckId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckId", id);
	}// selectCheckId() end

	// 로그인했을 때 처리 data에 access하려면 xml sql구문!
	@Override
	public User selectLogin(User user) {
		// TODO Auto-generated method stub
		// session에 users.xml의 selectLogin이라는 아이디를 가지고 있는 구문에 설정한 user를 넣는다!
		return session.selectOne("users.selectLogin", user);
	}// selectLogin() end

//	@Override
//	public int probInsert(User user) {
//		// TODO Auto-generated method stub
//		return session.insert("users.insertProb",user);
//	}

	@Override
	public int selectCheckBrand(String brand) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckBrand", brand);
	}

	@Override
	public int selectCheckTel(String tel) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckTel", tel);
	}

	@Override
	public int selectCheckLink(String link) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckLink", link);
	}

	@Override
	public int selectCheckBusinessNum(String buisnessNum) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectCheckBusinessNum", buisnessNum);
	}

	@Override
	public int insertCompany(User user) {
		// TODO Auto-generated method stub
		return session.insert("users.insertCompany", user);
	}
	
	@Override
	public User selectOneReviewUser(int no) {
		return session.selectOne("users.selectOneReviewUser", no);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return session.update("users.updateUser", user);
	}
	
}// UsersDAOImpl end
