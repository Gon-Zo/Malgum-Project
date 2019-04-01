package com.mujea.malgum.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAspect {
	
	@Around(value="bean(*Service)||bean(*DAO)||bean(*Controller)")
	 public Object beforeLogging(ProceedingJoinPoint  pjp) throws Throwable {
		 Signature signature=  pjp.getSignature();
		 Object result = pjp.proceed();
		 
		 return result;
	 }

}//LogAspect end



