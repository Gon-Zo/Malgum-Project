package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Like;

public class LikesDAOImpl implements LikesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int selectReviewLike(Like like) {
		// TODO Auto-generated method stub
		int check = 0;
		System.out.println("like DAO ::: "+like.getReviewNo() +"::::"+like.getUserNo());
		Like likes = session.selectOne("likes.selectLikeOne", like);
		if(likes==null) {
			check = 0;
		}else {
			check = 1;
		}
		return check;
	}
	
	@Override
	public Like selectOneLike(int no) {
		return session.selectOne("likes.selectOneLike", no);
	}

	@Override
	public int insertLike(Like like) {
		return session.insert("likes.insertLike",like);
	}

	@Override
	public int deleteLike(Like like) {
		return session.delete("likes.deleteLike", like);
	}

	@Override
	public int ifLike(Like like) {
		return session.selectOne("likes.ifLike", like);
	}
}// LikesDAOImpl end
