package com.mujea.malgum.vo;

import java.sql.Timestamp;

public class Warn {

	private int no;
	private String title, content;
	private Timestamp regdate;
	
	public Warn() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean equals(Object obj) {
	//System.out.println("여기 호출!!!");
		if(obj instanceof ItemWarn) {
			ItemWarn it = (ItemWarn)obj;
			return it.getTitle().equals(this.getTitle());
		}
		return false; 
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Warn end
