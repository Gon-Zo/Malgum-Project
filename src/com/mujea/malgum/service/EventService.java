package com.mujea.malgum.service;

import java.util.List;
import java.util.Map;

import com.mujea.malgum.vo.Event;
import com.mujea.malgum.vo.EventImg;
import com.mujea.malgum.vo.User;

public interface EventService {

	//이벤트 기본 내용
	public Event getEvent(int no);
	
	//회사의 이벤트 관리
	public Map<String, Object> getEventList(int userNo, String order, int pageNo);

	//이벤트 삭제
	public boolean delete(int eventNo);
	
	public Map<String, Object> selectEvent(int pageNo, String type, String order);
	
	public void eventInsert(int userNo,Event event,String emailMain,String emailSub,String startDate1,String endDate1,String[] img);
	

}//EventService end
