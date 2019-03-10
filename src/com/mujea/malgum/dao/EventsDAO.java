package com.mujea.malgum.dao;

import java.util.List;

import com.mujea.malgum.vo.Event;
import com.mujea.malgum.vo.PageVO;

public interface EventsDAO {

	// 이벤트 기본 내용
	public Event selectOne(int no);

	// 회사의 이벤트 관리
	public List<Event> selectList(PageVO pageVO);

	// 회사가 가지고있는 총 이벤트
	public int selectEventTotal(String id);

	// 이벤트 삭제
	public int delete(int eventNo);

	
	public List<Event> selectAll(PageVO pageVO);

	public int selectTotal();

	public int insert(Event event);

}// EventsDAO end
