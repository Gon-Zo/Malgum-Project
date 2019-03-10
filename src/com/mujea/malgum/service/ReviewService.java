package com.mujea.malgum.service;

import java.util.List;
import java.util.Map;

import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.Like;
import com.mujea.malgum.vo.Reply;
import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.Second;

public interface ReviewService {

	public boolean write(Review review);

	public boolean write(String[] img, String[] imgReviewSub, Review review);

	public List<Item> searchItem(String title);

	public Map<String, Object> reivewList(int pageNo, String order, String type, int listNo, String second, String skin,
			String age, String problem, String gift, int loginUser, int click);

	public Map<String, Object> totalReivew();

	public Map<String, Object> reviewPopup(int no);

	public int insertReply(Reply reply);

	public List<Reply> selectListReply(int no);

	public int ifLike(Like like);

	public Like selectOneLike(int no);

	public int countReply(int no);

	public Map<String, Object> selectSearchReview(int pageNo, int loginUserNo, String order, String type, String title);
}// ReviewService end
