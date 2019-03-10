package com.mujea.malgum.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mujea.malgum.service.EventService;
import com.mujea.malgum.vo.Event;
import com.mujea.malgum.vo.User;

@Controller
public class EventController {

	private EventService eventService;
	
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
	
	//이벤트 상세
	@RequestMapping(value="/event/{no}", method=RequestMethod.GET)
	public String event(@PathVariable int no ,Model model) {
		
		System.out.println(no);
		
		model.addAttribute("event", eventService.getEvent(no));
		
		//vo랑 list를 따로 넘길 때 Map을 쓴다.
		//vo 안에 list를 넘길 때는 이렇게
		
		return "event_detail";
		
	}//event() end
	
	//회사의 이벤트 관리
	@RequestMapping(value="/events/{id}", method=RequestMethod.GET)
	public String eventAdmin(@PathVariable String id) {
		
		//model.addAttribute("eventList", eventService.getEventList(id));
		
		//System.out.println(model.addAttribute("eventList", eventService.getEventList(id)));
		
		//System.out.println(id);
		
//		List<Event> list =eventService.getEventList(id);
//		
//		for(Event e:list) {
//			System.out.println(e.getBrand());
//		}
//		
//		model.addAttribute("eventList", list);
//		
//		System.out.println(model.addAttribute("eventList", eventService.getEventList(id)));
		
		return "corporation_event_main";
		
	}//eventAdmin() end

	//json으로 바꾸어준다. : @ResponseBody
	// url 값을 넣어서 확인할것 ~~
	///로컬호스/ajax/events/1
	@RequestMapping(value="/ajax/events/{userNo}/{order}/{pageNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ajaxEventList(@PathVariable int userNo, @PathVariable String order, @PathVariable int pageNo){
		System.out.println("이벤트들 출력 성공");
		System.out.println("order:"+order);
		return eventService.getEventList(userNo, order, pageNo);
	}
	
	//이벤트 삭제 
	@RequestMapping(value="/event/delete", method=RequestMethod.DELETE)
	public String deleteEvent(int eventNo , String eventId) {
		
		System.out.println("삭제 성공 ::" + eventNo);
		eventService.delete(eventNo);
		System.out.println("삭제 성공");
		
		return "redirect:/events/"+eventId;
	}
	
	//서원
	
	@RequestMapping(value="/ajax/event/type/{type}/order/{order}/page/{pageNo}",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> asdfsdfa (@PathVariable int pageNo, @PathVariable String type, @PathVariable String order) {
		return eventService.selectEvent(pageNo,type,order);
	}
	
	@RequestMapping(value="/event/write/form",method=RequestMethod.POST)
	public String eventForm(HttpSession session,Event event,String emailMain,String emailSub,String startDate1,String endDate1,String[] img) {
		
		User user=(User) session.getAttribute("loginUser");
		int userNo=user.getNo();
		
		eventService.eventInsert(userNo,event, emailMain, emailSub,startDate1,endDate1,img);
		//eventService.eventInsert(event, emailMain, emailSub,startDate1,endDate1,img);
		
		return "redirect:/events";
	}
	
	@RequestMapping(value="/event/write",method=RequestMethod.GET)
	public String eventWrite() {
		
		return "event_write";
	}
	
	@RequestMapping(value="/events",method=RequestMethod.GET)
	public String eventMain() {
		
		return "event_main";
	}
	
}//EventController end
