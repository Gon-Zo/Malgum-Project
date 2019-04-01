package com.mujea.malgum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.ReviewContent;

public class ReviewContentsDAOImpl implements ReviewContentsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selectContents \n
	 * @brief 리뷰컨테츠 목록을 가져오기 위한 함수 \n
	 * @param int no 리뷰의 번호 \n
	 * @return List<ReviewContent> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public List<ReviewContent> selectContents(int no) {
		// TODO Auto-generated method stub
		return session.selectList("reviewContents.selectList", no);
	}
	
	@Override
	public List<Review> imgReview(int no) {
		return session.selectList("reviewContents.selectListReviewContents",no);
	}
}// ReviewContentsDAOImpl end
