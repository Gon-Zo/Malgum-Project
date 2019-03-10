package com.mujea.malgum.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//인터셉터를 만들려면 
//HandlerInterceptor 인터페이스를 구현하면 됩니다.
//혹은 HandlerInterceptorAdapter 클래스를 상속하거나

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	//prehandle(전처리)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//로그인이 되어있지 않으면
		if(session.getAttribute("loginUser")==null) {
			
			response.sendRedirect("/index");
			
			//Controller의 method가 호출되지 않음
			return false;
			
		}//if end
		
		return true;
		
	}
	
//	//posthandle(후처리)
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//	
//		System.out.println("컨트롤러 작동후처리");
//		
//	}

}//LoginCheckInterceptor end








