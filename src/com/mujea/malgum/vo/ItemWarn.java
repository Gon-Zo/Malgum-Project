package com.mujea.malgum.vo;

import java.sql.Timestamp;

public class ItemWarn {

	private int no, warnNo, itemNo;
	private Timestamp regdate;
	private String title;

	public ItemWarn() {
		// TODO Auto-generated constructor stub
	}

	public ItemWarn(int warnNo, int itemNo) {
		super();
		this.warnNo = warnNo;
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

	public int getWarnNo() {
		return warnNo;
	}

	public void setWarnNo(int warnNo) {
		this.warnNo = warnNo;
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

}// ItemWarn end
