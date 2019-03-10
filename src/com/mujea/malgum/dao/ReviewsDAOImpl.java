package com.mujea.malgum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.transaction.annotation.Transactional;

import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Review;
import com.mujea.malgum.vo.ReviewContent;

public class ReviewsDAOImpl implements ReviewsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Review> selectPageList(FilterVO filterVO) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.selectPageList", filterVO);
	}

	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.selectTotal");
	}

	@Override
	public int selectTotalImg() {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.selectTotalImg");
	}

	@Override
	public int selectTotalTxt() {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.selectTotalTxt");
	}

	@Override
	public int pageTotal(FilterVO filterVO) {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.pageTotal", filterVO);
	}

	@Override
	public double selectReviewScoreAVG(int no) {
		// reviews.scoreAVG
		System.out.println("/getReviewScoreAVG /get");
		return session.selectOne("reviews.scoreAVG", no);
	}

	@Override
	public int selectReviewTotal(int no) {
		// reviews.selectTotal
		System.out.println("/getItemReviewTotal /get");
		return session.selectOne("reviews.selectItemTotal", no);
	}

	@Override
	public int insert(Review review) {

		return session.insert("reviews.insert", review);
	}

	@Override
	public int selectReviewScoreCnt(Map<String, Object> keyMap) {
		// TODO Auto-generated method stub
		System.out.println("/getReviewScoreCnt /get");
		int num = 0;
		try {
			num = session.selectOne("reviews.reviewScoreCnt", keyMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return num;
	}

	@Override
	public List<Review> selectItemReviewList(Map<String, Object> itemReviewMap) {
		// TODO Auto-generated method stub
		System.out.println("/getItemReviewList /get");
		List<Review> itemReviewList = session.selectList("reviews.itemReviewList", itemReviewMap);
		for (Review itemReview : itemReviewList) {
			if (itemReview.getType().equals("I")) {
				// 이미지 리뷰 일 때 이미지 가져오기
				itemReview.setList(session.selectList("reviews.itemReviewImage", itemReview.getNo()));
				// System.out.println("아이템 리뷰 번호 " + itemReview.getNo());
				// System.out.println("이미지 리뷰 사진 유무 " + itemReview.getList());
				// System.out.println(session.selectList("reviews.itemReviewImage",itemReview.getNo()));
			}
		}
		return itemReviewList;
	}

	@Override
	public int selectItemReviewListTotal(Map<String, Object> itemReviewMap) {
		// TODO Auto-generated method stub
		return session.selectOne("reviews.itemReviewListTotal", itemReviewMap);
	}

	@Override
	public Review selectOneReview(int no) {
		return session.selectOne("reviews.selectOneReview", no);
	}

	// Transactional : 최소한의 작업의 단위. 질의문이 두 개 이상 수행해야 할 때 실행 됨. db의 값이 변경 될 때.
	@Transactional
	@Override
	public int insert(String[] img, String[] imgReviewSub, Review review) {
		// 접근제한자 static
		int result = 0;

		try {

			// 질의문이 실행되고 나서의 반환 값 결과( 0 / 1 )
			int reviewResult = session.insert("reviews.insert", review);
			System.out.println("리뷰 테이블 글 작성");
			int imgResult = 0;

			for (int i = 0; i < img.length; i++) {
				System.out.println("이미지 등록 접근");
				ReviewContent reviewContent = new ReviewContent();
				reviewContent.setImg(img[i]);
				reviewContent.setSeq(i + 1);
				reviewContent.setContent(imgReviewSub[i]);
				reviewContent.setReviewNo(review.getNo());
				System.out.println(reviewContent.getImg());
				System.out.println(reviewContent.getContent());
				System.out.println(reviewContent.getReviewNo());
				System.out.println(reviewContent.getSeq());
				imgResult = session.insert("reviewContents.insert", reviewContent);
			}

			if (reviewResult == 1 && imgResult == 1) {
				result = 1;
			}

		} catch (Exception e) {

		}

		return result;

	}

	@Override
	public List<Review> selectSearchReview(FilterVO filterVO) {
		// TODO Auto-generated method stub
		return session.selectList("reviews.selectSearchReview", filterVO);
	}

	public int selectSearchCount(FilterVO filterVO) {
		return session.selectOne("reviews.selectSearchCount", filterVO);
	}
}// ReviewsDAOImpl end
