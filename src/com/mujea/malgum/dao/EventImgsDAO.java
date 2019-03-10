package com.mujea.malgum.dao;

import java.util.List;
import com.mujea.malgum.vo.EventImg;

public interface EventImgsDAO {

	//이벤트 이미지
	 public List<EventImg> selectList(int eventNo);
	 
	 //이벤트 이미지 삭제
	 public int delete(int eventNo);
	 
	 public int insert(EventImg eventImg);
	 
}//EventsDAO end
