package com.mujea.malgum.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Review {
	private int no, itemNo, score, userNo;
	private String title, gift, type, content;
	private Timestamp regdate;
	private String id, img;

	/* 기본 get set */
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int socre) {
		this.score = socre;
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

	public String getGift() {
		return gift;
	}

	public void setGift(String gift) {
		this.gift = gift;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	// 추가
	private int likeNum, replyNum, second, probNo, imgCount;
	private String userGender, name, userSkin, itemTitle, itemImg, brand, volume, age, itemGender, itemSkin, first,
			reviewContent, userImg, txt, ckeckLike;
	private Date birth;

	private List<ReviewContent> list;

	public List<ReviewContent> getList() {
		return list;
	}

	public void setList(List<ReviewContent> list) {
		this.list = list;
	}

	public String getCkeckLike() {
		return ckeckLike;
	}

	public void setCkeckLike(String ckeckLike) {
		this.ckeckLike = ckeckLike;
	}

	public int getImgCount() {
		return imgCount;
	}

	public void setImgCount(int imgCount) {
		this.imgCount = imgCount;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getSecond() {
		return second;
	}

	public void setSecond(int second) {
		this.second = second;
	}

	public int getProbNo() {
		return probNo;
	}

	public void setProbNo(int probNo) {
		this.probNo = probNo;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserSkin() {
		return userSkin;
	}

	public void setUserSkin(String userSkin) {
		this.userSkin = userSkin;
	}

	public String getItemTitle() {
		return itemTitle;
	}

	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getItemGender() {
		return itemGender;
	}

	public void setItemGender(String itemGender) {
		this.itemGender = itemGender;
	}

	public String getItemSkin() {
		return itemSkin;
	}

	public void setItemSkin(String itemSkin) {
		this.itemSkin = itemSkin;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
}