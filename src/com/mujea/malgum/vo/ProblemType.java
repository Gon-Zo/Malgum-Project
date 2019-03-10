package com.mujea.malgum.vo;

import java.sql.Timestamp;

public class ProblemType {

	private int no, probNo, userNo, itemNo;
	private Timestamp regdate;
	private String title;
	
	public ProblemType() {
		// TODO Auto-generated constructor stub
	}
	
	public ProblemType(int probNo, int itemNo) {
		super();
		this.probNo = probNo;
		this.itemNo = itemNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProbNo() {
		return probNo;
	}

	public void setProbNo(int probNo) {
		this.probNo = probNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//ProblemType end
