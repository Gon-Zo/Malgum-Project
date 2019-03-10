package com.mujea.malgum.dao;

import com.mujea.malgum.vo.Like;

public interface LikesDAO {

	public int selectReviewLike(Like like);
	public Like selectOneLike(int no);
	public int insertLike(Like like);
	public int deleteLike(Like like);
	public int ifLike(Like like);
}// LikesDAO end
