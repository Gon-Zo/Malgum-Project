package com.mujea.malgum.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.mujea.malgum.dao.ItemsDAO;
import com.mujea.malgum.dao.LikesDAO;
import com.mujea.malgum.dao.RepliesDAO;
import com.mujea.malgum.dao.ReviewContentsDAO;
import com.mujea.malgum.dao.ReviewsDAO;
import com.mujea.malgum.dao.UsersDAO;
import com.mujea.malgum.util.PaginateUtil;
import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.Like;
import com.mujea.malgum.vo.Reply;
import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.Second;

public class ReviewServiceImpl implements ReviewService {

	private ReviewsDAO reviewsDAO;
	private PaginateUtil paginateUtil;
	private ReviewContentsDAO reviewContentsDAO;
	private LikesDAO likesDAO;
	private ItemsDAO itemsDAO;
	private UsersDAO usersDAO;
	private RepliesDAO repliesDAO;

	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setReviewContentsDAO(ReviewContentsDAO reviewContentsDAO) {
		this.reviewContentsDAO = reviewContentsDAO;
	}

	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}

	public void setItemsDAO(ItemsDAO itemsDAO) {
		this.itemsDAO = itemsDAO;
	}

	/**
	 * @name searchItem \n
	 * @brief 리뷰페이지에서의 자동완성 기능 \n
	 * @param String title \n
	 * @return List<Item> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public List<Item> searchItem(String title) {
		// TODO Auto-generated method stub
		title = "%" + title + "%";
		return itemsDAO.selectItemList(title);
	}// searchItem end

	/**
	 * @name reivewList \n
	 * @brief 리뷰페이지의 모든 기능을 넣었다 (필터 기능 과 검색 시 아이템을 출력) \n
	 * @param int pageNo 페이지번호\n
	 * @param String order 정렬순\n
	 * @param String type \n
	 * @param int listNo 아이템 번호\n
	 * @param String second 이차 분류 데이터\n
	 * @param String skin 스킨의 데이터\n
	 * @param String age 연령 데이터\n
	 * @param String problem 문제 데이터\n
	 * @param String gift 선물 여부\n
	 * @param int loginUser 유저 번호\n
	 * @param int click 클릭 유무\n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public Map<String, Object> reivewList(int pageNo, String order, String type, int listNo, String second, String skin,
			String age, String problem, String gift, int loginUser, int click) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 3;

		FilterVO filterVO = new FilterVO(pageNo, numPage, order, type, listNo, second, skin, age, problem, gift,
				loginUser, click);
		List<Review> list = reviewsDAO.selectPageList(filterVO);
		Like like = new Like();
		like.setUserNo(loginUser);
		
		for (Review review : list) {
			review.setList(reviewContentsDAO.selectContents(review.getNo()));
			like.setReviewNo(review.getNo());
			review.setCkeckLike(likesDAO.selectReviewLike(like) == 1 ? "T" :"F");
		}

		int total = reviewsDAO.pageTotal(filterVO);
		int numBlock = 5;

		String url = "/review/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// reivewList end

	@Override
	public Map<String, Object> totalReivew() {
		// TODO Auto-generated method stub

		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("total", reviewsDAO.selectTotal());
		map.put("totalImg", reviewsDAO.selectTotalImg());
		map.put("totalTxt", reviewsDAO.selectTotalTxt());

		return map;
	}// totalReivew end

	@Override
	public Map<String, Object> reviewPopup(int no) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("user", usersDAO.selectOneReviewUser(no));
		map.put("review", reviewsDAO.selectOneReview(no));
		map.put("reviewContents", reviewContentsDAO.imgReview(no));

		return map;
	}

	@Override
	public List<Reply> selectListReply(int no) {
		return repliesDAO.selectListReplies(no);
	}

	@Override
	public int insertReply(Reply reply) {
		return repliesDAO.insertReply(reply);
	}

	@Override
	public int ifLike(Like like) {
		return likesDAO.ifLike(like) == 1 ? likesDAO.deleteLike(like) : likesDAO.insertLike(like);
	}

	@Override
	public Like selectOneLike(int no) {
		return likesDAO.selectOneLike(no);
	}

	@Override
	public boolean write(String[] img, String[] imgReviewSub, Review review) {
		// TODO Auto-generated method stub
		return 1 == reviewsDAO.insert(img, imgReviewSub, review);
	}

	@Override
	public boolean write(Review review) {
		return 1 == reviewsDAO.insert(review);
	}

	/**
	 * @name countReply \n
	 * @brief 리뷰 에서 리플의 갯수를 파악하는 함수이다 \n
	 * @param int no 리뷰의 번호\n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public int countReply(int no) {
		Reply reply = repliesDAO.replyCount(no);
		return reply != null ? reply.getReplyNum() : 0;
	}

	/**
	 * @name reivewList \n
	 * @brief 검색 페이지 리뷰의 기능을 넣었다 (필터 기능 과 검색 시 아이템을 출력) \n
	 * @param int pageNo 페이지번호\n
	 * @param String order 정렬순\n
	 * @param String type \n
	 * @param int loginUser 유저 번호\n
	 * @param String title 아이템 명 \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public Map<String, Object> selectSearchReview(int pageNo, int loginUserNo, String order, String type,
			String title) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 3;
		FilterVO filterVO = new FilterVO(pageNo, type, numPage, order, title);
		List<Review> list = reviewsDAO.selectSearchReview(filterVO);
		
		int total = reviewsDAO.selectSearchCount(filterVO);
		int numBlock = 5;
		Like like = new Like();
		like.setUserNo(loginUserNo);
		String likeCheck = null;
		
		for (Review review : list) {
			review.setList(reviewContentsDAO.selectContents(review.getNo()));
			like.setReviewNo(review.getNo());
			likeCheck = likesDAO.selectReviewLike(like) == 1 ? "T" : "F";
			review.setCkeckLike(likeCheck);
		}
		
		String url = "/review/search/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("list", list);
		map.put("paginate", paginate);
		map.put("total", total);

		return map;
	}

}