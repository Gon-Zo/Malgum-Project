package com.mujea.malgum.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.transaction.annotation.Transactional;

import com.mujea.malgum.dao.ItemsDAO;
import com.mujea.malgum.dao.ItemsWarnsDAO;
import com.mujea.malgum.dao.LikesDAO;
import com.mujea.malgum.dao.ProblemTypesDAO;
import com.mujea.malgum.dao.ReviewsDAO;
import com.mujea.malgum.dao.WarnsDAO;
import com.mujea.malgum.util.PaginateUtil;
import com.mujea.malgum.vo.FilterVO;
import com.mujea.malgum.vo.Item;
import com.mujea.malgum.vo.ItemWarn;
import com.mujea.malgum.vo.Like;
import com.mujea.malgum.vo.PageVO;
import com.mujea.malgum.vo.ProblemType;
import com.mujea.malgum.vo.Review;

public class ItemServiceImpl implements ItemService {

	private ItemsDAO itemsDAO;
	private WarnsDAO warnsDAO;
	private ReviewsDAO reviewsDAO;
	private ProblemTypesDAO problemTypesDAO;
	private ItemsWarnsDAO itemsWarnsDAO;
	private PaginateUtil paginateUtil;
	private LikesDAO likesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	public void setItemsWarnsDAO(ItemsWarnsDAO itemsWarnsDAO) {
		this.itemsWarnsDAO = itemsWarnsDAO;
	}
	public void setProblemTypesDAO(ProblemTypesDAO problemTypesDAO) {
		this.problemTypesDAO = problemTypesDAO;
	}
	
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	public void setItemsDAO(ItemsDAO itemsDAO) {
		this.itemsDAO = itemsDAO;
	}
	
