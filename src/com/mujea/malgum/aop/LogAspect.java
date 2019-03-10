package com.mujea.malgum.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAspect {
	
	/*
	 * 스프링에서는 AOP를 실제 어떻게 적용시키나?
	 * 
	 * - 프록시 객체를 만듦
	 * - IndexController 클래스를 만들었지만 실제로는
	 * - IndexController 객체가 아니라
	 * - IndexController의 프록시 객체가 작동됨
	 *   (리플렉션을 이용해서 실시간으로 새로운 객체 생성)
	 */
	
	/*
	before : 메서드 실행전
	after return : 메서드 리턴후
	around : 메서드 전후(전처리, 후처리 모두 가능)
	throws : 에러 발생시
	*/
	
//	@Before(value="bean(*Service)||bean(*DAO)||bean(*Controller)")
//	public void asdfasfaa() {
//		System.out.println("aop의 before");
//	}
	
	
	@Around(value="bean(*Service)||bean(*DAO)||bean(*Controller)")
	 //전후 //컨트롤로 패키지의 하위에  별은 클래스 명 메스명 인자
	 public Object beforeLogging(ProceedingJoinPoint  pjp) throws Throwable {
		 //joinPoint가 해당 메서드
		
		 Signature signature=  pjp.getSignature();
		// System.out.println("aop(메서드 수행전)");
		 
		 //System.out.println("이름 : " + signature.getName());
		 //System.out.println("타입 : " + signature.getDeclaringTypeName());
		 
		 //여기를 기준으로 위가 전처리
		 Object result = pjp.proceed();
		 //아래는 후처리
		 
		 //System.out.println("aop(메서드 수행후)");
		 
		 return result;
	 }

}//LogAspect end



