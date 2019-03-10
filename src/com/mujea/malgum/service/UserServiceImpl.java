package com.mujea.malgum.service;

import java.sql.Date;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.mujea.malgum.dao.ProblemTypesDAO;
import com.mujea.malgum.dao.UsersDAO;
import com.mujea.malgum.vo.ProblemType;
import com.mujea.malgum.vo.User;

public class UserServiceImpl implements UserService {

	// 서비스는 DAO에 의존적
	private UsersDAO usersDAO;

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	private ProblemTypesDAO problemTypesDAO;

	public void setProblemTypesDAO(ProblemTypesDAO problemTypesDAO) {
		this.problemTypesDAO = problemTypesDAO;
	}

	// 회원가입
//	@Transactional
//	@Override
//	public boolean join(User user) {
//		// TODO Auto-generated method stub
//		return 1==usersDAO.insert(user);
//	}//join() end

	// 회원가입 피부고민과 일반 회원의 기본정보를 넣기!
	@Transactional
	@Override
	public void insert(User user, int[] types) {
		// TODO Auto-generated method stub
		// user vo에서 가져 온 year, month, date string을 Date type으로 형변환
		Date birthdateStr = Date.valueOf(user.getYear() + "-" + user.getMonth() + "-" + user.getDate());
		// 그리고 그 date형으로 변환한 것을 유저의 생일로 set해준다.
		user.setBirth(birthdateStr);
		// 유저 dao(data access object) db와 열결해 주는 곳 이곳에 user를 넣기!
		usersDAO.insert(user);
		// 유저의 번호를 받아온다.
		int no = user.getUserNo();
		// 유저의 피부고민 배열 각각을 ss로 변수 선언
		for (int ss : types) {
			// 유저가 가진 피부 고민 관련 테이블 객체를 생성한다.
			ProblemType problemType = new ProblemType();
			// 그 객체에 받아 온 유저 no를 넣고
			problemType.setUserNo(no);
			// 받아 온 고민 타입들을 넣는다.
			problemType.setProbNo(ss);
			// 마찬가지로 db에 넣기 위해서 관련 dao에 set 해준 값을 넣어 연결?
			problemTypesDAO.insertProb(problemType);
		}

		// return problemTypesDAO.insertProb(problemType);
	}

	// id 중복 확인
	@Override
	public boolean checkId(String id) {
		// TODO Auto-generated method stub
		return 0 == usersDAO.selectCheckId(id);// false 이미 사용중인가(false)를 체크?
	}// checkId() end

	// 로그인했을 때 처리
	@Override
	public User login(User user) {

		User loginUser = usersDAO.selectLogin(user);

		loginUser.setTypes(problemTypesDAO.selectList(user.getId()));

		// TODO Auto-generated method stub
		return loginUser;

	}// login() end

	// 마이페이지 유저 고민
	@Override
	public List<ProblemType> getProbTypes(String id) {
		// TODO Auto-generated method stub
		return problemTypesDAO.selectList(id);
	}

	// 서원 추가

	@Override
	public boolean checkBrand(String brand) {
		// TODO Auto-generated method stub
		return 0 == usersDAO.selectCheckBrand(brand);
	}

	@Override
	public boolean checkTel(String tel) {
		// TODO Auto-generated method stub
		return 0 == usersDAO.selectCheckTel(tel);
	}

	@Override
	public boolean checkLink(String link) {
		// TODO Auto-generated method stub
		return 0 == usersDAO.selectCheckLink(link);
	}

	@Override
	public boolean checkBusinessNum(String businessNum) {
		// TODO Auto-generated method stub
		return 0 == usersDAO.selectCheckBusinessNum(businessNum);
	}

	@Override
	public void companyWrite(User user) {

		usersDAO.insertCompany(user);

	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		
		Date birthdateStr = Date.valueOf(user.getYear() + "-" + user.getMonth() + "-" + user.getDate());
		user.setBirth(birthdateStr);
		
		return usersDAO.updateUser(user);
	}
}// UserServiceImpl end
