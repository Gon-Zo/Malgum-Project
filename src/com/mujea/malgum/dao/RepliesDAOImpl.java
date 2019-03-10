package com.mujea.malgum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Reply;

public class RepliesDAOImpl implements RepliesDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insertReply(Reply reply) {
		return session.insert("replies.insertReply", reply);
	}

	@Override
	public List<Reply> selectListReplies(int no) {
		System.out.println("DAO : "+no);
		return session.selectList("replies.selectListReplies", no);
	}

	@Override
	public Reply replyCount(int no) {
		return session.selectOne("replies.replyCount", no);
	}
	
}//RepliesDAOImpl end
