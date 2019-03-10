package com.mujea.malgum.vo;

public class FilterVO {

	private int start, end, listNo, userNo, click;
	private String order, type, second, skin, age, problem, gift, gender, title;

	public FilterVO() {
		// TODO Auto-generated constructor stub
	}

	public FilterVO(int page, int numPage) {
		end = page * numPage;
		start = end - (numPage - 1);
	}

	public FilterVO(String title, int page, int numPage, String order) {
		end = page * numPage;
		start = end - (numPage - 1);
		this.title = "%" + title + "%";
		if (order.equals("new")) {
			this.order = "i.regdate";
		} else {
			this.order = "g.AVGscore";
		}
	}

	public FilterVO(int page, String type, int numPage, String order, String title) {
		end = page * numPage;
		start = end - (numPage - 1);
		this.title = "%" + title + "%";
		if (type.equals("A")) {
			this.type = null;
		} else {
			this.type = type;
		}
		if (order.equals("new")) {
			this.order = "r.regdate";
		} else if (order.equals("avg")) {
			this.order = "r.score";
		} else {
			this.order = "likeNum";
		}
	}

	public FilterVO(int page, int numPage, String order, String type, int listNo, String second, String skin,
			String age, String problem, String gift, int userNo, int click) {

		end = page * numPage;
		start = end - (numPage - 1);
		this.order = order;
		this.type = type;
		this.listNo = listNo;
		this.click = click;
		this.userNo = userNo;

		if (second.length() != 0) {
			String[] oneArr = second.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.second = test1;
		} else {
			this.second = "'1','2','3','4','5','6','7','8','9','10'";
		}
		if (skin.length() != 0) {
			String[] oneArr = skin.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.skin = test1;
		} else {
			// skin="'D','N','O','C','E'";
			this.skin = null;
		}
		if (problem.length() != 0) {
			String[] oneArr = problem.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.problem = test1;
		} else {
			// problem="'1','2','3'";
			this.problem = null;
		}
		if (age.length() != 0) {
			String[] oneArr = age.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.age = test1;
		} else {
			// age="'E','K','T','A','M'";
			this.age = null;
		}
		if (gift.length() != 0) {
			String[] oneArr = gift.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.gift = test1;
		}
		if (type == "") {
			this.type = null;
		}

	}

	public FilterVO(int page, int numPage, String order, String second, String skin, String age, String problem,
			String gender) {

		end = page * numPage;
		start = end - (numPage - 1);
		this.order = order;

		if (second.length() != 0) {
			String[] oneArr = second.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.second = test1;
		} else {
			this.second = "'1','2','3','4','5','6','7','8','9','10'";
		}
		if (skin.length() != 0) {
			String[] oneArr = skin.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.skin = test1;
		} else {
			// skin="'D','N','O','C','E'";
			this.skin = null;
		}
		if (problem.length() != 0) {
			String[] oneArr = problem.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.problem = test1;
		} else {
			// problem="'1','2','3'";
			this.problem = null;
		}
		if (age.length() != 0) {
			String[] oneArr = age.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.age = test1;
		} else {
			// age="'E','K','T','A','M'";
			this.age = null;
		}
		if (gender.length() != 0) {
			String[] oneArr = gender.split("-");
			String test1 = "";
			for (int i = 0; i < oneArr.length; i++) {
				test1 += "'" + oneArr[i] + "'";
				if (i != oneArr.length - 1) {
					test1 += ",";
				}
			}
			this.gender = test1;
		} else {
			this.gender = null;
		}

		System.out.println("this.gender::" + this.gender);
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public String getSecond() {
		return second;
	}

	public void setSecond(String second) {
		this.second = second;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getGift() {
		return gift;
	}

	public void setGift(String gift) {
		this.gift = gift;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	/**/
	public String getOrder() {
		return order;
	}

	public int getListNo() {
		return listNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	/**/

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
