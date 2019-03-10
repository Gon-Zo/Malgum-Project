package com.mujea.malgum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mujea.malgum.service.UserService;
import com.mujea.malgum.vo.User;

@Controller
public class UserController {
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}//setUserService() end

	//나리 추가!
	@RequestMapping(value= {"/","/index"}, method=RequestMethod.GET)
	public String indexT() {
		
		return "index";
		
	}//index() end
	
	//회원가입 시 아이디 중복 체크 ajax
	@RequestMapping(value="/ajax/user/id", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkId(String id) {
		
		return "{\"result\":"+ userService.checkId(id)+"}";
		
	}
	
	//회원가입 선택
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinChoice() {
		
		return "join_choice";
	}

	//일반 회원 회원가입 페이지 보여주기
	@RequestMapping(value="/user/join", method=RequestMethod.GET)
	public String joinForm() {
		
		return "user_join";	
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.GET)
	public String updateForm(Model model) {
		model.addAttribute("user", "test");
		return "user_join";
	}
	
	// 업데이트 부분
	@RequestMapping(value="/user/join", method=RequestMethod.PUT)
	public String userUpdate(@RequestHeader String referer , User user , int[] typies ,
			HttpSession session) {
		
		userService.updateUser(user);
		
		session.setAttribute(User.LOGIN, userService.login(user));
		
		return "redirect:"+referer;
	}
	
	//일반 유저 회원가입 시 db에 넘어가는 것들 처리
	@RequestMapping(value="/user/join", method=RequestMethod.POST)
	public String join(User user, int[] typies) {
		
		userService.insert(user, typies);
		
		return "redirect:/index";
		
	}

	// /login 이라는 경로 입력 시 login.jsp로 간다!
	@RequestMapping(value="/login", method=RequestMethod.GET )
	public String loginForm(@RequestHeader String referer , Model model) {
		model.addAttribute("referer",referer);
		return "login";
	}
	
	//로그인하면 session에 처리!
	@RequestMapping(value="/session", method=RequestMethod.POST)
	public String login(User user, HttpSession session , String referer) {
		System.out.println(user.getId());
	    //세션에 User vo의 LOGIN을 다음과 같은 값을 넣어준다.//user서비스로 가면
		
		// 메서드의 뒷주소
		//http://localhost/login
		//@RequestHeader String referer
		//System.out.println("referer :: "+ referer);

			session.setAttribute(User.LOGIN, userService.login(user));
	
		//이전에 보던 그 페이지로
		return "redirect:"+referer;
		
	}//login() end
	
	//로그아웃
	@RequestMapping(value="/session", method=RequestMethod.DELETE)
	public String logout(HttpSession session, String referer) {
		
		session.invalidate();
		System.out.println("로그아웃 성공");
		return "redirect:/index";
		
	}//logout() end
	
	//마이페이지 아직
	@RequestMapping(value="/mypage/{id}", method=RequestMethod.GET)
	public String userPage(@PathVariable String id, Model model, User user) {
		
		model.addAttribute("proTypes", userService.getProbTypes(id));
		
		return "mypage";
	}
	
	//서원
	
	@RequestMapping(value="/company/join",method=RequestMethod.GET)
	public String companyJoin() {
		
		return "corporation_join";
	}
	
	@RequestMapping(value="/ajax/user/brand",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkBrand(String brand) {
		return "{\"result\":"+ userService.checkBrand(brand)+"}";
	}
	
	
	@RequestMapping(value="/ajax/user/tel",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkTel(String tel) {
		return "{\"result\":"+ userService.checkTel(tel)+"}";
	}
	
	@RequestMapping(value="/ajax/user/link",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkLink(String link) {
		return "{\"result\":"+ userService.checkLink(link)+"}";
	}
	
	@RequestMapping(value="/ajax/user/businessnum",
			method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	@ResponseBody
	public String checkBusinessNum(String businessNum) {
		return "{\"result\":"+ userService.checkBusinessNum(businessNum)+"}";
	}
	
	@RequestMapping(value="/company/join",method=RequestMethod.POST)
	public String companyForm(User user) {
		
		userService.companyWrite(user);
		
		return "redirect:/index";
	}
	
	
	@RequestMapping(value="/search/items",method=RequestMethod.GET)
	public String searchMain() {

		return "search_product";
	}
	
	
	@RequestMapping(value = "/search/reviews", method = RequestMethod.GET)
	public String searchReviews() {
		return "search_review";
	}

	
}//UserController end
