package com.mujea.malgum.dao;

import java.util.List;

import com.mujea.malgum.vo.Reply;

public interface RepliesDAO {

	public int insertReply(Reply repliy);
	public List<Reply> selectListReplies(int no);
	public Reply replyCount(int no);
	
}//RepliesDAO end
