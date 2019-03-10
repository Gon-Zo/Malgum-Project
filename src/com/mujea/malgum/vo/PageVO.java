package com.mujea.malgum.vo;

public class PageVO {
	
	private int start, end, userNo;
	private String type, order;
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	public PageVO(int page, int numPage, int userNo) {
		end = page*numPage;
		start = end-(numPage-1);
		this.userNo=userNo;
	}
	/**/
	public PageVO(String order,int page, int numPage, int userNo) {
		end = page*numPage;
		start = end-(numPage-1);
		this.userNo=userNo;
		this.order = order.equals("new") ? "e.regdate DESC" :"e.end_date ASC" ;
		
		System.out.println("order:"+this.order);
	}
	
	public PageVO(int page, int numPage, String type, String order) {
		end = page*numPage;
		start = end-(numPage-1);
		this.type = type.equals("ing") ? "end_date>sysdate" : "end_date<sysdate";
		this.order = order.equals("new") ? "e.regdate DESC" :"e.end_date ASC" ;
	}
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageVO(int page, int numPage) {
		end = page*numPage;
		start = end-(numPage-1);
	}
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}//PageVO end
