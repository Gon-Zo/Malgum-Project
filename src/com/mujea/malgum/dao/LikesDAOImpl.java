package com.mujea.malgum.dao;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Like;

public class LikesDAOImpl implements LikesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	/**
	 * @name selectReviewLike \n
	 * @brief 유저의 리뷰 좋아요 유무를 알기위한 리스트를 불러오는 함수\n
	 * @param Like like \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public int selectReviewLike(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectLikeOne", like) != null  ? 1 : 0;
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
