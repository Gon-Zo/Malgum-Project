package com.mujea.malgum.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.mujea.malgum.vo.EventImg;

public class EventImgsDAOImpl implements EventImgsDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<EventImg> selectList(int eventNo) {
		// TODO Auto-generated method stub
		return session.selectList("eventImgs.selectImgList",eventNo);
	}
	
	//이벤트 이미지 삭제
	@Override
	public int delete(int eventNo) {
		// TODO Auto-generated method stub
		return session.delete("eventImgs.deleteEventImgs", eventNo);
	}
	
	@Override
	public int insert(EventImg eventImg) {
		// TODO Auto-generated method stub
		return session.insert("eventImgs.insert",eventImg);
	}
	
}//EventsDAOImpl end
