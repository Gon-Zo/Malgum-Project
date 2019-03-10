package com.mujea.malgum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Event;
import com.mujea.malgum.vo.PageVO;

public class EventsDAOImpl implements EventsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//이벤트 기본 내용
	@Override
	public Event selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("events.selectOne", no);
	}
	
	//회사의 이벤트 관리
	@Override
	public List<Event> selectList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("events.selectEventList", pageVO);
	}
	
	//회사가 가지고있는 총 이벤트
	@Override
	public int selectEventTotal(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("events.selectEventTotal", id);
	}
	
	//이벤트 삭제
	@Override
	public int delete(int eventNo) {
		// TODO Auto-generated method stub
		return session.delete("events.deleteEvent", eventNo);
	}
	
	//seowon
	
	public List<Event> selectAll(PageVO pageVO) {
		return session.selectList("events.selectAll",pageVO);
	}

	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("events.selectTotal");
	}

	@Override
	public int insert(Event event) {
		// TODO Auto-generated method stub
		return session.insert("events.insert",event);
	}
	
}//EventsDAOImpl end
