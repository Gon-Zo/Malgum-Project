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

	@Override
	public List<Item> searchItem(String title) {
		// TODO Auto-generated method stub
		title = "%" + title + "%";
		return itemsDAO.selectItemList(title);
	}// searchItem end

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
		System.out.println("likeUserNo ::"+like.getUserNo());
		String likeCheck = "F";
		for (Review review : list) {
			review.setList(reviewContentsDAO.selectContents(review.getNo()));
			like.setReviewNo(review.getNo());
			int check = likesDAO.selectReviewLike(like);
			System.out.println("check ::"+check);
			if (check==1) {
				likeCheck = "T";
			}else {
				likeCheck = "F";
			}
			System.out.println("likeCheck :: "+likeCheck);
			review.setCkeckLike(likeCheck);
		}

		int total = reviewsDAO.pageTotal(filterVO);
		int numBlock = 5;

		String url = "/review/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		System.err.println("-----------------------필터 데이터-----------------------");
		System.err.println("i.listNo : " + filterVO.getListNo());
		System.err.println("i.order : " + filterVO.getOrder());
		System.err.println("i.type : " + filterVO.getType());
		System.err.println("i.second : " + filterVO.getSecond());
		System.err.println("i.skin : " + filterVO.getSkin());
		System.err.println("i.age : " + filterVO.getAge());
		System.err.println("i.probNo : " + filterVO.getProblem());
		System.err.println("i.gift : " + filterVO.getGift());
		System.err.println("click 유무 : " + filterVO.getClick());
		System.err.println("u.userNo : " + filterVO.getUserNo());
		System.err.println("---------------------------------------------------------");

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// reivewList end

	@Override
	public Map<String, Object> totalReivew() {
		// TODO Auto-generated method stub

		Map<String, Object> map = new ConcurrentHashMap<>();

		Integer total = reviewsDAO.selectTotal();
		Integer totalImg = reviewsDAO.selectTotalImg();
		Integer totalTxt = reviewsDAO.selectTotalTxt();

		map.put("total", total);
		map.put("totalImg", totalImg);
		map.put("totalTxt", totalTxt);

		return map;
	}// totalReivew end

	@Override
	public Map<String, Object> reviewPopup(int no) {
		int tmp = 0;
		Like like = new Like();
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("user", usersDAO.selectOneReviewUser(no));
		map.put("review", reviewsDAO.selectOneReview(no));
		map.put("reviewContents", reviewContentsDAO.imgReview(no));
		
		System.out.println("reviewPopup:"+no);
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

		int result = likesDAO.ifLike(like);

		if (result == 1) {
			likesDAO.deleteLike(like);
		} else {
			likesDAO.insertLike(like);
		}
		return result;
	}

	@Override
	public Like selectOneLike(int no) {
		return likesDAO.selectOneLike(no);
	}
	
	@Override
	public boolean write(String[] img, String[] imgReviewSub, Review review) {
		// TODO Auto-generated method stub
		return 1==reviewsDAO.insert(img, imgReviewSub, review);
	}

	@Override
	public boolean write(Review review) {

		return 1==reviewsDAO.insert(review);
	}
	
	
	public int countReply(int no) {
		
		Reply reply = repliesDAO.replyCount(no);
		int count =0;
		if(reply!=null) {
			count = reply.getReplyNum();
		}else {
			count= 0;
		}
		return count;
	}

	
	@Override
	public Map<String, Object> selectSearchReview(int pageNo , int loginUserNo , String order , String type , String title) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 3;
		FilterVO filterVO = new FilterVO(pageNo, type, numPage, order , title);
		List<Review> list = reviewsDAO.selectSearchReview(filterVO);
		int total = reviewsDAO.selectSearchCount(filterVO);
		int numBlock = 5;
		Like like = new Like();
		like.setUserNo(loginUserNo);
		String likeCheck = "F";
		for (Review review : list) {
		review.setList(reviewContentsDAO.selectContents(review.getNo()));
			like.setReviewNo(review.getNo());
		if (1==likesDAO.selectReviewLike(like)) {
			likeCheck = "T";
		}else {
			likeCheck = "F";
		}
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