package com.mujea.malgum.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class Event {

	private int no, userNo, eventNo;
	private long dDay;
	private String title, email, img, brand, emailMain, emailSub, startDate1, endDate1;
	private Date startDate, endDate;
	private Timestamp regdate;
	private List<EventImg> eventImgs;

	public Event() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * Calendar calendar = Calendar.getInstance();
	 * 
	 * int year = calendar.get(Calendar.YEAR); int month =
	 * calendar.get(Calendar.MONTH); int day = calendar.get(Calendar.DAY_OF_MONTH);
	 * 
	 */

	public void setEventImgs(List<EventImg> eventImgs) {
		this.eventImgs = eventImgs;
	}

	public List<EventImg> getEventImgs() {
		return eventImgs;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int test() {
		SimpleDateFormat sm = new SimpleDateFormat("YYYYMMDD");

		java.util.Date date = new java.util.Date();
		String nowDay = sm.format(date);
		String endDay = sm.format(this.endDate);
		int dDay = Integer.parseInt(endDay) - Integer.parseInt(nowDay);
		// System.out.println(dDay);

		return dDay;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public long getdDay() {
		return dDay;
	}

	public void setdDay(long dDay) {
		this.dDay = dDay;
	}

	public String getEmailMain() {
		return emailMain;
	}

	public void setEmailMain(String emailMain) {
		this.emailMain = emailMain;
	}

	public String getEmailSub() {
		return emailSub;
	}

	public void setEmailSub(String emailSub) {
		this.emailSub = emailSub;
	}

	public String getStartDate1() {
		return startDate1;
	}

	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}

	public String getEndDate1() {
		return endDate1;
	}

	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}

	public void getFormatEndDate() {

		// 3. sql.Date를 이용하여 얻어온 Date
		String nowDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		Date sqlDate = Date.valueOf(nowDate);
		long diff = endDate.getTime() - sqlDate.getTime();
		this.dDay = diff / (24 * 60 * 60 * 1000);

	}

}// Event end