	public void setWarnsDAO(WarnsDAO warnsDAO) {
		this.warnsDAO = warnsDAO;
	}
	
	
@Override
public Map<String, Object> getItems(String order,int page,String problem,String second,String skin,String age,String gender) {

	Map<String, Object> map = new ConcurrentHashMap<>();
	
	int numPage = 9;
	System.out.println("gender :: "+gender);
	
	FilterVO filterVO = new FilterVO(page, numPage, order, second, skin, age, problem, gender);
	
	List<Item> list = itemsDAO.selectList(filterVO);

	int total = itemsDAO.selectTotal();

	int numBlock = 9;
	String url = "/item_main/";		
	String paginate=
	paginateUtil.getPaginate(page, total, numPage, numBlock, url);
	
	System.err.println("-----------------------필터 데이터-----------------------");
	System.err.println("i.order : " + filterVO.getOrder());
	System.err.println("i.second : " + filterVO.getSecond());
	System.err.println("i.skin : " + filterVO.getSkin());
	System.err.println("i.age : " + filterVO.getAge());
	System.err.println("i.probNo : " + filterVO.getProblem());
	System.err.println("i.gender : " + filterVO.getGender());
	System.err.println("---------------------------------------------------------");

	map.put("list", list);
	map.put("paginate", paginate);
	
	
	return map;
}
@Override
public Map<String, Object> getItem(int no) {
	
	Map<String, Object> multiMap = new ConcurrentHashMap<>();
	//아이템 번호로 바로 아이템 불러옴.
	System.out.println("/getItem /get");
	multiMap.put("item", itemsDAO.selectOne(no));
	multiMap.put("pageNo", 1);
	
	//리뷰의 수
	multiMap.put("reviewTotal", reviewsDAO.selectReviewTotal(no));
	
	//평점
	multiMap.put("reviewScoreAVG", reviewsDAO.selectReviewScoreAVG(no));
	
	//평점별 리뷰의 수
	Map<String, Object> keyMap = new ConcurrentHashMap<>();
	keyMap.put("score", 5);
	keyMap.put("itemNo", no);
	multiMap.put("reviewScoreCnt5", reviewsDAO.selectReviewScoreCnt(keyMap));
	//System.out.println("reviewScoreCnt5 : " + (int)keyMap.get("score"));
	keyMap.put("score", 4);
	//System.out.println("reviewScoreCnt4 : " + (int)keyMap.get("score"));
	multiMap.put("reviewScoreCnt4", reviewsDAO.selectReviewScoreCnt(keyMap));
	keyMap.put("score", 3);
	multiMap.put("reviewScoreCnt3", reviewsDAO.selectReviewScoreCnt(keyMap));
	keyMap.put("score", 2);
	multiMap.put("reviewScoreCnt2", reviewsDAO.selectReviewScoreCnt(keyMap));
	keyMap.put("score", 1);
	multiMap.put("reviewScoreCnt1", reviewsDAO.selectReviewScoreCnt(keyMap));
	//주의성분 20가지 리스트
	multiMap.put("warnList", warnsDAO.selectWarnList());
	
	//제품의 특성
	multiMap.put("problemTypeList", problemTypesDAO.selectProblemTypeList(no));
	
	//주의성분 리스트
	multiMap.put("itemWarnList", itemsWarnsDAO.selectItemWarnList(no));

	return multiMap;
}

@Override
public Map<String, Object> getItemReviewList(int pageNo, String order, int itemNo, int filterScore, String reviewTypeStr, int loginUser){
	//상품의 리뷰 리스트
	Map<String, Object> itemReviewMap = new ConcurrentHashMap<>();
	
	//System.out.println(pageNo);
	//System.out.println(order);
	//System.out.println(itemNo);
	
	int numPage = 3;
	PageVO pageVO = new PageVO(pageNo, numPage);
	//System.out.println(pageVO.getStart());
	//System.out.println(pageVO.getEnd());
	itemReviewMap.put("itemNo", itemNo);
	itemReviewMap.put("pageVO", pageVO);
	itemReviewMap.put("order", order);
	itemReviewMap.put("filterScore", filterScore);
	itemReviewMap.put("reviewTypeStr", reviewTypeStr);
	List<Review> list = reviewsDAO.selectItemReviewList(itemReviewMap);
	
	Like like = new Like();
	like.setUserNo(loginUser);
	String likeCheck = "F";
	for (Review review : list) {
		like.setReviewNo(review.getNo());
		if (1==likesDAO.selectReviewLike(like)) {
			likeCheck = "T";
		}else {
			likeCheck = "F";
		}
		review.setCkeckLike(likeCheck);
	}
	int total = reviewsDAO.selectItemReviewListTotal(itemReviewMap);
	int numBlock = 5;
	
	String url = "/ajax/item/review/";
	String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
	
	itemReviewMap.put("itemReviewList", list);
	itemReviewMap.put("paginate", paginate);
	return itemReviewMap;
}

@Override
public boolean updateItemType(int itemNo, String type) {
	// TODO Auto-generated method stub
	Map<String, Object> itemTypeMap = new ConcurrentHashMap<>();
	if(type.equals("F")) {
		type = "T";
	}else if(type.equals("T")) {
		type = "F";
	}
	itemTypeMap.put("itemNo", itemNo);
	itemTypeMap.put("type", type);
	return 1==itemsDAO.updateItemType(itemTypeMap);
}

@Override
public void regItem(Item item, int[] warnNo, int[] probNo) {

	itemsDAO.insertItem(item);

	for (int no : probNo) {
		ProblemType problemType = new ProblemType(no, item.getNo());
		problemTypesDAO.insertProblemType(problemType);
	}

	for (int no : warnNo) {
		ItemWarn itemWarn = new ItemWarn(no, item.getNo());
		itemsWarnsDAO.insertItemWarn(itemWarn);
	}

}


@Override
public Map<String, Object> searchItems(int pageNo , String title , String order) {
	// TODO Auto-generated method stub
	Map<String, Object> map = new ConcurrentHashMap<>();
	
	int numPage = 9;
	
	FilterVO filterVO = new FilterVO(title,pageNo, numPage ,order);
	int total = itemsDAO.searchItemListCut(filterVO);
	int numBlock = 9;
	String url = "/search/items/page/";
	List<Item> list = itemsDAO.searchItemList(filterVO);
	String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
	
	map.put("list", list);
	map.put("paginate", paginate);
	map.put("count",itemsDAO.searchItemListCut(filterVO));
	return map;
}

@Override
public Map<String, Object> corporationItems(int pageNo , int userNo) {
	// TODO Auto-generated method stub
	Map<String, Object> map = new ConcurrentHashMap<>();
	
	int numPage = 9;
	
	PageVO pageVO = new PageVO(pageNo, numPage, userNo);
	List<Item> list = itemsDAO.selectCompnyList(pageVO);
	int total = 100;
	int numBlock = 10;
	String url = "/corporation/items/page/";
	String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
	
	map.put("list", list);
	map.put("paginate", paginate);
	return map;
}
}//ItemServiceImpl end
