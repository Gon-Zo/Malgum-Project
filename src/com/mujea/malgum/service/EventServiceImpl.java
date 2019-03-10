package com.mujea.malgum.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import com.mujea.malgum.dao.EventImgsDAO;
import com.mujea.malgum.dao.EventsDAO;
import com.mujea.malgum.util.PaginateUtil;
import com.mujea.malgum.vo.Event;
import com.mujea.malgum.vo.EventImg;
import com.mujea.malgum.vo.PageVO;
import com.mujea.malgum.vo.User;

public class EventServiceImpl implements EventService {

	private EventsDAO eventsDAO;
	
	public void setEventsDAO(EventsDAO eventsDAO) {
		this.eventsDAO = eventsDAO;
	}
	
	private EventImgsDAO eventImgsDAO;
	
	public void setEventImgsDAO(EventImgsDAO eventImgsDAO) {
		this.eventImgsDAO = eventImgsDAO;
	}

	private PaginateUtil paginateUtil;
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	//이벤트 기본 내용
	@Override
	public Event getEvent(int no) {
		// TODO Auto-generated method stub
		 Event event = eventsDAO.selectOne(no);
		 
		 System.out.println("event no :: "+event.getNo());
		 
		 event.setEventImgs(eventImgsDAO.selectList(event.getNo()));
		
		return event;
	}
	
	//회사의 이벤트 관리
	@Override
	public Map<String, Object> getEventList(int userNo, String order, int pageNo) {
		// TODO Auto-generated method stub
		//start ---> int pageNo
		//맵선언 
		Map<String, Object> map = new ConcurrentHashMap<>();
		
		//보여지는 갯수
		// end 값
		int numPage = 6;
		
		//인자 두개 짜리 생성자 사용
		PageVO pageVO = new PageVO(order, pageNo, numPage, userNo);
		System.out.println("order:"+order);
		List<Event> list = eventsDAO.selectList(pageVO);
		
		//int total = eventsDAO.selectEventTotal(id);
		int total = 100;
		
		int numBlock = 5;
		
		String url = "/events/page/";
		
		String paging = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("list", list);
		map.put("paginate", paging);
		
		
//		//전체리스트의값
//		int total = 100;
//		
//		//페이지 갯수 하단 클릯하는것
//		int numBlock = 5;
//		
//		//url 값
//		String url = "event/page/";
//		
//		String paging = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
//		
//		System.out.println(eventsDAO.selectList(pageVO));
//		
//		//페이징 유틸을 사용해보자 !!
//		map.put("list", eventsDAO.selectList(pageVO));
//		map.put("paging", paging);
		
		return map;
	}
	
	@Override
	public boolean delete(int eventNo) {
		// TODO Auto-generated method stub
		return 1== eventImgsDAO.delete(eventNo) && 1==eventsDAO.delete(eventNo);
	}
	
	//서원 추가
	
	@Override
	public Map<String, Object> selectEvent(int pageNo, String type, String order) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		// 보여질갯수
		int numPage = 6;

		// pageVo 를 선언해 보자!
		PageVO pageVO = new PageVO(pageNo, numPage, type, order);

		// 리스트를 받자
		List<Event> list = eventsDAO.selectAll(pageVO);

		for(Event event:list) {
			event.getFormatEndDate();
		}
		
		int total = eventsDAO.selectTotal();
		int numBlock = 5;
		String url = "/event/main/page/";

		// 페이징을 받자
		String paging = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		// map 에 넣어보자
		map.put("list", list);
		map.put("paginate", paging);

		return map;
	}


	@Override
	public void eventInsert(int userNo,Event event,String emailMain,String emailSub,String startDate1,String endDate1,String[] img) {
		// TODO Auto-generated method stub
		event.setUserNo(userNo);
		event.setEmail(emailMain+"@"+emailSub);
		event.setStartDate(Date.valueOf(startDate1.substring(6)));
		event.setEndDate(Date.valueOf(endDate1.substring(6)));
		
		int result=eventsDAO.insert(event);
		
		int eventNo=event.getEventNo();
		
		if(result==1) {
			for(String imgs:img) {
			EventImg eventImg = new EventImg();
			eventImg.setImg(imgs);
			eventImg.setEventNo(eventNo);
			eventImgsDAO.insert(eventImg);
			}
		}
	}
	
	//서원 추가 끝

}//EventServiceImpl end
