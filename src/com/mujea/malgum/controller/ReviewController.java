package com.mujea.malgum.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mujea.malgum.service.ReviewService;
import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.Like;
import com.mujea.malgum.vo.Reply;
import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.Second;

@Controller
public class ReviewController {

	private ReviewService reviewService;

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	@RequestMapping(value = "/review/write", method = RequestMethod.GET)
	public String reviewWrite() {
		System.out.println("이전주소?");
		return "review_write";
	}

	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String reviewsWriter(@RequestHeader String referer, Review review, String[] img, String[] imgReviewSub) {

		if (review.getType().equals("I")) {
			System.out.println(reviewService.write(img, imgReviewSub, review));
		} else {
			System.out.println(reviewService.write(review));
		}

		return "redirect:/reviews";
	}

	@RequestMapping(value = "/reviews", method = RequestMethod.GET)
	public String reviewMain(Model model) {
		model.addAllAttributes(reviewService.totalReivew());
		return "review_main";
	}// reviewMain end

	/**
	 * @name ajaxItemSearch \n
	 * @brief 리뷰페이지에서의 자동완성 기능 \n
	 * @param String title \n
	 * @return List<Item> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/search/item/{title}", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> ajaxItemSearch(@PathVariable String title) {
		return reviewService.searchItem(title);
	}

	/**
	 * @name ajaxReviewList \n
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
	@RequestMapping(value = "/ajax/review/page", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxReviewList(int pageNo, String order, String type, int listNo, String second,
			String skin, String age, String problem, String gift, int loginUser, int click) {
		return reviewService.reivewList(pageNo, order, type, listNo, second, skin, age, problem, gift, loginUser,
				click);
	}

	@RequestMapping(value = "/ajax/review/{no}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> reviewPopup(@PathVariable int no) {
		System.out.println("/ajax/popup :" + no);
		return reviewService.reviewPopup(no);
	}

	@RequestMapping(value = "/ajax/comment/write", method = RequestMethod.GET)
	@ResponseBody
	public int reviewComment(Reply reply) {
		System.out.println("/ajax/comment/write");
		return reviewService.insertReply(reply);
	}

	@RequestMapping(value = "/ajax/comment/selectList/{no}", method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> selectListReplies(@PathVariable int no) {
		System.out.println("/ajax/comment/select :" + no);
		System.out.println("리뷰 리스트의 번호: " + no);
		return reviewService.selectListReply(no);
	}

	@RequestMapping(value = "/ajax/comment/like/{no}", method = RequestMethod.GET)
	@ResponseBody
	public int ifLike(@PathVariable int no, int userNo) {
		System.out.println("no : " + no);
		System.out.println("userNo : " + userNo);
		Like like = new Like();
		like.setUserNo(userNo);
		like.setReviewNo(no);
		return reviewService.ifLike(like);
	}

	@RequestMapping(value = "/ajax/comment/like/select/{no}", method = RequestMethod.GET)
	@ResponseBody
	public Like selectLike(@PathVariable int no) {
		System.out.println("no : " + no);
		return reviewService.selectOneLike(no);
	}

	/**
	 * @name selectReply \n
	 * @brief 리뷰 에서 리플의 갯수를 파악하는 함수이다 \n
	 * @param int no 리뷰의 번호\n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/reply/count/select/{no}", method = RequestMethod.GET)
	@ResponseBody
	public int selectReply(@PathVariable int no) {
		return reviewService.countReply(no);
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
	@RequestMapping(value = "/ajax/review/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxReviewList(int pageNo, int loginUserNo, String order, String type, String title) {
		return reviewService.selectSearchReview(pageNo, loginUserNo, order, type, title);
	}

	/**
	 * @name searchReviews \n
	 * @brief 검색 페이지 에서 리뷰검색으로 이동시 기능\n
	 * @param String title 검색 창에서의 값\n
	 * @param int count 검색된 결과 갯수\n
	 * @param Model  model \n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/search/reviews/{title}/{count}", method = RequestMethod.GET)
	public String searchReviews(@PathVariable String title, @PathVariable int count, Model model) {

		if (title != "undefined") {
			model.addAttribute("title", title);
			model.addAttribute("count", count);
		} else {
			model.addAttribute("title", null);
			model.addAttribute("count", 0);
		}

		return "search_review";
	}

}// ReviewController end