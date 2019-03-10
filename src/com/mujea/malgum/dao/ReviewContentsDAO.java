package com.mujea.malgum.dao;

import java.util.List;

import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.ReviewContent;

public interface ReviewContentsDAO {

	public List<ReviewContent> selectContents(int no);
	public List<Review> imgReview(int no);

}// ReviewContentsDAO end
