package com.mujea.malgum.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;

public class User {

	public static final String LOGIN = "loginUser";

	private int no, oneWorry, tweWorry, threeWorry ;
	private String id, pwd, name, gender, skin, type, company, brand, tel, link, img, buisnessImg, buisnessNum;
	private Date birth;
	private Timestamp regdate;

	// 나리 추가 시작//
	private int probNo, userNo;
	private String year, month, date;
	private List<ProblemType> types;

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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

//	public User(String id, String pwd, String name, String gender, Date birth, String skin, String img) {
//	this.id = id;
//	this.pwd = pwd;
//	this.name = name;
//	this.gender = gender;
//	this.birth = birth;
//	this.skin = skin;
//	this.img = img;
//}
//
//public User(String id, String pwd) {
//	this.id = id;
//	this.pwd = pwd;
//}

	// 나리 추가 끝//

	public List<ProblemType> getTypes() {
		return types;
	}

	public void setTypes(List<ProblemType> types) {
		this.types = types;
		for (ProblemType p : types) {
			int num = p.getProbNo();
			if (num == 1) {
				this.oneWorry = 1;
			} else if (num == 2) {
				this.tweWorry = 2;
			} else if (num == 3) {
				this.threeWorry = 3;
			}
			
		} // for end

	}// setTypes end

	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getBuisnessImg() {
		return buisnessImg;
	}

	public void setBuisnessImg(String buisnessImg) {
		this.buisnessImg = buisnessImg;
	}

	public String getBuisnessNum() {
		return buisnessNum;
	}

	public void setBuisnessNum(String buisnessNum) {
		this.buisnessNum = buisnessNum;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
		/*
		 * SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd"); String userBrith =
		 * sm.format(birth); String[] birthArry= userBrith.split("-"); this.year =
		 * birthArry[0]; this.month = birthArry[1]; this.date = birthArry[2];
		 */
	}

	public int updateBirthYear() {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String userBrith = sm.format(this.birth);
		String[] birthArry = userBrith.split("-");
		return Integer.parseInt(birthArry[0]);
	}

	public int updateBirthMonth() {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String userBrith = sm.format(this.birth);
		String[] birthArry = userBrith.split("-");
		return Integer.parseInt(birthArry[1]);
	}

	public int updateBirthDate() {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String userBrith = sm.format(this.birth);
		String[] birthArry = userBrith.split("-");
		return Integer.parseInt(birthArry[2]);
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getOneWorry() {
		return oneWorry;
	}

	public void setOneWorry(int oneWorry) {
		this.oneWorry = oneWorry;
	}

	public int getTweWorry() {
		return tweWorry;
	}

	public void setTweWorry(int tweWorry) {
		this.tweWorry = tweWorry;
	}

	public int getThreeWorry() {
		return threeWorry;
	}

	public void setThreeWorry(int threeWorry) {
		this.threeWorry = threeWorry;
	}

}// User end
