package com.mujea.malgum.dao;

import java.util.List;
import java.util.Map;

import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Review;

public interface ReviewsDAO {

	public int insert(Review review);

	public int insert(String[] img, String[] imgReviewSub, Review review);

	public List<Review> selectPageList(FilterVO pageVO);

	public int selectTotal();

	public int selectTotalImg();

	public int selectTotalTxt();

	public int pageTotal(FilterVO pageVO);

	public double selectReviewScoreAVG(int no);

	public int selectReviewTotal(int no);

	public int selectReviewScoreCnt(Map<String, Object> keyMap);

	public List<Review> selectItemReviewList(Map<String, Object> itemReviewMap);

	public int selectItemReviewListTotal(Map<String, Object> itemReviewMap);

	public Review selectOneReview(int no); // 리뷰가져오기

	public List<Review> selectSearchReview(FilterVO filterVO);

	public int selectSearchCount(FilterVO filterVO);
}// ReviewsDAO end
